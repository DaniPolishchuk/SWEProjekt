# Beziehungen im Klassendiagramm

Diese Datei sammelt alle besprochenen Beziehungen zwischen den Entitäten für das Analyse-Klassendiagramm. Sie wird Schritt für Schritt erweitert -- nur Beziehungen, die explizit besprochen und im `chapter/1_Aufgabenstellung.typ` durch QaA-Fragen abgedeckt sind, werden hier eingetragen.

## Konventionen

### Multiplizität

- Multiplizität steht immer am Ende der Assoziationslinie, wo das jeweilige Objekt "sitzt"
- Links vom Pfeilstart = Multiplizität der linken Klasse
- Rechts am Pfeilkopf = Multiplizität der rechten Klasse
- Beispiel: `Arbeitsauftrag 1 ------> 0..* Rechnung` bedeutet: 1 auf Arbeitsauftrag-Seite, 0..* auf Rechnung-Seite

### Pfeilrichtung (Navigierbarkeit)

- Pfeilspitze zeigt zum "gekannten" Objekt
- Kein Pfeil (keine Spitze) = bidirektional, beide Seiten kennen sich
- Kreuz am Ende = "kennt nicht" (explizit ausgeschlossen)

### Verwendung des Kreuzes (X)

Laut Vorlesung gibt es fünf Notationsfälle. Wir unterscheiden bewusst zwischen:

- **Pfeilspitze ohne X auf der Rückseite** (Fall 3): "A kennt B, Rückrichtung unspezifiziert"
- **Pfeilspitze + X auf der Rückseite** (Fall 4): "A kennt B, B kennt A explizit nicht"

**Position des X**: Das X steht am Linienende gegenüber der Pfeilspitze, also auf der Seite des Objekts, das nicht zurücknavigieren kann. Beispiel: `Arbeitsauftrag ✕----------> Dokument` -- die Pfeilspitze nahe Dokument bedeutet "Arbeitsauftrag kennt Dokument", das X nahe Arbeitsauftrag bedeutet "Dokument kennt Arbeitsauftrag nicht".

Das X wird verwendet wenn:
1. Die andere Seite ein passives Wertobjekt ist (z.B. Adresse, Dokument, Bild) -- soll explizit niemanden kennen
2. Eine Rückreferenz bewusst vermieden werden soll (z.B. weil sie redundant wäre oder zu unsinnigen Listen über viele heterogene Quellen führen würde)
3. Mehrere verschiedene Klassen auf dasselbe Ziel zeigen und eine Rückreferenz schwierig wäre

Bei jeder unidirektionalen Beziehung muss aktiv hinterfragt werden, ob ein X sinnvoll ist oder ob die Rückrichtung lediglich noch unentschieden ist.

### Unidirektionale Assoziationen

- Bei unidirektionalen Assoziationen wird die Multiplizität am Quellende (auf der Seite des "kennenden" Objekts) weggelassen, da das Zielobjekt seine Quellen nicht kennt und die Multiplizität dort konzeptuell irrelevant ist
- Begründung: Aufgeräumteres Diagramm, vermeidet falsche Annahmen über Rückwärtsnavigation
- Wertobjekte (z.B. Adresse, Dokument) werden in der Regel unidirektional referenziert

### Komposition vs. Assoziation

Komposition (gefüllte Raute) wird verwendet wenn:
1. Existenzabhängigkeit -- das Teil kann ohne das Ganze nicht existieren
2. Kaskadierendes Löschen -- wird das Ganze gelöscht, werden die Teile mitgelöscht
3. Exklusive Zugehörigkeit -- ein Teil gehört zu genau einem Ganzen

### Rollennamen

- Pflicht wenn mehrere Assoziationen zwischen denselben zwei Klassen existieren
- Optional bei eindeutigen Beziehungen

### Kohärenz mit dem Lastenheft

- Jede Beziehung muss in einer QaA-Frage in `chapter/1_Aufgabenstellung.typ` explizit hinterfragt und beantwortet sein
- Beziehungen müssen konsistent zum gesamten Lastenheft sein -- keine Widersprüche
- QaA-Antworten sollen aus Kundensicht formuliert sein -- keine Fachbegriffe wie "n:m", "bidirektional"; stattdessen die Frage konkret beantworten ("Ja, ein Mitarbeiter kann mehreren Aufträgen zugewiesen sein")

---

## Beziehungen

### Arbeitsauftrag

