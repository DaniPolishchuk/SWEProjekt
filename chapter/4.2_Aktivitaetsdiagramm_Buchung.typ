= Aktivitätsdiagramm

Im vorliegenden Kapitel wird das Verhalten der Verwaltungssoftware anhand des Szenarios "Gerät anlegen und buchen" (im Datenmodell konsequent als Gerät geführt; das ursprünglich verwendete Wort "Baumaschine" bezeichnet lediglich die konkrete Ausprägung `Baumaschine` innerhalb der Enumeration `GerätTyp`) als UML-Aktivitätsdiagramm modelliert. Während das Sequenzdiagramm in @chapter-Sequenzdiagramm-Szenariobetrachtung den Nachrichtenaustausch zwischen Lebenslinien in zeitlicher Reihenfolge darstellt, visualisiert das Aktivitätsdiagramm den Kontrollfluss mit Entscheidungen und Schleifen. Es eignet sich damit besonders gut zur Darstellung von Abläufen, die mehrere Akteure und Verantwortlichkeitsbereiche umfassen -- hier konkret den Verwaltungsmitarbeiter beim Anlegen von Geräten sowie den Bau-/Projektleiter beim Anlegen einer Buchung.

Aus Gründen der Übersichtlichkeit werden folgende Vereinfachungen getroffen:
- Es wird kein Anmelde- oder Authentifizierungsvorgang modelliert.
- Datenbankfehler und technische Ausnahmen werden nicht abgebildet.
- Das Szenario setzt eine leere Datenbasis voraus; Geräte-Typen, Lager und Arbeitsaufträge werden im Verlauf des Szenarios selbst angelegt.
- Bestätigungsdialoge werden nur dort dargestellt, wo sie für das Verständnis des Ablaufs relevant sind.
- Die Buchung eines Geräts setzt voraus, dass ein Arbeitsauftrag bereits existiert (im Diagramm durch das Laden der Auftragsliste dargestellt); der vollständige Anlegevorgang des Auftrags ist in @fig:sd_auftrag modelliert.
- Das Finanzbuchhaltungssystem wird nicht modelliert; Kostenvoranschläge werden im Kontext dieses Szenarios nicht betrachtet.

== Szenariobetrachtung: Gerät anlegen und buchen <chapter-AD-Szenariobetrachtung>

Das nachfolgende Aktivitätsdiagramm modelliert das Szenario "Gerät anlegen und buchen" in drei aufeinanderfolgenden Phasen, die durch Swimlanes auf die beteiligten Akteure und Systemkomponenten verteilt werden. Die vier Swimlanes entsprechen den Verantwortlichkeitsbereichen aus dem Use-Case-Diagramm (siehe Kapitel "Use-Case-Diagramm"): *Verwaltungsmitarbeiter* (zuständig für Geräteverwaltung gemäß LF 50), *Bau-/Projektleiter* (zuständig für Buchungen), *System (UI Bauverwaltung)* (Geschäftslogik und Instanzerzeugung) sowie *Datenbasis* (Persistierung und Abfragen).

*Phase A -- Geräte-Typ anlegen:* In der ersten Phase legt der Verwaltungsmitarbeiter einen neuen `Geräte-Typ` an (Exemplartyp-Muster, siehe @fig-analyse-klassendiagramm). Nach Auswahl der Funktion "Neuen Geräte-Typ anlegen" erfasst der Benutzer zuerst die Pflichtfelder (Bezeichnung, Typ, Kategorie); erst nach vollständiger, valider Eingabe lädt das System den Bestand und führt die Duplikatsprüfung gemäß LF 100 durch. Bei einem Treffer wird der Vorgang mit einer Warnmeldung abgebrochen; ein angemeldeter Administrator kann die Warnung als `<<extend>>`-Sonderberechtigung explizit übersteuern. Sind die Pflichtfelder vollständig, valide und ohne Duplikatstreffer, erzeugt das System eine `Geräte-Typ`-Instanz und persistiert sie.

