# Loop 3 — Subagent J: Schlusspass gegen Beispielarbeiten

## Strukturelle Lücken (vs. 1.0-Beispielen)

### 1. Komplett fehlendes Kapitel "Besonderheiten" am Dokumentende
- **Beispiel 1** schließt mit Kapitel 7 "Besonderheiten" (10 Unterabschnitte).
- **Beispiel 2** schließt mit Kapitel 9 "Besonderheiten" (6 Unterabschnitte).
- CLAUDE.md fordert explizit: *"6-10 Punkte, jeweils eigener Unterabschnitt. Alles hervorheben, was über die Mindestanforderungen hinausgeht."*
- **Status**: `main-Programmentwurf.typ:69-83` — letztes Kapitel ist `5_GUI-Modellierung-MVC.typ`. **KEIN Besonderheiten-Kapitel.**
- **Bewertungs-relevant**: Beide 1.0-Beispiele nutzen das Kapitel, um Note-erhöhende Aspekte sichtbar zu machen.

### 2. Kein durchgehendes Kapitel "Aufgabenstellung" als zitiertes Original
- **Beispiel 1** Kap 1: zitiert das Lastenheft 1:1 als Aufgabenstellung, **getrennt** von der Analyse (Kap 2).
- **Beispiel 2** Kap 1 ebenso.
- **Aktuelles Dokument**: `1_Aufgabenstellung.typ:83` startet direkt mit `= Analyse des Lastenhefts` — die Aufgabenstellung ist mit der Analyse vermischt.

### 3. Fehlender Schlusssatz "Diskussion: Vor- und Nachteile" pro Diagramm-Kapitel
- **Beispiel 1** Z.1662 hat `**Diskussion: Vor- und Nachteile des verschachtelten Aufrufs**` als eigenständigen Heading-Block direkt nach dem ersten Unterprogramm-SD.
- **Aktuelles Dokument**: `4.1_Sequenzdiagramm_Auftrag.typ:70` hat zwar `=== Reflexion`, aber:
  - keine Vor-/Nachteile-Diskussion einzelner Unterprogramme (nur globale Gesamtreflexion)
  - die Reflexion in 4.2 ist sehr knapp.

### 4. Klassendiagramm mit individuellen Teil-Abbildungen pro Analysemuster fehlt
- **Beispiel 1** Z.1418–1500: Jedes Analysemuster bekommt eine **eigene Abbildung** (7 Detail-Abbildungen).
- **Aktuelles Dokument**: `3.2_Analyse-Klassendiagramm.typ:113-156` hat nur Headings (`=== Muster: Exemplartyp/Baugruppe/...`) **ohne separate Detail-Abbildungen**.
- CLAUDE.md fordert explizit: *"Analysemuster explizit benennen und begründen (jeweils eigener Unterabschnitt mit separater Abbildung)"* — letzter Halbsatz nicht erfüllt.

### 5. Verfeinerte Use-Case-Diagramme nach unterschiedlicher Logik
- **Beispiel 2** macht **mehrere thematisch unterschiedliche** Verfeinerungen.
- **Aktuelles Dokument** macht zwei Verfeinerungen, aber beide drehen sich um Geräte. Eine **zweite thematisch unterschiedliche** Verfeinerung (z.B. "Buchungen verwalten" oder "Aufträge verwalten") würde aufwerten.

### 6. Pseudocode-Tiefe
- **Beispiel 1** Listing "Auftrag durchführen" ~140 Zeilen Pseudocode für das Hauptszenario, stark untergliedert.
- **Aktuelles Dokument** Listing 4.1.1 wesentlich kürzer (Phase 2 nur Delegation).

### 7. Inhaltsverzeichnis-Stil
- **Beispiel 1** Z.27–110 hat ein extrem detailliertes Inhaltsverzeichnis (~85 Zeilen). Sollte beim aktuellen Dokument geprüft werden, ob Tiefe und Seitenzahlen vollständig sind.

## Stilistische Abweichungen

### 1. Fehlender Konvention-Hinweis "verwalten = lesen + bearbeiten"
- **Beispiel 1** Z.1314: erläutert ausdrücklich. CLAUDE.md fordert: *"'verwalten' = lesen + bearbeiten (Konvention erklären)"*.
- **Aktuelles Dokument**: nicht behoben (siehe Loop-1-B-Anmerkung).

### 2. "Pseudorolle" / "fiktive Rolle" als didaktisches Etikett fehlt
- **Beispiel 1** Z.1274: *"Basisrolle … fiktive Rolle, die keinem Endnutzer direkt zugewiesen wird"*.
- **Beispiel 2** Z.2031: Heading `4.1.1 Mitarbeiter (Pseudorolle)`.
- **Aktuelles Dokument**: keine derartige explizite Kategorisierung.

### 3. "Negativ:"-Begründungen fehlen
- **Beispiel 1** Z.386: verwendet "## Negativ:" als Heading-artige Markierung für Anti-Anforderungen.
- **Aktuelles Dokument**: implizit über `Intern:`-Präfix, keine sichtbare visuelle Trennung.

### 4. UC-Verfeinerungs-Reihenfolge
- Beispiele halten Rollen-Erläuterung als **eigenen Unterabschnitt 3.1.1**, im Dokument als `==` (Schwester-Heading), strukturell nicht ganz analog.

### 5. Externe Akteure als eigene Personenrolle
- **Beispiel 1** Z.1300 modelliert "Kunden" explizit als externen Akteur trotz nur indirekter Interaktion.
- **Aktuelles Dokument**: keine externe Person-Rolle (siehe Loop-2-I Punkt 1: Kunde fehlt).

## Übersehene Anforderungen

