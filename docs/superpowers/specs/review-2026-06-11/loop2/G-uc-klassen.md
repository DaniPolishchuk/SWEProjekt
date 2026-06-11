# Loop 2 — Subagent G: Use-Case ↔ Klassendiagramm

## Akteur-zu-Klasse-Mapping
| Akteur (Kap 3.1) | Klasse/Rolle (Kap 3.2) | Status |
|---|---|---|
| Mitarbeiter (Basisakteur) | Klasse `Mitarbeiter` (PUML Z.54) + `Rolle.name="Mitarbeiter"` (3.2 Z.45) | OK |
| Vorarbeiter | Über `Mitarbeiter.position` (PUML Z.57) und `Rolle.name="Vorarbeiter"` | OK |
| Verwaltungsmitarbeiter | Über `position` und `Rolle.name="Verwaltungsmitarbeiter"` | OK |
| Bau-/Projektleiter | `position` + `Rolle.name="Bauleiter"` | **Inkonsistent**: 3.2 Z.45 listet nur „Bauleiter", in 3.1 jedoch „Bau-/Projektleiter" — „Projektleiter" fehlt |
| Administrator | `Rolle.name="Administrator"` | OK |
| Finanzbuchhaltungssystem | Klasse `Finanzbuchhaltung` (PUML Z.30) | **Bezeichnungsabweichung**: Akteur „Finanzbuchhaltungssystem" vs. Klasse `Finanzbuchhaltung` |
| (kein UC-Akteur) | `Altsystem`, `Drucker` im KlD | **Lücke**: Beide im KlD, im UC kein Akteur — obwohl „Daten importieren" Z.141 explizit „aus dem Altsystem" beschreibt |
| (kein UC-Akteur) | `Unterauftragnehmer` | **Lücke**: im KlD als Person modelliert, im UC nicht als Akteur — sollte in Notationserklärung erwähnt werden |

## Use-Case-zu-Modell-Mapping (Top-Use-Cases)

| Use Case | unterstützende Klasse(n) | Status |
|---|---|---|
| Daten suchen und filtern (Z.62) | Querschnittsfunktion | OK |
| Anwesenheitszeiten lesen (Z.66) | `Anwesenheitszeit` Komposition zu `Mitarbeiter` | OK |
| Terminplaner lesen (Z.70) | `Termin` (Z.122) | **Lücke**: keine Klasse „Terminplaner" als Aggregat. CLAUDE.md fordert „Terminplaner als einfache Klasse modellieren" — fehlt |
| Arbeitsaufträge lesen | `Arbeitsauftrag`, `Projekt`, `Unterauftrag` | OK |
| Bilder verwalten (Z.98) | `Bild` (Z.194) | UC beschreibt Bilder an „Geräten, Aufträgen oder Mitarbeitern". Im PUML fehlt jedoch `Arbeitsauftrag → Bild` |
| Personal verwalten (Z.103) | `Person`, `Mitarbeiter`, `Adresse`, `Gruppe` | OK |
| Geräte verwalten (Z.108) | `Geräte-Typ`, `Gerät`, `Lager`, `Ausrüstung`, `Termin` | OK |
| Arbeitsaufträge und Projekte verwalten (Z.110) | `Arbeitsauftrag`, `Projekt`, `Unterauftrag`, `Unterauftragnehmer`, `Dokument`, `Adresse` | **Inkonsistenz n:m vs. 1:n**: UC „Referenz", 3.2-Text „n:m", PUML „1:n" |
| Buchungen verwalten / Verfügbarkeit prüfen (Z.118) | `Buchung` Koordinator, `Gerät`, `Arbeitsauftrag` | OK |
| Finanzdaten lesen (Z.123) | `Rechnung` + `Finanzbuchhaltung..>Rechnung` | UC Z.112 sagt „Kostenvoranschlag aus Finanzbuchhaltung lesend"; im KlD Kostenvoranschlag als `Dokument`, nicht als Finanzdatum. **Widerspruch** |
| Daten archivieren (Z.127) | keine Klasse | **Lücke**: 10-Jahres-Aufbewahrung nicht im Datenmodell sichtbar |
| Daten übertragen / importieren / exportieren | `Altsystem` ohne Beziehung im PUML | **Lücke**: Importpfad ist im Modell unsichtbar |
| Benutzerrollen verwalten (Z.131) | Klasse `Rolle` (Z.69) | OK |
| System verwalten (Z.147) | `Anwesenheitszeit` für Korrekturen | Konfigurationsdaten als Klasse fehlen |

