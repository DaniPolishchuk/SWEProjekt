= Sequenzdiagramm

Im vorliegenden Kapitel wird das Verhalten der Verwaltungssoftware anhand des Szenarios "Auftrag anlegen und löschen" als UML-Sequenzdiagramm modelliert. Ergänzend zur strukturellen Sicht des Analyse-Klassendiagramms (siehe @fig-analyse-klassendiagramm) wird damit der dynamische Ablauf zwischen den beteiligten Lebenslinien sichtbar gemacht. Im Anschluss an die Diagrammdarstellung folgt eine ausführliche Beschreibung der einzelnen Bildbereiche sowie eine ergänzende Modellierung als Pseudocode.

Aus Gründen der Übersichtlichkeit werden in diesem Diagramm folgende Vereinfachungen getroffen, die sämtlich konsistent zur Aufgabenstellung und zu den getroffenen Annahmen der vorherigen Kapitel sind:
- Es wird kein Anmelde- oder Authentifizierungsvorgang modelliert, da Logins gemäß Aufgabenvereinfachung nicht Bestandteil dieser Arbeit sind.
- Datenbankfehler, Verbindungsausfälle und vergleichbare technische Ausnahmen werden nicht abgebildet, da sie auf Analyseebene den Blick auf die fachliche Logik verstellen würden.
- Nebenläufige Vorgänge oder parallele Bearbeitungen durch mehrere Akteure werden nicht betrachtet; das Szenario verläuft strikt sequentiell.
- Bestätigungs- und Hinweisdialoge der grafischen Oberfläche werden nur dort dargestellt, wo sie für das Verständnis des Ablaufs relevant sind.
- Zugriffe auf die zentrale Datenbasis werden lediglich exemplarisch modelliert, nicht für jede Lese- und Schreiboperation einzeln.
- Der Kostenvoranschlag wird gemäß @fig-analyse-klassendiagramm aus dem externen Finanzbuchhaltungssystem lesend übernommen. Da das Diagramm von einer leeren Datenbasis ausgeht, wird der externe lesende Zugriff hier nicht modelliert, jedoch in der textuellen Beschreibung berücksichtigt.

== Szenariobetrachtung: Auftrag anlegen und löschen <chapter-Sequenzdiagramm-Szenariobetrachtung>

Das im Folgenden dargestellte Sequenzdiagramm modelliert das vollständige Szenario "Auftrag anlegen und löschen" aus Sicht des Akteurs `Bau-/Projektleiter`. Ausgangspunkt ist eine vollständig leere Datenbasis. Sämtliche im Verlauf des Szenarios benötigten Domänenobjekte werden erst durch das Szenario selbst angelegt; ein Vorhandensein von Mitarbeitern, Projekten oder Adressen wird nicht vorausgesetzt. Diese Vorgehensweise entspricht der Annahme der Aufgabenstellung sowie dem Vorgehen der Beispielarbeit "Handwerksbetriebe".

Der Anlegevorgang verläuft entlang einer festen Schrittfolge: Zunächst wird ein übergeordnetes `Projekt` mit zugehörigem Einsatzort (`Adresse`) angelegt. Anschließend werden die Pflichtfelder des `Arbeitsauftrags` erfasst (Auftragsnummer, Auftragsbezeichnung, Bauplan-Dateipfad, Start-/Endtermin, Kostenvoranschlag), wobei der Auftrag dem Projekt zugeordnet und mit einem eigenen Einsatzort versehen wird. Es folgt die Anlage des `Haupttermins` (Start-/Endtermin) sowie optional eines `Zwischentermins`. Im Anschluss werden beteiligte `Mitarbeiter` ergänzt -- entweder durch Auswahl aus der bestehenden Datenbasis oder durch Neuanlage. Optional können `Unterauftrag`-Objekte mit zugehörigen `Unterauftragnehmern` ergänzt werden. Vor dem Speichern wird gemäß LF 100 eine Duplikatsprüfung durchgeführt; bei erfolgreicher Prüfung erhält der Auftrag den initialen Status "Offen" und wird persistiert.

