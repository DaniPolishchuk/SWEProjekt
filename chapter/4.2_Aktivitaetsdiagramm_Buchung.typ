= Aktivitätsdiagramm

Im vorliegenden Kapitel wird das Verhalten der Verwaltungssoftware anhand des Szenarios "Baumaschine anlegen und buchen" als UML-Aktivitätsdiagramm modelliert. Während das Sequenzdiagramm in @chapter-Sequenzdiagramm-Szenariobetrachtung den Nachrichtenaustausch zwischen Lebenslinien in zeitlicher Reihenfolge darstellt, visualisiert das Aktivitätsdiagramm den Kontrollfluss mit Entscheidungen, Schleifen und parallelen Abläufen. Es eignet sich damit besonders gut zur Darstellung von Abläufen, die mehrere Akteure und Verantwortlichkeitsbereiche umfassen -- hier konkret den Verwaltungsmitarbeiter beim Anlegen von Geräten sowie den Bau-/Projektleiter beim Anlegen einer Buchung.

Aus Gründen der Übersichtlichkeit werden folgende Vereinfachungen getroffen:
- Es wird kein Anmelde- oder Authentifizierungsvorgang modelliert.
- Datenbankfehler und technische Ausnahmen werden nicht abgebildet.
- Das Szenario setzt eine leere Datenbasis voraus; Geräte-Typen, Lager und Arbeitsaufträge werden im Verlauf des Szenarios selbst angelegt.
- Bestätigungsdialoge werden nur dort dargestellt, wo sie für das Verständnis des Ablaufs relevant sind.
- Die Buchung eines Geräts setzt voraus, dass ein Arbeitsauftrag bereits existiert (im Diagramm durch das Laden der Auftragsliste dargestellt); der vollständige Anlegevorgang des Auftrags ist in @fig:sd_auftrag modelliert.
- Das Finanzbuchhaltungssystem wird nicht modelliert; Kostenvoranschläge werden im Kontext dieses Szenarios nicht betrachtet.

== Szenariobetrachtung: Baumaschine anlegen und buchen <chapter-AD-Szenariobetrachtung>

Das nachfolgende Aktivitätsdiagramm modelliert das Szenario "Baumaschine anlegen und buchen" in drei aufeinanderfolgenden Phasen, die durch Swimlanes auf die beteiligten Akteure und Systemkomponenten verteilt werden. Die vier Swimlanes entsprechen den Verantwortlichkeitsbereichen aus dem Use-Case-Diagramm (siehe Kapitel "Use-Case-Diagramm"): *Verwaltungsmitarbeiter* (zuständig für Geräteverwaltung gemäß LF 50), *Bau-/Projektleiter* (zuständig für Buchungen), *System (UI Bauverwaltung)* (Geschäftslogik und Instanzerzeugung) sowie *Datenbasis* (Persistierung und Abfragen).

*Phase A -- Geräte-Typ anlegen:* In der ersten Phase legt der Verwaltungsmitarbeiter einen neuen `Geräte-Typ` an (Exemplartyp-Muster, siehe @fig-analyse-klassendiagramm). Vor der Eingabe der Pflichtfelder (Bezeichnung, Typ, Kategorie) wird gemäß LF 100 eine Duplikatsprüfung durchgeführt: Die Datenbasis liefert die bestehenden Geräte-Typen, und bei einem Treffer wird der Vorgang mit einer Warnmeldung abgebrochen. Sind die Pflichtfelder vollständig und valide, erzeugt das System eine `Geräte-Typ`-Instanz und persistiert sie.

*Phase B -- Konkretes Gerät (Exemplar) anlegen:* In der zweiten Phase legt der Verwaltungsmitarbeiter ein konkretes `Gerät`-Exemplar an. Zunächst wird ein `Lager` zugeordnet -- entweder durch Auswahl aus der bestehenden Liste oder durch paralleles Anlegen einer neuen `Lager`- und `Adresse`-Instanz (Fork/Join-Konstrukt). Die Fork-Parallelisierung modelliert hierbei, dass die Benutzereingabe der Lagerdaten und die systemseitige Instanzerzeugung logisch voneinander trennbar sind. Nach der Validierung der Geräte-Pflichtfelder und einer erneuten Duplikatsprüfung auf Seriennummernebene (LF 100) erzeugt das System die `Gerät`-Instanz, ordnet ihr den Geräte-Typ und das Lager zu und setzt den initialen Status auf "Verfügbar". Optional können in einer Schleife beliebig viele `Ausrüstungs`-Objekte ergänzt werden (Baugruppe-Muster, LF 50).

