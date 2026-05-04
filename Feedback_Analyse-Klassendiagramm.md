# Feedback: Analyse-Klassendiagramm

**Datum:** 04.05.2026  
**Geprüfte Dateien:** `chapter/3.2_Analyse-Klassendiagramm.typ`, `assets/klassendiagramm/klassendiagramm.mmd`  
**Grundlage:** Vorlesungsfolien (OO-Analysemuster), Lastenheft-Entitätstabellen aus `Kapitel_Edit.typ`, Use-Case-Diagramm

---

## Kritische Fehler

### 1. Muster „Gruppe" — falsch angewendet

**Problem:** Das Gruppen-Muster (Vorlesung, Muster 9) definiert als Kerneigenschaft:
> *„Jedes Einzelobjekt kann höchstens in einer Gruppe Mitglied sein."*

Das erfordert die Multiplizität `0..1` am Gruppen-Ende. Das Diagramm modelliert stattdessen eine n:m-Beziehung:
```
Mitarbeiter "0..*" -- "0..*" Gruppe
```
Das Lastenheft (LF 20) fordert explizit: *„ein Mitarbeiter kann mehreren Gruppen angehören"* — diese n:m-Anforderung schließt das Gruppen-Muster strukturell aus. Der Beschreibungstext bestätigt sogar die n:m-Natur, nennt es aber trotzdem „Gruppen-Muster". Das ist ein direkter Widerspruch.

**Korrektur:**  
Die Beziehung als einfache n:m-Assoziation ohne Musterbenennung darstellen. Falls die Mitgliedschaft eigene Attribute trägt (z.B. Eintrittsdatum), wäre das **Koordinator-Muster** anwendbar.

---

### 2. Muster „Rolle" — falsch angewendet

**Problem:** Das Rollen-Muster (Vorlesung, Muster 6) beschreibt:
> *„Zwischen zwei Klassen existieren zwei oder mehrere einfache Assoziationen. Ein Objekt kann — zu einem Zeitpunkt — in Bezug auf die Objekte der anderen Klasse verschiedene Rollen spielen."*

Das Beispiel in der Vorlesung: Referent ist gleichzeitig *Vortragender* und *Zuhörer* eines Tutoriums — modelliert als **mehrere benannte Assoziationen** zwischen denselben Klassen.

Das Diagramm modelliert stattdessen:
```
Mitarbeiter "0..*" --> "1" Rolle : hat Rolle
```
Das ist eine Referenztabelle für Zugriffsrechte (Rollennummer, Name), kein Rollen-Muster. Eine `Rolle`-Klasse mit nur zwei Attributen bildet das Muster nicht ab.

**Korrekte Anwendung im Domänenkontext** wären mehrere benannte Assoziationen, z.B.:
```
Mitarbeiter "0..*" --> "0..*" Projekt : Projektleiter
Mitarbeiter "0..*" --> "0..*" Arbeitsauftrag : beteiligter Mitarbeiter
Mitarbeiter "0..*" --> "0..*" Gruppe : Gruppenleiter
```

**Korrektur:**  
Entweder den Abschnitt in „Zugriffsrechteverwaltung" umbenennen (kein Muster) oder das echte Rollen-Muster durch mehrere benannte Assoziationen implementieren.

---

### 3. Muster „Baugruppe" — Aggregation statt Komposition, falsche Multiplizität

**Problem:** Die Vorlesung (Muster 3) definiert Baugruppe als:
> *„Existenzabhängige Zugehörigkeit der Teile"*, *„Zugang zu Teilen nur über das Ganze"*

CLAUDE.md bestätigt: **Komposition (1..*)**.

Das Diagramm verwendet:
```
Geraet "1" o-- "0..*" Ausruestung    ← o-- = Aggregation (leere Raute), 0..* = kein Pflicht-Bauteil
```

Zwei Fehler:
1. `o--` (Aggregation, leere Raute) statt `*--` (Komposition, gefüllte Raute)
2. Multiplizität `0..*` statt `1..*` — das Muster sieht mindestens ein Bauteil vor

**Korrektur:**
```
Geraet "1" *-- "1..*" Ausruestung : hat Ausruestung
```

---

### 4. Fehlendes Exemplartyp-Muster (Gerät)

**Problem:** CLAUDE.md nennt das Exemplartyp-Muster explizit als erwartet für Baumaschinen: *„Baumaschinen (Typ vs. konkretes Exemplar mit Seriennummer)"*.

