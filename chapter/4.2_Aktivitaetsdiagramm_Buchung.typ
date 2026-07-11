= Aktivitätsdiagramm

Im vorliegenden Kapitel wird das Verhalten der Verwaltungssoftware anhand des Szenarios "Gerät anlegen und buchen" als UML-Aktivitätsdiagramm modelliert (im Datenmodell konsequent als `Gerät` geführt; "Baumaschine" bezeichnet lediglich einen Wert des Typattributs am `Geräte-Typ`, nämlich `BAUMASCHINE` gegenüber `BAUWERKZEUG`, und ist keine eigene Klasse). Während das Sequenzdiagramm in @chapter-Sequenzdiagramm-Szenariobetrachtung den Nachrichtenaustausch in zeitlicher Reihenfolge zeigt, visualisiert das Aktivitätsdiagramm den Kontrollfluss mit Entscheidungen und Schleifen. Es eignet sich damit besonders zur Darstellung von Abläufen über mehrere Verantwortlichkeitsbereiche -- hier den Verwaltungsmitarbeiter beim Anlegen von Geräten sowie den Bau-/Projektleiter beim Buchen.

Es gelten dieselben Vereinfachungen wie im Sequenzdiagramm-Kapitel (kein Anmeldevorgang, keine Datenbankfehler, leere Ausgangs-Datenbasis, Bestätigungsdialoge nur wo relevant). Zusätzlich gilt: Die Buchung setzt einen bereits existierenden Arbeitsauftrag voraus (im Diagramm durch das Laden der Auftragsliste dargestellt; der Anlegevorgang ist in @fig:sd_auftrag modelliert), und das Finanzbuchhaltungssystem wird nicht betrachtet.

== Szenariobetrachtung: Gerät anlegen und buchen <chapter-AD-Szenariobetrachtung>

Das Szenario ist in drei Phasen gegliedert: Anlage (A, B) und Buchung (C) werden als zwei eigenständige Aktivitäten mit je eigenem Start-/Endknoten dargestellt, da es zeitlich versetzte Vorgänge unterschiedlicher Akteure sind. Beide Aktivitäten nutzen drei Swimlanes -- Akteur, System (UI Bauverwaltung) und Datenbasis; Akteur ist in Aktivität 1 der Verwaltungsmitarbeiter, in Aktivität 2 der Bau-/Projektleiter.

*Phase A -- Geräte-Typ anlegen:* Der Verwaltungsmitarbeiter legt einen `Geräte-Typ` an (Exemplartyp-Muster, siehe @fig-analyse-klassendiagramm) -- nach Eingabe der Pflichtfelder und Duplikatsprüfung (LF 100).

*Phase B -- Konkretes Gerät (Exemplar) anlegen:* Anschließend wird ein `Gerät`-Exemplar angelegt, einem `Lager` zugeordnet (Auswahl oder Neuanlage) und nach erneuter Duplikatsprüfung auf Seriennummernebene mit Status `VERFUEGBAR` persistiert. Optional wird in einer Schleife `Ausrüstung` ergänzt (Baugruppe-Muster, LF 50).

*Phase C -- Gerät für Arbeitsauftrag buchen:* Der Bau-/Projektleiter wählt Gerät und Zeitraum; das System prüft die Verfügbarkeit (LF 50) und legt bei Erfolg die `Buchung` (Koordinator-Muster) mit Status `AKTIV` an.

Die ausführliche Beschreibung der einzelnen Bildbereiche folgt nach den Diagrammen.

*Notationserklärung und Farbkonvention*

Die Farbkonvention der Aktionsknoten orientiert sich an der im Sequenzdiagramm-Kapitel eingeführten Systematik und wird hier konsequent fortgeführt:
- *Orange (`#FFE3B0`):* Benutzeraktionen der Akteure (Eingaben, Auswahlen, Bestätigungen).
- *Hellblau (`#CFE3F3`):* Prüfende Datenbankoperationen (Duplikatsprüfung, Verfügbarkeitsprüfung, Listenabfragen).
- *Hellgrün (`#C8E6C9`):* Systemaktionen der UI-Schicht (Instanzerzeugung, Attributzuweisung, Persistierung von Geräten).
- *Dunkelgrün (`#A5D6A7`):* Buchungsspezifische Systemaktionen (Instanzerzeugung und Persistierung der `Buchung`-Instanz gemäß Koordinator-Muster).
- *Hellrot (`#FFD7D7`):* Fehler- und Warnpfade (Duplikate gefunden, Gerät nicht verfügbar).

