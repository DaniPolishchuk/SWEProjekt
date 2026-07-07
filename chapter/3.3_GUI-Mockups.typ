= GUI-Mockups

Im Rahmen der Analysephase wurden zentrale Anwendungsbereiche der Verwaltungssoftware exemplarisch als GUI-Mockups ausgearbeitet. Diese Mockups dienen der Visualisierung des angestrebten Bedienkonzepts und veranschaulichen, wie die in den vorhergehenden Abschnitten beschriebene Funktionalität durch eine grafische Benutzungsoberfläche zugänglich gemacht wird. Hierbei stehen Übersichtlichkeit, einfache Bedienbarkeit und ein konsistentes, rollenbasiertes Bedienkonzept im Mittelpunkt. Sämtliche Mockups wurden für eine Desktopansicht entworfen, da das Bauunternehmen seine Mitarbeiter in der Verwaltung primär an stationären Arbeitsplätzen ausstattet und der Funktionsumfang einer dedizierten Tablet-Variante laut Lastenheft nicht Teil des ersten Auftrags ist.

Insgesamt wurden acht zentrale Ansichten ausgewählt und ausgearbeitet, die jeweils unterschiedliche Anwendungsbereiche und Produktfunktionen aus den Funktionsanforderungen LF 10 bis LF 100 abdecken. Die Auswahl orientiert sich an der Häufigkeit der zugrundeliegenden Vorgänge im Arbeitsalltag eines Bauunternehmens sowie an den im Lastenheft formulierten Kernanforderungen. Nicht skizziert wurden hingegen untergeordnete Wartungsmasken (etwa die Verwaltung des zentralen Bildkatalogs, die Konfigurationsverwaltung des Administrators oder einzelne Eingabedialoge zum Anlegen von Lagern und Ausrüstungen), da diese strukturell den vorgestellten Verwaltungsansichten entsprechen und keinen eigenständigen Erkenntnisgewinn liefern würden. Eine Anmeldemaske wurde entsprechend der Vereinfachungen aus Abschnitt 1.4 des Lastenhefts ebenfalls nicht modelliert.

Die acht ausgewählten Ansichten wurden so zusammengestellt, dass sie aufeinander aufbauen und einen typischen Tagesablauf eines Bauleiters nachvollziehbar abbilden: Beginnend beim Dashboard als zentraler Einstiegspunkt führt der Weg über die Auftragsübersicht und die Detailansicht eines konkreten Auftrags bis hin zum Anlegen neuer Aufträge, dem Verwalten der für die Bauausführung benötigten Geräte und Maschinen, dem Buchen einzelner Geräte unter Berücksichtigung der Verfügbarkeit, der Terminplanung sowie der Mitarbeiter- und Gruppenverwaltung.

== Designphilosophie und übergreifende Gestaltungsentscheidungen

Bevor auf die einzelnen Mockups im Detail eingegangen wird, werden zunächst die übergreifenden Gestaltungsprinzipien erläutert, die für alle Ansichten der Verwaltungssoftware identisch gelten. Diese Prinzipien gewährleisten ein konsistentes und vorhersehbares Bedienerlebnis und reduzieren die Einarbeitungszeit der Anwender erheblich.

=== Permanente Seitenleiste
Sämtliche Ansichten verfügen über eine identische, permanent sichtbare Seitenleiste am linken Bildschirmrand. Diese Seitenleiste enthält den Markennamen der Anwendung ("BauOS -- Construction OS") als Logo sowie zwei thematisch gegliederte Bereiche. Im Hauptbereich befinden sich die wesentlichen Einstiegspunkte für die tägliche Arbeit -- Dashboard, Aufträge, Geräte und Maschinen, Buchungen, Terminplaner, Lager, Mitarbeiter sowie eine globale Suche. Im unteren Bereich der Seitenleiste sind ergänzende Funktionen wie die Anwesenheitszeiten, der Bilderkatalog und die Anwendungseinstellungen zusammengefasst.

Der jeweils aktive Menüpunkt ist durch einen seitlich gesetzten orangefarbenen Akzentbalken sowie eine geringfügig hellere Hintergrundfarbe visuell hervorgehoben. Durch diese gleichbleibende Anordnung der Navigationselemente kann jeder Anwender die Anwendung intuitiv bedienen, sobald er sich die Position der einzelnen Menüpunkte einmal eingeprägt hat. Dies entspricht der im Lastenheft (LF 10) geforderten ergonomischen und intuitiven Bedienbarkeit.

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

Die Statuspillen sind über sämtliche Ansichten hinweg identisch gestaltet und dadurch sofort wiedererkennbar. Sämtliche im Folgenden gezeigten Mockups verwenden diese Palette ohne Abweichung.

=== Rollenbasierte Sichtbarkeit
Die in diesem Kapitel gezeigten Mockups bilden eine bewusst gewählte Administrator-Demoansicht ab, da diese Rolle den vollständigen Funktionsumfang der Anwendung sichtbar macht und sich damit am besten zur Illustration sämtlicher Bedienelemente eignet. Konsequent zum Ein-Rollen-Prinzip aus der Lastenheftanalyse -- jeder Benutzer besitzt genau eine Rolle -- werden im produktiven Betrieb genau die Funktionen angezeigt, die der jeweiligen Rolle laut Berechtigungstabelle zustehen: Funktionen, die dem Verwaltungsmitarbeiter (etwa die Mitarbeiter- und Gruppenverwaltung, das Anlegen neuer Geräte) oder ausschließlich dem Administrator (Import und Export von Daten, Backup-Erstellung, Berichtexport) vorbehalten sind, erscheinen in den Sichten aller anderen Rollen nicht -- weder sichtbar noch deaktiviert. Bau-/Projektleiter, Verwaltungsmitarbeiter und Vorarbeiter erhalten jeweils rollenreine Sichten ohne fremde Zusatzfunktionen; eine "kombinierte Rollensicht" existiert im Datenmodell bewusst nicht. Zur Demonstration innerhalb dieses Kapitels wird ausdrücklich die volle Administrator-Sicht verwendet und die rollenspezifische Reduktion in den Reflexionsabschnitten erläutert. Diese Reduktion erfolgt zur Laufzeit über die im Klassendiagramm modellierte Enumeration `Rolle`.

