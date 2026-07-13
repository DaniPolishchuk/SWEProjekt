= Sequenzdiagramm

Im vorliegenden Kapitel wird das Verhalten der Verwaltungssoftware anhand des Szenarios "Auftrag anlegen und archivieren" als UML-Sequenzdiagramm modelliert. Die Aufgabenstellung nennt den Vorgang "Auftrag löschen"; da ein physisches Entfernen jedoch mit der im Lastenheft (LL 20) geforderten zehnjährigen Aufbewahrungspflicht unvereinbar ist, wird "Löschen" durchgängig als logisches Löschen (Archivierung) umgesetzt -- die abweichende Bezeichnung der Modell-Dateien (etwa `SD_Unterprogramm_AuftragLoeschen`) ist damit inhaltlich deckungsgleich zu lesen. Ergänzend zur strukturellen Sicht des Analyse-Klassendiagramms (siehe @fig-analyse-klassendiagramm) wird der dynamische Ablauf zwischen den beteiligten Lebenslinien sichtbar gemacht. Die Anlage eines Arbeitsauftrags wird im Hauptdiagramm ausführlich dargestellt; die Archivierung ist als eigenständiges Unterprogramm ausgelagert, um das Hauptdiagramm übersichtlich zu halten. Auf die Diagrammdarstellung folgen eine Beschreibung der Bildbereiche sowie eine ergänzende Modellierung als Pseudocode.

Aus Gründen der Übersichtlichkeit gelten folgende Vereinfachungen:
- Kein Anmelde-/Authentifizierungsvorgang (gemäß Aufgabenvereinfachung).
- Datenbankfehler und technische Ausnahmen werden nicht abgebildet.
- Keine Nebenläufigkeit; das Szenario verläuft strikt sequentiell.
- Bestätigungs- und Hinweisdialoge nur, wo für das Verständnis relevant.
- Datenbankzugriffe werden nur exemplarisch modelliert, nicht je Operation.
- Der Kostenvoranschlag würde real aus dem Finanzbuchhaltungssystem gelesen; wegen der leeren Ausgangs-Datenbasis wird dieser externe Zugriff hier nicht modelliert, aber textuell berücksichtigt.
- Gemäß Aufbewahrungspflicht (LL 20) wird ein Auftrag nie physisch entfernt, sondern über den Status `ARCHIVIERT` logisch gelöscht; die Lebenslinie bleibt bestehen.

== Szenariobetrachtung: Auftrag anlegen und archivieren <chapter-Sequenzdiagramm-Szenariobetrachtung>

Das Sequenzdiagramm modelliert das Anlegen eines Arbeitsauftrags aus Sicht des `Bau-/Projektleiter`. Ausgangspunkt ist eine leere Datenbasis: alle benötigten Domänenobjekte werden erst durch das Szenario selbst angelegt. Der zeitlich versetzte Archivierungsvorgang ist in das Untersequenzdiagramm @chapter-sd-loeschen ausgelagert, um das Hauptdiagramm fokussiert zu halten.

Der Anlegevorgang verläuft entlang einer festen Schrittfolge: Zunächst wird ein übergeordnetes `Projekt` mit Einsatzort (`Adresse`) angelegt, dann die Pflichtfelder des `Arbeitsauftrags` erfasst und dieser dem Projekt zugeordnet. Es folgen Haupttermin (Start-/Endtermin) und optional ein Zwischentermin, anschließend die beteiligten `Mitarbeiter` (Auswahl oder Neuanlage) sowie optionale `Unterauftrag`-Objekte mit je verpflichtendem `Unterauftragnehmer`. Vor der Persistierung wird gemäß LF 100 die Duplikatsprüfung durchgeführt; bei Erfolg erhält der Auftrag den Status `OFFEN` und wird persistiert.

Sollte im Verlauf der Duplikatsprüfung ein Treffer entdeckt werden, greift die für den Administrator im Lastenheft (LF 100) vorgesehene Sonderregelung: Der Bau-/Projektleiter kann den Vorgang abbrechen oder korrigieren; ein angemeldeter Administrator kann die Warnung darüber hinaus explizit überschreiben und den Datensatz dennoch anlegen. Diese Sonderberechtigung wird im Diagramm durch die zugehörige Notiz am `alt`-Fragment kenntlich gemacht und im Pseudocode über einen zusätzlichen Fallzweig abgebildet.

Der spätere Archivierungsvorgang setzt gemäß der gesetzlichen Aufbewahrungspflicht (LL 20) den Status des Auftrags auf `ARCHIVIERT`; der Datensatz bleibt dabei für die vom Lastenheft geforderten zehn Jahre online lesbar. Vor der Statusänderung prüft das System, ob aktive `Buchung`-Objekte für den Arbeitsauftrag bestehen. Sofern dies der Fall ist, werden diese durch das Unterprogramm "Status setzen" auf den Wert `STORNIERT` gesetzt. Die vollständige Abfolge dieses Vorgangs ist in @chapter-sd-loeschen dokumentiert.