| Ziel | Multiplizität | Typ | Richtung | Begründung |
|------|---------------|-----|----------|-----------|
| Projekt | `1 -------◆ 0..*` (Raute beim Projekt) | Komposition (Projekt = Ganzes) | bidirektional | Auftrag kann ohne Projekt nicht existieren (Lastenheft Zeile 424). Beim Löschen eines Projekts werden alle Aufträge mitgelöscht (kaskadierendes Löschen). Bidirektional, weil Projekt seine Aufträge in der GUI anzeigen muss (LF 30). Raute steht beim Projekt, weil Projekt das Ganze ist. |
| Dokument | `✕------> 0..*` | Assoziation, unidirektional mit X | Arbeitsauftrag kennt Dokument | Dokument ist ein zentral verwaltetes Wertobjekt ohne Rückreferenz (Zeile 561 entityFigure). Mehrere Aufträge können dasselbe Dokument referenzieren. X auf Arbeitsauftrag-Seite, weil Dokument seine Quellen explizit nicht kennen soll -- es wird auch von Projekt und Rechnung referenziert, eine Rückreferenz wäre eine unsinnige Liste über heterogene Quellen. |
| Mitarbeiter | `0..* ------- 1..*` | Assoziation, bidirektional | beide Seiten kennen sich | Jeder Auftrag muss mindestens einem Mitarbeiter zugeordnet sein (Lastenheft Zeile 408 -- daher 1..* auf Mitarbeiter-Seite). Ein Mitarbeiter kann mehreren Aufträgen zugewiesen sein. Vorarbeiter müssen ihre Aufträge in der GUI sehen (Zeile 358), daher bidirektional. |
| Adresse (Einsatzort) | `✕------> 1` | Assoziation, unidirektional mit X | Arbeitsauftrag kennt Adresse | Adresse ist ein passives Wertobjekt, das von mehreren Entitäten (Projekt, Mitarbeiter, Lager, Unterauftragnehmer) wiederverwendet wird. X auf Arbeitsauftrag-Seite, weil Adresse explizit niemanden zurück kennt -- sonst müsste sie eine Liste über alle möglichen referenzierenden Klassen führen. |
| Termin | `1 ------- 2..*` | Assoziation, bidirektional | beide Seiten kennen sich | Jeder Auftrag hat genau einen Starttermin und einen Endtermin (Pflicht), plus beliebig viele Zwischentermine -- daher 2..*. Termin-Typ wird über Attribut `Typ` unterschieden (Lastenheft Zeile 411). Bidirektional, weil der Terminplaner Termine den Aufträgen zuordnen muss. |
| Unterauftrag | `1 ◆-------- 0..*` (Raute beim Arbeitsauftrag) | Komposition (Arbeitsauftrag = Ganzes) | bidirektional | Unterauftrag ist existenzabhängig vom Arbeitsauftrag (Lastenheft LF 40). Wird unter Arbeitsauftrag-Detailansicht verwaltet. Bidirektional, weil Unterauftrag seinen Arbeitsauftrag explizit kennt (Zeile 609 entityFigure: `[Arbeitsauftrag], [Referenz]`). Raute beim Arbeitsauftrag, weil dieser das Ganze ist. |

**Auf Arbeitsauftrag zeigend:**

| Quelle | Multiplizität | Typ | Begründung |
|--------|---------------|-----|-----------|
| Buchung | `Buchung 0..* -------> 1 Arbeitsauftrag` | Assoziation, unidirektional | Buchung kennt den Auftrag (Zeile 730 entityFigure). Ob Arbeitsauftrag seine Buchungen kennen soll, ist noch offen. |
| Rechnung | siehe Sektion Rechnung -- bidirektional | Assoziation, bidirektional | Mehrere Rechnungen pro Auftrag, jede Rechnung gehört zu genau einem Auftrag. |

**Offene Punkte für Arbeitsauftrag:**

- Soll Arbeitsauftrag seine Buchungen kennen (bidirektional)? Im Lastenheft nicht explizit geklärt.

### Rechnung

| Ziel | Multiplizität | Typ | Richtung | Begründung |
|------|---------------|-----|----------|-----------|
| Arbeitsauftrag | `0..* ------- 1` | Assoziation, bidirektional | beide Seiten kennen sich | Ein Auftrag kann mehrere Rechnungen haben (Teil- und Schlussrechnungen, neue QaA nach Zeile 150). Jede Rechnung gehört zu genau einem Auftrag. Bidirektional, weil Rechnungen in der Auftragsdetailansicht angezeigt werden. Keine Komposition, da Rechnungen aus dem externen Finanzbuchhaltungssystem stammen und der 10-Jahres-Aufbewahrungsfrist unterliegen -- kein kaskadierendes Löschen. |
| Dokument | `✕------> 0..1` | Assoziation, unidirektional mit X | Rechnung kennt Dokument | Jede Rechnung verweist optional auf eine PDF im zentralen Dokumenten-Container (Zeile 148 entityFigure). Multiplizität 0..1, weil zunächst nur die Rechnungsdaten ohne PDF angelegt werden können. X auf Rechnung-Seite, weil Dokument als Wertobjekt seine Quellen nicht kennt (analog zu Arbeitsauftrag → Dokument). |

### Unterauftrag

