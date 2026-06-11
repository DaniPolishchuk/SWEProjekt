# Loop 1 — Subagent D: Kap 3.3 GUI-Mockups

## Pro Mockup: Bild ↔ Text-Differenz

### Dashboard.png
- Im Bild sichtbar:
  - Sidebar: Logo "BauOS / Construction OS"; Hauptbereich: Dashboard (aktiv), Aufträge, Geräte & Maschinen, Buchungen, Terminplaner, Lager, Mitarbeiter, Suche; unterer Block: Anwesenheitszeiten, Bilder & Dokumente, Einstellungen.
  - Topbar: Brotkrumen "Dashboard", Glocke, Sprachsymbol, Profil "Max Mustermann".
  - Begrüßung "Guten Morgen, Max", Datum "Heute, Donnerstag, 21. Mai 2026 · 4 aktive Projekte · 12 laufende Aufträge".
  - Vier Kennzahlenkacheln: "Aktive Projekte 4", "Laufende Aufträge" (mit Verzugshinweis), "Gebuchte Geräte 27 von 64", "Anwesende heute 183/198".
  - Buttons rechts oben: "Bericht exportieren", "Neuer Auftrag".
  - Linke Karte mit Reitern Termine / Aufträge / Buchungen, vertikale Stundenleiste mit Terminblöcken (Baubesprechung, Anlieferung Bagger CAT 320, Abnahme Tiefbau B36, Telefontermin, Wochenplanung).
  - Rechts oben Karte "Neu eingegangene Aufträge (3)" mit Eintrag "Meier, Dachsanierung #205001" und "+2 zeigen".
  - Karte "Verfügbarkeitswarnungen" mit drei Einträgen (Liebherr LTM 1090, Bagger CAT 320, Schalung-Set).
  - Untere Tabelle "Laufende Aufträge" mit Filterchips "Alle / In Arbeit / Verzug" und Spalten Auftragsnr., Bezeichnung, Status, Fortschritt; Auftrag #205060 Tiefbau Heidelberg "In Arbeit", #205061 Fassadenrenovierung "Pausiert" sichtbar.
- Diskrepanzen mit Text:
  - Text Z.48: "Filterchips ('Alle', 'Hochbau', 'Tiefbau', 'Verzug')" — im Bild stehen die Chips "Alle / In Arbeit / Verzug" (kein "Hochbau"/"Tiefbau"). Faktischer Bildwiderspruch.
  - Text Z.42 nennt eine "Anzahl aktiver Projekte" als Kennzahl; im Bild korrekt sichtbar — passt.
  - Text Z.44 spricht von vier Termintypen "Haupttermin, Zwischentermin, interner Termin sowie Telefontermine mit externen Beteiligten". Im Bild erkennt man verschiedene Farben, aber keine Legende; im Terminplaner-Abschnitt (Z.170) wird die Legende abweichend definiert: "Haupttermine (grün), Zwischentermine (orange), interne Termine (gelb) sowie Urlaubseinträge (lila mit Streifenmuster)". **Inkonsistenz Dashboard ↔ Terminplaner.**
  - Im Bild: Terminblock "Telefontermin Unterauftragnehmer" — gut, deckt Telefontermine ab.

