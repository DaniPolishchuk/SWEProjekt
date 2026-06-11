# Konsolidierter Befundbericht — Programmentwurf Verwaltungssoftware Bauunternehmen

**Datum:** 2026-06-11
**Methodik:** 3 Loops mit insgesamt 10 parallel-/sequentiell laufenden Subagents
**Ziel:** Konsistenz, Bild/Text-Übereinstimmung, fragwürdige Aussagen, konservative Kürzungen
**Quellberichte:** `loop1/A-F`, `loop2/G-I`, `loop3/J` (im selben Verzeichnis)

---

## 0. Top-Befunde auf einen Blick

| # | Befund | Schwere | Ort |
|---|---|---|---|
| 1 | Klassendiagramm: Komposition `Ausrüstung` an `Lager` statt an `Gerät` (Baugruppe-Muster) | **🔴 kritisch** | Klassendiagramm.puml:243; widerspricht Text + UC + AD + Mockup |
| 2 | **Besonderheiten-Kapitel fehlt komplett** (CLAUDE.md fordert 6-10 Punkte) | **🔴 kritisch** | main-Programmentwurf.typ:69-83 |
| 3 | **swe-utils nicht integriert** (CLAUDE.md fordert es) | **🔴 kritisch** | Kap 5 nur Nebenerwähnung |
| 4 | Profhinweise aus `Klassendiagramm_Fix_This.pdf` nicht abgearbeitet (3 Punkte) | **🔴 kritisch** | Klassendiagramm |
| 5 | SD-Hauptdiagramm zeigt **keinen Löschvorgang**, Caption + Text behaupten ihn | **🔴 kritisch** | 4.1_Sequenzdiagramm_Auftrag.typ:32+64-68 |
| 6 | `:Buchung`-Lebenslinie fehlt in SD/Lösch-SD trotz Referenzen | **🔴 kritisch** | SD-PUMLs |
| 7 | Statusfarben Mockup ↔ Text widersprüchlich an drei Stellen (Z.24/66/170) | **🔴 kritisch** | 3.3_GUI-Mockups.typ |
| 8 | Anzahl Rollen 4 vs. 5 widersprüchlich; Tabelle Z.265-292 vs. Z.342 | **🔴 kritisch** | 1_Aufgabenstellung.typ |
| 9 | n:m vs. 1:n bei Arbeitsauftrag↔Projekt (drei verschiedene Aussagen) | **🔴 kritisch** | KlD-Text vs. PUML vs. UC |
| 10 | Mockup zeigt Daten ohne Modellunterstützung: Kunde, Kostenvoranschlag/Prognose, Termin↔Buchung | **🔴 kritisch** | mehrere |

---

## 1. Sortiert nach Schweregrad

### 🔴 KRITISCH — vor Abgabe zwingend zu fixen

#### 1.1 Klassendiagramm (Kap 3.2)

- **Baugruppe falsch verortet** (Loop-1-C, Loop-2-G/H/I): PUML Z.243 hat `Lager *-- Ausruestung`, sollte `Geraet *-- Ausruestung` sein. Text, UC, AD, Mockup beschreiben Bagger+Schaufel.
- **Arbeitsauftrag↔Projekt**: 1:n im PUML Z.227, n:m im Text Z.59, „Referenz" im UC. Eine Variante festlegen.
- **Termin↔Buchung-Assoziation fehlt** im PUML, wird aber von Text Z.75, AD/SD und Mockup Terminplaner referenziert.
- **Bild-Multiplizitäten** Projekt/Gerät: PUML Z.252-253 hat `0..*—0..*`, Text behauptet `1 *-- 0..*` Komposition.
- **Arbeitsauftrag→Bild**-Beziehung im PUML komplett fehlend, im Text als Liste-Muster aufgeführt.
- **Zwischentermin-Attribut** bei `Arbeitsauftrag` im PUML entfallen, Text/SD erwähnen es noch.
- **Status-Wertebereich nicht modelliert** für 7 Klassen (Projekt/Arbeitsauftrag/Unterauftrag/Rechnung/Geraet/Ausruestung/Buchung). SD_StatusSetzen Z.41-43 behauptet, der Wertebereich sei „im KlD festgelegt" — ist faktisch falsch.
- **Status-Schreibweise** inkonsistent: PUML/PNG „Gelöscht" (Umlaut), Pseudocode „Geloescht" (ASCII).
- **Profhinweise aus `Klassendiagramm_Fix_This.pdf`** nicht abgearbeitet: Baugruppe an Gerät, Auftrag-Projekt-Kardinalität, Bild-Komposition.

