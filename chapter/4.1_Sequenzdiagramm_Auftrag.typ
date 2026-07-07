= Sequenzdiagramm

Im vorliegenden Kapitel wird das Verhalten der Verwaltungssoftware anhand des Szenarios "Auftrag anlegen und Auftrag löschen" -- fachlich konsequent umgesetzt als "Auftrag anlegen und archivieren" -- als UML-Sequenzdiagramm modelliert. Die Aufgabenstellung nennt den Vorgang "Auftrag löschen"; da ein physisches Entfernen jedoch mit der im Lastenheft (LL 20) geforderten zehnjährigen Aufbewahrungspflicht unvereinbar ist, wird "Löschen" durchgängig als logisches Löschen (Archivierung) umgesetzt. Diese Übersetzung wird im gesamten Kapitel, in den Untersequenzdiagrammen sowie im Pseudocode einheitlich verwendet; die abweichende Bezeichnung der Modell-Dateien (etwa `SD_Unterprogramm_AuftragLoeschen`) ist dabei aus historischen Gründen erhalten geblieben und mit "Auftrag archivieren" inhaltlich deckungsgleich zu lesen. Ergänzend zur strukturellen Sicht des Analyse-Klassendiagramms (siehe @fig-analyse-klassendiagramm) wird damit der dynamische Ablauf zwischen den beteiligten Lebenslinien sichtbar gemacht. Die Anlage eines Arbeitsauftrags wird im Hauptdiagramm ausführlich dargestellt; die Archivierung ist als eigenständiges Unterprogramm ausgelagert und wird im Anschluss modelliert. Auf diese Weise bleibt das Hauptdiagramm übersichtlich, während die vollständige Behandlung des Archivierungsvorgangs im dedizierten Untersequenzdiagramm erfolgt. Im Anschluss an die Diagrammdarstellung folgt eine ausführliche Beschreibung der einzelnen Bildbereiche sowie eine ergänzende Modellierung als Pseudocode.

Aus Gründen der Übersichtlichkeit werden in diesem Diagramm folgende Vereinfachungen getroffen, die sämtlich konsistent zur Aufgabenstellung und zu den getroffenen Annahmen der vorherigen Kapitel sind:
- Es wird kein Anmelde- oder Authentifizierungsvorgang modelliert, da Logins gemäß Aufgabenvereinfachung nicht Bestandteil dieser Arbeit sind.
- Datenbankfehler, Verbindungsausfälle und vergleichbare technische Ausnahmen werden nicht abgebildet, da sie auf Analyseebene den Blick auf die fachliche Logik verstellen würden.
- Nebenläufige Vorgänge oder parallele Bearbeitungen durch mehrere Akteure werden nicht betrachtet; das Szenario verläuft strikt sequentiell.
- Bestätigungs- und Hinweisdialoge der grafischen Oberfläche werden nur dort dargestellt, wo sie für das Verständnis des Ablaufs relevant sind.
- Zugriffe auf die zentrale Datenbasis werden lediglich exemplarisch modelliert, nicht für jede Lese- und Schreiboperation einzeln.
- Der Kostenvoranschlag wird gemäß @fig-analyse-klassendiagramm aus dem externen Finanzbuchhaltungssystem lesend übernommen. Da das Diagramm von einer leeren Datenbasis ausgeht, wird der externe lesende Zugriff hier nicht modelliert, jedoch in der textuellen Beschreibung berücksichtigt.
- Im Sinne der gesetzlichen Aufbewahrungspflicht (LL 20 aus dem Lastenheftbereich "Produktleistungen") wird ein Auftrag niemals physisch aus der Datenbasis entfernt, sondern durch Setzen des Statuswerts `ARCHIVIERT` logisch gelöscht. Die Lebenslinie des Arbeitsauftrags im Diagramm bleibt daher bestehen; das Diagramm modelliert das fachliche "Löschen" konsequent als Archivierungsvorgang.

== Szenariobetrachtung: Auftrag anlegen und archivieren <chapter-Sequenzdiagramm-Szenariobetrachtung>

Das im Folgenden dargestellte Sequenzdiagramm modelliert das Anlegen eines Arbeitsauftrags aus Sicht des Akteurs `Bau-/Projektleiter`. Ausgangspunkt ist eine vollständig leere Datenbasis. Sämtliche im Verlauf des Szenarios benötigten Domänenobjekte werden erst durch das Szenario selbst angelegt; ein Vorhandensein von Mitarbeitern, Projekten oder Adressen wird nicht vorausgesetzt. Diese Vorgehensweise entspricht der Annahme der Aufgabenstellung. Der zeitlich versetzt stattfindende Archivierungsvorgang für einen bestehenden Auftrag ist im Hauptdiagramm bewusst nicht mehr enthalten, sondern in das in @chapter-sd-loeschen ausgeführte Untersequenzdiagramm ausgelagert; dies hält das Hauptdiagramm fokussiert und vermeidet die im Analyse-Sequenzdiagramm sonst unvermeidbare visuelle Überfrachtung.

