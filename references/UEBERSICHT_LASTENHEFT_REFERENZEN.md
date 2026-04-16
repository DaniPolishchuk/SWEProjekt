# Übersicht: Referenzen für das Lastenheft

Diese Datei bietet eine strukturierte Übersicht über alle verfügbaren Referenzdokumente und deren Inhalte zur Erstellung eines Lastenhefts im Rahmen des Software Engineering Projekts.

---

## 📚 Struktur der Referenzen

### 1. Beispielarbeiten (`example_works/`)

Vollständige Programmentwürfe früherer Studenten, die als Orientierung dienen:

#### [similiar_task_perfect_example.pdf/.md](example_works/similiar_task_perfect_example.pdf)
**Thema:** Verwaltungssoftware für Handwerksbetriebe (TINF23B1, 2024/2025)

**Relevante Inhalte für Lastenheft:**
- **Kapitel 1: Aufgabenstellung**
  - 1.2 Lastenheft (kompakte Version)
    - Zielsetzung
    - Anwendungsbereich
    - Zielgruppen, Benutzerrollen und Verantwortlichkeiten
    - Zusammenspiel mit anderen Systemen
    - Produktfunktionen
    - Produktdaten
    - Produktleistungen
    - Qualitätsanforderungen

- **Kapitel 2: Analyse des Lastenhefts** (detaillierte Ausarbeitung)
  - Fragen und Antworten zu jedem Lastenheftpunkt
  - Konkretisierung vager Anforderungen
  - Klärung von Unklarheiten
  - Spezifikation von technischen Details

**Besonderheiten:**
- Zeigt, wie ein initiales Lastenheft analysiert und verfeinert wird
- Enthält über 100 Fragen zur Klärung von Anforderungen
- Beispiel für Rollen und Rechteverwaltung
- Integration externer Systeme (Kartenlesegeräte, FiBuSys)
- GUI-Mockups und Use-Case-Diagramme

#### [similiar_task_second_perfect_example.pdf/.md](example_works/similiar_task_second_perfect_example.pdf)
**Thema:** Immobilienverwaltung (TINF15B, 2016/2017)

**Relevante Inhalte für Lastenheft:**
- **Kapitel 1: Aufgabenstellung**
  - 1.2 Lastenheft mit denselben Unterkapiteln wie oben
  
- **Kapitel 2: Analyse**
  - Detaillierte Ausarbeitung des Lastenhefts
  - Konkrete Anforderungen für Immobilienverwaltung
  - Rollendefinitionen (Sachbearbeiter, Gruppenleiter, etc.)

**Besonderheiten:**
- Anderes Anwendungsgebiet (Immobilien statt Handwerk)
- Zeigt, wie Konzepte auf verschiedene Domänen anwendbar sind
- Enthält Finanzierungsangebote und Vermittlungsprozesse

---

### 2. Vorlesungsmaterialien (`lecture_documents/`)

Theoretische Grundlagen und Methoden für Software Engineering:

#### Anforderungsanalyse & Modellierung

##### [OO-Use-Cases_2021-11-25.pdf/.md](lecture_documents/OO-Use-Cases_2021-11-25.pdf)
**Inhalt:**
- Definition von Use-Cases / Anwendungsfällen
- Was sind Geschäftsprozesse?
- Notation nach Ivar Jacobson
- Sequenz von zusammengehörigen Transaktionen
- Dialog zwischen Akteur und System

**Relevanz für Lastenheft:**
- Identifikation von Produktfunktionen
- Beschreibung von Benutzerinteraktionen
- Definition von Geschäftsprozessen

##### [OO-GrundlagenDerObjektorientierung_2019-11-18.pdf/.md](lecture_documents/OO-GrundlagenDerObjektorientierung_2019-11-18.pdf)
**Inhalt:**
- Grundkonzepte der Objektorientierung
- Objekte vs. Klassen vs. Instanzen
- Methoden und Operationen

**Relevanz für Lastenheft:**
- Verständnis für Datenmodellierung
- Basis für Produktdaten-Abschnitt

##### [OO-DatenmodellierungMitInstanzUndKlassendiagrammen_2021-12-01.pdf/.md](lecture_documents/OO-DatenmodellierungMitInstanzUndKlassendiagrammen_2021-12-01.pdf)
**Inhalt:**
- UML-Diagramme (Struktur- und Verhaltensdiagramme)
- Klassendiagramme
- Instanzendiagramme
- Use-Case-Diagramme
- Sequenzdiagramme
- Aktivitätsdiagramme

