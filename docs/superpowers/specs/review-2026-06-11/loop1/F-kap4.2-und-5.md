# Loop 1 — Subagent F: Kap 4.2 Aktivitätsdiagramm + Kap 5 MVC

# Teil 1: Kap 4.2 Aktivitätsdiagramm

## Aktionen im AD (laut PUML / Bild)

**Phase A — Geräte-Typ anlegen:**
Gerätemanagement öffnen → Neuen Geräte-Typ wählen → (DB) Bestehende Geräte-Typen laden → Entscheidung "Geräte-Typ existiert bereits?" → bei ja: Warnung + Eingabe korrigieren/abbrechen → stop. Sonst: Pflichtfelder eingeben → Eingaben validieren (System) → Schleife "Pflichtfelder unvollständig?" mit Korrektur-Validierung → Geräte-Typ-Instanz erzeugen → (DB) persistieren / Bestätigung → Bestätigung anzeigen.

**Phase B — Konkretes Gerät anlegen:**
Neues Gerät anlegen → (System) Lagerliste laden → Entscheidung "Passendes Lager vorhanden?" → nein: Fork/Join (Eingabe Lagerdaten || System: Lager-Instanz erzeugen → (DB) persistieren) → ja: Lager auswählen → Pflichtfelder eingeben → Validierung + Schleife → (DB) Bestehende Geräte laden → Entscheidung "Seriennummer bereits vorhanden?" → ja: Warnung → stop. Sonst: Gerät-Instanz erzeugen → Geräte-Typ zuordnen → Lager zuordnen → Status "Verfügbar" → Entscheidung "Zubehör?" → ja: Ausrüstungsdaten eingeben + Ausrüstungs-Instanz erzeugen → Schleife "Weiteres Zubehör?" → (DB) Gerät persistieren / Bestätigung → Bestätigung anzeigen.

**Phase C — Buchung:**
Buchungsverwaltung öffnen → Gerät + Zeitraum wählen → (DB) Buchungen laden → (System) Verfügbarkeit prüfen → Entscheidung "verfügbar?" → nein: Hinweis → "Alternative suchen?" → ja: Geräte desselben Typs laden + alternatives Gerät auswählen / nein: stop. Sonst: (DB) Auftragsliste laden → Arbeitsauftrag auswählen → Buchungs-Instanz erzeugen + Gerät/Auftrag zuordnen + Buchungs-Status "Aktiv" + Geräte-Status "Gebucht" → (DB) Buchung persistieren / Geräte-Status persistieren / Bestätigung → Bestätigung anzeigen → stop.

## Swimlanes (PUML)
1. Verwaltungsmitarbeiter, 2. Bau-/Projektleiter, 3. System (UI Bauverwaltung), 4. Datenbasis. Text Z. 15 nennt dieselben vier — konsistent.

## DIFFERENZ Bild ↔ Text

**KRITISCH 1 — "Lagerliste laden" in System-Lane statt Datenbasis-Lane.**
PUML Z. 83–84: `|System (UI Bauverwaltung)| :Lagerliste laden;` mit Farbe `#CFE3F3` (laut Legende "prüfende Datenbankoperationen, Listenabfragen"). Analoge Aktionen "Bestehende Geräte-Typen laden" (Z. 46–47) und "Bestehende Geräte laden" (Z. 112–113) liegen in der Datenbasis-Lane. Lane-Zuordnung verletzt selbst gesetzte Konvention.

**KRITISCH 2 — "Auftragsliste laden" mit oranger Farbe (Benutzeraktion):**
PUML Z. 181–182: `|Datenbasis| :Auftragsliste laden; <<#FFE3B0>>` (orange = Benutzeraktion laut Z. 26). Eine DB-Ladeoperation muss `#CFE3F3` sein. Klarer Farbfehler.

**KRITISCH 3 — "Bestehende Geräte laden" für Seriennummer-Duplikatsprüfung:**
PUML Z. 112–113: Aktion heißt "Bestehende Geräte laden". Pseudocode Listing 4.2.1 Z. 26: `FUEHRE DUPLIKATSPRUEFUNG mit Seriennummer AUS`. Diagramm-Aktion sollte präzisere Bezeichnung tragen ("Seriennummern laden" o. Ä.).