*Phase B -- Konkretes Gerät (Exemplar) anlegen:* In der zweiten Phase legt der Verwaltungsmitarbeiter ein konkretes `Gerät`-Exemplar an. Zunächst wird ein `Lager` zugeordnet -- entweder durch Auswahl aus der bestehenden Liste oder durch Anlegen einer neuen `Lager`- und `Adresse`-Instanz. Der Anlegevorgang eines neuen Lagers wird strikt sequenziell modelliert: erst die Eingabe von Lagerbezeichnung und Adresse durch den Verwaltungsmitarbeiter, dann die Duplikatsprüfung gemäß LF 100 anhand von Bezeichnung und Adresse und schließlich die systemseitige Instanzerzeugung samt Persistierung. Nach der Validierung der Geräte-Pflichtfelder und einer erneuten Duplikatsprüfung auf Seriennummernebene (LF 100) erzeugt das System die `Gerät`-Instanz, ordnet ihr den Geräte-Typ und das Lager zu und setzt den initialen Status auf `VERFUEGBAR`. Optional können in einer Schleife beliebig viele `Ausrüstungs`-Objekte ergänzt werden (Baugruppe-Muster, LF 50).

*Phase C -- Gerät für Arbeitsauftrag buchen:* In der dritten Phase wechselt der handelnde Akteur zum Bau-/Projektleiter. Dieser öffnet die Buchungsverwaltung, wählt das gewünschte Gerät und einen Buchungszeitraum aus. Das System führt anschließend die im Use-Case-Diagramm als `<<include>>` modellierte Verfügbarkeitsprüfung durch (LF 50): Die Datenbasis liefert bestehende Buchungen für das Gerät, und das System prüft auf Zeitraumkollisionen. Ist das Gerät nicht verfügbar, wird ein Hinweis ausgegeben; optional kann eine alternative Suche nach Geräten desselben Typs im gewünschten Zeitraum angestoßen werden. Bei Verfügbarkeit wählt der Bau-/Projektleiter den zugehörigen Arbeitsauftrag aus der Auftragsliste und bestätigt die Buchung. Das System erzeugt die `Buchungs`-Instanz (Koordinator-Muster) mit allen Pflichtattributen; der zuvor ausgewählte Buchungszeitraum wird der Instanzerzeugung dabei als Parameter mitgegeben. Anschließend werden Gerät und Auftrag zugeordnet und der Buchungsstatus auf `AKTIV` gesetzt. Der Gerätestatus wird dabei bewusst *nicht* verändert: Da mehrere zeitlich versetzte Buchungen für dasselbe Gerät gleichzeitig existieren können, wird die konkrete Belegung stets aus den aktiven `Buchung`-Objekten des jeweils angefragten Zeitraums berechnet.

*Notationserklärung und Farbkonvention*

Die Farbkonvention der Aktionsknoten orientiert sich an der im Sequenzdiagramm-Kapitel eingeführten Systematik und wird hier konsequent fortgeführt:
- *Orange (`#FFE3B0`):* Benutzeraktionen der Akteure (Eingaben, Auswahlen, Bestätigungen).
- *Hellblau (`#CFE3F3`):* Prüfende Datenbankoperationen (Duplikatsprüfung, Verfügbarkeitsprüfung, Listenabfragen).
- *Hellgrün (`#C8E6C9`):* Systemaktionen der UI-Schicht (Instanzerzeugung, Attributzuweisung, Persistierung von Geräten).
- *Dunkelgrün (`#A5D6A7`):* Buchungsspezifische Systemaktionen (Instanzerzeugung und Persistierung der `Buchung`-Instanz gemäß Koordinator-Muster).
- *Hellrot (`#FFD7D7`):* Fehler- und Warnpfade (Duplikate gefunden, Gerät nicht verfügbar).

Entscheidungsknoten (Rauten) kennzeichnen Verzweigungen im Kontrollfluss; Schleifenkonstrukte (`while/endwhile`) modellieren die im Klassendiagramm festgelegten `0..*`-Multiplizitäten für wiederholbare Eingaben. Der Kontrollfluss verläuft durchgehend sequenziell; auf Fork/Join-Konstrukte wurde bewusst verzichtet, da im vorliegenden Szenario keine echte Nebenläufigkeit vorliegt.

