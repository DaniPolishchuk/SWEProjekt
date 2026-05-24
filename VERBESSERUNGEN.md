# Verbesserungsliste: Programmentwurf Bauunternehmen

Stand: 2026-05-24 — Abgeglichen gegen beide 1.0-Beispielarbeiten und Vorlesungsfolien

---

## 1. FEHLENDE KAPITEL (kritisch — ohne diese keine 1.0)

### 1.1 GUI-Mockups — KOMPLETT FEHLEND

- **Status**: Nicht vorhanden. Kein einziges Mockup erstellt.
- **Anforderung laut Aufgabenstellung**: Mindestens 2 wesentliche GUI-Komponenten (Hauptseite, Tabs etc.)
- **Was die 1.0-Beispiele zeigen**:
  - Beispiel 1: 3–4 Mockups (Dashboard, Kalenderansicht, Detailansicht, Suche) mit je 3–5 Absätzen Textbeschreibung, Java-Swing-Komponenten-Mapping
  - Beispiel 2: 3 Mockups + MVC-Kommunikationsschema (Abbildung mit ActionEvent-Fluss)
- **Was wir brauchen**:
  1. Beschreibung der gesamten GUI-Philosophie VOR den Mockups (Navigation, Sidebar, Rollenbasierung)
  2. Mindestens 2 Mockup-Skizzen als Bild (auch Handzeichnung erlaubt)
  3. Jedes Mockup mit ausführlicher Textbeschreibung (jedes UI-Element erklären)
  4. Verweis auf LF10, LF50, LF70 etc.
  5. KEIN Login-GUI
- **Zugehöriges Kapitel**: Neues Kapitel `chapter/3.3_GUI-Mockups.typ` anlegen und in `main-Programmentwurf.typ` einbinden

### 1.2 Entwurfskapitel (Aufgabe 3.3) — KOMPLETT FEHLEND

- **Status**: Nicht vorhanden. `main-Programmentwurf.typ` importiert kein Entwurfskapitel.
- **Anforderung laut Aufgabenstellung**:
  - Entwurfsklassendiagramm mit Entwurfsmustern
  - GUI-Modellierung (UML): Kommunikationsschema mit MVC-Muster (mind. 1 Controller, Modellklassen, unabhängige GUI/View)
  - swe-utils Java-Bibliothek in das Klassendiagramm integrieren
- **Was die 1.0-Beispiele zeigen**:
  - Beispiel 1: Kapitel 6 mit Entwurfsklassendiagramm + 3 Entwurfsmuster (Singleton, Adapter, Factory Method) + GUI-Modellierung
  - Beispiel 2: 5 Entwurfsmuster (Adapter, Factory, Singleton, Kompositum, Beobachter) + MVC-Schema mit Step-by-Step-Beschreibung
- **Erwartete Entwurfsmuster für unser Projekt**: Singleton, Adapter, Factory Method, Kompositum, Beobachter
- **Zugehöriges Kapitel**: Neues Kapitel `chapter/5_Entwurf.typ` anlegen

### 1.3 Besonderheiten-Abschnitt — NUR PLATZHALTER

- **Status**: In `chapter/1_Aufgabenstellung.typ` steht nur der Highlight-Platzhalter aus dem Originaltext — kein eigener Inhalt.
- **Anforderung**: 6–10 eigene Punkte, jeweils eigener Unterabschnitt, alles was über Mindestanforderungen hinausgeht
- **Was die 1.0-Beispiele zeigen**:
  - Beispiel 1: 10 Punkte (Allgemeinheit, Technische Expertise, Wartung, Auswahllisten, FiBu-Integration, Termine, UI-orientierte Modellierung, Eventualitäten, Mockups, Rechtschreibung)
  - Beispiel 2: 6 Punkte (Varianz, Backups, Übersichtlichkeit, Globaler Server, Datenverfügbarkeit, Externe Schnittstelle)
- **Mögliche Punkte für uns**: Farbkodierung im Klassendiagramm, Reflexionsabschnitte in SD/AD, Unterprogramm-Wiederverwendung, Duplikatsprüfung als eigenes Unterprogramm, Buchungs-Koordinator-Muster, Rollennamen statt einfacher Assoziationen, Tiefe der Q&A-Analyse (138 Fragen), etc.

---

## 2. KLASSENDIAGRAMM — FEHLER UND KORREKTUREN

Das Klassendiagramm hat mehrere Verstöße gegen die Vorlesungsregeln (Folien 62, 68, 69).