Der Löschvorgang erfolgt zeitlich versetzt und nutzt die im Klassendiagramm modellierten Kompositionen zur kaskadierenden Entfernung abhängiger Objekte. Vor der eigentlichen Löschung prüft das System, ob aktive `Buchung`-Objekte für den Arbeitsauftrag bestehen. Sofern dies der Fall ist, werden diese durch das Unterprogramm "Status setzen" auf den Wert "Storniert" gesetzt. Anschließend werden zunächst die per Komposition zugeordneten `Unterauftrag`- und `Termin`-Objekte entfernt, ehe der `Arbeitsauftrag` selbst auf den Status "Geloescht" gesetzt und aus der Datenbasis entfernt wird.

Optionale und wiederholbare Bestandteile des Szenarios sind in der Diagrammdarstellung explizit als solche gekennzeichnet: Die Erfassung beteiligter Personen sowie das Ergänzen von Unteraufträgen werden mittels `loop`-Fragmenten dargestellt, Zwischentermine und Unteraufträge sowie die Zuordnung eines `Unterauftragnehmers` mittels `opt`-Fragmenten. Die wiederkehrende Anlage einzelner Objekte ist als `ref`-Fragment in das Unterprogramm "Objekt anlegen" ausgelagert.

=== Notationserklärung und Farbkonvention

Zur besseren Lesbarkeit des Diagramms wurden die Referenz-Fragmente (`ref`) farblich nach Aufgabenbereich gruppiert. Diese Konvention orientiert sich an der Beispielarbeit "Immobilienverwaltung" und wird im gesamten Sequenzdiagramm-Kapitel einheitlich verwendet:
- *Lachsrosa:* Referenzen auf das Unterprogramm "Objekt anlegen", welches die Instanziierung einer neuen Domänenobjekt-Lebenslinie kapselt. Es wird im Hauptdiagramm mehrfach aufgerufen und ist daher zur visuellen Wiedererkennung farblich abgesetzt.
- *Hellblau:* Referenzen auf prüfende Operationen, hier insbesondere die "Duplikatsprüfung" gemäß LF 100. Diese Operationen verändern keinen Zustand, sondern werten lediglich den Datenbestand aus.
- *Helles Lila:* Referenzen auf das Unterprogramm "Status setzen", welches den Wechsel des Status-Attributs einer Lebenslinie modelliert.

Die Erzeugung neuer Objekte wird gemäß Vorlesung durch eine `new()`-Nachricht auf das Objektsymbol dargestellt; die zugehörige Lebenslinie beginnt erst an dieser Stelle. Das Löschen von Lebenslinien wird durch ein Kreuz (`X`) am Ende der Lebenslinie markiert. Rückkehrnachrichten werden als gestrichelte Pfeile dargestellt und ebenfalls dezimal nummeriert. Da es sich um ein Analyse-Sequenzdiagramm handelt, sind in Anlehnung an die Vorlesungsregel (Folie 19) auch sprechende Prosa-Bezeichnungen statt formaler Methodensignaturen zugelassen.

#figure(image("../assets/Sequenzdiagramm_Auftrag.png", height: 100%), caption: [Sequenzdiagramm "Auftrag anlegen und löschen"]) <fig:sd_auftrag>

== Diagrammbetrachtung: Auftrag anlegen und löschen

Das in @fig:sd_auftrag dargestellte Sequenzdiagramm beschreibt den vollständigen Lebenszyklus eines Arbeitsauftrags von der Anlage bis zur Löschung. Wie in der Einleitung zu diesem Kapitel ausgeführt, wird auf die Modellierung von Anmeldevorgängen, Datenbankfehlern und parallelen Abläufen verzichtet, um die fachliche Verständlichkeit nicht durch technische Detailtreue zu beeinträchtigen. Die folgenden Absätze beschreiben die einzelnen Bildbereiche von oben nach unten.

=== Initiale Interaktion und Projektanlage

Den Einstieg in das Szenario bildet das Öffnen der Auftragsverwaltung durch den `Bau-/Projektleiter` (Nachricht 1). Die UI-Lebenslinie `:UI Bauverwaltung` lädt zunächst die bestehende Auftragsliste aus der `:Datenbasis` und übergibt diese -- gemäß Ausgangsannahme einer leeren Datenbasis als leere Treffermenge -- zur Anzeige (Nachrichten 1.1 -- 1.3). Mit Nachricht 2 wählt der Bau-/Projektleiter die Funktion "Neuen Auftrag anlegen" und erhält die zugehörige Eingabemaske (2.1). Da ein Arbeitsauftrag laut Klassendiagramm zwingend einem `Projekt` zugeordnet sein muss, wird im Folgeschritt zunächst ein neues Projekt angelegt (Nachricht 3). Die eigentliche Instanziierung erfolgt durch das per `ref` ausgelagerte Unterprogramm "Objekt anlegen :Projekt", welches eine Projektreferenz an die UI zurückgibt.

