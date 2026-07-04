# Bauanleitung: Entwurfsklassendiagramm

**Für die Verwaltungssoftware Bauunternehmen (DHBW Programmentwurf, Aufgabe 3.3)**

> **Status (Stand 2026-07-04, Nachtrag):** Umgesetzt. Diagramm und Kapitel sind fertig.
>
> - Diagramm: `assets/klassendiagramm/Entwurfsklassendiagramm.drawio` (+ `.svg`)
> - Kapitel: `chapter/6_Entwurfsklassendiagramm.typ`, eingebunden in `main-Programmentwurf.typ`
> - Alle sechs geplanten Muster (Singleton, Kompositum, Beobachter, Fabrikmethode, Objektadapter, Assoziationsklasse) sind im Diagramm sichtbar; das siebte optionale Muster (`Bildbar`-Interface) wurde ebenfalls umgesetzt.
> - Die im Analyse-Klassendiagramm dokumentierten UML-Fehler (Multiplizität an beiden Enden, `Buchung` nicht als Assoziationsklasse) sind im Entwurfsdiagramm korrigiert.
>
> Dieses Dokument bleibt als Planungs- und Referenzunterlage erhalten und beschreibt weiterhin die inhaltlichen Anforderungen, Muster-Zuordnungen und Notationsregeln. Details zur konkreten draw.io-Bau-Reihenfolge sind nach der Umsetzung nicht mehr operativ relevant, geben aber den Argumentationsgang für das Kapitel wieder.

---

Diese Anleitung führt dich Schritt für Schritt durch das Entwurfsklassendiagramm. Sie
setzt auf dem bestehenden Analyse-Klassendiagramm (`assets/klassendiagramm/Klassendiagramm.png`),
der Beziehungsdatei `docs/Beziehungen.md`, dem MVC-Kapitel `chapter/5_GUI-Modellierung-MVC.typ`
und der Beispielarbeit `references/example_works/similar_task_perfect_example_2/` auf.

Zielwerkzeug: **draw.io**, Zielformat: **eine große Zeichnung**, in Farbbereiche (Packages)
gegliedert wie im Analyse-Klassendiagramm.

---

## 0. Grundprinzipien vor dem ersten Klick

Damit du beim Zeichnen nicht in eine der bekannten Fallen tappst (`VERBESSERUNGEN.md`):

1. **Entwurf baut auf Analyse auf, ist aber nicht identisch.** Übernimm die Klassen als
   Skelett, aber ergänze:
   - Sichtbarkeiten (`+`, `-`, `#`) für alle Attribute und Methoden
   - Datentypen (`String`, `int`, `LocalDate`, `List<X>`, `boolean`, …)
   - Konstruktoren und Getter/Setter der wichtigsten Attribute
   - Fachliche Operationen (`buchungAnlegen()`, `verfuegbarkeitPruefen()`, `statusSetzen()`, …)
   - Muster-Stereotype (`<<singleton>>`, `<<abstract>>`, `<<interface>>`, `<<datatype>>`, `<<enumeration>>`)
2. **Referenzen bleiben Assoziationslinien, keine Attribute.** Auch im Entwurf. Das ist
   die häufigste Sünde im Klassendiagramm.
3. **Multiplizitäten nur am Pfeilende** (Folie 62 der Vorlesung). Wenn Pfeilspitze zeigt
   zur Klasse B, dann Multiplizität nur an B-Seite. Der Fehler „Multiplizität an beiden
   Enden" aus `VERBESSERUNGEN.md` darf im Entwurf nicht wieder passieren.
4. **Assoziationsklassen mit gestrichelter Linie**. `Buchung` hängt mit einer gestrichelten
   Linie an der Assoziation `Gerät ↔ Arbeitsauftrag` — nicht als eigene Klasse mit
   normalen Linien wie im Analysediagramm.
5. **Unidirektionale Assoziationen bevorzugen** (SWE1-Kurskonvention). Der einzige
   dokumentierte bidirektionale Ausreißer bleibt `Mitarbeiter ↔ Gruppe` (n:m, doppelt
   begründet in `Beziehungen.md`).
6. **Jedes Package bekommt eine Farbe** (analog zum Analysediagramm) — draw.io: Rechteck
   „Package" aus der UML-Palette, in den Farbbereich alle enthaltenen Klassen
   platzieren, Fill-Color leicht transparent.

---

## 1. Package-Struktur (übernommen aus Beispielarbeit 2, angepasst)

