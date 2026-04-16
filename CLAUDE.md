# CLAUDE.md -- Programmentwurf Bauunternehmen (DHBW Karlsruhe)

## Projekt-Kontext

- **Typ**: Software-Engineering Programmentwurf (Bachelor-Kurs, DHBW Karlsruhe)
- **Thema**: Verwaltungssoftware fuer Bauunternehmen
- **Autoren**: Studenten
- **Kurs**: TINF24B1, 3./4. Semester (2025/2026)
- **Dozent/Pruefer**: Dr.-Ing. R. Lutz (KIT / IAI)
- **Sprache**: Deutsch (formaler akademischer Stil)
- **Dokumentformat**: Typst (nicht LaTeX)
- **Ziel-Note**: 1.0 -- orientiere dich strikt an den Beispielarbeiten in `references/example_works/`

## Projektstruktur

```
SWEProjekt/
  main-Programmentwurf.typ        -- Hauptdokument (importiert template + Kapitel)
  template.typ                    -- DHBW-Vorlage (nicht aendern)
  utils.typ                       -- Hilfsfunktionen (nicht aendern)
  Kapitel_Original.typ            -- Original-Lastenheft + Aufgabenstellung (nicht aendern)
  Kapitel_Edit.typ                -- Arbeitskapitel fuer unsere Analyse/Antworten
  assets/                         -- Bilder, Logos
  syntax/                         -- Syntax-Highlighting
  references/
    UEBERSICHT_LASTENHEFT_REFERENZEN.md  -- Leitfaden: welche Referenz fuer welchen Abschnitt
    example_works/                -- Zwei 1.0-Beispielarbeiten (PDF + MD)
    lecture_documents/             -- Vorlesungsfolien (PDF + MD)
```

## Aufgabenstellung (Kapitel 3 des Lastenhefts)

### Aufgabe 3.1: Analyse (AKTUELLER FOKUS)
Fuer die Analyse sind zu erstellen:
1. **Analyse des Lastenhefts** (Fragen und Antworten zu jedem Punkt)
2. **Use-Case-Diagramm** der gesamten Anwendung inkl. Beschreibung
3. **Verfeinerung** des Use-Case-Diagramms inkl. Beschreibung (nach Absprache)
4. **Analyse-Klassendiagramm** inkl. Beschreibung (mit Analysemustern)
5. **GUI-Mockups** von mindestens zwei wesentlichen GUI-Komponenten (KEIN Login-GUI)

### Aufgabe 3.2: Sequenz- und Aktivitaetsdiagramm
- Ein SD und ein AD (jeweils fuer ein anderes Szenario) inkl. Beschreibung:
  - Aktion "Auftrag anlegen und Auftrag loeschen"
  - Aktion "Anlegen und Buchung einer Baumaschine (z.B. Bagger mit Zubehoer)"
- Leere Datenbasis wird angenommen
- Primitive Attribute in einer einzigen Aktion zusammenfassen ("Attribute eintragen")
- SD: ausfuehrlich mit Pseudocode oder anderer Modellierungsmethode, alle referenzierten Elemente beruecksichtigen
- Diagrammverfeinerungen beachten

### Aufgabe 3.3: Entwurf
- Entwurfsklassendiagramm mit Entwurfsmustern
- GUI-Modellierung (UML): Kommunikationsschema eines Teils der GUI mit MVC-Muster
- swe-utils Java-Bibliothek integrieren

### Vereinfachungen
- Kein Locking-Mechanismus erforderlich
- Keine Protokollierfunktion, kein Login-Vorgang
- Buerogebaeude (Raeume, PCs) nicht modellieren
- Projekt-/Bauplaene als Text (Dateipfad) modellieren
- Terminplaner als einfache Klasse modellieren

## Lastenheft-Domain: Bauunternehmen

Das Unternehmen:
- Ueberregional, Hoch- und Tiefbau, ~200 Mitarbeiter, Rhein-Neckar-Region
- Mittelgrosse Bauwerke: Ein-/Mehrfamilienhaeuser, Bruecken, Hallen, Buerogebaeude