Der Anlegevorgang verläuft entlang einer festen Schrittfolge: Zunächst wird ein übergeordnetes `Projekt` mit zugehörigem Einsatzort (`Adresse`) angelegt. Anschließend werden die Pflichtfelder des `Arbeitsauftrags` erfasst (Auftragsnummer, Auftragsbezeichnung, zugehöriges `Dokument` mit dem Bauplan, Start-/Endtermin, Kostenvoranschlag), wobei der Auftrag dem Projekt zugeordnet und mit einem eigenen Einsatzort versehen wird. Es folgt die Anlage des `Haupttermins` (Start-/Endtermin) sowie optional eines `Zwischentermins`. Im Anschluss werden beteiligte `Mitarbeiter` ergänzt -- entweder durch Auswahl aus der bestehenden Datenbasis oder durch Neuanlage. Optional können `Unterauftrag`-Objekte ergänzt werden, denen jeweils verpflichtend ein `Unterauftragnehmer` zugeordnet wird (Auswahl aus dem Bestand oder Neuanlage). Bevor die neu erzeugten Objekte in die zentrale Datenbasis übernommen werden, wird gemäß LF 100 die Duplikatsprüfung durchgeführt; bei erfolgreicher Prüfung erhält der Auftrag den initialen Status `OFFEN` und wird persistiert. Die im Diagramm sichtbaren `new()`-Aufrufe erzeugen zunächst rein transiente Objekte in der Steuerlogik der `:UI Bauverwaltung`; erst mit der Nachricht 9.5 ("Arbeitsauftrag persistieren") werden diese Objekte gemeinsam als konsistenter Gesamtdatensatz in die Datenbasis übertragen. Diese modellierungstechnische Vereinfachung wahrt die Konsistenz mit LF 100 (Prüfung vor der Aufnahme neuer Datensätze), ohne die Lebenslinien für jedes einzelne Attribut zu vervielfachen.

Sollte im Verlauf der Duplikatsprüfung ein Treffer entdeckt werden, greift die für den Administrator im Lastenheft (LF 100) vorgesehene Sonderregelung: Der Bau-/Projektleiter kann den Vorgang abbrechen oder korrigieren; ein angemeldeter Administrator kann die Warnung darüber hinaus explizit überschreiben und den Datensatz dennoch anlegen. Diese Sonderberechtigung wird im Diagramm durch die zugehörige Notiz am `alt`-Fragment kenntlich gemacht und im Pseudocode über einen zusätzlichen Fallzweig abgebildet.

Der spätere Archivierungsvorgang setzt gemäß der gesetzlichen Aufbewahrungspflicht (LL 20) den Status des Auftrags auf `ARCHIVIERT`; der Datensatz bleibt dabei für die vom Lastenheft geforderten zehn Jahre online lesbar. Vor der Statusänderung prüft das System, ob aktive `Buchung`-Objekte für den Arbeitsauftrag bestehen. Sofern dies der Fall ist, werden diese durch das Unterprogramm "Status setzen" auf den Wert `STORNIERT` gesetzt. Die vollständige Abfolge dieses Vorgangs ist in @chapter-sd-loeschen dokumentiert.

Optionale und wiederholbare Bestandteile des Szenarios sind in der Diagrammdarstellung explizit als solche gekennzeichnet: Die Erfassung beteiligter Personen sowie das Ergänzen von Unteraufträgen werden mittels `loop`-Fragmenten dargestellt, Zwischentermine und Unteraufträge mittels `opt`-Fragmenten. Die wiederkehrende Anlage einzelner Objekte ist als `ref`-Fragment in das Unterprogramm "Objekt anlegen" ausgelagert.

=== Notationserklärung und Farbkonvention

Zur besseren Lesbarkeit des Diagramms wurden die Referenz-Fragmente (`ref`) farblich nach Aufgabenbereich gruppiert. Diese Konvention wird im gesamten Sequenzdiagramm-Kapitel einheitlich verwendet:
- *Lachsrosa:* Referenzen auf das Unterprogramm "Objekt anlegen", welches die Instanziierung einer neuen Domänenobjekt-Lebenslinie kapselt. Es wird im Hauptdiagramm mehrfach aufgerufen und ist daher zur visuellen Wiedererkennung farblich abgesetzt.
- *Hellblau:* Referenzen auf prüfende Operationen, hier insbesondere die "Duplikatsprüfung" gemäß LF 100. Diese Operationen verändern keinen Zustand, sondern werten lediglich den Datenbestand aus.
- *Helles Lila:* Referenzen auf das Unterprogramm "Status setzen", welches den Wechsel des Status-Attributs einer Lebenslinie modelliert.

*Hinweis zum Zugriff auf die Datenbasis:* Die im Diagramm eingezeichnete Lebenslinie `:Datenbasis` wird im Entwurf durch das Singleton-Muster realisiert; jeder tatsächliche Zugriff geschieht folglich über die statische Operation `Datenbasis.getInstance()`. Auf Analyseebene wird dieser Zugriff bewusst abstrahiert dargestellt, um die Lesbarkeit der Nachrichtenfolge nicht durch technische Details zu belasten. Dieselbe Konvention gilt analog für die Swimlane `:Datenbasis` im Aktivitätsdiagramm.