Optionale und wiederholbare Bestandteile des Szenarios sind in der Diagrammdarstellung explizit als solche gekennzeichnet: Die Erfassung beteiligter Personen sowie das Ergänzen von Unteraufträgen werden mittels `loop`-Fragmenten dargestellt, Zwischentermine und Unteraufträge mittels `opt`-Fragmenten. Die wiederkehrende Anlage einzelner Objekte ist als `ref`-Fragment in das Unterprogramm "Objekt anlegen" ausgelagert.

=== Notationserklärung und Farbkonvention

Zur besseren Lesbarkeit des Diagramms wurden die Referenz-Fragmente (`ref`) farblich nach Aufgabenbereich gruppiert. Diese Konvention wird im gesamten Sequenzdiagramm-Kapitel einheitlich verwendet:
- *Lachsrosa:* Referenzen auf das Unterprogramm "Objekt anlegen", welches die Instanziierung einer neuen Domänenobjekt-Lebenslinie kapselt. Es wird im Hauptdiagramm mehrfach aufgerufen und ist daher zur visuellen Wiedererkennung farblich abgesetzt.
- *Hellblau:* Referenzen auf prüfende Operationen, hier insbesondere die "Duplikatsprüfung" gemäß LF 100. Diese Operationen verändern keinen Zustand, sondern werten lediglich den Datenbestand aus.
- *Helles Lila:* Referenzen auf das Unterprogramm "Status setzen", welches den Wechsel des Status-Attributs einer Lebenslinie modelliert.

*Hinweis zum Zugriff auf die Datenbasis:* Die im Diagramm eingezeichnete Lebenslinie `:Datenbasis` wird im Entwurf durch das Singleton-Muster realisiert; jeder tatsächliche Zugriff geschieht folglich über die statische Operation `Datenbasis.getInstance()`. Auf Analyseebene wird dieser Zugriff bewusst abstrahiert dargestellt, um die Lesbarkeit der Nachrichtenfolge nicht durch technische Details zu belasten. Dieselbe Konvention gilt analog für die Swimlane `:Datenbasis` im Aktivitätsdiagramm.

Neue Objekte werden gemäß Vorlesung per `new()`-Nachricht erzeugt; die Objektköpfe erscheinen werkzeugbedingt bereits am oberen Rand, die Lebenslinie beginnt aber erst mit dem `new()`-Aufruf. Rückkehrnachrichten sind gestrichelt und dezimal nummeriert. Als Analyse-Sequenzdiagramm sind sprechende Prosa-Bezeichnungen statt formaler Signaturen zulässig (Vorlesung, Folie 19). Ein physisches Löschen von Lebenslinien kommt nicht vor, da alle Objekte gemäß LL 20 persistiert bleiben.

#figure(image("../assets/Sequenzdiagramm_Auftrag.png", height: 100%), caption: [Sequenzdiagramm "Auftrag anlegen"]) <fig:sd_auftrag>

== Diagrammbetrachtung: Auftrag anlegen

Das in @fig:sd_auftrag dargestellte Sequenzdiagramm beschreibt den Anlegevorgang von der ersten Interaktion bis zur Persistierung; der Archivierungsvorgang ist im Untersequenzdiagramm @fig:sd_auftrag_loeschen dokumentiert. Die folgenden Absätze beschreiben die Bildbereiche von oben nach unten.

=== Initiale Interaktion und Projektanlage

Der `Bau-/Projektleiter` öffnet die Auftragsverwaltung (Nachricht 1); die `:UI Bauverwaltung` lädt die -- bei leerer Datenbasis leere -- Auftragsliste (1.1--1.3). Nach Wahl von "Neuen Auftrag anlegen" (2) wird zunächst ein `Projekt` angelegt (3), da ein Arbeitsauftrag laut Klassendiagramm zwingend einem Projekt zugeordnet sein muss. Die Instanziierung erfolgt über das per `ref` ausgelagerte Unterprogramm "Objekt anlegen".

=== Adressen als Einsatzort

`Projekt` und `Arbeitsauftrag` erhalten je eine eigene `Adresse`-Instanz als Einsatzort (3.3--3.4 bzw. 5.4--5.5) -- die Trennung greift die Use-Case-Aussage auf, dass der Auftrags-Einsatzort detaillierter sein kann als der des Projekts. Beide nutzen erneut das Unterprogramm "Objekt anlegen", was dessen Wiederverwendbarkeit zeigt.