**Relevanz für Lastenheft:**
- Modellierung von Produktdaten
- Visualisierung von Systemstrukturen
- Darstellung von Beziehungen zwischen Entitäten

#### Analyse & Entwurf

##### [OO-Analysemuster_2021-04-05.pdf/.md](lecture_documents/OO-Analysemuster_2021-04-05.pdf)
**Inhalt:**
- Definition von Analysemustern (Analysis Patterns)
- Klassifikation von Mustern
- Häufig verwendete Muster:
  - Liste
  - Exemplartyp
  - Baugruppe
  - Koordinator
  - Rolle
  - Gruppe

**Relevanz für Lastenheft:**
- Strukturierung von Produktdaten
- Wiederverwendbare Lösungsansätze
- Modellierung häufig vorkommender Strukturen

##### [StrukturierteAnalyse_DFD_2019-11-11.pdf/.md](lecture_documents/StrukturierteAnalyse_DFD_2019-11-11.pdf)
**Inhalt:**
- Datenflussdiagramme (DFD - Data Flow Diagrams)
- Wege von Daten zwischen Funktionen, Speichern und Schnittstellen
- Transformation von Daten durch Funktionen
- DFD-Symbole (Datenflüsse, Funktionen, Speicher, Schnittstellen)

**Relevanz für Lastenheft:**
- Beschreibung von Produktfunktionen
- Darstellung von Datenflüssen im System
- Integration mit anderen Systemen

##### [SADT_2022-11-16.pdf/.md](lecture_documents/SADT_2022-11-16.pdf)
**Inhalt:**
- Structured Analysis and Design Technique
- ICOM-Code (Input, Control, Output, Mechanism)
- Darstellung von Dingen und Geschehen in Wechselbeziehung
- Graphische Sprache SA und Methodik DT

**Relevanz für Lastenheft:**
- Systematische Analyse von Prozessen
- Beschreibung von Produktfunktionen
- Zusammenspiel von Daten und Aktivitäten

#### Datenstrukturen & Programmierung

##### [DataDictionary_SyntaxDiagramm_2019-10-16.pdf/.md](lecture_documents/DataDictionary_SyntaxDiagramm_2019-10-16.pdf)
**Inhalt:**
- Data Dictionary: Verzeichnis mit Informationen über Daten
- Struktur, Eigenschaften und Verwendung von Daten
- Konsistenzüberwachung
- Redundanz- und Widerspruchsfreiheit

**Relevanz für Lastenheft:**
- Spezifikation von Produktdaten
- Dokumentation von Datenstrukturen
- Übersicht über Datenbereiche

##### [StrukturierteProgrammierung_PC_PAP_NSD_2017-09-15.pdf/.md](lecture_documents/StrukturierteProgrammierung_PC_PAP_NSD_2017-09-15.pdf)
**Inhalt:**
- Strukturierte Programmierung
- Pseudocode (PC)
- Programmablaufplan (PAP)
- Nassi-Shneiderman-Diagramme (NSD)
- Single Entry / Single Exit Prinzip

**Relevanz für Lastenheft:**
- Beschreibung von Produktleistungen (Algorithmen)
- Strukturierung komplexer Funktionen
- Präzise Spezifikation von Abläufen

##### [OO-InterfacesUndAbstrakteKlassen_2025-04-10.pdf/.md](lecture_documents/OO-InterfacesUndAbstrakteKlassen_2025-04-10.pdf)
**Inhalt:**
- Interfaces in der Objektorientierung
- Abstrakte Klassen
- Vererbung und Polymorphie

**Relevanz für Lastenheft:**
- Zusammenspiel mit anderen Systemen (Schnittstellen)
- Modulare Systemarchitektur
- Erweiterbarkeit

---

## 🎯 Leitfaden: Welche Referenzen für welchen Lastenheft-Abschnitt?

### 1.2.1 Zielsetzung
**Referenzen:**
- [similiar_task_perfect_example.md](example_works/similiar_task_perfect_example.md) - Seiten 1, 12
- [similiar_task_second_perfect_example.md](example_works/similiar_task_second_perfect_example.md)

**Was gehört rein:**
- Hauptziel der Software
- Erwarteter Nutzen
- Problemstellung, die gelöst werden soll