=== Konsistente Tabellen, Karten und Formulare
Tabellarische Darstellungen folgen einem einheitlichen Aufbau mit fixiertem Kopfbereich, dezenten horizontalen Trennlinien und einer typografischen Hervorhebung von Nummern und Identifikatoren in einer Festbreitenschrift. Inhaltliche Gruppierungen werden durchgängig als weiße Karten mit leichten Schatten und einheitlichen Eckenrundungen umgesetzt. Formularfelder verwenden eine identische Höhe, Beschriftung und Fehlerhervorhebung. Diese gestalterische Konsistenz reduziert die kognitive Belastung des Anwenders erheblich und unterstützt die im Lastenheft (LF 10) geforderte sehr gute Benutzbarkeit.

#pagebreak()

== Dashboard
Das Dashboard (siehe @mockup_dashboard) bildet die zentrale Einstiegsseite der Anwendung und wird unmittelbar nach dem Programmstart angezeigt. Es bietet dem angemeldeten Mitarbeiter einen schnellen Überblick über alle für seinen Arbeitstag relevanten Informationen, ohne dass er hierfür durch verschiedene Untermenüs navigieren muss.

#figure(
  image("../GUIMockUps/PNGs/Dashboard.png", width: 100%),
  caption: [GUI-Ansicht Dashboard]
) <mockup_dashboard>

In der Kopfzeile des Hauptbereichs wird der Mitarbeiter persönlich mit Vornamen begrüßt, ergänzt um das aktuelle Datum sowie eine Kurzfassung der wichtigsten Tageskennzahlen ("4 aktive Projekte" und "12 laufende Aufträge"). Direkt darunter befindet sich eine Reihe von vier Kennzahlenkacheln, die die zentralen Indikatoren des Tagesgeschäfts auf einen Blick zugänglich machen: die Anzahl aktiver Projekte, die Anzahl laufender Aufträge mit Hinweis auf in Verzug befindliche Aufträge, die Gerätenutzung als Verhältnis aus gebuchten und insgesamt vorhandenen Geräten sowie die heutige Anwesenheit der Belegschaft, jeweils mit einem aussagekräftigen Trend- oder Detailhinweis. Diese Kennzahlen sind sämtlich aus dem Datenbestand der Anwendung abgeleitet und dienen ausschließlich der Visualisierung; eine direkte Bearbeitung an dieser Stelle ist nicht vorgesehen.

Der Hauptarbeitsbereich des Dashboards ist horizontal in zwei Spalten unterteilt. Auf der linken, breiteren Seite findet sich eine umschaltbare Tagesübersicht mit den Karteireitern "Termine", "Aufträge" und "Buchungen". Im standardmäßig geöffneten Reiter "Termine" sind die Termine des aktuellen Tages chronologisch in einer vertikal verlaufenden Stundenleiste angeordnet. Jeder Termin zeigt neben dem Titel die zugehörige Auftragsnummer als verlinkte Referenz. Durch einen Klick auf einen Termin gelangt der Anwender in die Detailansicht im Terminplaner.

Auf der rechten Seite stehen drei vertikal angeordnete Karten zur Verfügung. Die oberste Karte "Neu eingegangene Aufträge" listet die jüngst dem Mitarbeiter zugeordneten Aufträge mit Auftragsnummer und Kurzbezeichnung auf, sodass dieser über neue Verantwortlichkeiten unmittelbar informiert wird. Die mittlere Karte "Verfügbarkeitswarnungen" hebt jene Geräte hervor, deren Status eine zeitnahe Aufmerksamkeit erfordert -- etwa weil sie defekt sind, sich in Wartung befinden oder weil widersprüchliche Buchungen erkannt wurden. Auf diese Weise wird der Bauleiter frühzeitig über potenzielle Engpässe informiert.

Der untere Bereich des Dashboards enthält eine Tabelle der laufenden Aufträge mit Filterchips ("Alle", "In Arbeit", "Verzug") sowie den wichtigsten Spalten Auftragsnummer, Bezeichnung, Status und Fortschritt. Diese Tabelle dient als schneller Sprung in eine bestimmte Auftragsbearbeitung, ohne den Umweg über die vollständige Auftragsübersicht zu nehmen. Der Fortschritt eines Auftrags wird hierbei aus dem Verhältnis abgeschlossener zu insgesamt vorhandenen Unteraufträgen abgeleitet und als horizontaler Balken visualisiert.

Die Schaltfläche "Bericht exportieren" sowie die Schaltfläche "Neuer Auftrag" rechts oben fassen die zwei häufigsten ausgehenden Aktionen aus dieser Übersicht zusammen. Die Berichtfunktion ist im produktiven Einsatz ausschließlich für den Administrator sichtbar (bzw. in den Sichten anderer Rollen deaktiviert); im Mockup wurde sie zur Demonstration der vollständigen Funktionalität dennoch aktiviert dargestellt. In einer realen Umsetzung ist dieser Zustand mit einem entsprechenden Rollenhinweis versehen.

#pagebreak()

== Auftragsübersicht
Die Auftragsübersicht (siehe @mockup_auftraege) stellt das wichtigste Werkzeug zur Verwaltung sämtlicher Aufträge des Unternehmens dar und entspricht damit unmittelbar der Lastenheftforderung LF 30. Sie ist von einem Bauleiter mehrfach täglich aufzurufen, weshalb auf einen besonders effizienten Aufbau Wert gelegt wurde.

#figure(
  image("../GUIMockUps/PNGs/AufträgeÜbersicht.png", width: 100%),
  caption: [GUI-Ansicht Auftragsübersicht]
) <mockup_auftraege>

Die Kopfzeile zeigt den Titel der Ansicht zusammen mit aggregierten Kennzahlen ("12 laufend $dot.c$ 47 abgeschlossen $dot.c$ 3 in Verzug"), die einen unmittelbaren Eindruck vom Gesamtzustand der Auftragslandschaft vermitteln. Rechts daneben sind die wichtigsten ausgehenden Aktionen platziert: das Importieren von Daten, das Exportieren als CSV-Datei sowie das Anlegen eines neuen Auftrags. Die ersten beiden Schaltflächen sind im produktiven Einsatz dem Administrator vorbehalten und werden in den Sichten anderer Rollen ausgeblendet.