=== Arbeitsauftrag mit Attributen und Terminen

Die Pflichtfelder des Arbeitsauftrags werden in einem `loop`-Fragment ("Solange Pflichtfelder unvollständig") erfasst (4), das die Validierung typischer Eingabemasken abbildet. Nach Instanziierung (5--5.1), Projektzuordnung (5.2) und Attributübernahme (5.3) folgt der Auftrags-Einsatzort (5.4--5.6). Die Terminerfassung legt einen Haupttermin an (6--6.3, Attribute gemäß Vorlesungsempfehlung in einer Nachricht zusammengefasst); ein optionaler Zwischentermin ist als `opt`-Fragment modelliert (6.4--6.6).

=== Beteiligte Personen

Die beteiligten Personen werden in einem `loop`-Fragment erfasst (Multiplizität 1..\*). Ein `alt`-Fragment unterscheidet zwischen bereits vorhandenem Mitarbeiter (7--7.3) und Neuanlage (7.4--7.7, erneut über "Objekt anlegen") -- so können auch neue Mitarbeiter im Zuge des Anlegens erfasst werden.

=== Optionale Unteraufträge mit verpflichtender Zuordnung eines Unterauftragnehmers

Die Unterauftragserfassung ist als `opt`-Fragment dargestellt (Multiplizität 0..\*), mit verschachteltem `loop` für mehrfaches Anlegen (8--8.3). Die Zuordnung eines `Unterauftragnehmers` ist fachlich *verpflichtend* (ein Unterauftrag ohne ausführende Firma wäre sinnlos, vgl. LF 40); das nachgelagerte `alt`-Fragment (8.4--8.8) kennzeichnet lediglich die Wahl zwischen vorhandenem und neuem Unterauftragnehmer, von der pro Unterauftrag genau ein Zweig durchlaufen wird.

=== Duplikatsprüfung, Statuswechsel und Persistierung

Nach Bestätigung des Speichervorgangs (9) wird das Unterprogramm "Duplikatsprüfung" (hellblauer `ref`-Block, LF 100) aufgerufen. Ein `alt`-Fragment trennt Duplikat und gültigen Datensatz: Im Duplikatfall kann der Bau-/Projektleiter korrigieren oder abbrechen, ein Administrator die Warnung überschreiben (dritter Fallzweig im Pseudocode). Im gültigen Fall setzt "Status setzen" (lila `ref`-Block) den Status auf `OFFEN` und der Datensatz wird persistiert (9.4--9.7).

Wichtig ist der Prüfzeitpunkt: Alle bis dahin erzeugten Domänenobjekte bestehen zunächst nur in der Steuerlogik der `:UI Bauverwaltung`. Die Duplikatsprüfung greift daher LF 100-konform vor der Aufnahme in die Datenbasis; erst Aufruf 9.5 überträgt den geprüften Datensatz als konsistentes Ganzes.

=== Reflexion und ehrliche Einordnung

Aus Gründen der Lesbarkeit wurde auf eine vollständige Parameterauflistung verzichtet; die Nachricht "Attribute eintragen" fasst gemäß Vorlesungsempfehlung sämtliche primitiven Pflichtfelder zusammen. Das Diagramm allein reicht daher nicht aus, um jede Einzeleingabe nachzuvollziehen -- hierfür dienen diese Diagrammbetrachtung und die Q&A-Analyse aus @chapter-Zielgruppen-Rollen. Der lesende Zugriff auf das externe Finanzbuchhaltungssystem (Kostenvoranschlag) wurde bewusst nicht modelliert, da er die Annahme einer leeren Datenbasis durchbrechen würde. Der Archivierungsvorgang ist eigenständig in @chapter-sd-loeschen behandelt und über den `ref`-Aufruf an das Hauptszenario gekoppelt.

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

Das Hauptlisting verzichtet -- konsistent zum Diagramm -- auf Datenbankzugriffe, sodass beide Darstellungen auf derselben Abstraktionsebene bleiben; Lese-/Schreibvorgänge sind nur im Sequenzdiagramm sichtbar.

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

OBJEKT-ANLEGEN ist rekursiv: Referenziert ein Attribut ein noch nicht existierendes Objekt (z.B. `Adresse` als Einsatzort eines `Projekts`), wird das Unterprogramm dafür erneut aufgerufen. So entfällt ein separates Anlege-Unterprogramm je Domänenklasse.

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

DUPLIKATSPRUEFUNG bündelt die LF-100-Prüfung als eigenständiges Unterprogramm und ist so an allen Neuanlage-Stellen (Auftrag, Mitarbeiter, Gerät) ohne Wiederholung wiederverwendbar.

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
