# Loop 2 — Subagent I: GUI-Mockups ↔ Use-Case ↔ Klassendiagramm

## Mockup-Felder-zu-Klassen-Attribute (Stichproben)

| Mockup | Sichtbares Feld | Attribut im KlD? | Status |
|---|---|---|---|
| Dashboard | "Aktive Projekte"/"Anwesende heute" | Projekt.status, Anwesenheitszeit | OK |
| Dashboard | "Fortschritt %" Balken | **FEHLT** als Attribut, Text sagt "ableitbar aus Unterauftrag.status" — keine def. Werteliste | **LÜCKE** |
| AuftragsÜbersicht | Status "Planung"/"In Arbeit"/"Pausiert"/... | Arbeitsauftrag.status (String), **keine Enumeration** | **LÜCKE Statusenum** |
| AuftragsÜbersicht | **Kunde / Firmenname** | **FEHLT im KlD**: kein Kunde-Attribut bei Arbeitsauftrag, keine Kunde-Klasse | **KRITISCH** |
| AuftragDetail | Statuspille "IN BEARBEITUNG" | UC verwendet "In Arbeit", Mockup-Übersicht "In Arbeit", Detail "In Bearbeitung" | **INKONSISTENT (3 Bezeichnungen)** |
| AuftragDetail | **KV €145.000 / Angefallen €92.400 / Prognose €142.100** | **FEHLT**: Arbeitsauftrag hat KEIN Attribut für Kostenvoranschlag, angefallene Kosten, Prognose | **KRITISCH** |
| AuftragDetail | "Letzte Rechnungen RE-2023-104..." | Rechnung.rechnungsnummer | OK |
| AuftragDetail | "Zwischentermin: 15. Nov 2023" | **FEHLT** im PUML | **LÜCKE** |
| AuftragDetail | "Bauplan: BP-Fundamente-C.pdf" | Dokument.dateipfad + Arbeitsauftrag→Dokument | OK |
| Geräte&Maschinen | Statusliste "DEFEKT/Wartung/gebucht" | Geraet.status (String), **keine Enum** | **LÜCKE Statusenum** |
| Geräte&Maschinen | Reiter "Historie" | **FEHLT** im KlD | **LÜCKE** |
| Geräte&Maschinen | Zubehör (Tieflöffel, Hydraulikhammer) | Baugruppe-Muster behauptet `Geraet*--Ausruestung`, **PUML hat `Lager*--Ausruestung`** | **KRITISCH** |
| Buchung | Buchungsnummer "B-2026-XXXX" | Buchung.buchungsnummer | OK |
| Buchung | "Lager mit Entfernung in km" | **FEHLT**: keine Distanz-Berechnung | OK – ableitbar |
| Terminplaner | Termintypen Haupt/Zwischen/intern/Urlaub | Termin.typ (String), **keine Enum**; Urlaub auch in Anwesenheitszeit.typ → **Doppeldeutigkeit** | **LÜCKE** |
| Terminplaner | "Verknüpfte Buchungen: G-0061" | Buchung.buchungsnummer + Termin↔Buchung-Assoz. | **KRITISCH: Termin↔Buchung fehlt im PUML** |
| Mitarbeiter | "Rolle innerhalb dieser Gruppe" (z.B. Gruppenleiter) | **FEHLT**: Gruppe-Mitarbeiter ist n:m, keine Assoziationsklasse | **LÜCKE** |

## Mockup-Aktionen-zu-Use-Cases