=== Adressen als Einsatzort

Sowohl das `:Projekt` als auch der spätere `:Arbeitsauftrag` benötigen jeweils einen Einsatzort, der gemäß Klassendiagramm als Assoziation zur Klasse `Adresse` modelliert ist. Im Diagramm werden hierfür zwei separate `Adresse`-Instanzen angelegt (Nachrichten 3.3 -- 3.4 für den Projekt-Einsatzort sowie 5.4 -- 5.5 für den Auftrags-Einsatzort). Diese Trennung greift die Aussage des Use-Case-Diagramms auf, wonach der Einsatzort eines Arbeitsauftrags detaillierter sein kann als jener des übergeordneten Projekts. Beide Anlagevorgänge greifen erneut auf das Unterprogramm "Objekt anlegen" zurück, womit die Wiederverwendbarkeit des Unterprogramms an dieser Stelle erstmals deutlich wird.

=== Arbeitsauftrag mit Attributen und Terminen

Mit Nachricht 4 erfasst der Bau-/Projektleiter die Pflichtfelder des Arbeitsauftrags. Die Eingabe ist als `loop`-Fragment modelliert ("Solange Pflichtfelder unvollständig"), womit das Verhalten typischer Eingabemasken abgebildet wird, die Eingaben validieren und bei Lücken erneut zur Korrektur auffordern. Die anschließende Instanziierung des `:Arbeitsauftrag` (Nachrichten 5 -- 5.1) erfolgt erneut über das Unterprogramm "Objekt anlegen". Nach Zuordnung des Projekts (5.2) und der Attributübernahme (5.3) wird der Auftrags-Einsatzort als eigenes Adressobjekt angelegt und zugeordnet (5.4 -- 5.6).

Die Terminerfassung wird durch das Anlegen eines `:Termin`-Objekts als Haupttermin abgebildet (Nachrichten 6 -- 6.3). Die Attribute "Start-" und "Endtermin" werden gemäß Vorlesungsempfehlung in einer einzigen Nachricht zusammengefasst ("Attribute eintragen"). Die optionale Anlage eines Zwischentermins ist als `opt`-Fragment modelliert (6.4 -- 6.6) und referenziert ebenfalls das Unterprogramm "Objekt anlegen".

=== Beteiligte Personen

Die Erfassung der beteiligten Personen erfolgt innerhalb eines `loop`-Fragments ("Solange weitere beteiligte Personen ergänzt werden"), das die im Klassendiagramm festgelegte Multiplizität von 1..\* widerspiegelt. Innerhalb des Loops unterscheidet ein `alt`-Fragment zwischen dem Fall, dass ein Mitarbeiter bereits in der Datenbasis vorhanden ist (Nachrichten 7 -- 7.3) und dem Fall einer Neuanlage (7.4 -- 7.7). Im zweiten Pfad wird erneut das Unterprogramm "Objekt anlegen" referenziert, womit deutlich wird, dass auch bisher nicht im System geführte Mitarbeiter im Rahmen des Auftragsanlegens neu erfasst werden können.

=== Optionale Unteraufträge und Unterauftragnehmer

Die Erfassung von Unteraufträgen ist insgesamt als `opt`-Fragment dargestellt, da gemäß Klassendiagramm die Multiplizität der Komposition zwischen `Arbeitsauftrag` und `Unterauftrag` mit 0..\* angegeben ist. Innerhalb dieses Fragments erlaubt ein verschachtelter `loop` das mehrfache Anlegen von Unteraufträgen (Nachrichten 8 -- 8.3). Jeder Unterauftrag kann optional einem `Unterauftragnehmer` zugeordnet werden (verschachteltes `opt`-Fragment), wobei ein weiteres `alt`-Fragment zwischen Auswahl aus der Datenbasis und Neuanlage unterscheidet (8.4 -- 8.8). Die Verschachtelung der Fragmente ist gemäß Vorlesung (Folie 45) explizit zulässig.

=== Duplikatsprüfung, Statuswechsel und Persistierung