**WICHTIG 4 — "Bestätigung"-Knoten in Datenbasis-Lane** (Z. 71–72, 145–146, 196–197 PUML) tauchen als eigene Aktionsknoten auf, werden im Text nicht als solche aufgelistet. Wären besser als Pfeil-Beschriftung modelliert.

**WICHTIG 5 — Doppelte Validierung vor und in Schleife:** PUML Z. 59 + 65 (Phase A) und Z. 103 + 109 (Phase B) zeigen "Eingaben validieren" sowohl vor der `while`-Schleife als auch innerhalb. Im Text nicht thematisiert.

**WICHTIG 6 — Fork/Join-Detail im Text inkomplett:** Text Z. 48 beschreibt linken Fork-Pfad als Verwaltungsmitarbeiter-Eingabe und rechten als Systemreaktion. Im PUML (Z. 88–95) enthält der rechte fork-Pfad zwei Swimlane-Wechsel (System → Datenbasis: Lager persistieren). Diese Mehrfach-Lane innerhalb eines Fork-Zweigs ist im Bild schwer lesbar und im Text nicht erwähnt.

**WICHTIG 7 — Adresse-Anlegen:** PUML Z. 92 fasst "Lager-Instanz erzeugen (Lager + Adresse)" zu einer Aktion zusammen. Pseudocode Listing 4.2.2 Z. 7–8 trennt `OBJEKT-ANLEGEN mit Klasse Adresse` und `OBJEKT-ANLEGEN mit Klasse Lager`. Diagramm und Pseudocode inkonsistent.

**MINOR 8 — Geräte-Status-Persistierung in Phase C** (PUML Z. 192, 196) verwendet Hellgrün statt Dunkelgrün (Buchung). Korrekt nach Konvention, aber Text Z. 60 ("dunkelgrüne Knoten") verschweigt die zwei hellgrünen Knoten innerhalb der Buchungsphase.

## Pseudocode-Form
- Nummerierte Zeilen, deutsche Keywords ohne Umlaute (BEGINN, ENDE, WENN/DANN/ENDE WENN, SOLANGE, FALLS/ENDE-FALLS, FUEHRE … AUS, WIEDERHOLE/BIS, EMPFANGE, GEBE) — passt zur CLAUDE.md-Vorgabe.
- Schlüsselwörter Großbuchstaben (nicht fett) — laut CLAUDE.md zulässig ("fett **oder** Großbuchstaben").
- **Tippfehler Listing 4.2.1 Z. 21:** `Geraenummer` → `Geraetenummer`.
- **Listing 4.2.3 Z. 4:** `SOLANGE noch nicht geprueft gebuchte Zeitraeume vorhanden:` — unidiomatisch; gemeint: "noch ungeprüfte Buchungs-Zeiträume". Außerdem fehlt im Schleifenkörper ein Iterationsfortschritt; Logik ist hand-wavy.
- **Listing 4.2.1, mehrfach (Z. 9, 27, 46, 80):** Semikolon hinter Bedingung vor `DANN` ist Stilbruch zu sonstigen Listings, akzeptabel.

## Leere Datenbasis & referenzierte Elemente
Leere Datenbasis explizit angenommen (Z. 8). Geräte-Typ, Lager, Adresse, Gerät, Ausrüstung, Buchung werden alle im Szenario angelegt. Zubehör (Ausrüstung) und Lager-Adresse abgedeckt. Standort ≈ Lager-Adresse — okay. Arbeitsauftrag wird per Vereinfachung Z. 10 ausgelagert.

## Reflexion am Ende?
Vorhanden Z. 62–64 ("Reflexion und ehrliche Einordnung") — Fork/Join-Vereinfachung und Auslassung des Storno-Szenarios diskutiert. Erfüllt CLAUDE.md.

## Kritisch
- "Lagerliste laden" in System-Lane statt Datenbasis-Lane (PUML Z. 83).
- "Auftragsliste laden" Farbe orange statt blau (PUML Z. 182).
- "Bestehende Geräte laden" als Bezeichnung für Seriennummer-Duplikatsprüfung (PUML Z. 113).

## Wichtig
- Doppel-"Eingaben validieren" vor und in `while` (Z. 59+65, 103+109) im Text nicht erläutert.
- Eigenständige "Bestätigung"-Knoten in DB-Lane (Z. 71, 145, 196) unkommentiert.
- Adresse-Anlegen zwischen Bild und Pseudocode inkonsistent (1 Aktion vs. 2 Aktionen).

