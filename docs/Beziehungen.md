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
| Bild (als Hochlader) | `Bild ✕------> 1 Mitarbeiter` (Rollenname `hochlader`) | Assoziation, unidirektional mit X | Bild kennt Hochlader | Audit-Feld (Zeile 890) analog zu Dokument-Hochlader. |

**Bemerkung zur Bild-Element-Beziehung (offen, später zu klären):**

Bild hat zusätzlich ein Attribut `Element` (Zeile 887), das auf das zugeordnete Objekt verweisen kann (Auftrag, Projekt, Maschine, Mitarbeiter). Die Modellierung ist aktuell als generisches "Element"-Attribut mit Typ-Diskriminator angelegt -- das ist ein Anti-Pattern. Saubere Modellierung wäre:

- **Variante A:** Abstrakte Klasse oder Interface `Bildbar`, das von Auftrag, Projekt, Gerät und Mitarbeiter implementiert wird. Bild → Bildbar mit einer Beziehung.
- **Variante B:** Vier separate Beziehungen Bild → Auftrag, Projekt, Gerät, Mitarbeiter.

Diese Designentscheidung bleibt vorerst offen und wird beim Klassendiagramm-Entwurf abschließend geklärt. Multiplizität laut Zeile 858: "beliebig viele Bilder" pro Element, also `0..*` -- ein Bild kann höchstens einem Element zugeordnet sein (`0..1`).

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

| Quelle | Multiplizität | Typ | Begründung |
|--------|---------------|-----|-----------|
| Bild (als zugeordnetes Element) | `Bild 0..* -------- 0..1 Projekt` (Rollenname `zugeordnetesElement`) | Assoziation, bidirektional | Lastenheft Zeile 858 (LF 80): "Allen Elementen sollen beliebig viele Bilder mit Titel zugeordnet werden können." Zeile 862-863: Projekte gehören zu den primären Bildträgern. Bidirektional, weil Detailansicht die Galerie zeigt (Zeile 876). **Hinweis:** Diese Beziehung ist Teil der noch offenen `Bildbar`-Designentscheidung (siehe Bemerkung in Mitarbeiter-Sektion). |

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
| Bild (als zugeordnetes Element) | `Bild 0..* -------- 0..1 Gerät` (Rollenname `zugeordnetesElement`) | Assoziation, bidirektional | Lastenheft Zeile 858 + 862-863: Geräte (Baumaschinen und Bauwerkzeuge) gehören zu den primären Bildträgern. Bidirektional wegen Galerie in Detailansicht. **Hinweis:** Teil der offenen `Bildbar`-Designentscheidung. |

**Geklärte Punkte für Gerät:**

- Eine Buchung umfasst genau ein Gerät (Multiplizität 1), nicht mehrere
- Ausrüstung ist Aggregation (austauschbar), nicht Komposition (fest verbaut)
- Bei Buchung eines Geräts wird die aktuell montierte Ausrüstung automatisch mitgebucht
- Lager kennt seine Geräte (bidirektional)
- Geräte-Typ ist eine reine Stammdaten-Klasse (X auf Gerät-Seite)
- Wartungstermine werden als einfaches `Datum` modelliert (nicht als Termin-Referenz, Zeile 718)

---

## Mögliche Verbesserungen für das Klassendiagramm

Diese Punkte wurden in den Diskussionen identifiziert, sind aber bewusst noch nicht final entschieden. Sie sollten beim Klassendiagramm-Entwurf abschließend geklärt werden.

### Bildbar-Pattern (Bild ↔ Element)

Aktuell modelliert das Lastenheft die Bild-zu-Element-Beziehung als generisches Attribut `[Element], [Referenz auf zugeordnetes Objekt (Auftrag, Projekt, Maschine, Mitarbeiter)]` mit Typ-Diskriminator `[Elementtyp]` (Zeile 887-888). Das ist ein Anti-Pattern.

**Saubere Modellierungsvarianten:**

- **Variante A (empfohlen):** Abstrakte Klasse oder Interface `Bildbar`, das von Auftrag, Projekt, Gerät und Mitarbeiter implementiert wird. Bild → Bildbar mit einer einzigen Beziehung. Vorteil: erweiterbar, sauber, ein zentrales Konzept.
- **Variante B:** Vier separate Beziehungen Bild → Auftrag, Projekt, Gerät, Mitarbeiter. Vorteil: explizit, kein abstraktes Konzept nötig. Nachteil: vier statt eine Beziehung, schwerer erweiterbar.

Für die Abschlussbewertung ist Variante A meist besser, da sie ein eigenes Analysemuster zeigt.

### Auftrag-Hierarchie (gemeinsame abstrakte Klasse)

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

### Auftragspositionen / Liste-Muster

Aktuell hängen Dokumente und Termine direkt am Auftrag. Im Lastenheft (LF 30) wird auch von "Angeboten, Rechnungen und Mahnungen" gesprochen, die mit Auftragspositionen vergleichbar wären. Das **Liste-Analysemuster** (siehe CLAUDE.md) wäre hier ein guter Kandidat.

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