Unterhalb der Kopfzeile gliedert ein Karteireiter die Auftragslandschaft in laufende Kundenaufträge und das Archiv abgeschlossener Aufträge. Der Reiter "Kundenaufträge" ist standardmäßig aktiv und zeigt einen orangefarbenen Akzentbalken zur Kennzeichnung der aktiven Sektion. Direkt darunter befindet sich eine durchgängig sichtbare Filterzeile mit einem Volltextsuchfeld sowie zwei Sortier- und Filterelementen für Status und Datum. Über die Schaltfläche "Sortieren" am rechten Rand kann die zugrundeliegende Sortierreihenfolge nach beliebigen Spalten gewechselt werden.

Die eigentliche Auftragsliste ist als Reihe vertikal gestapelter Karten umgesetzt, was sich gegenüber einer klassischen Tabellendarstellung als zugänglicher und mobiltauglicher erwiesen hat. Jede Karte zeigt am linken Rand einen schmalen, statusfarbenen Akzentstreifen sowie -- als typografisches Erkennungsmerkmal -- die Auftragsnummer in monospacer Schrift. Es folgen die Auftragsbezeichnung als Hauptinformation, der Kunde mit Firmenname sowie die geplante Laufzeit als Datumsbereich. Mittig auf der Karte zeigt eine Statuspille den aktuellen Status des Auftrags an. Die verfügbaren Werte entsprechen der Enumeration `AuftragStatus` und werden dem Anwender gemäß @statusfarben angezeigt: "Offen" (grün), "In Arbeit" (blau), "Pausiert" (bernstein), "Verzug" (rot), "Abgeschlossen" (grün) sowie "Archiviert" (grau) für logisch gelöschte Aufträge im Archiv-Reiter; jeder Statuswechsel wird systemseitig in einer Aktivitätshistorie protokolliert, die in einer separaten Detailansicht eingesehen werden kann. Die zugehörige Fortschrittsanzeige rechts daneben verwendet konsistent dieselbe Statusfarbe und zeigt den Bearbeitungsstand prozentual an. Am rechten Kartenende sind als Avatare die dem Auftrag zugeordneten Mitarbeiter eingeblendet; bei mehr als drei beteiligten Personen wird die Anzahl der weiteren Mitarbeiter als kompaktes "+n"-Element angezeigt.

Im unteren Bereich der Liste regelt eine Seitennavigation die Aufteilung umfangreicher Ergebnismengen in handhabbare Abschnitte. Bei einer Auftragsmenge im Bereich von rund einhunderttausend Datensätzen, wie sie das Lastenheft im Abschnitt Produktleistungen vorsieht, ist eine seitenweise Darstellung mit kombinierter Suche und Filterung der einzige praktikable Ansatz, um die Antwortzeiten kurz zu halten.

Ein Klick auf eine Karte öffnet die im folgenden Abschnitt erläuterte Detailansicht des jeweiligen Auftrags.

#pagebreak()

== Auftragsdetailansicht
Die Detailansicht eines Auftrags (siehe @mockup_auftrag_detail) bündelt sämtliche zu einem konkreten Auftrag verfügbaren Informationen auf einer einzigen Seite und ermöglicht es dem Bauleiter, von dort aus alle wesentlichen Folgeaktionen zu initiieren -- sei es das Anlegen von Unteraufträgen, das Buchen von Geräten oder das Hinterlegen von Bilddokumenten.

#figure(
  image("../GUIMockUps/PNGs/AuftragDetaileinsicht.png", width: 100%),
  caption: [GUI-Ansicht Auftragsdetailansicht]
) <mockup_auftrag_detail>

Die Kopfzeile zeigt die Auftragsbezeichnung "Fundamentarbeiten Baufeld C" als prominenten Seitentitel, ergänzt um die mono-typografisch gesetzte Auftragsnummer, eine Statuspille mit dem aktuellen Status "In Bearbeitung" sowie den Einsatzort als kompakte Adresse. Rechts oben befindet sich eine sekundäre Schaltfläche "Bearbeiten", über die ein modaler Bearbeitungsdialog geöffnet wird, der inhaltlich dem in @mockup_auftrag_anlegen gezeigten Anlegedialog entspricht.

Der Hauptbereich ist in zwei Spalten gegliedert. In der linken, breiteren Spalte sind vier Karten vertikal gestapelt, deren Aufbau sich an der Wichtigkeit der enthaltenen Informationen orientiert.

Die oberste Karte "Status \& Fortschritt" fasst den aktuellen Stand der Bauausführung zusammen. Sie zeigt die Anzahl der derzeit auf der Baustelle eingesetzten Mitarbeiter, die Anzahl aktiver Maschinen sowie eine prozentuale Gesamtfortschrittsanzeige als horizontalen Balken. Das Personalfeld weist über eine kleine farbige Hinweismarke auf eine vorliegende Unterbesetzung hin, sodass der Bauleiter unmittelbar handeln kann.

Die zweite Karte "Finanzen \& Rechnungen" stellt die finanzielle Sicht des Auftrags dar. Hier werden der Kostenvoranschlag, die bereits aufgelaufenen Kosten mit prozentualer Auslastung und eine Hochrechnung der voraussichtlichen Endkosten in einer kompakten Form angezeigt. Daneben listet ein Bereich die jüngsten Rechnungen mit Rechnungsnummer, Bezeichnung und Betrag auf, jeweils verlinkt zur vollständigen Rechnungsansicht im externen Finanzbuchhaltungssystem. Da das Finanzbuchhaltungssystem laut Lastenheft die führende Datenquelle für Rechnungen darstellt, beschränkt sich die Verwaltungssoftware hier auf eine rein lesende Darstellung. Der im Mockup mit "Neue Rechnung" beschriftete Button ist -- konsistent zur getroffenen Modellierungsentscheidung -- als reine Anforderungsschaltfläche zu verstehen: Ein Klick öffnet nicht etwa eine lokale Erfassungsmaske innerhalb der Verwaltungssoftware, sondern stößt die zugehörige Anlagemaske im externen Finanzbuchhaltungssystem an; die eigentliche Rechnungserstellung erfolgt dort. In der produktiven Fassung wird die Schaltfläche entsprechend eindeutig mit "Rechnung in FiBu anfordern" beschriftet, damit auf einen Blick erkennbar bleibt, dass die Verwaltungssoftware Rechnungen niemals selbst erzeugt oder ändert. Die abweichende Beschriftung im vorliegenden Mockup ist eine bewusst gekennzeichnete Restinkonsistenz aus einer früheren Iteration und wird bis zur Umsetzung im finalen Design ersetzt.