### 1.2.2 Anwendungsbereich
**Referenzen:**
- [similiar_task_perfect_example.md](example_works/similiar_task_perfect_example.md) - Seiten 2, 14
- [similiar_task_second_perfect_example.md](example_works/similiar_task_second_perfect_example.md)

**Was gehört rein:**
- Einsatzgebiet der Software
- Branche / Domäne
- Reichweite (lokal, vernetzt, cloud-basiert)

### 1.2.3 Zielgruppen, Benutzerrollen und Verantwortlichkeiten
**Referenzen:**
- [similiar_task_perfect_example.md](example_works/similiar_task_perfect_example.md) - Seiten 2, 14-16
- [similiar_task_second_perfect_example.md](example_works/similiar_task_second_perfect_example.md)
- [OO-Analysemuster_2021-04-05.pdf](lecture_documents/OO-Analysemuster_2021-04-05.pdf) - Analysemuster "Rolle"

**Was gehört rein:**
- Alle Benutzergruppen
- Rollen mit zugehörigen Rechten
- Verantwortlichkeiten
- Administrator-Rollen

### 1.2.4 Zusammenspiel mit anderen Systemen
**Referenzen:**
- [similiar_task_perfect_example.md](example_works/similiar_task_perfect_example.md) - Seiten 2, 16-18
- [similiar_task_second_perfect_example.md](example_works/similiar_task_second_perfect_example.md)
- [OO-InterfacesUndAbstrakteKlassen_2025-04-10.pdf](lecture_documents/OO-InterfacesUndAbstrakteKlassen_2025-04-10.pdf)
- [StrukturierteAnalyse_DFD_2019-11-11.pdf](lecture_documents/StrukturierteAnalyse_DFD_2019-11-11.pdf)

**Was gehört rein:**
- Externe Systeme / Schnittstellen
- Hardware-Integration (Drucker, Kartenlesegeräte, etc.)
- Netzwerkverbindungen
- APIs und Protokolle
- Import/Export-Funktionen

### 1.2.5 Produktfunktionen
**Referenzen:**
- [similiar_task_perfect_example.md](example_works/similiar_task_perfect_example.md) - Seiten 3, 20-43
- [similiar_task_second_perfect_example.md](example_works/similiar_task_second_perfect_example.md)
- [OO-Use-Cases_2021-11-25.pdf](lecture_documents/OO-Use-Cases_2021-11-25.pdf)
- [StrukturierteAnalyse_DFD_2019-11-11.pdf](lecture_documents/StrukturierteAnalyse_DFD_2019-11-11.pdf)
- [SADT_2022-11-16.pdf](lecture_documents/SADT_2022-11-16.pdf)

**Was gehört rein:**
- Alle Funktionen des Systems (Geschäftsprozesse)
- CRUD-Operationen (Create, Read, Update, Delete)
- Suchfunktionen
- Berechnungen
- Reporting / Auswertungen
- Benachrichtigungen

### 1.2.6 Produktdaten
**Referenzen:**
- [similiar_task_perfect_example.md](example_works/similiar_task_perfect_example.md) - Seiten 4, 43
- [similiar_task_second_perfect_example.md](example_works/similiar_task_second_perfect_example.md)
- [DataDictionary_SyntaxDiagramm_2019-10-16.pdf](lecture_documents/DataDictionary_SyntaxDiagramm_2019-10-16.pdf)
- [OO-DatenmodellierungMitInstanzUndKlassendiagrammen_2021-12-01.pdf](lecture_documents/OO-DatenmodellierungMitInstanzUndKlassendiagrammen_2021-12-01.pdf)
- [OO-Analysemuster_2021-04-05.pdf](lecture_documents/OO-Analysemuster_2021-04-05.pdf)

**Was gehört rein:**
- Alle Datenentitäten (Kunden, Aufträge, Personal, etc.)
- Attribute der Entitäten
- Beziehungen zwischen Daten
- Datenstrukturen

### 1.2.7 Produktleistungen
**Referenzen:**
- [similiar_task_perfect_example.md](example_works/similiar_task_perfect_example.md) - Seiten 4, 43-44
- [similiar_task_second_perfect_example.md](example_works/similiar_task_second_perfect_example.md)
- [StrukturierteProgrammierung_PC_PAP_NSD_2017-09-15.pdf](lecture_documents/StrukturierteProgrammierung_PC_PAP_NSD_2017-09-15.pdf)

