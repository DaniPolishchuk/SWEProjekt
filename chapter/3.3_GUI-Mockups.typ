= GUI-Mockups

Im Rahmen der Analysephase wurden zentrale Anwendungsbereiche der Verwaltungssoftware exemplarisch als GUI-Mockups ausgearbeitet. Sie visualisieren das angestrebte Bedienkonzept und veranschaulichen, wie die zuvor beschriebene Funktionalität über eine grafische Oberfläche zugänglich wird. Im Mittelpunkt stehen Übersichtlichkeit, einfache Bedienbarkeit und ein konsistentes, rollenbasiertes Bedienkonzept. Sämtliche Mockups wurden für eine Desktopansicht entworfen, da die Verwaltung primär an stationären Arbeitsplätzen arbeitet und eine Tablet-Variante laut Lastenheft nicht Teil des ersten Auftrags ist.

Insgesamt wurden acht zentrale Ansichten ausgewählt, die unterschiedliche Anwendungsbereiche aus den Funktionsanforderungen LF 10 bis LF 100 abdecken. Sie bauen aufeinander auf und bilden einen typischen Tagesablauf eines Bauleiters ab: vom Dashboard als Einstiegspunkt über die Auftragsübersicht und -detailansicht bis zum Anlegen von Aufträgen, dem Verwalten und Buchen von Geräten, der Terminplanung sowie der Mitarbeiter- und Gruppenverwaltung. Nicht skizziert wurden untergeordnete Wartungsmasken (etwa Bildkatalog, Konfigurationsverwaltung oder einzelne Anlegedialoge), da diese strukturell den vorgestellten Ansichten entsprechen; eine Anmeldemaske entfällt gemäß den Vereinfachungen des Lastenhefts.

== Designphilosophie und übergreifende Gestaltungsentscheidungen

Vor den einzelnen Mockups werden die übergreifenden Gestaltungsprinzipien erläutert, die für alle Ansichten identisch gelten und ein konsistentes Bedienerlebnis gewährleisten.

=== Permanente Seitenleiste
Sämtliche Ansichten verfügen über eine identische, permanent sichtbare Seitenleiste am linken Bildschirmrand. Diese Seitenleiste enthält den Markennamen der Anwendung ("BauOS -- Construction OS") als Logo sowie zwei thematisch gegliederte Bereiche. Im Hauptbereich befinden sich die wesentlichen Einstiegspunkte für die tägliche Arbeit -- Dashboard, Aufträge, Geräte und Maschinen, Buchungen, Terminplaner, Lager, Mitarbeiter sowie eine globale Suche. Im unteren Bereich der Seitenleiste sind ergänzende Funktionen wie die Anwesenheitszeiten, der Bilderkatalog und die Anwendungseinstellungen zusammengefasst.

Der aktive Menüpunkt ist durch einen orangefarbenen Akzentbalken und hellere Hintergrundfarbe hervorgehoben. Die gleichbleibende Anordnung erfüllt die in LF 10 geforderte ergonomische, intuitive Bedienbarkeit.

=== Sticky Topbar mit Kontextinformationen
Am oberen Bildschirmrand wurde eine über alle Ansichten hinweg identisch aufgebaute Topbar implementiert, die beim vertikalen Scrollen am Bildschirm verankert bleibt. Sie enthält von links nach rechts den aktuellen Brotkrumenpfad zur Verortung der gerade geöffneten Ansicht innerhalb der Anwendung, ein Glockensymbol für Systemmeldungen und Hinweise, einen optionalen Sprachumschalter als über das Lastenheft hinausgehende Zusatzfunktion sowie ein Profilelement mit Avatarbild und Klarnamen des angemeldeten Mitarbeiters. Über das Profilelement lässt sich ein Aufklappmenü für persönliche Einstellungen und das Abmelden vom System öffnen.

=== Akzentfarbe und Statusfarben
Als primäre Akzentfarbe wurde ein gesättigtes Bauorange gewählt, das visuell an Sicherheitswesten und Baustellenmarkierungen anknüpft und somit thematisch zur Domäne des Bauunternehmens passt. Diese Akzentfarbe wird sparsam eingesetzt -- ausschließlich für primäre Aktionsschaltflächen, den aktiven Navigationspunkt sowie fokussierte Eingabefelder. Sekundäre Aktionen werden hingegen in einer zurückhaltenden, neutral gehaltenen Variante dargestellt.