### 2.1 Multiplizitäten falsch platziert — KRITISCHER FEHLER

**Vorlesungsregel (Folie 62, explizit in Rot markiert)**:
> "Multiplizitäten ausschließlich an der **Pfeilspitze** angeben."
> "Keine Multiplizität an der Pfeilspitze bedeutet die Multiplizität 1."

**Fehler im Diagramm**: Multiplizitäten stehen an BEIDEN Enden der Pfeile — am Pfeilende (Quelle) UND an der Pfeilspitze (Ziel). Das ist laut Vorlesung falsch.

**Konkret falsch** (Beispiele aus dem Diagramm):
- `Buchung 0..* ——> 0..1 Gerät` — die `0..*` an der Quelle (Buchung-Seite) muss weg
- `Buchung 0..* ——> 0..* Arbeitsauftrag` — die linke `0..*` muss weg
- `Gerät 0..1 ——> 0..* Ausrüstung` — die `0..1` an der Quelle muss weg
- `Gerät 0..* ——> 0..1 Geräte-Typ` — die `0..*` an der Quelle muss weg
- `Projekt 0..* ——> 0..* Arbeitsauftrag` — beide Seiten beschriftet, nur Pfeilspitze behalten
- `Gruppe 0..* ——> 0..* Mitarbeiter` ("ist Mitglied von") — nur Pfeilspitze beschriften

**Korrekte Darstellung**: Multiplizität **nur** an der Pfeilspitze. Wenn die Gegenrichtung auch bekannt sein muss → bidirektionaler Pfeil mit Multiplizität an beiden Spitzen.

### 2.2 Buchung ist eine Assoziationsklasse — FEHLT

**Vorlesungsregel (Folie 68–69)**:
> Assoziationsklassen vereinen Eigenschaften einer Klasse und einer Assoziation. Sie sind mit der Assoziation über eine **gestrichelte Linie** verbunden.

**Problem**: `Buchung` ist das **Koordinator-Muster** — sie verbindet `Gerät` und `Arbeitsauftrag` mit eigenen Attributen (Zeitraum, Status). Sie sollte als **Assoziationsklasse** modelliert sein:
- Zwischen `Gerät` und `Arbeitsauftrag` läuft eine Assoziationslinie
- `Buchung` hängt per gestrichelter Linie senkrecht an dieser Assoziation
- NICHT als eigene Klasse mit normalen Assoziationspfeilen zu beiden Klassen

**Aktueller Zustand**: `Buchung` ist als normale Klasse mit normalen Pfeilen zu `Gerät` und `Arbeitsauftrag` verbunden — das ist die falsche UML-Notation für das Koordinator-Muster.

### 2.3 Vererbungspfeil Unterauftragnehmer → Person — Richtung prüfen

**Vorlesungsregel**: Vererbungspfeil zeigt von der **Unterklasse zur Oberklasse** (Pfeil mit hohlem Dreieck an der Spitze, Spitze zeigt zur Oberklasse).

**Im Diagramm**: `Unterauftragnehmer` und `Mitarbeiter` erben beide von `Person`. Die Pfeile sehen im PDF korrekt aus (Dreieck an `Person`), aber im draw.io-File prüfen ob die Pfeilrichtung tatsächlich korrekt ist.

### 2.4 Bidirektionale Assoziation Mitarbeiter ↔ Gruppe

**Vorlesungsregel (Folie 19, explizit in Rot)**:
> "In SWE1: **unidirektionale Assoziationen** verwenden!"

**Im Diagramm**: Die Beziehung `Mitarbeiter ↔ Gruppe` ist als bidirektional beschrieben ("beide Navigationsrichtungen geschäftlich benötigt"). 

**Abwägung**: Die Textbeschreibung in `3.2_Analyse-Klassendiagramm.typ` begründet Bidirektionalität explizit — das kann akzeptabel sein, muss aber im Text noch stärker begründet werden. Alternativ auf unidirektional umstellen: `Gruppe ——> Mitarbeiter`.

### 2.5 Gruppe-Muster fehlt im Diagramm

**Vorlesung und beide Beispielarbeiten** zeigen das Gruppe-Muster als eigenständiges Analysemuster:
- **Gruppe** hat 0..* **Mitglieder** (Mitarbeiter)
- Ein Mitarbeiter gehört zu **0..1** Gruppen (kann auch zu mehreren — abhängig von Geschäftsregel)
- Die Gruppe kann einen **Gruppenleiter** haben (optionaler Self-Reference oder benannte Assoziation)
- **Regel**: Gruppe kann temporär leer sein (0..* Mitglieder erlaubt)

