= GUI-Modellierung mit MVC

== Einleitung und Wahl der Maske

Im Anschluss an die in Abschnitt 3.3 vorgestellten GUI-Mockups wird in diesem Kapitel das Zusammenspiel der Oberflächenelemente mit der Geschäftslogik formal modelliert. Dabei kommt das Modell-View-Controller-Muster (MVC) zum Einsatz, das Datenhaltung, Darstellung und Steuerlogik strikt trennt. Da eine Modellierung sämtlicher Masken den Rahmen sprengen würde, wird das MVC-Kommunikationsschema exemplarisch für eine repräsentative Maske ausgearbeitet.

Als Modellierungsbeispiel wurde die in Kapitel 5 vorgestellte Auftragsübersicht ausgewählt. Diese Maske eignet sich aus mehreren Gründen besonders für die exemplarische Darstellung des MVC-Schemas: Sie bündelt eine besonders große Bandbreite an Bedienelementen (Texteingabe, Auswahllisten, Karteireiter, Tabellenansicht, Schaltflächen und Statusanzeigen), sie ist datenintensiv und beruht auf einer stetigen Synchronisation zwischen Eingabe und gefilterter Trefferliste, und sie deckt unmittelbar mehrere Funktionalanforderungen aus dem Lastenheft ab (LF 10 hinsichtlich Bedienbarkeit, LF 30 hinsichtlich Auftragsdaten, LF 60 hinsichtlich Suchmasken sowie LF 70 hinsichtlich durchsuchbarer Auswahllisten). Gleichzeitig erlaubt sie eine anschauliche Demonstration des Beobachter-Musters, das im weiteren Verlauf dieses Kapitels eine zentrale Rolle einnimmt.

Zur Reduktion der Komplexität wird das MVC-Kommunikationsschema in einem eigenen Klassendiagramm modelliert und nicht in das spätere Entwurfsklassendiagramm integriert. Dieses Vorgehen entspricht der Vorgehensweise, die in den als Referenz herangezogenen Programmentwürfen vorhergehender Studienjahrgänge bewährt ist, und stellt sicher, dass weder das Entwurfsklassendiagramm noch das hier vorgestellte Kommunikationsschema durch eine doppelte Modellierungstiefe an Übersichtlichkeit verliert.

== Aufbau der GUI: Java-Swing-Komponenten

Bevor das Kommunikationsschema selbst betrachtet wird, soll zunächst ein konkreter Bezug zwischen den im Mockup gezeigten visuellen Bestandteilen und den im Entwurf tatsächlich verwendbaren Bauteilen der Java-Swing-Bibliothek hergestellt werden. Hierzu wurde ein zweites Mockup der Auftragsübersicht erstellt (siehe @fig:mvc-komponentenmapping), in dem sämtliche relevanten Bedienelemente mit ihrer korrespondierenden Java-Swing-Klasse beschriftet sind.

#figure(
  image("../GUIMockUps/PNGs/AufträgeÜbersichtJavaSwing.png", width: 100%),
  caption: [Mapping der Auftragsübersicht auf Java-Swing-Komponenten]
) <fig:mvc-komponentenmapping>

Das den gesamten Bildschirm umschließende Hauptfenster wird durch ein `JFrame` realisiert. Innerhalb dieses Fensters strukturieren mehrere `JPanel` den verfügbaren Platz in funktional zusammengehörige Bereiche -- die linke Seitenleiste, den Kopfbereich der Maske, die Filterzeile sowie die eigentliche Ergebnisliste. Die Menüpunkte der Seitenleiste sind als `JToggleButton` ausgeführt, da sie zwei Zustände kennen und der jeweils aktive Menüpunkt visuell hervorgehoben werden muss; die zugehörige Markenkennzeichnung ("BauOS") und die Trennbeschriftungen erscheinen als `JLabel`.

Im Hauptbereich der Maske dient ein `JTabbedPane` der Umschaltung zwischen den laufenden und den abgeschlossenen Aufträgen. Die rechts oben platzierten Aktionsschaltflächen ("Importieren", "Exportieren CSV", "Neuen Auftrag anlegen") werden durch reguläre `JButton` realisiert. Die Filterzeile setzt sich aus einem `JTextField` für die Volltextsuche sowie mehreren `JComboBox`-Elementen für die Filter "Status", "Datum" und "Sortieren" zusammen.