Für die Kennzeichnung von Zuständen wurde eine durchgängige Statusfarbpalette eingeführt. Die im Analyse-Klassendiagramm festgelegten Enumerationen `AuftragStatus` (Werte `OFFEN`, `IN_ARBEIT`, `PAUSIERT`, `VERZUG`, `ABGESCHLOSSEN`, `ARCHIVIERT`), `BuchungStatus` (`AKTIV`, `ABGESCHLOSSEN`, `STORNIERT`) und `GerätStatus` (`VERFUEGBAR`, `IN_WARTUNG`, `DEFEKT`, `AUSSER_BETRIEB`) werden in den Mockups über sprechende deutsche Beschriftungen sichtbar gemacht; die technischen Enum-Werte bleiben jedoch die verbindliche Referenz und werden konsistent im Sequenz- und Aktivitätsdiagramm sowie im Entwurfsklassendiagramm verwendet. Die folgende Tabelle fasst die in allen Ansichten konsistent verwendeten Statuswerte mit ihrer jeweiligen Farbe und ihrem Anwendungsbereich zusammen:

#figure(
  table(
    columns: 3,
    align: (left, left, left),
    table.header([*Farbe*], [*Statuswerte (Enum-Wert / GUI-Anzeige)*], [*Anwendungsbereich*]),
    [Blau], [`IN_ARBEIT` / "In Arbeit"], [Auftrag im aktiven Bearbeitungsstand],
    [Grün], [`OFFEN` / "Offen", `ABGESCHLOSSEN` / "Abgeschlossen", `VERFUEGBAR` / "Verfügbar", `AKTIV` / "Aktiv"], [Positive Zustände, offene, abgeschlossene oder verfügbare Vorgänge],
    [Gelb / Bernstein], [`PAUSIERT` / "Pausiert", `IN_WARTUNG` / "In Wartung"], [Übergangs- und Wartezustände],
    [Rot], [`DEFEKT` / "Defekt", `VERZUG` / "Verzug", `AUSSER_BETRIEB` / "Außer Betrieb"], [Kritische oder blockierende Zustände],
    [Grau], [`STORNIERT` / "Storniert", `ARCHIVIERT` / "Archiviert"], [Neutrale, deaktivierte oder aus dem aktiven Bestand entfernte Zustände],
  ),
  caption: [Konsistente Statusfarbpalette über alle Ansichten mit Zuordnung zu den Enum-Werten aus dem Klassendiagramm]
) <statusfarben>

Die Statuspillen sind über alle Ansichten identisch gestaltet und verwenden diese Palette ohne Abweichung.

=== Rollenbasierte Sichtbarkeit
Die in diesem Kapitel gezeigten Mockups bilden eine bewusst gewählte Administrator-Demoansicht ab, da diese Rolle den vollständigen Funktionsumfang der Anwendung sichtbar macht und sich damit am besten zur Illustration sämtlicher Bedienelemente eignet. Konsequent zum Ein-Rollen-Prinzip aus der Lastenheftanalyse -- jeder Benutzer besitzt genau eine Rolle -- werden im produktiven Betrieb genau die Funktionen angezeigt, die der jeweiligen Rolle laut Berechtigungstabelle zustehen: Funktionen, die dem Verwaltungsmitarbeiter (etwa die Mitarbeiter- und Gruppenverwaltung, das Anlegen neuer Geräte) oder ausschließlich dem Administrator (Import und Export von Daten, Backup-Erstellung, Berichtexport) vorbehalten sind, erscheinen in den Sichten aller anderen Rollen nicht -- weder sichtbar noch deaktiviert. Bau-/Projektleiter, Verwaltungsmitarbeiter und Vorarbeiter erhalten jeweils rollenreine Sichten ohne fremde Zusatzfunktionen; eine "kombinierte Rollensicht" existiert im Datenmodell bewusst nicht. Zur Demonstration innerhalb dieses Kapitels wird ausdrücklich die volle Administrator-Sicht verwendet und die rollenspezifische Reduktion in den Reflexionsabschnitten erläutert. Diese Reduktion erfolgt zur Laufzeit über die im Klassendiagramm modellierte Enumeration `Rolle`.