Das Diagramm wird in **9 Packages** gegliedert. Anordnung von oben nach unten grob so
wie im Immobilien-Beispiel:

```
                     ┌───────────────────────────────────────────┐
                     │           Externe Systeme (lila)          │
                     │  Finanzbuchhaltung   Altsystem   Drucker  │
                     └───────────────────────────────────────────┘
                                          │
┌──────────────────────────────────────── Model ─────────────────────────────────────┐
│                                                                                    │
│ ┌─── Personen (blau) ───┐   ┌─── Projekte & Aufträge (orange) ────────────────┐    │
│ │  Person(abstract)     │   │  Auftrag(abstract)  Arbeitsauftrag  Unterauftrag │   │
│ │  Mitarbeiter          │   │  Projekt   Rechnung   Dokument    Termin        │    │
│ │  Unterauftragnehmer   │   └──────────────────────────────────────────────────┘   │
│ │  Rolle  Gruppe        │                                                          │
│ │  Anwesenheitszeit     │   ┌─── Geräteverwaltung (grün) ────────────────────┐     │
│ └──────────────────────┘    │  Geräte-Typ  Gerät  Ausrüstung  Lager  Buchung │     │
│                             └────────────────────────────────────────────────┘     │
│                                                                                    │
│  ┌──── Bilder (rot) ─────┐                       ┌──── Datentypen (grau) ────┐     │
│  │  Bild                 │                       │  Adresse                  │     │
│  │  Bildbar<<interface>> │                       │  Zeitraum   Datei         │     │
│  └───────────────────────┘                       │  Enums: Status, Rolle,    │     │
│                                                  │   Position, Kategorie...  │     │
│                                                  └───────────────────────────┘     │
│                                                                                    │
│  ┌─── Persistenz & Import/Export (dunkelgrün) ──────────────────────────────┐      │
│  │  Datenbasis<<singleton>>   AuftragFactory<<abstract>>                    │      │
│  │  ImportAdapter    IImportQuelle<<interface>>                             │      │
│  │  AltsystemAdapter   CSVImporter   CSVExporter                            │      │
│  └──────────────────────────────────────────────────────────────────────────┘      │
└────────────────────────────────────────────────────────────────────────────────────┘

                   ┌─── GUI (blau, reduziert) ─────────────────────────────┐
                   │  GUIController<<singleton>>   [Verweis auf Kapitel 5] │
                   └───────────────────────────────────────────────────────┘
```

Die **Externen Systeme** stehen oben (wie im Analysediagramm), das GUI-Package steht ganz
unten und enthält nur `GUIController` als Referenzknoten (Kapitel 5 modelliert MVC im
Detail). So bleibt konsistent mit Kapitel 5 Zeile 9: „nicht in das spätere
Entwurfsklassendiagramm integriert".

---

## 2. Reihenfolge in draw.io — arbeite in dieser Sequenz

Bau das Diagramm nicht Klasse-für-Klasse zufällig, sondern in **9 Wellen**. Speichere
nach jeder Welle.

### Welle 1: Package-Rahmen anlegen

- Öffne `Klassendiagramm.drawio` als Kopie (`Entwurfsklassendiagramm.drawio`)
- Ziehe 9 UML-Package-Formen auf die Zeichenfläche, benenne sie
- Fülle jede mit einer transparenten Farbe (aus dem Analysediagramm übernehmen):
  - Personen: hellblau
  - Projekte & Aufträge: orange
  - Geräteverwaltung: hellgrün
  - Bilder: rot/rosa
  - Datentypen: hellgrau
  - Persistenz & Import/Export: dunkelgrün
  - GUI: hellblau (kleiner)
  - Externe Systeme: lila
  - (Model als umschließendes größeres Package um die sechs mittleren)
- Setze eine Legende ins Diagramm rechts unten:
  - `<<singleton>>`, `<<abstract>>`, `<<interface>>`, `<<enumeration>>`, `<<datatype>>`, `<<external>>`
  - Erklärung „Kursiver Klassenname = abstrakt", „Unterstrichener Name = statisch"

### Welle 2: Datentypen-Package (dependencies-frei zuerst)

Diese Klassen kennen niemanden — deshalb zuerst. Sie werden nur *referenziert*.

**Wertklassen (`<<datatype>>`)**

- **Adresse** — `- straße: String`, `- hausnummer: String`, `- plz: String`, `- ort: String`, `- land: String`.
  Konstruktor + Getter/Setter. Stereotype `<<datatype>>`.