| Ziel | Multiplizität | Typ | Richtung | Begründung |
|------|---------------|-----|----------|-----------|
| Arbeitsauftrag | `0..* --------◆ 1` (Raute beim Arbeitsauftrag) | Komposition (Arbeitsauftrag = Ganzes) | bidirektional | Spiegelseite zur Arbeitsauftrag → Unterauftrag-Beziehung. Unterauftrag kann ohne Arbeitsauftrag nicht existieren (LF 40, Zeile 590). Unterauftrag kennt seinen Arbeitsauftrag (Zeile 609 entityFigure). Arbeitsauftrag kennt seine Unteraufträge (Detailansicht, Zeile 600-601). |
| Unterauftragnehmer | `✕------> 1` | Assoziation, unidirektional mit X | Unterauftrag kennt Unterauftragnehmer | Zeile 610 entityFigure: Referenz auf externen Unterauftragnehmer. Multiplizität 1 (genau einer, Pflicht), weil ein Unterauftrag ohne Vertragspartner geschäftlich keinen Sinn ergibt -- bei mehreren Firmen würde man getrennte Unteraufträge anlegen. X auf Unterauftrag-Seite, weil der Unterauftragnehmer extern ist und nicht im System aktiv arbeitet -- er ist nur als Kontaktdatensatz hinterlegt (Zeile 598) und braucht keine Rückreferenz. |
| Termin | `1 ------- 2..*` | Assoziation, bidirektional | beide Seiten kennen sich | Konsistent mit Arbeitsauftrag-Termin-Modellierung: mindestens ein Starttermin und ein Endtermin (Pflicht), zusätzliche Zwischentermine optional. Termin-Typ über Attribut `Typ` unterschieden. Bidirektional, weil Terminplaner Termine den Unteraufträgen zuordnen muss. |


### Mitarbeiter

**Vererbung:**

| Beziehung | Notation | Begründung |
|-----------|----------|-----------|
| Mitarbeiter → Person | `Mitarbeiter ─▷ Person (abstract)` | Mitarbeiter erbt Vorname, Nachname, Telefonnummer, E-Mail und Adresse von der abstrakten Klasse Person (Zeile 306, 316). Pfeilspitze (ungefülltes Dreieck) zeigt zur Oberklasse. |

**Von Mitarbeiter ausgehend:**

| Ziel | Multiplizität | Typ | Richtung | Begründung |
|------|---------------|-----|----------|-----------|
| Adresse (geerbt von Person) | `✕------> 1` | Assoziation, unidirektional mit X | Person kennt Adresse | Adresse ist passives Wertobjekt (Zeile 313). X auf Person-Seite, da Adresse niemanden zurückkennt. |
| Rolle | `✕------> 1` | Assoziation, unidirektional mit X | Mitarbeiter kennt Rolle | Jeder Mitarbeiter hat genau eine Rolle (Zeile 364: "jeder Benutzer hat genau eine Rolle"). Rolle ist passives Stammdaten-Objekt mit vier festen Rollen. X auf Mitarbeiter-Seite, weil Rolle ihre Mitarbeiter nicht kennen muss. |

**Bidirektionale Beziehungen:**

| Andere Entität | Multiplizität | Typ | Richtung | Begründung |
|---------------|---------------|-----|----------|-----------|
| Arbeitsauftrag | `0..* ------- 1..*` | Assoziation, bidirektional | beide Seiten kennen sich | Bereits in Arbeitsauftrag-Sektion modelliert. Jeder Auftrag braucht mindestens einen Mitarbeiter, ein Mitarbeiter kann mehreren Aufträgen zugewiesen sein. Vorarbeiter sieht seine Aufträge in der GUI (Zeile 433). |
| Gruppe (als Mitglied) | `0..* ------- 0..*` (Rollenname `mitglied`) | Assoziation, bidirektional | beide Seiten kennen sich | n:m laut Zeile 553. Mitarbeiter muss nicht zwingend einer Gruppe angehören (neue QaA: Administrator, neu eingestellt). Eine Gruppe kann temporär leer sein (Zeile 532). Bidirektional, weil GUI in beide Richtungen anzeigt: Gruppen-Detailansicht zeigt Mitglieder, Mitarbeiter-Detailansicht zeigt seine Gruppen. **Rollenname Pflicht**, weil zweite Beziehung zu Gruppe (Leiter) existiert. |
| Gruppe (als Leiter) | `0..1 ------- 0..*` (Rollenname `gruppenleiter`) | Assoziation, bidirektional | beide Seiten kennen sich | Zeile 549: Gruppenleiter ist optional (nicht jede Gruppe braucht einen). Ein Mitarbeiter kann mehrere Gruppen leiten. **Rollenname Pflicht**, weil zweite Beziehung zu Gruppe. |
| Projekt (als Projektleiter) | `1 ------- 0..*` (Rollenname `projektleiter`) | Assoziation, bidirektional | beide Seiten kennen sich | Jedes Projekt hat genau einen Projektleiter (neue QaA), nicht optional. Ein Mitarbeiter kann mehrere Projekte gleichzeitig leiten. Bidirektional, weil Projektleiter seine Projekte in der Übersicht sehen muss. **Rollenname Pflicht** wegen Eindeutigkeit. |
| Anwesenheitszeit | `1 ◆------- 0..*` (Raute beim Mitarbeiter) | **Komposition** (Mitarbeiter = Ganzes) | bidirektional | Anwesenheitszeit ist existenzabhängig vom Mitarbeiter und exklusiv zugeordnet (neue QaA). Beim Ausscheiden des Mitarbeiters werden die Anwesenheitszeiten archiviert (10-Jahres-Aufbewahrungsfrist, LL 20). Mitarbeiter muss seine eigenen Zeiten einsehen können (Zeile 901). Raute beim Mitarbeiter, weil dieser das Ganze ist. |