### AufträgeÜbersicht.png
- Im Bild sichtbar:
  - Sidebar wie oben, "Aufträge" aktiv.
  - Topbar: Brotkrumen "Aufträge", Glocke, Sprache, Profil.
  - Titel "Aufträge", Untertitel "12 laufend · 47 abgeschlossen · 3 in Verzug".
  - Buttons "Importieren", "Exportieren CSV", "Neuen Auftrag anlegen" (orange).
  - Reiter "Kundenaufträge" (aktiv, orangefarbener Akzentbalken) / "Archiv".
  - Filterzeile: Suchfeld, "Status"-Dropdown, "Datum"-Dropdown, "Sortieren"-Schalter.
  - Fünf Auftragskarten mit linkem Akzentstreifen, Auftragsnr. (#205060–#205064), Bezeichnung, Kunde, Datumsbereich, Statuspille, Fortschrittsbalken mit %, Avatare/+n.
  - Statuswerte im Bild: "In Arbeit" (blau), "Pausiert" (gelb/orange), "Planung" (grün), "Verzug" (rot), "In Arbeit" (blau).
  - Pagination "Zeige 1-5 von 12 laufenden Aufträgen", Seiten 1/2/3.
- Diskrepanzen mit Text:
  - Text Z.66: Statuswerte "'Geplant' (blau), 'In Arbeit' (gelb), 'Pausiert' (orange), 'Verzug' (rot) und 'Abgeschlossen' (grün)". Im Bild ist der Status "Planung" (nicht "Geplant"); "In Arbeit"-Pille ist BLAU (nicht gelb); "Pausiert" ist GELB/bernsteinfarben (nicht orange); "Planung" ist GRÜN (nicht blau). **Mehrere konkrete Bild–Text-Widersprüche bei Statusfarben/-bezeichnungen.**
  - Auch widersprüchlich zur Designphilosophie Z.24: dort wird "In Arbeit" als gelb und "Abgeschlossen" als grün definiert; das Bild zeigt jedoch "Planung" als grün und "In Arbeit" als blau.
  - Text Z.66 erwähnt "Aktivitätshistorie"; im Bild nicht sichtbar — Formulierung "in der ebenfalls dargestellten Aktivitätshistorie protokolliert" suggeriert, dass sie hier dargestellt sei. Missverständlich.

### AufträgeÜbersichtJavaSwing.png
- Im Bild: Dieselbe Auftragsübersicht, jedoch mit Annotationen der Java-Swing-Komponententypen (JLabel, JPanel, JTabbedPane, JButton, JTextField, JToggleButton, JProgressBar, JFrame).
- **Diskrepanz**: Diese Datei wird im Kapitel 3.3 nicht erwähnt/eingebunden. Falls sie zur GUI-Modellierung Kap. 5 (MVC) gehört, gehört sie nicht in dieses Analysekapitel; falls sie hierher gehört, fehlt jeder Hinweis. **(Anmerkung Hauptagent: das Bild ist tatsächlich in Kap. 5 eingebunden, siehe Subagent F. Kein Problem.)**

### AuftragDetaileinsicht.png
- Im Bild sichtbar:
  - Sidebar (Aufträge aktiv), Topbar mit Brotkrumen "Aufträge / #205033".
  - Titel "Fundamentarbeiten Baufeld C", Auftragsnummer "#205033", Statuspille "IN BEARBEITUNG" (grün), Adresse "Uhlandstraße 5, 80336 München, DE", Button "Bearbeiten".
  - Linke Spalte: Karte "Status & Fortschritt" mit Personal/Maschinen/Gesamtfortschritt; Karte "Finanzen & Rechnungen": KV €145.000, Angefallen €92.400, Prognose €142.100, Letzte Rechnungen RE-2023-104 / RE-2023-109; Karte "Bemerkungen"; Karte "Fotodokumentation".
  - Rechte Spalte: Karte "Informationen": Projekt "Neubau Schulzentrum West", Startdatum "12. Okt 2023", Zwischentermin "15. Nov 2023", Geplantes Ende "30. Nov 2023", Bauplan "BP-Fundamente-C.pdf"; Karte "Beteiligte Personen".
- Diskrepanzen mit Text:
  - Text Z.82: Statuspille "In Bearbeitung" — Bild zeigt "IN BEARBEITUNG". Passt.
  - Text Z.94: Beteiligte Personen mit Position "(Projektleiter, Polier oder einfaches Mitglied)". Im Bild ist Sarah Bauer ohne erkennbare Position. Klärung empfohlen.
  - **Datumsfelder im Bild zeigen 2023** ("12. Okt 2023", "15. Nov 2023", "30. Nov 2023"), während Dashboard und andere Mockups in 2026 spielen. Inkonsistente Demodaten — Detailansicht wirkt wie ein längst abgeschlossener Auftrag, obwohl Status "In Bearbeitung" ist.

### AuftragErstellen.png
- Im Bild sichtbar:
  - Modaler Dialog "Neuen Auftrag anlegen", "Pflichtfelder sind mit * markiert".
  - Linke Spalte: Auftragsbezeichnung "Fußbodenheizung verleg…", orangefarbener Duplikatswarnungs-Banner; Projekt zuordnen + "+ Neues Projekt"; Bauplan; Starttermin/Endtermin/Zwischentermin.
  - Rechte Spalte: Einsatzort (Straße/Hausnummer/PLZ/Ort); Beteiligte Personen Chips; Bauleiter Dropdown; Kostenvoranschlag mit Hinweis "WIRD AUTOMATISCH AUS FINANZBUCHHALTUNG ÜBERNOMMEN"; Bemerkung; "Bilder beim Anlegen anhängen".
  - Footer: "Vorlage speichern…", "Abbrechen", "Auftrag anlegen".
- Diskrepanzen mit Text:
  - Text Z.106: "Pflichtfelder sind durch einen orangefarbenen Stern hinter der Beschriftung gekennzeichnet" — die Sterne hinter den Feldnamen sind orange. Passt.
  - Text Z.116: "Vorlage speichern (zum Sichern wiederkehrender Auftragsmuster)" — im Bild "Vorlage speichern…" als sekundär. Passt.

### Geräte&Maschinen.png
- Im Bild sichtbar:
  - Sidebar (Geräte & Maschinen aktiv).
  - Titel "Geräte & Maschinen", Untertitel "64 Geräte · 27 gebucht · 4 in Wartung · 2 defekt".
  - Buttons "Verfügbarkeit prüfen", "Gerät anlegen".
  - Linke Master-Liste: Reiter "Alle / Baumaschinen / Bauwerkzeuge"; Suchfeld; Filterchips "Status / Kategorie / Lager".
  - Listeneinträge: Bagger CAT 320 (defekt, ausgewählt), Radlader Liebherr L506, Rüttelplatte Wacker Neuson.
  - Rechte Detailspalte: großes Foto, "DEFEKT"-Banner, Geräte-Typ, SN; drei Kennzahlenkacheln; Karteireiter "Übersicht / Buchungen / Wartung / Ausrüstung / Standort & Lager / Historie"; Inhaltsbereich Stammdaten + Standort & Lager + Zubehör.
- Diskrepanzen mit Text:
  - Text Z.130: "jeder Eintrag zeigt ein kleines Vorschaubild des Geräts" — im Bild zeigen die Listeneinträge generische Schraubenschlüssel-Icons statt Vorschaubildern für Radlader und Rüttelplatte; nur der ausgewählte Bagger hat ein kleines Vorschaubild. **Aussage trifft nicht durchgängig zu.**
  - Text Z.138 nennt im Reiter "Übersicht" zusätzlich "Standort & Lager" als Bereich — gleichzeitig ist "Standort & Lager" auch ein eigener Karteireiter. **Doppelte Verortung: redundant/missverständlich.**

### Buchungen.png
- Im Bild sichtbar:
  - Modaler Dialog "Gerät buchen / Schritt 2 von 3 · Verfügbarkeit prüfen".
  - Schrittanzeige: 1 Auftrag wählen (✓), 2 Verfügbarkeit (aktiv), 3 Bestätigen.
  - Eingabefelder: Auftrag #205033, Gerätekategorie Bagger + "Katalog erweitern", Zeitraum, Einsatzort, Häkchen "Standort verwenden".
  - "5 Geräte gefunden — sortiert nach Entfernung & Verfügbarkeit".
  - Drei Ergebnis-Karten: Mini-Bagger Kubota (verfügbar/grün), Mobilbagger Volvo (teilweise gebucht/gelb), Bagger CAT 320 (defekt/rot).
  - Hinweiszeile: "Buchung erstellt automatisch eine Buchungsnummer (B-2026-XXXX) und sperrt das Gerät im Terminplaner."
  - Footer: "Abbrechen", "Zurück", "Weiter zur Bestätigung".
- Diskrepanzen mit Text:
  - Text Z.156: Buchungsnummer "B-2026-XXXX" — passt.
  - Text Z.154: "teilweise verfügbare Geräte zeigen eine bernsteinfarbene Pille mit detaillierter Aufschlüsselung der freien und belegten Tage" — Bild zeigt für Volvo "23.–25.05. ganztags frei / 24.–25.05. belegt", was logisch widersprüchlich ist (drei Tage komplett frei, aber zwei davon belegt). **Inhaltlicher Datenfehler im Mockup.**

### Terminplaner.png
- Im Bild sichtbar:
  - Sidebar (Terminplaner aktiv).
  - Titel "Terminplaner", Untertitel "KW 21 · 18.05. – 24.05.2026".
  - Umschalter "Tag / Woche (aktiv) / Monat", Pfeile "<" ">" zur Navigation. **KEIN sichtbarer "Heute"-Button im Bild.**
  - Filterzeile: "Mitarbeiter / Kategorie / Auftrag / Geräte (?)".
  - Wochenraster Mo 18 — So 24, Stundenachse, Donnerstag (DO 21) hervorgehoben.
  - Termine: Baubesprechung, Urlaub Zimmermann, Anlieferung, Abnahme Tiefbau, Telefontermin, Wochenplanung.
  - Detailpanel rechts: "Abnahme Tiefbau B36", Auftrag #198241, 11:00–12:30, Ort B36, Team, Bemerkungen, "Verknüpfte Buchungen: G-0061 Turmdrehkran (B-2026-0078)".
  - Legende unten: vier Einträge sichtbar.
  - Footer-Buttons: "Löschen / Bearbeiten / Termin öffnen".
- Diskrepanzen mit Text:
  - Text Z.168: "Schaltfläche 'Heute' zum schnellen Sprung auf den aktuellen Tag" — im Bild ist KEINE separate "Heute"-Schaltfläche erkennbar.
  - Text Z.168: "zwei Umschalter für die Anzeige von Geräte-Buchungen und Urlauben" — im Bild ist nur ein Element "Geräte" erkennbar; ein zweiter Toggle für "Urlaube" ist nicht eindeutig.
  - Text Z.170: vier Termintypen "Haupttermine (grün), Zwischentermine (orange), interne Termine (gelb) sowie Urlaubseinträge (lila mit Streifenmuster)". Streifenmuster auf "Urlaub — A. Zimmermann" ist im Bild kaum/nicht erkennbar.

### Mitarbeiter.png
- Im Bild sichtbar:
  - Sidebar (Mitarbeiter aktiv), Topbar Brotkrumen "Mitarbeiter / Kevin Riedel / Gruppen".
  - Profilkopf: KR-Avatar, Kevin Riedel, M-0188, seit 03.06.2019, "Baugruppe Nord", Buttons "Profil bearbeiten" / "Gruppe zuordnen".
  - Stammdaten-Pillen: Adresse, Geburtsdatum, Beschäftigungsort.
  - Kontakt-Pillen: E-Mail, Telefon, Vertragsende.
  - Linke Karte "Gruppenzugehörigkeiten (4)" mit vier Gruppenkarten (Baugruppe Nord, Bauleitung Hochbau, Planung Tiefbau, Sicherheits-Komitee).
  - Rechte Karte "Verfügbare Gruppen — zur Zuordnung" mit Suchfeld, Filter, Liste mit Auswahlkästchen ganz **rechts**.
  - Footer-Buttons: "Abbrechen", "1 Gruppe hinzufügen".
- Diskrepanzen mit Text:
  - Text Z.188: bei "Bauleitung Hochbau" ist die Mitgliederzahl im Bild nicht erkennbar — kleine Inkonsistenz im Mockup.
  - **Z.190: "Auswahlkästchen am Zeilenanfang" — im Bild stehen die Auswahlkästchen jedoch am ZEILENENDE (rechts). Diskrepanz.**

## Login-GUI vorhanden? (DARF NICHT)
- Kein Login-Mockup eingebunden. Z.5 erwähnt explizit, dass eine Anmeldemaske gemäß Vereinfachung 1.4 nicht modelliert wurde. **OK.**

## UI-Philosophie vorab beschrieben?
- Ja, ausführlich in Abschnitt "Designphilosophie und übergreifende Gestaltungsentscheidungen" (Z.9–30) mit Unterabschnitten. **Sehr gut.**

## Lastenheft-Bezüge korrekt?
- LF 10, LF 20, LF 30, LF 40, LF 50, LF 70, LF 80, LF 100 alle korrekt referenziert.
- **Nicht referenziert: LF 60 (Suchmasken), LF 90 (Anwesenheitszeiten).** LF 60 erscheint implizit über die globale Suche. LF 90 erscheint nur in "Nicht skizzierte Ansichten" Z.200.

## Kritisch
- **Z.48 (Dashboard, Filterchips):** Bild zeigt "Alle / In Arbeit / Verzug", Text behauptet "Alle / Hochbau / Tiefbau / Verzug". Faktischer Bild-Text-Widerspruch.
- **Z.66 (Auftragsübersicht, Statusfarben):** Text definiert Statusfarben anders als das Bild zeigt. Mehrfacher Widerspruch.
- **Z.24 vs. Z.66 vs. Z.170:** Statusfarben-Konvention an drei Stellen, untereinander widersprüchlich. Kohärente Statusfarben-Tabelle einführen.
- **Z.190 (Mitarbeiter):** "Auswahlkästchen am Zeilenanfang" — Bild zeigt Auswahlkästchen am Zeilenende.
- **Z.168 (Terminplaner):** "Heute"-Schaltfläche und zweiter Umschalter für "Urlaube" im Bild nicht sichtbar.

## Wichtig
- **Z.44 vs. Z.170:** Inkonsistenz bei Termintypen — Dashboard nennt "Telefontermine mit externen Beteiligten", Terminplaner nennt "Urlaubseinträge".
- **Z.130:** "jeder Eintrag zeigt ein kleines Vorschaubild des Geräts" — im Mockup zeigen nur einzelne Einträge tatsächlich ein Foto.
- **Z.138:** "Standort & Lager" sowohl als Sub-Sektion als auch eigener Karteireiter — redundant/verwirrend.
- **Auftragsdetailansicht Demodaten:** Bild verwendet 2023-Daten, alle anderen Mockups 2026.
- **Buchungen.png Demodaten:** Volvo "23.–25.05. ganztags frei / 24.–25.05. belegt" logisch widersprüchlich.
- LF 60 und LF 90 explizit referenzieren.

## Stil / Fluff
- Z.16 / Z.27 / Z.50 / Z.62 / Z.211: Aussage "Funktionen sind im produktiven Einsatz nur für den Administrator sichtbar" mehrfach wortgleich wiederholt.
- Z.66: "die ebenfalls dargestellten Aktivitätshistorie protokolliert" — die Historie ist im Mockup nicht dargestellt.
- Z.143: "Sie wird modal über sämtliche Hauptansichten geöffnet" — doppeldeutig.
- Z.207–213 "Diskussion und Reflexion" wirkt teilweise generisch.

## Tippfehler / Grammatik
- **Z.168:** "eine dreistufige Umschalter" → "ein dreistufiger Umschalter".
- Z.170: "im Lastenheft Q&A definierten Schema" — interne Referenz unklar.
- Z.172: "(Hr. Richter)" — Stilbruch (Abkürzung), in akademischem Stil eher "Herr Richter".
- Z.211: "Berechtigungsklasse Rolle" — unklar, ob "Berechtigungsklasse" oder Klasse "Rolle".

## Anmerkungen
- Sehr starkes Kapitel, Designphilosophie vor Mockups vorbildlich. Acht Mockups statt zwei — gut.
- Erläuterung der Analysemuster im Mockup-Text (Exemplartyp Z.134, Baugruppe-Muster Z.138) verbindet GUI mit Klassendiagramm — sehr positiv.
- Querverweise zu LF-Punkten und zu anderen Mockups durchgängig.
- **Empfehlung**: zentrale Statusfarben-Tabelle in Designphilosophie einfügen und konsequent für alle Mockups verwenden — beseitigt mehrere Inkonsistenzen mit einem Schlag.
- **Empfehlung**: 2023-Demodaten in der Auftragsdetailansicht auf 2026 ändern.

---

**Zahlen:** 5 kritisch, 6 wichtig, 4 stil, 4 tippfehler.