=== Konsistente Tabellen, Karten und Formulare
Tabellarische Darstellungen folgen einem einheitlichen Aufbau mit fixiertem Kopfbereich, dezenten horizontalen Trennlinien und einer typografischen Hervorhebung von Nummern und Identifikatoren in einer Festbreitenschrift. Inhaltliche Gruppierungen werden durchgängig als weiße Karten mit leichten Schatten und einheitlichen Eckenrundungen umgesetzt. Formularfelder verwenden eine identische Höhe, Beschriftung und Fehlerhervorhebung. Diese gestalterische Konsistenz reduziert die kognitive Belastung des Anwenders erheblich und unterstützt die im Lastenheft (LF 10) geforderte sehr gute Benutzbarkeit.

#pagebreak()
== Dashboard
Das Dashboard (siehe @mockup_dashboard) ist die zentrale Einstiegsseite und bietet nach dem Start einen Überblick über alle für den Arbeitstag relevanten Informationen.

#figure(
  image("../GUIMockUps/PNGs/Dashboard.png", width: 100%),
  caption: [GUI-Ansicht Dashboard]
) <mockup_dashboard>

Die Kopfzeile begrüßt den Mitarbeiter mit Datum und Tageskennzahlen; darunter fassen vier Kennzahlenkacheln die zentralen Indikatoren zusammen (aktive Projekte, laufende Aufträge inkl. Verzug, Gerätenutzung, heutige Anwesenheit). Alle Kennzahlen sind aus dem Datenbestand abgeleitet und nur zur Visualisierung, nicht zur Bearbeitung.

Der Hauptbereich ist zweispaltig: links eine umschaltbare Tagesübersicht ("Termine", "Aufträge", "Buchungen") mit chronologischer Stundenleiste und verlinkten Auftragsnummern, rechts drei Karten -- "Neu eingegangene Aufträge", "Verfügbarkeitswarnungen" (defekte, in Wartung befindliche oder kollidierend gebuchte Geräte) und eine Schnellübersicht. Der untere Bereich zeigt eine filterbare Tabelle laufender Aufträge (Status, Fortschritt aus Unterauftrags-Verhältnis) als schnellen Einstieg. Die Aktionen "Bericht exportieren" (nur Administrator) und "Neuer Auftrag" oben rechts fassen die häufigsten ausgehenden Vorgänge zusammen.


== Auftragsübersicht
Die Auftragsübersicht (siehe @mockup_auftraege) ist das wichtigste Werkzeug zur Verwaltung sämtlicher Aufträge und entspricht LF 30. Da sie mehrfach täglich aufgerufen wird, wurde besonderer Wert auf einen effizienten Aufbau gelegt.

#figure(
  image("../GUIMockUps/PNGs/AufträgeÜbersicht.png", width: 100%),
  caption: [GUI-Ansicht Auftragsübersicht]
) <mockup_auftraege>

Die Kopfzeile zeigt aggregierte Kennzahlen sowie die Aktionen Import, CSV-Export (beide nur Administrator) und "Neuer Auftrag". Ein Karteireiter trennt laufende Kundenaufträge vom Archiv; darunter erlaubt eine Filterzeile Volltextsuche sowie Sortierung/Filterung nach Status und Datum (LF 60).

Die Auftragsliste ist als vertikal gestapelte Karten umgesetzt (zugänglicher und mobiltauglicher als eine Tabelle). Jede Karte zeigt statusfarbenen Akzentstreifen, Auftragsnummer (monospace), Bezeichnung, Kunde, Laufzeit, eine Statuspille gemäß Enumeration `AuftragStatus` und @statusfarben, eine gleichfarbige Fortschrittsanzeige sowie die beteiligten Mitarbeiter als Avatare ("+n" bei mehr als drei). Eine Seitennavigation gliedert große Ergebnismengen -- bei den laut Produktleistungen erwarteten ~100.000 Datensätzen der einzig praktikable Ansatz für kurze Antwortzeiten. Ein Klick auf eine Karte öffnet die Detailansicht.


== Auftragsdetailansicht
Die Detailansicht eines Auftrags (siehe @mockup_auftrag_detail) bündelt sämtliche zu einem konkreten Auftrag verfügbaren Informationen auf einer einzigen Seite und ermöglicht es dem Bauleiter, von dort aus alle wesentlichen Folgeaktionen zu initiieren -- sei es das Anlegen von Unteraufträgen, das Buchen von Geräten oder das Hinterlegen von Bilddokumenten.

#figure(
  image("../GUIMockUps/PNGs/AuftragDetaileinsicht.png", width: 100%),
  caption: [GUI-Ansicht Auftragsdetailansicht]
) <mockup_auftrag_detail>