Mit Nachricht 9 bestätigt der Bau-/Projektleiter den Speichervorgang. Vor der eigentlichen Persistierung wird das Unterprogramm "Duplikatsprüfung" referenziert (hellblauer `ref`-Block), das die im Lastenheft unter LF 100 geforderte Prüfung auf bereits existierende Auftragsdaten kapselt. Das anschließende `alt`-Fragment trennt zwischen einem gefundenen Duplikat (Warnmeldung an den Benutzer; das beigefügte Notiz-Symbol verweist auf die Möglichkeit der Korrektur oder des Abbruchs durch den Benutzer) und einem gültigen Datensatz. Im gültigen Fall wird der Status des Auftrags durch Aufruf des Unterprogramms "Status setzen" (lila `ref`-Block) auf "Offen" gesetzt und der Auftrag in die Datenbasis persistiert (9.4 -- 9.7).

=== Löschvorgang mit Kompositionskaskade

Der Löschvorgang wird durch eine horizontale Trennlinie ("Löschvorgang") vom Anlegevorgang abgegrenzt. Nach Auswahl des zu löschenden Auftrags (Nachricht 10) prüft die UI, ob aktive Buchungen für diesen Auftrag bestehen (10.1 -- 10.2). Das `alt`-Fragment trennt zwei Pfade: Bei aktiven Buchungen werden diese in einem `loop` einzeln durch das Unterprogramm "Status setzen" auf den Wert "Storniert" gesetzt (10.4 -- 10.5); ohne aktive Buchungen wird die Löschbestätigung direkt eingeholt (10.6 -- 10.7).

Im Anschluss erfolgt die im Klassendiagramm angekündigte Kompositionskaskade: Sämtliche per Komposition zugeordneten `Unterauftrag`- und `Termin`-Objekte werden gelöscht, was im Diagramm jeweils durch ein abschließendes Kreuz (`X`) auf der entsprechenden Lebenslinie ersichtlich ist (Nachrichten 11 und 12). Der Arbeitsauftrag selbst wird zunächst durch das Unterprogramm "Status setzen" auf den Wert "Geloescht" gesetzt (Nachricht 13), die Löschung in der Datenbasis vermerkt (13.1 -- 13.2) und schließlich die Lebenslinie selbst gelöscht (13.3). Den Abschluss bildet die Bestätigung an den Bau-/Projektleiter (13.4).

=== Reflexion und ehrliche Einordnung

An mehreren Stellen des Diagramms wurde aus Gründen der Lesbarkeit auf eine vollständige Parameterauflistung in den Nachrichten verzichtet; insbesondere die zusammenfassende Nachricht "Attribute eintragen" abstrahiert von der konkreten Aufzählung sämtlicher primitiver Pflichtfelder. Diese Abstraktion ist durch die Vorlesungsempfehlung gedeckt, primitive Attribute in einer einzigen Aktion zusammenzufassen, führt jedoch dazu, dass das Diagramm allein nicht ausreicht, um sämtliche Eingaben des Benutzers nachzuvollziehen -- hierfür dient die ergänzende Diagrammbetrachtung dieses Kapitels sowie die Q&A-Analyse aus @chapter-Zielgruppen-Rollen. Eine weitere bewusste Vereinfachung ist die fehlende Modellierung des lesenden Zugriffs auf das externe Finanzbuchhaltungssystem; in einer realen Implementierung würde der Kostenvoranschlag an dieser Stelle aus dem Finanzsystem geladen, was hier jedoch die Konsistenz der Annahme einer leeren Datenbasis durchbrechen würde.

== Untersequenzdiagramme der Unterprogramme

Die drei im Hauptdiagramm (@fig:sd_auftrag) per lachsrosafarbenem, hellblauem und lila `ref`-Block referenzierten Unterprogramme sowie das Lösch-Unterprogramm werden im Folgenden als eigenständige Sequenzdiagramme ausgeführt. Diese Darstellung entspricht dem Vorgehen der Beispielarbeit "Immobilienverwaltung" und macht den inneren Ablauf der Unterprogramme nachvollziehbar, ohne das Hauptdiagramm zu überfrachten.

=== Unterprogramm: Objekt anlegen <chapter-sd-objekt-anlegen>

#figure(image("../assets/SD_Unterprogramm_ObjektAnlegen.png", width: 100%), caption: [Untersequenzdiagramm: Unterprogramm OBJEKT-ANLEGEN]) <fig:sd_objekt_anlegen>