Die Erzeugung neuer Objekte wird gemäß Vorlesung durch eine `new()`-Nachricht auf das Objektsymbol dargestellt; die zugehörige Lebenslinie beginnt konzeptuell erst an dieser Stelle. Aus Gründen der Diagramm-Werkzeugkonvention werden die Objektköpfe bereits am oberen Bildrand angezeigt; ihre Aktivierung durch den `new()`-Aufruf markiert dennoch den tatsächlichen Beginn der Lebenslinie. Rückkehrnachrichten werden als gestrichelte Pfeile dargestellt und ebenfalls dezimal nummeriert. Da es sich um ein Analyse-Sequenzdiagramm handelt, sind in Anlehnung an die Vorlesungsregel (Folie 19) auch sprechende Prosa-Bezeichnungen statt formaler Methodensignaturen zugelassen. Ein physisches Löschen von Lebenslinien (Kreuz `X` am unteren Ende) kommt im Hauptdiagramm nicht vor: Alle im Anlegevorgang erzeugten Objekte werden zusammen mit dem Auftrag persistiert und bleiben gemäß LL 20 dauerhaft in der Datenbasis erhalten.

#figure(image("../assets/Sequenzdiagramm_Auftrag.png", width: 100%), caption: [Sequenzdiagramm "Auftrag anlegen"]) <fig:sd_auftrag>

== Diagrammbetrachtung: Auftrag anlegen

Das in @fig:sd_auftrag dargestellte Sequenzdiagramm beschreibt den Anlegevorgang eines Arbeitsauftrags von der ersten Interaktion bis zur erfolgreichen Persistierung. Der zeitlich versetzt stattfindende Archivierungsvorgang ist im Untersequenzdiagramm @fig:sd_auftrag_loeschen ausführlich dokumentiert. Wie in der Einleitung zu diesem Kapitel ausgeführt, wird auf die Modellierung von Anmeldevorgängen, Datenbankfehlern und parallelen Abläufen verzichtet, um die fachliche Verständlichkeit nicht durch technische Detailtreue zu beeinträchtigen. Die folgenden Absätze beschreiben die einzelnen Bildbereiche von oben nach unten.

=== Initiale Interaktion und Projektanlage

Den Einstieg in das Szenario bildet das Öffnen der Auftragsverwaltung durch den `Bau-/Projektleiter` (Nachricht 1). Die UI-Lebenslinie `:UI Bauverwaltung` lädt zunächst die bestehende Auftragsliste aus der `:Datenbasis` und übergibt diese -- gemäß Ausgangsannahme einer leeren Datenbasis als leere Treffermenge -- zur Anzeige (Nachrichten 1.1 -- 1.3). Mit Nachricht 2 wählt der Bau-/Projektleiter die Funktion "Neuen Auftrag anlegen" und erhält die zugehörige Eingabemaske (2.1). Da ein Arbeitsauftrag laut Klassendiagramm zwingend einem `Projekt` zugeordnet sein muss, wird im Folgeschritt zunächst ein neues Projekt angelegt (Nachricht 3). Die eigentliche Instanziierung erfolgt durch das per `ref` ausgelagerte Unterprogramm "Objekt anlegen :Projekt", welches eine Projektreferenz an die UI zurückgibt.

=== Adressen als Einsatzort

Sowohl das `:Projekt` als auch der spätere `:Arbeitsauftrag` benötigen jeweils einen Einsatzort, der gemäß Klassendiagramm als Assoziation zur Klasse `Adresse` modelliert ist. Im Diagramm werden hierfür zwei separate `Adresse`-Instanzen angelegt (Nachrichten 3.3 -- 3.4 für den Projekt-Einsatzort sowie 5.4 -- 5.5 für den Auftrags-Einsatzort). Diese Trennung greift die Aussage des Use-Case-Diagramms auf, wonach der Einsatzort eines Arbeitsauftrags detaillierter sein kann als jener des übergeordneten Projekts. Beide Anlagevorgänge greifen erneut auf das Unterprogramm "Objekt anlegen" zurück, womit die Wiederverwendbarkeit des Unterprogramms an dieser Stelle erstmals deutlich wird.

=== Arbeitsauftrag mit Attributen und Terminen

Mit Nachricht 4 erfasst der Bau-/Projektleiter die Pflichtfelder des Arbeitsauftrags. Die Eingabe ist als `loop`-Fragment modelliert ("Solange Pflichtfelder unvollständig"), womit das Verhalten typischer Eingabemasken abgebildet wird, die Eingaben validieren und bei Lücken erneut zur Korrektur auffordern. Die anschließende Instanziierung des `:Arbeitsauftrag` (Nachrichten 5 -- 5.1) erfolgt erneut über das Unterprogramm "Objekt anlegen". Nach Zuordnung des Projekts (5.2) und der Attributübernahme (5.3) wird der Auftrags-Einsatzort als eigenes Adressobjekt angelegt und zugeordnet (5.4 -- 5.6).

