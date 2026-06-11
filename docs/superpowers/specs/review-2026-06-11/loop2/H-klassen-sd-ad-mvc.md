# Loop 2 — Subagent H: Klassendiagramm ↔ SD/AD/MVC

## SD-Lebenslinien-zu-Klassen-Mapping

### Hauptdiagramm
| Lebenslinie SD | Klasse im KlD? | Status |
|---|---|---|
| `:Bau-/Projektleiter` (Akteur) | — | OK |
| `:UI Bauverwaltung` | Boundary | OK |
| `:Datenbasis` | Repository | OK |
| `:Projekt`, `:Adresse`, `:Mitarbeiter`, `:Arbeitsauftrag`, `:Termin`, `:Unterauftrag`, `:Unterauftragnehmer` | alle in KlD | OK |
| `:Buchung` (nur Text 4.1 Z.19/66/100, **nicht** als Lebenslinie deklariert) | `Buchung` (KlD Z.182) | **LÜCKE** |

### Unterprogramm AuftragLoeschen
- `:Buchung` im ref „Status setzen :Buchung = Storniert" angesprochen, aber **keine Lebenslinie**. **LÜCKE**.

### Duplikatspruefung / ObjektAnlegen / StatusSetzen
- Boundaries und generische Platzhalter-Lebenslinien — Mapping OK.

## SD-Methoden-zu-Operationen-Mapping
Im Analyse-KlD sind **keinerlei Operationen** modelliert (PUML Z.39-203 nur Attribute). Damit existiert für **jede** im SD aufgerufene Methode keine korrespondierende Operation. In OO-Analyse zulässig, sollte aber **explizit als Konvention erwähnt** werden — fehlt aktuell.

13 Methoden im SD identifiziert (`new()`, `Einsatzort zuordnen`, `Projekt zuordnen`, `Attribute eintragen`, `Haupttermin/Zwischentermin zuordnen`, `Beteiligte Person hinzufügen`, `Unterauftrag hinzufügen`, `Unterauftragnehmer zuordnen`, `Status setzen`, `Statusattribut aktualisieren`, `löschen()`, `Attributwert setzen`, `Referenz zuordnen`).

**Hervorhebung**: `Haupttermin/Zwischentermin zuordnen` — KlD hat kein Zwischentermin-Attribut/Rolle (Loop1-C Punkt 1 bestätigt durch SD).

## AD-Aktionen-zu-Klassen-Mapping

| AD-Aktion | unterstützende Klasse(n) | Status |
|---|---|---|
| Geräte-Typen laden, Lager, Geräte, Buchungen, Auftragsliste laden | alle Klassen vorhanden | OK |
| Lager-Instanz erzeugen (Lager + Adresse) | `Lager → Adresse` Assoz. vorhanden | OK |
| Status setzen "Verfügbar"/"Gebucht"/"Aktiv" | `Geraet.status`/`Buchung.status` | OK strukturell, **Werte nicht enumeriert** |
| **Ausrüstungs-Instanz erzeugen + Gerät zuordnen (Baugruppe)** (Z.133, 138) | KlD Z.243: `Lager *-- Ausruestung`, **nicht** `Geraet *-- Ausruestung` | **KRITISCH-Kreuzkonsistenz** — AD widerspricht KlD-Bild zentral |
| Buchungs-Instanz erzeugen (buchungsnummer, startdatum, enddatum) | Buchung-Attribute vorhanden | OK |
| Gerät/Auftrag/Mitarbeiter zuordnen | KlD Z.246-248 alle drei vorhanden | OK |

**Auffällige Lücken:**
- **`buchungsdatum`** (KlD Z.186) wird im AD nirgends gesetzt — totes Attribut.
- **`Ausruestung.typ`** (KlD Z.168) wird im AD-Eingabe-Schritt Z.131 nicht abgefragt.
- **Wartungstermin** (AD Z.101 Pflichtfeld) wird im AD nicht als Termin-Instanziierung modelliert, obwohl KlD-Assoziation existiert.
- **Mitarbeiter (buchender)** (AD Z.188) wird ohne separaten Lade-/Auswahl-Schritt referenziert.

## MVC-Klassen-zu-Analyseklassen

| MVC-Klasse | Analyseklasse | Konsistent? |
|---|---|---|
| View/Event/Controller-Klassen | — (Entwurfs-Schicht) | OK |
| `Datenbasis` «singleton» | im SD/AD als Lane vorhanden, im Analyse-KlD aber **nicht** als Klasse | OK methodisch, sollte Text erwähnen |
| `Arbeitsauftrag` (MVC Z.198) | `Arbeitsauftrag` (KlD Z.103) | **NAMENSGLEICH OK; Attribute weichen ab**: MVC hat `auftragsnummer, bezeichnung, status, startdatum, endtermin`; KlD hat `auftragsnummer, auftragsbezeichnung, starttermin, endtermin, status, bemerkung`. **Inkonsistente Attributnamen**: `bezeichnung` vs. `auftragsbezeichnung`, `startdatum` vs. `starttermin`. **KRITISCH** |
| `FilterCriteria` «datatype» | — | OK |

## Status-Werte-Inventar