Kernentitaeten:
- **Mitarbeiter**: Projektleiter, Bauleiter, Baugruppenleiter, Vorarbeiter, gelernte/ungelernte Bauarbeiter, Verwaltungsmitarbeiter
- **Gruppen**: Verwaltung, Planung, Projektleitung, Bauleitung, Baugruppen (enthalten Arbeitsgruppen)
- **Auftraege**: Projekt-/Bauplaene, Angebote, Rechnungen, Mahnungen, Kostenvoranschlaege, beteiligte Personen, Grossgeraete, Einsatzort, Termine; Unterauftraege moeglich
- **Baumaschinen/Werkzeuge**: Bagger, LKWs, Kraene, Ruettler, Bohrmaschinen, Schalungsteile, Zaeune; Zubehoer; Buchungssystem; Lager mit Standorten; Verfuegbarkeitssuche
- **Benutzerrollen**: Verwaltung (Leserechte + Vollzugriff Verwaltungsdaten), Bau-/Projektleiter (Vollzugriff projektbezogen), Vorarbeiter (lesend auf Arbeitsauftraege), Administrator (Vollzugriff, Import/Export, Backup)
- **Externe Systeme**: Finanzbuchhaltungssystem (nur lesen: Rechnungen, Mahnungen, Kostenvoranschlaege), Altsystem (Datenmigration), Drucker
- **Tablet-Projekt**: Nicht Teil des ersten Auftrags, aber Vorschlaege zur Realisierung machen

Lastenheft-Funktionen (LF):
- LF10: GUI, Konfigurationsdaten, Fenstereinstellungen
- LF20: Mitarbeiter- und Gruppenverwaltung (n:m-Beziehung)
- LF30: Auftragsdaten (Plaene, Angebote, Rechnungen, Personen, Geraete, Termine)
- LF40: Unterauftraege, Terminplaner
- LF50: Baumaschinen-/Werkzeugverwaltung mit Buchung, Lager, Standort, Verfuegbarkeit
- LF60: Suchmasken
- LF70: Durchsuchbare Auswahllisten, erweiterbar
- LF80: Bilder mit Titel zu allen Elementen
- LF90: Anwesenheitszeiten
- LF100: Duplikatspruefung vor Neuanlage

Produktdaten: LD10 -- Zentrale Datenbasis (erst lesbare Dateien, spaeter Datenbank)
Produktleistungen: ~100.000 Elemente, 10 Jahre Aufbewahrung, Plattformunabhaengigkeit
Qualitaet: Benutzbarkeit = sehr gut; Funktionalitaet/Zuverlaessigkeit/Effizienz/Portabilitaet = gut; Wartbarkeit = normal

## Qualitaetsstandard (abgeleitet aus den 1.0-Beispielarbeiten)

### Analyse des Lastenhefts -- Fragen und Antworten
- **Mindestens 100-170 Fragen** ueber das gesamte Lastenheft verteilt
- **Globale Nummerierung** der Fragen (1, 2, 3, ... bis 170+), NICHT pro Abschnitt neu beginnend
- **Jeder Satz und Absatz** des Lastenhefts wird hinterfragt, nicht nur die LF-Punkte
- **Format**: Frage in Orange/Bold, Antwort direkt darunter (im Typst-Dokument das bestehende `QaA`-Makro verwenden)
- **Antwort-Tiefe**: Von kurzen Ja/Nein-Antworten bis zu ausfuehrlichen Attributtabellen (3 Spalten: Attribut, Datentyp, Beschreibung)
- **"Intern:"-Praefix** fuer interne technische Entscheidungen des Entwicklerteams
- **Querverweise** zwischen Abschnitten (z.B. "siehe Abschnitt 2.2.3")
- **Konkretes Nachfragen**: Wer darf was? Welche Attribute genau? Welche Formate? Was passiert bei Fehler? Welche Pflichtfelder?
- **Datenentitaeten**: Fuer jede identifizierte Entitaet eine vollstaendige Attributtabelle erstellen
- Auch die Einleitung analysieren (Firmendetails, Technologie, Mitarbeiter)

