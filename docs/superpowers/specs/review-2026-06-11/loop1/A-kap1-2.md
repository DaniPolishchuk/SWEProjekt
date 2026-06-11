# Loop 1 — Subagent A: Kap 1 + Kap 2

## Globale Beobachtungen
- **Anzahl QaA in Kap 1: ~131** — über Mindestziel (>100), unter 1.0-Beispielstandard (170+).
- **Anzahl QaA in Kap 2: 0** — Kapitel 2 enthält keine eigenen Fragen, sondern dupliziert nur das Original-Lastenheft.
- **Globale Nummerierung**: Ja, `qa-counter` ist global — entspricht der Konvention.
- **Attributtabellen vorhanden**: Ja (Person, Mitarbeiter, Adresse, Rolle, Projekt, Arbeitsauftrag, Unterauftrag, Unterauftragnehmer, Geräte-Typ, Gerät, Ausrüstung, Buchung, Lager, Termin, Bild, Anwesenheitszeit, Rechnung, Gruppe). Sehr gut abgedeckt.
- **Doppelung Kap 1 / Kap 2**: Kap 2 (104 Z.) ist quasi vollständig redundant zu Kap 1. **Wichtigste Redundanz im Repo.**

## Kritisch (sachlich falsch / klar widersprüchlich)

- **[1_Aufgabenstellung.typ:163-164] vs. [Z.120]** — Widerspruch in Nutzerzahlen: Z.120 sagt "15 Desktop-Rechner", Z.164 "15 Personen + max 20 in Spitzenzeiten", Z.181 "max 5 zeitglichen Zugriffen" von außen. → 15 + 5 = 20 ist konsistent, sollte aber explizit als 15 intern + 5 extern erläutert werden.

- **[1_Aufgabenstellung.typ:265-292] vs. [Z.342]** — **Anzahl der Rollen widersprüchlich**: Tabelle Z.265-292 listet **fünf** Rollen (Administrator, Verwaltungsmitarbeiter, Bau-/Projektleiter, Vorarbeiter, Mitarbeiter). Z.342 schreibt aber "festes Rollensystem mit **vier** vordefinierten Rollen: Verwaltungsmitarbeiter, Bau-/Projektleiter, Vorarbeiter und Administrator" — Rolle "Mitarbeiter" fehlt.

- **[1_Aufgabenstellung.typ:274] vs. [Z.351]** — Verwaltungsmitarbeiter-Rechte verwirrend: Tabelle Z.274 sagt "Vollzugriff auf Geräteverwaltung", Z.347-348 sagt "Verwaltungsdaten umfassen ... Gerätedaten ...", Z.351 sagt "Ausnahme ist die Geräteverwaltung". → Formulierung unklar; "Ausnahme" entfernen oder präzisieren.

- **[1_Aufgabenstellung.typ:281]** — Zugriffsrecht inkonsistent: Tabelle sagt Bau-/Projektleiter haben "Bearbeitungsrechte auf Geräte", Z.351 stellt klar dass Schreibzugriff beim Verwaltungsmitarbeiter liegt. Klärung: Buchung ja, Stammdaten nein.

- **[1_Aufgabenstellung.typ:301-336] vs. [Z.512-540]** — `Person`-Klasse hat Attribut `Adresse`, aber Lastenheft (LF20) und Original sprechen nur von "Mitarbeiter". Erweiterung kenntlich machen.

- **[1_Aufgabenstellung.typ:391-407]** — Im Arbeitsauftrag-Schema fehlen die im Lastenheft (LF30) genannten "alle erstellten Angebote, Rechnungen und Mahnungen". Rechnung-Entität existiert, ist aber nicht im Arbeitsauftrag verlinkt. "Angebote" und "Mahnungen" tauchen weder als Entität noch als Referenz auf.

- **[1_Aufgabenstellung.typ:251] vs. [Z.391-404]** — Auflistung Z.251 nennt Datums-Attribute "Start-/End-/Zwischentermine", Tabelle Z.391-404 modelliert sie als `Referenz` auf Termin-Objekte. Termin-Tabelle Z.600-604 hat **gar keine eigenen Datums-Attribute** — funktional sinnlos.

- **[1_Aufgabenstellung.typ:342]** — Aussage "vier vordefinierten Rollen" kollidiert mit Tabelle (5 Rollen).

- **[2_Analyse_des_Lastenhefts.typ:25-26]** — **Doppelte Überschrift**:
  ```
  === Produktfunktionen
  == Produktfunktionen
  ```
  Erst Unterüberschrift, dann Hauptüberschrift hintereinander — Strukturfehler.

- **[2_Analyse_des_Lastenhefts.typ:59]** — `=== Qualitätsanforderung` ist ebenenfalsch.

## Wichtig (problematisch, sollte angepasst werden)