Die Ergebnisliste wird als `JTable` in einem `JScrollPane` modelliert, was die großen Datenmengen (Produktleistungen) handhabbar macht. Die kartenbasierte Mockup-Darstellung ließe sich technisch über einen eigenen `TableCellRenderer` erreichen; für das Kommunikationsschema wurde jedoch die kanonische `JTable`-Variante gewählt, da sie die Beobachter-Anbindung an `AbstractTableModel` direkt nutzt. Ergänzend zeigt jede Zeile einen `JProgressBar` sowie Symbol-`JButton`s; Profilanzeigen und Nummern in der Topbar sind `JLabel`.

Die bewusste Diskrepanz zwischen Mockup (moderne Designsprache) und Entwurfsmodell (tatsächliche Java-Swing-Bausteine) dient der klaren Aufteilung zwischen den Kapiteln: Die Mockups vermitteln das Bedienkonzept, das Klassendiagramm die real verfügbaren Komponenten.

== Kommunikationsschema

Das Kommunikationsschema (siehe @fig:mvc-kommunikation) beschreibt das Zusammenspiel der drei MVC-Schichten -- View, Controller, Model -- sowie eines zusätzlichen Event-Pakets, das die Schichten über schmale, fachlich benannte Schnittstellen entkoppelt. Die vier Pakete sind farblich getrennt und dem Datenfluss folgend vertikal gestapelt (View, Event, Controller, Model). Die Java-Swing-Komponenten erscheinen im View-Paket als `<<external>>`-Klassen, getrennt in beerbte Klassen (`JFrame`, `JPanel`, `JTable`, `AbstractTableModel`) und lediglich zur Komposition genutzte Komponenten. Die Beziehungstypen sind farblich kodiert (Legende im Diagramm).

#pagebreak(weak: true)

#figure(
  image("../assets/MVC/Kommunikationsschema_Auftraege.png", width: 100%, height: 90%, fit: "contain"),
  caption: [Kommunikationsschema MVC am Beispiel der Auftragsübersicht]
) <fig:mvc-kommunikation>

#pagebreak(weak: true)

=== View-Paket

Das View-Paket enthält fünf eigene Klassen, die jeweils einen abgegrenzten Bestandteil der Auftragsübersicht repräsentieren. Die Klasse `MainFrame` realisiert das Hauptfenster der Anwendung und erbt von `JFrame`. Sie aggregiert per Komposition die Klasse `Sidebar`, die die linke Seitenleiste verwaltet, sowie die Klasse `AufträgeÜbersichtPanel`, die als Container für die eigentliche Maske dient. Letztere setzt sich wiederum aus zwei spezialisierten Unter-Panels zusammen: der `SuchleisteView`, die die Filterzeile mit `JTextField`, `JComboBox` und `JTabbedPane` einschließt, sowie der `AuftragsTabelleView`, die die Ergebnistabelle bereitstellt und ihrerseits von `JTable` erbt.

Sämtliche View-Klassen sind bewusst als reine Darstellungsschicht modelliert. Sie kennen weder die Datenbasis noch konkrete Controller-Klassen, sondern kommunizieren ausschließlich über die im Event-Paket definierten Listener-Schnittstellen. Hierdurch lässt sich die Darstellung jederzeit gegen eine alternative Implementierung austauschen, ohne dass Änderungen an der Geschäftslogik erforderlich werden. Die Klasse `AufträgeÜbersichtPanel` realisiert zusätzlich die Schnittstelle `IUpdateEventListener` und kann dadurch unmittelbar auf Datenänderungen reagieren -- ein zentrales Element des in diesem Schema verwendeten Beobachter-Musters.

=== Controller-Paket