Die dritte Karte "Bemerkungen" enthält frei formulierbare Hinweise, die häufig der Kommunikation zwischen Verwaltung und Bauausführung dienen ("Kunde bittet um Anruf vor Lieferung. Zufahrt über Nordtor nutzen.").

Die vierte Karte "Fotodokumentation" entspricht der im Lastenheft (LF 80) geforderten Möglichkeit, jedem Element des Systems beliebig viele Bilder mit Titel zuzuordnen. Hier können Bilder von der Baustelle hochgeladen, beschriftet und gemeinsam mit dem Auftrag archiviert werden. Eine gestrichelt umrandete Hochladekachel am Ende des Bildrasters dient als visueller Aufhänger für das Hinzufügen weiterer Bilder.

Die rechte Spalte enthält zwei kompakte Karten. Die Karte "Informationen" listet das übergeordnete Projekt ("Neubau Schulzentrum West"), das Startdatum, den Zwischentermin sowie das geplante Ende auf und stellt damit die im Lastenheft (LF 30) geforderten zentralen Auftragsdaten kompakt zusammen. Ergänzend ist der zugehörige Bauplan als verlinktes `Dokument`-Objekt (in der Regel eine PDF-Datei) eingebunden, sodass die zugrundeliegende Datei unmittelbar geöffnet werden kann. Die zweite Karte "Beteiligte Personen" zeigt die dem Auftrag zugeordneten Mitarbeiter mit Avatarbild und ausgeschriebener Position (Projektleiter, Polier oder einfaches Mitglied) und realisiert damit sichtbar die Verknüpfung zwischen Auftrag und Personal.

#pagebreak()

== Neuen Auftrag anlegen
Der Dialog zum Anlegen eines neuen Auftrags (siehe @mockup_auftrag_anlegen) wird modal über die Auftragsübersicht geöffnet und realisiert die im Lastenheft geforderte Erfassung sämtlicher relevanter Auftragsdaten in einer einzigen, kompakten Eingabemaske. Der Hintergrund der zugrundeliegenden Übersicht bleibt während der Eingabe sichtbar, jedoch leicht abgedunkelt, sodass der Anwender den Kontext seiner Eingabe nicht aus den Augen verliert.

#figure(
  image("../GUIMockUps/PNGs/AuftragErstellen.png", width: 90%),
  caption: [GUI-Ansicht Anlegen eines neuen Auftrags]
) <mockup_auftrag_anlegen>

Der Dialog ist horizontal zweispaltig aufgebaut, sodass zusammengehörige Eingabefelder thematisch gruppiert werden können. Pflichtfelder sind durch einen orangefarbenen Stern hinter der Beschriftung gekennzeichnet, was der gängigen Konvention für Eingabedialoge entspricht.

In der linken Spalte werden die Stammdaten des Auftrags erfasst. Das oberste Feld "Auftragsbezeichnung" demonstriert eindrücklich die im Lastenheft (LF 100) geforderte Duplikatsprüfung: Während der Eingabe gleicht das System die Bezeichnung mit dem vorhandenen Datenbestand ab und blendet bei Bedarf einen orangefarbenen Hinweisbanner ein ("Potenzielles Duplikat erkannt: Ein Auftrag mit ähnlicher Bezeichnung existiert bereits (\#205012)"). Über die Verlinkung "Details prüfen" gelangt der Anwender direkt zur Detailansicht des potenziellen Duplikats und kann entscheiden, ob er den neuen Auftrag dennoch anlegt oder den bestehenden bearbeitet. Diese frühzeitige Warnung verhindert die im Lastenheft thematisierte Erzeugung redundanter Datensätze und ist daher bewusst unmittelbar im Eingabeprozess platziert.

Es folgen die Felder zur Zuordnung des übergeordneten Projekts (mit der Möglichkeit, an gleicher Stelle ein neues Projekt anzulegen), die Anlage bzw. Zuordnung eines `Dokument`-Objekts für den zugehörigen Bauplan sowie die drei zentralen Termindaten Starttermin, Endtermin und optionaler Zwischentermin. Das Bauplan-Feld referenziert konsequent die im Analyse-Klassendiagramm eingeführte Klasse `Dokument`; der Anwender lädt eine Datei hoch, worauf das System intern ein `Dokument`-Objekt mit Titel, Dateipfad und Typ (`BAUPLAN`) anlegt und dem Arbeitsauftrag zuordnet. Der im Mockup sichtbare Text "Pfad zum Bauplan" ist damit lediglich das ergonomische Beschriftungsäquivalent zu dieser Dokument-Zuordnung. Die Termindaten werden über klickbare Datumsfelder erfasst, die einen kompakten Kalenderpicker einblenden.

In der rechten Spalte werden ergänzende Daten erfasst, die teils mehrere Felder gleichzeitig betreffen. Der Einsatzort wird strukturiert in Straße, Hausnummer, Postleitzahl und Ort eingegeben, was eine spätere automatische Auswertung -- etwa zur standortbasierten Suche nach verfügbaren Geräten -- erheblich vereinfacht. Die beteiligten Personen werden als Mehrfachauswahl mit Chip-Darstellung erfasst; bereits ausgewählte Mitarbeiter erscheinen als kompakte, mit einem Schließsymbol versehene Pillen. Das im Mockup separat sichtbare Feld "Bauleiter" ist streng genommen kein zusätzliches Attribut der Klasse `Arbeitsauftrag`, sondern eine hervorgehobene Auswahl unter den beteiligten Personen: Es kennzeichnet, welcher der beteiligten Mitarbeiter (mit Position `BAULEITER`) für die operative Verantwortung dieses Auftrags zuständig ist. Auf Datenmodellebene wird diese Verantwortung über die Assoziation "beteiligte Personen" zusammen mit der Enumeration `Position` abgebildet; um eindeutig festzulegen, welcher der Bauleiter unter mehreren möglichen Bauleitern verantwortlich ist, wird ergänzend eine benannte Rolle `verantwortlicherBauleiter: Mitarbeiter [1]` an der Klasse `Arbeitsauftrag` geführt (siehe zugehörige Assoziation im Analyse-Klassendiagramm). Das GUI-Feld unterstützt damit die häufige Ergonomie-Anforderung, den Bauleiter separat hervorzuheben, und ist standardmäßig mit dem aktuell angemeldeten Mitarbeiter vorbelegt, sofern dieser die entsprechende Position innehat. Dass genau ein `Mitarbeiter` mit Position `BAULEITER` als verantwortlich markiert sein muss, wird auf Anwendungsebene per Constraint erzwungen und im Formular durch das Pflichtfeld-Sternchen sichtbar gemacht.