Die Kopfzeile zeigt Auftragsbezeichnung, Auftragsnummer (monospace), Statuspille und Einsatzort sowie die Schaltfläche "Bearbeiten", die den zu @mockup_auftrag_anlegen analogen Dialog öffnet.

Der Hauptbereich ist zweispaltig. Die linke Spalte enthält vier Karten: "Status \& Fortschritt" (eingesetzte Mitarbeiter, aktive Maschinen, Gesamtfortschritt, Unterbesetzungshinweis), "Finanzen \& Rechnungen" (Kostenvoranschlag, aufgelaufene Kosten, Rechnungsliste) -- da das Finanzbuchhaltungssystem laut Lastenheft führend ist, erfolgt hier nur eine lesende Darstellung, und der Eintrag "Rechnung in FiBu anfordern" öffnet lediglich die Anlagemaske im externen System, "Bemerkungen" (freie Hinweise) sowie "Fotodokumentation" gemäß LF 80 mit Upload-Kachel.

Die rechte Spalte enthält zwei kompakte Karten: "Informationen" (übergeordnetes Projekt, Termine gemäß LF 30, verlinkter Bauplan als `Dokument`-Objekt) und "Beteiligte Personen" (zugeordnete Mitarbeiter mit Avatar und Position).
#pagebreak()


== Neuen Auftrag anlegen
Der Dialog zum Anlegen eines neuen Auftrags (siehe @mockup_auftrag_anlegen) wird modal über die Auftragsübersicht geöffnet und realisiert die im Lastenheft geforderte Erfassung sämtlicher relevanter Auftragsdaten in einer einzigen, kompakten Eingabemaske. Der Hintergrund der zugrundeliegenden Übersicht bleibt während der Eingabe sichtbar, jedoch leicht abgedunkelt, sodass der Anwender den Kontext seiner Eingabe nicht aus den Augen verliert.

#figure(
  image("../GUIMockUps/PNGs/AuftragErstellen.png", width: 90%),
  caption: [GUI-Ansicht Anlegen eines neuen Auftrags]
) <mockup_auftrag_anlegen>

Der Dialog ist zweispaltig aufgebaut; Pflichtfelder sind durch einen orangefarbenen Stern gekennzeichnet.

Die linke Spalte erfasst die Stammdaten. Das Feld "Auftragsbezeichnung" demonstriert die Duplikatsprüfung nach LF 100: Während der Eingabe blendet das System bei einem Treffer einen Hinweisbanner ein ("Potenzielles Duplikat erkannt: … (\#205012)") mit Verlinkung "Details prüfen", sodass der Anwender abbrechen, den bestehenden Eintrag bearbeiten oder dennoch anlegen kann. Es folgen Projektzuordnung (mit Option, ein neues Projekt anzulegen), Bauplan (als `Dokument`-Objekt mit Typ `BAUPLAN`) sowie Start-, End- und optionaler Zwischentermin über Datumsfelder.

Die rechte Spalte erfasst Einsatzort (strukturiert in Straße, Hausnummer, PLZ, Ort -- für die standortbasierte Gerätesuche), beteiligte Personen als Mehrfachauswahl mit Chip-Darstellung sowie das Feld "Bauleiter". Letzteres ist kein eigenes Attribut, sondern eine hervorgehobene Auswahl unter den beteiligten Personen mit Position `BAULEITER`, auf Datenmodellebene über die Assoziation "beteiligte Personen" und die Enumeration `Position` abgebildet. Der Kostenvoranschlag wird automatisch aus dem Finanzbuchhaltungssystem übernommen. Die Fußzeile enthält "Vorlage speichern", "Abbrechen" und die primäre Schaltfläche "Auftrag anlegen", die erst nach erfolgreicher Validierung und Umgang mit einem etwaigen Duplikathinweis aktiv wird.
#pagebreak()

== Geräte- und Maschinenverwaltung
Die Verwaltung der Geräte und Maschinen (siehe @mockup_geraete) stellt einen der zentralen Funktionsbereiche der Anwendung dar und realisiert die im Lastenheft formulierten Anforderungen LF 50, LF 70 und LF 80. Die Ansicht folgt einem zweispaltigen Master-Detail-Layout, wie es sich für die Verwaltung großer Bestände an gleichartigen Objekten bewährt hat.

