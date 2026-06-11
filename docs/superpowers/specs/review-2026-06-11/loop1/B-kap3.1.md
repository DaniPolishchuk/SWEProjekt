# Loop 1 — Subagent B: Kap 3.1 Use-Case-Diagramm

## Bild ↔ Text Inventar

### Kompaktansicht
**Akteure im Bild (6):** Mitarbeiter, Vorarbeiter, Verwaltungsmitarbeiter, Bau-/Projektleiter, Administrator, Finanzbuchhaltungssystem. Keine UML-Vererbungspfeile — Vererbung nur per Notiz + farbige Köpfe.

**Use Cases im Bild (21):** Daten suchen und filtern, Anwesenheitszeiten lesen, Terminplaner lesen, Arbeitsaufträge lesen, Geräte lesen, Bilder verwalten, Personal verwalten, Arbeitsaufträge und Projekte lesen, Verwaltungsdaten integrieren (mit EP1–EP6), Geräte verwalten, Arbeitsaufträge und Projekte verwalten, Buchungen verwalten, Verfügbarkeit prüfen, Finanzdaten lesen, Daten exportieren, Daten importieren, Daten übertragen, Daten archivieren, Benutzerrollen verwalten, Backup erstellen, System verwalten.

**DIFFERENZ:**
- „Verfügbarkeit prüfen" hat im Text keinen eigenen Beschreibungsabsatz (nur en passant Z. 120).
- „Geräte verwalten" hat im Text Z. 108 nur Überschrift, keinen Text.
- EP-Liste in „Verwaltungsdaten integrieren" zeigt 6 Punkte, aber Diagramm hat nur 5 <<extend>>-Pfeile (Pfeil von „Buchungen verwalten" fehlt).
- EP2 heißt „Buchung verwalten" (Singular), UC heißt „Buchungen verwalten" (Plural).
- Bild-Notiz: Wörtliche Doppelung „erben vom **Akteure erben vom** Akteur Mitarbeiter".
- Bild-Notiz: „im **folgenden** weiter vertieft" sollte „im Folgenden".
- Akteur Finanzbuchhaltungssystem hat farbigen Kopf — laut Notiz Vererbung von Mitarbeiter, was für externes System falsch ist.

### Vertiefung „Geräte verwalten"
**Akteure (2):** Verwaltungsmitarbeiter, Bau-/Projektleiter.
**UCs (7):** Gerät anlegen (rot), Gerät bearbeiten, Ausrüstung zuordnen, Lager verwalten, Ausrüstung verwalten, Gerät löschen, Buchung stornieren.

**DIFFERENZ:**
- „Gerät anlegen" Z. 170 nur Überschrift, kein Text.
- UML-Verstoß: `<<include>>` von „Gerät anlegen"/„Gerät bearbeiten" zu „Ausrüstung zuordnen", aber Text und Bild-Notiz beschreiben Zuordnung als „optional". Vorlesung Folie 30: include = nicht optional. Sollte `<<extend>>` sein.
- Bild-Notiz: „dessen **Buchung** aufgelöst werden" → „Buchungen".
- „Buchung stornieren" als <<extend>> von „Gerät löschen" — semantisch fragwürdig.
- Z. 164 listet „Buchung stornieren" nicht auf, obwohl Teil des Diagramms.

### Vertiefung „Gerät anlegen"
**Akteure (1):** Verwaltungsmitarbeiter.
**UCs (14):** Auf Duplikate prüfen, Gerätetyp auswählen, Bild hinzufügen, Lager und Standort zuordnen, Ausrüstung zuordnen, Geräteeigenschaften definieren, Bild suchen + 7 Pflichtattribut-UCs (Gerätenummer, Bezeichnung, Kategorie, Status, Seriennummer, Anschaffungsdatum, Wartungstermine definieren).

**DIFFERENZ:**
- 14 UCs überschreiten die 10-UC-Empfehlung der Vorlesung deutlich.
- „Auf Duplikate prüfen" und „Gerätetyp auswählen" stehen isoliert (nur Akteur-Linie), keine include-Anbindung — Reihenfolge nicht modelliert, obwohl Text Z. 209 von „steuernder Funktion" spricht.
- „Lager und Standort zuordnen" und „Ausrüstung zuordnen" haben keine include-Verbindung zu „Geräteeigenschaften definieren". Text Z. 229 spricht aber von <<include>> aus „Gerät anlegen", den es als UC-Knoten gar nicht gibt (nur Systemrechteck-Name).
- Z. 205 sagt, alle hellblauen UCs würden „direkt" vom Akteur ausgeführt — „Bild suchen" hat aber keine Akteur-Linie.

## Kritisch (8)
1. Z. 108 fehlt Beschreibungstext für „Geräte verwalten".
2. Z. 170 fehlt Beschreibungstext für „Gerät anlegen".
3. „Verfügbarkeit prüfen" fehlt als eigener Abschnitt.
4. EP-Liste vs. tatsächliche <<extend>>-Pfeile inkonsistent (6 vs. 5).
5. Singular/Plural „Buchung verwalten" vs. „Buchungen verwalten" vereinheitlichen.
6. UML-Verstoß: <<include>> für optionale „Ausrüstung zuordnen" sollte <<extend>> sein.
7. Verfeinerungs-Diagramm „Gerät anlegen" hat 14 UCs (>10).
8. „Gerätetyp auswählen" und „Auf Duplikate prüfen" isoliert ohne include/extend.

## Wichtig (14)
Doppelung in Bild-Notiz, falscher Kopf bei FiBu, fehlende UML-Vererbungspfeile, „Akteure" vs. „Benutzerrollen", Dativ-Fehler („Geräten"), undefinierte „Vorgesetzte", Inkonsistenz Anwesenheitszeiten, „Terminplaner lesen" mit Schreibrechten, Verb-Subjekt-Kongruenz Z. 116, Logikfehler „aktuelle/zukünftige" + Status „abgeschlossen", <<include>>-Problem Z. 174, Buchung-stornieren-Erweiterung, Formulierung Z. 100, „sicherheitskritisch" vs. „keine Verschlüsselung".

## Stil / Fluff (10)
Verschachteltes Z. 12, Wiederholung Z. 22, „regulär"/„minimal", Klammereinwurf Z. 73 und 85, „Rechte auf das System", vage Z. 153, fehlende Konvention „verwalten", geschwollen Z. 199.

## Tippfehler / Grammatik (16)
„User-Case" (Z. 64), „Verwaltungsmitarbeiten" (Z. 72), „anhand von den Attributen" (Z. 105), Kommafehler (Z. 114, 178), „im Büro von" (Z. 190), „dann" redundant (Z. 194), „Geräts"-Wiederholung (Z. 233), Bild-Notiz-Tippfehler (3x).

## Anmerkungen (9)
Konvention „verwalten" definieren, Notationserklärung erweitern, **UC-Templates fehlen** (Vorlesung verlangt sie für 1.0), Reflexion am Kapitelende fehlt, Querverweise, `<<system>>`-Stereotyp für FiBu, Plural/Singular vereinheitlichen, Begründung „Geräte lesen"/„Geräte verwalten"-Trennung.

---

**Zahlen:** 8 kritisch / 14 wichtig / 10 stil / 16 tippfehler / 9 anmerkungen.