Das Feld "Kostenvoranschlag" zeigt einen erläuternden Hinweis darauf, dass dieser Wert beim Anlegen automatisch aus dem externen Finanzbuchhaltungssystem übernommen wird und somit nicht manuell zu erfassen ist. Das Feld "Bemerkung" erlaubt eine freie textuelle Erfassung ergänzender Hinweise. Eine Schaltfläche "Bilder beim Anlegen anhängen" gibt die Möglichkeit, dem Auftrag bereits zum Zeitpunkt der Erfassung eine Bilddokumentation beizufügen.

In der Fußzeile des Dialogs befinden sich von links nach rechts die Schaltflächen "Vorlage speichern" (zum Sichern wiederkehrender Auftragsmuster), "Abbrechen" und die primäre Schaltfläche "Auftrag anlegen". Erst nach erfolgreicher Validierung sämtlicher Pflichtfelder und nach explizitem Umgang mit einem etwaigen Duplikathinweis wird die primäre Schaltfläche aktiv.

#pagebreak()

== Geräte- und Maschinenverwaltung
Die Verwaltung der Geräte und Maschinen (siehe @mockup_geraete) stellt einen der zentralen Funktionsbereiche der Anwendung dar und realisiert die im Lastenheft formulierten Anforderungen LF 50, LF 70 und LF 80. Die Ansicht folgt einem zweispaltigen Master-Detail-Layout, wie es sich für die Verwaltung großer Bestände an gleichartigen Objekten bewährt hat.

#figure(
  image("../GUIMockUps/PNGs/Geräte&Maschinen.png", width: 100%),
  caption: [GUI-Ansicht Geräte- und Maschinenverwaltung]
) <mockup_geraete>

Die Kopfzeile zeigt den Titel der Ansicht zusammen mit aggregierten Kennzahlen ("64 Geräte $dot.c$ 27 gebucht $dot.c$ 4 in Wartung $dot.c$ 2 defekt"), die unmittelbar einen Eindruck vom Zustand des gesamten Fuhrparks vermitteln. Rechts daneben sind zwei Schaltflächen angeordnet: "Verfügbarkeit prüfen" öffnet einen mehrstufigen Suchassistenten zur standortbezogenen und zeitraumabhängigen Verfügbarkeitssuche, "Gerät anlegen" startet den Anlegevorgang für ein neues Geräteexemplar.

Die linke Spalte beherbergt die Master-Liste sämtlicher Geräte. An der Spitze der Liste steht eine Karteireiterleiste, die zwischen "Alle", "Baumaschinen" und "Bauwerkzeuge" unterscheidet -- entsprechend der im Lastenheft genannten Trennung zwischen schweren Maschinen (Bagger, LKWs, Kräne, Rüttler, Bohrmaschinen) und leichten Werkzeugen (Schalungsteile, Bausicherungen, Zäune). Die jeweilige Anzahl der Treffer wird zur Orientierung in Klammern hinter dem Reiternamen angezeigt. Direkt darunter befindet sich eine durchgehende Filter- und Suchleiste, über die nach Gerätenummer, Bezeichnung oder Seriennummer gesucht werden kann. Ergänzend stehen Filterelemente für Status, Kategorie, Lager, einen Verfügbarkeits-Zeitraum (Datumsbereich "verfügbar von -- bis") sowie für den Ausrüstungstyp (etwa Baggerschaufel oder Kranzubehör) zur Verfügung. Die Filterkombination aus Verfügbarkeit und Ausrüstung erfüllt die im Lastenheft (LF 50, LF 60) geforderte Suche nach Geräten mit konkreter Ausstattung in einem konkreten Zeitraum. Die eigentliche Geräteliste wird als vertikal gestapelte Reihe kompakter Einträge dargestellt; jeder Eintrag zeigt -- soweit für den jeweiligen Gerätetyp ein Bild hinterlegt ist -- ein kleines Vorschaubild des Geräts oder andernfalls ein generisches Kategoriesymbol, gefolgt von der Gerätebezeichnung, der mono-typografisch gesetzten Gerätenummer mit Kategorieangabe sowie einer Statuspille am rechten Rand. Der gerade ausgewählte Eintrag ("Bagger CAT 320") ist über einen orangefarbenen Akzentbalken am linken Rand und eine geringfügig hellere Hintergrundfarbe hervorgehoben.

Die rechte Detailspalte zeigt die vollständigen Informationen zum ausgewählten Gerät. Den oberen Abschluss bildet ein großformatiges Foto des Geräts, dem ein roter Banner mit der Aufschrift "Defekt" überlagert ist, sodass der Zustand des Geräts auf den ersten Blick erkennbar ist. Die im Lastenheft (LF 80) geforderte Bildhinterlegung wird damit unmittelbar in der Detailansicht erlebbar.

Direkt unterhalb des Bildes folgt der Gerätebezeichner "Bagger CAT 320" zusammen mit einer Verlinkung auf den zugehörigen Geräte-Typ ("Geräte-Typ: Kettenbagger CAT 320 (Hochbau)") sowie der Seriennummer. Diese explizite Trennung in einen wiederverwendbaren Geräte-Typ und das individuelle Geräteexemplar realisiert das Analysemuster Exemplartyp und vermeidet, dass Typ-Stammdaten wie Hersteller oder Modell bei jedem konkreten Bagger redundant erfasst werden müssen.

Es folgen drei Kennzahlenkacheln, die geräteweise relevante Informationen verdichten: die Anzahl der Buchungen im laufenden Jahr, die prozentuale Auslastung im aktuellen Quartal sowie das Datum der letzten Wartung. Diese Werte sind sämtlich aus dem Datenbestand abgeleitet und unterstützen den Bauleiter bei Entscheidungen über Ersatzbeschaffung, Wartungsplanung oder Stilllegung.