#figure(
  image("../GUIMockUps/PNGs/Geräte&Maschinen.png", width: 100%),
  caption: [GUI-Ansicht Geräte- und Maschinenverwaltung]
) <mockup_geraete>

Die Kopfzeile zeigt aggregierte Fuhrpark-Kennzahlen sowie die Aktionen "Verfügbarkeit prüfen" (Suchassistent) und "Gerät anlegen".

Die linke Master-Spalte enthält eine Karteireiterleiste ("Alle", "Baumaschinen", "Bauwerkzeuge") sowie eine Filter- und Suchleiste (Gerätenummer, Bezeichnung, Seriennummer; Filter nach Status, Kategorie, Lager, Verfügbarkeitszeitraum und Ausrüstungstyp). Die Kombination aus Verfügbarkeit und Ausrüstung erfüllt LF 50 und LF 60. Die Geräteliste zeigt je Eintrag Vorschaubild bzw. Kategoriesymbol, Bezeichnung, Gerätenummer (monospace) und Statuspille; der ausgewählte Eintrag ist hervorgehoben.

Die rechte Detailspalte zeigt zunächst ein Foto mit Statusbanner (LF 80), darunter Gerätebezeichner mit Verlinkung auf den `Geräte-Typ` und Seriennummer -- diese Trennung realisiert das Analysemuster Exemplartyp und vermeidet redundante Typ-Stammdaten. Es folgen Kennzahlenkacheln (Buchungen, Auslastung, letzte Wartung) sowie ein Karteireiterbereich ("Übersicht", "Buchungen", "Wartung", "Ausrüstung", "Standort \& Lager", "Historie"). Der Reiter "Übersicht" enthält u.a. den Bereich "Zubehör (Baugruppe-Muster)" zur Verwaltung kompatibler Anbaugeräte (LF 50) sowie eine Standortvorschau.


== Buchung mit Verfügbarkeitssuche
Die Buchungsansicht (siehe @mockup_buchung) realisiert den dreistufigen Buchungsprozess für Geräte (LF 50) und wird als modaler Dialog aus jedem Kontext (Auftragsdetail, Geräteverwaltung, Terminplaner) geöffnet.

#figure(
  image("../GUIMockUps/PNGs/Buchungen.png", width: 90%),
  caption: [GUI-Ansicht Geräte buchen mit Verfügbarkeitssuche]
) <mockup_buchung>

Eine Schrittanzeige gliedert den Prozess in drei Phasen (Auftrag wählen, Verfügbarkeit prüfen, bestätigen), der aktive Schritt ist hervorgehoben. Die Eingabefelder umfassen den vorbelegten Auftrag, die Gerätekategorie (erweiterbare Auswahlliste, LF 70), den Buchungszeitraum und den Einsatzort (übernimmt automatisch die Auftragsadresse).

Auf dieser Grundlage zeigt der Dialog eine nach Verfügbarkeit und Entfernung sortierte Liste. Die Entfernungssortierung ist eine über das Lastenheft hinausgehende Zusatzfunktion auf Basis der statischen Lageradresse (kein Routing-Dienst nötig). Jede Ergebnis-Karte zeigt Bezeichnung, Gerätenummer, Lager mit optionaler Entfernung und den Verfügbarkeitsstatus im angefragten Zeitraum (grün = frei, bernstein = teilweise, rot = nicht buchbar). Eine Hinweiszeile kündigt an, dass beim Abschluss eine Buchungsnummer vergeben und das Gerät im Terminplaner gesperrt wird; die Fußzeile führt über "Weiter zur Bestätigung" in den letzten Schritt.

#pagebreak()
== Terminplaner
Der Terminplaner (siehe @mockup_terminplaner) realisiert die Terminverwaltung nach LF 40 als kalendarische Wochenansicht mit umschaltbarer Tages- und Monatsansicht.

#figure(
  image("../GUIMockUps/PNGs/Terminplaner.png", width: 100%),
  caption: [GUI-Ansicht Terminplaner mit Detailpanel]
) <mockup_terminplaner>

Die Kopfzeile zeigt die Kalenderwoche, einen Granularitätsumschalter (Tag/Woche/Monat) und Navigationspfeile; eine Filterzeile ("Mitarbeiter", "Kategorie", "Auftrag" sowie Umschalter für Geräte-Buchungen) passt die Ansicht an. Den Hauptteil bildet ein Wochenraster mit Stundenachse und Tagesspalten; Termine erscheinen als farbcodierte Blöcke, Geräte-Buchungen zusätzlich mit Buchungssymbol, sodass sie sich unterscheiden lassen.