| Mockup | Button/Aktion | Use Case? | Status |
|---|---|---|---|
| Dashboard | "Bericht exportieren" | UC "Daten exportieren" | OK |
| AuftragsÜbersicht | "Importieren"/"Exportieren CSV" | UC "Daten importieren/exportieren" | OK |
| AuftragsÜbersicht | Reiter "Archiv" | UC "Daten archivieren" | OK |
| AuftragDetail | **"+ Neue Rechnung"** | **FEHLT**: kein UC "Rechnung anlegen"; UC "Finanzdaten lesen" ist nur lesend | **LÜCKE** |
| AuftragErstellen | **"Vorlage speichern"** | **FEHLT** im UC-Diagramm | **LÜCKE** |
| AuftragErstellen | Duplikatswarnung-Banner | UC "Auf Duplikate prüfen" — fehlt für Auftrag-Anlage als <<include>> | **LÜCKE** |
| Geräte&Maschinen | "Verfügbarkeit prüfen" | UC vorhanden — aber UC ohne Beschreibungstext (Loop1-B) | OK mit Lücke |
| Geräte&Maschinen | Reiter "Wartung"/"Historie" | **FEHLT** als eigene UCs | **LÜCKE** |
| Buchung | "Katalog erweitern" (LF 70) | **FEHLT** als UC | **LÜCKE** |
| Terminplaner | "Termin öffnen"/"Bearbeiten"/"Löschen" | **kein eigener UC "Termine verwalten"** | **LÜCKE: Termin-CRUD nicht eigener UC** |
| Mitarbeiter | "Profil bearbeiten" / "Gruppe zuordnen" | UC "Personal verwalten" | OK |

## Mockup-Rollensicht ↔ Use-Case-Akteure

- Mockup-Text Z.27: "Mockups bilden überwiegend die Sicht eines **Bauleiters** ab."
- **Widerspruch**: Mitarbeiterverwaltung ist laut UC Z.103 nur für **Verwaltungsmitarbeiter**. Bauleiter darf "Personal verwalten" nicht.
- **Widerspruch**: Geräte-Mockup zeigt "Gerät anlegen" Button — laut UC nur für **Verwaltungsmitarbeiter**. Mockup zeigt Button trotzdem.

## Statuswerte-Konsistenz

**Auftrag-Status:**
- Designphilosophie (Z.24): "Verfügbar/Abgeschlossen", "In Arbeit/In Wartung", "Defekt/In Verzug", "Pausiert/Geplant/Storniert" — **mischt Auftrags- und Geräte-Status**
- AuftragsÜbersicht Text (Z.66): "Geplant/In Arbeit/Pausiert/Verzug/Abgeschlossen"
- AuftragDetail Mockup-Bild: "IN BEARBEITUNG"
- KlD: Arbeitsauftrag.status (String, ohne Aufzählung)
- **Inkonsistenz**: "In Arbeit" (Übersicht) vs. "In Bearbeitung" (Detail) vs. KlD-undefiniert.

**Geräte-Status:**
- Designphilosophie: "Verfügbar/In Wartung/Defekt"
- Geräte-Mockup: "verfügbar/gebucht/in Wartung/defekt"
- UC Z.219: "verfügbar/in Wartung/defekt"
- KlD: ohne Aufzählung
- **Inkonsistenz**: "gebucht" als Status in Mockup, nicht in UC-Liste.

**Termin-Typ:**
- Dashboard Z.44: "Haupttermin, Zwischentermin, interner Termin, Telefontermin"
- Terminplaner Z.170: "Haupt/Zwischen/intern/Urlaub"
- KlD: Termin.typ (String); Anwesenheitszeit.typ (String) — **Urlaub kollidiert mit Anwesenheit**

## Kritisch