Im darunterliegenden Karteireiterbereich ("Übersicht", "Buchungen", "Wartung", "Ausrüstung", "Standort \& Lager", "Historie") können sämtliche weiterführenden Informationen zum Gerät erschlossen werden. Im standardmäßig geöffneten Reiter "Übersicht" sind die Stammdaten des Exemplars mit interner Nummer und Seriennummer aufgelistet, ergänzt um den Bereich "Zubehör (Baugruppe-Muster)", in dem das dem Gerät zugeordnete Zubehör (Tieflöffel, Hydraulikhammer und ähnliche Anbauteile) verwaltet wird. Diese Zubehörverwaltung realisiert das im Lastenheft (LF 50) geforderte Konzept zur Verwaltung kompatibler Anbaugeräte. Zusätzlich enthält der Übersicht-Reiter eine kompakte Standortvorschau mit Lagerbezeichnung und Kurzadresse; die ausführliche kartografische Darstellung, der vollständige Adressblock sowie die Historie der Standortwechsel bleiben dem eigenen Karteireiter "Standort \& Lager" vorbehalten, damit die räumliche Information bei Bedarf für sich stehen kann (etwa beim Disponieren von Geräten zwischen Baustellen).

#pagebreak()

== Buchung mit Verfügbarkeitssuche
Die Buchungsansicht (siehe @mockup_buchung) realisiert den dreistufigen Buchungsprozess für Geräte und Maschinen und stellt damit eine der zentralen Funktionalitäten zur Erfüllung von LF 50 dar. Sie wird als modaler Dialog aus jedem Hauptbereich der Anwendung geöffnet, sodass der Buchungsvorgang aus jedem Kontext heraus angestoßen werden kann -- sei es aus der Detailansicht eines Auftrags, aus der Geräteverwaltung oder direkt aus dem Terminplaner.

#figure(
  image("../GUIMockUps/PNGs/Buchungen.png", width: 90%),
  caption: [GUI-Ansicht Geräte buchen mit Verfügbarkeitssuche]
) <mockup_buchung>

Im oberen Bereich des Dialogs ist eine Schrittanzeige eingeblendet, die den Buchungsprozess in drei klar abgegrenzte Phasen gliedert: das Auswählen des zugehörigen Auftrags, die Verfügbarkeitsprüfung und das abschließende Bestätigen der Buchung. Der gerade aktive zweite Schritt ist orange hervorgehoben, abgeschlossene Schritte sind durch ein Häkchen markiert, ausstehende Schritte werden in zurückhaltender Schrift dargestellt. Diese explizite Visualisierung des Fortschritts unterstützt den Anwender beim Behalten des Überblicks und reduziert die Unsicherheit während mehrstufiger Eingaben.

Im Hauptbereich des Dialogs sind die für die Verfügbarkeitssuche relevanten Eingabefelder in einer einzigen Zeile zusammengefasst. Das Feld "Auftrag" ist mit der zuvor ausgewählten Auftragsnummer und Bezeichnung vorbelegt; das Feld "Gerätekategorie" ermöglicht die Eingrenzung auf eine bestimmte Geräteart aus einer im Lastenheft (LF 70) geforderten erweiterbaren Auswahlliste. Über die Schaltfläche "Katalog erweitern" kann der Anwender bei Bedarf einen neuen Eintrag in den Kategoriekatalog aufnehmen. Das Feld "Zeitraum" gibt den gewünschten Buchungszeitraum als Datumsbereich vor, das Feld "Einsatzort" übernimmt automatisch die Adresse des zugrundeliegenden Auftrags, kann jedoch über das Häkchen "Standort verwenden" auch auf einen alternativen Einsatzort umgestellt werden.

Auf Grundlage dieser Eingaben präsentiert die Anwendung im darunter liegenden Bereich eine sortierte Liste verfügbarer Geräte. Die Sortierung erfolgt standardmäßig kombiniert nach Verfügbarkeit und Entfernung zum Einsatzort. Diese Entfernungssortierung ist eine bewusst gewählte, über das Lastenheft hinausgehende Zusatzfunktion: Das Lastenheft verzichtet zwar explizit auf eine automatische Distanzberechnung; die kilometergenaue Anzeige hier basiert auf einer statischen, im Lager hinterlegten Grundstücksadresse und wird ausschließlich zur besseren Disposition angeboten. Beim praktischen Betrieb genügt daher eine einfache Adressvergleichslogik ohne Routing-Dienst. Jede Ergebnis-Karte zeigt die Bezeichnung und Gerätenummer des Geräts, das zugehörige Lager mit optionaler Entfernungsangabe in Kilometern sowie den konkreten Verfügbarkeitsstatus im angefragten Zeitraum. Vollständig verfügbare Geräte sind mit einer grünen Statuspille und einem Eintrag "Im Zeitraum frei: 100\%" gekennzeichnet, teilweise verfügbare Geräte zeigen eine bernsteinfarbene Pille mit Kurzangabe der freien und belegten Tage innerhalb des angefragten Zeitraums, defekte oder in Wartung befindliche Geräte werden mit einer roten Pille kenntlich gemacht und sind über ein deaktiviertes Auswahlfeld nicht buchbar. Das aktuell ausgewählte Gerät ist durch einen orangefarbenen Rahmen hervorgehoben.

Eine Hinweiszeile am unteren Rand des Ergebnisbereichs informiert den Anwender darüber, dass mit Abschluss der Buchung automatisch eine Buchungsnummer im Format "B-2026-XXXX" vergeben und das Gerät im Terminplaner für den gewählten Zeitraum gesperrt wird. In der Fußzeile des Dialogs stehen die Schaltflächen "Abbrechen", "Zurück" sowie die primäre Schaltfläche "Weiter zur Bestätigung", die den Anwender in den dritten und letzten Buchungsschritt führt.

#pagebreak()

== Terminplaner
Der Terminplaner (siehe @mockup_terminplaner) realisiert die im Lastenheft (LF 40) geforderte Terminverwaltung in Form einer kalendarischen Wochenansicht mit umschaltbarer Tages- und Monatsansicht. Er ist eines der am häufigsten geöffneten Werkzeuge der Anwendung und wurde daher mit besonderem Augenmerk auf Übersichtlichkeit und schnelle Erfassbarkeit ausgearbeitet.

#figure(
  image("../GUIMockUps/PNGs/Terminplaner.png", width: 100%),
  caption: [GUI-Ansicht Terminplaner mit Detailpanel]
) <mockup_terminplaner>