### Use-Case-Diagramm
- **Max. 10 Use Cases pro Diagramm** (Vorlesungsregel)
- **Akteure AUSSERHALB** der Systemgrenze, Use Cases INNERHALB
- **Rollenerlaeuterung**: Jede Rolle bekommt einen eigenen Absatz mit Erklaerung der Faehigkeiten
- **Vererbung bei Akteuren** nutzen (z.B. Mitarbeiter als Basisakteur)
- Gesamtansicht + mindestens eine Verfeinerung
- Jeder Use Case bekommt eine **Textbeschreibung (3-8 Saetze)**, nicht nur Labels
- **Notationserklaerung**: Wenn besondere Konventionen verwendet werden (z.B. keine Pfeilspitzen), explizit erklaeren
- **<<include>>** fuer gemeinsames Verhalten (immer aufgerufen), **<<extend>>** fuer optionale Erweiterungen
- Aus **Benutzerperspektive** modellieren, nicht aus Entwicklerperspektive
- "verwalten" = lesen + bearbeiten (Konvention erklaeren)

### Analyse-Klassendiagramm
- Ein grosses Diagramm fuer das gesamte System
- **Farbcodierung** fuer zusammengehoerige Objektgruppen
- **Analysemuster explizit benennen und begruenden** (jeweils eigener Unterabschnitt mit separater Abbildung)
- Erwartete Muster fuer dieses Projekt:
  - **Liste**: z.B. Auftrag mit Positionen, Rechnung mit Rechnungsposten
  - **Gruppe**: Mitarbeiter-Gruppen (Baugruppen, Verwaltung, Planung etc.)
  - **Exemplartyp**: Baumaschinen (Typ vs. konkretes Exemplar mit Seriennummer)
  - **Rolle**: Mitarbeiter in verschiedenen Rollen; Haupt-/Zwischentermine
  - **Koordinator**: z.B. Buchung als Zuordnung zwischen Maschine und Auftrag mit eigenen Attributen (Zeitraum)
  - **Baugruppe**: z.B. Baumaschine mit Zubehoer
- **Multiplizitaeten korrekt angeben** und geschaeftlich begruenden
- **Unidirektionale Assoziationen bevorzugen** (Kurskonvention)
- **Referenzen als Assoziationslinien**, NICHT als Attribute in der Klasse
- Jedes Objekt bekommt einen beschreibenden Absatz

### GUI-Mockups
- Mindestens 2 wesentliche Ansichten (z.B. Dashboard/Hauptansicht, Detailansicht fuer Auftraege oder Maschinenverwaltung)
- **KEIN Login-GUI** (wird nicht bewertet)
- Beschreibung der **gesamten GUI-Philosophie** VOR den Mockups (Navigation, Sidebar, Rollenbasierung)
- Jedes Mockup bekommt eine **ausfuehrliche Textbeschreibung** (jedes UI-Element erklaeren)
- Verweis auf Lastenheft-Anforderungen (LF10, LF50, LF70 etc.)
- Auch nicht-skizzierte Views beschreiben (welche Seiten es insgesamt geben wuerde)

### Sequenz- und Aktivitaetsdiagramm
- **Ausfuehrliche Einleitung** mit Szenario-Beschreibung und expliziten Vereinfachungen
- **Unterprogramme/Subprogramme** fuer Wiederverwendbarkeit nutzen
- **Leere Datenbasis** als Ausgangspunkt
- **Alle referenzierten Elemente** beruecksichtigen (Zubehoer, Lager, Standort etc.)
- **Pseudocode** mit deutschen Schluesselwoertern:
  - BEGINN / ENDE
  - WENN / ODER WENN / SONST / ENDE WENN
  - FALLS Variable IST / Wert: / SONST / ENDE-FALLS
  - FUEHRE Name AUS
  - WIEDERHOLE von N bis M / ENDE-WIEDERHOLE
  - SOLANGE Bedingung / ENDE-SOLANGE
  - WIEDERHOLE / BIS Bedingung