Die Terminerfassung wird durch das Anlegen eines `:Termin`-Objekts als Haupttermin abgebildet (Nachrichten 6 -- 6.3). Die Attribute "Start-" und "Endtermin" werden gemäß Vorlesungsempfehlung in einer einzigen Nachricht zusammengefasst ("Attribute eintragen"). Die optionale Anlage eines Zwischentermins ist als `opt`-Fragment modelliert (6.4 -- 6.6) und referenziert ebenfalls das Unterprogramm "Objekt anlegen".

=== Beteiligte Personen

Die Erfassung der beteiligten Personen erfolgt innerhalb eines `loop`-Fragments ("Solange weitere beteiligte Personen ergänzt werden"), das die im Klassendiagramm festgelegte Multiplizität von 1..\* widerspiegelt. Innerhalb des Loops unterscheidet ein `alt`-Fragment zwischen dem Fall, dass ein Mitarbeiter bereits in der Datenbasis vorhanden ist (Nachrichten 7 -- 7.3) und dem Fall einer Neuanlage (7.4 -- 7.7). Im zweiten Pfad wird erneut das Unterprogramm "Objekt anlegen" referenziert, womit deutlich wird, dass auch bisher nicht im System geführte Mitarbeiter im Rahmen des Auftragsanlegens neu erfasst werden können.

=== Optionale Unteraufträge mit verpflichtender Zuordnung eines Unterauftragnehmers

Die Erfassung von Unteraufträgen ist insgesamt als `opt`-Fragment dargestellt, da gemäß Klassendiagramm die Multiplizität der Komposition zwischen `Arbeitsauftrag` und `Unterauftrag` mit 0..\* angegeben ist. Innerhalb dieses Fragments erlaubt ein verschachtelter `loop` das mehrfache Anlegen von Unteraufträgen (Nachrichten 8 -- 8.3). Anders als das noch offene `opt` an der Stelle des Unterauftragnehmers zunächst suggerieren mag, ist die Zuordnung eines `Unterauftragnehmers` zu einem Unterauftrag *fachlich verpflichtend*: Ohne einen ausführenden Unterauftragnehmer wäre ein Unterauftrag im Kontext des Bauunternehmens sinnlos (vgl. den Lastenheftbereich "Produktfunktionen" zu LF 40). Das `opt`-Fragment kennzeichnet deshalb ausschließlich die technische Wahlfreiheit zwischen den zwei möglichen Zuordnungswegen -- Auswahl eines bereits vorhandenen Unterauftragnehmers aus der Datenbasis oder Neuanlage eines Unterauftragnehmers als Kontaktdatensatz. Das nachgelagerte `alt`-Fragment (8.4 -- 8.8) macht diese Unterscheidung explizit; einer der beiden Zweige wird pro Unterauftrag verpflichtend durchlaufen. Die Verschachtelung der Fragmente ist gemäß Vorlesung (Folie 45) explizit zulässig.

=== Duplikatsprüfung, Statuswechsel und Persistierung

Mit Nachricht 9 bestätigt der Bau-/Projektleiter den Speichervorgang. Vor der eigentlichen Persistierung wird das Unterprogramm "Duplikatsprüfung" referenziert (hellblauer `ref`-Block), das die im Lastenheft unter LF 100 geforderte Prüfung auf bereits existierende Auftragsdaten kapselt. Das anschließende `alt`-Fragment trennt zwischen einem gefundenen Duplikat und einem gültigen Datensatz. Im Duplikatfall erhält der Benutzer eine Warnmeldung; die beigefügte Notiz am Fragment weist auf zwei zulässige Reaktionen hin: der Bau-/Projektleiter kann seine Eingaben korrigieren oder den Vorgang abbrechen; ein angemeldeter Administrator kann die Warnung darüber hinaus explizit überschreiben (LF 100). Diese Sonderberechtigung wird als dritter Fallzweig auch im Pseudocode explizit modelliert. Im gültigen Fall wird der Status des Auftrags durch Aufruf des Unterprogramms "Status setzen" (lila `ref`-Block) auf `OFFEN` gesetzt und der gemeinsam mit allen zugeordneten Objekten aufgebaute Datensatz in die Datenbasis persistiert (9.4 -- 9.7).

Wichtig für das Verständnis des Prüfzeitpunkts ist die Tatsache, dass alle bis zu diesem Punkt erzeugten Domänenobjekte (`Projekt`, `Adresse`, `Arbeitsauftrag`, `Termin`, `Mitarbeiter`, `Unterauftrag`, `Unterauftragnehmer`) zunächst rein in der Steuerlogik der `:UI Bauverwaltung` bestehen und noch nicht in der zentralen Datenbasis abgelegt sind. Die Duplikatsprüfung greift deshalb LF 100-konform vor der Aufnahme neuer Datensätze in die Datenbasis; erst der abschließende Aufruf 9.5 überträgt den vollständigen, geprüften Datensatz als konsistentes Ganzes in die Datenbasis.

=== Reflexion und ehrliche Einordnung

