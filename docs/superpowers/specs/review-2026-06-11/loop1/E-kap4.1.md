# Loop 1 — Subagent E: Kap 4.1 Sequenzdiagramm

Geprüft: `chapter/4.1_Sequenzdiagramm_Auftrag.typ` (267 Zeilen) und alle 5 .puml + .png in `assets/`.

## Hauptdiagramm — Lebenslinien
**SD (PUML Z. 36–48):** `:Bau-/Projektleiter`, `:UI Bauverwaltung`, `:Datenbasis`, `:Projekt`, `:Adresse`, `:Mitarbeiter`, `:Arbeitsauftrag`, `:Termin`, `:Unterauftrag`, `:Unterauftragnehmer`.
**Text (Z. 15, 17, 19, 40, 44, 48, 50, 54, 58, 66, 100):** Identische Liste + zusätzlich `Buchung` (im Text Z. 19, 66, 100 erwähnt, im Diagramm nicht als Lebenslinie vorhanden).

## Hauptdiagramm — Nachrichten
**SD:** 1, 1.1–1.3, 2, 2.1, 3, 3.1–3.5, 4, 4.1, 5, 5.1–5.6, 6, 6.1–6.6, 7, 7.1–7.7, 8, 8.1–8.8, 9, 9.1–9.7. PUML endet mit `@enduml` Z. 187 nach 9.7.
**Pseudocode (Listing 4.1.1):** Phase 1 entspricht 1–9.7. Phase 2 (Z. 56–57): nur Delegation `FUEHRE AUFTRAG-LOESCHEN AUS`.