**Auf Mitarbeiter zeigend (Audit-Felder mit X):**

| Quelle | Multiplizität | Typ | Richtung | Begründung |
|--------|---------------|-----|----------|-----------|
| Dokument (als Hochlader) | `Dokument ✕------> 1 Mitarbeiter` (Rollenname `hochlader`) | Assoziation, unidirektional mit X | Dokument kennt Hochlader | Audit-Feld (Zeile 580): wer das Dokument hochgeladen hat. X auf Mitarbeiter-Seite, weil Mitarbeiter seine hochgeladenen Dokumente nicht direkt am Objekt zurückverfolgen muss -- bei Bedarf über die Dokumenten-Suchmaske mit Filter "Hochlader". |
| Buchung (als Bucher) | `Buchung ✕------> 1 Mitarbeiter` (Rollenname `gebuchtVon`) | Assoziation, unidirektional mit X | Buchung kennt Bucher | Audit-Feld (Zeile 753) für Nachvollziehbarkeit ("Wer hat Bagger 3 gebucht?"). X auf Mitarbeiter-Seite analog zu Hochlader -- ein Mitarbeiter muss seine Buchungen nicht direkt am Objekt hängen haben (bei Bedarf über Buchungs-Suchmaske mit Filter). |

### Projekt

**Von Projekt ausgehend:**

| Ziel | Multiplizität | Typ | Richtung | Begründung |
|------|---------------|-----|----------|-----------|
| Mitarbeiter (als Projektleiter) | `Projekt 0..* ------- 1 Mitarbeiter` (Rollenname `projektleiter`) | Assoziation, bidirektional | beide Seiten kennen sich | Lastenheft Zeile 387: `[Projektleiter], [Referenz auf Mitarbeiter]`. Zeile 397 (neue QaA): "Jedes Projekt hat genau einen Projektleiter ... Ein Projektleiter kann allerdings mehrere Projekte gleichzeitig leiten." Bidirektional, weil Projektleiter seine Projekte in der Übersicht sehen muss (Zeile 358: "Bau-/Projektleiter haben Vollzugriff auf projektbezogene Daten"). **Rollenname Pflicht** wegen Eindeutigkeit der Rolle. |
| Adresse (Einsatzort) | `Projekt ✕------> 1 Adresse` | Assoziation, unidirektional mit X | Projekt kennt Adresse | Lastenheft Zeile 388: `[Einsatzort], [Referenz auf Adresse der Baustelle]`. Genau eine Adresse pro Projekt (analog zu Arbeitsauftrag und Mitarbeiter). X auf Projekt-Seite, weil Adresse als passives Wertobjekt von vielen Entitäten wiederverwendet wird und niemanden zurückkennt. |
| Termin | `Projekt 1 -------- 2 Termin` | Assoziation, bidirektional | beide Seiten kennen sich | Lastenheft (neue QaA nach Zeile 397): "Ein Projekt hat nur einen Starttermin und einen Endtermin. Zwischentermine werden auf Projektebene nicht angelegt, da sich diese aus den Terminen der einzelnen Arbeitsaufträge ergeben." Multiplizität daher genau `2` (nicht `2..*` wie beim Arbeitsauftrag). Termin-Typ über Attribut `Typ` unterschieden. Bidirektional wegen Terminplaner. |
| Dokument | `Projekt ✕------> 0..* Dokument` | Assoziation, unidirektional mit X | Projekt kennt Dokumente | Lastenheft Zeile 392: `[Dokumente], [Liste übergeordneter Projektdokumente (z.B. Projektpläne, Verträge)]`. Zeile 567 listet Projekt explizit als Quelle, die auf Dokument verweist. X auf Projekt-Seite, weil Dokument als Wertobjekt seine Quellen nicht kennt -- analog zu Arbeitsauftrag → Dokument. |
| Arbeitsauftrag | `Projekt 1 ◆-------- 0..* Arbeitsauftrag` (Raute beim Projekt) | **Komposition** (Projekt = Ganzes) | bidirektional | Lastenheft Zeile 423: "ein Projekt enthält einen oder mehrere Arbeitsaufträge" (Hinweis: korrigiert auf 0..*, weil Zeile 430 sagt "ein neu angelegtes Projekt kann zunächst ohne Aufträge existieren"). Zeile 433: "jeder Auftrag muss einem Projekt zugeordnet sein" -- Existenzabhängigkeit. Zeile 436 (neue QaA): "Wenn ein Projekt gelöscht wird, werden auch alle zugehörigen Arbeitsaufträge mit gelöscht" -- kaskadierendes Löschen. Bidirektional, weil Arbeitsauftrag sein Projekt explizit kennt (Zeile 405 entityFigure). |