@fig:sd_objekt_anlegen zeigt das generische Unterprogramm zur Instanziierung beliebiger Domänenklassen. Es wird im Hauptdiagramm für `Projekt`, `Adresse`, `Arbeitsauftrag`, `Termin`, `Mitarbeiter`, `Unterauftrag` und `Unterauftragnehmer` aufgerufen -- sämtlich Klassen, die im Analyse-Klassendiagramm (siehe @fig-analyse-klassendiagramm) als eigenständige Entitäten modelliert sind. Die Allgemeinheit des Unterprogramms ergibt sich aus der einheitlichen Struktur aller Domänenobjekte: Jede Instanz besitzt primitive Attribute sowie ggf. Referenzen auf weitere Objekte. Letzteren Fall behandelt das Unterprogramm durch einen rekursiven Selbstaufruf, wie im `alt`-Fragment dargestellt. Damit entfällt die Notwendigkeit, für jede Domänenklasse ein eigenes Anlege-Unterprogramm zu definieren -- eine Modellierungsentscheidung, die unmittelbar dem Gedanken der LF 70 (durchsuchbare, erweiterbare Auswahllisten) entspricht: Neue Klassen lassen sich ohne Anpassung des Unterprogramms einbinden.

=== Unterprogramm: Duplikatsprüfung <chapter-sd-duplikat>

#figure(image("../assets/SD_Unterprogramm_Duplikatspruefung.png", width: 100%), caption: [Untersequenzdiagramm: Unterprogramm DUPLIKATSPRÜFUNG (LF 100)]) <fig:sd_duplikat>

Das in @fig:sd_duplikat dargestellte Unterprogramm realisiert die in LF 100 geforderte Prüfung auf bereits vorhandene Datensätze vor jeder Neuanlage. Die UI übergibt der Datenbasis die Schlüsselattribute des anzulegenden Objekts (z.B. Auftragsnummer beim `Arbeitsauftrag`, Seriennummer beim `Gerät`, Mitarbeiternummer beim `Mitarbeiter`); die Datenbasis liefert die Treffermenge zurück. Das anschließende `alt`-Fragment trennt zwischen einem gefundenen Duplikat -- in diesem Fall gibt das Unterprogramm einen Verweis auf den bestehenden Datensatz zurück, sodass der Aufrufer eine Warnung ausgeben kann -- und dem Regelfall ohne Treffer. Die Kapselung als eigenes Unterprogramm ermöglicht die Wiederverwendung an allen Neuanlage-Stellen des Systems, ohne den Prüfablauf redundant zu modellieren.

=== Unterprogramm: Status setzen <chapter-sd-status>

#figure(image("../assets/SD_Unterprogramm_StatusSetzen.png", width: 100%), caption: [Untersequenzdiagramm: Unterprogramm STATUS-SETZEN]) <fig:sd_status>

@fig:sd_status modelliert den Statuswechsel eines beliebigen Domänenobjekts. Das Unterprogramm wird im Hauptszenario an drei verschiedenen Stellen aufgerufen: beim initialen Speichern des `Arbeitsauftrags` (Status "Offen"), beim Stornieren aktiver `Buchung`-Objekte vor dem Löschvorgang (Status "Storniert") sowie beim Löschen des Auftrags selbst (Status "Gelöscht"). Die im Analyse-Klassendiagramm (siehe @fig-analyse-klassendiagramm) für `Arbeitsauftrag` und `Buchung` definierten Statuswerte sind damit vollständig abgedeckt. Die Validierungsprüfung im `alt`-Fragment stellt sicher, dass nur in der Klasse vorgesehene Statuswerte gesetzt werden können; ungültige Aufrufe werden zurückgewiesen, ohne die Datenbasis zu verändern.

=== Unterprogramm: Auftrag löschen <chapter-sd-loeschen>

#figure(image("../assets/SD_Unterprogramm_AuftragLoeschen.png", width: 100%), caption: [Untersequenzdiagramm: Unterprogramm AUFTRAG-LÖSCHEN]) <fig:sd_auftrag_loeschen>

@fig:sd_auftrag_loeschen fasst den gesamten Löschvorgang zusammen, der im Hauptdiagramm durch die Trennlinie "Löschvorgang" eingeleitet wird. Das Unterprogramm gliedert sich in drei Phasen: Zunächst werden -- sofern vorhanden -- aktive `Buchung`-Objekte über das Unterprogramm STATUS-SETZEN auf "Storniert" gesetzt (LF 50: Buchungsverwaltung). Anschließend erfolgt die Kompositionskaskade gemäß Analyse-Klassendiagramm: `Unterauftrag`- und `Termin`-Instanzen werden in je einem `loop`-Fragment einzeln gelöscht, da sie per Komposition existenzabhängig vom `Arbeitsauftrag` sind (LF 40). Erst danach wird der Auftrag selbst auf "Gelöscht" gesetzt, der Löschvorgang persistiert und die Lebenslinie beendet. Diese Reihenfolge verhindert verwaiste Referenzen in der zentralen Datenbasis (LD 10).