#### 1.2 Use-Case-Diagramm (Kap 3.1)

- Beschreibungstext fehlt für UCs „Geräte verwalten" (Z.108), „Gerät anlegen" (Z.170), „Verfügbarkeit prüfen".
- EP-Liste 6 Punkte vs. nur 5 `<<extend>>`-Pfeile in Kompaktansicht.
- Singular/Plural „Buchung verwalten" (EP) vs. „Buchungen verwalten" (UC) inkonsistent.
- UML-Verstoß: `<<include>>` für optionale „Ausrüstung zuordnen" sollte `<<extend>>` sein.
- Verfeinerung „Gerät anlegen" hat 14 UCs (>10 Vorlesungsregel).
- „Gerätetyp auswählen" und „Auf Duplikate prüfen" isoliert ohne `<<include>>`/`<<extend>>`.

#### 1.3 GUI-Mockups (Kap 3.3)

- **Filterchips Dashboard**: Bild „Alle/In Arbeit/Verzug" vs. Text Z.48 „Alle/Hochbau/Tiefbau/Verzug".
- **Statusfarben AuftragsÜbersicht**: Bild zeigt „In Arbeit"=blau, „Pausiert"=gelb, „Planung"=grün, Text Z.66 behauptet „Geplant"=blau, „In Arbeit"=gelb, „Pausiert"=orange, „Abgeschlossen"=grün.
- **Statusfarben-Konvention an drei Stellen widersprüchlich** (Z.24 Designphilosophie, Z.66 Auftragsübersicht, Z.170 Terminplaner).
- **Mitarbeiter-Mockup Z.190**: „Auswahlkästchen am Zeilenanfang" — Bild zeigt sie am Zeilenende.
- **Terminplaner Z.168**: „Heute"-Schaltfläche und zweiter Umschalter für Urlaube im Bild nicht sichtbar.
- **Mockup-Rollensicht-Widerspruch**: Z.27 behauptet „Sicht eines Bauleiters", aber Mitarbeiter-Mockup wäre laut UC nur Verwaltungsmitarbeiter.

#### 1.4 Sequenzdiagramm (Kap 4.1)

- **Hauptdiagramm zeigt KEINEN Löschvorgang**, Caption + Z.36 + Z.64-68 behaupten ihn jedoch (mit Nachrichten 10 ff. und Trennlinie).
- **`:Buchung`-Lebenslinie fehlt** in Hauptdiagramm und Lösch-SD, obwohl Text Z.19/66/100 sie referenziert.
- **Listing 4.1.2 vs. SD_Unterprogramm_ObjektAnlegen** semantisch inkonsistent: Pseudocode hat keine Attribut-Schleife und keinen Vorhanden-Pfad.

#### 1.5 Aktivitätsdiagramm (Kap 4.2)

- **„Lagerliste laden"** in System-Lane statt Datenbasis-Lane (PUML Z.83) — verletzt eigene Lane-Konvention.
- **„Auftragsliste laden"** mit oranger Farbe (= Benutzeraktion) statt blau (= DB-Operation).
- **Adresse-Anlegen**: AD fasst „Lager-Instanz erzeugen (Lager+Adresse)" zu einer Aktion zusammen, Pseudocode trennt zwei `OBJEKT-ANLEGEN`-Schritte.

#### 1.6 MVC (Kap 5)

- **`Datenbasis ..|> IUpdateEventSender`-Realisation fehlt** im Bild, Text behauptet sie (Z.57, Z.61).
- **`Sidebar` als IUpdateEventListener** im Text Z.75 behauptet, im PUML nicht modelliert.
- **swe-utils nicht integriert** (CLAUDE.md-Anforderung 3.3). Nur Nebenerwähnung Z.84.

#### 1.7 Lastenheftanalyse (Kap 1+2)