#figure(image("../assets/Aktivitaetsdiagramm_Buchung.png", width: 100%), caption: [Aktivitätsdiagramm "Gerät anlegen und buchen"]) <fig:ad_buchung>

== Diagrammbetrachtung: Gerät anlegen und buchen

Das in @fig:ad_buchung dargestellte Aktivitätsdiagramm beschreibt den vollständigen Ablauf vom Anlegen eines Geräte-Typs über die Instanziierung eines konkreten Geräts bis zur Buchung für einen Arbeitsauftrag. Wie in der Einleitung zu diesem Kapitel ausgeführt, wird auf die Modellierung von Anmeldevorgängen, Datenbankfehlern und nebenläufigen Akteurszugriffen verzichtet. Die folgenden Absätze beschreiben die einzelnen Bildbereiche von oben nach unten.

*Phase A: Geräte-Typ anlegen*

Den Einstieg bildet der Verwaltungsmitarbeiter, der die Geräteverwaltung öffnet und die Funktion "Neuen Geräte-Typ anlegen" auswählt (orangefarbene Knoten). Anschließend erfasst er die Pflichtfelder. Die Validierungsschleife ("Pflichtfelder unvollständig?") modelliert das typische Verhalten einer Eingabemaske: Die Validierung liegt in der Verantwortung des Systems (hellgrüner Knoten in der System-Swimlane); bei unvollständiger Eingabe wechselt die Kontrolle zurück zum Verwaltungsmitarbeiter zur Korrektur. Diese Aufteilung auf zwei Swimlanes macht die Rollenaufteilung zwischen Benutzer (Eingabe) und System (Prüfung) explizit sichtbar.

Erst nach vollständiger, valider Eingabe befragt das System die Datenbasis nach bestehenden Geräte-Typen (hellblauer Knoten). Der anschließende Entscheidungsknoten implementiert die Duplikatsprüfung gemäß LF 100: Bei einem gefundenen Duplikat verzweigt der Ablauf in den Warnpfad (hellrote Knoten) und endet dort mit einem Abbruch-Endknoten; ein Administrator kann diese Warnung als `<<extend>>`-Sonderberechtigung überschreiben. Im negativen Fall -- kein Duplikat -- erzeugt das System die `Geräte-Typ`-Instanz, persistiert sie in der Datenbasis und zeigt dem Verwaltungsmitarbeiter eine Bestätigung an.

*Phase B: Konkretes Gerät anlegen*

Der Anlegevorgang eines konkreten Geräts beginnt mit der Lagerauswahl. Das System lädt die bestehende Lagerliste (hellblauer Knoten). Der Entscheidungsknoten "Passendes Lager vorhanden?" führt bei positivem Ergebnis direkt zur Auswahl aus der Liste. Andernfalls erfasst der Verwaltungsmitarbeiter Bezeichnung und Adresse des neuen Lagers; die Datenbasis lädt bestehende Lager und das System führt eine Duplikatsprüfung gemäß LF 100 auf `(Bezeichnung, Adresse)` durch. Erst nach negativem Duplikatstreffer erzeugt das System die `Adresse`- und `Lager`-Instanzen sequenziell und persistiert das Lager. Diese lineare Modellierung -- Eingabe, Duplikatsprüfung, Instanzerzeugung, Persistierung -- entspricht sowohl dem Pseudocode LAGER-AUSWAEHLEN-ODER-ANLEGEN (siehe @lst:lager) als auch der tatsächlichen Kontrollfluss-Semantik einer klassischen Eingabemaske.

Die zweite Validierungsschleife ("Pflichtfelder unvollständig?") entspricht strukturell der ersten; erfasst werden Gerätenummer, Seriennummer, Anschaffungsdatum und Wartungstermin. Es folgt eine erneute Duplikatsprüfung, diesmal auf Seriennummernebene (LF 100), da Seriennummern global eindeutig sein müssen. Das Ergebnis wird wiederum über einen Entscheidungsknoten verzweigt; im Duplikat-Fall endet der Ablauf mit einem Abbruch-Endknoten.