*Phase C -- Gerät für Arbeitsauftrag buchen:* In der dritten Phase wechselt der handelnde Akteur zum Bau-/Projektleiter. Dieser öffnet die Buchungsverwaltung, wählt das gewünschte Gerät und einen Buchungszeitraum aus. Das System führt anschließend die im Use-Case-Diagramm als `<<include>>` modellierte Verfügbarkeitsprüfung durch (LF 50): Die Datenbasis liefert bestehende Buchungen für das Gerät, und das System prüft auf Zeitraumkollisionen. Ist das Gerät nicht verfügbar, wird ein Hinweis ausgegeben; optional kann eine alternative Suche nach Geräten desselben Typs im gewünschten Zeitraum angestoßen werden. Bei Verfügbarkeit wählt der Bau-/Projektleiter den zugehörigen Arbeitsauftrag aus der Auftragsliste und bestätigt die Buchung. Das System erzeugt die `Buchungs`-Instanz (Koordinator-Muster) mit allen Pflichtattributen, ordnet Gerät und Auftrag zu, setzt den Buchungsstatus auf "Aktiv" und aktualisiert den Gerätestatus auf "Gebucht".

=== Notationserklärung und Farbkonvention

Die Farbkonvention der Aktionsknoten orientiert sich an der im Sequenzdiagramm-Kapitel eingeführten Systematik und wird hier konsequent fortgeführt:
- *Orange (`#FFE3B0`):* Benutzeraktionen der Akteure (Eingaben, Auswahlen, Bestätigungen).
- *Hellblau (`#CFE3F3`):* Prüfende Datenbankoperationen (Duplikatsprüfung, Verfügbarkeitsprüfung, Listenabfragen).
- *Hellgrün (`#C8E6C9`):* Systemaktionen der UI-Schicht (Instanzerzeugung, Attributzuweisung, Persistierung von Geräten).
- *Dunkelgrün (`#A5D6A7`):* Buchungsspezifische Systemaktionen (Instanzerzeugung und Persistierung der `Buchung`-Instanz gemäß Koordinator-Muster).
- *Hellrot (`#FFD7D7`):* Fehler- und Warnpfade (Duplikate gefunden, Gerät nicht verfügbar).

Entscheidungsknoten (Rauten) kennzeichnen Verzweigungen im Kontrollfluss; Schleifenkonstrukte (`while/endwhile`) modellieren die im Klassendiagramm festgelegten `0..*`-Multiplizitäten für wiederholbare Eingaben. Das Fork/Join-Konstrukt beim Lager-Anlegen zeigt eine logische Parallelisierung, die im realen System sequentiell oder nebenläufig realisiert werden kann.

#figure(image("../assets/Aktivitaetsdiagramm_Buchung.png", height: 100%), caption: [Aktivitätsdiagramm "Baumaschine anlegen und buchen"]) <fig:ad_buchung>

== Diagrammbetrachtung: Baumaschine anlegen und buchen

Das in @fig:ad_buchung dargestellte Aktivitätsdiagramm beschreibt den vollständigen Ablauf vom Anlegen eines Geräte-Typs über die Instanziierung eines konkreten Geräts bis zur Buchung für einen Arbeitsauftrag. Wie in der Einleitung zu diesem Kapitel ausgeführt, wird auf die Modellierung von Anmeldevorgängen, Datenbankfehlern und nebenläufigen Akteurszugriffen verzichtet. Die folgenden Absätze beschreiben die einzelnen Bildbereiche von oben nach unten.

=== Phase A: Geräte-Typ anlegen