Das Controller-Paket bündelt die Steuerlogik der Anwendung in drei Klassen. Die zentrale Klasse `GUIController` ist mit dem Stereotyp `<<singleton>>` versehen, da im gesamten System exakt eine Steuerinstanz existieren darf, die als Bindeglied zwischen sämtlichen Views und der Datenbasis fungiert. Sie realisiert die Schnittstellen `IFilterListener` und `IAuftragSelectionListener` und stellt damit gegenüber den View-Klassen eindeutige Eintrittspunkte für Benutzeraktionen bereit. Über die Methoden `onFilterChanged` und `onAuftragSelected` werden die im Kommunikationsschema modellierten Interaktionen der Auftragsübersicht entgegengenommen und in entsprechende Folgeaufrufe an die Geschäftslogik übersetzt. Das Anlegen eines neuen Auftrags wird bewusst nicht als eigene Controller-Methode `onNeuerAuftrag` im MVC-Klassendiagramm ausgewiesen, sondern über den regulären Schaltflächen-Weg -- Öffnen des in Abschnitt 5.4 dokumentierten modalen Anlegedialogs -- angestoßen, sodass das Kommunikationsschema auf die Interaktionen der Auftragsübersicht selbst fokussiert bleibt.

Für die fachspezifische Verarbeitung der Auftragsübersicht ist die Klasse `AufträgeController` zuständig, die vom `GUIController` per Komposition gehalten wird. Sie kapselt die Logik zur Filterung der Aufträge in der Methode `ladeAufträge`, in der die aktuell gewählten `FilterCriteria` an die Datenbasis weitergereicht und das Ergebnis anschließend an das `AuftragsTableModel` übergeben wird. Diese dritte Klasse ist als Adapter zwischen Model und View einzuordnen: Sie erbt technisch von der Java-Swing-eigenen Klasse `AbstractTableModel` und stellt damit die direkte Anbindung an die `JTable` der `AuftragsTabelleView` her; gleichzeitig hält sie den Ausschnitt an `Arbeitsauftrag`-Objekten, den die aktuelle Filtersicht anzeigt. Die Zuordnung zum Controller-Paket ist deshalb weniger eine strikt architektonische Aussage als vielmehr eine paketpraktische Bündelung mit den übrigen Controller-Klassen; aus MVC-Sicht ließe sich `AuftragsTableModel` ebenso als View-Model-Adapter im Modellumfeld einordnen. Auf diese Weise wird der bereits in Java-Swing etablierte Listener-Mechanismus zwischen Tabellenmodell und Tabellenansicht genutzt; die `JTable` registriert sich automatisch beim Tabellenmodell und reagiert auf das beim `setData`-Aufruf ausgelöste `TableModelEvent`.

=== Model-Paket

Das Model-Paket bildet einen Ausschnitt der späteren Datenhaltung ab und enthält drei Klassen, die für die exemplarische Modellierung der Auftragsübersicht ausreichen. Die Klasse `Datenbasis` ist als `<<singleton>>` modelliert, da die Verwaltungssoftware laut Lastenheftforderung LD 10 über genau eine zentrale Datenbasis verfügt. Sie aggregiert sämtliche `Arbeitsauftrag`-Instanzen, deren Klasse aus dem Analyse-Klassendiagramm (siehe Kapitel 4) übernommen wurde. Im Diagramm sind hier nur die für die Auftragsübersicht relevanten Attribute (etwa Auftragsnummer, Bezeichnung, Status vom Enumerationstyp `AuftragStatus`, Start-/Endtermin) ausgewiesen, um Redundanz zur ausführlichen Darstellung in Kapitel 4 zu vermeiden; die vollständige Attributmenge sowie die Vererbungsbeziehung zur abstrakten Klasse `Auftrag` sind im Entwurfsklassendiagramm (siehe Kapitel 9) verbindlich festgeschrieben, und die hier gezeigte reduzierte Sicht ist ausdrücklich damit konsistent zu verstehen.