- **Anzahl Rollen widersprüchlich**: Tabelle Z.265-292 → 5 Rollen; Z.342 → 4 Rollen.
- **Verwaltungsmitarbeiter-Rechte** Tabelle Z.274 vs. Z.351 verwirrend formuliert.
- **Arbeitsauftrag-Schema fehlt** Lastenheft-LF30-Inhalte: Angebote, Mahnungen, Kostenvoranschläge nicht als Entitäten.
- **Termin-Modellierung zirkulär/leer**: Datums-Attribute als Referenz auf Termin, Termin-Tabelle hat aber keine eigenen Datums-Attribute.
- **Doppelte Überschrift** in `2_Analyse_des_Lastenhefts.typ:25-26`.
- **Ebenenfehler** Z.59: `=== Qualitätsanforderung` springt aus der Hierarchie.

#### 1.8 Kreuzkonsistenz (Loop 2 + 3)

- **Kunde / Auftraggeber fehlt im KlD** — Mockups zeigen ihn durchgängig.
- **Finanzdaten fehlen am Auftrag**: Mockup zeigt KV/Angefallen/Prognose; KlD hat kein `kostenvoranschlag`-Attribut.
- **Auftrag-Fortschritt** überall sichtbar, im KlD nicht modelliert.
- **„Vorlage speichern" / „Neue Rechnung" / Termin-CRUD / „Katalog erweitern"** sind Mockup-Aktionen ohne UC-Pendant.
- **„Bezeichnung" und „Kategorie"** in UC „Gerät anlegen" als Pflicht-Attribute, im PUML aber im `Geräte-Typ` (Inkonsistenz Verfeinerung ↔ KlD).
- **„Standort"** in UC explizit getrennt von Lager — im PUML kein Standort-Attribut.
- **„Terminplaner" als Klasse fehlt** (CLAUDE.md fordert „Terminplaner als einfache Klasse").
- **Altsystem-Importpfad** nicht modelliert: `Altsystem` ohne Assoziation.
- **MVC `Arbeitsauftrag`** Attributnamen weichen vom Analyse-KlD ab (`bezeichnung` vs. `auftragsbezeichnung`, `startdatum` vs. `starttermin`).
- **Akteur-Vererbung im UC-Diagramm** nicht als UML-Pfeil modelliert (Bild-Notiz reicht nicht).

#### 1.9 Strukturell (Loop 3)

- **Besonderheiten-Kapitel fehlt komplett** — beide 1.0-Beispiele schließen damit.
- **Aufgabenstellung-Kapitel und Analyse-Kapitel vermischt** — beide Beispiele trennen klar.
- **Pro Analysemuster fehlt eine separate Detail-Abbildung** (CLAUDE.md fordert es).
- **Vor-/Nachteile-Diskussion pro Unterprogramm fehlt** in SD-Kapitel.

---

### 🟡 WICHTIG — sollte angepasst werden

#### 2.1 Bezeichnungs-Drift (Kap-übergreifend)
- „Finanzbuchhaltungssystem" (UC) vs. „Finanzbuchhaltung" (KlD-Klasse).
- „Bau-/Projektleiter" (UC) vs. „Bauleiter" (Rolle 3.2 Z.45) — Projektleiter fehlt.
- „Kompatibel mit" / „kompatibel-mit" / `kompatibel` — drei Schreibweisen.
- „In Bearbeitung" (Mockup Detail) vs. „In Arbeit" (Mockup Übersicht) vs. „Offen" (SD).
- „Gelöscht" (PUML) vs. „Geloescht" (Pseudocode).
- „Zwischentermin" — Text 3.2 hat es, PUML nicht, UC nicht erwähnt.
- „Beschäftigungsort" (PUML) vs. „Beschäftigungsart" (UC Z.105).

#### 2.2 Diagramm-interne Lücken
- **`buchungsdatum`** (KlD Z.186): in AD/SD nirgends gesetzt — totes Attribut oder fehlende Aktion.
- **`Ausruestung.typ`** (KlD Z.168): im AD-Eingabe-Schritt nicht abgefragt.
- **„Wartungstermin"** in AD Z.101 als Pflichtfeld, aber AD modelliert keinen Termin-Anlegen-Schritt.
- **Listing 4.1.4 STATUS-SETZEN**: Persistenz und Else-Zweig fehlen im Pseudocode, im Bild vorhanden.
- **MVC-Inkonsistenzen**: `notifyViews()` toter Member, `IFilterListener` 3 Methoden im PUML vs. 1 im Text, AuftragsTableModel→AbstractTableModel als MVC-Schichtenverletzung unkommentiert.