Den Einstieg bildet der Verwaltungsmitarbeiter, der die Geräteverwaltung öffnet und die Funktion "Neuen Geräte-Typ anlegen" auswählt (orangefarbene Knoten). Bevor Pflichtfelder erfasst werden, wird die Datenbasis nach bestehenden Geräte-Typen befragt (hellblauer Knoten). Der anschließende Entscheidungsknoten implementiert die Duplikatsprüfung gemäß LF 100: Bei einem gefundenen Duplikat verzweigt der Ablauf in den Warnpfad (hellrote Knoten) und endet dort mit einem Abbruch-Endknoten. Im negativen Fall -- kein Duplikat -- setzt der Ablauf mit der Pflichtfeldeingabe fort.

Die Validierungsschleife ("Pflichtfelder unvollständig?") modelliert das typische Verhalten einer Eingabemaske: Die Validierung liegt in der Verantwortung des Systems (hellgrüner Knoten in der System-Swimlane); bei unvollständiger Eingabe wechselt die Kontrolle zurück zum Verwaltungsmitarbeiter zur Korrektur. Diese Aufteilung auf zwei Swimlanes macht die Rollenaufteilung zwischen Benutzer (Eingabe) und System (Prüfung) explizit sichtbar. Nach erfolgreicher Validierung erzeugt das System die `Geräte-Typ`-Instanz, persistiert sie in der Datenbasis und zeigt dem Verwaltungsmitarbeiter eine Bestätigung an.

=== Phase B: Konkretes Gerät anlegen

Der Anlegevorgang eines konkreten Geräts beginnt mit der Lagerauswahl. Das System lädt die bestehende Lagerliste (hellblauer Knoten). Der Entscheidungsknoten "Passendes Lager vorhanden?" führt bei negativem Ergebnis zu einem *Fork/Join-Konstrukt*: Auf dem linken Pfad erfasst der Verwaltungsmitarbeiter die neuen Lagerdaten (Bezeichnung und Adresse); auf dem rechten Pfad erzeugt das System die `Lager`-Instanz und persistiert sie. Die Join-Leiste synchronisiert beide Pfade, bevor der Ablauf mit der Geräte-Pflichtfeldeingabe fortgesetzt wird. Dieses Fork/Join-Konstrukt ist das einzige parallele Element des Diagramms und modelliert die konzeptuelle Trennbarkeit von Benutzereingabe und Systemreaktion.

Die zweite Validierungsschleife ("Pflichtfelder unvollständig?") entspricht strukturell der ersten; erfasst werden Gerätenummer, Seriennummer, Anschaffungsdatum und Wartungstermin. Es folgt eine zweite Duplikatsprüfung, diesmal auf Seriennummernebene (LF 100), da Seriennummern global eindeutig sein müssen. Das Ergebnis wird wiederum über einen Entscheidungsknoten verzweigt; im Duplikat-Fall endet der Ablauf mit einem Abbruch-Endknoten.

Nach erfolgreicher Prüfung erzeugt das System die `Gerät`-Instanz (hellgrüne Knoten), ordnet ihr den zuvor angelegten `Geräte-Typ` und das ausgewählte `Lager` zu und setzt den initialen Gerätestatus auf "Verfügbar". Der anschließende Entscheidungsknoten "Zubehör wird ergänzt?" leitet optional in eine Schleife für die Ausrüstungserfassung, die das Baugruppe-Muster aus dem Klassendiagramm direkt widerspiegelt: Jede `Ausrüstungs`-Instanz wird erzeugt und dem Gerät zugeordnet; die Schleife läuft, solange der Benutzer weiteres Zubehör ergänzen möchte.

=== Phase C: Buchungsvorgang

Mit dem Wechsel der aktiven Swimlane auf den Bau-/Projektleiter beginnt die dritte Phase. Der Bau-/Projektleiter öffnet die Buchungsverwaltung und wählt Gerät sowie Buchungszeitraum aus. Die anschließende *Verfügbarkeitsprüfung* ist als Sequenz aus zwei Aktionen in verschiedenen Swimlanes modelliert: Die Datenbasis liefert die bestehenden Buchungen für das ausgewählte Gerät (hellblauer Knoten in der Datenbasis-Lane), und das System prüft auf Zeitraumkollisionen (hellblauer Knoten in der System-Lane). Diese Aufteilung macht deutlich, dass Datenabfrage und Prüflogik konzeptuell getrennte Verantwortlichkeiten sind -- konsistent zur `<<include>>`-Beziehung im Use-Case-Diagramm (vgl. Kapitel "Use-Case-Diagramm").