Entscheidungsknoten (Rauten) kennzeichnen Verzweigungen, Schleifenkonstrukte (`while/endwhile`) die `0..*`-Multiplizitäten wiederholbarer Eingaben.

#figure(image("../assets/Aktivitaetsdiagramm_Anlegen.png", height: 90%), caption: [Aktivitätsdiagramm 1: Gerät anlegen]) <fig:ad_anlegen>

#pagebreak(weak: true)

#figure(image("../assets/Aktivitaetsdiagramm_Buchen.png", width: 100%), caption: [Aktivitätsdiagramm 2: Gerät für Arbeitsauftrag buchen]) <fig:ad_buchen>

== Diagrammbetrachtung: Gerät anlegen und buchen

Die in @fig:ad_anlegen und @fig:ad_buchen dargestellten Diagramme beschreiben den Ablauf vom Anlegen eines Geräte-Typs über die Instanziierung eines konkreten Geräts (Aktivität 1) bis zur Buchung für einen Arbeitsauftrag (Aktivität 2). Die folgenden Absätze beschreiben die einzelnen Bildbereiche.

*Phase A: Geräte-Typ anlegen*

Der Verwaltungsmitarbeiter öffnet die Geräteverwaltung, wählt "Neuen Geräte-Typ anlegen" und erfasst die Pflichtfelder (orangefarbene Knoten). Die Validierungsschleife ("Pflichtfelder unvollständig?") wird vom System verantwortet (hellgrüner Knoten); bei Lücken wechselt die Kontrolle zurück zum Benutzer -- die Aufteilung auf zwei Swimlanes macht die Rollentrennung zwischen Eingabe und Prüfung sichtbar.

Nach valider Eingabe befragt das System die Datenbasis (hellblau) und der Entscheidungsknoten implementiert die Duplikatsprüfung (LF 100): Bei einem Treffer verzweigt der Ablauf in den Warnpfad (hellrot) mit Abbruch-Endknoten (Administrator-Override als `<<extend>>`), andernfalls wird die `Geräte-Typ`-Instanz erzeugt, persistiert und bestätigt.

*Phase B: Konkretes Gerät anlegen*

Der Anlegevorgang eines konkreten Geräts beginnt mit der Lagerauswahl. Das System lädt die bestehende Lagerliste (hellblauer Knoten). Der Entscheidungsknoten "Passendes Lager vorhanden?" führt bei positivem Ergebnis direkt zur Auswahl aus der Liste. Andernfalls erfasst der Verwaltungsmitarbeiter Bezeichnung und Adresse des neuen Lagers; die Datenbasis lädt bestehende Lager und das System führt eine Duplikatsprüfung gemäß LF 100 auf `(Bezeichnung, Adresse)` durch. Erst nach negativem Duplikatstreffer erzeugt das System die `Adresse`- und `Lager`-Instanzen sequenziell und persistiert das Lager. Diese lineare Modellierung -- Eingabe, Duplikatsprüfung, Instanzerzeugung, Persistierung -- entspricht sowohl dem Pseudocode LAGER-AUSWAEHLEN-ODER-ANLEGEN (siehe @lst:lager) als auch der tatsächlichen Kontrollfluss-Semantik einer klassischen Eingabemaske.

Die zweite Validierungsschleife ("Pflichtfelder unvollständig?") entspricht strukturell der ersten; erfasst werden Gerätenummer, Seriennummer, Anschaffungsdatum und Wartungstermin. Es folgt eine erneute Duplikatsprüfung, diesmal auf Seriennummernebene (LF 100), da Seriennummern global eindeutig sein müssen. Das Ergebnis wird wiederum über einen Entscheidungsknoten verzweigt; im Duplikat-Fall endet der Ablauf mit einem Abbruch-Endknoten.

Nach erfolgreicher Prüfung erzeugt das System die `Gerät`-Instanz (hellgrüne Knoten), ordnet ihr den zuvor angelegten `Geräte-Typ` und das ausgewählte `Lager` zu und setzt den initialen Gerätestatus auf `VERFUEGBAR`. Der anschließende Entscheidungsknoten "Zubehör wird ergänzt?" leitet optional in eine Schleife für die Ausrüstungserfassung, die das Baugruppe-Muster aus dem Klassendiagramm direkt widerspiegelt: Jede `Ausrüstungs`-Instanz wird erzeugt und dem Gerät zugeordnet; die Schleife läuft, solange der Benutzer weiteres Zubehör ergänzen möchte.