**Was gehört rein:**
- Performance-Anforderungen
- Reaktionszeiten
- Durchsatz
- Kapazitäten
- Verfügbarkeit

### 1.2.8 Qualitätsanforderungen
**Referenzen:**
- [similiar_task_perfect_example.md](example_works/similiar_task_perfect_example.md) - Seiten 4, 44
- [similiar_task_second_perfect_example.md](example_works/similiar_task_second_perfect_example.md)

**Was gehört rein:**
- Zuverlässigkeit
- Benutzerfreundlichkeit
- Wartbarkeit
- Portabilität
- Sicherheit
- Compliance

---

## 💡 Tipps zur Nutzung der Referenzen

### Vorgehen beim Erstellen eines Lastenhefts:

1. **Orientierung an Beispielarbeiten**
   - Lesen Sie beide vollständigen Beispiele
   - Verstehen Sie die Struktur und den Aufbau
   - Beachten Sie, wie vage Anforderungen konkretisiert werden

2. **Analyse durch Fragen**
   - Kapitel 2 der Beispielarbeiten zeigt, wie man ein Lastenheft hinterfragt
   - Jede Anforderung sollte konkret und präzise sein
   - Klären Sie Unklarheiten durch gezielte Fragen

3. **Theoretisches Fundament**
   - Nutzen Sie die Vorlesungsmaterialien für methodische Ansätze
   - Wenden Sie UML-Diagramme zur Visualisierung an
   - Verwenden Sie Analysemuster für wiederkehrende Strukturen

4. **Vollständigkeit prüfen**
   - Alle 8 Abschnitte müssen abgedeckt sein
   - Benutzerrollen klar definieren
   - Externe Schnittstellen nicht vergessen
   - Qualitätsanforderungen quantifizieren

5. **Vereinfachungen beachten**
   - Siehe Abschnitt 1.4 in den Beispielarbeiten
   - Umfang dem Projekt angemessen gestalten

---

## 📋 Checkliste für ein vollständiges Lastenheft

- [ ] **Zielsetzung**: Klare Formulierung des Hauptziels
- [ ] **Anwendungsbereich**: Domäne und Einsatzgebiet definiert
- [ ] **Benutzerrollen**: Alle Rollen mit Rechten beschrieben
- [ ] **Externe Systeme**: Alle Schnittstellen und Hardware spezifiziert
- [ ] **Produktfunktionen**: Vollständige Liste aller Funktionen
- [ ] **Produktdaten**: Alle Entitäten mit Attributen
- [ ] **Produktleistungen**: Performance-Anforderungen quantifiziert
- [ ] **Qualitätsanforderungen**: Nicht-funktionale Anforderungen definiert
- [ ] **Fragen geklärt**: Alle Unklarheiten beseitigt
- [ ] **Konsistenz**: Keine Widersprüche zwischen Abschnitten

---

## 📖 Leseempfehlung

**Für den Einstieg:**
1. [similiar_task_perfect_example.md](example_works/similiar_task_perfect_example.md) - Kapitel 1.2 (Lastenheft kompakt)
2. [similiar_task_perfect_example.md](example_works/similiar_task_perfect_example.md) - Kapitel 2.2 (Detaillierte Analyse)

**Für die Vertiefung:**
3. [OO-Use-Cases_2021-11-25.pdf](lecture_documents/OO-Use-Cases_2021-11-25.pdf)
4. [OO-DatenmodellierungMitInstanzUndKlassendiagrammen_2021-12-01.pdf](lecture_documents/OO-DatenmodellierungMitInstanzUndKlassendiagrammen_2021-12-01.pdf)
5. [OO-Analysemuster_2021-04-05.pdf](lecture_documents/OO-Analysemuster_2021-04-05.pdf)

**Bei Bedarf:**
- Datenflussdiagramme → [StrukturierteAnalyse_DFD_2019-11-11.pdf](lecture_documents/StrukturierteAnalyse_DFD_2019-11-11.pdf)
- Datenstrukturen → [DataDictionary_SyntaxDiagramm_2019-10-16.pdf](lecture_documents/DataDictionary_SyntaxDiagramm_2019-10-16.pdf)
- Schnittstellen → [OO-InterfacesUndAbstrakteKlassen_2025-04-10.pdf](lecture_documents/OO-InterfacesUndAbstrakteKlassen_2025-04-10.pdf)

---

**Stand:** April 2026  
**Autor:** Zusammengestellt für das Software Engineering Projekt DHBW Karlsruhe