Der Entscheidungsknoten "Gerät im Zeitraum verfügbar?" verzweigt den Ablauf: Bei Nichtverfügbarkeit kann der Bau-/Projektleiter optional eine Alternativsuche nach Geräten desselben Typs anstoßen. Diese zweite Entscheidung modelliert eine benutzergesteuerte Fortsetzungsmöglichkeit, die ein vollständiges Abbrechen des Vorgangs vermeidet. Bei Verfügbarkeit -- oder nach erfolgreicher Alternativauswahl -- lädt die Datenbasis die Auftragsliste, und der Bau-/Projektleiter wählt den zugehörigen Arbeitsauftrag.

Den Abschluss bildet die Erzeugung der `Buchungs`-Instanz durch das System (dunkelgrüne Knoten). Dies realisiert das Koordinator-Muster aus dem Klassendiagramm: Die Buchung verknüpft `Gerät` und `Arbeitsauftrag` und trägt eigene Attribute (Buchungsnummer, Startdatum, Enddatum, buchender Mitarbeiter). Buchungs- und Gerätestatus werden gesetzt ("Aktiv" bzw. "Gebucht"), beide Statusänderungen werden separat in der Datenbasis persistiert, und der Bau-/Projektleiter erhält eine abschließende Bestätigung.

=== Reflexion und ehrliche Einordnung

Das Aktivitätsdiagramm abstrahiert an mehreren Stellen bewusst von Implementierungsdetails: Die Fork/Join-Parallelisierung beim Lager-Anlegen ist konzeptuell korrekt, würde in einer tatsächlichen GUI jedoch sequentiell ablaufen (erst Eingabe, dann Systemreaktion). Die Darstellung als Fork wurde gewählt, um die Trennung von Benutzereingabe und Systemlogik im Diagramm explizit zu machen -- auf Kosten einer gewissen Realitätsnähe. Außerdem wurde die Löschung eines Geräts oder das Stornieren einer Buchung bewusst ausgeklammert: Diese Szenarien werden durch das im Sequenzdiagramm (vgl. @fig:sd_auftrag) eingeführte Unterprogramm "Status setzen" abgedeckt und hätten das vorliegende Diagramm über ein handhabbares Maß hinaus verlängert.

== Pseudocode: Baumaschine anlegen und buchen

Der folgende Pseudocode ergänzt das Aktivitätsdiagramm um eine textuelle Beschreibung des Kontrollflusses. Konsistent zu den Listings 4.1.1 bis 4.1.5 werden Schlüsselwörter ohne Umlaute in Großbuchstaben dargestellt, und gemeinsam genutzte Unterprogramme (OBJEKT-ANLEGEN, DUPLIKATSPRUEFUNG, STATUS-SETZEN) werden per `FUEHRE AUS` referenziert, ohne sie hier zu wiederholen.