== Pseudocode: Auftrag anlegen und löschen

Der folgende Pseudocode ergänzt das Sequenzdiagramm um eine textuelle Beschreibung des Kontrollflusses. Er ist gemäß der Konvention der Beispielarbeit "Immobilienverwaltung" in mehrere kleinere Listings unterteilt: ein Hauptlisting für das Gesamtszenario sowie vier Listings für die im Diagramm referenzierten Unterprogramme. Schlüsselwörter werden ohne Umlaute in Großbuchstaben dargestellt und entsprechen damit der in der Vorlesung empfohlenen Notation.

#figure(
  raw(
"  1 ----------------------------------------------------
  2 -        PSEUDOCODE SEQUENZDIAGRAMM                -
  3 -        AUFTRAG ANLEGEN UND LOESCHEN              -
  4 ----------------------------------------------------
  5 BEGINN AUFTRAG-ANLEGEN-UND-LOESCHEN
  6
  7   // Phase 1: Auftrag anlegen
  8   EMPFANGE Eingabe des Bau-/Projektleiters;
  9   FUEHRE OBJEKT-ANLEGEN mit Klasse Projekt und Projektdaten AUS ;
 10   FUEHRE OBJEKT-ANLEGEN mit Klasse Adresse als Projekt-Einsatzort AUS ;
 11
 12   SOLANGE Pflichtfelder des Arbeitsauftrags unvollstaendig:
 13     EMPFANGE Pflichtfelder (Auftragsnummer, Bezeichnung, Bauplan-Pfad,
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
 25     FALLS Mitarbeiter IST
 26       bereits vorhanden: EMPFANGE Auswahl aus der Mitarbeiterliste ;
 27       nicht vorhanden:   FUEHRE OBJEKT-ANLEGEN mit Klasse Mitarbeiter AUS ;
 28     ENDE-FALLS
 29     Fuege Mitarbeiter als beteiligte Person dem Arbeitsauftrag hinzu;
 30   BIS keine weiteren beteiligten Personen ergaenzt werden;
 31
 32   WENN Unterauftraege ergaenzt werden sollen;
 33   DANN
 34     WIEDERHOLE
 35       FUEHRE OBJEKT-ANLEGEN mit Klasse Unterauftrag AUS ;
 36       WENN ein Unterauftragnehmer zugeordnet werden soll;
 37       DANN
 38         FALLS Unterauftragnehmer IST
 39           bereits vorhanden: EMPFANGE Auswahl ;
 40           nicht vorhanden:   FUEHRE OBJEKT-ANLEGEN mit Klasse
 41                              Unterauftragnehmer AUS ;
 42         ENDE-FALLS
 43       ENDE WENN
 44     BIS keine weiteren Unterauftraege angelegt werden;
 45   ENDE WENN
 46
 47   FUEHRE DUPLIKATSPRUEFUNG mit Auftragsdaten AUS ;
 48   WENN ein Duplikat gefunden wurde;
 49   DANN
 50     GEBE Warnung aus und ueberlasse Korrektur dem Benutzer;
 51   SONST
 52     FUEHRE STATUS-SETZEN mit Arbeitsauftrag und Wert 'Offen' AUS ;
 53     Persistiere Arbeitsauftrag in der Datenbasis;
 54   ENDE WENN
 55
 56   // Phase 2: Auftrag loeschen (zeitlich versetzt)
 57   FUEHRE AUFTRAG-LOESCHEN mit dem ausgewaehlten Arbeitsauftrag AUS ;
 58
 59 ENDE AUFTRAG-ANLEGEN-UND-LOESCHEN",
    lang: "text",
    block: true,
  ),
  caption: [Listing 4.1.1: Hauptszenario "Auftrag anlegen und löschen"],
  supplement: [Listing],
) <lst:auftrag_haupt>