Nach erfolgreicher Prüfung erzeugt das System die `Gerät`-Instanz (hellgrüne Knoten), ordnet ihr den zuvor angelegten `Geräte-Typ` und das ausgewählte `Lager` zu und setzt den initialen Gerätestatus auf `VERFUEGBAR`. Der anschließende Entscheidungsknoten "Zubehör wird ergänzt?" leitet optional in eine Schleife für die Ausrüstungserfassung, die das Baugruppe-Muster aus dem Klassendiagramm direkt widerspiegelt: Jede `Ausrüstungs`-Instanz wird erzeugt und dem Gerät zugeordnet; die Schleife läuft, solange der Benutzer weiteres Zubehör ergänzen möchte.

*Phase C: Buchungsvorgang*

Mit dem Wechsel der aktiven Swimlane auf den Bau-/Projektleiter beginnt die dritte Phase. Der Bau-/Projektleiter öffnet die Buchungsverwaltung und wählt Gerät sowie Buchungszeitraum aus. Die anschließende *Verfügbarkeitsprüfung* ist als Sequenz aus zwei Aktionen in verschiedenen Swimlanes modelliert: Die Datenbasis liefert die bestehenden Buchungen für das ausgewählte Gerät (hellblauer Knoten in der Datenbasis-Lane), und das System prüft auf Zeitraumkollisionen (hellblauer Knoten in der System-Lane). Diese Aufteilung macht deutlich, dass Datenabfrage und Prüflogik konzeptuell getrennte Verantwortlichkeiten sind -- konsistent zur `<<include>>`-Beziehung im Use-Case-Diagramm (vgl. Kapitel "Use-Case-Diagramm").

Der Entscheidungsknoten "Gerät im Zeitraum verfügbar?" verzweigt den Ablauf: Bei Nichtverfügbarkeit kann der Bau-/Projektleiter optional eine Alternativsuche nach Geräten desselben Typs anstoßen. Diese zweite Entscheidung modelliert eine benutzergesteuerte Fortsetzungsmöglichkeit, die ein vollständiges Abbrechen des Vorgangs vermeidet. Bei Verfügbarkeit -- oder nach erfolgreicher Alternativauswahl -- lädt die Datenbasis die Auftragsliste, und der Bau-/Projektleiter wählt den zugehörigen Arbeitsauftrag.

Den Abschluss bildet die Erzeugung der `Buchungs`-Instanz durch das System (dunkelgrüne Knoten). Dies realisiert das Koordinator-Muster aus dem Klassendiagramm: Die Buchung verknüpft `Gerät` und `Arbeitsauftrag` und trägt eigene Attribute (Buchungsnummer, Startdatum, Enddatum, buchender Mitarbeiter). Der vom Bau-/Projektleiter ausgewählte Buchungszeitraum wird der Instanzerzeugung dabei explizit als Parameter mitgegeben, wie im entsprechenden Aktionsknoten des Diagramms sichtbar. Der Buchungsstatus wird auf `AKTIV` gesetzt, die Buchung wird in der Datenbasis persistiert, und der Bau-/Projektleiter erhält eine abschließende Bestätigung. Der `GerätStatus` wird an dieser Stelle bewusst nicht verändert: Die zeitraumbezogene Belegung ergibt sich stets aus den aktiven `Buchung`-Objekten und ist daher nicht durch einen globalen Statuswert des Geräts abzubilden.

*Reflexion und ehrliche Einordnung*

Das Aktivitätsdiagramm abstrahiert an einigen Stellen bewusst von Implementierungsdetails: Die Kompaktheit einzelner "Attribute eintragen"-Knoten überdeckt die feingliedrige Struktur der zugrunde liegenden Attribute; deren vollständige Auflistung ist der Q&A-Analyse und dem Klassendiagramm zu entnehmen. Außerdem wurde die Archivierung eines Geräts oder das Stornieren einer Buchung bewusst ausgeklammert: Diese Szenarien werden durch das im Sequenzdiagramm (vgl. @fig:sd_auftrag) eingeführte Unterprogramm "Status setzen" abgedeckt und hätten das vorliegende Diagramm über ein handhabbares Maß hinaus verlängert.