#figure(
  raw(
"  1 ----------------------------------------------------
  2 -        PSEUDOCODE AKTIVITAETSDIAGRAMM            -
  3 -        BAUMASCHINE ANLEGEN UND BUCHEN            -
  4 ----------------------------------------------------
  5 BEGINN BAUMASCHINE-ANLEGEN-UND-BUCHEN
  6
  7   // Phase A: Geraete-Typ anlegen
  8   FUEHRE DUPLIKATSPRUEFUNG mit Geraete-Typ-Bezeichnung AUS ;
  9   WENN ein Duplikat gefunden wurde;
 10   DANN
 11     GEBE Warnung aus und beende den Vorgang;
 12   ENDE WENN
 13   EMPFANGE Pflichtfelder (Bezeichnung, Typ, Kategorie);
 14   SOLANGE Pflichtfelder des Geraete-Typs unvollstaendig:
 15     EMPFANGE korrigierte Pflichtfelder;
 16   ENDE SOLANGE
 17   FUEHRE OBJEKT-ANLEGEN mit Klasse Geraete-Typ AUS ;
 18
 19   // Phase B: Konkretes Geraet anlegen
 20   FUEHRE LAGER-AUSWAEHLEN-ODER-ANLEGEN AUS ;
 21   EMPFANGE Pflichtfelder (Geraenummer, Seriennummer,
 22           Anschaffungsdatum, Wartungstermin);
 23   SOLANGE Pflichtfelder des Geraets unvollstaendig:
 24     EMPFANGE korrigierte Pflichtfelder;
 25   ENDE SOLANGE
 26   FUEHRE DUPLIKATSPRUEFUNG mit Seriennummer AUS ;
 27   WENN ein Duplikat gefunden wurde;
 28   DANN
 29     GEBE Warnung aus und beende den Vorgang;
 30   ENDE WENN
 31   FUEHRE OBJEKT-ANLEGEN mit Klasse Geraet AUS ;
 32   Ordne Geraete-Typ und Lager dem Geraet zu;
 33   FUEHRE STATUS-SETZEN mit Geraet und Wert 'Verfuegbar' AUS ;
 34   WENN Zubehoer wird ergaenzt;
 35   DANN
 36     WIEDERHOLE
 37       FUEHRE OBJEKT-ANLEGEN mit Klasse Ausruestung AUS ;
 38       Ordne Ausruestung dem Geraet zu;
 39     BIS kein weiteres Zubehoer ergaenzt wird;
 40   ENDE WENN
 41   Persistiere Geraet (inkl. Ausruestung) in der Datenbasis;
 42
 43   // Phase C: Buchung anlegen
 44   EMPFANGE Geraet und Buchungszeitraum vom Bau-/Projektleiter;
 45   FUEHRE VERFUEGBARKEIT-PRUEFEN mit Geraet und Zeitraum AUS ;
 46   WENN Geraet nicht verfuegbar ist;
 47   DANN
 48     WENN Alternative Geraetesuche gewuenscht;
 49     DANN
 50       Lade Geraete desselben Typs fuer den Zeitraum;
 51       EMPFANGE Auswahl des alternativen Geraets;
 52     SONST
 53       Beende den Vorgang;
 54     ENDE WENN
 55   ENDE WENN
 56   EMPFANGE Arbeitsauftrag aus der Auftragsliste;
 57   FUEHRE BUCHUNG-ANLEGEN mit Geraet und Arbeitsauftrag AUS ;
 58
 59 ENDE BAUMASCHINE-ANLEGEN-UND-BUCHEN",
    lang: "text",
    block: true,
  ),
  caption: [Listing 4.2.1: Hauptszenario "Baumaschine anlegen und buchen"],
  supplement: [Listing],
) <lst:buchung_haupt>

Das Hauptlisting referenziert vier Unterprogramme: OBJEKT-ANLEGEN und DUPLIKATSPRUEFUNG sowie STATUS-SETZEN werden aus den Listings 4.1.2 bis 4.1.4 wiederverwendet. LAGER-AUSWAEHLEN-ODER-ANLEGEN und VERFUEGBARKEIT-PRUEFEN werden in den nachfolgenden Listings neu definiert. Die Wiederverwendung der Unterprogramme aus dem Sequenzdiagramm-Kapitel zeigt, dass diese Abstraktion tatsächlich domänenübergreifend einsetzbar ist -- ein zentrales Ziel der Unterprogramm-Modellierung.

#figure(
  raw(
"  1 BEGINN LAGER-AUSWAEHLEN-ODER-ANLEGEN
  2   Lade bestehende Lager aus der Datenbasis;
  3   FALLS Lager IST
  4     vorhanden: EMPFANGE Auswahl des passenden Lagers ;
  5     nicht vorhanden:
  6       EMPFANGE neue Lagerbezeichnung und Adresse;
  7       FUEHRE OBJEKT-ANLEGEN mit Klasse Adresse AUS ;
  8       FUEHRE OBJEKT-ANLEGEN mit Klasse Lager AUS ;
  9       Ordne Adresse dem Lager zu;
 10       Persistiere Lager in der Datenbasis;
 11   ENDE-FALLS
 12   GEBE Lagerreferenz zurueck;
 13 ENDE LAGER-AUSWAEHLEN-ODER-ANLEGEN",
    lang: "text",
    block: true,
  ),
  caption: [Listing 4.2.2: Unterprogramm LAGER-AUSWAEHLEN-ODER-ANLEGEN],
  supplement: [Listing],
) <lst:lager>