Die aktuelle `Geraet`-Klasse mischt Typ-Attribute (für alle identischen Maschinen gleich) und Exemplar-Attribute (individuell pro Maschine) in einer einzigen Klasse:

| Typ-Attribute (redundant bei gleichen Maschinen) | Exemplar-Attribute (individuell) |
|--------------------------------------------------|----------------------------------|
| `bezeichnung`, `typ`, `kategorie` | `seriennummer`, `anschaffungsdatum`, `status`, `standort`, `letzterWartungstermin`, `naechsterWartungstermin` |

Ein Fuhrpark mit 3 Baggern CAT 320 würde `bezeichnung = "Bagger CAT 320"` und `kategorie = "Bagger"` dreifach redundant speichern. Das Exemplartyp-Muster (Vorlesung, Muster 2) löst genau dieses Problem.

**Korrektur:** Aufteilen in zwei Klassen mit einfacher Assoziation:
- `GeraetTyp`: `bezeichnung`, `typ`, `kategorie` (gemeinsame Typ-Eigenschaften)
- `GeraetExemplar`: `seriennummer`, `anschaffungsdatum`, `status`, `standort`, `letzterWartungstermin`, `naechsterWartungstermin` (individuelle Instanz-Eigenschaften)
- Assoziation: `GeraetExemplar "0..*" --> "1" GeraetTyp`

---

## Wichtige Fehler

### 5. Termin-Klasse: Referenzen als Attribute statt Assoziationen, fehlendes Datum

**Problem 1 — Regelverstoß:** CLAUDE.md und Vorlesung: *„Referenzen als Assoziationslinien, NICHT als Attribute in der Klasse."*

Die Termin-Klasse enthält:
```
class Termin {
    -arbeitsauftrag: Referenzen   ← FALSCH: muss Assoziation sein
    -projekt: Referenzen          ← FALSCH: muss Assoziation sein
    -buchung: Referenzen          ← FALSCH: muss Assoziation sein
}
```
Diese drei Felder müssen als Assoziationspfeile modelliert werden.

**Problem 2 — Fehlendes Datum:** Eine Termin-Klasse, die als `Zwischentermin` für Arbeitsaufträge verwendet wird (`Arbeitsauftrag "0..*" --> "0..*" Termin`), hat kein einziges Datum-Attribut. Das ist fachlich falsch.

**Problem 3 — Semantische Unklarheit:** Die Klasse ist gleichzeitig Terminplaner (hält Referenzen auf alle Aufträge/Projekte) und einzelner Zwischentermin — das sind zwei verschiedene Konzepte.

**Korrektur:**
- Klasse in `Termin` (einzelner Termin) umbenennen und mindestens `datum: Datum` sowie `bezeichnung: Text` hinzufügen
- Die Referenzen zu Arbeitsauftrag, Projekt, Buchung als Assoziationspfeile modellieren
- Falls Terminplaner als Container benötigt: separate `Terminplaner`-Klasse anlegen

---

### 6. Falsche Multiplizität: Projekt — Arbeitsauftrag

**Problem:** Aktuelle Multiplizität im Diagramm:
```
Projekt "1..*" -- "1..*" Arbeitsauftrag
```
Die Q&A-Analyse in `Kapitel_Edit.typ` sagt explizit:
> *„Soll es Projekte ohne Aufträge geben können? → Ja, ein neu angelegtes Projekt kann zunächst ohne Aufträge existieren."*

Die Multiplizität `1..*` auf der Arbeitsauftrag-Seite widerspricht dem: sie würde verlangen, dass jedes Projekt mindestens einen Auftrag hat.

**Korrektur:**
```
Projekt "0..*" -- "1..*" Arbeitsauftrag
```
(0 oder mehr Aufträge pro Projekt, aber jeder Auftrag muss mindestens einem Projekt zugeordnet sein)

---

## Mittlere Fehler

### 7. Beschreibungstexte stimmen nicht mit Entitätstabellen überein

Die folgenden Abweichungen bestehen zwischen dem Beschreibungstext im `.typ` und den definierten Entitätstabellen:

| Klasse | Im Beschreibungstext | Korrekt laut Entitätstabelle |
|--------|----------------------|------------------------------|
| `Mitarbeiter` | *„Name"* (zusammengefasst) | Getrennte Attribute: `vorname` und `nachname` |
| `Mitarbeiter` | *„Vertragszeitraum"* | Getrennte Attribute: `vertragsbeginn` und `vertragsende` |
| `Bild` | Nur `dateipfad` und Hochlader erwähnt | Fehlend im Text: `dateiname`, `elementtyp`, `hochladedatum`, `dateigroesse`, `format` |