### DIFFERENZ — KRITISCH
1. **Hauptdiagramm zeigt KEINEN Löschvorgang.** Bild + PUML enden bei 9.7. Text (Z. 32 Caption „Auftrag anlegen *und löschen*"; Abschnitt „Löschvorgang mit Kompositionskaskade" Z. 64–68 mit Nachrichten 10, 10.1–10.7, 11, 12, 13, 13.1–13.4 und horizontaler Trennlinie „Löschvorgang") beschreibt aber Inhalte, die im Bild nicht existieren. Auch Z. 19, 36, 70 referenzieren Phase 2 als Bestandteil des Hauptdiagramms.
   - **Lösung A:** PUML um Phase 2 erweitern.
   - **Lösung B (kleiner):** Caption + Z. 36 + Abschnitt „Löschvorgang" umformulieren — Phase 2 sei in das Untersequenzdiagramm `@fig:sd_auftrag_loeschen` ausgelagert.

2. **`:Buchung` als Lebenslinie fehlt** sowohl im Hauptdiagramm als auch im Lösch-Unter-SD, obwohl Text Z. 19/66/100 darauf verweist.

3. **Listing 4.1.2 vs. SD_Unterprogramm_ObjektAnlegen — semantische Inkonsistenz:**
   - Pseudocode (Z. 178–187) hat **keine Attribut-Schleife**; Bild zeigt `loop Solange weitere Attribute zu setzen sind`.
   - Pseudocode hat **keinen `vorhanden / nicht vorhanden`-Pfad** für Referenzen; Bild hat `3: Referenzobjekt suchen` + `3.1 Treffermenge` + `alt vorhanden / nicht vorhanden`.
   - Pseudocode Z. 6–7 springt direkt zur Rekursion.

## Unterprogramm AuftragLoeschen
**SD-Lebenslinien:** Leiter, UI, DB, Arbeitsauftrag, Unterauftrag, Termin (kein `:Buchung`).
**SD-Nachrichten:** 1, 1.1, 2, 2.1, 2.2, 2.3, ref Status setzen Buchung „Storniert", 3 (löschen Unterauftrag), 4 (löschen Termin), ref Status setzen Arbeitsauftrag „Gelöscht", 5, 5.1, 6 (löschen Auftrag), 7.
**Pseudocode (Listing 4.1.5) konsistent**, aber:
- **Status-Schreibweise:** Pseudocode `'Geloescht'` (Z. 256, 19, 234), PUML/PNG `"Gelöscht"` (Z. 89), Text mal so, mal so. Vereinheitlichen.
- `:Buchung`-Lebenslinie nicht deklariert, ref ohne sichtbares Ziel.

## Unterprogramm Duplikatspruefung
**SD-Lebenslinien:** UI, DB. **Text Z. 88** beschreibt das korrekt.
**Pseudocode (Listing 4.1.3) konsistent.**
- Schwäche: PUML Z. 50/57 `UI --> UI` als Rückgabe-Self-Call ist UML-untypisch; sollte als Rückgabe an den Aufrufer (oder über `return`-Notation) modelliert werden.

## Unterprogramm ObjektAnlegen
Siehe Kritisch-Punkt 3 oben — Pseudocode fehlt Attribut-Schleife und Vorhanden-Pfad.

## Unterprogramm StatusSetzen
**SD-Nachrichten:** 1 (Status setzen), 1.1 (Self-Call Statusattribut aktualisieren), 1.2, 2 (persistieren), 2.1, alt-else 1.3 (Fehler).
**Pseudocode (Listing 4.1.4) Z. 220–226:** kein Persistieren, kein Else-Zweig.
- **Inkonsistenz:** Bild persistiert, Pseudocode nicht. Argument Z. 174 (Pseudocode bewusst ohne DB-Zugriffe) deckt das ab, gilt aber dann auch für STATUS-SETZEN — sollte in der Reflexion einmal global benannt werden statt verstreut.
- PUML-Kommentar Z. 31–34 listet zusätzlich Gerät-Status „Verfügbar/Gebucht", die im Bild nicht modelliert sind und im Text Z. 94 nicht erwähnt werden.

## Pseudocode-Form
- Deutsch + Großbuchstaben-Schlüsselwörter — konform zu CLAUDE.md.
- Nummerierung (` 1`–`59` etc.) konsistent über alle 5 Listings.
- Schwäche: Mischung aus `SOLANGE … ENDE SOLANGE` (Listing 4.1.1 Z. 12–15) und `WIEDERHOLE … BIS` (Z. 24–30, 34–44) im **selben** Listing wirkt unentschieden.
- Z. 19, 32, 36, 48: Strichpunkt nach Bedingung vor `DANN` ist ungewöhnlich (`WENN … ; DANN`).
- Status-Werte ohne Umlaut im Pseudocode, mit Umlaut im Bild — vereinheitlichen.

## Reflexion am Ende vorhanden?
Ja, Z. 70–72 „Reflexion und ehrliche Einordnung". Defizite:
- Keine **Vor-/Nachteile-Diskussion** des gewählten Ansatzes (CLAUDE.md SD/AD-Sektion fordert das explizit).
- Verzicht auf DB-Zugriffe im Pseudocode steht Z. 174, gehört aber gebündelt in die Reflexion.
- Diskrepanz Hauptdiagramm vs. Phase-2-Auslagerung wird nicht angesprochen.

## Kritisch
- Caption + Z. 36 + Z. 64–68: Phase 2 im Bild fehlt; Text+Caption müssen entweder gelöscht/umformuliert werden ODER PUML erweitert.
- Listing 4.1.2 vs. ObjektAnlegen-SD: Pseudocode lässt Attribut-Schleife und Vorhanden-Pfad weg.
- `:Buchung`-Lebenslinie fehlt in beiden Diagrammen, obwohl Text+ref-Block sie referenzieren.

## Wichtig
- Status-Schreibweise Geloescht/Gelöscht inkonsistent zwischen Pseudocode (Z. 19/234/256), Diagramm (PUML Z. 89) und Text (Z. 100).
- Listing 4.1.4 STATUS-SETZEN: Persistenz und Else-Zweig fehlen im Pseudocode, im Bild vorhanden.
- Reflexion um Vor-/Nachteile-Diskussion ergänzen.

## Stil / Fluff
- Z. 5: 6 Vereinfachungs-Bulletpoints — Punkte 2 und 3 (Datenbankfehler/Nebenläufigkeit) kürzbar.
- Z. 38–58 wiederholt Material aus Z. 13–21; „Initiale Interaktion" und „Adressen als Einsatzort" können verschmolzen werden.
- Verweise auf Beispielarbeiten (Z. 25, 76, 104, 174, 195) — fünfmal; einmal pro Konvention reicht.

## Tippfehler / Grammatik
- Z. 17 „Auftragsbezeichnung" vs. PUML Z. 85 „Bezeichnung" — vereinheitlichen.
- Z. 44 „greift die Aussage des **Use-Case-Diagramms** auf, wonach der Einsatzort … detaillierter sein kann" — Use-Case-Diagramme treffen typischerweise keine Aussagen über Adressdetailgrade; eher Klassendiagramm/Lastenheft.
- Z. 58 sehr verschachtelter Satz; teilen.
- Z. 100 „LF 50: Buchungsverwaltung … LF 40 … LD 10" — korrekt, ok.

## Anmerkungen
- Leere Datenbasis konsistent berücksichtigt (Z. 15 + Schritte 1.1–1.2).
- Großgeräte/Zubehör/Lager nicht in diesem Szenario — gehört in Kap. 4.2 (Maschinen-Buchung); ok.
- `@chapter-Zielgruppen-Rollen` (Z. 72): nicht in diesem Kapitel verifiziert; sollte in Kap. 1/2/3 existieren.
- Querverweise (`@fig:sd_auftrag`, `@fig:sd_objekt_anlegen`, `@fig:sd_duplikat`, `@fig:sd_status`, `@fig:sd_auftrag_loeschen`, `@fig-analyse-klassendiagramm`) sauber verwendet.

---

**Zahlen:** 3 Krit, 3 Wichtig, 3 Stil, 4 Tippfehler/Grammatik.