Eine zentrale Erweiterung gegenüber dem Analyse-Klassendiagramm stellt die Realisation der Schnittstelle `IUpdateEventSender` durch die `Datenbasis` dar; im Klassendiagramm ist diese Realisierungsbeziehung durch die gestrichelte Linie mit Dreieckspitze zwischen `Datenbasis` und `IUpdateEventSender` gekennzeichnet. Über die Methoden `register`, `unregister` und `fireUpdate` können sich beliebige Komponenten der Anwendung als Beobachter bei der Datenbasis anmelden und werden bei Datenänderungen automatisch benachrichtigt, ohne dass die Datenbasis ihrerseits konkrete View-Klassen kennt. Die ebenfalls im Model-Paket angesiedelte Hilfsklasse `FilterCriteria` ist mit dem Stereotyp `<<datatype>>` versehen und kapselt die im Suchformular eingegebenen Filterparameter (Volltextsuche, Status, Datumsbereich, Reiterauswahl, Sortierung) in einem einzigen Wertobjekt, das zwischen den Schichten weitergereicht werden kann.

=== Event-Paket

Das Event-Paket ist die zentrale strukturelle Eigenheit dieses Kommunikationsschemas. Es enthält ausschließlich Schnittstellen und schmale Datentypklassen und entkoppelt die View-Schicht vollständig von der Controller-Schicht sowie die Model-Schicht von der View-Schicht. Vier Schnittstellen werden definiert: `IFilterListener` für die Übermittlung von Filteränderungen aus der Suchleiste an den Controller, `IAuftragSelectionListener` für die Auswahl einer Tabellenzeile, `IUpdateEventListener` für die Benachrichtigung von Datenänderungen aus dem Model in die View und `IUpdateEventSender` als Gegenstück, das die `Datenbasis` realisiert.

Die Verwendung eigener fachlich benannter Schnittstellen anstelle der direkten Verwendung von Java-Swing-Listenern wie `ActionListener` oder `DocumentListener` wurde bewusst gewählt. Sie verbessert die Lesbarkeit der Aufrufe gegenüber generischen Methodennamen wie `actionPerformed`, vermeidet Typprüfungen auf das auslösende Ereignisobjekt zur Laufzeit und ermöglicht eine deutlich vereinfachte Testbarkeit der Controller-Klassen, da Mock-Implementierungen der Schnittstellen ohne Bezug auf die konkrete Java-Swing-Bibliothek erstellt werden können. Die schmalen Datentypklassen `FilterChangedEvent` und `UpdateEvent` dienen als Träger der jeweiligen Ereignisinformationen.

=== Nachrichtenfluss am Beispiel "Aufträge suchen und filtern"

Der Nachrichtenfluss bei einer Filteränderung lässt sich entlang der im Klassendiagramm eingezeichneten Pfeile in acht aufeinanderfolgenden Schritten nachvollziehen. Im Folgenden wird der Ablauf am Beispiel einer Volltextsuche beschrieben.

+ Der Benutzer ändert den Inhalt des `JTextField` in der Suchleiste, wählt einen anderen Wert in einer der Filter-`JComboBox` oder klickt auf einen anderen Reiter des `JTabbedPane`. Die Java-Swing-Bibliothek erzeugt daraufhin ein `DocumentEvent`, `ActionEvent` bzw. `ChangeEvent`.
+ Innerhalb der Klasse `SuchleisteView` ist für jedes dieser Bedienelemente ein anonymer Java-Swing-Listener registriert, der das auslösende Ereignis aufnimmt, die übrigen aktuellen Filterwerte aus den Komponenten ausliest und sie zu einem `FilterCriteria`-Wertobjekt zusammenführt.
+ Das so aufgebaute `FilterCriteria` wird in ein `FilterChangedEvent` verpackt und über die Methode `onFilterChanged` an alle registrierten `IFilterListener` weitergeleitet. Im vorliegenden Aufbau ist genau eine Instanz registriert, nämlich der `GUIController`.
+ Der `GUIController` delegiert den Aufruf direkt an die spezialisierte Klasse `AufträgeController`, die mittels der Methode `ladeAufträge` die eigentliche Filterlogik anstößt.
+ Innerhalb von `ladeAufträge` wird die Methode `findAufträge` der `Datenbasis` aufgerufen, der das `FilterCriteria`-Objekt übergeben wird. Die `Datenbasis` durchläuft ihren internen Bestand an `Arbeitsauftrag`-Instanzen und liefert eine entsprechend gefilterte Liste zurück.
+ Die zurückgelieferte Liste wird durch den `AufträgeController` an das `AuftragsTableModel` weitergegeben, das die Methode `setData` aufruft. Über das daraufhin erzeugte `TableModelEvent` benachrichtigt das Modell die `JTable` der `AuftragsTabelleView` -- dies entspricht dem nativen, in Java-Swing eingebauten Beobachter-Mechanismus für Tabellendaten.
+ Parallel dazu ruft die `Datenbasis` ihre eigene Methode `fireUpdate` auf und benachrichtigt sämtliche bei ihr registrierten `IUpdateEventListener` über das eingetretene Datenupdate. Auf diese Weise wird beispielsweise das übergeordnete `AufträgeÜbersichtPanel`, das die Trefferanzahl in einem `JLabel` ausweist, sowie die `Sidebar` mit ihrer Auftragszählung über die Aktualisierung informiert -- ohne dass die Datenbasis ihrerseits Kenntnis dieser konkreten Sichten besitzt.
+ Jede betroffene View aktualisiert in ihrer Methode `onDataUpdated` ihre Darstellung. Die Maske ist nun konsistent mit dem aktuellen Filterzustand: Die Tabelle zeigt die getroffenen Aufträge, die Statuszeile gibt deren Anzahl wieder und die Sidebar spiegelt die aktualisierten Kennzahlen.