**Auf Projekt zeigend:**

(keine direkten Bild-Beziehungen mehr -- Projekt erbt von `Bildbar` und bekommt die Bild-Zuordnung über die Bildbar-Komposition. Siehe Sektion Bildbar.)

### Gerät

**Von Gerät ausgehend:**

| Ziel | Multiplizität | Typ | Richtung | Begründung |
|------|---------------|-----|----------|-----------|
| Geräte-Typ | `Gerät 0..* ✕------> 1 Geräte-Typ` | Assoziation, unidirektional mit X | Gerät kennt seinen Typ | Lastenheft Zeile 689: "Jedes konkrete Gerät (Exemplar) verweist auf genau einen `Geräte-Typ`". **Exemplartyp-Muster** (explizit so im Lastenheft benannt). Multiplizität 1, Pflicht. X auf Gerät-Seite, weil Geräte-Typ als Stammdaten-Klasse seine Geräte nicht direkt am Objekt kennen muss -- bei Bedarf über Suchmaske mit Filter "Typ". |
| Lager | `Gerät 0..* -------- 1 Lager` | Assoziation, bidirektional | beide Seiten kennen sich | Lastenheft Zeile 680: "Alle Baumaschinen und -werkzeuge sind einzelnen Lagern zugeordnet." Multiplizität 1 (Pflicht). Bidirektional, weil Lager-Detailansicht alle zugeordneten Geräte anzeigen soll (neue QaA). |
| Ausrüstung | `Gerät 0..1 ◇-------- 0..* Ausrüstung` (leere Raute beim Gerät) | **Aggregation** (Gerät = Ganzes) | bidirektional | Lastenheft (neue QaA): "Eine Ausrüstung kann an einem passenden Gerät montiert sein, ist aber nicht fest mit ihm verbunden. Sie kann abmontiert und an einem anderen kompatiblen Gerät genutzt werden." **Baugruppe-Muster**. Aggregation (leere Raute), nicht Komposition, weil Ausrüstung auch ohne Gerät existiert (im Lager). Bidirektional, weil Buchung des Geräts die montierte Ausrüstung mitbucht (neue QaA). |

**Auf Gerät zeigend:**

| Quelle | Multiplizität | Typ | Richtung | Begründung |
|--------|---------------|-----|----------|-----------|
| Buchung | `Buchung 0..* ✕-------> 1 Gerät` | Assoziation, unidirektional mit X | Buchung kennt Gerät | Lastenheft Zeile 760 (korrigiert): "Referenz auf genau ein gebuchtes Gerät -- für mehrere Geräte werden separate Buchungen angelegt." Neue QaA bestätigt Multiplizität 1. X auf Gerät-Seite, weil Gerät seine Buchungen nicht direkt am Objekt hängen haben muss -- Verfügbarkeitsprüfung erfolgt über Buchungs-Suchmaske mit Filter "Gerät" und "Zeitraum". |

(keine direkten Bild-Beziehungen mehr -- Gerät erbt von `Bildbar` und bekommt die Bild-Zuordnung über die Bildbar-Komposition. Siehe Sektion Bildbar.)

**Geklärte Punkte für Gerät:**

- Eine Buchung umfasst genau ein Gerät (Multiplizität 1), nicht mehrere
- Ausrüstung ist Aggregation (austauschbar), nicht Komposition (fest verbaut)
- Bei Buchung eines Geräts wird die aktuell montierte Ausrüstung automatisch mitgebucht
- Lager kennt seine Geräte (bidirektional)
- Geräte-Typ ist eine reine Stammdaten-Klasse (X auf Gerät-Seite)
- Wartungstermine werden als einfaches `Datum` modelliert (nicht als Termin-Referenz, Zeile 718)

### Bildbar (abstrakte Klasse) und Bild

`Bildbar` ist eine abstrakte Klasse, von der alle Entitäten erben, die Bilder zugeordnet bekommen können sollen. Damit wird das Anti-Pattern eines generischen `Element`-Attributs mit Typ-Diskriminator vermieden und stattdessen eine saubere, einzige Beziehung zwischen `Bild` und `Bildbar` modelliert.

**Vererbung (kein Multiplizitäten, leerer Dreieckskopf zur Oberklasse):**

| Unterklasse | Notation | Begründung |
|-------------|----------|-----------|
| Mitarbeiter → Bildbar | `Mitarbeiter ─▷ Bildbar (abstract)` | Lastenheft Zeile 862--863: Mitarbeiter gehört zu den primären Bildträgern (z.B. Mitarbeiterfoto). |
| Auftrag → Bildbar | `Auftrag ─▷ Bildbar (abstract)` | Lastenheft Zeile 858 + 862--863: Auftrag (Arbeits- und Unterauftrag) gehört zu den primären Bildträgern (z.B. Baufortschritts-Bilder). |
| Projekt → Bildbar | `Projekt ─▷ Bildbar (abstract)` | Lastenheft Zeile 862--863: Projekte gehören zu den primären Bildträgern (z.B. Übersichtsbilder). |
| Gerät → Bildbar | `Gerät ─▷ Bildbar (abstract)` | Lastenheft Zeile 862--863: Baumaschinen und Bauwerkzeuge gehören zu den primären Bildträgern. |