1. **Kunde / Auftraggeber fehlt im Klassendiagramm.** Mockups zeigen durchgängig "Kunde mit Firmenname". Im PUML keine Kunde-Klasse, kein Kunde-Attribut.
2. **Finanzdaten am Auftrag fehlen als Attribute.** Mockup zeigt KV/Angefallen/Prognose. UC sagt „aus Finanzbuchhaltung lesend übernommen" — aber Arbeitsauftrag hat KEIN Attribut `kostenvoranschlag`.
3. **Termin↔Buchung-Verknüpfung fehlt im PUML.** Mockup zeigt "Verknüpfte Buchungen".
4. **Baugruppe-Muster falsch verortet.** Mockup spricht von "Zubehör dem Gerät zugeordnet". PUML hat `Lager *-- Ausruestung`.
5. **Auftrag-Fortschritt** überall sichtbar, im KlD nicht modelliert.
6. **"Vorlage speichern" hat keinen UC.** Auftragsvorlagen weder in UC noch KlD.
7. **"Neue Rechnung" hat keinen UC.** UC nur lesend.
8. **Termin-CRUD ohne eigenen UC.** Buttons "Löschen/Bearbeiten/Termin öffnen" — kein UC "Termine verwalten".
9. **Mockup-Rollensicht-Widerspruch:** Bauleiter-Sicht behauptet, aber Mitarbeiter-Mockup nur für Verwaltungsmitarbeiter.

## Wichtig

10. **Statusfarben/-werte als Aufzählung im KlD fehlen.** Keine der vier Status-Klassen hat im PUML eine definierte Werteliste.
11. **Statusbezeichnung "In Bearbeitung" vs. "In Arbeit"** zwischen AuftragDetail und AuftragsÜbersicht widerspruchlich.
12. **Reiter "Historie" im Geräte-Mockup** hat keine Modell-Entsprechung.
13. **Reiter "Wartung" im Geräte-Mockup** hat keinen eigenen UC.
14. **"Katalog erweitern" (LF 70)** als Mockup-Aktion sichtbar, aber im UC-Diagramm nicht modelliert.
15. **Gruppe-Mitarbeiter-Rolle innerhalb Gruppe**: Mockup zeigt "Rolle innerhalb dieser Gruppe", KlD hat keine Assoziationsklasse.
16. **"Bilder & Dokumente"-Sidebar**: Dokumente als Klasse modelliert, aber kein UC "Dokumente verwalten".
17. **LF 90 "Anwesenheitszeiten" als Sidebar-Punkt**, nicht skizziert. Lücke zwischen Mockup-Navigation und UC-Modell.

## Stil / Fluff
- Mockup-Text Z.27 verwendet schwammige Formulierung "im produktiven Einsatz nur für Administrator sichtbar" — wiederholt in Z.50, Z.62, ohne dass Berechtigungsklasse konkret modelliert ist.
- "Auftragsnummer #205033" (Hash-Präfix) — KlD nennt nur `auftragsnummer` ohne Format.
- "Bauleiter" als Position im AuftragErstellen-Mockup als eigenes Dropdown, im KlD nur String-Wert.

## Anmerkungen

- **Empfehlung**: Statusenums für Arbeitsauftrag.status, Geraet.status, Buchung.status, Termin.typ, Anwesenheitszeit.typ — beseitigt mehrere Mockup-Inkonsistenzen.
- **Empfehlung**: Auftrag um Attribute `kostenvoranschlag`, `angefalleneKosten` (oder Assoziation zu Finanzbuchhaltung) ergänzen.
- **Empfehlung**: Termin↔Buchung-Assoziation ins PUML aufnehmen.
- **Empfehlung**: Kunde-Klasse oder `kunde`-Attribut bei Arbeitsauftrag/Projekt hinzufügen.
- **Empfehlung**: Fortschritt als abgeleitetes Attribut `/fortschritt: Prozent`.
- **Empfehlung**: UC "Termine verwalten" als eigenständigen Anwendungsfall ergänzen.
- **Empfehlung**: Mockup-Text Z.27 präzisieren: "Sicht eines **Verwaltungsmitarbeiters mit Bauleiter-Aufgaben**" oder Mockup-Set rollentrennen.

---

**Zahlen:** 9 kritisch / 8 wichtig / 3 stil / 7 anmerkungen.
**Übergreifender Befund:** Drei Hauptlücken zwischen Mockup und Modell — fehlende Statusenums, fehlende Finanzattribute, fehlende Termin↔Buchung. Plus widersprüchliche Rollenzuordnung der Mockup-Sicht.