An mehreren Stellen des Diagramms wurde aus Gründen der Lesbarkeit auf eine vollständige Parameterauflistung in den Nachrichten verzichtet; insbesondere die zusammenfassende Nachricht "Attribute eintragen" abstrahiert von der konkreten Aufzählung sämtlicher primitiver Pflichtfelder. Diese Abstraktion ist durch die Vorlesungsempfehlung gedeckt, primitive Attribute in einer einzigen Aktion zusammenzufassen, führt jedoch dazu, dass das Diagramm allein nicht ausreicht, um sämtliche Eingaben des Benutzers nachzuvollziehen -- hierfür dient die ergänzende Diagrammbetrachtung dieses Kapitels sowie die Q&A-Analyse aus @chapter-Zielgruppen-Rollen. Eine weitere bewusste Vereinfachung ist die fehlende Modellierung des lesenden Zugriffs auf das externe Finanzbuchhaltungssystem; in einer realen Implementierung würde der Kostenvoranschlag an dieser Stelle aus dem Finanzsystem geladen, was hier jedoch die Konsistenz der Annahme einer leeren Datenbasis durchbrechen würde. Zudem sei angemerkt, dass das Hauptdiagramm bewusst auf die Modellierung des Archivierungsvorgangs verzichtet: Dieser wird eigenständig in @chapter-sd-loeschen behandelt und über den `ref`-Aufruf im Pseudocode klar an das Hauptszenario gekoppelt.

== Untersequenzdiagramme der Unterprogramme

Die drei im Hauptdiagramm (@fig:sd_auftrag) per lachsrosafarbenem, hellblauem und lila `ref`-Block referenzierten Unterprogramme sowie das Lösch-Unterprogramm werden im Folgenden als eigenständige Sequenzdiagramme ausgeführt. Diese Aufteilung macht den inneren Ablauf der Unterprogramme nachvollziehbar, ohne das Hauptdiagramm zu überfrachten.

=== Unterprogramm: Objekt anlegen <chapter-sd-objekt-anlegen>

#figure(image("../assets/SD_Unterprogramm_ObjektAnlegen.png", width: 100%), caption: [Untersequenzdiagramm: Unterprogramm OBJEKT-ANLEGEN]) <fig:sd_objekt_anlegen>

@fig:sd_objekt_anlegen zeigt das generische Unterprogramm zur Instanziierung beliebiger Domänenklassen. Es wird im Hauptdiagramm für `Projekt`, `Adresse`, `Arbeitsauftrag`, `Termin`, `Mitarbeiter`, `Unterauftrag` und `Unterauftragnehmer` aufgerufen -- sämtlich Klassen, die im Analyse-Klassendiagramm (siehe @fig-analyse-klassendiagramm) als eigenständige Entitäten modelliert sind. Die Allgemeinheit des Unterprogramms ergibt sich aus der einheitlichen Struktur aller Domänenobjekte: Jede Instanz besitzt primitive Attribute sowie ggf. Referenzen auf weitere Objekte. Letzteren Fall behandelt das Unterprogramm durch einen rekursiven Selbstaufruf, wie im `alt`-Fragment dargestellt. Damit entfällt die Notwendigkeit, für jede Domänenklasse ein eigenes Anlege-Unterprogramm zu definieren -- eine Modellierungsentscheidung, die unmittelbar dem Gedanken der LF 70 (durchsuchbare, erweiterbare Auswahllisten) entspricht: Neue Klassen lassen sich ohne Anpassung des Unterprogramms einbinden.

=== Unterprogramm: Duplikatsprüfung <chapter-sd-duplikat>

#figure(image("../assets/SD_Unterprogramm_Duplikatspruefung.png", width: 100%), caption: [Untersequenzdiagramm: Unterprogramm DUPLIKATSPRÜFUNG (LF 100)]) <fig:sd_duplikat>

Das in @fig:sd_duplikat dargestellte Unterprogramm realisiert die in LF 100 geforderte Prüfung auf bereits vorhandene Datensätze vor jeder Neuanlage. Die UI übergibt der Datenbasis die fachlichen Duplikatskriterien des anzulegenden Objekts. Diese Kriterien sind ausdrücklich nicht die automatisch vergebenen Ordnungsnummern (z.B. `Auftragsnummer`), da diese beim Neuanlegen naturgemäß noch nicht vorliegen können. Verwendet werden stattdessen die im Lastenheft LF 100 genannten fachlichen Schlüsselattribute pro Entitätsart, konkret: `Arbeitsauftrag` -> `Projektreferenz + Auftragsbezeichnung`; `Gerät` -> `Seriennummer` (oder `Bezeichnung + Kategorie`, falls Seriennummer fehlt); `Mitarbeiter` -> `Vorname + Nachname + Geburtsdatum`; `Lager` -> `Bezeichnung + Adresse`; `Geräte-Typ` -> `Bezeichnung`. Die Datenbasis liefert die Treffermenge zurück. Das anschließende `alt`-Fragment trennt zwischen einem gefundenen Duplikat -- in diesem Fall gibt das Unterprogramm einen Verweis auf den bestehenden Datensatz zurück, sodass der Aufrufer eine Warnung ausgeben kann -- und dem Regelfall ohne Treffer. Die Kapselung als eigenes Unterprogramm ermöglicht die Wiederverwendung an allen Neuanlage-Stellen des Systems, ohne den Prüfablauf redundant zu modellieren.

=== Unterprogramm: Status setzen <chapter-sd-status>