(Im MMD-Diagramm selbst sind die Attribute korrekt vorhanden — das Problem betrifft nur den Beschreibungstext.)

---

### 8. Bild-Klasse: Semantisch unklare bidirektionale Beziehung zu Mitarbeiter

**Problem:** Das Diagramm enthält gleichzeitig:
```
Bild "0..*" --> "1" Mitarbeiter : Hochlader     ← Bild zeigt auf Mitarbeiter
Mitarbeiter "1" *-- "0..*" Bild : hat Bilder    ← Mitarbeiter besitzt Bild (Komposition)
```
Das ergibt eine bidirektionale Mitarbeiter↔Bild-Beziehung mit zwei verschiedenen Semantiken: Mitarbeiter ist gleichzeitig „Besitzer" (Komposition) und „Hochlader" (Navigation). Das sind zwei unterschiedliche Rollen desselben Mitarbeiters, die im Text nicht explizit unterschieden werden.

**Korrektur:**  
Beide Assoziationen behalten, aber im Beschreibungstext klar erläutern: Die Komposition drückt aus, dass ein Bild genau einem Element (Mitarbeiter, Arbeitsauftrag, Projekt oder Gerät) zugehört. Die Hochlader-Assoziation ist davon unabhängig und zeigt, wer das Bild hochgeladen hat.

---

## Geringfügige Mängel

### 9. Analysemuster-Abbildungen enthalten keine Diagramme

Jeder Muster-Unterabschnitt hat ein `#figure`, enthält aber nur Fließtext:
```typst
#figure(caption: [Analysemuster Gruppe -- Organisationsstruktur])[
  Die n:m-Beziehung zwischen `Mitarbeiter` und `Gruppe`...
]
```
CLAUDE.md verlangt: *„jeweils eigener Unterabschnitt mit separater Abbildung"* — gemeint sind UML-Ausschnitts-Diagramme als Bild, keine reinen Textblöcke.

**Korrektur:** Für jedes Muster einen SVG/PNG-Ausschnitt aus dem Hauptdiagramm erstellen und als tatsächliche Abbildung einbinden.

---

### 10. Abhängigkeitsrichtung Finanzbuchhaltung unerläutert

```
Finanzbuchhaltung ..> Rechnung : liest
```
Der Pfeil suggeriert, dass `Finanzbuchhaltung` die `Rechnung`-Klasse (im eigenen System) *verwendet*. Das klingt semantisch rückwärts: eigentlich liefert das externe System die Daten. Die Darstellung ist vertretbar, muss aber im Text erklärt werden.

**Korrektur:** Im Beschreibungstext explizit erläutern: „Der Abhängigkeitspfeil zeigt, dass die Rechnung-Daten vom Finanzbuchhaltungssystem bereitgestellt und durch dieses in das System eingelesen werden."

---

## Gesamtübersicht

| # | Problem | Schweregrad |
|---|---------|-------------|
| 1 | Gruppen-Muster: n:m verletzt Kernprinzip (max. eine Gruppe pro Mitglied) | **Kritisch** |
| 2 | Rollen-Muster: falsch identifiziert — ist nur eine Berechtigungsklasse | **Kritisch** |
| 3 | Baugruppe: Aggregation statt Komposition; Multiplizität `0..*` statt `1..*` | **Kritisch** |
| 4 | Exemplartyp-Muster fehlt komplett (für Gerät explizit erwartet) | **Kritisch** |
| 5 | Termin: Referenzen als Attribute; kein Datum; Semantik unklar | **Wichtig** |
| 6 | Projekt–Arbeitsauftrag: Multiplizität `1..*--1..*` statt `0..*--1..*` | **Wichtig** |
| 7 | Beschreibungstexte weichen von Entitätstabellen ab | **Mittel** |
| 8 | Bild: Komposition + Hochlader-Navigation zu Mitarbeiter unerklärt | **Mittel** |
| 9 | Analysemuster-Figures ohne Diagramme | **Gering** |
| 10 | Abhängigkeitsrichtung Finanzbuchhaltung nicht begründet | **Gering** |

---

*Geprüft gegen: Vorlesungsfolien OO-Analysemuster (R. Lutz, KIT/IAI), Lastenheft-Entitätstabellen, Use-Case-Diagramm*