- Schluesselwoerter **fett** oder GROSSBUCHSTABEN
- **Nummerierte Zeilen** im Pseudocode
- **Diskussion/Reflexion** am Ende (Vor-/Nachteile des gewaelten Ansatzes)

### Entwurf (spaeter)
- Entwurfsklassendiagramm mit Packages
- Erwartete Entwurfsmuster: Singleton, Adapter, Factory Method, Kompositum, Beobachter
- GUI-Modellierung mit MVC-Kommunikationsschema
- swe-utils Java-Bibliothek integrieren

### Besonderheiten-Abschnitt
- Am Ende des Dokuments
- 6-10 Punkte, jeweils eigener Unterabschnitt
- Alles hervorheben, was ueber die Mindestanforderungen hinausgeht
- Beispiele: Allgemeinheit der Software, technische Besonderheiten, UI-Philosophie, Abdeckung von Sonderfaellen, Mockup-Qualitaet, Rechtschreibung/Grammatik

## Typst-Konventionen

### Bestehendes QaA-Makro (in Kapitel_Edit.typ definiert)
```typst
#let QaA(question, answer) = {
  block(
    inset: (left: 1em),
    [
      #text(fill: orange, weight: "bold")[#question] \
      #text(fill: green)[#sym.arrow #answer]
    ]
  )
}
```
Verwendung: `#QaA[Frage hier?][Antwort hier.]`

### Bestehendes question-Makro
```typst
#let question(body) = text(fill: color.rgb("#d88d1d"), body)
```
Verwende dieses Makro fuer Fragen, die noch nicht das QaA-Format benoetigen.

### Allgemeine Typst-Regeln
- Ueberschriften: `= Kapitel`, `== Abschnitt`, `=== Unterabschnitt`
- Bilder: `#figure(image("pfad.png"), caption: [Beschreibung])` und mit `<label>` referenzieren
- Tabellen: `#table(columns: N, [...], [...], ...)`
- Aufzaehlungen: `- Punkt` oder `+ nummeriert` oder `#enum(numbering: "a)", [...])`
- Fett: `*text*`, Kursiv: `_text_`
- Code: `` `inline` `` oder ` ```lang block``` `
- Seitenumbruch: `#pagebreak()`
- Abbildungsreferenz: `@label`
- Template-Funktionen aus utils.typ: `caption_with_source`, `codefigure`, `codefigurefile`

### Dateiorganisation
- **Kapitel_Original.typ** NICHT aendern (enthaelt das Originallastenheft)
- **Kapitel_Edit.typ** ist die Arbeitsdatei -- hier wird geschrieben
- Neue Kapitel koennen als separate .typ-Dateien angelegt und in main-Programmentwurf.typ eingebunden werden
- Bilder in `assets/` ablegen

## Schreibstil und Formatierung

- **Formaler deutscher akademischer Stil**: "Es soll...", "Hierbei handelt es sich um...", "Im folgenden Abschnitt wird..."
- **Passive Konstruktionen** und unpersoenliche Formulierungen bevorzugen
- **Erstes Mal pro Absatz** ausfuehrlich erklaeren, danach kurz referenzieren
- **Konsistente Terminologie**: Immer dieselben Begriffe fuer dieselben Konzepte verwenden
- **Querverweise**: Zwischen Abschnitten und zu Lastenheft-Punkten verweisen
- **Abbildungen**: Immer mit "Abbildung X -- Titel" beschriften und im Text referenzieren
- **Keine Emojis**, keine informelle Sprache
- **Umlaute**: ae, oe, ue ODER ae, oe, ue -- konsistent bleiben (Typst unterstuetzt Umlaute direkt)
- **Fachbegriffe korrekt verwenden**: Akteur (nicht Aktor), Multiplizitaet, Assoziation, Aggregation, Komposition, Vererbung, Instanz, Klasse, Attribut, Operation, Methode

## UML-Regeln (aus der Vorlesung)