Generalisierungsmenge: `{disjoint, incomplete}` -- ein Objekt ist entweder Mitarbeiter, Auftrag, Projekt oder Gerät (nicht mehrere gleichzeitig), und es können später weitere bildbare Klassen ergänzt werden.

**Komposition Bildbar ↔ Bild (von Bildbar ausgehend):**

| Ziel | Multiplizität | Typ | Richtung | Begründung |
|------|---------------|-----|----------|-----------|
| Bild | `Bildbar ◆-------> 0..* Bild` (Raute beim Bildbar) | **Komposition** (Bildbar = Ganzes) | unidirektional (Bildbar kennt seine Bilder) | Lastenheft Zeile 858 (LF 80): "Allen Elementen sollen beliebig viele Bilder mit Titel zugeordnet werden können." Komposition, weil ein Bild ohne sein Element nicht existieren kann -- wird das Element gelöscht, werden seine Bilder mitgelöscht. Multiplizität `0..*` an der Pfeilspitze (Vorlesungs-Vereinbarung: Multiplizitäten ausschließlich an der Pfeilspitze). Unidirektional, weil Bild seine Quelle nicht zurückkennen muss -- die Zuordnung ist über die Komposition eindeutig (jedes Bild gehört zu genau einem Bildbar, kein Bild wandert zwischen Elementen). |

**Auf Bild zeigend (Audit-Feld):**

| Quelle | Multiplizität | Typ | Richtung | Begründung |
|--------|---------------|-----|----------|-----------|
| Bild → Mitarbeiter (als Hochlader) | `Bild ✕-------> 1 Mitarbeiter` (Rollenname `hochlader`) | Assoziation, unidirektional mit X | Bild kennt Hochlader | Lastenheft Zeile 890: jedes Bild hat einen Hochlader (Audit-Feld). Multiplizität `1` an der Pfeilspitze (Pflicht). X auf Bild-Seite, weil Mitarbeiter seine hochgeladenen Bilder nicht direkt am Objekt hängen haben muss -- bei Bedarf über die Bilder-Suchmaske mit Filter "Hochlader". Keine Komposition: das Bild gehört zum Bildbar-Element, nicht zum Hochlader -- wenn der Mitarbeiter ausscheidet, bleibt das Bild erhalten. |

**Geklärte Punkte für Bildbar:**

- `Bildbar` ist eine abstrakte Klasse ohne eigene Attribute -- rein strukturell als gemeinsamer Typ
- Die generischen Attribute `[Element]` und `[Elementtyp]` werden in `Bild` durch die Bildbar-Komposition ersetzt
- Komposition (gefüllte Raute) ist korrekt: Bilder sind existenzabhängig vom Element, kaskadierendes Löschen, exklusive Zugehörigkeit
- Multiplizitäten stehen nur an den Pfeilspitzen, nicht an den Pfeilenden (Vorlesung Folie 62, Vereinbarung 1)
- Vererbungspfeile tragen keine Multiplizitäten (Vererbung ist keine Assoziation)
- Der Hochlader bleibt als separate Assoziation `Bild → Mitarbeiter` bestehen -- ist nicht Teil der Bildbar-Hierarchie

---

## Mögliche Verbesserungen für das Klassendiagramm

Diese Punkte wurden in den Diskussionen identifiziert, sind aber bewusst noch nicht final entschieden. Sie sollten beim Klassendiagramm-Entwurf abschließend geklärt werden.

**Klassifikation:**
- 🔴 **KRITISCH** -- das Lastenheft (`chapter/1_Aufgabenstellung.typ`) enthält bereits Aussagen oder Attributtabellen, die bei Umsetzung dieses Punkts angepasst werden müssen. Widerspruch würde entstehen wenn nur das Diagramm geändert wird.
- 🟢 **ADD-ON** -- reine Diagramm-Verbesserung ohne Lastenheft-Widerspruch. Kann optional umgesetzt werden ohne Textänderungen im Lastenheft.

### 🟢 Auftrag-Hierarchie (gemeinsame abstrakte Klasse)

Arbeitsauftrag und Unterauftrag teilen viele Attribute und Beziehungen:
- Bezeichnung, Status, Bemerkung
- Termine (mit Multiplizität 2..*)
- Status-Konzept (Offen, in Bearbeitung, abgeschlossen)

**Mögliche Verbesserung:** Eine abstrakte Basisklasse `Auftrag`, von der `Arbeitsauftrag` und `Unterauftrag` erben. Vorteile:

