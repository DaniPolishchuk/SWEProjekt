# Loop 1 — Subagent C: Kap 3.2 Klassendiagramm

Quellen geprüft: `chapter/3.2_Analyse-Klassendiagramm.typ:1-165`, `assets/klassendiagramm/Klassendiagramm.puml:1-256`, `Klassendiagramm_Fix_This.pdf` (handschriftliche Profkorrekturen).

## Klassen-Inventar
**PUML (20 Klassen):** Person, Adresse, Mitarbeiter, Unterauftragnehmer, Rolle, Gruppe, Anwesenheitszeit, Projekt, Arbeitsauftrag, Unterauftrag, Termin, Rechnung, Dokument, Geraete-Typ, Geraet, Ausruestung, Lager, Buchung, Bild, Finanzbuchhaltung, Altsystem, Drucker.
**Text:** alle 20 erwähnt. **Differenz:** keine fehlenden Klassen.

## Attribut-Inkonsistenzen Text ↔ PUML
- **Arbeitsauftrag**: Text Z.63 nennt „Zwischentermin", PUML hat es nicht.
- **Buchung**: PUML Z.186 hat `buchungsdatum`, im Text Z.103+145 nirgends erwähnt.
- **Ausrüstung**: PUML Z.168 hat zusätzliches Attribut `typ`, Text Z.95 nicht.
- **Anwesenheitszeit**: Text „Arbeitstag" (Z.55) vs. PUML `datum`.
- **Gerät-Muster-Beschreibung Z.118**: nennt „Standort" als Instanz-Attribut, ist aber Lager-Assoziation.

## Assoziations-Inkonsistenzen
- **Arbeitsauftrag ↔ Projekt**: Text Z.59 behauptet n:m, PUML Z.227 modelliert `Arbeitsauftrag -> "1" Projekt` (1:n). **Krit.**
- **Termin → Buchung**: Text Z.75 erwähnt diese Assoziation, im PUML existiert sie nicht. **Krit.**
- **Projekt → Bild / Gerät → Bild**: PUML Z.252-253 hat `0..*—0..*`, Text Z.137 behauptet `1 *-- 0..*` mit Komposition. **Krit.**
- **Arbeitsauftrag → Bild**: Text Z.137 listet als Liste-Muster auf, im PUML komplett fehlend. **Krit.**

## Analysemuster-Check
- **Exemplartyp** (Z.115): korrekt benannt + korrekt umgesetzt. OK.
- **Baugruppe** (Z.123-129): Text behauptet `Gerät *-- Ausrüstung`, PUML Z.243 hat aber `Lager *-- Ausrüstung`. **Schwerwiegender Widerspruch — domänenfachlich falsch (Lastenheft will Bagger+Schaufel, nicht Lager+Schaufel).** **Krit.**
- **Liste** (Z.131): Anwesenheitszeit + Unterauftrag korrekt; Bilder-Listen-Behauptung passt nicht zum PUML (s.o.).
- **Koordinator** (Z.142): Buchung gut umgesetzt. OK.
- **Rolle** (Z.150): saubere Abgrenzung zur Berechtigungsklasse Rolle. Sehr gut.
- **Gruppe** (Z.51): negativ begründet (n:m vs. Mustervorgabe), reife Argumentation. Sehr gut.
- Schwellenwert „mind. 5 Muster" (CLAUDE.md) knapp erreicht — eines mehr (z.B. Historie für Anwesenheitszeit/Rechnung) wäre ratsam.

## Kritisch (Bild ↔ Text)
1. Baugruppe-Muster: PUML hängt Ausrüstung an Lager, Text behauptet Gerät. Zentral für Note.
2. Arbeitsauftrag↔Projekt n:m vs. 1:n.
3. Termin↔Buchung-Assoziation fehlt im PUML.
4. Bild-Multiplizitäten Projekt/Gerät: `0..*—0..*` statt `1—0..*` Komposition.
5. Arbeitsauftrag→Bild komplett im PUML fehlend.
6. Zwischentermin-Attribut bei Arbeitsauftrag entfallen, Text erwähnt es noch.

## Wichtig
7. Ausrüstung-Attribut `typ` und Buchung-Attribut `buchungsdatum` im Text nicht erklärt.
8. Externe-Systeme Altsystem/Drucker im PUML ohne jede Beziehung — Text Z.111 erwähnt aber Importschnittstelle und Drucken.
9. Vererbung Unterauftragnehmer←Person konzeptionell schief (Firma hat keinen Vornamen) — keine Begründung im Text.
10. Z.158ff. behauptet beide-Enden-Multiplizitäten als Konvention, PUML setzt das nicht durchgängig um (z.B. nur „1" auf einer Seite).
11. Termin (PUML orange) und Adresse (neutral) — Text Z.17 sagt „beide ohne Farbmarkierung" — nicht stimmig.
12. Z.43 Klassenname-Klammer „(Berechtigungsklasse)" — entweder als Stereotyp ins PUML oder Klammer entfernen.

## Stil / Fluff
- Z.137 vier Klassen in einer Inline-Code-Behauptung — besser vier Bullets.
- Z.158ff. Multiplizitäts-Abschnitt sehr knapp, könnte ein Beispiel vertragen.
- Z.121 etc. Begründungen solide aber Liste-Begründung springt zwischen Beispielen.

## Tippfehler / Grammatik
- Z.91 „z.B." → „z. B." (akademisch).
- Z.95 „kompatibel-mit" Bindestrich-Notation unschön; PUML schreibt `kompatibel`.
- Z.118 „Standort" als Instanz-Attribut, ist aber Assoziation — Formulierung anpassen.

## Anmerkungen — Klassendiagramm_Fix_This.pdf
Profhinweise auf Vorgängerdiagramm und Status:
- „Dokument/Dateiobjekt" (Bauplan/KV waren Attribute) → **behoben** (eigene Klasse Dokument).
- „m:n" Projekt-Auftrag → **teilweise** (PUML 1:n, Text noch n:m).
- „Termin Rolle" Wartungstermin → **behoben** (jetzt Assoziation).
- „Begründen ✓" bei Ausrüstung → **fehlerhaft umgesetzt** (Komposition an falscher Klasse).
- „GPS String" Standort am Gerät → **behoben** (Lager-Assoziation).
- „// Rolle" Mitarbeiter-Rolle → **behoben** (Rollen-Muster dokumentiert).
- Bild-Beziehungen rot eingekringelt → **nicht behoben** (Multiplizitäten 0..*—0..*).
- Farbsektoren → umgesetzt.

**Bilanz Fix_This**: Großteil behoben, drei Punkte (Baugruppe an Gerät, Auftrag-Projekt-Kardinalität, Bild-Komposition) sind unvollständig oder neu inkonsistent.

---

**Zahlen:** 6 Krit, 6 Wichtig, 3 Stil, 3 Tippfehler. 5 Analysemuster benannt + 1 negative Begründung.