#figure(image("../assets/SD_Unterprogramm_StatusSetzen.png", width: 100%), caption: [Untersequenzdiagramm: Unterprogramm STATUS-SETZEN]) <fig:sd_status>

@fig:sd_status modelliert den Statuswechsel eines beliebigen Domänenobjekts. Das Unterprogramm wird im Hauptszenario an drei verschiedenen Stellen aufgerufen: beim initialen Speichern des `Arbeitsauftrags` (Status `OFFEN`), beim Stornieren aktiver `Buchung`-Objekte vor dem Archivierungsvorgang (Status `STORNIERT`) sowie beim Archivieren des Auftrags selbst (Status `ARCHIVIERT`). Die im Analyse-Klassendiagramm (siehe @fig-analyse-klassendiagramm) für `Arbeitsauftrag` und `Buchung` definierten Statuswerte sind damit vollständig abgedeckt. Die Validierungsprüfung im `alt`-Fragment stellt sicher, dass nur in der Klasse vorgesehene Statuswerte gesetzt werden können; ungültige Aufrufe werden zurückgewiesen, ohne die Datenbasis zu verändern.

=== Unterprogramm: Auftrag archivieren <chapter-sd-loeschen>

#figure(image("../assets/SD_Unterprogramm_AuftragLoeschen.png", width: 100%), caption: [Untersequenzdiagramm: Unterprogramm AUFTRAG-ARCHIVIEREN]) <fig:sd_auftrag_loeschen>

@fig:sd_auftrag_loeschen fasst den gesamten Archivierungsvorgang zusammen, der zeitlich versetzt zum Anlegen erfolgt und aus dem Hauptdiagramm bewusst ausgelagert wurde. Das Unterprogramm gliedert sich in drei Phasen: Zunächst werden -- sofern vorhanden -- aktive `Buchung`-Objekte über das Unterprogramm STATUS-SETZEN auf `STORNIERT` gesetzt (LF 50: Buchungsverwaltung). Anschließend wird der Auftrag selbst über STATUS-SETZEN auf `ARCHIVIERT` überführt und die Statusänderung in der Datenbasis persistiert; die per Komposition zugeordneten `Unterauftrag`- und `Termin`-Objekte bleiben zusammen mit dem Arbeitsauftrag erhalten, da eine physische Entfernung mit der im Lastenheft geforderten zehnjährigen Aufbewahrungspflicht (LL 20) unvereinbar wäre. Erst nach Ablauf dieser Frist entscheidet der Administrator getrennt, ob ein archivierter Datensatz endgültig entfernt werden darf. Diese Reihenfolge verhindert verwaiste Referenzen in der zentralen Datenbasis (LD 10) und macht zugleich sichtbar, dass "Löschen" aus fachlicher Sicht im vorliegenden System stets ein logisches Löschen im Sinne einer Archivierung ist.

== Pseudocode: Auftrag anlegen und archivieren

Der folgende Pseudocode ergänzt das Sequenzdiagramm um eine textuelle Beschreibung des Kontrollflusses. Er ist in mehrere kleinere Listings unterteilt: ein Hauptlisting für das Gesamtszenario sowie vier Listings für die im Diagramm referenzierten Unterprogramme. Als *Kontrollwörter* (BEGINN/ENDE, WENN/DANN/SONST/ENDE WENN, FALLS/IST/SONST/ENDE-FALLS, FUEHRE AUS, WIEDERHOLE/BIS, SOLANGE/ENDE SOLANGE, GEBE ... ZURUECK, EMPFANGE) werden gemäß Vorlesungskonvention Großbuchstaben ohne Umlaute verwendet. Operative Verben innerhalb einer Aktion (etwa "Setze", "Persistiere", "Lade", "Ordne ... zu") folgen dagegen der ergonomischen Konvention einer natürlichsprachigen Aktivitätsbeschreibung mit gemischter Groß-/Kleinschreibung, um die inhaltliche Aktion leicht lesbar zu halten. Diese bewusste Trennung zwischen (a) Kontrollwörtern und (b) beschreibenden Verben wurde konsequent auch in den Listings des Aktivitätsdiagramm-Kapitels beibehalten.