Ein Detailpanel rechts zeigt nach Auswahl eines Termins dessen vollständige Informationen (Titel, verlinkte Auftragsnummer, Datum/Uhrzeit/Dauer, Ort, Team, Bemerkungen, verknüpfte Buchungen) ohne Ansichtswechsel und bietet unten die Aktionen "Löschen", "Bearbeiten" und "Termin öffnen".


== Mitarbeiterprofil und Gruppenzuordnung
Die letzte hier vorgestellte Ansicht (siehe @mockup_mitarbeiter) realisiert die im Lastenheft (LF 20) geforderte Mitarbeiter- und Gruppenverwaltung und veranschaulicht zugleich die für die Bauunternehmensorganisation typische n:m-Zuordnung zwischen Mitarbeitern und Gruppen.

#figure(
  image("../GUIMockUps/PNGs/Mitarbeiter.png", width: 100%),
  caption: [GUI-Ansicht Mitarbeiterprofil mit Gruppenzuordnung]
) <mockup_mitarbeiter>

Den oberen Teil bildet ein Profilelement mit Avatar, Name, Mitarbeiternummer, Position und Vertragsbeginn; darunter die Stammdaten (Adresse, Geburtsdatum, Beschäftigungsort) und Kontaktdaten. Rechts oben die Aktionen "Profil bearbeiten" und "Gruppe zuordnen".

Der Hauptbereich ist zweispaltig: Links listet "Gruppenzugehörigkeiten" die Gruppen des Mitarbeiters als Karten mit Bezeichnung, Nummer, farbcodiertem Gruppentyp und Rolle innerhalb der Gruppe. Diese Mehrfachzugehörigkeit realisiert sichtbar die in LF 20 geforderte n:m-Beziehung. Rechts unterstützt die Karte "Verfügbare Gruppen" die Zuordnung: Sie listet die noch nicht zugeordneten Gruppen mit Suche/Filter und Auswahlkästchen; die Schaltfläche "n Gruppe(n) hinzufügen" passt sich dynamisch der Auswahl an. Diese Zuordnungslogik ist verbindendes Element zwischen Personalverwaltung und den übrigen Anwendungsbereichen (z.B. rollenspezifische Auftragsfilterung).


== Nicht skizzierte Ansichten
Neben den acht Mockups existieren weitere Masken, die denselben Gestaltungsprinzipien folgen und sich daraus ableiten lassen:

- *Lagerverwaltung*: analog zur Geräteverwaltung, mit Lagern als Hauptobjekt und kartografischer Standortübersicht (LF 50).
- *Anwesenheitszeiten*: tabellarische Auflistung je Mitarbeiter, gruppierbar nach Tag/Woche/Monat; Erfassung automatisch per Stempelkartenimport (LF 90).
- *Bilder- und Dokumentenkatalog*: Galerieansicht des Bildbestands mit Suche nach Titel, Datum und Element (LF 80).
- *Globale Suche und Suchmasken*: Volltextsuche über die Topbar auf alle Hauptentitäten, ergänzt um entitätsspezifische Suchmasken (LF 60).
- *Einstellungen*: Sprache, Farbthema und Standardansicht (LF 10).
- *Administrationsbereich*: nur für den Administrator (Import/Export, Backup, Rollenvergabe).

== Diskussion und Reflexion
Eine zentrale Entscheidung war die durchgängige Verwendung kartenbasierter Layouts statt klassischer Tabellen: Karten erlauben eine reichhaltigere Darstellung pro Eintrag (Vorschaubilder, Avatarstapel, Statusinformationen) und sind besser für eine spätere Tablet-Adaption geeignet; wo Tabellen bei großen Datenmengen effizienter scanbar sind (laufende Aufträge im Dashboard), wurden sie beibehalten. Administrative Funktionen werden im Betrieb über die Klasse `Rolle` rollenabhängig ausgeblendet statt in einen separaten Bereich ausgelagert, um häufige Bereichswechsel zu vermeiden. Insgesamt lassen sich alle funktionalen Anforderungen durch eine schlanke Oberfläche mit wiederverwendeten Bausteinen (Seitenleiste, Topbar, Statuspillen, Karten) abbilden, was die geforderte sehr gute Benutzbarkeit erfüllt.