- **[1_Aufgabenstellung.typ Gesamt]** — Kapitel 1 hat den Titel `= Analyse des Lastenhefts`, enthält aber das **gesamte Lastenheft (Original-Includes + LF-Tabelle + Vereinfachungen)** noch einmal. CLAUDE.md trennt zwischen Original und Edit. Hier vermischt.

- **[1_Aufgabenstellung.typ:138-139]** — "Welche Eigenschaften müssen Fahrzeuge im System haben? — Fahrzeuge werden im System als 'Baumaschinen' bezeichnet." Frage und Antwort passen nicht zueinander.

- **[1_Aufgabenstellung.typ:142-148]** — Rechnung-Entität wird **vor** dem Lastenheft-Kontext (Z.152) definiert, also in der Einleitungs-Sektion. Logisch wäre sie unter LF30. Bezug zu Mahnung/Angebot/Kostenvoranschlag fehlt.

- **[1_Aufgabenstellung.typ:357]** — Tippfehler: "vergangene und zukünftige Arbeit**s**auträge" → "Arbeitsaufträge".

- **[1_Aufgabenstellung.typ:369]** — Verweis-Fehler: `#referenceQ('q_Rollen-gleichzeitig')` zeigt auf falsche Frage.

- **[1_Aufgabenstellung.typ:408-411]** — TODO-Kommentar im Doku-Output: `//TODO: mit Frage 53 abgleichen`. Solche TODOs vor Abgabe entfernen. (Auch Z.405-406, Z.553, Z.604.)

- **[1_Aufgabenstellung.typ:622]** — "Kategorieattribut.." (zwei Punkte).
- **[1_Aufgabenstellung.typ:771]** — "Maximal große 5 Suchmasken" → "Maximal 5 große Suchmasken".
- **[1_Aufgabenstellung.typ:764]** — "sind sollen verwendet werden" — "sind" zu viel.
- **[1_Aufgabenstellung.typ:1018]** — "gesätzlichen" → "gesetzlichen".
- **[1_Aufgabenstellung.typ:181]** — "5 zeitglichen Zugriffen" → "zeitgleichen".

- **[1_Aufgabenstellung.typ:184]** — VPN-Aussage formal widersprüchlich zu Originallastenheft "ohne Netzverbindung nach Außen". Tablet-Erweiterung als Ausnahme klar markieren.

## Stil / Fluff

- **[2_Analyse_des_Lastenhefts.typ Gesamt]** — Diese gesamte Datei ist eine ältere Voll-Kopie des Lastenhefts ohne QaA. **Kandidat zum Löschen.**

- **[1_Aufgabenstellung.typ:135 / 881 / 943-944]** — DSGVO+10-Jahres-Frist mehrfach wiederholt.

- **[1_Aufgabenstellung.typ:113-114, 371-372, 496-498, 1004-1005]** — "Maximal drei Klicks" viermal nahezu wortgleich wiederholt.

- **[1_Aufgabenstellung.typ:622 / 665]** — Standardkategorien-Aussage doppelt.

- **[1_Aufgabenstellung.typ:204-228]** — Drei aufeinanderfolgende Fragen (Import-Format, Export-Format, Import-Export-Daten) zu zwei zusammenfassbar.

## Tippfehler / Grammatik

- Z.181: "zeitglichen" → "zeitgleichen"
- Z.356: "Arbeitsauträge" → "Arbeitsaufträge"
- Z.432/119: "Desktoprechnern" → "Desktoprechner" (Nominativ).
- Z.622: "Kategorieattribut.." (zwei Punkte)
- Z.764: "sind sollen" (eines streichen)
- Z.771: "Maximal große 5" → "Maximal 5 große"
- Z.891: "Überschreibrechte" — Mischung Schreib/Überschreibrechte
- Z.1018: "gesätzlichen" → "gesetzlichen"
- Z.710: "gewinnt" — akademischer: "wird als gültig betrachtet"
- Z.469: "z.B." mit/ohne Leerzeichen uneinheitlich

## Anmerkungen

- **131 QaA** — über Mindestziel, unter 1.0-Beispielstandard (170+). Erweiterung empfohlen für LF20 (Gruppen-Hierarchie), LF50 (Wartung), LF60 (Suchmasken), Qualitätsdimensionen.
- `labelName`-Werte mit Sonderzeichen können bei Verweisen Probleme machen (z.B. "plattformunabhängige Lösung").
- Originallastenheft-Includes 1:1 — keine Verfälschung.
- **Fehlt komplett**: Entität für *Angebot* und *Mahnung* (LF30 nennt sie explizit). *Kostenvoranschlag* nur als Zahl im Arbeitsauftrag, nicht als eigenes Objekt.
- **Strukturelle Empfehlung**: Datei `2_Analyse_des_Lastenhefts.typ` löschen oder als Anhang umfunktionieren.

---

**Zahlen:** 10 kritisch, ~12 wichtig, 5 stil, ~10 tippfehler.