## Stil / Fluff
- Z. 56: doppelter Verweis auf Use-Case (`<<include>>` und `(vgl. Kapitel "Use-Case-Diagramm")`).
- Z. 138: "ein zentrales Ziel der Unterprogramm-Modellierung" — Selbstlob.
- Z. 162: wiederholt fast wörtlich Z. 64.
- Z. 184: "ohne Codeduplizierung" — leicht werblich.

## Tippfehler / Grammatik
- Listing 4.2.1 Z. 21: `Geraenummer` → `Geraetenummer`.
- Listing 4.2.3 Z. 4: "noch nicht geprueft gebuchte Zeitraeume" → besser "noch nicht geprüfte Buchungs-Zeiträume".

---

# Teil 2: Kap 5 MVC

## Klassen im Kommunikationsschema (PUML/Bild)
- **View (eigene):** MainFrame, Sidebar, AufträgeÜbersichtPanel, SuchleisteView, AuftragsTabelleView
- **View (Java-Swing extern, Vererbungs-Eltern):** JFrame, JPanel, JTable, AbstractTableModel
- **View (Java-Swing weitere):** JTextField, JComboBox, JTabbedPane, JButton, JToggleButton, JLabel, JProgressBar, JScrollPane
- **Event:** IFilterListener, IAuftragSelectionListener, IUpdateEventListener, IUpdateEventSender, FilterChangedEvent (datatype), UpdateEvent (datatype)
- **Controller:** GUIController «singleton», AufträgeController, AuftragsTableModel
- **Model:** Datenbasis «singleton», Arbeitsauftrag, FilterCriteria «datatype»

## Im Text erwähnt
Alle View-, Event-, Controller-, Model-Klassen werden im Fließtext genannt (Z. 20–24, 43, 49–51, 55–57, 61–63).

## DIFFERENZ Bild ↔ Text

**KRITISCH 1 — Datenbasis realisiert IUpdateEventSender im Text, nicht im PUML:**
Text Z. 57 ("Realisation der Schnittstelle `IUpdateEventSender` durch die `Datenbasis`") und Z. 61 ("`IUpdateEventSender` als Gegenstück, das die `Datenbasis` realisiert"). Im PUML (Z. 187–196) hat `Datenbasis` die Methoden `register/unregister/fireUpdate`, aber **keine Realisations-Kante** `Datenbasis ..|> IUpdateEventSender`. Behauptung im Text ist im Modell nicht eingezeichnet. → Pfeil ergänzen.

**KRITISCH 2 — Sidebar als IUpdateEventListener im Text, nicht im PUML:**
Text Z. 75: "sowie die `Sidebar` mit ihrer Auftragszählung über die Aktualisierung informiert". `Sidebar` (PUML Z. 70–72) realisiert keine `IUpdateEventListener`-Schnittstelle. Inkonsistent — entweder Realisation ergänzen oder Aussage zurücknehmen.

**KRITISCH 3 — swe-utils nicht integriert:**
CLAUDE.md fordert (Aufgabe 3.3): "swe-utils Java-Bibliothek integrieren". Text erwähnt swe-utils nur einmal in Z. 84 als Klammerbeispiel ("z. B. _FlatLaf_ oder _swe-utils_") in einer hypothetischen Erweiterung. Im Klassendiagramm taucht swe-utils nicht auf. Spürbare Lücke gegenüber Aufgabenstellung.

**WICHTIG 4 — `notifyViews()` im PUML, nicht im Text:**
PUML Z. 163: `AufträgeController.notifyViews()` — im Text und Nachrichtenfluss nicht aufgerufen. Toter Member oder Erläuterungslücke.

**WICHTIG 5 — `IFilterListener` 3 Methoden vs. Text 1:**
PUML Z. 110–114 definiert `onFilterChanged`, `onSearchTextChanged`, `onTabChanged`. Text Z. 49 nennt nur `onFilterChanged` (sowie `onAuftragSelected` und `onNeuerAuftrag`, die aber zu anderen Schnittstellen/Klassen gehören). Saubere Zuordnung fehlt.

**WICHTIG 6 — Cross-Package-Vererbung AuftragsTableModel → AbstractTableModel:**
PUML Z. 231: Controller-Klasse erbt von Klasse aus View-Sub-Paket "Java-Swing". Text Z. 51 erwähnt das, reflektiert aber nicht die MVC-Schichtenverletzung. Sollte explizit als pragmatischer Java-Swing-Bruch gerechtfertigt werden.