Bemerkenswert ist hierbei, dass innerhalb dieses Ablaufs zwei voneinander unabhängige Beobachter-Pfade aktiv sind: Der erste Pfad nutzt die nativen Java-Swing-Mechanismen zwischen `AbstractTableModel` und `JTable`, der zweite Pfad verwendet die selbst definierten Schnittstellen aus dem Event-Paket. Diese bewusste Trennung wird im folgenden Abschnitt "Reflexion und Designentscheidungen" reflektiert.

== Reflexion und Designentscheidungen

Drei Entscheidungen prägen das Kommunikationsschema:

Erstens wurde die Trennung zwischen Mockup-Designsprache und Java-Swing-Modellierung beibehalten: Da Java-Swing visuell hinter modernen Webanwendungen zurückbleibt, sind die Mockups als Designziel zu verstehen (ggf. über Bibliotheken wie _FlatLaf_ erreichbar), während das Klassendiagramm bei den Standardklassen aus `javax.swing` bleibt, die die geforderte Plattformunabhängigkeit sichern.

Zweitens wurden zwei Beobachter-Pfade nebeneinander modelliert: der native Java-Swing-Pfad zwischen `AbstractTableModel` und `JTable` (auf genau eine Tabelle und einen Empfänger zugeschnitten) und der eigene Pfad über `IUpdateEventListener`, der beliebig viele heterogene Empfänger (Statuszeile, Seitenleiste, künftige Dashboard-Kacheln) mit einheitlicher Ereignis-Semantik bedient. Die hybride Lösung nutzt den etablierten Swing-Mechanismus, ohne die übrigen Komponenten zu umständlicher Ableitung aus Tabellenereignissen zu zwingen.

Drittens wurde für View↔Controller bewusst auf eigene Listener-Schnittstellen wie `IFilterListener` gesetzt (Begründung im Abschnitt "Event-Paket"): Das wahrt die MVC-Schichtentrennung, ohne vorhandene Swing-Mechanismen zu duplizieren.

Im Gesamtbild zeigt sich, dass das Beobachter-Muster (in Form der vier Listener-Schnittstellen im Event-Paket) sowie das Singleton-Muster (in Form der Klassen `GUIController` und `Datenbasis`) in dieser Modellierung tragende Rollen einnehmen. Die ausführliche Würdigung dieser und weiterer Entwurfsmuster erfolgt in Kapitel 9 (Entwurfsklassendiagramm der Gesamtanwendung); das vorliegende Kapitel beschränkt sich bewusst auf die Modellierung der GUI-Kommunikation für eine einzelne, repräsentative Maske und stellt damit die gemäß Aufgabenstellung 3.3 geforderte UML-Modellierung der GUI mit MVC-Muster bereit.