- **Zeitraum** — `- start: LocalDate`, `- ende: LocalDate`, Methode `+ überschneidetSich(z: Zeitraum): boolean`.
  (Wird bei `Buchung` als Attributtyp verwendet.)
- **Datei** — `- pfad: String`, `- name: String`, `- format: String`, `- größe: long`, `- hochladedatum: LocalDate`.
  Wird als Wertobjekt in `Dokument` und `Bild` referenziert.

**Enumerationen** (jede eine eigene Klassenbox mit `<<enumeration>>`)

- **Rolle** — Konstanten: `ADMIN`, `VERWALTUNG`, `BAULEITER`, `PROJEKTLEITER`, `VORARBEITER`, `BAUARBEITER`.
  Ersetzt die im Analysediagramm existierende `Rolle`-Klasse (siehe `Beziehungen.md` Punkt 7 „Rolle-Konfigurierbarkeit"). **Wichtig:** Wenn du die Analyse-Klasse `Rolle` nicht in
  Enum umbauen willst, lass sie stehen — dann als reguläre Klasse mit Referenz zur Enum.
- **Position** — `PROJEKTLEITER`, `BAULEITER`, `BAUGRUPPENLEITER`, `VORARBEITER`,
  `GELERNTER_BAUARBEITER`, `UNGELERNTER_BAUARBEITER`, `VERWALTUNGSMITARBEITER`.
- **AuftragStatus** — `OFFEN`, `IN_BEARBEITUNG`, `ABGESCHLOSSEN`, `GELÖSCHT`, `STORNIERT`.
- **BuchungStatus** — `AKTIV`, `ABGESCHLOSSEN`, `STORNIERT`.
- **GerätStatus** — `VERFÜGBAR`, `GEBUCHT`, `IN_WARTUNG`, `DEFEKT`.
- **AnwesenheitTyp** — `ANWESEND`, `URLAUB`, `KRANKHEIT`, `SONSTIGE_ABWESENHEIT`.
- **GerätKategorie** — `BAGGER`, `LKW`, `KRAN`, `RÜTTLER`, `BOHRMASCHINE`,
  `SCHALUNGSTEIL`, `ZAUN`, `BAUSICHERUNG`.
- **Gruppentyp** — `VERWALTUNG`, `PLANUNG`, `PROJEKTLEITUNG`, `BAULEITUNG`, `BAUGRUPPE`.
- **TerminTyp** — `START`, `ENDE`, `ZWISCHEN`, `WARTUNG`.
- **DokumentTyp** — `BAUPLAN`, `KOSTENVORANSCHLAG`, `PROJEKTPLAN`, `VERTRAG`, `RECHNUNG_PDF`.
- **BildElementTyp** — nur wenn du die „Bildbar"-Variante B wählst (siehe Welle 6).

Positioniere alle Enums als kompakte Boxen im Datentypen-Package. **Ziehe hier bewusst
keine Assoziationslinien in andere Packages** (Beispielarbeit 2 Kapitel 7.1.1 rechtfertigt
das mit Übersichtlichkeit; erwähne das im Fließtext).

### Welle 3: Personen-Package

**Person `<<abstract>>`** (kursiver Klassenname)

- `# vorname: String`
- `# nachname: String`
- `# telefon: String`
- `# email: String`
- `+ getFullName(): String`
- Konstruktor: `# Person(vorname, nachname, telefon, email)`
- Assoziation `Person 1 ✕───────▶ 1 Adresse` (unidirektional mit X, Rollenname
  `wohnadresse`)

**Mitarbeiter** (erbt von Person, gefüllter Vererbungspfeil zur Oberklasse)

- `- mitarbeiternummer: int` (Schlüssel)
- `- geburtsdatum: LocalDate`
- `- position: Position` (Enum)
- `- beschäftigungsort: String`
- `- vertragsbeginn: LocalDate`
- `- vertragsende: LocalDate`
- `+ istAktiv(): boolean`
- `+ anwesenheitEintragen(datum: LocalDate, start: LocalTime, ende: LocalTime, typ: AnwesenheitTyp): Anwesenheitszeit`
- `+ getRolle(): Rolle`
- Assoziation `Mitarbeiter 1 ✕───────▶ 1 Rolle` (Rolle als Enum; wenn Klasse: X wie in `Beziehungen.md`)

**Unterauftragnehmer** (erbt von Person)

- `- unterauftragnehmerId: int`
- `- firmenname: String`
- `- fachbereich: String`

**Gruppe**

- `- gruppennummer: int`
- `- name: String`
- `- gruppentyp: Gruppentyp` (Enum)
- `- beschreibung: String`
- `+ mitgliedHinzufügen(m: Mitarbeiter)`
- `+ mitgliedEntfernen(m: Mitarbeiter)`
- `+ getMitglieder(): List<Mitarbeiter>`
- Assoziation `Mitarbeiter 0..* ────── 0..* Gruppe` (bidirektional, Rollenname
  `mitglied`) — der einzige dokumentierte bidirektionale n:m-Fall
- Assoziation `Mitarbeiter 0..1 ────── 0..* Gruppe` (bidirektional, Rollenname
  `gruppenleiter`)

**Anwesenheitszeit** (Komposition zu Mitarbeiter)

- `- anwesenheitsId: int`
- `- datum: LocalDate`
- `- startzeit: LocalTime`
- `- endzeit: LocalTime`
- `- typ: AnwesenheitTyp`
- `- bemerkung: String`
- Komposition `Mitarbeiter 1 ◆───────▶ 0..* Anwesenheitszeit` (gefüllte Raute am
  Mitarbeiter, bidirektional wegen Selbstansicht — siehe `Beziehungen.md`)

**Rolle** (falls du sie als Klasse behältst statt Enum)

- `- rollennummer: int`
- `- name: String`
- `+ darfLesen(entity: String): boolean`
- `+ darfBearbeiten(entity: String): boolean`

### Welle 4: Projekte & Aufträge-Package

**Auftrag `<<abstract>>`** (**neue Klasse im Entwurf**, gemeinsame Oberklasse für
Arbeitsauftrag und Unterauftrag — siehe `Beziehungen.md` „Auftrag-Hierarchie")

- `# auftragsnummer: int`
- `# bezeichnung: String`
- `# status: AuftragStatus`
- `# bemerkung: String`
- `+ statusSetzen(neuerStatus: AuftragStatus)`  (abstrakt oder konkret)
- `+ getStartTermin(): Termin`
- `+ getEndTermin(): Termin`
- `+ getZwischentermine(): List<Termin>`
- Assoziation `Auftrag 1 ────── 2..* Termin` (bidirektional, mind. Start+Ende)

Diese abstrakte Klasse ist gleichzeitig die **Komponente des Kompositum-Musters**.
Sie enthält:
- Referenz auf sich selbst als „Kinder": `+ getUnteraufträge(): List<Auftrag>`
  (bei `Arbeitsauftrag` liefert die Liste die Unteraufträge; bei `Unterauftrag`
  leer oder rekursiv weiter — je nach Design).

**Arbeitsauftrag** `extends Auftrag`

- `- auftragsbezeichnung: String` (falls du unterschiedlich zu `bezeichnung` willst)
- `+ dokumentAnhängen(d: Dokument)`
- Assoziationen:
  - `Arbeitsauftrag ✕───────▶ 0..* Dokument` (unidirektional mit X)
  - `Arbeitsauftrag ✕───────▶ 1 Adresse` (Einsatzort, X)
  - `Arbeitsauftrag 0..* ────── 1..* Mitarbeiter` (bidirektional)
  - `Arbeitsauftrag 1 ◆───────▶ 0..* Unterauftrag` (Komposition, aber siehe **Kompositum**
    weiter unten — wir modellieren das über die abstrakte `Auftrag`-Klasse)

**Unterauftrag** `extends Auftrag`

- `- kosten: BigDecimal`
- Assoziation `Unterauftrag ✕───────▶ 1 Unterauftragnehmer` (Rollenname `ausgeführtVon`)
- Assoziation zur Kompositum-Struktur: `Auftrag 1 ◆───────▶ 0..* Auftrag` (Rollenname
  `enthält` / `parent`) — genau das ist das Kompositum-Muster.

**Projekt**

- `- projektnummer: int`
- `- projektname: String`
- `- beschreibung: String`
- `- status: AuftragStatus`
- `+ auftragAnlegen(): Arbeitsauftrag`
- `+ projektAbschließen()`
- Assoziationen:
  - `Projekt 1 ◆───────▶ 0..* Arbeitsauftrag` (Komposition, bidirektional wegen
    Rückansicht)
  - `Projekt 0..* ────── 1 Mitarbeiter` (Rollenname `projektleiter`, bidirektional)
  - `Projekt ✕───────▶ 1 Adresse` (X)
  - `Projekt ✕───────▶ 0..* Dokument` (X)
  - `Projekt 1 ────── 2 Termin` (genau 2, Start + Ende)

**Rechnung**

- `- rechnungsnummer: int`
- `- betrag: BigDecimal`
- `- fälligkeitsdatum: LocalDate`
- `- status: String`
- `+ istÜberfällig(): boolean`
- Assoziation `Rechnung 0..* ────── 1 Arbeitsauftrag` (bidirektional)
- Assoziation `Rechnung ✕───────▶ 0..1 Dokument` (PDF)

**Dokument**

- `- dokumentId: int`
- `- titel: String`
- `- typ: DokumentTyp`
- `- datei: Datei` (Datentyp-Referenz, X)
- `+ öffnen()`
- Assoziation `Dokument ✕───────▶ 1 Mitarbeiter` (Rollenname `hochlader`, X)

**Termin**

- `- terminnummer: int`
- `- bezeichnung: String`
- `- typ: TerminTyp`
- `- datum: LocalDate`
- `- uhrzeit: LocalTime`

### Welle 5: Geräteverwaltung-Package

**Geräte-Typ**

- `- gerätetypId: int`
- `- bezeichnung: String`
- `- typ: String` (Baumaschine | Bauwerkzeug — kannst auch eigenes Enum machen)
- `- kategorie: GerätKategorie`

**Gerät**

- `- gerätenummer: int`
- `- seriennummer: String`
- `- status: GerätStatus`
- `- anschaffungsdatum: LocalDate`
- `- letzterWartungstermin: LocalDate`
- `- nächsterWartungstermin: LocalDate`
- `+ istVerfügbarIn(z: Zeitraum): boolean`
- `+ statusSetzen(neu: GerätStatus)`
- Assoziation `Gerät 0..* ✕───────▶ 1 Geräte-Typ` (X, Exemplartyp-Muster)
- Assoziation `Gerät 0..* ────── 1 Lager` (bidirektional)
- Assoziation `Gerät 0..1 ◇───────▶ 0..* Ausrüstung` (Aggregation, leere Raute,
  bidirektional)

**Ausrüstung**

- `- ausrüstungsnummer: int`
- `- bezeichnung: String`
- `- kompatibelMit: String` (oder Liste von Kategorien)
- `- gewicht: double`
- `- status: String`

**Lager**

- `- lagernummer: int`
- `- lagerbezeichnung: String`
- `- typ: String` (Platz | Gebäude)
- `- grundstück: String`
- `- kapazität: int`
- `+ getGeräte(): List<Gerät>`
- Assoziation `Lager ✕───────▶ 1 Adresse` (X)

**Buchung** (Koordinator/Assoziationsklasse)

- `- buchungsnummer: int`
- `- zeitraum: Zeitraum` (Datentyp aus Datentypen-Package)
- `- status: BuchungStatus`
- `+ stornieren()`
- `+ verlängern(neuesEnde: LocalDate)`

**Wichtig — hier korrigierst du einen Analysediagramm-Fehler aus `VERBESSERUNGEN.md`:**
Zeichne `Buchung` **nicht** mit normalen Assoziationslinien, sondern als
Assoziationsklasse:

1. Zeichne die Assoziation `Gerät 1 ──────▶ 0..* Arbeitsauftrag` als normale Linie.
2. Ziehe von der Mitte dieser Linie eine **gestrichelte Linie** hoch zur `Buchung`-Klasse.
3. `Buchung` selbst schwebt neben der Linie, ohne eigene solide Assoziation zu Gerät/Auftrag.

- Zusätzlich: `Buchung ✕───────▶ 1 Mitarbeiter` (Rollenname `gebuchtVon`, X — Audit-Feld)

### Welle 6: Bilder-Package (Bildbar-Muster jetzt entschieden)

Hier löst du die in `Beziehungen.md` offen gelassene Bildbar-Entscheidung. Ich empfehle
**Variante A** (Interface), weil sie ein eigenes Muster demonstriert und im Diagramm
sauberer wirkt.

**Bildbar `<<interface>>`**

- `+ addBild(b: Bild)`
- `+ removeBild(b: Bild)`
- `+ getBilder(): List<Bild>`

Realisiert durch: `Arbeitsauftrag`, `Projekt`, `Gerät`, `Mitarbeiter` (gestrichelte
Realisierungspfeile mit ausgefüllten Dreiecken zu Bildbar).

**Bild**

- `- bildId: int`
- `- titel: String`
- `- datei: Datei` (Datentyp)
- `- hochladedatum: LocalDate`
- Assoziation `Bild 0..* ────── 0..1 Bildbar` (bidirektional, Rollenname
  `zugeordnetesElement`)
- Assoziation `Bild ✕───────▶ 1 Mitarbeiter` (`hochlader`, X)

### Welle 7: Persistenz & Import/Export-Package (Singleton, Fabrikmethode, Adapter)

Hier landen die drei tragenden Entwurfsmuster.

**Datenbasis `<<singleton>>`**

- `- INSTANCE: Datenbasis` (unterstrichen, statisch)
- `- projekte: List<Projekt>`
- `- mitarbeiter: List<Mitarbeiter>`
- `- geräte: List<Gerät>`
- `- lager: List<Lager>`
- `- buchungen: List<Buchung>`
- `- dokumente: List<Dokument>`
- `- bilder: List<Bild>`
- `- gruppen: List<Gruppe>`
- `- rechnungen: List<Rechnung>`
- `- listener: List<IUpdateEventListener>`
- `- Datenbasis()` (privater Konstruktor)
- `+ getInstance(): Datenbasis` (unterstrichen, statisch)
- `+ findAufträge(kriterien: FilterCriteria): List<Arbeitsauftrag>`
- `+ speichern(o: Object)`
- `+ löschen(o: Object)`
- `+ register(l: IUpdateEventListener)`
- `+ unregister(l: IUpdateEventListener)`
- `+ fireUpdate()`
- Realisiert `IUpdateEventSender` (gestrichelte Realisierung — Verweis auf Kapitel 5)
- Duplikatsprüfung (LF 100): `+ existiertBereits(o: Object): boolean`

**AuftragFactory `<<abstract>>`** (Fabrikmethode — 5. Muster)

- `+ erzeugeAuftrag(typ: String, projekt: Projekt): Auftrag` (Fabrikmethode)
- Konkrete Unterklassen: `ArbeitsauftragFactory`, `UnterauftragFactory` (jede erbt und
  überschreibt `erzeugeAuftrag`).

Zeige die Fabrikmethode also nicht als Kommentar, sondern **als eigene Klassenhierarchie** —
das ist der Kern des Musters.

**IImportQuelle `<<interface>>`** (Ziel-Interface für den Adapter)

- `+ leseDaten(): List<Object>`
- `+ istVerfügbar(): boolean`

**AltsystemAdapter** (der eigentliche Adapter — 6. Muster)

- Implementiert `IImportQuelle`
- Hält Referenz auf `Altsystem` (aus Externe Systeme)
- Übersetzt das proprietäre Altsystem-Format in die Standardstruktur
- `- altsystem: Altsystem`
- `+ leseDaten(): List<Object>` (delegiert an `altsystem.legacyExport()` und wandelt um)

**CSVImporter** implementiert `IImportQuelle` (zweite Quelle, zeigt Adaptierbarkeit)

**ImportAdapter** (koordinierender Client)

- `- quelle: IImportQuelle`
- `+ importiereIn(db: Datenbasis)`

**CSVExporter**

- `+ exportiere(db: Datenbasis, pfad: String)`

Beziehungen im Package:
- `AltsystemAdapter ┈┈┈▶ IImportQuelle` (Realisierung, gestrichelter Vererbungspfeil)
- `AltsystemAdapter ────▶ Altsystem` (Verwendung, gestrichelte Assoziation mit `<<use>>`)
- `CSVImporter ┈┈┈▶ IImportQuelle`
- `ImportAdapter ────▶ IImportQuelle` (kennt das Interface, nicht die Implementierung)
- `ImportAdapter ────▶ Datenbasis`

### Welle 8: Externe Systeme (`<<external>>`)

**Finanzbuchhaltung `<<external>>`**

- `+ rechnungenLesen(): List<Rechnung>`
- Dependency (gestrichelter Pfeil `<<use>>`) von `Rechnung` zu Finanzbuchhaltung

**Altsystem `<<external>>`**

- `+ legacyExport(): byte[]` (proprietäres Format)
- Wird ausschließlich vom `AltsystemAdapter` referenziert

**Drucker `<<external>>`**

- `+ druckeDokument(d: Dokument)`
- `+ druckeRechnung(r: Rechnung)`

### Welle 9: GUI-Package (nur Andeutung)

Wie in Kapitel 5 vereinbart, wird MVC hier **nicht** wiederholt. Trotzdem sollte im
Entwurfsklassendiagramm ein einziger Anker sichtbar sein, damit der Bezug zu Kapitel 5
klar ist:

**GUIController `<<singleton>>`**

- `- INSTANCE: GUIController`
- `+ getInstance(): GUIController`
- Kommentar-Notiz im Diagramm: „Siehe Kapitel 5 für MVC-Struktur"
- Assoziation `GUIController ────▶ Datenbasis` (kennt Datenbasis)
- Realisiert `IUpdateEventListener` (Beobachter — 7. Muster, aus Kapitel 5 übernommen)

---

## 3. Entwurfsmuster — Übersicht der 6+ Muster im Diagramm

| # | Muster | Klassen im Diagramm | Zweck |
|---|--------|---------------------|-------|
| 1 | **Singleton** | `Datenbasis`, `GUIController` | Zentrale Datenhaltung (LD 10), zentrale Steuerung |
| 2 | **Kompositum** | `Auftrag` (abstrakt) mit Selbstassoziation, konkret: `Arbeitsauftrag`, `Unterauftrag` | Hierarchische Aufträge, rekursive Struktur |
| 3 | **Beobachter** | `IUpdateEventListener`, `IUpdateEventSender`, realisiert durch `Datenbasis` und Views (Kapitel 5) | Datenänderungen fluten an alle UI-Komponenten |
| 4 | **Fabrikmethode** | `AuftragFactory` (abstrakt) → `ArbeitsauftragFactory`, `UnterauftragFactory` | Zentrale Objekterzeugung, LF 100 Duplikatsprüfung |
| 5 | **Objektadapter** | `AltsystemAdapter` implementiert `IImportQuelle`, hält Altsystem-Instanz | Legacy-Datenformat an einheitliches Import-Interface anschließen |
| 6 | **Assoziationsklasse (aus Analyse übernommen, jetzt korrekt notiert)** | `Buchung` an gestrichelter Linie über `Gerät ↔ Arbeitsauftrag` | Koordinator |

**Optional (7. Muster für zusätzliche Bewertung):** Die Realisierung von `Bildbar` durch
mehrere Klassen ist ein einfaches **Rollen-/Schnittstellenmuster** — wenn du magst,
im Text als „Interface-basierte Abstraktion" erwähnen.

---

## 4. Notationsregeln, die du beim Zeichnen ständig prüfen musst

Diese Liste als kleines Fenster nebenbei offen halten:

1. **Klassennamen**
   - Normal: `Mitarbeiter`
   - Abstrakt: *`Auftrag`* (kursiv) oder mit `<<abstract>>`-Stereotyp
   - Interface: `Bildbar` mit `<<interface>>`
   - Enum: `Rolle` mit `<<enumeration>>`
   - Datentyp: `Adresse` mit `<<datatype>>`
2. **Attribute** — Format `- name: Typ [= Default]`
   - `-` private, `+` public, `#` protected, `~` package
   - Konstanten unterstrichen
3. **Operationen** — Format `+ name(param: Typ, param: Typ): Rückgabetyp`
   - Konstruktoren ohne Rückgabetyp
   - Statische Methoden unterstrichen
   - Abstrakte Methoden kursiv oder mit `{abstract}`
4. **Assoziationen**
   - Multiplizität **nur an einem Ende**, wenn unidirektional
   - Pfeilspitze zeigt zur bekannten Klasse
   - X am Gegenende bedeutet „kennt explizit nicht"
   - Rollennamen bei mehrfachen Beziehungen zwischen denselben Klassen (Mitarbeiter↔Gruppe, Mitarbeiter↔Projekt)
5. **Komposition** — gefüllte Raute am Ganzen (Projekt, Mitarbeiter)
6. **Aggregation** — leere Raute am Ganzen (nur bei `Gerät ◇──▶ Ausrüstung`, weil austauschbar)
7. **Vererbung** — leerer Dreieckspfeil zur Oberklasse
8. **Realisierung eines Interfaces** — gestrichelte Linie mit leerem Dreieckspfeil
9. **Dependency** — gestrichelter Pfeil mit `<<use>>`, `<<create>>` o. Ä.
10. **Assoziationsklasse** — gestrichelte Linie von der Assoziationslinie zur Klasse

---

## 5. Prüf-Checkliste vor dem Export

Bevor du das Diagramm als PNG rausrenderst und ins Typst-Dokument einbindest, geh diese
Liste durch:

- [ ] Alle 9 Packages sind farblich klar unterscheidbar und beschriftet
- [ ] Legende (Muster-Stereotype, X-Notation, Pfeilarten) rechts unten
- [ ] Keine Klasse hat Referenzen als Attribute (alles als Assoziationslinie)
- [ ] Multiplizitäten nur am Pfeilende, nie an beiden Seiten unidirektionaler Assoziationen
- [ ] Buchung hängt als Assoziationsklasse (gestrichelte Linie), nicht als reguläre Klasse
- [ ] Auftrag ist abstrakt und hat eine Selbstassoziation für Kompositum
- [ ] AltsystemAdapter, IImportQuelle, Altsystem sind klar getrennt (Adapter-Struktur erkennbar)
- [ ] AuftragFactory ist abstrakt, hat mindestens eine konkrete Unterklasse
- [ ] Datenbasis und GUIController haben `<<singleton>>`
- [ ] Bildbar ist `<<interface>>`, wird von 4 Klassen realisiert
- [ ] Jede Enum hat `<<enumeration>>` und alle Konstanten aufgezählt
- [ ] Konstruktoren und Getter/Setter zumindest an den zentralen Klassen (Mitarbeiter, Arbeitsauftrag, Gerät, Buchung) sichtbar
- [ ] Fachliche Operationen (`buchungAnlegen`, `verfuegbarkeitPruefen`, `statusSetzen`, `duplikatPruefen`, `existiertBereits`, `fireUpdate`) sichtbar
- [ ] Externe Systeme mit `<<external>>` markiert, sitzen außerhalb des Model-Packages
- [ ] Rollennamen an allen mehrfachen Beziehungen (Mitarbeiter↔Gruppe: `mitglied`/`gruppenleiter`; Mitarbeiter↔Projekt: `projektleiter`; Audit-Felder: `hochlader`, `gebuchtVon`)
- [ ] X-Notation an allen Wertobjekt-Beziehungen (Adresse, Dokument, Rolle, Bild-Hochlader, Buchung-Bucher, Geräte-Typ, Unterauftragnehmer)

---

## 6. Danach: was ins Typst-Kapitel muss

Wenn das Diagramm steht, brauchst du für Kapitel `3.4` oder `6` (je nachdem wo du es
einordnest) folgenden Text:

1. **Einleitung** — Warum baut Entwurf auf Analyse auf, was ist neu (2 Absätze).
2. **Package-Beschreibung** — je Package 1 Absatz, was drin ist und warum es getrennt ist.
   Vorbild: Beispielarbeit 2 Kapitel 7.1.1 – 7.1.10.
3. **Verwendete Entwurfsmuster** — je Muster ein Unterabschnitt (Singleton, Kompositum,
   Beobachter, Fabrikmethode, Objektadapter) mit **eigenem verkleinerten Diagramm-Ausschnitt**
   plus 3–5 Sätze Begründung. Vorbild: Beispielarbeit 2 Kapitel 7.2.
4. **Diskussion der Änderungen gegenüber der Analyse** — was wurde ergänzt, was
   umgebaut, was bewusst weggelassen (kurze Reflexion, 1 Absatz).

Für die Muster-Ausschnitte kannst du direkt aus deinem großen draw.io-Diagramm Rechtecke
markieren und einzeln exportieren.

---

## 7. Bekannte offene Punkte, die du beim Zeichnen mitentscheiden kannst

Aus `Beziehungen.md` sind noch offen:

- **Rolle als Enum oder Klasse?** — Diese Anleitung schlägt Enum vor. Wenn du Klasse
  behältst, ist das kein Fehler, aber Enum ist einfacher.
- **Auftragsstatus als Operationen** — Ich habe `statusSetzen(neuerStatus)` als Methode
  eingezeichnet. Wenn du Zustandsautomat willst, kannst du auch einzelne Methoden
  (`abschließen()`, `stornieren()`) definieren.
- **Gruppe-Hierarchie (Baugruppen enthalten Arbeitsgruppen)** — Wenn du das noch
  einbauen willst, macht `Gruppe 1 ◆───▶ 0..* Gruppe` einen zweiten Kompositum-Fall.
  Optional, nicht zwingend.
- **Rechnungspositionen** — In `Beziehungen.md` als offen markiert. Für den Entwurf
  reicht es, wenn du sagst „Rechnungspositionen sind Teil der PDF, nicht separat modelliert"
  und im Text erwähnst.

---

Diese Anleitung ist bewusst so detailliert, dass du sie beim Zeichnen als
Referenzdokument neben draw.io offen haben kannst. Jede Klasse hat Name, Attribute mit
Typen, Methoden und die konkret zu ziehenden Assoziationen. Wenn du dabei auf
Widersprüche stößt oder eine Beziehung fehlt, sag mir Bescheid — ich passe die Anleitung
an, bevor das Diagramm zu weit fortgeschritten ist.