**Problem im Diagramm**: Die Gruppenstruktur existiert, aber:
- Die Beziehung `Gruppe → Mitarbeiter` ist als n:m modelliert, obwohl das Lastenheft nicht eindeutig n:m verlangt
- `Gruppenleiter` ist als Label auf der Assoziation — das sollte eine **benannte Assoziation** mit eigenem Rollennamen sein, nicht eine separate Assoziation

### 2.6 Termin-Klasse — Beziehungen unklar / unvollständig

**Im Diagramm**: `Termin` ist als eigene Klasse vorhanden, aber:
- Hat **keine Attribute** (nur der Klassenname)
- Beziehungen zu `Arbeitsauftrag`, `Projekt` und `Buchung` sind vorhanden
- Die Pfeilrichtungen der Termin-Verbindungen sind teils unklar

**Was fehlt**: Attribute für `Termin` (Datum, Uhrzeit, Beschreibung, Typ: Haupttermin/Zwischentermin). Das Lastenheft nennt explizit Start-, End- und Zwischentermine.

**Alternativ**: Das **Rolle-Muster** für Termine modellieren — `Haupttermin` und `Zwischentermin` als verschiedene Rollen desselben Termin-Konzepts (wie in Beispiel 1 gezeigt).

### 2.7 Rechnung — Abhängigkeitspfeil falsch herum?

**Im Diagramm**: `Finanzbuchhaltung` hat eine gestrichelte Verbindung zu `Rechnung`.

**Vorlesungsregel (Folie 64)**:
> Abhängigkeit (gestrichelter Pfeil) zeigt von der abhängigen Klasse zur verwendeten Klasse.
> "Klasse C im Quellcode von A nur 'kurzfristig' in einer Methode verwendet → Abhängigkeit"

**Problem**: Das Finanzbuchhaltungssystem **liefert** Rechnungsdaten (lesend). Die Abhängigkeit sollte zeigen, dass unser System die `Rechnung`-Klasse vom `Finanzbuchhaltungssystem` **bezieht** (liest). Pfeilrichtung: `Rechnung ←— Finanzbuchhaltung` (unser System navigiert von Finanzbuchhaltung zu Rechnung, also Pfeil VON Finanzbuchhaltung ZU Rechnung ist korrekt — aber als `<<use>>`-Dependency kennzeichnen).

**Empfehlung**: Den Stereotype `<<use>>` oder `<<read>>` auf die gestrichelte Linie schreiben, um die Leserichtung zu verdeutlichen.

### 2.8 Bild-Klasse — Kompositions-Raute an falscher Stelle

**Vorlesungsregel**: Bei Komposition steht die **gefüllte Raute am Ganzen** (der enthaltenden Klasse), NICHT am Teil.

**Im Diagramm**: `Bild` wird durch Komposition mit `Mitarbeiter`, `Arbeitsauftrag`, `Projekt`, `Gerät` verbunden. Die Raute muss an der jeweiligen Elternklasse sitzen (Mitarbeiter/Arbeitsauftrag/Projekt/Gerät), der Pfeil zeigt zu `Bild`.

**Prüfen**: Ob in draw.io die Rauten tatsächlich an den richtigen Enden sitzen. Im PDF-Export ist dies schwer erkennbar.

### 2.9 Fehlende Analysemuster-Einzeldiagramme

**Beide 1.0-Beispiele** zeigen für jedes Analysemuster ein **separates Teildiagramm** (Ausschnitt) zusätzlich zum Gesamtdiagramm.

**Unser Stand**: Nur das Gesamtdiagramm, keine Einzeldarstellungen.

**Was fehlt** (pro Muster ein separates kleines Diagramm):
- Exemplartyp: Geräte-Typ → Gerät
- Baugruppe: Gerät ◆→ Ausrüstung
- Liste: Beispiel Arbeitsauftrag ◆→ Unterauftrag
- Koordinator: Gerät — Buchung — Arbeitsauftrag (als Assoziationsklasse!)
- Rolle: Mitarbeiter mit benannten Assoziationen (Projektleiter, Gruppenleiter, etc.)

---

## 3. Q&A-ANALYSE — LÜCKEN

### 3.1 Qualitätsanforderungen zu dünn (F136–F138)

**Aktuell**: Nur 3 Fragen für die gesamte Qualitätsmatrix.