### Klassendiagramme
- Drei Kompartimente: Klassenname | Attribute | Operationen
- Attributformat: `sichtbarkeit name: Typ [= Standardwert]`
- Operationsformat: `sichtbarkeit name(paramListe): Rueckgabetyp`
- Sichtbarkeit: `-` private, `+` public, `#` protected, `~` package
- Statische Member werden **unterstrichen**
- Abstrakte Klassen: `<<abstract>>` Stereotyp und/oder *kursiver* Klassenname
- Interfaces: `<<interface>>` Stereotyp
- **Referenzen auf andere Klassen = Assoziationslinien**, NICHT Attribute in der Klasse
- **Multiplizitaeten nur am Pfeilende** (keine Multiplizitaet = 1)
- **Unidirektionale Assoziationen bevorzugen** (Kurskonvention SWE1)
- **Komposition** (gefuellte Raute): existenzabhaengig, kaskadierendes Loeschen
- **Aggregation** (leere Raute): "ist Teil von", Teile koennen ueberleben
- **Dependency** (gestrichelte Linie, `<<use>>`): nur temporaere Verwendung (Parameter, lokale Variable)
- **Assoziationsklassen**: Wenn eine Assoziation eigene Attribute braucht

### Instanzdiagramme
- Format: `instanzName : Klassenname` (unterstrichen)
- Attribut**werte** anzeigen, KEINE Methoden
- **KEINE Multiplizitaeten** in Instanzdiagrammen

### Use-Case-Diagramme
- Systemgrenze als Rechteck mit Name
- Akteure AUSSERHALB, Use Cases INNERHALB
- Max. 10 Use Cases pro Diagramm
- Akteure eindeutig benennen
- Aus Benutzerperspektive modellieren
- Use Cases beschreiben KEINE Programmablaeufe (dafuer Aktivitaets-/Sequenzdiagramme)
- Use Cases beschreiben KEINE interne Systemstruktur
- Use Cases beschreiben KEINE nicht-funktionalen Anforderungen

### Sequenzdiagramme
- Lebenslinien mit Objekten/Akteuren oben
- Nachrichten als Pfeile zwischen Lebenslinien
- Aktivierungsbalken fuer aktive Phasen
- Alt/Loop/Opt-Fragmente fuer Verzweigungen/Schleifen
- Referenz-Fragmente (`ref`) fuer Unterprogramme

### Aktivitaetsdiagramme
- Start-/Endknoten
- Aktionsknoten (abgerundete Rechtecke)
- Entscheidungs-/Zusammenfuehrungsknoten (Rauten)
- Fork/Join-Balken fuer Parallelisierung
- Swimlanes fuer Akteure/Verantwortlichkeiten

## Analysemuster-Referenz (aus der Vorlesung)

| Muster | Beziehungstyp | Wann verwenden |
|--------|--------------|----------------|
| **Liste** | Komposition (1..*) | Teile existieren nur im Aggregat (z.B. Rechnungsposten in Rechnung) |
| **Exemplartyp** | Assoziation (0..*) | Gemeinsame Typ-Attribute vs. individuelle Instanz-Attribute (z.B. Maschinentyp vs. konkretes Exemplar) |
| **Baugruppe** | Komposition (1..*) | Physische Objekte mit austauschbaren Teilen (z.B. Bagger mit Zubehoer) |
| **Stueckliste** | Komposition (0..1 Eltern, 0..* Kinder) | Baumstruktur mit unbekannter Tiefe |
| **Koordinator** | Assoziationsklasse | Assoziation braucht eigene Attribute (z.B. Buchung mit Zeitraum) |
| **Rolle** | Mehrere Assoziationen | Objekt spielt verschiedene Rollen gleichzeitig |
| **Wechselnde Rollen** | Vererbung + 1..* Assoziation | Objekt wechselt Rollen ueber Zeit |
| **Historie** | Assoziation mit {t=k} | Temporale Einschraenkung, Eintraege nie loeschen |
| **Gruppe** | Assoziation (0..* Mitglieder, 0..1 Gruppe) | Mitglied in max. einer Gruppe, Gruppe kann temporaer leer sein |

## Checkliste fuer vollstaendige Analyse