Die Kopfzeile zeigt den Titel der Ansicht zusammen mit der aktuell dargestellten Kalenderwoche ("KW 21 $dot.c$ 18.05. -- 24.05.2026"). Rechts daneben befindet sich ein dreistufiger Umschalter zur Wahl der Granularität (Tages-, Wochen- oder Monatsansicht) sowie zwei Pfeilschaltflächen zur Navigation in die Vergangenheit beziehungsweise Zukunft. Eine darunter liegende Filterzeile mit den Filtern "Mitarbeiter", "Kategorie" und "Auftrag" sowie einem Umschalter für die zusätzliche Anzeige von Geräte-Buchungen erlaubt die individuelle Anpassung der Kalenderansicht an den jeweiligen Informationsbedarf.

Den Hauptteil der Ansicht bildet das Wochenraster mit einer vertikalen Stundenachse von 06:00 Uhr bis 21:00 Uhr und sieben horizontal angeordneten Tagesspalten. Der aktuelle Tag (im dargestellten Beispiel der Donnerstag, 21. Mai 2026) ist durch eine orangefarbene Kennzeichnung der Spaltenbeschriftung sowie eine geringfügig hellere Hintergrundfarbe der gesamten Spalte visuell hervorgehoben. Termine werden als rechteckige, farbcodierte Blöcke innerhalb der Spalten platziert, wobei sich die vertikale Position und Höhe aus dem Beginn und der Dauer des Termins ableiten. Geräte-Buchungen werden ebenfalls als Kalendereinträge dargestellt, jedoch mit einem zusätzlichen Buchungssymbol versehen, sodass sie sich visuell von gewöhnlichen Terminen unterscheiden lassen.

Auf der rechten Seite der Ansicht wurde ein Detailpanel eingeblendet, das nach der Auswahl eines Termins dessen vollständige Informationen ohne Wechsel der Ansicht zugänglich macht. Im dargestellten Beispiel ist der Termin "Abnahme Tiefbau B36" ausgewählt; das Detailpanel zeigt zunächst den Titel und die zugehörige verlinkte Auftragsnummer ("Auftrag \#198241 -- Brückensanierung Pfeiler 2--4"). Es folgen die Eckdaten des Termins (Datum, Uhrzeit mit Dauer in Stunden und Minuten, Ort, beteiligtes Team mit Avataren) sowie ein Bemerkungsfeld mit kontextbezogenen Hinweisen ("Statiker (Herr Richter) kommt um 11:15. Vermessungsteam steht ab 12:00 bereit.") und eine Liste verknüpfter Buchungen. Die im Detailpanel verlinkten Buchungen führen unmittelbar in die zugehörige Buchungsdetailansicht.

Den unteren Abschluss des Detailpanels bilden drei Schaltflächen: "Löschen" (in zurückhaltender Darstellung, da destruktiv), "Bearbeiten" und die primäre Schaltfläche "Termin öffnen", die in eine Vollbilddarstellung des Termins führt.

#pagebreak()

== Mitarbeiterprofil und Gruppenzuordnung
Die letzte hier vorgestellte Ansicht (siehe @mockup_mitarbeiter) realisiert die im Lastenheft (LF 20) geforderte Mitarbeiter- und Gruppenverwaltung und veranschaulicht zugleich die für die Bauunternehmensorganisation typische n:m-Zuordnung zwischen Mitarbeitern und Gruppen.

#figure(
  image("../GUIMockUps/PNGs/Mitarbeiter.png", width: 100%),
  caption: [GUI-Ansicht Mitarbeiterprofil mit Gruppenzuordnung]
) <mockup_mitarbeiter>

Den oberen Teil der Ansicht bildet ein kompaktes Profilelement mit einem großformatigen Avatarsymbol, dem ausgeschriebenen Namen des Mitarbeiters ("Kevin Riedel"), seiner Mitarbeiternummer ("M-0188") und seiner Position ("Vorarbeiter") sowie dem Vertragsbeginn und der primären Gruppenzugehörigkeit. Direkt darunter sind die Stammdaten des Mitarbeiters in drei kompakten Pillen aufgelistet: Wohnadresse, Geburtsdatum und Beschäftigungsort. Eine zweite Zeile zeigt die Kontaktdaten -- E-Mail-Adresse und Telefonnummer -- sowie das Datum des Vertragsendes. Rechts oben befinden sich die Schaltflächen "Profil bearbeiten" und "Gruppe zuordnen"; letztere ist als primäre Aktion in Bauorange ausgeführt, da das Zuordnen weiterer Gruppenmitgliedschaften die häufigste Folgeaktion in dieser Ansicht darstellt.

Der Hauptbereich der Ansicht ist horizontal in zwei Spalten gegliedert. Auf der linken Seite sind in einer Karte "Gruppenzugehörigkeiten" die vier Gruppen aufgelistet, denen der Mitarbeiter aktuell angehört. Jede Gruppe ist durch eine eigene kompakte Karte repräsentiert; diese Karte enthält die Gruppenbezeichnung ("Baugruppe Nord"), die Gruppennummer ("G-12"), den Gruppentyp als farbcodierte Pille (Baugruppe in Grün, Bauleitung in Blau, Planung in Lila, Verwaltung in Grau) sowie weiterführende Angaben zur Gruppe (Anzahl Mitglieder, Name des Gruppenleiters und die Funktion des dargestellten Mitarbeiters innerhalb dieser Gruppe wie etwa "Vorarbeiter -- Stellvertreter" oder "Mitglied"). Diese Mehrfachzugehörigkeit eines einzelnen Mitarbeiters zu mehreren Gruppen unterschiedlichen Typs realisiert die im Lastenheft (LF 20) geforderte n:m-Beziehung zwischen Mitarbeitern und Gruppen, sodass ein Mitarbeiter etwa gleichzeitig in einer Baugruppe operativ tätig sein und einer übergeordneten Bauleitung angehören kann.

Auf der rechten Seite befindet sich die Karte "Verfügbare Gruppen", die den Zuordnungsprozess unterstützt. Sie listet sämtliche Gruppen auf, denen der Mitarbeiter noch nicht angehört, und ermöglicht über Suchfeld und Filter eine schnelle Eingrenzung großer Gruppenbestände. Die Auswahl erfolgt über einfache Auswahlkästchen am rechten Zeilenende. Sobald mindestens eine Gruppe selektiert ist, wird die Schaltfläche "1 Gruppe hinzufügen" am unteren Rand der Karte aktiviert, deren Beschriftung sich dynamisch an die Anzahl der ausgewählten Gruppen anpasst.