### 1. UC-Templates / standardisierte Beschreibungsschablonen
- **Beispielarbeit 2** Z.2108–2354 jeden UC mit standardisiertem 3-8-Satz-Block.
- Im aktuellen Dokument haben mehrere UCs gar keinen Beschreibungstext (Loop-1-B Punkte 1, 2, 3).

### 2. Branchenspezifische Plugin-/Allgemeinheits-Diskussion
- **Beispiel 1** Kap 7.1+7.4: starke Argumentation zur **Allgemeinheit** der Software (Plugin-Mechanismus).
- **Aktuelles Dokument**: keine **explizite konzeptionelle Diskussion** als Besonderheits-Punkt.

### 3. Globaler Server / Datenverfügbarkeit als architektonische Entscheidung
- **Beispiel 2** Kap 9.4+9.5: Diskussion zur Verfügbarkeit, Read-Only-Cache.
- **Aktuelles Dokument**: keine sichtbare architektonische Diskussion.

### 4. Tablet-Erweiterung
- Lastenheft erwähnt Tablet-Projekt explizit *"Vorschläge zur Realisierung"*. **Aktuelles Dokument** Loop-1-A erwähnt nur Z.184 die VPN-Aussage. Kein zusammenhängender Tablet-Vorschlags-Block.

### 5. Drei-Klick-Regel als Besonderheit
- Loop-1-A merkt an, dass die "max. drei Klicks"-Aussage 4× redundant wiederholt wird. Wäre Kandidat für Besonderheits-Punkt "Bedienbarkeit / Effizienz".

### 6. Java-Swing-Mapping-Ansicht als eigene Besonderheit
- `AufträgeÜbersichtJavaSwing.png` liefert genau das, was Beispiel 1 Kap 7.9 als Besonderheit hervorhebt. **Im Dokument vorhanden, aber NICHT als Besonderheit ausgeflaggt.** Niedrig hängende Frucht.

## Top-Note-Killer (5 wichtigste Lücken für Note 1.0)

1. **Komplett fehlendes Besonderheiten-Kapitel.** Beide 1.0-Beispiele schließen damit. CLAUDE.md fordert es explizit. **Direkt note-relevant.**

2. **Pro Analysemuster fehlt eine separate Detail-Abbildung.** Beispiel 1 verwendet 7 Detail-Abbildungen für 4 Muster. Aktuelles Dokument hat 5 Muster, aber keine eigenen Abbildungen.

3. **swe-utils nicht integriert (Loop-1-F).** CLAUDE.md fordert es bei Aufgabe 3.3. Beispiel 1 Kap 6.1.1 zeigt tiefe Util-Package-Modellierung. **Direkt aus der Aufgabenstellung herleitbar.**

4. **Aufgabenstellung-Kapitel und Analyse-Kapitel sind vermischt.** Beide Beispiele trennen klar: Kap 1 = Lastenheft-Original, Kap 2 = Analyse mit Q&A.

5. **Vor-/Nachteile-Diskussion pro Unterprogramm fehlt (insbesondere SD).** Beispiel 1 hat expliziten `Diskussion`-Heading direkt unter `4.1.1 Unterprogramm: Objekt anlegen`.

## Konservative Kürzungsempfehlungen

1. **`chapter/2_Analyse_des_Lastenhefts.typ` ganz löschen.** Loop-1-A bestätigt: 104 Zeilen Voll-Kopie ohne QaA.

2. **Wiederholte "Maximal drei Klicks"-Aussage** auf eine Stelle reduzieren.

3. **Doppelte DSGVO+10-Jahres-Frist** auf eine reduzieren.

4. **Fünf Verweise auf Beispielarbeiten in Kap 4.1** → einer reicht.

5. **Verfeinerung "Gerät anlegen"** mit 14 UCs auf max. 10 reduzieren — Pflicht-Attribut-UCs in Sammelknoten "Pflichtattribute eintragen" zusammenfassen.

6. **Reflexion-Block MVC** straffen oder integrieren.

## Anmerkungen / Beobachtungen

- **Beispiel 2 strukturiert anders als Beispiel 1:** Klassendiagramm vor Use-Case. Aktuelles Dokument folgt Beispiel 1. **Beide Reihenfolgen sind 1.0-fähig.**
- **Anzahl Mockups**: Aktuelles Dokument hat 8+1, Beispiel 1 hat 3, Beispiel 2 hat 2. Hier liegt das Dokument **deutlich über** dem Beispielstandard — sollte als Besonderheit ausgeflaggt werden.
- **Fragenanzahl 131 (Loop-1-A)** liegt zwischen Beispiel-Standards (Beispiel 1 ~110). **Loop-1-A-Empfehlung 170+ ist ggf. zu konservativ.**
- **Klassendiagramm-Klassen**: 22 (Loop-1-C) — Beispiel 1 hat 17. Größenordnung passt.
- **Akademischer Stil**: aktuelles Dokument verwendet teils Markendarstellungen ("BauOS"). Beispiele bleiben nüchterner.
- **`Klassendiagramm_Fix_This.pdf`**: drei Profhinweise (Baugruppe an Gerät, Auftrag-Projekt-Kardinalität, Bild-Komposition) sind weiterhin nicht behoben. **Direkt vom Prüfer markiert — höchste Priorität.**

---

**Anzahl neu identifizierter Lücken über Loop-1/2 hinaus**: 7 strukturell, 5 stilistisch, 6 übersehene Anforderungen, 5 Note-Killer, 6 Kürzungsempfehlungen. 

**Top-Priorität für 1.0**: Besonderheiten-Kapitel anlegen + Analysemuster mit Detail-Abbildungen + swe-utils integrieren + Aufgabenstellung/Analyse trennen + Profhinweise aus `Klassendiagramm_Fix_This.pdf` schließen.