**Was fehlt**: Jede Qualitätsdimension einzeln kommentieren:
- Benutzbarkeit = sehr gut → Warum? Welche Maßnahmen?
- Funktionalität = gut → Was genau ist abgedeckt, was nicht?
- Zuverlässigkeit = gut → Datensicherung, Fehlerbehandlung?
- Effizienz = gut → Bei 100.000 Elementen — wie wird das sichergestellt?
- Wartbarkeit = normal → Was bedeutet das konkret?
- Portabilität = gut → Welche Plattformen genau?

**Ziel**: 8–12 zusätzliche Fragen zu Qualitätsanforderungen.

### 3.2 Produktfunktionen-Tiefe ungleichmäßig

**Aktuell**: 43 Fragen für LF10–LF100 (ca. 4–5 pro Funktion). Beispiel 1 hat deutlich mehr Tiefe pro Funktion.

**Unterversorgte Bereiche**:
- **LF50 Buchungssystem**: Sehr komplexe Funktion (Lager, Standort, Verfügbarkeitssuche, Buchungszeitraum) — braucht mehr Fragen zu Buchungskonflikten, Stornierung, gleichzeitiger Buchung desselben Geräts
- **LF100 Duplikatsprüfung**: Welche Felder werden verglichen? Was passiert bei Fund? Kann der Nutzer trotzdem fortfahren? Wie werden ähnliche (nicht identische) Datensätze behandelt?
- **LF30 Auftragsdaten**: Welche Felder sind Pflichtfelder? Was passiert bei fehlendem Kostenvoranschlag?

### 3.3 Keine Attributtabellen für alle Entitäten in der Analyse

**Beide 1.0-Beispiele** haben für jede Entität eine Tabelle mit 3 Spalten: Attribut | Datentyp | Beschreibung.

**Unser Stand**: Die Entitäten sind in `chapter/2_Analyse_des_Lastenhefts.typ` als `#entityFigure()`-Blöcke definiert. Prüfen ob diese vollständig sind und ob alle im Text referenziert werden.

---

## 4. USE-CASE-DIAGRAMM — KLEINERE LÜCKEN

### 4.1 Notationskonvention fehlt im Dokument

**Was fehlt**: Eine explizite Erklärung der verwendeten Konventionen direkt im Typst-Text:
- Werden Pfeilspitzen bei Assoziationen zwischen Akteur und Use Case verwendet oder nicht?
- Was bedeutet "verwalten" in unserem Kontext (lesen + bearbeiten)?
- Erklärung der Farbcodierung (hellblau = Admin-Funktion, grün = Mitarbeiter, etc.)

### 4.2 Use-Case-Textbeschreibungen Vollständigkeit prüfen

**Anforderung**: Jeder Use Case braucht 3–8 Sätze Erklärung. Prüfen ob alle 13+ Use Cases im Hauptdiagramm und die ~15 Use Cases in den Verfeinerungen jeweils eine Textbeschreibung haben.

---

## 5. SEQUENZ- UND AKTIVITÄTSDIAGRAMM — KLEINERE LÜCKEN

### 5.1 Reflexionsabschnitte ausbauen

Beide Reflexionsabschnitte ("ehrliche Einordnung") sind gut begonnen. Ausbauen um:
- Alternativen die verworfen wurden (z.B. warum SD für Auftrag und nicht AD?)
- Vor- und Nachteile des gewählten Ansatzes (explizit als Abschnitt, nicht nur implizit)
- Verweis darauf, was in der Realität anders wäre (Locking, Login, etc.)

### 5.2 Pseudocode-Schlüsselwörter-Formatierung

Prüfen ob in ALLEN Pseudocode-Listings die deutschen Schlüsselwörter konsequent **GROSSBUCHSTABEN** oder **fett** sind:
- BEGINN / ENDE
- WENN / ODER WENN / SONST / ENDE WENN
- SOLANGE / ENDE SOLANGE
- WIEDERHOLE / BIS
- FUEHRE ... AUS

Besonders in den kürzeren Unterprogramm-Listings prüfen (Listings 4.1.2–4.1.5 und 4.2.2–4.2.4).

---

## 6. FORMALES / DOKUMENT-STRUKTUR

### 6.1 Kapitelstruktur entspricht nicht den Beispielarbeiten

**Unsere aktuelle Struktur**:
1. Aufgabenstellung
2. Analyse des Lastenhefts (Q&A)
3.1 Use-Case-Diagramm
3.2 Analyse-Klassendiagramm
4.1 Sequenzdiagramm Auftrag
4.2 Aktivitätsdiagramm Buchung
*(fehlend: GUI-Mockups, Entwurf, Besonderheiten)*