#### 2.3 Strukturell / Stil
- **Mockup-Rollensicht** Z.27 zu „Bauleiter" verträgt sich nicht mit Mitarbeiter-Mockup (Verwaltungssicht).
- **Reiter „Wartung" / „Historie"** im Geräte-Mockup haben keine UC-/KlD-Entsprechung.
- **Demodaten-Inkonsistenz**: AuftragDetail zeigt 2023-Daten, alle anderen Mockups 2026.
- **Buchungen.png Demodaten** logisch widersprüchlich („Volvo 23.–25.05. ganztags frei / 24.–25.05. belegt").
- **Reflexion-Block MVC** redundant zur Hauptbeschreibung.

#### 2.4 Lastenheft-Bezüge
- LF 60 (Suchmasken) und LF 90 (Anwesenheitszeiten) im Mockup-Kapitel nicht explizit referenziert.

#### 2.5 Konsistenz-Konventionen
- Operationen im Analyse-KlD fehlen komplett — als bewusste Konvention im Text begründen.
- Datenbasis als implizite Repository-Klasse — sollte einmal explizit gesagt werden.

---

### ⚪ STIL / FLUFF — konservative Kürzungen

#### 3.1 Ganz löschen
- **`chapter/2_Analyse_des_Lastenhefts.typ` (104 Z.)** — Voll-Kopie des Lastenhefts ohne QaA, redundant zu Kap 1.

#### 3.2 Mehrfach-Wiederholungen reduzieren
- „Maximal drei Klicks"-Aussage 4× wiederholt → 1× + Verweise.
- DSGVO + 10-Jahres-Frist 3× wiederholt → 1×.
- „Funktionen nur für Administrator sichtbar" 5× in Kap 3.3 (Z.16/27/50/62/211).
- „Standardkategorien" 2× (Z.622+665).
- „Abschnitt 3.3" 5× in Kap 5 (Z.5/7/13/26/84).
- Verweise auf Beispielarbeiten in Kap 4.1 fünfmal (Z.25/76/104/174/195).

#### 3.3 Verschmelzen / Straffen
- Kap 4.1 Z.38-58 wiederholt Material aus Z.13-21 (Initialinteraktion + Adressen).
- Drei Import-/Export-Fragen Z.204-228 zu zweien zusammenfassen.
- Kap 5 Z.30 sehr langer Block-Absatz aufspalten.

#### 3.4 Reduzierte Vereinfachungs-/Reflexions-Listen
- Kap 4.1 Z.5: 6 Vereinfachungs-Bulletpoints — Punkte 2 und 3 (Datenbankfehler/Nebenläufigkeit) kürzbar.
- Kap 3.3 Diskussion Z.207-213 zu generisch — konkrete Bezüge schaffen oder kürzen.

---

### ✏️ TIPPFEHLER / GRAMMATIK (gezielte Quick-Fixes)

| Datei | Zeile | Fehler | Korrektur |
|---|---|---|---|
| 1_Aufgabenstellung.typ | 181 | „zeitglichen" | „zeitgleichen" |
| 1_Aufgabenstellung.typ | 356 | „Arbeitsauträge" | „Arbeitsaufträge" |
| 1_Aufgabenstellung.typ | 622 | „Kategorieattribut.." | ein Punkt |
| 1_Aufgabenstellung.typ | 764 | „sind sollen" | eines streichen |
| 1_Aufgabenstellung.typ | 771 | „Maximal große 5" | „Maximal 5 große" |
| 1_Aufgabenstellung.typ | 1018 | „gesätzlichen" | „gesetzlichen" |
| 1_Aufgabenstellung.typ | 432/119 | „Desktoprechnern" | „Desktoprechner" (Nominativ) |
| 1_Aufgabenstellung.typ | 408-411 | TODO-Kommentare im Output | entfernen (auch Z.405/553/604) |
| 3.1_UseCase-Diagramm.typ | 64 | „User-Case" | „Use-Case" |
| 3.1_UseCase-Diagramm.typ | 72 | „Verwaltungsmitarbeiten" | „Verwaltungsmitarbeiter" |
| 3.1_UseCase-Diagramm.typ | 105 | „anhand von den Attributen" | „anhand der Attribute" |
| 3.1 (Bild-Notiz) | — | „Akteure erben vom Akteure erben vom" | Doppelung entfernen |
| 3.1 (Bild-Notiz) | — | „im folgenden" | „im Folgenden" |
| 3.2_Analyse-Klassendiagramm.typ | 91 | „z.B." | „z. B." |
| 3.2_Analyse-Klassendiagramm.typ | 118 | „Standort" als Instanz-Attribut | als Assoziation formulieren |
| 3.3_GUI-Mockups.typ | 168 | „eine dreistufige Umschalter" | „ein dreistufiger Umschalter" |
| 3.3_GUI-Mockups.typ | 172 | „(Hr. Richter)" | „Herr Richter" |
| 4.1_Sequenzdiagramm_Auftrag.typ | 17 | „Auftragsbezeichnung" | mit PUML „Bezeichnung" abstimmen |
| 4.2 Listing 4.2.1 | 21 | „Geraenummer" | „Geraetenummer" |
| 4.2 Listing 4.2.3 | 4 | „noch nicht geprueft gebuchte Zeitraeume" | „noch nicht geprüfte Buchungs-Zeiträume" |
| 5_GUI-Modellierung-MVC.typ | 9 | „verliert" | „verlieren" |
| 5_GUI-Modellierung-MVC.typ | 76 | „spiegelt … wider" — fehlt „wider" | ergänzen |
| 5_GUI-Modellierung-MVC.typ | 20 | „Markenkennzeichnung" | „Markenname" |

---

## 2. Sortiert nach Kapitel (Schnellnavigation)

### Kap 1 (1_Aufgabenstellung.typ)
- 🔴: Rollen 4 vs. 5; Arbeitsauftrag-Schema unvollständig (LF30); Termin-Modellierung leer
- 🟡: Verwaltungsmitarbeiter-Rechte; Person-Adresse als Erweiterung; VPN-Aussage; Verweisfehler `referenceQ`; TODO-Kommentare; Frage-Antwort-Mismatch (Fahrzeuge); Rechnung vor Lastenheft-Kontext
- ⚪: 4× „drei Klicks"; 3× DSGVO; 2× Standardkategorien
- ✏️: 10 Tippfehler

### Kap 2 (2_Analyse_des_Lastenhefts.typ)
- 🔴: Doppelte Überschrift; Ebenenfehler `=== Qualitätsanforderung`
- ⚪: **Kandidat zum kompletten Löschen** (Voll-Kopie des Lastenhefts ohne QaA)

### Kap 3.1 (UseCase)
- 🔴: 3 UCs ohne Beschreibungstext; EP-Liste 6 vs. 5 Pfeile; Sing/Plur Buchung; `<<include>>` falsch; 14 UCs in Verfeinerung; isolierte UCs ohne include/extend; UC-Templates fehlen
- 🟡: Akteurkopf falsch (FiBu); Akteur-Vererbung nicht als UML; Schreibrechte vs. Lese-UC „Terminplaner"; „aktuelle/zukünftige" + „abgeschlossen"
- ⚪: „verwalten"-Konvention nicht erklärt; Notationserklärung erweitern
- ✏️: 16 Tippfehler

### Kap 3.2 (Klassendiagramm) — 🔴 hochkritisch
- 🔴: **Baugruppe an Lager statt Gerät**; **Arbeitsauftrag↔Projekt 1:n vs. n:m**; **Termin↔Buchung fehlt**; **Bild-Multiplizitäten**; **Arbeitsauftrag→Bild fehlt**; **Zwischentermin entfallen**; **Status-Wertebereich nicht modelliert** (7 Klassen); **Profhinweise nicht abgearbeitet**
- 🟡: `buchungsdatum`/`typ` toten Attribute; Altsystem/Drucker ohne Beziehungen; Vererbung Unterauftragnehmer; Klassen-Konvention `(Berechtigungsklasse)`; Operationen fehlen ohne Begründung
- ⚪: Strukturierte Aufzählungen vereinfachen
- ✏️: 3 Tippfehler

### Kap 3.3 (Mockups)
- 🔴: Filterchips Dashboard; Statusfarben 3 Stellen; Mitarbeiter-Auswahlkästchen-Position; Terminplaner-Heute/Urlaube; Rollensicht-Widerspruch
- 🟡: Termintypen Dashboard vs. Terminplaner; Vorschaubild-Aussage; Standort&Lager Doppelung; 2023 vs. 2026 Demodaten; logisch falsche Volvo-Daten; LF 60/90 nicht referenziert
- ⚪: 5× „Administrator-sichtbar"-Wiederholung; Aktivitätshistorie nicht im Bild
- ✏️: 4 Tippfehler

### Kap 4.1 (Sequenzdiagramm)
- 🔴: **Hauptdiagramm ohne Löschvorgang**; **`:Buchung`-Lebenslinie fehlt**; **Listing 4.1.2 vs. ObjektAnlegen-SD**
- 🟡: Status-Schreibweise; STATUS-SETZEN-Listing unvollständig; Reflexion ohne Vor-/Nachteile-Diskussion
- ⚪: 6 Vereinfachungs-Punkte kürzbar; Wiederholung Z.13-21/Z.38-58; 5× Beispiel-Verweise
- ✏️: Auftragsbezeichnung-Drift; falscher UC-Bezug (Z.44)

### Kap 4.2 (Aktivitätsdiagramm)
- 🔴: Lagerliste-Lane; Auftragsliste-Farbe; „Bestehende Geräte" für Seriennummer
- 🟡: Doppel-Validierung; Bestätigungs-Knoten; Adresse-Anlegen Diskrepanz Diagramm vs. Pseudocode
- ⚪: Doppelter UC-Verweis; Reflexion-Wiederholung
- ✏️: „Geraenummer"; „noch nicht geprueft gebuchte Zeitraeume"

### Kap 5 (MVC)
- 🔴: **`IUpdateEventSender`-Realisation fehlt im Bild**; **swe-utils nicht integriert**; **Sidebar-Beobachter-Diskrepanz**
- 🟡: `notifyViews()` tot; `IFilterListener` 3 vs. 1; AbstractTableModel-Schichtenverletzung; JLabel/Trefferanzahl nur Text; FilterChangedEvent→FilterCriteria; Arbeitsauftrag-Attributnamen weichen vom KlD ab
- ⚪: 5× „Abschnitt 3.3"; Z.30 lang; Reflexion redundant
- ✏️: 6 Tippfehler

### Querschnitts-/Strukturpunkte (Loop 2+3)
- 🔴: Besonderheiten-Kapitel fehlt; Aufgabenstellung/Analyse vermischt; Detail-Abbildungen pro Analysemuster fehlen; Diskussion pro Unterprogramm fehlt; swe-utils nicht integriert
- 🟡: „verwalten"-Konvention nicht erklärt; Pseudorolle-Etikett fehlt; UC-Templates fehlen; Tablet-Erweiterung als Vorschlag fehlt; Java-Swing-Mockup nicht als Besonderheit ausgeflaggt

---

## 3. Empfohlene Vorgehensweise (Priorisierung)

### Phase A — Korrektheit / Blocker (sofort)
1. **Klassendiagramm-Fixes**: Baugruppe an Gerät, Arbeitsauftrag↔Projekt, Termin↔Buchung, Bild-Multiplizitäten, Arbeitsauftrag→Bild, Zwischentermin-Rolle. Als atomarer Edit-Block — alle anderen Diagramme hängen daran.
2. **Profhinweise aus `Klassendiagramm_Fix_This.pdf`** schließen.
3. **Status-Werte** als Notiz/Enum im KlD ergänzen oder als Tabelle im Text 3.2; Schreibweise vereinheitlichen (Umlaut bevorzugt).
4. **SD-Hauptdiagramm**: entweder PUML um Phase 2 erweitern ODER Caption + Z.36 + Z.64-68 umformulieren (Auslagerung in Lösch-Unter-SD).
5. **`:Buchung`-Lebenslinie** in beide SDs einfügen.
6. **Mockup-Statusfarben** vereinheitlichen — zentrale Tabelle in Designphilosophie + 3 Stellen anpassen.

### Phase B — Strukturelle Aufwertung (1.0-Ziel)
7. **Besonderheiten-Kapitel anlegen** (6-10 Punkte): Mockup-Anzahl, Java-Swing-Mapping, UI-Philosophie, Allgemeinheit, Tablet-Vorschlag, Bedienbarkeit (3-Klick-Regel), Rechtschreibung/Sorgfalt, …
8. **swe-utils integrieren** in Kap 5 (Util-Package, Komponenten, Verwendung in Klassendiagramm).
9. **Aufgabenstellung von Analyse trennen**: Kap 1 als reines Lastenheft-Original, Kap 2 als reine Analyse mit QaA — `2_Analyse_des_Lastenhefts.typ` löschen oder umbauen.
10. **Pro Analysemuster eine Detail-Abbildung** in Kap 3.2 ergänzen.
11. **Diskussion: Vor- und Nachteile** pro Unterprogramm in Kap 4.1.

### Phase C — Konsistenz / Stil
12. UC-Templates / Beschreibungstexte für „Geräte verwalten", „Gerät anlegen", „Verfügbarkeit prüfen" ergänzen.
13. „verwalten"-Konvention im UC-Kapitel definieren.
14. Mockup-Rollensicht klarstellen (Verwaltungsmitarbeiter mit Bauleiter-Aufgaben oder rollentrennen).
15. MVC-Bild ergänzen: `Datenbasis ..|> IUpdateEventSender`, `Sidebar ..|> IUpdateEventListener`.
16. Arbeitsauftrag-Attributnamen MVC↔KlD vereinheitlichen.
17. Bezeichnungs-Drift bereinigen (Tabelle in 1.4).

### Phase D — Kürzungen
18. `2_Analyse_des_Lastenhefts.typ` löschen.
19. Mehrfach-Wiederholungen reduzieren (3-Klick, DSGVO, Standardkategorien, Abschnitt 3.3, Beispiel-Verweise).
20. Verfeinerung „Gerät anlegen" auf ≤10 UCs reduzieren (Pflicht-Attribute zusammenfassen).
21. Reflexion-Block MVC straffen.

### Phase E — Tippfehler
22. Sammel-Pass über alle Tippfehler (siehe Tabelle).
23. TODO-Kommentare entfernen.

---

## 4. Statistik

- **Gesamtbefunde**: ca. **40 kritisch**, **45 wichtig**, **25 stilistisch**, **35 Tippfehler**, **15 Anmerkungen** über 9 Subagent-Berichte.
- **Inkonsistenzen Bild ↔ Text**: in jedem Diagramm-Kapitel mindestens eine, oft mehrere. Schwerpunkt im Klassendiagramm und in den Mockup-Statusfarben.
- **Strukturelle 1.0-Lücken**: 5 Note-Killer.
- **Sicherer Streichbar (Kürzungen)**: ~150 Zeilen redundanter Inhalt + komplette Datei `2_Analyse_des_Lastenhefts.typ` (104 Zeilen).

---

## 5. Quellberichte

| Loop | Subagent | Datei | Fokus |
|---|---|---|---|
| 1 | A | `loop1/A-kap1-2.md` | Kap 1+2 Lastenheftanalyse |
| 1 | B | `loop1/B-kap3.1.md` | Kap 3.1 Use-Case |
| 1 | C | `loop1/C-kap3.2.md` | Kap 3.2 Klassendiagramm |
| 1 | D | `loop1/D-kap3.3.md` | Kap 3.3 GUI-Mockups |
| 1 | E | `loop1/E-kap4.1.md` | Kap 4.1 Sequenzdiagramm |
| 1 | F | `loop1/F-kap4.2-und-5.md` | Kap 4.2 Aktivitätsdiagramm + Kap 5 MVC |
| 2 | G | `loop2/G-uc-klassen.md` | UC ↔ Klassendiagramm |
| 2 | H | `loop2/H-klassen-sd-ad-mvc.md` | Klassendiagramm ↔ SD/AD/MVC |
| 2 | I | `loop2/I-mockups-uc-klassen.md` | Mockups ↔ UC ↔ Klassen |
| 3 | J | `loop3/J-schlusspass.md` | Beispielarbeiten-Vergleich |

---

## 6. Empfehlung an den Autor

Die größten Hebel zur Note 1.0 sind:

1. **Klassendiagramm reparieren** (Phase A 1-3) — heilt automatisch ~70 % der Kreuzkonsistenz-Befunde
2. **Besonderheiten-Kapitel anlegen** + **swe-utils integrieren** (Phase B 7-8) — schließt zwei direkt note-relevante Lücken
3. **`2_Analyse_des_Lastenhefts.typ` löschen** und Aufgabenstellung/Analyse trennen (Phase B 9, Phase D 18) — strukturelle Klarheit

Die Tippfehler/Stil-Punkte sind mengenmäßig groß, aber einzeln gering relevant — am besten in einem letzten Korrekturlese-Pass abarbeiten.

**Geschätzter Aufwand**: Phase A+B: 1-2 Werktage konzentrierter Arbeit. Phase C+D+E: 1 Werktag.