**WICHTIG 7 — JLabel-Trefferanzahl nur im Text:**
Text Z. 75: AufträgeÜbersichtPanel "weist die Trefferanzahl in einem `JLabel` aus". Im PUML hat das Panel keine Komposition zu `JLabel`. Detail.

**WICHTIG 8 — FilterChangedEvent → FilterCriteria** überspringt strukturelle Schichtenstapelung (PUML Z. 240): Event-Klasse hält Model-Datatype. Text Z. 57 erwähnt das beiläufig, nicht als bewusste Designentscheidung.

## MVC-Pattern korrekt?
Im Wesentlichen ja: Pakete getrennt, Beobachter über Listener-Schnittstellen, Singleton für GUIController + Datenbasis. Schwächen: (a) `Datenbasis ..|> IUpdateEventSender` fehlt, (b) AbstractTableModel-Vererbung kreuzt Schichten, (c) Sidebar als Beobachter behauptet, aber nicht modelliert.

## Bezug zur konkreten GUI?
Sehr klar: Auftragsübersicht aus Abschnitt 3.3, mit zweitem Mockup zum Java-Swing-Mapping (Z. 13–24). Stark.

## swe-utils erwähnt?
Nur als Nebenerwähnung in Z. 84. Keine echte Integration. **Lücke.**

## Kritisch
- `IUpdateEventSender`-Realisation fehlt im Bild, wird im Text behauptet.
- swe-utils-Integration nicht umgesetzt (CLAUDE.md-Anforderung 3.3).
- Sidebar-Beobachter-Diskrepanz zwischen Text Z. 75 und PUML.

## Wichtig
- `notifyViews()` ohne Verwendung im Text.
- `IFilterListener` mit 3 Methoden, Text deckt nur eine ab.
- Methodenzuordnung in Z. 49 mischt Schnittstellen- und Klassen-Methoden ohne Kennzeichnung.
- AuftragsTableModel→AbstractTableModel: Cross-Package-Inheritance unkommentiert.

## Stil / Fluff
- "Abschnitt 3.3" wird in Z. 5, 7, 13, 26, 84 wiederholt.
- Z. 9: "in den als Referenz herangezogenen Programmentwürfen vorhergehender Studienjahrgänge bewährt ist" — werblich, kürzbar.
- Z. 30 ist ein extrem langer Block-Absatz; aufspalten.
- Reflexion (Z. 86, 88) wiederholt fast wörtlich Argumente aus Z. 51 und Z. 63 — Redundanz.

## Tippfehler / Grammatik
- **Z. 9:** "verliert" → "verlieren" (Plural-Subjekt: Entwurfsklassendiagramm + Kommunikationsschema).
- **Z. 76:** "Sidebar spiegelt … Kennzahlen" — fehlt "wider".
- **Z. 20:** "Markenkennzeichnung" → "Markenname"/"Markenbezeichnung".
- **Z. 51:** "Java-Swing-eigenen Klasse" → schlanker "Java-Swing-Klasse".
- **Z. 57:** "Realisation" → "Realisierung" üblicher.
- **Z. 16:** Pfad mit Umlauten (`AufträgeÜbersichtJavaSwing.png`) — funktioniert in Typst, kann in Build-CI brechen.

## Anmerkungen
- **AD reparabel mit kleinen PUML-Edits:** 3 Lane-/Farb-Inkonsistenzen, 2 Pseudocode-Tippfehler.
- **MVC braucht zwei Modell-Edits:** `Datenbasis ..|> IUpdateEventSender` und `Sidebar ..|> IUpdateEventListener` ergänzen.
- **swe-utils-Integration** ist die größte Bewertungslücke gegenüber CLAUDE.md.
- **Reflexion-Abschnitt MVC** redundant zu Hauptbeschreibung — straffen.
- Kapitel 4.2 H1 (`= Aktivitätsdiagramm`) ohne Kapitelpräfix — prüfen ob im `main-Programmentwurf.typ` korrekt eingebunden.

---

**Zusammenfassung**: 
- Kap 4.2: 3 kritisch, 4 wichtig, 4 stil, 2 tippfehler.
- Kap 5: 3 kritisch, 5 wichtig, 4 stil, 6 tippfehler/grammatik.