- [ ] Einleitung analysiert (Firmendetails, Technologie, Mitarbeiteranzahl)
- [ ] Zielsetzung: Fragen zu zentraler Datenhaltung, Mehrbenutzersystem, Baustellen-Zugriff, Import/Export
- [ ] Anwendungsbereiche: Fragen zu Geraeten, Standorten, Netzwerk
- [ ] Zielgruppen/Rollen: Alle Rollen mit Rechten spezifiziert, Rollenkombinationen geklaert
- [ ] Zusammenspiel: Finanzbuchhaltung, Altsystem, Drucker, Tablet-Projekt
- [ ] Produktfunktionen: JEDE LF (10-100) einzeln mit mehreren Fragen analysiert
- [ ] Produktdaten: Datenhaltungsstrategie konkretisiert
- [ ] Produktleistungen: Mengengeruest, Aufbewahrung, Plattformunabhaengigkeit
- [ ] Qualitaetsanforderungen: Jede Qualitaetsdimension kommentiert
- [ ] Use-Case-Diagramm mit Rollenerlaeuterung und Textbeschreibungen
- [ ] Verfeinertes Use-Case-Diagramm (nach Absprache)
- [ ] Analyse-Klassendiagramm mit mindestens 5 Analysemustern
- [ ] GUI-Mockups (min. 2) mit ausfuehrlicher Beschreibung
- [ ] Besonderheiten-Abschnitt

## Haeufige Fehler vermeiden

1. **Zu wenige Fragen**: Unter 100 Fragen ist zu wenig. Jeder Satz des Lastenhefts kann hinterfragt werden.
2. **Oberflaechliche Antworten**: Statt "Ja" lieber "Ja. Die Daten werden im CSV-Format exportiert, wobei..."
3. **Fehlende Attributtabellen**: Jede Entitaet braucht eine Tabelle mit Attribut/Datentyp/Beschreibung
4. **Analysemuster nicht benannt**: Muster muessen explizit als solche identifiziert und begruendet werden
5. **Use Cases ohne Beschreibung**: Jeder Use Case braucht 3-8 Saetze Erklaerung
6. **Mockups ohne Texterklaerung**: Jedes UI-Element muss beschrieben werden
7. **Pseudocode ohne Struktur**: Nummerierte Zeilen, fette Schluesselwoerter, korrekte Einrueckung
8. **Keine Querverweise**: Zwischen Analyse, Use Cases, Klassendiagramm und Mockups verweisen
9. **Login-GUI**: Nicht skizzieren (wird nicht bewertet)
10. **Fehlende Reflexion**: Am Ende von SD/AD kurze Diskussion ueber Vor-/Nachteile

## Referenzen

Vor dem Schreiben eines Abschnitts die entsprechenden Referenzen konsultieren:
- **Allgemein**: `references/UEBERSICHT_LASTENHEFT_REFERENZEN.md` -- Leitfaden
- **Beispiel 1**: `references/example_works/similiar_task_perfect_example.md` -- Handwerksbetriebe (2024/25, 1.0)
- **Beispiel 2**: `references/example_works/similiar_task_second_perfect_example.md` -- Immobilienverwaltung (2016/17, 1.0)
- **Use Cases**: `references/lecture_documents/OO-Use-Cases_2021-11-25.md`
- **Analysemuster**: `references/lecture_documents/OO-Analysemuster_2021-04-05.md`
- **Klassendiagramme**: `references/lecture_documents/OO-DatenmodellierungMitInstanzUndKlassendiagrammen_2021-12-01.md`
- **Pseudocode/PAP/NSD**: `references/lecture_documents/StrukturierteProgrammierung_PC_PAP_NSD_2017-09-15.md`
- **Interfaces**: `references/lecture_documents/OO-InterfacesUndAbstrakteKlassen_2025-04-10.md`
- **DFD**: `references/lecture_documents/StrukturierteAnalyse_DFD_2019-11-11.md`
- **Data Dictionary**: `references/lecture_documents/DataDictionary_SyntaxDiagramm_2019-10-16.md`