### Verwendete Werte (in SD/AD-PUMLs)
| Klasse | Werte | Quelle |
|---|---|---|
| `Arbeitsauftrag` | "Offen", "Gelöscht"/"Geloescht" | SD-Haupt Z.179-180, AuftragLoeschen Z.89, StatusSetzen Z.31 |
| `Buchung` | "Storniert", "Aktiv" | AuftragLoeschen Z.62, AD Z.191, StatusSetzen Z.32 |
| `Geraet` | "Verfügbar", "Gebucht" | AD Z.127, 192, StatusSetzen Z.33 |

Pseudocode verwendet `'Geloescht'` (ASCII), PUML/PNG `"Gelöscht"` (Umlaut). **Inkonsistenz.**

### Existenz im KlD
PUML modelliert `status` jeweils nur als ungetypten Attributnamen, **ohne Wertebereich/Enum**:
- `Projekt.status`, `Arbeitsauftrag.status`, `Unterauftrag.status`, `Rechnung.status`, `Geraet.status`, `Ausruestung.status`, `Buchung.status` — alle ohne Aufzählung.

**StatusSetzen-PUML Z.41-43 behauptet**: „Der gültige Wertebereich ist je Klasse im Analyse-Klassendiagramm festgelegt". **Diese Aussage ist faktisch falsch** — der Wertebereich ist im KlD nirgends festgelegt. **KRITISCH**.

## Kritisch (Lücken zwischen Diagrammen)

1. **`:Buchung`-Lebenslinie fehlt** im SD-Hauptdiagramm und SD_Unterprogramm_AuftragLoeschen, obwohl Klasse `Buchung` im KlD existiert und Text/ref auf sie verweist.
2. **Baugruppe-Inkonsistenz schlägt auf AD durch.** AD Z.133 sagt explizit „Ausrüstungs-Instanz erzeugen und Gerät zuordnen (Baugruppe-Muster)", während KlD `Lager *-- Ausruestung` modelliert. **AD widerspricht KlD-Bild zentral und folgt der domänenfachlich richtigen Variante (Bagger+Schaufel). KlD muss korrigiert werden.**
3. **Status-Wertebereich nicht im KlD modelliert**, obwohl SD_StatusSetzen explizit darauf verweist.
4. **`Arbeitsauftrag`-Attribute MVC ↔ Analyse weichen ab.** Mindestens Vereinheitlichung der Namen `bezeichnung` ↔ `auftragsbezeichnung` und `startdatum` ↔ `starttermin` notwendig.
5. **`Termin → Buchung`** im KlD fehlt. AD/SD-Schritt zeigt Verbindung Buchung↔Termin als zentral, im KlD nur `Buchung → Geraet`.
6. **Status-Schreibweise inkonsistent** zwischen SD-PUML (Umlaut), Pseudocode (ASCII) und KlD (gar nicht modelliert).

## Wichtig

7. **`buchungsdatum`** (KlD Z.186) wird in AD und SD nirgends gesetzt — totes Attribut.
8. **`Ausruestung.typ`** (KlD Z.168) wird im AD-Eingabe-Schritt Z.131 nicht abgefragt.
9. **„Zwischentermin zuordnen"** (SD-Haupt 6.6) impliziert semantische Unterscheidung Haupt-/Zwischentermin im `Arbeitsauftrag`. Im KlD nur generische Assoziation; Rolle „Haupt-/Zwischentermin" sollte als Rollen-Muster modelliert sein.
10. **Wartungstermin** (AD Z.101) wird im AD nicht als Termin-Instanziierung modelliert.
11. **Mitarbeiter (buchender)** (AD Z.188) ohne separaten Lade-/Auswahl-Schritt.
12. **Datenbasis** in MVC und SD/AD vorhanden, im Analyse-KlD nicht — fehlt Hinweis im Text.
13. **`UI Bauverwaltung` ↔ View-Paket** Querverweis fehlt in Kap 5.
14. **`AufträgeController.notifyViews()`** toter Member.

## Stil / Fluff
- StatusSetzen-PUML behauptet faktisch Falsches über das KlD — Aussage entschärfen oder KlD ergänzen.
- Eine globale Liste „SD-Lebenslinien-Inventar" in Kap 4.1 würde Kreuzkonsistenz erleichtern.

## Anmerkungen
- Mehrheit der Lücken sind **Lücken im Analyse-KlD**, die durch SD/AD aufgedeckt werden (Status-Werte, Termin↔Buchung, Baugruppe an falscher Klasse, Zwischentermin-Rolle). Eine gezielte Überarbeitung von Klassendiagramm.puml + Kap 3.2 löst rund 70 % der gefundenen Punkte.
- Klassennamen sind durchgängig konsistent — keine Drift zwischen SD/AD und KlD.
- **Für Note 1.0**: (a) `:Buchung` als Lebenslinie ergänzen, (b) Status-Werte als Notiz/Enum im KlD, (c) Komposition Ausrüstung an `Geraet` umhängen, (d) Attributnamen `Arbeitsauftrag` zwischen Kap 5 und KlD vereinheitlichen, (e) Zwischentermin-Rolle modellieren.

---

**Zahlen:** 6 Kritisch, 8 Wichtig, 2 Stil, 3 Anmerkungen.