#figure(
  raw(
"  1 ----------------------------------------------------
  2 -        PSEUDOCODE SEQUENZDIAGRAMM                -
  3 -        AUFTRAG ANLEGEN UND ARCHIVIEREN           -
  4 ----------------------------------------------------
  5 BEGINN AUFTRAG-ANLEGEN-UND-ARCHIVIEREN
  6
  7   // Phase 1: Auftrag anlegen
  8   EMPFANGE Eingabe des Bau-/Projektleiters;
  9   FUEHRE OBJEKT-ANLEGEN mit Klasse Projekt und Projektdaten AUS ;
 10   FUEHRE OBJEKT-ANLEGEN mit Klasse Adresse als Projekt-Einsatzort AUS ;
 11
 12   SOLANGE Pflichtfelder des Arbeitsauftrags unvollstaendig:
 13     EMPFANGE Pflichtfelder (Auftragsnummer, Bezeichnung, Bauplan-Dokument,
 14             Start-/Endtermin, Kostenvoranschlag);
 15   ENDE SOLANGE
 16   FUEHRE OBJEKT-ANLEGEN mit Klasse Arbeitsauftrag und den Attributen AUS ;
 17   FUEHRE OBJEKT-ANLEGEN mit Klasse Adresse als Auftrags-Einsatzort AUS ;
 18   FUEHRE OBJEKT-ANLEGEN mit Klasse Termin als Haupttermin AUS ;
 19   WENN ein Zwischentermin gewuenscht ist;
 20   DANN
 21     FUEHRE OBJEKT-ANLEGEN mit Klasse Termin als Zwischentermin AUS ;
 22   ENDE WENN
 23
 24   WIEDERHOLE
 25     WENN Mitarbeiter bereits vorhanden;
 26     DANN
 27       EMPFANGE Auswahl aus der Mitarbeiterliste;
 28     SONST
 29       FUEHRE OBJEKT-ANLEGEN mit Klasse Mitarbeiter AUS ;
 30     ENDE WENN
 31     Fuege Mitarbeiter als beteiligte Person dem Arbeitsauftrag hinzu;
 32   BIS keine weiteren beteiligten Personen ergaenzt werden;
 33
 34   WENN Unterauftraege ergaenzt werden sollen;
 35   DANN
 36     WIEDERHOLE
 37       FUEHRE OBJEKT-ANLEGEN mit Klasse Unterauftrag AUS ;
 38       // Zuordnung des Unterauftragnehmers ist fachlich verpflichtend
 39       WENN Unterauftragnehmer bereits vorhanden;
 40       DANN
 41         EMPFANGE Auswahl des Unterauftragnehmers;
 42       SONST
 43         FUEHRE OBJEKT-ANLEGEN mit Klasse Unterauftragnehmer AUS ;
 44       ENDE WENN
 45       Ordne Unterauftragnehmer dem Unterauftrag zu;
 46     BIS keine weiteren Unterauftraege angelegt werden;
 47   ENDE WENN
 48
 49   FUEHRE DUPLIKATSPRUEFUNG mit Auftragsdaten AUS ;
 50   WENN ein Duplikat gefunden wurde;
 51   DANN
 52     WENN aktiver Benutzer ist Administrator und Override bestaetigt;
 53     DANN
 54       // LF 100: Admin darf die Duplikatswarnung ueberschreiben
 55       FUEHRE STATUS-SETZEN mit Arbeitsauftrag und Wert 'OFFEN' AUS ;
 56       Persistiere Arbeitsauftrag samt aller zugeordneten Objekte
 57                    in der Datenbasis;
 58     SONST
 59       GEBE Warnung aus und ueberlasse Korrektur/Abbruch dem Benutzer;
 60     ENDE WENN
 61   SONST
 62     FUEHRE STATUS-SETZEN mit Arbeitsauftrag und Wert 'OFFEN' AUS ;
 63     Persistiere Arbeitsauftrag samt aller zugeordneten Objekte
 64                  in der Datenbasis;
 65   ENDE WENN
 66
 67   // Phase 2: Auftrag archivieren (zeitlich versetzt, LL 20)
 68   FUEHRE AUFTRAG-ARCHIVIEREN mit dem ausgewaehlten Arbeitsauftrag AUS ;
 69
 70 ENDE AUFTRAG-ANLEGEN-UND-ARCHIVIEREN",
    lang: "text",
    block: true,
  ),
  caption: [Listing 4.1.1: Hauptszenario "Auftrag anlegen und archivieren"],
  supplement: [Listing],
) <lst:auftrag_haupt>

Das Hauptlisting verzichtet -- konsistent zum Sequenzdiagramm -- vollständig auf Datenbankzugriffe. Auf diese Weise bleiben Diagramm und Pseudocode auf derselben Abstraktionsebene, was die Konsistenz zwischen beiden Darstellungen erst gewährleistet. Lese- und Schreibvorgänge auf die zentrale Datenbasis werden ausschließlich im Sequenzdiagramm sichtbar gemacht.

#figure(
  raw(
"  1 BEGINN OBJEKT-ANLEGEN
  2   EMPFANGE Klasse und initiale Attribute;
  3   Erzeuge eine neue Instanz der angegebenen Klasse;
  4   FALLS Attribut IST
  5     einfacher Datentyp: Setze Wert direkt auf der Instanz ;
  6     Referenz auf anderes Objekt: FUEHRE OBJEKT-ANLEGEN
  7                                  fuer das referenzierte Objekt AUS ;
  8   ENDE-FALLS
  9   GEBE Referenz auf die neue Instanz zurueck;
 10 ENDE OBJEKT-ANLEGEN",
    lang: "text",
    block: true,
  ),
  caption: [Listing 4.1.2: Unterprogramm OBJEKT-ANLEGEN],
  supplement: [Listing],
) <lst:objekt_anlegen>

Das Unterprogramm OBJEKT-ANLEGEN ist bewusst rekursiv aufrufbar: Sofern ein Attribut der anzulegenden Klasse selbst eine Referenz auf ein noch nicht existierendes Objekt darstellt (beispielsweise eine `Adresse` als Einsatzort eines `Projekts`), wird OBJEKT-ANLEGEN rekursiv für das referenzierte Objekt aufgerufen. Diese Modellierung vermeidet, dass jedes konkrete Anlegen einer Domänenklasse als separates Unterprogramm dargestellt werden muss.