== Pseudocode: Gerät anlegen und buchen

Der folgende Pseudocode ergänzt das Aktivitätsdiagramm um eine textuelle Beschreibung des Kontrollflusses. Konsistent zu den Listings 4.1.1 bis 4.1.5 werden Schlüsselwörter ohne Umlaute in Großbuchstaben dargestellt, und gemeinsam genutzte Unterprogramme (OBJEKT-ANLEGEN, DUPLIKATSPRUEFUNG, STATUS-SETZEN) werden per `FUEHRE AUS` referenziert, ohne sie hier zu wiederholen.

#figure(
  raw(
"  1 ----------------------------------------------------
  2 -        PSEUDOCODE AKTIVITAETSDIAGRAMM            -
  3 -        GERAET ANLEGEN UND BUCHEN                 -
  4 ----------------------------------------------------
  5 BEGINN GERAET-ANLEGEN-UND-BUCHEN
  6
  7   // Phase A: Geraete-Typ anlegen
  8   EMPFANGE Pflichtfelder (Bezeichnung, Typ, Kategorie);
  9   SOLANGE Pflichtfelder des Geraete-Typs unvollstaendig:
 10     EMPFANGE korrigierte Pflichtfelder;
 11   ENDE SOLANGE
 12   FUEHRE DUPLIKATSPRUEFUNG mit Geraete-Typ-Bezeichnung AUS ;
 13   WENN ein Duplikat gefunden wurde;
 14   DANN
 15     GEBE Warnung aus und beende den Vorgang;
 16   ENDE WENN
 17   FUEHRE OBJEKT-ANLEGEN mit Klasse Geraete-Typ AUS ;
 18
 19   // Phase B: Konkretes Geraet anlegen
 20   FUEHRE LAGER-AUSWAEHLEN-ODER-ANLEGEN AUS ;
 21   EMPFANGE Pflichtfelder (Geraetenummer, Seriennummer,
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
 33   FUEHRE STATUS-SETZEN mit Geraet und Wert 'VERFUEGBAR' AUS ;
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
 57   FUEHRE BUCHUNG-ANLEGEN mit (Geraet, Arbeitsauftrag, Zeitraum,
 58                              aktivem Benutzer) AUS ;
 59
 60 ENDE GERAET-ANLEGEN-UND-BUCHEN",
    lang: "text",
    block: true,
  ),
  caption: [Listing 4.2.1: Hauptszenario "Gerät anlegen und buchen"],
  supplement: [Listing],
) <lst:buchung_haupt>

Das Hauptlisting referenziert vier Unterprogramme: OBJEKT-ANLEGEN und DUPLIKATSPRUEFUNG sowie STATUS-SETZEN werden aus den Listings 4.1.2 bis 4.1.4 wiederverwendet. LAGER-AUSWAEHLEN-ODER-ANLEGEN und VERFUEGBARKEIT-PRUEFEN werden in den nachfolgenden Listings neu definiert. Die Wiederverwendung der Unterprogramme aus dem Sequenzdiagramm-Kapitel zeigt, dass diese Abstraktion tatsächlich domänenübergreifend einsetzbar ist -- ein zentrales Ziel der Unterprogramm-Modellierung.