**Erwartete Struktur** (aus beiden Beispielen):
1. Aufgabenstellung
2. Analyse des Lastenhefts
3. Analyse (Use Case + Klassendiagramm + GUI-Mockups)
4. Sequenzdiagramm
5. Aktivitätsdiagramm
6. Entwurf
7. Besonderheiten

### 6.2 Querverweise zwischen Kapiteln ausbauen

**Fehlt**: Explizite Rückverweise vom Klassendiagramm zum Use-Case-Diagramm und zur Analyse. In den Beispielarbeiten sind Querverweise wie "wie in Abschnitt 3.1 beschrieben" oder "siehe F42" durchgängig.

### 6.3 Abbildungsverzeichnis und Quellenangaben

Prüfen ob alle Diagramm-Abbildungen im Typst-Dokument mit `<label>` versehen sind und im Text via `@label` referenziert werden. Keine Abbildung sollte "im Nichts hängen".

---

## 7. ZUSAMMENFASSUNG: PRIORISIERTE AUFGABENLISTE

| Prio | Aufgabe | Aufwand | Kapitel |
|------|---------|---------|---------|
| 🔴 1 | Klassendiagramm korrigieren: Multiplizitäten NUR an Pfeilspitze | Mittel | assets/klassendiagramm/ |
| 🔴 2 | Klassendiagramm: Buchung als Assoziationsklasse (Koordinator-Muster) | Mittel | assets/klassendiagramm/ |
| 🔴 3 | GUI-Mockups erstellen (mind. 2 Skizzen + Beschreibung) | Hoch | chapter/3.3_GUI-Mockups.typ |
| 🔴 4 | Besonderheiten-Abschnitt schreiben (6–10 eigene Punkte) | Mittel | chapter/1_Aufgabenstellung.typ |
| 🔴 5 | Entwurfskapitel anlegen (Entwurfsklassendiagramm + MVC) | Sehr hoch | chapter/5_Entwurf.typ |
| 🟡 6 | Klassendiagramm: Analysemuster-Einzeldiagramme erstellen | Mittel | chapter/3.2 + assets/ |
| 🟡 7 | Qualitätsanforderungen-Q&A ausbauen (+8–12 Fragen) | Niedrig | chapter/1_Aufgabenstellung.typ |
| 🟡 8 | LF50 und LF100 Q&A vertiefen | Niedrig | chapter/1_Aufgabenstellung.typ |
| 🟡 9 | Termin-Klasse: Attribute ergänzen + Rolle-Muster prüfen | Niedrig | assets/klassendiagramm/ |
| 🟢 10 | Reflexionsabschnitte in SD/AD ausbauen | Niedrig | chapter/4.1, 4.2 |
| 🟢 11 | Querverweise zwischen Kapiteln ergänzen | Niedrig | alle chapter/ |
| 🟢 12 | Pseudocode-Schlüsselwörter-Formatierung prüfen | Niedrig | chapter/4.1, 4.2 |

---

## 8. WICHTIGSTE VORLESUNGSREGELN FÜR DAS KLASSENDIAGRAMM

Aus `references/klassendiagrammContext/` (Folien R. Lutz, KIT/IAI):

| Regel | Quelle |
|-------|--------|
| Multiplizitäten **ausschließlich an der Pfeilspitze** | Folie 62 |
| Keine Multiplizität an Pfeilspitze = Multiplizität 1 | Folie 62 |
| **Unidirektionale Assoziationen** in SWE1 (explizit rot markiert) | Folie 19 |
| Referenzen als **Assoziationslinien**, nicht als Klassenattribute | Folie 15 |
| Assoziationsklasse: gestrichelte Linie senkrecht zur Assoziation | Folie 68 |
| Kompositions-Raute (gefüllt) am **Ganzen**, Pfeil zeigt zum Teil | Folie 44 |
| Aggregations-Raute (leer) am **Ganzen**, Teil kann unabhängig existieren | Folie 43 |
| Abhängigkeit (gestrichelt) zeigt von der nutzenden zur genutzten Klasse | Folie 64 |
| Vererbungspfeil: hohles Dreieck zeigt zur **Oberklasse** | Folie 47 |
| Abstrakte Klassen: `<<abstract>>` Stereotyp und/oder *kursiver* Name | Folie 66 |