### Verfeinerung „Geräte verwalten"
| Use Case | Klasse/Methode | Status |
|---|---|---|
| Gerät anlegen / bearbeiten / löschen | `Gerät`, `Geräte-Typ`, `Lager`, `Termin` | OK |
| Ausrüstung zuordnen (Z.176) | UC: `Gerät — Ausrüstung` ERWARTET | **Kritisch**: PUML Z.243 hängt `Ausrüstung` an `Lager`, nicht an `Gerät`. Direkter Widerspruch |
| Ausrüstung verwalten (Attribut „Kompatibel mit") | `Ausrüstung.kompatibel` (Z.169) | UC schreibt „Kompatibel mit", 3.2-Text „kompatibel-mit", PUML `kompatibel` — drei Schreibweisen |

### Verfeinerung „Gerät anlegen" (Pflichtattribute)
| Use Case (Pflichtattribut) | Attribut in PUML `Geraet` | Status |
|---|---|---|
| Gerätenummer definieren | `geraeteNummer` | OK |
| Bezeichnung definieren (Z.216) | **Fehlt in `Geraet`** — `bezeichnung` ist nur in `Geraete-Typ` | Inkonsistent |
| Kategorie definieren (Z.217) | `Geraete-Typ.kategorie` — nicht in `Geraet` | **Inkonsistent**: UC fordert pro-Exemplar |
| Seriennummer definieren | `Geraet.seriennummer` | OK |
| Status definieren | `Geraet.status` | OK |
| Anschaffungsdatum definieren | `Geraet.anschaffungsdatum` | OK |
| Wartungstermine definieren | `Geraet → "0..*" Termin` | OK |
| Lager und Standort zuordnen (Z.223) | `Geraet → "1" Lager` | **Lücke „Standort"**: UC trennt Lager und Standort, im PUML existiert kein Standort-Attribut |
| Bild hinzufügen | `Bild` + `Geraet → Bild` | OK |
| Auf Duplikate prüfen | keine Methode/Constraint im Modell | Akzeptabel |

## Bezeichnungskonsistenz
- **„Finanzbuchhaltungssystem" (UC) vs. „Finanzbuchhaltung" (Klasse)**
- **„Bau-/Projektleiter" (UC) vs. „Bauleiter" (Rolle 3.2 Z.45)** — Projektleiter fehlt
- **„Kompatibel mit" / „kompatibel-mit" / `kompatibel`** — drei Schreibweisen
- **„Buchung verwalten" (Singular EP) vs. „Buchungen verwalten" (Plural UC) vs. Klasse `Buchung`**
- **„Anwesenheitszeit/Arbeitstag" vs. PUML `datum`**
- **„Zwischentermin" als Attribut in 3.2-Text** — nicht im PUML, im UC nicht erwähnt
- **„Beschäftigungsort" (PUML) vs. „Beschäftigungsart" (UC Z.105)** — zwei verschiedene Begriffe

## Kritisch (klare Lücken/Widersprüche)

1. **Baugruppen-Widerspruch Gerät↔Ausrüstung**: UC Z.178 „Ausrüstung mit Gerät verknüpft"; PUML hängt Ausrüstung an Lager. **Note-relevant**.
2. **Standort fehlt im Modell**: UC „Lager und Standort zuordnen" (Z.223–225) trennt klar Lager und Standort. Kein Standort-Attribut auf `Geraet`.
3. **„Arbeitsauftrag → Bild"-Beziehung im KlD fehlt**, obwohl UC „Bilder verwalten" und Liste-Muster sie verlangen.
4. **Kostenvoranschlag-Doppelmodellierung**: UC sagt „aus Finanzbuchhaltungssystem lesend übernommen". KlD modelliert ihn als `Dokument`. Widersprüchliche Quelle.
5. **„Terminplaner" als Klasse fehlt**: CLAUDE.md fordert „Terminplaner als einfache Klasse modellieren". Im KlD existiert nur `Termin`.
6. **Altsystem-Importpfad nicht modelliert**: UC „Daten importieren" sagt „aus dem Altsystem". PUML hat `Altsystem` ohne Assoziation.
7. **n:m vs. 1:n bei Arbeitsauftrag↔Projekt**: drei verschiedene Aussagen über drei Stellen.
8. **Akteur Finanzbuchhaltungssystem nutzt nur „Verwaltungsdaten integrieren"** im UC, aber im KlD nur `<<read>>` mit `Rechnung`.

## Wichtig

9. **Bezeichnung als Geräte-Exemplar-Attribut** (UC Z.216) widerspricht Modellierung in `Geraete-Typ`.
10. **Kategorie ebenso**: UC fordert pro-Exemplar, im PUML im Typ.
11. **Akteur-Vererbung im UC-Diagramm fehlt als UML**, Rolle-Aufzählung sollte mit UC-Akteurnamen exakt übereinstimmen.
12. **Anwesenheitszeit-Korrektur**: UC „System verwalten" erlaubt Admin das Korrigieren — sollte im Klassentext erwähnt werden.
13. **Buchender Mitarbeiter**: UC sagt „Bau-/Projektleiter buchen", KlD modelliert generische `Buchung → Mitarbeiter` ohne Rollen-Constraint.
14. **Beschäftigungsart vs. Beschäftigungsort** — zwei verschiedene Begriffe.
15. **`Termin.typ`**: UC unterscheidet Termine, Wartungstermine, Buchungstermine, Zwischentermine. Modelltext nennt diese Differenzierung nicht.

## Stil / Fluff
- „Auswahlliste" mehrfach im UC — im KlD kein modellseitiges Pendant (z.B. `<<enumeration>>`).
- Im UC „Geräte verwalten" (Z.108) fehlt komplett der Beschreibungstext.
- 3.2-Text Z.43 nennt Werte „Bauleiter, Bauarbeiter, Vorarbeiter, Mitarbeiter" für `Rolle` — UC-Akteure heißen „Vorarbeiter, Mitarbeiter, Verwaltungsmitarbeiter, Bau-/Projektleiter, Administrator". Nicht synchron.

## Anmerkungen
- Empfehlung: Tabelle „Akteur ↔ Rolle ↔ Mitarbeiter-Position" in Kap 3.2/Anhang.
- Empfehlung: Im UC-Notationskasten klar angeben, dass `Unterauftragnehmer` Datenobjekt, kein Akteur.
- Empfehlung: Wenn Gerätebezeichnung pro Exemplar variiert, `bezeichnung` zusätzlich in `Geraet`.
- Empfehlung: `Standort` als Attribut von `Geraet` ergänzen oder UC reduzieren.
- **Zentrale Widersprüche für Note 1.0**: Punkte 1, 2, 5 (Baugruppe, Standort, Terminplaner).

---

**Zahlen:** 8 Kritisch / 7 Wichtig / 3 Stil / 5 Anmerkungen.