#figure(
  raw(
"  1 BEGINN LAGER-AUSWAEHLEN-ODER-ANLEGEN
  2   Lade bestehende Lager aus der Datenbasis;
  3   WENN passendes Lager vorhanden;
  4   DANN
  5     EMPFANGE Auswahl des passenden Lagers;
  6   SONST
  7     EMPFANGE neue Lagerbezeichnung und Adresse;
  8     FUEHRE DUPLIKATSPRUEFUNG mit (Bezeichnung, Adresse) AUS ;
  9     WENN ein Duplikat gefunden wurde;
 10     DANN
 11       GEBE Warnung aus und ueberlasse Korrektur dem Benutzer;
 12     SONST
 13       FUEHRE OBJEKT-ANLEGEN mit Klasse Adresse AUS ;
 14       FUEHRE OBJEKT-ANLEGEN mit Klasse Lager AUS ;
 15       Ordne Adresse dem Lager zu;
 16       Persistiere Lager in der Datenbasis;
 17     ENDE WENN
 18   ENDE WENN
 19   GEBE Lagerreferenz zurueck;
 20 ENDE LAGER-AUSWAEHLEN-ODER-ANLEGEN",
    lang: "text",
    block: true,
  ),
  caption: [Listing 4.2.2: Unterprogramm LAGER-AUSWAEHLEN-ODER-ANLEGEN],
  supplement: [Listing],
) <lst:lager>

Das Unterprogramm LAGER-AUSWAEHLEN-ODER-ANLEGEN kapselt die im Aktivitätsdiagramm als Fork/Join dargestellte Verzweigung. Im Pseudocode wird sie als sequenzielles WENN/SONST-Konstrukt modelliert, da Pseudocode keine echte Parallelisierung abbildet; die konzeptuelle Aussage -- Benutzereingabe und Systemreaktion können logisch unabhängig beschrieben werden -- bleibt erhalten. Ergänzend wird an dieser Stelle die im Lastenheft (LF 100) geforderte Duplikatsprüfung explizit auch für Lager durchgeführt: Der Vergleich von Bezeichnung und Adresse verhindert die versehentliche Doppelanlage eines Lagers.

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
  2   EMPFANGE Geraetereferenz, Arbeitsauftragsreferenz, Buchungszeitraum
  3           und aktiven Benutzer;
  4   FUEHRE OBJEKT-ANLEGEN mit Klasse Buchung AUS ;
  5   Setze Startdatum und Enddatum der Buchung aus dem Buchungszeitraum;
  6   Ordne Geraet der Buchung zu;
  7   Ordne Arbeitsauftrag der Buchung zu;
  8   Setze buchenden Mitarbeiter auf aktiven Benutzer;
  9   FUEHRE STATUS-SETZEN mit Buchung und Wert 'AKTIV' AUS ;
 10   Persistiere Buchung in der Datenbasis;
 11   // Der Geraetestatus bleibt unveraendert: Belegung wird zeitraumbezogen
 12   // aus aktiven Buchungen abgeleitet, nicht durch einen globalen Status.
 13   GEBE Buchungsbestaetigung an den Bau-/Projektleiter aus;
 14 ENDE BUCHUNG-ANLEGEN",
    lang: "text",
    block: true,
  ),
  caption: [Listing 4.2.4: Unterprogramm BUCHUNG-ANLEGEN],
  supplement: [Listing],
) <lst:buchung_anlegen>

Das Unterprogramm BUCHUNG-ANLEGEN realisiert das Koordinator-Muster aus dem Analyse-Klassendiagramm direkt im Pseudocode: Die `Buchung`-Instanz verknüpft `Gerät` und `Arbeitsauftrag` und trägt eigene Attribute (Buchungsnummer, Zeitraum, buchender Mitarbeiter, Status). Bewusst *nicht* verändert wird dabei der `GerätStatus`: Anders als eine frühere Modellierungsvariante suggeriert, würde ein globaler Wert `GEBUCHT` das Gerät für sämtliche Zeiträume blockieren und ist damit unvereinbar mit einer zeitraumbezogenen Buchungslogik. Die Verfügbarkeit eines Geräts wird konsequent aus den aktiven `Buchung`-Objekten und ihrem Zeitraum berechnet (siehe Listing 4.2.3, VERFUEGBARKEIT-PRUEFEN); der `GerätStatus` bleibt für technische, dauerhafte Zustände wie `VERFUEGBAR`, `IN_WARTUNG` oder `DEFEKT` reserviert.