- Vermeidung redundanter Attribute
- Gemeinsame Operationen (z.B. Termine verwalten) müssen nur einmal definiert werden
- Klassendiagramm wird übersichtlicher
- Vererbung ist ein wichtiges Analysemuster, das in der Bewertung zählt

**Achtung:** Genau prüfen, welche Attribute wirklich gemeinsam sind. Z.B. hat Unterauftrag `Kosten` und `Unterauftragnehmer` -- die hat Arbeitsauftrag nicht. Arbeitsauftrag hat `Mitarbeiter`, `Projekt` und `Dokumente` -- die hat Unterauftrag nicht.

Lastenheft-Status: Arbeitsauftrag (Zeile 402--414) und Unterauftrag (Zeile 617--626) sind separat definiert, gemeinsame Basisklasse wird nirgends erwähnt aber auch nicht ausgeschlossen. Reine Diagramm-Optimierung.

### 🟢 Auftragspositionen / Liste-Muster

Aktuell hängen Dokumente und Termine direkt am Auftrag. Im Lastenheft (LF 30) wird auch von "Angeboten, Rechnungen und Mahnungen" gesprochen, die mit Auftragspositionen vergleichbar wären. Das **Liste-Analysemuster** (siehe CLAUDE.md) wäre hier ein guter Kandidat.

Lastenheft-Status: Rechnungspositionen werden im Lastenheft nirgends gefordert -- Rechnung hat nur ein Attribut `Betrag` (Gesamtbetrag, Zeile 140--152). Reine Zusatz-Modellierung ohne Lastenheft-Bezug.

### 🔴 Rolle als Enumeration statt Klasse

Aktuell ist `Rolle` eine eigene Klasse mit Assoziation zu `Mitarbeiter` (siehe Mitarbeiter-Sektion, Zeile 115). Da im Lastenheft nur vier feste Werte vorgegeben sind (Administrator, Verwaltung, Bau-/Projektleiter, Vorarbeiter) und die Klasse keine eigenen Attribute oder Operationen hat, sollte sie als `<<enumeration>>` modelliert werden. Der Mitarbeiter bekommt dann ein Attribut `rolle: Rolle` statt einer Assoziationslinie. Konsistent mit den Enums, die in `chapter/7_Besonderheiten.typ` bereits vorgesehen sind.

**Was im Lastenheft angepasst werden muss:**
- Zeile 299--302: `Rolle`-Attributtabelle (`Rollennummer`, `Name`) wird ungültig -- entweder entfernen oder als "Enum-Wert" umformulieren
- Assoziation Mitarbeiter → Rolle (aktuell in Beziehungen.md Zeile 115) wird zu Attribut `rolle: Rolle`

### 🔴 Position-Enum bei Mitarbeiter ergänzen

Die im Lastenheft geforderte Trennung zwischen Berechtigung (`Rolle`) und fachlicher Tätigkeit (Maurer, Elektriker, Zimmermann, Vorarbeiter, Polier, Bauleiter, ...) sollte durch ein separates Enum `Position` abgebildet werden. Attribut `position: Position` bei Mitarbeiter.

**Was im Lastenheft angepasst werden muss:**
- Zeile 321: Position-Attribut aktuell als `[Text]` mit Aufzählung -- muss zu `[Enum Position]` umgeändert werden
- Zeile 215: CSV-Import-Beispiel enthält Position als Text-Feld -- konsistent zu Enum umstellen

### 🟢 Bildbar als Interface statt abstrakte Klasse

`Bildbar` ist aktuell als abstrakte Klasse mit Vererbungspfeil modelliert. Da `Mitarbeiter` bereits von `Person` erbt, würde eine zusätzliche Vererbung von `Bildbar` in Java zu Mehrfachvererbung führen (nicht erlaubt). Umstellung: `Bildbar` als `<<interface>>`, alle bildbaren Klassen realisieren es mit **gestricheltem Realisierungspfeil** (leeres Dreieck). Mitarbeiter erbt normal von Person **und** realisiert Bildbar.

Lastenheft-Status: LF 80 (Zeile 858--917) fordert nur, dass "allen Elementen Bilder zugeordnet werden können" -- ob als Interface oder abstrakte Klasse modelliert ist reine UML/Java-Entscheidung. Kein Widerspruch im Lastenheft.

### 🟢 Buchung als Assoziationsklasse

Buchung ist aktuell eine eigenständige Klasse mit drei unidirektionalen Referenzen (Arbeitsauftrag, Gerät, Mitarbeiter). Vorlesungs-konformer wäre die Modellierung als **Assoziationsklasse** zwischen `Arbeitsauftrag` und `Gerät` mit gestrichelter Anschlusslinie (Folie 57). Die Attribute `Zeitraum` und `Status` sind klassische "Verbindungs-Attribute", die weder zu Auftrag noch zu Gerät passen. Der Bucher (Mitarbeiter) bleibt als separate Assoziation mit X (Audit-Feld).