Die hier visualisierte Zuordnungslogik bildet die Grundlage für eine Vielzahl weiterer Funktionen der Anwendung -- etwa die rollenspezifische Filterung von Aufträgen, die zielgerichtete Zuteilung von Anwesenheitspflichten oder die Bestimmung des Gruppenleiters bei eskalierenden Vorgängen. Sie ist damit nicht nur Selbstzweck, sondern verbindendes Element zwischen der Personalverwaltung und sämtlichen weiteren Anwendungsbereichen.

#pagebreak()

== Nicht skizzierte Ansichten
Über die acht ausführlich vorgestellten Ansichten hinaus existieren in der Anwendung weitere Bildschirmmasken, die aus Platzgründen nicht als eigenständige Mockups dargestellt wurden. Sie folgen jedoch ausnahmslos den im vorliegenden Kapitel beschriebenen Gestaltungsprinzipien und lassen sich daher konzeptionell aus den vorhandenen Mockups ableiten. Hierzu zählen:

- *Lagerverwaltung*: Strukturell analog zur Geräte- und Maschinenverwaltung, jedoch mit Lagern statt Geräten als zu verwaltenden Hauptobjekten. Eine kartografische Darstellung der Lagerstandorte ist vorgesehen, da die im Lastenheft (LF 50) geforderte Standortsuche eine räumliche Übersicht über alle Lager voraussetzt.
- *Anwesenheitszeiten*: Tabellarische Auflistung der Anwesenheitseinträge je Mitarbeiter, gruppierbar nach Tag, Woche oder Monat. Die Erfassung erfolgt -- abgesehen von administrativen Korrekturen -- automatisch durch den nächtlichen Import der Stempelkartendaten und realisiert damit die im Lastenheft (LF 90) geforderte Anwesenheitsverwaltung.
- *Bilder- und Dokumentenkatalog*: Galerieansicht des unternehmensweiten Bildbestands mit Möglichkeit zur Suche nach Titel, Hochladedatum und zugeordnetem Element. Diese zentrale Bibliothek ergänzt die im Lastenheft (LF 80) geforderte elementbezogene Bildhinterlegung um eine übergreifende Verwaltungssicht.
- *Globale Suche und Suchmasken*: Eine über die Topbar erreichbare Volltextsuche, die auf sämtliche Hauptentitäten der Anwendung (Aufträge, Projekte, Mitarbeiter, Geräte, Lager, Buchungen) zugreift und die Ergebnisse gruppiert nach Entitätstyp darstellt. Ergänzend stehen entitätsspezifische Suchmasken in den jeweiligen Verwaltungsansichten zur Verfügung; beide Mechanismen erfüllen gemeinsam die im Lastenheft (LF 60) geforderte Suchfunktionalität.
- *Einstellungen und Konfigurationsverwaltung*: Anpassbare Anwendungseinstellungen zur Erfüllung der im Lastenheft (LF 10) geforderten Konfigurierbarkeit. Hier kann unter anderem die Sprache, das Farbthema und die Standardansicht beim Programmstart festgelegt werden.
- *Administrationsbereich*: Ausschließlich für den Administrator zugänglich, mit Funktionen für Datenimport und -export, Backup-Erstellung sowie Rollenvergabe.

== Diskussion und Reflexion
Die vorgestellten Mockups verfolgen durchgängig drei übergeordnete Ziele: hohe Informationsdichte ohne visuelle Überfrachtung, konsistente Gestaltung über alle Ansichten hinweg und eine bewusste Reduktion auf die im Arbeitsalltag tatsächlich benötigten Funktionen. Diese drei Ziele stehen in einem Spannungsverhältnis zueinander, das je nach Ansicht unterschiedlich aufgelöst wurde: Während das Dashboard auf maximale Verdichtung der relevanten Tagesinformationen setzt, präsentiert die Detailansicht eines Auftrags die zugrundeliegenden Daten in deutlich entzerrter Form und nimmt dafür eine größere vertikale Ausdehnung in Kauf.

Eine bewusste gestalterische Entscheidung war die durchgängige Verwendung kartenbasierter Layouts anstelle klassischer Tabellenansichten. Karten erlauben eine reichhaltigere Darstellung pro Eintrag (etwa durch Vorschaubilder, Avatarstapel oder eingebettete Statusinformationen) und sind zugleich besser für eine spätere Adaption an mobile Endgeräte geeignet, sollte das im Lastenheft erwähnte Tablet-Projekt in einem späteren Auftrag tatsächlich realisiert werden. Demgegenüber sind klassische Tabellen bei sehr großen Datenmengen häufig effizienter scanbar; aus diesem Grund wurde für die filterbare Anzeige der laufenden Aufträge im unteren Bereich des Dashboards bewusst eine Tabellendarstellung beibehalten.

Eine offen gehaltene Designentscheidung betrifft die Behandlung administrativer Funktionen wie Datenimport, -export und Berichtserstellung. Die Mockups zeigen diese Funktionen aus Gründen der Übersichtlichkeit als jeweils sichtbare Schaltflächen; im produktiven Einsatz werden sie über die im Klassendiagramm modellierte Klasse `Rolle` ausgeblendet, sobald der angemeldete Mitarbeiter nicht über die entsprechenden Rechte verfügt. Eine alternative Lösung -- die Auslagerung sämtlicher administrativer Funktionen in einen eigenen Administrationsbereich -- wurde verworfen, da hierdurch häufige Wechsel zwischen Bereichen erforderlich würden und die Anwendung als Ganzes weniger zusammenhängend wirken würde.

Insgesamt zeigen die Mockups, dass sich sämtliche im Lastenheft formulierten funktionalen Anforderungen durch eine schlanke, modern gestaltete Benutzungsoberfläche abbilden lassen, ohne dass hierfür auf Funktionalität verzichtet werden müsste. Die durchgängige Wiederverwendung gestalterischer Bausteine -- Seitenleiste, Topbar, Statuspillen, Karten -- reduziert sowohl den Implementierungsaufwand als auch die Einarbeitungszeit der Anwender und erfüllt damit die im Lastenheft formulierte Anforderung an eine sehr gute Benutzbarkeit der Anwendung.