Das Unterprogramm LAGER-AUSWAEHLEN-ODER-ANLEGEN kapselt die im Aktivitätsdiagramm als Fork/Join dargestellte Verzweigung. Im Pseudocode wird sie als FALLS-Konstrukt modelliert, da Pseudocode keine echte Parallelisierung abbildet; die konzeptuelle Aussage -- Benutzereingabe und Systemreaktion können unabhängig voneinander beschrieben werden -- bleibt erhalten.

#figure(
  raw(
"  1 BEGINN VERFUEGBARKEIT-PRUEFEN
  2   EMPFANGE Geraetereferenz und Buchungszeitraum;
  3   Lade alle aktiven Buchungen fuer das Geraet;
  4   SOLANGE noch nicht geprueft gebuchte Zeitraeume vorhanden:
  5     WENN Zeitraumkollision mit geplantem Zeitraum;
  6     DANN
  7       GEBE 'nicht verfuegbar' zurueck;
  8     ENDE WENN
  9   ENDE SOLANGE
 10   GEBE 'verfuegbar' zurueck;
 11 ENDE VERFUEGBARKEIT-PRUEFEN",
    lang: "text",
    block: true,
  ),
  caption: [Listing 4.2.3: Unterprogramm VERFUEGBARKEIT-PRUEFEN (LF 50)],
  supplement: [Listing],
) <lst:verfuegbarkeit>

Das Unterprogramm VERFUEGBARKEIT-PRUEFEN realisiert die in LF 50 geforderte Verfügbarkeitssuche und entspricht der im Use-Case-Diagramm modellierten `<<include>>`-Beziehung zwischen "Buchung verwalten" und "Verfügbarkeit prüfen". Die Implementierung als eigenständiges Unterprogramm erlaubt es, dieselbe Prüflogik auch für die Verfügbarkeitssuche (LF 60) ohne Codeduplizierung wiederzuverwenden.

#figure(
  raw(
"  1 BEGINN BUCHUNG-ANLEGEN
  2   EMPFANGE Geraetereferenz und Arbeitsauftragsreferenz;
  3   FUEHRE OBJEKT-ANLEGEN mit Klasse Buchung AUS ;
  4   Ordne Geraet der Buchung zu;
  5   Ordne Arbeitsauftrag der Buchung zu;
  6   Setze buchenden Mitarbeiter auf aktiven Benutzer;
  7   FUEHRE STATUS-SETZEN mit Buchung und Wert 'Aktiv' AUS ;
  8   FUEHRE STATUS-SETZEN mit Geraet und Wert 'Gebucht' AUS ;
  9   Persistiere Buchung in der Datenbasis;
 10   Persistiere aktualisierten Geraete-Status;
 11   GEBE Buchungsbestaetigung an den Bau-/Projektleiter aus;
 12 ENDE BUCHUNG-ANLEGEN",
    lang: "text",
    block: true,
  ),
  caption: [Listing 4.2.4: Unterprogramm BUCHUNG-ANLEGEN],
  supplement: [Listing],
) <lst:buchung_anlegen>

Das Unterprogramm BUCHUNG-ANLEGEN realisiert das Koordinator-Muster aus dem Analyse-Klassendiagramm direkt im Pseudocode: Die `Buchung`-Instanz verknüpft `Gerät` und `Arbeitsauftrag` und trägt eigene Attribute (Buchungsnummer, Zeitraum, buchender Mitarbeiter, Status). Bemerkenswert ist, dass sowohl der Buchungsstatus als auch der Gerätestatus gesetzt und separat persistiert werden -- zwei logisch unabhängige Statuswechsel, die aber kausal zusammenhängen: Ein gebuchtes Gerät ist nicht mehr verfügbar, und eine aktive Buchung existiert nur für ein als "Gebucht" markiertes Gerät. Diese Kopplung ist im Koordinator-Muster implizit enthalten und wird hier durch die sequentielle Ausführung zweier STATUS-SETZEN-Aufrufe explizit gemacht.