*Phase C: Buchungsvorgang*

Mit dem Wechsel der aktiven Swimlane auf den Bau-/Projektleiter beginnt die dritte Phase. Der Bau-/Projektleiter öffnet die Buchungsverwaltung und wählt Gerät sowie Buchungszeitraum aus. Die anschließende *Verfügbarkeitsprüfung* ist als Sequenz aus zwei Aktionen in verschiedenen Swimlanes modelliert: Die Datenbasis liefert die bestehenden Buchungen für das ausgewählte Gerät (hellblauer Knoten in der Datenbasis-Lane), und das System prüft auf Zeitraumkollisionen (hellblauer Knoten in der System-Lane). Diese Aufteilung macht deutlich, dass Datenabfrage und Prüflogik konzeptuell getrennte Verantwortlichkeiten sind -- konsistent zur `<<include>>`-Beziehung im Use-Case-Diagramm (vgl. Kapitel "Use-Case-Diagramm").

Der Entscheidungsknoten "Gerät im Zeitraum verfügbar?" verzweigt den Ablauf: Bei Nichtverfügbarkeit kann der Bau-/Projektleiter optional eine Alternativsuche nach Geräten desselben Typs anstoßen. Diese zweite Entscheidung modelliert eine benutzergesteuerte Fortsetzungsmöglichkeit, die ein vollständiges Abbrechen des Vorgangs vermeidet. Bei Verfügbarkeit -- oder nach erfolgreicher Alternativauswahl -- lädt die Datenbasis die Auftragsliste, und der Bau-/Projektleiter wählt den zugehörigen Arbeitsauftrag.

Den Abschluss bildet die Erzeugung der `Buchungs`-Instanz durch das System (dunkelgrüne Knoten), die das Koordinator-Muster realisiert: Die Buchung verknüpft `Gerät` und `Arbeitsauftrag`, erhält den ausgewählten Zeitraum als Parameter, den Status `AKTIV` und wird persistiert. Der `GerätStatus` bleibt dabei unverändert (Begründung siehe unten, Listing 4.2.4).

*Reflexion und ehrliche Einordnung*

Das Aktivitätsdiagramm abstrahiert an einigen Stellen bewusst von Implementierungsdetails: Die Kompaktheit einzelner "Attribute eintragen"-Knoten überdeckt die feingliedrige Struktur der zugrunde liegenden Attribute; deren vollständige Auflistung ist der Q&A-Analyse und dem Klassendiagramm zu entnehmen. Außerdem wurde die Archivierung eines Geräts oder das Stornieren einer Buchung bewusst ausgeklammert: Diese Szenarien werden durch das im Sequenzdiagramm (vgl. @fig:sd_auftrag) eingeführte Unterprogramm "Status setzen" abgedeckt und hätten das vorliegende Diagramm über ein handhabbares Maß hinaus verlängert.

== Pseudocode: Gerät anlegen und buchen

Der folgende Pseudocode ergänzt das Aktivitätsdiagramm um eine textuelle Beschreibung des Kontrollflusses. Konsistent zu den Listings 4.1.1 bis 4.1.5 werden Kontrollwörter (BEGINN/ENDE, WENN/DANN/SONST/ENDE WENN, WIEDERHOLE/BIS, SOLANGE/ENDE SOLANGE, FUEHRE AUS, GEBE ... ZURUECK, EMPFANGE) in Großbuchstaben ohne Umlaute geschrieben; operative Verben innerhalb einer Aktion (Setze, Persistiere, Lade, Ordne ... zu) folgen der ergonomischen Konvention einer natürlichsprachigen Aktivitätsbeschreibung in gemischter Groß-/Kleinschreibung. Gemeinsam genutzte Unterprogramme (OBJEKT-ANLEGEN, DUPLIKATSPRUEFUNG, STATUS-SETZEN) werden per `FUEHRE AUS` referenziert, ohne sie hier zu wiederholen.

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

Das Unterprogramm LAGER-AUSWAEHLEN-ODER-ANLEGEN kapselt die im Aktivitätsdiagramm sequenziell dargestellte Verzweigung "passendes Lager vorhanden ja/nein" als WENN/SONST-Konstrukt. Ergänzend wird an dieser Stelle die im Lastenheft (LF 100) geforderte Duplikatsprüfung explizit auch für Lager durchgeführt: Der Vergleich von Bezeichnung und Adresse verhindert die versehentliche Doppelanlage eines Lagers.

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