#figure(
  raw(
"  1 BEGINN DUPLIKATSPRUEFUNG
  2   EMPFANGE Datenobjekt mit fachlichen Duplikatskriterien gemaess LF 100;
  3   // z.B. Auftrag: Projekt + Bezeichnung; Geraet: Seriennummer;
  4   //      Mitarbeiter: Vor-/Nachname + Geburtsdatum; Lager: Name + Adresse
  5   Lade bestehende Datensaetze derselben Klasse aus der Datenbasis;
  6   WENN ein Datensatz mit uebereinstimmenden Duplikatskriterien existiert;
  7   DANN
  8     GEBE Treffer mit Verweis auf bestehenden Datensatz zurueck;
  9   SONST
 10     GEBE 'kein Duplikat' zurueck;
 11   ENDE WENN
 12 ENDE DUPLIKATSPRUEFUNG",
    lang: "text",
    block: true,
  ),
  caption: [Listing 4.1.3: Unterprogramm DUPLIKATSPRUEFUNG (LF 100)],
  supplement: [Listing],
) <lst:duplikat>

Das Unterprogramm DUPLIKATSPRUEFUNG bündelt die in LF 100 geforderte Prüfung auf bereits vorhandene Datensätze. Die Modellierung als eigenständiges Unterprogramm erlaubt es, die Prüfung an unterschiedlichsten Stellen des Systems (Auftragsanlage, Mitarbeiteranlage, Geräteanlage) ohne Wiederholung des Pseudocodes wiederzuverwenden.

#figure(
  raw(
"  1 BEGINN STATUS-SETZEN
  2   EMPFANGE Objektreferenz und neuen Statuswert;
  3   WENN der neue Statuswert gueltig ist;
  4   DANN
  5     Setze das Statusattribut auf den neuen Wert;
  6     Persistiere die Statusaenderung ueber das aufrufende Programm;
  7     GEBE 'ok' zurueck;
  8   SONST
  9     // Ungueltige Statuswerte werden zurueckgewiesen, ohne die
 10     // Datenbasis zu veraendern (konsistent zur Diagrammbeschreibung).
 11     GEBE Fehler 'ungueltiger Statuswert' zurueck;
 12   ENDE WENN
 13 ENDE STATUS-SETZEN",
    lang: "text",
    block: true,
  ),
  caption: [Listing 4.1.4: Unterprogramm STATUS-SETZEN],
  supplement: [Listing],
) <lst:status>

STATUS-SETZEN kapselt den Wechsel des Statusattributs einer Lebenslinie. Es wird im Sequenzdiagramm sowohl beim initialen Anlegen (Status `OFFEN`) als auch beim Stornieren von Buchungen (Status `STORNIERT`) und beim Archivieren des Auftrags (Status `ARCHIVIERT`) aufgerufen.

#figure(
  raw(
"  1 BEGINN AUFTRAG-ARCHIVIEREN
  2   EMPFANGE Referenz auf den zu archivierenden Arbeitsauftrag;
  3   Lade alle aktiven Buchungen fuer diesen Arbeitsauftrag;
  4   WENN aktive Buchungen vorliegen;
  5   DANN
  6     SOLANGE noch aktive Buchungen vorhanden sind:
  7       FUEHRE STATUS-SETZEN mit Buchung und Wert 'STORNIERT' AUS ;
  8     ENDE SOLANGE
  9   ENDE WENN
 10
 11   // Logisches Loeschen gemaess LL 20: kein physisches Entfernen
 12   FUEHRE STATUS-SETZEN mit Arbeitsauftrag und Wert 'ARCHIVIERT' AUS ;
 13   Persistiere die Statusaenderung in der Datenbasis;
 14   // Unterauftraege und Termine bleiben mit dem Auftrag erhalten,
 15   // da sie fuer die 10-jaehrige Aufbewahrungspflicht referenziert werden.
 16 ENDE AUFTRAG-ARCHIVIEREN",
    lang: "text",
    block: true,
  ),
  caption: [Listing 4.1.5: Unterprogramm AUFTRAG-ARCHIVIEREN],
  supplement: [Listing],
) <lst:loeschen>

Das Unterprogramm AUFTRAG-ARCHIVIEREN realisiert das im Lastenheft (LL 20) geforderte logische Löschen: Der Datensatz bleibt vollständig in der Datenbasis erhalten und wird lediglich über den neuen Status `ARCHIVIERT` von der aktiven Datenbestand-Sicht ausgenommen. Dadurch bleiben sowohl die per Komposition zugeordneten `Unterauftrag`- und `Termin`-Objekte als auch die dem Auftrag zugeordneten `Rechnung`-Referenzen für die vorgeschriebene zehnjährige Aufbewahrungsfrist zugreifbar. Ein physisches Löschen findet frühestens nach Ablauf dieser Frist durch den Administrator statt und ist bewusst nicht Teil dieses Szenarios.