Lastenheft-Status: Buchung (Zeile 763--774) ist mit denselben Attributen definiert, die auch in einer Assoziationsklasse stünden. Kein Text-Widerspruch -- reine UML-Notationswahl.

### 🟢 Termin als Komposition statt Assoziation

Termine sind aktuell als bidirektionale Assoziation zu Arbeitsauftrag/Unterauftrag/Projekt modelliert (Zeile 72, 99, 142). Alle drei Komposition-Kriterien sind aber erfüllt:
1. Ein Termin ohne seinen Auftrag ergibt keinen Sinn (Existenzabhängigkeit)
2. Wird der Auftrag gelöscht, verschwinden auch seine Termine (kaskadierendes Löschen)
3. Ein Termin gehört zu genau einem Auftrag (exklusive Zugehörigkeit -- keine geteilten Termine)

Umstellung auf **Komposition** (gefüllte Raute beim Auftrag/Projekt).

Lastenheft-Status: Das Lastenheft impliziert bereits Komposition (Zeile 422, 438 -- kaskadierendes Löschen, Existenzabhängigkeit). Keine Textänderung nötig, nur Diagramm-Notation.

### 🔴 Status- und Typ-Enums explizit im Diagramm zeichnen

Die in `chapter/7_Besonderheiten.typ` bereits geplanten Enums (`AuftragStatus`, `BuchungStatus`, `GerätStatus`, `TerminTyp`, `DokumentTyp`, `AnwesenheitTyp`, `GerätKategorie`, `Gruppentyp`) sollten als `<<enumeration>>`-Klassen im Klassendiagramm sichtbar sein, nicht nur als Text-Attribute. Beim jeweiligen Objekt als Attribut `status: AuftragStatus` etc. referenziert.

**Was im Lastenheft angepasst werden muss:** Attribute die aktuell als `[Text]` mit Wert-Aufzählungen deklariert sind, müssen zu Enum-Referenzen umgeändert werden:
- Zeile 147 (Rechnung-Status)
- Zeile 412 (Auftrag-Status)
- Zeile 585 (Dokument-Typ)
- Zeile 710 (Gerät-Status)
- Zeile 773 (Buchung-Status)
- Zeile 950 (Anwesenheit-Typ)

### 🟢 Multiplizitäten-Konvention klarstellen

Konvention für dieses Projekt: Im Klassendiagramm werden Multiplizitäten **nur** dort angegeben, wo sie **nicht 1** sind. Fehlt eine Multiplizität, ist implizit 1 gemeint (Vorlesung Folie 62, Vereinbarung 3+4). Bidirektionale Beziehungen zeigen beide Multiplizitäten nur, wenn mindestens eine davon nicht 1 ist. In dieser Markdown werden Multiplizitäten trotzdem an beiden Enden dokumentiert, weil sie hier als Nachschlagewerk dienen -- im PNG-Diagramm werden sie nach Konvention reduziert.

Lastenheft-Status: Reine Diagramm-Notation, keine Textänderung nötig.

---

## Offene Fragen

Diese Punkte sind im Lastenheft noch nicht abschließend geklärt und sollten vor der finalen Klassendiagramm-Erstellung beantwortet werden.

1. **Soll Arbeitsauftrag seine Buchungen kennen?** Aktuell hat Buchung eine Referenz auf Arbeitsauftrag. Ob die Rückrichtung (Auftrag → seine Buchungen) im Klassendiagramm modelliert wird, ist unklar -- analog zu den Audit-Feldern könnte X gerechtfertigt sein.

2. **Auftragspositionen / Rechnungspositionen?** Das Lastenheft erwähnt Angebote, Rechnungen, Mahnungen, Kostenvoranschläge. Werden Rechnungspositionen separat modelliert oder bleiben sie als Bestandteil der Rechnungs-PDF (im Dokument)?

3. **Geräte-Standort als Adresse?** Aktuell ist `[Standort], [Text]` (Zeile 709) -- ein einfacher Text. Sollte dies eine Adresse-Referenz sein für konsistente Modellierung mit anderen Standortangaben?

4. **Gruppe-Hierarchie?** Lastenheft Zeile 525-526 spricht von "Baugruppen, die Arbeitsgruppen enthalten." Sollten verschachtelte Gruppen modelliert werden (Stückliste-Muster)?

5. **Auftragsstatus-Übergänge:** Bisher nur als Text-Attribut. Sollen Statuswechsel als Operationen modelliert werden (z.B. `auftragAbschliessen()`, `auftragStornieren()`)?

6. **Anwesenheitszeit-Komposition:** Aus rechtlichen Gründen werden Anwesenheitszeiten archiviert statt gelöscht. Ist Komposition trotzdem die richtige Modellierung? Konsistent mit Projekt → Arbeitsauftrag, wo wir das gleiche Argument akzeptiert haben.

7. **Rolle-Konfigurierbarkeit:** Im Lastenheft fest vorgegeben (4 Rollen). Sollte die Klasse `Rolle` als Enum oder als eigenständige Klasse modelliert werden?