Das Hauptlisting verzichtet -- konsistent zum Sequenzdiagramm -- vollständig auf Datenbankzugriffe. Dies entspricht der Argumentation der Beispielarbeit "Immobilienverwaltung", dass die Konsistenz zwischen Diagramm und Pseudocode nur dann gewährleistet ist, wenn beide Darstellungen dieselbe Abstraktionsebene nutzen. Lese- und Schreibvorgänge auf die zentrale Datenbasis werden ausschließlich im Sequenzdiagramm sichtbar gemacht.

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

Das Unterprogramm OBJEKT-ANLEGEN ist bewusst rekursiv aufrufbar: Sofern ein Attribut der anzulegenden Klasse selbst eine Referenz auf ein noch nicht existierendes Objekt darstellt (beispielsweise eine `Adresse` als Einsatzort eines `Projekts`), wird OBJEKT-ANLEGEN rekursiv für das referenzierte Objekt aufgerufen. Diese Modellierung greift das Vorgehen der Beispielarbeit "Handwerksbetriebe" auf und vermeidet, dass jedes konkrete Anlegen einer Domänenklasse als separates Unterprogramm dargestellt werden muss.

#figure(
  raw(
"  1 BEGINN DUPLIKATSPRUEFUNG
  2   EMPFANGE Datenobjekt mit zu pruefenden Attributen;
  3   Lade bestehende Datensaetze derselben Klasse aus der Datenbasis;
  4   WENN ein Datensatz mit identischen Schluesselattributen existiert;
  5   DANN
  6     GEBE Treffer mit Verweis auf bestehenden Datensatz zurueck;
  7   SONST
  8     GEBE 'kein Duplikat' zurueck;
  9   ENDE WENN
 10 ENDE DUPLIKATSPRUEFUNG",
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
  6   ENDE WENN
  7 ENDE STATUS-SETZEN",
    lang: "text",
    block: true,
  ),
  caption: [Listing 4.1.4: Unterprogramm STATUS-SETZEN],
  supplement: [Listing],
) <lst:status>

STATUS-SETZEN kapselt den Wechsel des Statusattributs einer Lebenslinie. Es wird im Sequenzdiagramm sowohl beim initialen Anlegen (Status "Offen") als auch beim Stornieren von Buchungen (Status "Storniert") und beim Löschen des Auftrags (Status "Geloescht") aufgerufen.

#figure(
  raw(
"  1 BEGINN AUFTRAG-LOESCHEN
  2   EMPFANGE Referenz auf den zu loeschenden Arbeitsauftrag;
  3   Lade alle aktiven Buchungen fuer diesen Arbeitsauftrag;
  4   WENN aktive Buchungen vorliegen;
  5   DANN
  6     SOLANGE noch aktive Buchungen vorhanden sind:
  7       FUEHRE STATUS-SETZEN mit Buchung und Wert 'Storniert' AUS ;
  8     ENDE SOLANGE
  9   ENDE WENN
 10
 11   // Kompositionskaskade: existenzabhaengige Teile zuerst loeschen
 12   SOLANGE der Arbeitsauftrag Unterauftraege enthaelt:
 13     Loesche den Unterauftrag (Lebenslinie wird beendet);
 14   ENDE SOLANGE
 15   SOLANGE dem Arbeitsauftrag Termine zugeordnet sind:
 16     Loesche den Termin (Lebenslinie wird beendet);
 17   ENDE SOLANGE
 18
 19   FUEHRE STATUS-SETZEN mit Arbeitsauftrag und Wert 'Geloescht' AUS ;
 20   Persistiere den Loeschvorgang in der Datenbasis;
 21   Loesche den Arbeitsauftrag (Lebenslinie wird beendet);
 22 ENDE AUFTRAG-LOESCHEN",
    lang: "text",
    block: true,
  ),
  caption: [Listing 4.1.5: Unterprogramm AUFTRAG-LOESCHEN],
  supplement: [Listing],
) <lst:loeschen>

Die Kompositionskaskade ist als eigener Schleifen-Block innerhalb von AUFTRAG-LOESCHEN modelliert, um die im Klassendiagramm festgelegte Existenzabhängigkeit von `Unterauftrag` und `Termin` explizit nachvollziehbar zu machen. Erst nach vollständiger Entfernung sämtlicher abhängiger Teile wird der übergeordnete `Arbeitsauftrag` selbst gelöscht; diese Reihenfolge stellt sicher, dass keine verwaisten Referenzen entstehen und der Löschvorgang in der Datenbasis konsistent persistiert werden kann.
