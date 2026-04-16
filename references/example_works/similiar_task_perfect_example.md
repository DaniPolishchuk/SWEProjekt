**==> picture [116 x 49] intentionally omitted <==**

## Software Engineering I 

## Programmentwurf TINF23B1 

3./4. Semester (2024/2025) 

## **Thema: Verwaltungssoftware für Handwerksbetriebe** 

## Studiengang Informatik 

Duale Hochschule Baden-Württemberg Karlsruhe 

Dr.-Ing. R. Lutz 

Institut für Automation und angewandte Informatik (IAI) Karlsruher Institut für Technologie (KIT) 

Bearbeitet von 

Carolin Strahl und Lisa Engel 

Inhalt 

i 

## **Inhalt** 

|**1 **|**Aufgabenstellung**<br>**1**|**Aufgabenstellung**<br>**1**|
|---|---|---|
||1.1|Einleitung  . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .  1|
||1.2|Lastenhef  . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .  1|
|||1.2.1 Zielsetzung  . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .  1|
|||1.2.2 Anwendungsbereich  . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .  2|
|||1.2.3 Zielgruppen, Benutzerollen und Verantwortlichkeiten  . . . . . . . . . . . . . . . . . .  2|
|||1.2.4 Zusammenspiel mit anderen Systemen  . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .  2|
|||1.2.5 Produktfunktionen  . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .  3|
|||1.2.6 Produktdaten  . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .  4|
|||1.2.7 Produktleistungen  . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .  4|
|||1.2.8 Qualitätsanforderungen  . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .  4|
||1.3|Aufgaben  . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .  5|
|||1.3.1 Analyse  . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .  5|
|||1.3.2 Sequenzdiagramm und Aktivitätsdiagramm  . . . . . . . . . . . . . . . . . . . . . . . . . . . . .  5|
|||1.3.3 Entwurf  . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .  6|
|||1.3.4 Implementierung  . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .  6|
||1.4|Vereinfachungen für den Programmentwurf  . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .  6|
|**2 **|**Analyse des Lastenhefs**<br>**7**||
||2.1|Einleitung  . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .  7|
||2.2|Lastenhef  . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .  12|
|||2.2.1 Zielsetzung  . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .  12|
|||2.2.2 Anwendungsbereich  . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .  14|
|||2.2.3 Zielgruppen, Benutzerollen und Verantwortlichkeiten  . . . . . . . . . . . . . . . . .  14|
|||2.2.4 Zusammenspiel mit anderen Systemen  . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .  16|
|||2.2.5 Produktfunktionen  . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .  20|
|||2.2.6 Produktdaten  . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .  43|
|||2.2.7 Produktleistungen  . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .  43|
|||2.2.8 Qualitätsanforderungen  . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .  44|
|**3 **|**Analyse**<br>**45**||
||3.1|Use-Case-Diagramm  . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .  45|
|||3.1.1 Rollen-Erläuterung der Anwendung  . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .  45|
||3.2|Use-Case Diagramm der gesamten Anwendung  . . . . . . . . . . . . . . . . . . . . . . . . . . . . .  47|
||3.3|Verfeinerung „Termin verwalten“  . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .  49|
||3.4|Analyseklassendiagramm  . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .  51|



1 

|Inhalt<br>ii|Inhalt<br>ii|
|---|---|
||3.4.1 Analysemuster  . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .  52|
|3.5|GUI-Mockups  . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .  59|
||3.5.1 Dashboard Ansicht  . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .  60|
||3.5.2 Kalender Ansicht  . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .  61|
||3.5.3 Suchen nach Kundenaufrägen  . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .  63|
|**4 Sequenzdiagramm**<br>**65**||
|4.1|Sequenzdiagramm: Aufrag durchführen  . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .  67|
||4.1.1 Unterprogramm: Objekt anlegen  . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .  69|
||4.1.2 Unterprogramm: Zahlvorgang abschließen  . . . . . . . . . . . . . . . . . . . . . . . . . . . . .  71|
||4.1.3 Unterprogramm: Zahlung prüfen  . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .  72|
||4.1.4 Unterprogramm: Status setzen  . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .  73|
|4.2|Pseudocode: Aufrag durchführen  . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .  74|
|**5 Aktivitätsdiagramm**<br>**78**||
|5.1|Aktivitätsdiagramm: Materialbestellungen durchführen  . . . . . . . . . . . . . . . . . . . . .  79|
|5.2|Pseudocode: Materialbestellungen durchführen  . . . . . . . . . . . . . . . . . . . . . . . . . . . . .  82|
|**6 Entwurf**<br>**86**||
|6.1|Entwurfsklassendiagramm  . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .  86|
||6.1.1 Packages  . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .  87|
||6.1.2 Verwendete Entwurfsmuster  . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .  90|
|6.2|GUI Modellierung  . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .  91|
||6.2.1 Aufbau GUI-Beispiel: Suchen nach Kundenaufrägen  . . . . . . . . . . . . . . . . . .  91|
||6.2.2 Kommunikationsschema  . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .  92|
|**7 Besonderheiten**<br>**95**||
|7.1|Allgemeinheit  . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .  95|
|7.2|Technische Expertise  . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .  95|
|7.3|Wartung  . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .  95|
|7.4|Auswahllisten  . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .  96|
|7.5|Finanzbuchhaltungssystem  . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .  96|
|7.6|Termine  . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .  96|
|7.7|UI-orientierte Modellierung  . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .  96|
|7.8|Abdeckung zahlreicher Eventualitäten  . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .  97|
|7.9|Mockups  . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .  97|
|7.10|Rechtschreibung und Grammatik  . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .  97|



0 

Aufgabenstellung 

1 

## **1 Aufgabenstellung** 

## **1.1 Einleitung** 

Wir – die **HWSoft Vertriebs-GmbH** – bieten Handwerksbetrieben aller Größen und Fachrichtungen maßgeschneiderte Softwarewerkzeuge an, um deren Verwaltung zu vereinfachen und zu beschleunigen. 

Unsere bisherige Softwarelösung bietet mehrere separate Applikationen speziell für Installateure, Heizungsbauer, Dachdecker und Bäckereien an. Hierfür ist die Wartung und Weiterentwicklung der einzelnen Softwarewerkzeuge nun zu aufwendig geworden. 

Um jedoch alle weiteren denkbaren Handwerksbetriebe ansprechen zu können und da sich die o.g. Softwarelösungen doch recht ähnlich sind, bietet es sich an, eine neue VerwaltungsSoftware für Handwerksbetriebe erstellen zu lassen, die eine gemeinsame Basis hat und die bestenfalls für einzelne Spezialisierungen über Plugins o.ä. erweitert werden kann. 

Dabei soll es sich um ein Desktopsystem handeln, bei dem jeder Arbeitsplatz im Büro auf eine gemeinsame Datenbasis zugreift. 

Für Betriebe, welche beim Kunden vor Ort auf ihre Daten zugreifen wollen und/oder müssen, wollen wir zusätzlich angepasste Web-Applikationen anbieten, die auf Tablets oder Handys laufen können. Aus Datenschutz- und Sicherheitsgründen erfolgt der Zugriff nur auf explizit freigegebene Teile der Daten. Hierzu müssen die ausgewählten Daten im Internet für die Mitarbeiter geeignet bereitgestellt werden. 

Da die Verwaltung eines Handwerksbetriebs meist durch wenige Personen erfolgt, die meist keine oder geringe Computerkenntnisse besitzen, ist eine intuitive und leicht erlern- und bedienbare grafische Benutzeroberfläche zwingend erforderlich. 

## **1.2 Lastenheft** 

## **1.2.1 Zielsetzung** 

Ziel dieser Entwicklung soll eine Software für die Verwaltung von Handwerksbetrieben sein. Es sollen auf einfache Weise Kunden-, Termin-, Material-, Auftrags-, Geräte- und Personaldaten sowie Angebote und Rechnungen mittels einer grafischen Benutzeroberfläche angelegt, gesucht, geändert, importiert und exportiert werden können. Darüber hinaus sollen Bestellungen und Lieferungen von und an andere Firmen verwaltet werden können. Eine zentrale Datenhaltung sowie ein Mehrbenutzersystem müssen realisiert werden. 

1 

Aufgabenstellung 

2 

## **1.2.2 Anwendungsbereich** 

Die Software wird für die Verwaltung von Daten von Handwerksbetrieben eingesetzt. 

## **1.2.3 Zielgruppen, Benutzerollen und Verantwortlichkeiten** 

Zur Zielgruppe zählen alle bei einem Handwerksbetrieb beschäftigten Mitarbeiter, die für die Erfassung und Verwaltung der Daten angestellt sind. 

- Das kaufmännische Personal soll den Vollzugriff auf die Betriebsdaten (Personal, Termine, Kunden, Angebote, Rechnungen, Firmen, usw.) erhalten. 

- Ein Administrator soll sämtliche Daten anlegen, ändern, löschen, exportieren und importieren können. Hierzu gehört auch der selektive Import und Export von Daten 

- Vorgesetzte (z.B. Gruppen- und Abteilungsleiter) sollen lesenden Zugriff auf alle Gerätschaften bzw. Anlagen haben. 

- Ausgewählte Mitarbeiter sollen lesenden Zugriff auf Bestands- und Verfügbarkeitsdaten von Materialien und Werkzeugen haben. 

Es sollen keine besonderen Computerkenntnisse zur Bedienung der Software erforderlich sein. 

## **1.2.4 Zusammenspiel mit anderen Systemen** 

Das zu entwickelnde Softwaresystem soll aus Sicherheitsgründen ohne Netzverbindung nach Außen lauffähig sein. Mehrere Drucker sollen für die Erstellung der Rechnungen und Angebote angeschlossen sein. 

Damit ein Kunde mit EC- oder Kreditkarte zahlen kann, soll ein Kartenleser angeschlossen werden können. Die Schnittstelle zum Lesegerät muss untersucht werden. Die finanztechnischen Daten der Mitarbeiter (Gehälter bzw. Löhne) werden separat durch unser eigenes Finanzbuchhaltungsprogramm **FiBuSys** verwaltet. Das System soll geeignet in das Gesamtsystem integriert werden. 

In einem weiterführenden Projekt sollen ausgewählte Daten über ein Tablet oder ein Handy direkt vor Ort verwaltet werden können. Das erhöht die Flexibilität der Betriebe bzw. deren Mitarbeiter. Das „Tablet-Projekt“ selbst ist nicht direkter Bestandteil des vorliegenden Entwicklungsauftrags, sondern ein Folgeauftrag. Es sollen jedoch vorbereitende Arbeiten und konkrete Vorschläge zur Realisierung (GUI, Schnittstellen, Architektur) gemacht werden. Für Kunden, die bereits unser aktuelles System gekauft haben, sollen die erstellten Daten direkt in das neue System übernommen werden können. 

2 

Aufgabenstellung 

3 

## **1.2.5 Produktfunktionen** 

|/LF10/|Der jeweilige Benutzer muss die Möglichkeit haben, über eine grafsche Benutzer-<br>oberfäche alle für ihn relevanten Daten einfach und übersichtlich zu verwalten.<br>Es sollen zahlreiche Konfgurationsdaten gespeichert und beim nächsten Start des<br>Programms verwendet werden (z.B. aktuelle Größe und Position des Fensters).<br>Daneben sollen einige Elemente vor dem Start konfgurierbar sein (z.B. Über-<br>schrifen, Schrifarten und -größen usw.).|
|---|---|
|/LF20/|Es sind Mitarbeiterdaten, Kundendaten und Lieferantendaten zu verwalten.|
|/LF30/|Zentrales Element ist ein Kundenaufrag, zu denen Angebote, Lieferungen,<br>Rechnungen und Zahlungserinnerungen gehören. Angebote, Lieferungen und<br>Rechnungen beinhalten die Zusammenstellung einzelner Angebots-, Lieferungs-<br>und Rechnungsposten.<br>Daneben gehören zu einem Kundenaufrag ein Kunde und meist ein oder mehrere<br>Lieferanten.<br>Jedem Kundenaufrag ist für jeden Bearbeitungsschritt (Erstellung, Änderung,<br>Löschung usw.) ein Mitarbeiter zuzuordnen. Es muss dafür gesorgt werden, dass<br>die einzelnen Schritte jederzeit nachvollziehbar sind.|
|/LF40/|Es muss eine Terminverwaltung integriert sein. Termine können beliebig lang<br>dauern, auch mehrere Wochen (je nach Kundenaufrag). Einem Kundenaufrag<br>sind entsprechend ein Start- und ein Endtermin zugeordnet. Darüber hinaus<br>können beliebig viele Zwischentermine hinzugefügt werden.<br>Terminüberschneidungen müssen bei Eintragungen vermieden werden.|
|/LF50/|Für jeden Kundenaufrag können beliebige Materialien bei verschiedenen Liefe-<br>ranten beschaft werden.<br>Da noch nicht bei allen Lieferanten über das Internet oder E-Mail bestellt werden<br>kann (z.B. bei vielen Kleinbetrieben), soll eine Bestellliste interaktiv erstellt und<br>als Bestellung ausgedruckt werden können.<br>Dazu sollen leicht erweiterbare, branchenspezifsche Auswahllisten eingesetzt<br>werden, um den Erstellungsprozess zu vereinfachen (die vielen Listen stellen wir<br>zur Verfügung, es handelt sich um einfache Zeichenkettenlisten, die im System<br>verarbeitet werden sollen).|
|/LF60/|Neben den Kundenaufrägen gibt es noch eigene Aufräge an andere Firmen (z.B.<br>bzgl. Wartung, Reparatur, Beschafung (s. /LF50/) u.v.m. Auch hierfür gibt es<br>Angebote und Rechnungen, die verwaltet werden müssen.|
|/LF70/|Die grafsche Benutzungsoberfäche soll die Suche nach Kundenaufrägen, Kun-<br>den und Lieferanten bieten. Die Ergebnisse sollen in Listenform dargestellt<br>werden.|



3 

Aufgabenstellung 

4 

||Nach der Selektion eines Listeneintrags sollen sämtliche Informationen über das<br>Element mit allen Referenzen direkt angezeigt werden.|
|---|---|
|/LF80/|Alle Aufräge werden nach Übertragung an das Finanzbuchhaltungssystem dort<br>weiterverarbeitet (Aufragsvergabe, Rechnungsstellung usw.). Eine Aktualisie-<br>rung der Zustände der Aufräge (gestartet, laufend, ausgeführt, Rechnung gestellt,<br>…) erfolgt durch Abrufen der Aufragsdaten vom Finanzbuchhaltungssystem.|
|/LF90/|Schließlich sollen noch die eigenen Werkzeuge und Anlagen verwaltet werden.|
|/LF100/|Sämtlichen Elementen sollen mehrere Bilder mit Titel zugeordnet werden kön-<br>nen, die zentral auf einem Verzeichnis liegen sollen.|
|/LF110/|Vor dem Hinzufügen von neuen Daten soll eine Überprüfung stattfnden, ob diese<br>eventuell schon vorhanden sind.|



## **1.2.6 Produktdaten** 

/LD10/ Die Daten sollen in einer zentralen Datenbasis abgespeichert werden. 

## **1.2.7 Produktleistungen** 

|/LL10/|Die Anzahl der zu verwaltenden Elemente wird auf ca. 100.000 geschätzt.|
|---|---|
|/LL20/|Um bei möglichst allen Kunden unsere Sofware installieren und ausführen zu<br>können muss zwingend auf Plattformunabhängigkeit geachtet werden.|



## **1.2.8 Qualitätsanforderungen** 

|Produktqualität|sehr gut|gut|normal|nicht relevant|
|---|---|---|---|---|
|Funktionalität||X|||
|Zuverlässigkeit||X|||
|Efzienz||X|||
|Benutzbarkeit (auch Gestaltung)|X||||
|Wartbarkeit|||X||
|Übertragbarkeit (Portabilität)||X|||



4 

Aufgabenstellung 

5 

## **1.3 Aufgaben** 

Es handelt sich hier um eine stark vereinfachte Verwaltungs-Software. Einzelne Lastenheftpunkte sind bewusst offengehalten. Denken Sie darüber nach, welche Informationen zusätzlich sinnvoll oder auch notwendig sind. Recherchieren Sie evtl. nach einzelnen Zusammenhängen im Internet. 

## **1.3.1 Analyse** 

Für die Analyse sind zu erstellen: 

- Analyse des Lastenhefts (Fragen und Antworten). 

- Ein Use-Case-Diagramm der gesamten Anwendung incl. Beschreibung. 

- Eine Verfeinerung des Use-Case-Diagramms incl. Beschreibung. (nach Absprache) 

- Ein Analyse-Klassendiagramm incl. Beschreibung (Untersuchen Sie dabei den Einsatz geeigneter Analysemuster) 

- Einfach gestaltete GUI-Skizzen (Mockups) von mindestens zwei wesentlichen GUI-Komponenten (Hauptseite, Tabs, etc.). Die Skizzen können mit einem einfachen Grafikprogramm erstellt werden. Auch sorgfältige Handzeichnungen sind erlaubt. Keine Login-GUI skizzieren! 

## **1.3.2 Sequenzdiagramm und Aktivitätsdiagramm** 

Erstellen Sie ein Sequenzdiagramm und ein Aktivitätsdiagramm (incl. Beschreibung) für folgende Szenarios (ein AD für ein Szenario, ein SD für das andere Szenario): 

- Die Aktion „Auftrag durchführen“ vom Erstkontakt bis zur Bezahlung der Rechnung 

- Die Aktionen „Materialbestellungen für obigen Auftrag durchführen“. 

Tipp: Sie können zur besseren Veranschaulichung die Bestellungen exemplarisch für einen beliebigen Handwerksbetrieb durchführen. 

Die Bewertung Ihrer Diagramme erfolgt auf der Basis der Nutzung der UML-Elemente, auf Ihrer Kreativität sowie dem Detaillierungsgrad der Diagramme. 

Fassen Sie bei beiden Diagrammen die Eingabe aller primitiven Attribute eines Elements (Float, String, Integer, …) in einer einzigen Aktion zusammen (z.B. „Attribute eintragen“). Für das Sequenzdiagramm ist das gewählte Szenario ausführlich zu entwickeln (idealerweise mit Pseudocode oder einer anderen Modellierungsmethode Ihrer Wahl). Es sind sämtliche referenzierten Elemente zu berücksichtigen, die zugeordnet werden können. 

Hinweis: In allen Fällen wird eine (noch) leere Datenbasis angenommen. Denken Sie an geeignete Diagrammverfeinerungen. 

5 

Aufgabenstellung 

6 

## **1.3.3 Entwurf** 

Abzuliefern sind hier (alle Diagramme und GUIs jeweils mit Beschreibung): 

- Entwurfsklassendiagramm (Untersuchen Sie dabei den Einsatz geeigneter Entwurfsmuster) 

- GUI-Modellierung: Es ist das Kommunikationsschema eines Teils der während der Analyse skizzierten GUI mit UML zu modellieren. Die Anwendung selbst soll dabei nach dem einfachen Model-View-Control-Muster mithilfe des Observer-Patterns aufgebaut sein. Dazu sind mindestens ein Controller, die erforderlichen Modellklassen sowie eine unabhängige GUI (View) erforderlich. 

- Die Erzeugung der Instanzen soll in einer Entity-Factory erfolgen und zur Verwaltung der Instanzen ist ein Entity-Manager zu realisieren (beides siehe Vorlesung). 

- Die meisten GUI-Elemente werden über eine einfache kleine Java-Bibliothek zur Verfügung gestellt (swe-utils.jar), deren GUI-Komponenten in das Klassendiagramm zu integrieren sind, wenn sie verwendet warden (Thema: Integration einer fremden UI-Bibliothek). Hinweis: Die GUI-Modellierung kann in einem separaten Diagramm mit den relevanten (gewählten bzw. benötigten) Modellklassen erfolgen, falls das Entwurfsklassendiagramm sonst zu komplex werden würde. 

## **1.3.4 Implementierung** 

entfällt 

## **1.4 Vereinfachungen für den Programmentwurf** 

- a) Es muss nicht dafür gesorgt werden, dass auf dieselben Daten bzw. CSV-Dateien nicht gleichzeitig zugegriffen werden kann, d.h. es ist kein Locking-Mechanismus erforderlich. 

- b) Eine Protokollierfunktion und ein Login-Vorgang sind für die Anwendung nicht erforderlich (in der Realität natürlich schon!). 

6 

Analyse des Lastenhefts 

7 

## **2 Analyse des Lastenhefts** 

## **2.1 Einleitung** 

Wir – die **HWSoft Vertriebs-GmbH** – bieten Handwerksbetrieben aller Größen und Fachrichtungen maßgeschneiderte Softwarewerkzeuge an, um deren Verwaltung zu vereinfachen und zu beschleunigen. 

1. Frage: Welche Fachrichtungen fallen konkret unter den Begriff Handwerksbetrieb? 

Folgende Handwerksbetriebe sind Kunden: 

- Dachdecker 

- Bäcker 

- Elektroinstallateure 

- Sanitär- und Heizungsbauer 

- Fliesenleger 

2. F.: Wird sich hiermit auch auf Handwerksbetriebe anderer Fachrichtung bezogen? 

Auch andere Fachrichtungen sollen unsere Software nutzen können, da wir ebenso Neukunden anwerben möchten. 

3. F.: Haben unterschiedliche Handwerksbetriebe unterschiedliche Bedürfnisse? 

Handwerksbetriebe haben grundlegend die gleichen Bedürfnisse (siehe Zielsetzung). Genauso haben Handwerksbetriebe auch unterschiedliche Bedürfnisse: 

- Dachdecker: Wetterintegration, Gerüstplanung 

- Bäckereien: Rezeptverwaltung, Filialen-Belieferung 

- Elektroinstallateure: Erfassung und Nachweisführung von Zählerständen; Verwaltung von Messgeräten und Prüfintervallen 

- Sanitär- und Heizungsbauer: Dokumentation von Wasser-, Gas- und Heizungsanlagen; Integration von Regelungstechnik (Smarte Thermostate) 

- Fliesenleger: Fotodokumentation für Baufortschritte oder Mängel; Farb und Musterwahl der Fliesen 

Die Gemeinsamkeiten sollen von der Software abgedeckt werden. Unterschiedliche Bedürfnisse sollen durch Plugins (siehe unten) individuell für einzelne Betriebe umgesetzt werden können. 

4. F.: Wie groß sind die Betriebe Ihrer Kunden? 

7 

Analyse des Lastenhefts 

8 

Unser Kundenstamm umfasst Kleinbetriebe mit einer Mitarbeiteranzahl von 1-10 Mitarbeitenden. Zudem haben wir Mittelbetriebe als Kunden. Diese haben eine Mitarbeitendenzahl von 1-30 Mitarbeitenden. 

5. F.: Inwiefern beschleunigen und vereinfachen Sie die Verwaltung in solchen Handwerksbetrieben? 

Durch eine Zentralisierung der Daten aus der Verwaltung ist der Zugriff und die Suche nach internen Informationen wie Terminen, Kunden, Material, Aufträgen, Geräten, Personaldaten, Rechnungen und Angeboten möglich. 

Unsere bisherige Softwarelösung bietet mehrere separate Applikationen speziell für Installateure, Heizungsbauer, Dachdecker, und Bäckereien an. Hierfür ist die Wartung und Weiterentwicklung der einzelnen Softwarewerkzeuge nun zu aufwendig geworden. 

6. F.: Wie sind diese einzelnen Systeme aufgebaut? 

Die bisherigen Systeme sind als monolithische Desktop-Anwendungen konzipiert, die jeweils auf eine bestimmte Branche zugeschnitten sind. Sie bestehen aus einer lokal installierten Anwendung auf einem Desktop-PC mit eigener Datenbank und Benutzeroberfläche. 

7. F.: Was sind Gemeinsamkeiten dieser Systeme? 

- Grundlegende Verwaltungsfunktionen (Kunden, Aufträge, Rechnungen) 

- Nutzung lokaler Datenbanken (SQLite, MySQL) 

- Keine zentrale Benutzerverwaltung oder Rechtekonzept 

- Keine mobile Anbindung 

8. F.: Was sind die Unterschiede dieser Systeme? 

- Verschiedene Technologien/Programmiersprachen(Java FX, Java Swing) 

- Unterschiedlicher Funktionsumfang: Bäckerei hat Software mit Kassenanbindung; Fliesenleger hat Software mit Auswahl der Fliesen für Kunden. 

9. F.: Was war gut oder schlecht an diesen alten System? 

Positiv: 

- Starke Branchennähe durch spezialisierte Funktionen 

- Vertraute Oberfläche für bestehenden Kunden 

- Geringe Einstiegshürde für kleine Betriebe 

## Negativ: 

- Hoher Pflege- und Wartungsaufwand bei getrennter Weiterentwicklung 

- Keine Wiederverwendbarkeit durch getrennte Codebasis 

8 

Analyse des Lastenhefts 

9 

- Kein Zugang über mobile Geräte möglich 

- Technologien inkonsistent 

## 10. F.: Was soll übernommen werden? 

Aus unserer Erfahrung heraus ist es uns besonders wichtig, dass die Oberfläche besonders benutzerfreundlich ist, sodass sich der Nutzer schnell an die Nutzung gewöhnt und sich zurechtfindet. Auf Datenebene sollen alle wesentlichen Elemente zu Terminen, Material, Kunden, Aufträgen, Geräten, Personaldaten, Angebote und Rechnungen übernommen werden. 

11. F.: Wie sind die alten Datenbanksysteme aufgebaut? Was wären Herausforderungen bei der Einbindung dieser alten Systeme? 

Die bisherigen Anwendungen basieren entweder auf SQLite oder MySQL. 

Intern: Um die Migration automatisiert zu gestalten wären Skripte nötig, die die Daten in das neue System überführen. 

12. F.: Wie erfolgt der Datenzugriff in den alten Systemen? 

Der Zugriff erfolgt lokal und direkt. Das heißt aus der Desktop-Anwendung heraus auf eine lokale SQLite-Datenbank. Auf den Systemen mit SQLite gibt es kein Rollenkonzept. Bei MySQL gibt es ein einfaches Rollenkonzept. Es gibt keine Synchronisation, da die Daten im ersten Fall nur lokal und auf einem Gerät gespeichert werden. Bei MySQL werden die Daten zentral gespeichert. Allerdings ist ein Zugriff nur über Desktop-Geräte möglich, die unmittelbar mit der Datenbank verbunden sind. 

13. F.: Wie wird sich der Datenzugriff für das neue System vorgestellt? 

Alle Daten sollen in einer zentralen, serverbasierten Datenbank gehalten werden. Der Zugriff erfolgt über eine Desktop-Anwendung und soll grundsätzlich so aufgebaut werden, dass die Daten auch von mobilen Endgeräten in Zukunft konsumiert werden können. Für den Zugriff soll ein abgestuftes Berechtigungskonzept existieren. 

Um jedoch alle weiteren denkbaren Handwerksbetriebe ansprechen zu können und da sich die o.g. Softwarelösungen doch recht ähnlich sind, bietet es sich an, eine neue VerwaltungsSoftware für Handwerksbetriebe erstellen zu lassen, die eine gemeinsame Basis hat und die bestenfalls für einzelne Spezialisierungen über Plugins o.ä. erweitert werden kann. 

14. F.: Steht das Generalisieren der bestehenden Lösungen nicht im Widerspruch zu dem Ziel der HWSoft Vertrieb-GmbH möglichst “maßgeschneiderte” Softwarewerkzeuge zu entwickeln? 

9 

Analyse des Lastenhefts 

10 

Die neuen Softwarelösungen sollen Gemeinsamkeiten einzelner Softwarelösungen vereinen. Das neue Produkt soll die Basis für eine Verwaltungssoftware in unterschiedlichen Handwerksbetrieben darstellen. Individuelle Anpassungen und Sonderwünsche sollen durch Plugins umsetzbar sein. 

## 15. F.: Wie speziell sollen diese Plugins sein? 

Das eigentliche Endprodukt muss keine Implementierung für Plugins umfassen. Stattdessen soll die Möglichkeit bestehen, durch eine zur Verfügung stehende Schnittstelle solche Plugins umzusetzen. So sollen individuelle Anforderungen einzelner Handwerksbetriebe erfüllt werden können. 

16. F.: Wie soll eine solche Schnittstelle aussehen? Soll es sich um eine Rest-API handeln? 

Die Schnittstelle kann durch Import und Export bedient werden. Ob hierfür eine extra RESTAPI benötigt wird, ist Ihnen überlassen. 

17. F.: In welchem Umfang sollen diese Plugins Änderungen vornehmen können? 

Die Plugins sollen ausschließlich ergänzende Funktionen auf Basis der bestehenden Systemlogik bereitstellen – beispielsweise für individuelle Anforderungen wie Kassensysteme, Wetterintegrationen oder Rezeptverwaltungen (siehe Abschnitt 2.1). Sie dürfen dabei nicht die Datenbankstruktur verändern, sondern erhalten ausschließlich Lese- und Schreibrechte auf definierte Teile der bestehenden Datenbasis. In der Datenbankstruktur können höchstens neue Einträge angelegt oder alte verändert werden. 

Dabei soll es sich um ein Desktopsystem handeln, bei dem jeder Arbeitsplatz im Büro auf eine gemeinsame Datenbasis zugreift. 

18. F.: Befinden sich all diese Arbeitsgeräte im Büro in einem Netzwerk? 

Die Desktop-PCs sind alle im selben Netzwerk. Zugriff außerhalb des Netzwerks erfolgt über mobile Geräte und eine entsprechende Schnittstelle (siehe unten) oder über einen Zugriff über VPN auf das Netzwerk. 

Für Betriebe, welche beim Kunden vor Ort auf ihre Daten zugreifen wollen und/oder müssen, wollen wir zusätzlich angepasste Web-Applikationen anbieten, die auf Tablets oder Handys laufen können. Aus Datenschutz- und Sicherheitsgründen erfolgt der Zugriff nur auf explizit freigegebene Teile der Daten. Hierzu müssen die ausgewählten Daten im Internet für die Mitarbeiter geeignet bereitgestellt werden. 

19. F.: Was für Daten sollen zur Verfügung gestellt werden? 

10 

Analyse des Lastenhefts 

11 

Zur Verfügung sollen ausschließlich relevante Daten wie Kundendaten, Terminpläne, Auftragsdetails, Dokumentationen und ggf. Materialien gestellt werden. Diese sollen auch offline verfügbar sein, um einen unterbrechungsfreien Arbeitsablauf bei fehlender Internetverbindung zu gewährleisten. Die für den Einsatz vor Ort benötigt werden. Auf diese Daten soll ein Lese- und Schreibrecht bestehen. 

20. F.: Wann sollen diese Daten synchronisiert werden? 

Änderungen sollen beim nächsten Online-Zugriff oder wenn man sich im Netzwerk der Datenbank befindet, synchronisiert werden. 

21. F.: Soll dieser Zugriff im Einklang mit dem Mehrbenutzersystem erfolgen? 

Ja, die Zugriffe von außerhalb sollen den Rechten im Mehrbenutzersystem entsprechen. 

22. F.: Gibt es Anforderungen, wie dieser Zugriff erfolgen soll? 

Der Zugriff soll ausschließlich für autorisierte Nutzer möglich sein. Die Authentifizierung erfolgt idealerweise mittels sicherem Login-Verfahren über ein zentrales Rechtemanagement. 

Intern: Eine Zwei-Faktor-Authentifizierung wäre hier denkbar mittels Einmalcode für einen sicheren Zugriff. 

23. F.: Wie soll die Accessibility auf diesen mobilen Geräten aussehen? 

Das UI soll für die mobilen Endgeräte angepasst sein. Allerdings ist dies nicht Teil der Implementierung. Es soll vor allem die Schnittstelle bereitgestellt werden, sodass eine solche mobile Verwendung der Daten durch eine eigene Lösung in Zukunft möglich ist. 

Da die Verwaltung eines Handwerksbetriebs meist durch wenige Personen erfolgt, die meist keine oder geringe Computerkenntnisse besitzen, ist eine intuitive und leicht erlern- und bedienbare grafische Benutzeroberfläche zwingend erforderlich. 

24. F.: An was für eine Art von leicht bedienbarer Oberfläche wird hier gedacht? 

Um an Informationen zu gelangen, sollten möglichst wenige Klicks benötigt werden. Das heißt, man soll einerseits möglichst viele Informationen auf einen Blick sehen und gleichzeitig erkennbar sein, wo weitere Informationen zu finden sind. 

25. F.: Wird davon ausgegangen, dass es eine Person mit fortgeschrittenen Computerkenntnissen in einem Betrieb gibt? Soll diese Person für die Administration zuständig sein? 

11 

Analyse des Lastenhefts 

12 

Pro Betrieb soll es mindestens eine Person geben, die über weiterreichende Kenntnisse besitzt. Zumindest ist diese Person mit der unmittelbaren Verwaltung des Systems beauftragt (siehe Rechte der Benutzer unten). 

## 26. F.: Soll eine bestimmte Accessibility beachtet werden (z.B. Blindengerecht)? 

Dies wäre für eine Betrachtung der mobilen Implementierung sinnvoll (z.B. Spracheingabe). Allerdings ist dies wie gesagt nicht Teil der Anforderung. Für die Desktop-Anwendung ist ein solches Feature nicht vorgesehen, da keine solcher Einschränkungen bei unseren Bestandskunden bekannt sind. 

## **2.2 Lastenheft** 

## **2.2.1 Zielsetzung** 

Ziel dieser Entwicklung soll eine Software für die Verwaltung von Handwerksbetrieben sein. Es sollen auf einfache Weise Kunden-, Termin-, Material-, Auftrags-, Geräte- und Personaldaten sowie Angebote und Rechnungen mittels einer grafischen Benutzeroberfläche angelegt, gesucht, geändert, importiert und exportiert werden können. Darüber hinaus sollen Bestellungen und Lieferungen von und an andere Firmen verwaltet werden können. 

## 27. F.: Wie ist das alte Datenbanksystem aufgebaut? 

Die bisherigen Systeme nutzen jeweils eigene, lokal installierte relationale Datenbanksysteme wie SQLite oder MySQL. Die Datenstruktur, Tabellen und Feldbezeichnungen sind je nach Branche individuell angepasst worden. Ein gemeinsames Datenmodell besteht bislang nicht. 

## 28. F.: Was wären Herausforderungen bei der Einbindung? 

Zwar basieren die alten Systeme größtenteils auf relationalen Datenbanken, jedoch unterscheiden sich Tabellen, Feldnamen und -typen. Eine umfangreiche Datenmigration ist notwendig, um bestehende Daten in ein zentrales, standardisiertes Schema zu überführen. Zudem muss gewährleistet sein, dass bei der Übernahme keine Datenverluste auftreten und alle historischen Daten korrekt zugeordnet werden. 

## 29. F.: Welcher Benutzer soll diesen Import und Export ausführen dürfen? 

Ausschließlich der Administrator soll die Berechtigung haben. Nicht jeder Benutzer soll in der Lage sein, Import und Export ausführen zu dürfen. 

12 

Analyse des Lastenhefts 

13 

30. F.: Welche Formate sollen für den Import und Export verwendet werden? 

Primär soll der Import und Export über das XML-Format erfolgen. 

31. F.: Wie sieht ein solcher Export möglicherweise aus? 

Der Export aller Rechnungen könnte beispielsweise so aussehen. Der Export umfasst alle Attribute wie sie in diesem Lastenheft beschrieben sind. 

```
<export>XML
    <rechnung>
    <rechnungsnummer>202500123</rechnungsnummer>
    <kundennummer>98374</kundennummer>
    <auftragsnummer>99045</auftragsnummer>
    <erstellungsdatum>2025-05-07</erstellungsdatum>
    <faelligkeitsdatum>2025-06-27</faelligkeitsdatum>
    <zahlungsstatus>bezahlt</zahlungsstatus>
    <bemerkung>Restzahlung bis Fälligkeit erwartet.</bemerkung>
    <nettogesamtbetrag>1500.00</nettogesamtbetrag>
    <bruttogesamtbetrag>1785.00</bruttogesamtbetrag>
    </rechnung>
    <rechnung> ...
</export>
```

32. F.: Sollen die exportierten Daten speziell gesichert werden? Oder gibt es keine Bedenken beim Exportieren von heiklen Daten? 

Besitzt ein Nutzer diese Rechte, dann soll er unmittelbar auf die von der Schnittstelle zur Verfügung gestellten Elemente zugreifen können. Diese Funktionalität wird im Hinblick auf eine Datenmigration und für das Backup als hilfreich erachtet. 

Eine zentrale Datenhaltung sowie ein Mehrbenutzersystem müssen realisiert werden. 

33. F.: Wie sollen Datenänderungen in der zentralen Datenbank nachvollziehbar gemacht werden? 

13 

Analyse des Lastenhefts 

14 

Änderungen an der Datenbank sollen mit einem entsprechenden Logging protokolliert werden. 

## 34. F.: Wie wird bei gleichzeitigem Bearbeiten eines Datensatzes umgegangen? 

Ein paralleles Schreiben soll nicht möglich sein. Der Zugriff auf eine Klasse von Elementen soll nur von einem Benutzer gleichzeitig möglich sein. 

Intern: Ein Lock-Mechanismus könnte dies lösen. 

Die Software wird für die Verwaltung von Daten von Handwerksbetrieben eingesetzt. 

35. F.: Wann soll die Anwendung vorwiegend verwendet werden? 

Die Anwendung wird vorwiegend zwischen 7 Uhr und 22 Uhr verwendet. 

## **2.2.2 Anwendungsbereich** 

## **2.2.3 Zielgruppen, Benutzerollen und Verantwortlichkeiten** 

Zur Zielgruppe zählen alle bei einem Handwerksbetrieb beschäftigten Mitarbeiter, die für die Erfassung und Verwaltung der Daten angestellt sind. 

## 36. F.: Wie viele Anwender sollen für die Benutzerrollen unterstützt werden? 

Die Anzahl der Benutzer orientiert sich an der Mitarbeiterzahl des jeweiligen Betriebs (siehe oben). Da sich diese Zahl durch Personalwechsel oder Kurzarbeitsregelungen verändern kann, muss das System auf Nutzeränderungen reagieren können. 

37. F.: Sollen Nutzer bei Inaktivität gelöscht werden? 

Das Löschen inaktiver Nutzerkonten soll manuell durch den Systemadministrator erfolgen können. 

## 38. F.: Können Benutzer mehrere Rollen haben? 

Prinzipiell sollte dies möglich sein, da sich nur Grundrechte überschneiden (Termin verwalten und Konfiguration der GUI). Lediglich der Administrator deckt alles ab. In Betrieben gibt es Mitarbeiter, die mehrere Benutzerrollen gleichzeitig benötigen. 

39. F.: Welche Rollen werden im alten System abgedeckt? 

In den bisherigen Systemen existiert keine Benutzerrollen-Verwaltung. 

14 

Analyse des Lastenhefts 

15 

40. F.: Sollen die Rollen vordefiniert sein oder im Nachhinein angepasst werden können? 

Die Benutzerrollen sollen entsprechend den nachfolgend beschriebenen Funktionen vordefiniert sein. Eine spätere Erweiterung durch System-Administratoren sollte perspektivisch jedoch möglich sein. So wäre denkbar, dass durch ein Plugin eine Rolle mit Rechten erweitertet werden könnte. 

41. F.: Was für erweiterte Rollen wären hier denkbar? 

Für den Import und Export wäre eine dedizierte Rolle denkbar. 

- Das kaufmännische Personal soll den Vollzugriff auf die Betriebsdaten (Personal, Termine, Kunden, Angebote, Rechnungen, Firmen, usw.) erhalten. 

42. F.: Was fällt unter “usw”? 

Unter diesen Begriff fallen über die genannten Elemente hinaus: Angebote, Kundendaten, Lieferungen, Rechnungen und Zahlungserinnerungen. Also Informationen, die für einen kaufmännischen Teil eines Betriebs relevant sind. 

- Ein Administrator soll sämtliche Daten anlegen, ändern, löschen, exportieren und importieren können. Hierzu gehört auch der selektive Import und Export von Daten 

43. F.: Worin unterscheidet sich die Zugriffsart des Administrators von der des Vollzugriffs beim kaufmännischen Personal? 

Der Unterschied liegt darin, dass der Administrator zusätzlich die Berechtigung hat, alle Daten zu verwalten, also anzulegen, zu ändern, zu löschen sowie Daten zu importieren und zu exportieren. Das kaufmännische Personal mit „Vollzugriff“ kann zwar auf die jeweiligen Daten zugreifen, jedoch fehlen ihm die erweiterten Rechte zur Systemadministration, wie das Importieren/Exportieren oder das Verwalten von Benutzern und Berechtigungen. 

44. F.: Welche Elemente sollen durch den Import und Export abgedeckt werden? 

- Kundendaten 

- Personaldaten 

- Rechnungen 

- Aufträge 

- Geräte (Werkzeuge und Anlagen) 

- Material 

- Angebote 

45. F.: Gibt es immer nur einen Administrator? Was ist, wenn dieser seinen Zugang verliert? 

15 

Analyse des Lastenhefts 

16 

Es muss nicht nur einen Administrator geben. Wenn dieser seinen Zugang verliert, sollte es entweder mehrere Administratoren oder eine Möglichkeit zur Wiederherstellung des Zugangs geben, um den Zugriff wiederherzustellen. 

- Vorgesetzte (z.B. Gruppen- und Abteilungsleiter) sollen lesenden Zugriff auf alle Gerätschaften bzw. Anlagen haben. 

46. F.: Was fällt unter Vorgesetzte genau? 

Gruppenleiter, Abteilungsleiter, Teamleiter, Bereichsleiter, Projektleiter fallen in diese Kategorie. 

47. F.: Sollen Vorgesetzte keinen Zugriff auf die Werkzeuge haben, sondern nur die Anlagen? 

Ja. 

- Ausgewählte Mitarbeiter sollen lesenden Zugriff auf Bestands- und Verfügbarkeitsdaten von Materialien und Werkzeugen haben. 

48. F.: Wer zählt zu den ausgewählten Mitarbeitern? 

Die Attribute von Werkzeugen und Materialien, wie es unten beschrieben wird. 

49. F.: Von wem (Rolle) sollen diese Rollen verwaltet werden? 

Die Vergabe und Verwaltung der Rechte soll ausschließlich über die Rolle des Administrators erfolgen. 

Es sollen keine besonderen Computerkenntnisse zur Bedienung der Software erforderlich sein. 

50. F.: Was kann man sich unter 'keine besonderen Computerkenntnisse' konkret vorstellen? 

Von einem allgemeinen Verständnis, wie in einer Benutzeroberfläche navigiert und interagiert wird, kann ausgegangen werden. Allerdings sollte der Benutzer an eine möglichst einfache Bedienung herangeführt werden. Das heißt, die Navigation oder Eingaben sollten möglichst einfach gehalten werden. Entsprechende Tooltips sollen so zum Beispiel die Navigation fördern. 

## **2.2.4 Zusammenspiel mit anderen Systemen** 

Das zu entwickelnde Softwaresystem soll aus Sicherheitsgründen ohne Netzverbindung nach außen lauffähig sein. Mehrere Drucker sollen für die Erstellung der Rechnungen und Angebote angeschlossen sein. 

16 

Analyse des Lastenhefts 

17 

## 51. F.: Wie sind die Drucker verbunden? 

Die Drucker befinden sich im selben internen Netzwerk wie das Softwaresystem und sind lokal angebunden – eine Internetverbindung ist aus Sicherheitsgründen nicht erwünscht. 

52. F.: Gelten somit auch dieselben Rechte für das Drucken wie für den Export? 

Nein zum Drucken ist jeder berechtigt, der auch das Leserecht auf Rechnungen und Angebote hat. Das wäre kaufmännisches Personal und der Administrator. 

53. F.: Wie erfolgt die Installation des Servers und der Drucker im Netzwerk? 

Das Aufsetzen des Druckers und des Computers, auf dem die Anwendung läuft, ist in unserer internen Dokumentation beschrieben, sodass die Startbedingungen bei allen Kunden gleich sind. 

54. F.: Wie sehen diese Schritte hierzu aus? 

1. Prüfen auf Verfügbarkeit von Geräten 

2. Server-Installation: evtl. Windows Installation nötig; Installation der Datenbank und Anwendung 

3. Drucker-Installation: Druckertreiber; Drucker im Netzwerk freigeben 

4. Netzwerkkonfiguration: Firewall soll nur interne Verbindungen zulassen 

Damit ein Kunde mit EC- oder Kreditkarte zahlen kann, soll ein Kartenleser angeschlossen werden können. Die Schnittstelle zum Lesegerät muss untersucht werden. 

## 55. F.: Was sind bereits vorhandene Kartenlesegeräte? 

Bei den Kunden kommen Kartenlesegeräte von der Firma “Stripe” zum Einsatz. Dabei handelt es sich um eine Komplettlösung für die Zahlungsabwicklung. 

56. F.: Wie sieht die Schnittstelle von einem solchen Gerät aus? 

Um mit den Lesegeräten zu interagieren, stellen diese eine REST-API zur Verfügung. 

57. F.: Wo und wie soll das Kartenlesegerät verwendet werden? 

Damit die Zahlungen autorisiert werden können, muss für die Geräte eine Internetverbindung hergestellt werden. Die Kartenlesegeräte sollen primär mobil oder in Filialen eingesetzt werden – also außerhalb des eigenen Netzwerks des Hauptsystems. Auch dies erfordert eine Internetverbindung am Einsatzort der Geräte. 

58. F.: Wie kann auf die API zugegriffen werden? 

17 

Analyse des Lastenhefts 

18 

Die API wird im Internet zur Verfügung gestellt. Um auf diese zugreifen zu können, muss eine entsprechende Authentifizierung beim Zugriff erfolgen. Zudem muss eine Verbindung mit dem Internet bestehen. 

Intern: Eine Spezifikation der Schnittstelle kann unter https://docs.stripe.com/terminal/ references/api-reference/overview abgerufen werden. 

## 59. F.: Muss nur die Schnittstelle oder auch der Prozess des Abbuchens bedacht werden? 

Da es sich um eine Stripe-Komplettlösung handelt, wird der gesamte Zahlungsprozess inkl. Abbuchung, Autorisierung, Belegerstellung und Transaktionskosten von Stripe übernommen. Die erstellten Belege sind über die API abrufbar und können in das bestehende Abrechnungssystem eingebunden werden. 

Die finanztechnischen Daten der Mitarbeiter (Gehälter bzw. Löhne) werden separat durch unser eigenes Finanzbuchhaltungsprogramm **FiBuSys** verwaltet. Das System soll geeignet in das Gesamtsystem integriert werden. 

60. F.: Was für eine Schnittstelle kann für eine Verbindung zu diesem System genutzt werden? 

Es handelt sich um ein Modul, das eine REST-API für einen standardisierten Datenaustausch zur Verfügung stellt. 

61. F.: Soll FiBuSys als Ganzes in das System integriert werden? 

FiBuSys soll nicht direkt integriert werden, sondern über eine Schnittstelle. Dabei findet explizit eine regelmäßige Daten-Synchronisation statt, wenn Daten aus diesem System benötigt werden. 

62. F.: Auf welchem Server läuft FibuSys? 

Momentan läuft FibuSys bei den Kunden auf dem Computer, wo auch die Datenbank untergebracht ist. Für die neue Anwendung soll das System in gleicher Form und mit denselben Daten verwendet werden. Das System sollte auf dem Server, auf der auch die Datenbank ausgeführt wird, laufen. 

63. F.: Wie sieht die Schnittstelle von FibuSys aus? 

Es handelt sich um eine REST-API, die folgende Daten zur Verfügung stellt: 

|Attribute|Datentyp|Beschreibung|
|---|---|---|
|Mitarbeiternummer|Ganzzahl|Eindeutige ID des Mitarbeiters|
|Kostenstelle|Text|Name der Kostenstelle|



18 

Analyse des Lastenhefts 

19 

|Gehalt|Dezimalzahl|Betrag des Gehalts|
|---|---|---|
|Kontonummer|Text||
|Steuerklasse|Text||
|Buchungsdatum|Datum|Datum der Buchung|
|Stundenzahl|Dezimalzahl|Stundenzahl pro Woche|
|Status der Überweisung|Text|Ausstehend, bezahlt|



In einem weiterführenden Projekt sollen ausgewählte Daten, über ein Tablet oder ein Handy direkt vor Ort verwaltet werden können. Das erhöht die Flexibilität der Betriebe bzw. deren Mitarbeiter. Das „Tablet-Projekt“ selbst ist nicht direkter Bestandteil des vorliegenden Entwicklungsauftrags, sondern ein Folgeauftrag. Es sollen jedoch vorbereitende Arbeiten und konkrete Vorschläge zur Realisierung (GUI, Schnittstellen, Architektur) gemacht werden. 

64. F.: Wer sind typische mobile Nutzer? 

Typische Personengruppen in einem Handwerksbetrieb für die ein solches Feature interessant wäre sind Monteuere, Techniker oder Servicemitarbeiter, Teamleiter oder Außendienstmitarbeiter. 

65. F.: Welche Bildschirmgrößen und Eingabearten sollen berücksichtigt werden? 

Unterstützte Bildschirme sollen eine Tablet übliche Größe haben (7″–12″). Hierfür soll eine Touch-Bedienung mit Fingern und Stift unterstützt werden. 

66. F.: Was sind hier ausgewählte Elemente, die zur Verfügung stehen und bearbeitbar sein sollen? 

- Kundendaten (Kontakt, Adresse, Historie) 

- Termine 

- Auftragsdaten (inkl. Beschreibung, Status, Notizen) 

- Protokolle 

- Digitale Unterschrift vom Kunden 

67. F.: Welche Aufgaben müssen mobil besonders schnell und einfach möglich sein? 

Alle oben genannten Elemente haben eine Priorität. Insbesondere sind hier allerdings die Kundendaten, Auftragsdaten und Protokolle wichtig. 

Für Kunden, die bereits unser aktuelles System gekauft haben, sollen die erstellten Daten direkt in das neue System übernommen werden können. 

19 

Analyse des Lastenhefts 

20 

68. F.: Welche Datenstrukturen oder Felder sind kundenspezifisch angepasst und könnten daher problematisch für eine Datenmigration sein? 

In den bisherigen Kundeninstallationen wurden zusätzliche Felder für kundenspezifische Lösungen mitgeführt. So wird im Fall der Bäckerei ein eigenes Objekt für das Kassensystem bearbeitet. 

69. F.: Sollen die Daten dieser Spezialsysteme ebenfalls übertragen werden? 

Diese können in den beschriebenen Anforderungen nicht abgebildet werden. Daher ist eine Datenmigration nicht vorgesehen. Durch Plugins soll eine solche individuelle Funktionalität in Zukunft abgebildet werden können. 

## **2.2.5 Produktfunktionen** 

|/LF10/|Der jeweilige Benutzer muss die Möglichkeit haben, über eine grafsche Benutzer-<br>oberfäche alle für ihn relevanten Daten einfach und übersichtlich zu verwalten.<br>Es sollen zahlreiche Konfgurationsdaten gespeichert und beim nächsten Start des<br>Programms verwendet werden (z.B. aktuelle Größe und Position des Fensters).<br>Daneben sollen einige Elemente vor dem Start konfgurierbar sein (z.B. Über-<br>schrifen, Schrifarten und -größen usw.).<br>70. F.: Sollen alle Nutzer diese Möglichkeit der Konfguration haben?<br>Ja.<br>71. F.: Wie sollen die Konfgurationsdateien erstellt werden (in der Anwendung,<br>oder textbasiert)?<br>Diese Einstellungen sollten nur im Falle von individuellen Wünschen vom<br>Nutzer angepasst werden. Da dies nicht häufg der Fall ist, reicht zunächst<br>eine einfache Konfgurationsdatei ohne grafsche Benutzeroberfäche in der<br>Anwendung.<br>Intern: Als Format für die Konfgurationsdatei soll .properties verwendet werden.<br>72. F.: Sollen für die Einstellungen Standardwerte vordefniert werden?<br>Ja, für alle Werte sollen Standardeinstellungen defniert werden, sodass die<br>Nutzer die Anwendung sofort („Out-of-the-Box“) verwenden können, ohne<br>manuelle Anpassungen vornehmen zu müssen.|
|---|---|



20 

Analyse des Lastenhefts 

21 

73. F.: Kann ein Benutzer zwischen mehreren Konfigurationsdateien wechseln? Nein, eine Person soll zur gleichen Zeit genau eine Konfigurationsdatei verwenden. 74. F.: Sollen unterschiedliche Sprachen beachtet werden? Ja, die Anwendung soll mehrsprachig sein. Standardmäßig wird Deutsch verwendet; alternativ soll Englisch auswählbar sein. 75. F.: Soll auch der Textinhalt der Benutzeroberfläche in der Konfiguration veränderbar sein? Nein, eine direkte Anpassung von Textinhalten, soll, außer indirekt über die Sprache, nicht möglich sein. Die Textinhalte werden über die Sprache in der Anwendung definiert. 76. F.: Sollen nur Einstellungen, die den Nutzer betreffen in dieser Konfiguration angepasst werden können oder sollen auch globale Änderungen an der Anwendung erlaubt sein? Lediglich Anpassungen für die lokale Benutzeroberfläche sollen mit diesen Dateien angepasst werden. 77. F.: In welchem Umfang sollen die Konfigurationsdateien die Anwendung beeinflussen? Folgende Einstellungen sollten getroffen werden können: Sprache, Fenstergröße, Position, Schriftgröße, Schriftart, Shortcuts, Startansicht 78. F.: Was für Shortcuts und Schriftarten sollen gewählt werden können? Was für Startansichten soll es geben und was soll hier standardmäßig konfiguriert sein? Shortcuts (Funktionen, mit standardmäßigen Key-Bindings): • Vorwärts- und Rückwärtsnavigieren (Ctrl+Right und Ctrl+Left) • Anwendung durchsuchen (Ctrl+/) • Neue Einträge in Kalender anlegen (c) Schriftarten: • Arial (Standardmäßig) • Time New Roman • Standardansicht: 

21 

Analyse des Lastenhefts 

22 

||Mögliche Übersichtsseiten<br>• Terminkalender<br>• Kundenverwaltung<br>79. F.: Wie groß und was für eine Aufösung haben die Bildschirme, auf denen die<br>Desktop-Anwendung laufen soll?<br>Die Monitore der Kunden haben eine maximale Full-HD-Aufösung. Bildschirm-<br>größen liegen zwischen 14 bis 27 Zoll.|
|---|---|
|/LF20/|Es sind Mitarbeiterdaten, Kundendaten und Lieferantendaten zu verwalten.<br>80. F.: Inwiefern ist hier Datenschutz zu beachten?<br>Die personenbezogenen Daten unterliegen den Vorgaben der DSGVO. Daher<br>sind Maßnahmen wie Zugrifsbeschränkungen, Protokollierung und Datenver-<br>schlüsselung zu gewährleisten.<br>81. F.: Wer kann die Daten schreiben/ändern?<br>Nutzer dürfen im Einklang mit der DSGVO nur auf Daten zugreifen, die sie zur<br>Erfüllung ihrer Aufgaben benötigen. Die Rolle des kaufmännischen Personals,<br>des Vorgesetzten und des Administrators hat das Schreibrecht auf diese Daten.<br>Der Vorgesetzte hat allerdings nur Zugrif auf die Mitarbeiterdaten seiner ihm<br>untergeordneten Mitarbeiter.<br>82. F.: Was sind die Attribute dieser Daten?<br>Mitarbeiter, Kunde, Lieferant<br>**Mitarbeiter**<br>**Kunde**<br>**Lieferant**<br>Mitarbeiternummer<br>Kundennummer<br>Lieferantennummer<br>Vor-, Nachname<br>E-Mail<br>E-Mail<br>E-Mail<br>Tel.<br>Tel.<br>Tel.<br>Firmenname/Name<br>Firmenname<br>Vertragsbeginn/-en-<br>de<br>Adresse<br>Adresse<br>Rolle/Position<br>Ansprechperson<br>(Vor-, Nachname)<br>Ansprechperson<br>(Vor-, Nachname)|



22 

Analyse des Lastenhefts 

23 

|Beschäfigungsart<br>(Voll-, Teilzeit)<br>Bankverbindung<br>Bankverbindung<br>Geburtsdatum<br>Kundenart<br>Vertragsbeginn/Ver-<br>tragsende<br>Intern: Die Datentypen wurden übersichtshalber weggelassen und sind erst für<br>den Entwurf relevant. In diesem Fall wären dies vor allem Text, Ganzzahl und<br>Datum. Bei den anderen Tabellen sind diese aufgeführt worden, um das Verständ-<br>nis zu fördern.<br>83. F.: Wie soll bei einer Adresse gespeichert werden?<br>• PLZ<br>• Ort<br>• Straße<br>• Hausnummer|Beschäfigungsart<br>(Voll-, Teilzeit)|Bankverbindung|Bankverbindung|
|---|---|---|---|
||Geburtsdatum|Kundenart|Vertragsbeginn/Ver-<br>tragsende|



• Zusatz • Land 

84. F.: Soll zwischen Privat- und Geschäftskunden unterschieden werden können? Ja. 

85. F.: Wie erfolgt die Handhabung bei Doppelbelegung? (z. B. wenn Kunde auch Lieferant ist) Ja, ein Lieferant kann auch ein Kunde sein. 86. F.: Wie sollen diese drei Elemente dargestellt werden? 

Jede Entität soll in einer Tabelle angeschaut werden können. Zusätzlich soll eine Suchfunktion die Suche nach Einträgen unterstützen. 87. F.: Wie soll mit einer Bäckerei umgegangen werden, die keine Kunden in dem Sinne hat? 

Bei einer Bäckerei ist das Speichern von Privatkundendaten nicht nötig. Ein Sanitär- und Heizungsbetrieb will allerdings seine Privatkunden speichern. Für solche Fälle soll zwischen Geschäftskunden und Privatkunden unterschieden werden. Dem Bäcker ist dann selbst überlassen, ob er seine Kunden speichern möchte oder nicht. 

23 

Analyse des Lastenhefts 

24 

|/LF30/|Zentrales Element ist ein Kundenaufrag, zu denen Angebote, Lieferungen,<br>Rechnungen und Zahlungserinnerungen gehören. Angebote, Lieferungen und<br>Rechnungen beinhalten die Zusammenstellung einzelner Angebots-, Lieferungs-<br>und Rechnungsposten.<br>Daneben gehören zu einem Kundenaufrag ein Kunde und meist ein oder mehrere<br>Lieferanten.<br>Jedem Kundenaufrag ist für jeden Bearbeitungsschritt (Erstellung, Änderung,<br>Löschung usw.) ein Mitarbeiter zuzuordnen. Es muss dafür gesorgt werden, dass<br>die einzelnen Schritte jederzeit nachvollziehbar sind.<br>88. F.: Welche charakteristischen Eigenschafen besitzen die Elemente Kunden-<br>aufrag, Angebot, Lieferung, Rechnung und Zahlungserinnerung? (Attribute)<br>Kundenaufrag:<br>**Attribut**<br>**Datentyp**<br>**Beschreibung**<br>Aufragsnummer<br>Ganzzahl<br>Eindeutige ID<br>Aufragsdatum<br>Datum<br>Datum der Aufragserstellung<br>Status<br>Text<br>Gestartet, laufend, ausgeführt, in<br>Rechnung gestellt oder bezahlt &<br>abgeschlossen<br>Bemerkung<br>Text<br>Wichtige Hinweise<br>Angebot:<br>**Attribut**<br>**Datentyp**<br>**Beschreibung**<br>Angebotsnummer<br>Ganzzahl<br>Eindeutige ID<br>Erstellungsdatum<br>Datum<br>Datum der Erstellung<br>Gültigkeitsdatum<br>Datum<br>Datum der Gültigkeit<br>Status<br>Text<br>Ofen, angenommen, abgelehnt<br>Bemerkung<br>Text<br>Wichtige Hinweise<br>Gesamtkosten<br>Dezimalzahl<br>Gesamtbetrag des Angebots<br>Lieferung:|
|---|---|



24 

Analyse des Lastenhefts 

25 

|**Attribut**|**Datentyp**|**Beschreibung**|
|---|---|---|
|Liefernummer|Ganzzahl|Eindeutige ID|
|Lieferdatum|Datum|Datum der Lieferung|
|Status|Text|Geplant, versendet, ge-<br>liefert|
|Empfangsbestätigung|Boolean (Ja/Nein)|Wurde die Lieferung<br>bestätigt?|
|Lieferadresse|Text|Zielort<br>der<br>Liefe-<br>rung(kann von Kun-<br>denadresse abweichen)|
|Bemerkung|Text|Wichtige Hinweise|
|Rechnung:|||



|**Attribut**|**Datentyp**|**Beschreibung**|
|---|---|---|
|Rechnungsnummer|Ganzzahl|Eindeutige ID|
|Kunde|Referenz|Referenz zu Kunde (wenn es<br>sich um Kundenaufrag han-<br>delt)|
|Erstellungsdatum|Datum|Datum der Erstellung|
|Fälligkeitsdatum|Datum|Datum der Fälligkeit|
|Zahlungsstatus|Text|z.B. ofen, bezahlt|
|Bemerkung|Text|z.B. wichtige Hinweise|
|Nettogesamtbetrag|Dezimalzahl|Betrag ohne Mehrwertsteuer|
|Bruttogesamtbetrag|Dezimalzahl|Betrag mit Mehrwertsteuer|
|Zahlungserinnerung:|||



|**Attribut**|**Datentyp**|**Beschreibung**|
|---|---|---|
|Rechnung|Referenz|Referenzierte Rechnung|
|Erstellungsdatum|Datum|Wann die Mahnung verschickt<br>wurde|



25 

Analyse des Lastenhefts 

26 

|Zahlungsfrist|Datum|Frist|
|---|---|---|
|Mahnstufe|Ganzzahl|z.B. 1=erste Erinnerung, 2=zweite<br>usw.|
|Erinnerungstext|Text|Standardtext|
|Bemerkung|Text|Wichtige Hinweise|
|Status|Text|Ofen, bezahlt|
|Mahngebühren|Dezimalzahl|Zusätzlich berechnete Gebühren|



89. F.: Auf was referenziert alles ein Kundenauftrag? 

Ein Kundenauftrag referenziert auf jeweils mindestens ein oder mehrere Angebote, Rechnungen und Lieferungen. Außerdem gibt es für jeden Kundenauftrag einen Mitarbeiter, der für den Auftrag verantwortlich ist, sowie eine oder mehrere referenzierte Bestelllisten. 

90. F.: Welche charakteristischen Eigenschaften besitzen die Elemente Angebots-, Lieferungs-, und Rechnungsposten? (Attribute) 

Angebotsposten: 

|**Attribut**|**Datentyp**|**Beschreibung**|
|---|---|---|
|Posten-ID|Ganzzahl|Eindeutige ID|
|Menge|Dezimalzahl|Menge des Postens|
|Einheit|Text|Stück/Meter/kg|
|Bezeichnung|Text|Beschreibung des Postens|
|Einzelpreis (netto)|Dezimalzahl|Preis pro Einheit (ohne MwSt.)|



Rechnungsposten: analog zu Angebotsposten. Hinzu kommt: 

|**Attribut**||**Datentyp**||**Beschreibung**||
|---|---|---|---|---|---|
|Mehrwertsteuer||Dezimalzahl||Betrag der anfallenden MwSt.||
|Lieferungsposten: Analog zu Angebotsposten ohne Preise, weil der Preis in der||||||
|Rechnung steht.||||||



26 

Analyse des Lastenhefts 

27 

91. F.: Welche weiteren Bearbeitungsschritte gibt es? Es gibt nur folgende Bearbeitungsschritte: Erstellung, Änderung, Löschung. 92. F.: Welche Daten müssen für einen Bearbeitungsschritt erfasst werden? Wie soll die Nachvollziehbarkeit umgesetzt werden? Die Nachvollziehbarkeit soll durch eine entsprechende Protokollierung gewährleistet werden, die bei Schreib- und Leseoperationen ausgeführt wird. 93. F.: Muss Datenschutz beachtet werden bei den Kundenaufträgen? Auch hier gelten die DSGVO und die gleichen Anforderungen wie bei den Mitarbeiterdaten (siehe Seite 22). 94. F.: Wer kann Kundenaufträge erstellen und löschen? Nur das kaufmännische Personal und der Admin sollen hierfür berechtigt sein. Ein solcher Kundenauftrag soll von einem Kunden ausgelöst werden. 95. F.: Soll nachträgliches Bearbeiten von Aufträgen möglich sein? Nein. In einem solchen Fall soll eine neue Rechnung erstellt und die alte gelöscht werden. 96. F.: Was heißt es, dass ein Auftrag meist ein oder mehrere Lieferanten hat? Ein Auftrag kann entweder keinen oder mehrere Lieferanten haben. Ein Lieferant kann zu mehreren Aufträgen gehören, muss aber mindestens einem Auftrag zugeordnet sein. 97. F.: Wie soll ein Kundenauftrag dargestellt werden? Wie auch im Fall der Mitarbeiterdaten tabellarisch. 98. F.: Wie häufig soll eine Zahlungserinnerung verschickt werden? Es sollen insgesamt drei Zahlungserinnerungen verschickt werden. Die erste nach 14 Tagen, die zweite nach 30 Tagen und die dritte nach 60 Tagen. 99. F.: Wie soll eine Zahlungsbenachrichtigung funktionieren? Die erste Benachrichtigung soll per E-Mail erfolgen, die beiden weiteren per Post. 

27 

Analyse des Lastenhefts 

28 

||100. F.: Soll das System für postalische Erinnerungen die Briefe automatisch über<br>die Drucker ausdrucken?<br>Ja, das wäre wünschenswert.|
|---|---|
|/LF40/|Es muss eine Terminverwaltung integriert sein. Termine können beliebig lang<br>dauern, auch mehrere Wochen (je nach Kundenaufrag). Einem Kundenaufrag<br>sind entsprechend ein Start- und ein Endtermin zugeordnet. Darüber hinaus<br>können beliebig viele Zwischentermine hinzugefügt werden.<br>Terminüberschneidungen müssen bei Eintragungen vermieden werden.<br>101. F.: Wie sollen die Termine angezeigt werden?<br>Es soll eine Kalenderansicht geben mit der Möglichkeit, zwischen einer Wo-<br>chen-, Monats- und Tagesansicht wechseln zu können. Jeder Termin soll auf den<br>ersten Blick nur Titel, Aufragsnummer, Datum und Uhrzeit anzeigen. Durch<br>farbliche Markierung soll sofort erkennbar sein, ob es sich um einen Haupt-,<br>Zwischen-, internen Termin oder Urlaub handelt. Über einen Button soll eine<br>Detailansicht für alle weiteren Attribute eines Termins geöfnet werden können.<br>Zudem soll es möglich sein, nach dem Titel eines Termins zu suchen.<br>102. F.: Wie sollen die Attribute eines Termins, Starttermins, Endtermins oder<br>Zwischentermins aussehen?<br>Termin:<br>**Attribut**<br>**Datentyp**<br>**Beschreibung**<br>Kundenaufrag<br>Referenz<br>Zugeordneter Kundenaufrag, wenn<br>Haupt- oder Zwischentermin<br>Mitarbeiter<br>Referenz<br>Zugeordneter Mitarbeiter<br>Haupttermin<br>Referenz<br>Referenz Haupttermin, wenn von Ka-<br>tegorie Zwischentermin<br>Titel<br>Text<br>Kurze Beschreibung des Termins<br>Startdatum<br>Datum<br>Start des Termins<br>Enddatum<br>Datum<br>Ende des Termins<br>Startzeit<br>Zeit<br>Uhrzeit des Beginns<br>Enduhrzeit<br>Zeit<br>Uhrzeit des Endes|



28 

Analyse des Lastenhefts 

29 

||Bemerkung<br>Text<br>Ausführlichere Bemerkungen zum<br>Termin<br>Ort<br>Text<br>Wenn Adresse bekannt<br>Kategorie<br>Text<br>Urlaub,<br>Intern,<br>Zwischentermin,<br>Haupttermin<br>103. F.: Wie sollen Zwischentermine, Start- und Endtermine verwaltet werden?<br>Es gibt zwei Arten von Terminen, nämlich den Haupt- und den Zwischentermin.<br>Diese sollen Zwischen-, Start- und Endtermin darstellen. Ein Zwischentermin<br>und ein Haupttermin sind immer einem Kundenaufrag zugeordnet. Ein Haupt-<br>termin soll dabei den gesamten Zeitraum eines Kundenaufrags abdecken. Ein<br>Zwischentermin ist ein Termin, der innhalb eines Haupttermins liegt. Es kann<br>mehrere Zwischentermine geben, die alle auf einen Haupttermin referenzieren.<br>104. F.: Wie sollen Terminüberschneidungen vermieden werden?<br>Überschneidungen sollen durch einen Lese-Check beim Erstellen des Termins<br>verhindert werden.<br>105. F.: Soll im Fall einer Terminüberschneidung eine Fehlermeldung ausgegeben<br>werden?<br>Dann soll das Erstellen eines solchen Termins verhindert werden. Eine Fehler-<br>meldung in Form eines Pop-Ups soll den Benutzer warnen.<br>106. F.: Sollen Termine Mitarbeitern und einem Kundenaufrag zugeordnet sein?<br>Jeder Termin soll mindestens einem Mitarbeiter zugeordnet sein. Wenn es sich<br>um einen Haupt- oder Zwischentermin handelt, dann wird diesem ein Kunden-<br>aufrag zugeordnet. Ein interner Termin oder Urlaub, hat eine solche Referenz<br>nicht.<br>107. F.: Wer kann die Termine sehen, erstellen, bearbeiten, löschen?<br>Mitarbeiter können ihre Termine sehen, anlegen und bearbeiten. Deren Vorge-<br>setzte können die Termine ihrer Mitarbeiter lesen. Administratoren haben<br>grundsätzlich Vollzugrif (Lesen, Bearbeiten, Löschen) auf alle Termine.<br>108. F.: Was ist die maximal erwartete Dauer eines Termins?<br>Es gibt keine Einschränkung. Der Nutzer kann die Dauer festlegen.|
|---|---|



29 

Analyse des Lastenhefts 

30 

||109. F.: Müssen Urlaubstage oder die Abwesenheit von Mitarbeitern bei der<br>Terminerstellung bedacht werden?<br>Durch die Konfiktvermeidung und die Kategorie “Urlaub” sollen solche Kon-<br>fikte bei der Erstellung eines Termins erkannt werden.<br>110. F.: Sollen Erinnerungen oder Benachrichtigungen für anstehende Termine<br>integriert werden?<br>Nein, das ist nicht erwünscht. Stattdessen sollen auf der Dashboard-Seite die<br>heutigen Termine des jeweils eingeloggten Mitarbeiters angezeigt werden – also<br>nur die Termine, die ihm zugeordnet sind.<br>111. F.: Wie soll so eine Dashboard-Seite aussehen?<br>Nach dem Login soll eine übersichtliche Dashboard-Seite angezeigt werden,<br>auf der die für den jeweiligen Mitarbeiter relevanten Informationen direkt<br>sichtbar sind. Neben den heutigen Terminen soll es möglich sein, eine To-Do-<br>Liste zu führen, um sich eigene Aufgaben oder Erinnerungen zu notieren, wie<br>z.B. Rückrufe oder Dinge, die man im Laufe des Tages noch erledigen muss.<br>Des Weiteren sollen neu eingegangene Kundenaufräge angezeigt werden, also<br>Aufräge, die dem Mitarbeiter neu als Verantwortlicher zugeordnet wurden.<br>112. F.: Wie sieht es aus mit laufenden oder abgeschlossenen Kundenaufrägen?<br>Abgeschlossene Kundenaufrägen haben auf der Dashboard-Seite nichts zu<br>suchen. Es sollen jedoch neben den neuen, auch laufende Kundenaufräge zu<br>sehen sein, für die der jeweilige Mitarbeiter verantwortlich ist. Das hilf, jeder-<br>zeit den Überblick über die eigene aktuelle Arbeitslast zu behalten, ohne dafür<br>jedes Mal manuell nach den entsprechenden Aufrägen suchen zu müssen. Dazu<br>reicht es aus, den jeweiligen Aufragstitel und die Aufragsnummer anzuzeigen.<br>Uns ist besonders wichtig, dass ein Mitarbeiter auf einen Blick erkennen kann,<br>was heute für ihn ansteht, ohne lange suchen oder sich durch Menüs klicken zu<br>müssen.|
|---|---|
|/LF50/|Für jeden Kundenaufrag können beliebige Materialien bei verschiedenen Liefe-<br>ranten beschaft werden.<br>113. F.: Welche charakteristischen Eigenschafen besitzen die Elemente Kunden-<br>aufrag, Material und Lieferanten? (Attribute)|



30 

Analyse des Lastenhefts 

31 

Für die Attribute von Lieferanten und Kundenaufträgen siehe Seite 22 und Seite 24. Material: 

|**Attribut**|**Datentyp**|**Beschreibung**|
|---|---|---|
|Materialnummer|Ganzzahl|Eindeutige ID|
|Bezeichnung|Text|Klarer Name, z.B. Laminat Eiche,<br>8mm, 1m^2|
|Beschreibung|Text|Detailinfos, z.B. Farbe, Größe|
|Einheit|Text|z.B. Stück, Meter, kg|
|Kategorie|Text|z.B. Baustofe, Konstruktionsholz,<br>Bodenbeläge, etc.|



114. F.: Heißt beliebig viel, dass einem Kundenauftrag auch keine Materialien zugeordnet werden können? Ja. 

Da noch nicht bei allen Lieferanten über das Internet oder E-Mail bestellt werden kann (z.B. bei vielen Kleinbetrieben), soll eine Bestellliste interaktiv erstellt und als Bestellung ausgedruckt werden können. Dazu sollen leicht erweiterbare, branchenspezifische Auswahllisten eingesetzt werden, um den Erstellungsprozess zu vereinfachen (die vielen Listen stellen wir zur Verfügung, es handelt sich um einfache Zeichenkettenlisten, die im System verarbeitet werden sollen). 

115. F.: Was soll in diesen Auswahllisten und Bestelllisten enthalten sein? 

Bestellliste 

|**Attribut**|**Datentyp**|**Beschreibung**|
|---|---|---|
|Bestell-ID|Ganzzahl|Eindeutige ID|
|Materialnummer|Referenz|Referenz auf Material|
|Lieferantennummer|Referenz|Referenz auf Lieferant|
|Menge|Dezimalzahl|Menge des Materials|
|Bestellungsname|Text|Name der Bestellung|



31 

Analyse des Lastenhefts 

32 

|Datum<br>Datum<br>Datum der Bestellung<br>Hinweis<br>Text<br>Zusätzliche Informationen zur<br>Bestellung<br>Auswahlliste<br>**Attribut**<br>**Datentyp**<br>**Beschreibung**<br>Auswahl-ID<br>Ganzzahl<br>Eindeutige ID<br>Name<br>Text<br>Name der Auswahlliste (bspw. „Auswahl<br>für Torte“)<br>116. F.: Gibt es ein genaues Format für die Zeichenkettenlisten bzw. Auswahllis-<br>ten? Wie sollen diese erweiterbar sein?<br>Es handelt sich wie gesagt um Zeichenkettenlisten. Diese werden als JSON<br>bereitgestellt und sollen beim Erstellen einer solchen Bestellliste eingelesen<br>werden. Die Auswahllisten können so einfach durch die JSON-Dateien erweitert<br>werden.|Datum|Datum|Datum|Datum|Datum der Bestellung|
|---|---|---|---|---|---|
||Hinweis||Text||Zusätzliche Informationen zur<br>Bestellung|
||Auswahlliste|||||
||**Attribut**|**Datentyp**||**Beschreibung**||
||Auswahl-ID|Ganzzahl||Eindeutige ID||
||Name|Text||Name der Auswahlliste (bspw. „Auswahl<br>für Torte“)||



117. F.: Können Sie ein konkretes Beispiel für eine solche Auswahlliste geben? `{ JSON "branchen": [ { "branche": "Bäcker", "auswahlliste": [ { "bezeichnung": "Torte", "lieferanten": ["Mühlen AG", "Backwaren GmbH"], "materialien": ["Sahne", "Zucker", "Mehl"] }, { "bezeichnung": "Brezel",` 

32 

Analyse des Lastenhefts 

33 

`"lieferanten": ["Bäcker Müller", "Backwaren GmbH"], "materialien": ["Salz", "Teig", "Wasser"] }, ... ] }, { "branche": "Elektroinstallateure", "auswahlliste": [...] }, ] }` 118. F.: Wie soll das Material und der Lieferant zugeordnet werden, wenn der Name nicht eindeutig ist? Es darf kein Material und Lieferant mit demselben Namen existieren. Intern: Die Eindeutigkeit des Namens muss beim Erstellen eines solchen Eintrags berücksichtigt werden. 119. F.: Wie wird entschieden was für Auswahllisten geladen werden müssen? Je nach Branche, in der die Anwendung verwendet wird. 120. F.: Wer soll Auswahllisten anpassen dürfen? Die Auswahllisten sollen auf Wunsch des Anwenders durch den Administrator erweiterbar sein. Dafür muss die zugrundliegende JSON-Datei bearbeitet werden. 121. F.: Was bedeutet konkret interaktiv in diesem Fall? Dem Benutzer wird die gesamte Auswahlliste der Branche angezeigt. Diese besteht aus einer Liste von Materialien und Lieferanten. Aus dieser Liste können mehrere Kombinationen durch Auswählen zu einer Bestellliste zusammengestellt werden. 

33 

Analyse des Lastenhefts 

34 

||122. F.: Welche Benutzer dürfen eine Bestellliste erstellen?<br>Bestelllisten dürfen vom kaufmännischen Personal und vom Administrator<br>erstellt werden.<br>123. F.: Darf eine Bestellliste nur aus Kombinationen von Materialien und Liefe-<br>ranten bestehen, die in der Auswahlliste vorkommen?<br>Ja, für Kombinationen für die jeweilige Branche.<br>124. F.: Wie soll die Bestellliste den Lieferanten zugänglich gemacht werden?<br>Die Bestellliste soll als PDF-Dokument erzeugt und anschließend manuell an<br>den Lieferanten übergeben werden, per E-Mail oder postalisch. Ein direkter<br>Versand aus der Sofware heraus ist nicht vorgesehen.<br>125. F.: Soll eine Bestellung per Internet oder E-Mail dennoch unterstützt werden?<br>Die Bestellung kann selbstverständlich auch über das Internet erfolgen, muss<br>dann aber manuell in der Sofware erfasst werden. Für eine Bestellung per Mail<br>kann zunächst eine Bestellliste erstellt werden, die dann als PDF-Dokument an<br>den Lieferanten gesendet wird.|
|---|---|
|/LF60/|Neben den Kundenaufrägen gibt es noch eigene Aufräge an andere Firmen (z.B.<br>bzgl. Wartung, Reparatur, Beschafung (s. /LF50/) u.v.m. Auch hierfür gibt es<br>Angebote und Rechnungen, die verwaltet werden müssen.<br>126. F.: Wie unterscheiden sich eigene Aufräge an andere Firmen von Kunden-<br>aufrägen in der Verwaltung?<br>Eigene Aufräge haben keinen Status, da dieser abhängig von der externen<br>Firma ist und somit immer aktualisiert werden müsste, wozu die Firma keine<br>Berechtigungen hätte. Zudem sind einem Eigenaufrag normalerweise keine<br>Lieferung, Mitarbeiter oder Betriebsmittel zugeordnet. Dementsprechend sieht<br>ein Eigenaufrag folgendermaßen aus:<br>**Attribut**<br>**Datentyp**<br>**Beschreibung**<br>Aufragsnummer<br>Ganzzahl<br>Eindeutige ID<br>Aufragsdatum<br>Datum<br>Datum der Aufragserstellung<br>Kostenstelle<br>Text<br>Kostenstelle des Aufrags<br>Kategorie<br>Text<br>Beschafung, Reparatur|



34 

Analyse des Lastenhefts 

35 

||Bemerkung||Text||Wichtige Hinweise||
|---|---|---|---|---|---|---|
|127. F.: Welche Arten von eigenen Aufrägen an andere Firmen gibt es konkret?|||||||
||Folgende Arten werden hier in Betracht gezogen: Beschafung von Werkzeugen||||||
||und Anlagen, Wartung von Werkzeugen und Anlagen.||||||
|128. F.: Soll die beaufragte Firma referenziert werden? Oder reichen hierfür die|||||||
|Lieferantendaten?|||||||
||Das Speichern von Firmendaten für z.B. Eigenaufräge wäre sinnvoll. Die Daten||||||
||entsprechen nicht denen der Lieferanten.||||||



|**Attribut**<br>**Datentyp**<br>**Beschreibung**<br>Firmennummer<br>Text<br>Eindeutige ID<br>Adresse<br>Referenz<br>Referenzierte Adresse der Firma<br>Firmenname<br>Text<br>Name der Firma<br>E-Mail<br>Text<br>E-Mail-Adresse der Firma<br>Telefonnummer<br>Ganzzahl<br>Telefonnummer der Firma<br>Ansprechperson<br>Text<br>Vor- und Nachname der Ansprech-<br>person<br>129. F.: Wie soll das Angebot eines solchen Aufrags aussehen?<br>Es sollen sich mehrere Angebote von mehreren Firmen eingeholt werden. Ein<br>Angebot soll ausgewählt werden.<br>130. F.: Wann gilt ein Eigenaufrag als beendet?<br>Ein solcher Aufrag gilt mit einer Rechnung beendet.<br>131. F.: Wer legt die Aufräge an und wer ist dafür verantwortlich? Gibt es Rollen<br>mit bestimmten Berechtigungen?<br>Die Aufräge werden vom kaufmännischen Personal und dem Administrator<br>erstellt. Zusätzlich dürfen Mitarbeiter die Aufräge einsehen und bearbeiten. Sie<br>können auch die referenzierten Firmendaten bearbeiten.|**Attribut**|**Datentyp**|**Beschreibung**|
|---|---|---|---|
||Firmennummer|Text|Eindeutige ID|
||Adresse|Referenz|Referenzierte Adresse der Firma|
||Firmenname|Text|Name der Firma|
||E-Mail|Text|E-Mail-Adresse der Firma|
||Telefonnummer|Ganzzahl|Telefonnummer der Firma|
||Ansprechperson|Text|Vor- und Nachname der Ansprech-<br>person|



35 

Analyse des Lastenhefts 

36 

|/LF70/|Die grafsche Benutzungsoberfäche soll die Suche nach Kundenaufrägen, Kun-<br>den und Lieferanten bieten. Die Ergebnisse sollen in Listenform dargestellt<br>werden.<br>132. F.: Nach welchen Attributen soll gesucht werden können?<br>Es soll bei Kundenaufrägen nach folgenden Attributen gesucht werden können:<br>• Kundennummer<br>• Aufragsnummer<br>Bei Lieferanten nach:<br>• Lieferantennummer<br>• Firmenname<br>• E-Mail<br>• Produkte und Dienstleistungen<br>• Vertragsbeginn/-ende<br>Bei Kunden nach:<br>• Kundennummer<br>• Firmenname<br>• Ansprechperson (Vor- oder Nachname)<br>Bei Firmen nach:<br>• Firmennummer<br>• Firmenname<br>• Ansprechperson<br>133. F.: Soll ausgewählt werden können, nach welchen Attributen gesucht wird?<br>Oder sollen immer alle Attribute durchsucht werden?<br>Es soll von dem Benutzer vor der Eingabe ausgewählt werden, nach welchem<br>Attribut gesucht werden soll.<br>Intern: Die Auswahl kann mit einem Dropdown geschehen.<br>134. F.: Sollen mehrere Filter bzw. Suchkriterien gleichzeitig kombinierbar sein?<br>Nein, es soll wie gesagt immer nur nach einem Attribut gleichzeitig gesucht<br>werden können.<br>135. F.: Wie soll sichergestellt werden, dass die richtigen Datentypen für die<br>Attribute eingegeben werden?|
|---|---|



36 

Analyse des Lastenhefts 

37 

||Wird bspw. für den Vertragsbeginn kein Datum eingegeben, dann sollte dies zu<br>einem Fehler führen und die Suche soll nicht ausgeführt werden. Die Eingabe<br>muss mit den spezifzierten Datentypen übereinstimmen.<br>136. F.: Wie soll dies in Listenform dargestellt werden?<br>In Form einer Tabelle soll dies dargestellt werden mit den Attributen als Spalten<br>und den Werten als Reihen.<br>137. F.: Wie soll die Suche bei Attributen erfolgen, die mehrere Werte enthalten<br>können (Vertragsbeginn/-ende oder Produkte, Name)?<br>In einem solchen Fall stimmt die Suche mit dem Tupel überein, wenn ein Teil<br>des Attributs bereits übereinstimmt.<br>Nach der Selektion eines Listeneintrags sollen sämtliche Informationen über das<br>Element mit allen Referenzen direkt angezeigt werden.<br>138. F.: Welche Informationen sollen nach einer Suche angezeigt werden?<br>Es sollen alle Tupel gezeigt werden, die mit der Suche übereinstimmen. Alle<br>Attribute (Spalten) dieser Tupel sollen dargestellt werden.<br>139. F.: Welche Referenzen sollen angezeigt werden, z.B. Rechnungen, Angebote,<br>Lieferantendaten?<br>Bei Attributen, die auf ein anderes Element verweisen, soll deren Nummer<br>angezeigt werden. Diese Nummer soll eine Verlinkung darstellen, sodass man<br>durch einen Klick direkt zur Detailansicht des referenzierten Elements kommt,<br>wie z.B. zur vollständigen Rechnung über die Rechnungsnummer.<br>140. F.: Bedenken Sie bitte zudem, dass der Suchalgorithmus bei hohem Daten-<br>aufommen durchaus einige Zeit brauchen kann.<br>Das bekommen Sie sicher hin. Sorgen Sie einfach dafür, dass die Benutzbarkeit<br>der Applikation nicht darunter leidet.<br>Intern: Ein Anzeigen eines Ladebalkens wäre hilfreich. Bereits gefundene Einträ-<br>ge sollten angezeigt werden, während die Suche weiterläuf.|
|---|---|
|/LF80/|Alle Aufräge werden nach Übertragung an das Finanzbuchhaltungssystem dort<br>weiterverarbeitet (Aufragsvergabe, Rechnungsstellung usw.). Eine Aktualisie-<br>rung der Zustände der Aufräge (gestartet, laufend, ausgeführt, Rechnung gestellt,<br>…) erfolgt durch Abrufen der Aufragsdaten vom Finanzbuchhaltungssystem.|



37 

Analyse des Lastenhefts 

38 

141. F.: Ist dieses System Teil von dem bestehenden FiBuSys? 

Das System ist Teil des FiBuSys. Allerdings beschäftigt es sich nicht mit den Mitarbeiterdaten (siehe Abschnitt 2.2.4), sondern nur mit der Verwaltung von Aufträgen. 142. F.: Was für Schritte umfasst die Verwaltung der Aufträge? Das FiBuSys setzt alle Zustände zwischen der Erstellung (Status „gestartet“) und dem Abschluss (Status „bezahlt und abgeschlossen“) um. 143. F.: Was für eine Bedeutung haben die einzelnen Zustände eines Auftrags? Ein solcher Auftrag gilt als „laufend“ sobald er an das FiBuSys übermittelt wird. In Rechnung wird ein Auftrag gestellt, wenn dieser den Zustand “ausgeführt” annimmt. Wenn eine Rechnung an das FiBuSys übermittelt wurde, wird der Zustand auf “in Rechnung gestellt” gesetzt. Ein Auftrag gilt als bezahlt, wenn die Rechnung bezahlt wurde. Das Setzen auf „abgeschlossen & bezahlt“ erfolgt im eigentlichen System, wenn der Haupttermin vorbei ist. 

144. F.: Wie wird der Status verwaltet? 

Der Status eines Auftrags wird nach Erstellung im FiBuSys vom Personal oder einem Mitarbeiter angepasst. Im Fall, dass ein Kunde per Terminal bezahlt, wird der Status auf „bezahlt“ automatisch gesetzt. 145. F.: Wie erfolgt die Verwaltung des Status im Finanzbuchhaltungssystem? Das Finanzbuchhaltungssystem ist eine eigene Anwendung mit einem UI, in welcher der Status eines Auftrags geändert werden kann. Wenn per Terminal bezahlt wird, dann wird der Status einer Rechnung auf abgeschlossen gesetzt. Der Beleg wird nämlich an das Finanzbuchhaltungssystem übergeben. 146. F.: Wie oft sollen Aufträge an das Finanzbuchhaltungssystem synchronisiert werden? Bei der Erstellung eines Auftrags sollen diese automatisch an das Finanzbuchhaltungssystem weitergeleitet werden, um dort weiterverarbeitet zu werden. 147. F.: Was für Daten benötigt das FiBuSys? Es werden alle Rechnungs-, Angebotsdaten und die unmittelbaren Attribute eines Auftrags benötigt, die in der Anwendung gespeichert sind. 

38 

Analyse des Lastenhefts 

39 

||148. F.: Wo wird der Zustand der Aufräge gesetzt und soll dieser im jeweils<br>anderen System synchronisiert werden?<br>Der Zustand eines Kundenaufrags wird innerhalb der Anwendung mit<br>dem Attribute „Status“ dargestellt. Geändert wird dieser Wert innerhalb des<br>Finanzbuchhaltungssystems. Das Finanzbuchhaltungssystem soll daher einen<br>Endpunkt bereitstellen, in dem der Status aller Aufräge mit Rechnungsnummer<br>abgerufen werden kann.<br>149. F.: Werden vom Finanzbuchhaltungssystem sonst noch Daten zurückgegeben<br>und wenn ja welche?<br>Nein, nur der Status eines Aufrags wird zurückgegeben.<br>150. F.: Wie häufg soll der Status in der Anwendung aktualisiert werden?<br>Einmal stündlich würde reichen.|
|---|---|
|/LF90/|Schließlich sollen noch die eigenen Werkzeuge und Anlagen verwaltet werden.<br>151. F.: Welchen Zweck soll die Verwaltung erfüllen? Was soll hierdurch abge-<br>deckt werden?<br>Wenn ein Werkzeug oder eine Anlage kaputt ist, sollte dies in dem System<br>verwaltet werden. Zusätzlich soll durch das System der Verbrauch einer Anlage<br>eingeschätzt werden können. Es soll außerdem verwaltet werden, wenn der<br>TÜV einer Anlage abläuf.<br>152. F.: Was sollen die erfassten Eigenschafen sein?<br>Werkzeug:<br>**Attribut**<br>**Datentyp**<br>**Beschreibung**<br>Name<br>Text<br>Name des Werkzeugs<br>Gewicht<br>Dezimalzahl<br>Gesamtgewicht<br>Breite<br>Dezimalzahl<br>Breite des Werkzeugs<br>Höhe<br>Dezimalzahl<br>Höhe des Werkzeugs<br>Tiefe<br>Dezimalzahl<br>Tiefe des Werkzeugs<br>Zustand<br>Text<br>Benutzbar, Kaputt, In Wartung|



39 

Analyse des Lastenhefts 

40 

|Anlage:|Anlage:|Anlage:|
|---|---|---|
|**Attribut**|**Datentyp**|**Beschreibung**|
|Name|Text|Name des Werkzeugs|
|Gewicht|Dezimalzahl|Gesamtgewicht|
|Breite|Dezimalzahl|Breite der Anlage|
|Höhe|Dezimalzahl|Höhe der Anlage|
|Tiefe|Dezimalzahl|Tiefe der Anlage|
|TÜV|Datum|Enddatum des TÜV|
|Krafstof|Text|Benzin oder Strom|
|Stromverbrauch|Dezimalzahl|kWh oder barrel|
|Zustand|Text|Benutzbar, Kaputt, In Wartung|



153. F.: Sollen Auswertungen möglich sein? Bspw. wie hoch ist der Stromverbrauch oder wie viele Geräte sind derzeit in Wartung? Auswertungen dieser Art sind zunächst nicht geplant. Werkzeuge und Anlagen sollen verwaltet werden. Weitere Funktionalitäten wären für eventuelle Plugins denkbar. 154. F.: Gibt es unterschiedliche Kategorien oder Typen von Werkzeugen/Anlagen (z.B. Elektrogeräte, Baugeräte, Prüfgeräte)? Nein, nach solchen Kategorien soll nicht aufgeschlüsselt werden. 155. F.: Wer darf Werkzeuge und Anlagen bearbeiten oder den Zustand ändern? Werkzeuge und Anlagen können von dem Administrator und ausgewählten Personal bearbeitet werden. D.h. hinzufügen, bearbeiten, löschen. 156. F.: Gibt es Barcodes oder Labels auf den Werkzeugen, die eine Identifikation ermöglichen? Standardmäßig haben die Geräte keine solche Nummerierung. Allerdings könnte hierzu die Nummer des Werkzeugs oder der Anlage aus dem System verwendet werden. 

40 

Analyse des Lastenhefts 

41 

|/LF100/|Sämtlichen Elementen sollen mehrere Bilder mit Titel zugeordnet werden kön-<br>nen, die zentral auf einem Verzeichnis liegen sollen.<br>157. F.: Welche Attribute hat das Bild?<br>Bild:<br>**Attribut**<br>**Datentyp**<br>**Beschreibung**<br>Werkzeug/Anlage<br>Referenz<br>Referenzierte Anlage oder Werk-<br>zeug<br>Kategorie<br>Text<br>Werkzeug oder Anlage<br>Titel<br>Text<br>Titel des Bildes<br>Referenz<br>Verweis<br>Verweis auf das eigentliche Bild<br>158. F.: Sollen Metadaten zu den Bildern gespeichert werden (EXIF)?<br>Das Bild hat keine Metadaten, weil diese nicht benötigt werden.<br>159. F.: Beziehen die Elemente sich ausschließlich auf Werkzeuge und Anlagen?<br>Ja, mit Bildern sind nur Werkzeuge und Anlagen gemeint, da ein Bild von den<br>Materialien für die Wartung nicht relevant ist.<br>160. F.: Wie soll der Titel eines Bildes gesetzt werden?<br>Standardmäßig soll der Titel aus dem Namen der referenzierten Anlage oder des<br>referenzierten Werkzeugs genommen werden. Der Nutzer soll allerdings den<br>Titel beim Hinzufügen eines Bildes bearbeiten können.<br>161. F.: Welches Bildformat soll unterstützt werden?<br>Die Formate_jpg_und_png_sollen unterstützt werden.<br>162. F.: Wie groß sollen die Dateien maximal sein?<br>Die maximale Dateigröße soll 4MB betragen.<br>163. F.: Wo sollen die Bilder abgelegt werden?<br>Dies ist Ihnen überlassen. Kann sowohl in der Datenbank als auch in einem<br>Dateiverzeichnis abgelegt werden.|
|---|---|



41 

Analyse des Lastenhefts 

42 

||Intern: Hierfür würde sich evtl. BLOB-Datentyp eignen.<br>164. F.: Dürfen Benutzer Bilder hochladen, ändern oder löschen?<br>Die Nutzer, die das Recht auf Werkzeuge und Anlagen haben, können bei der<br>Erstellung oder Bearbeitung diese Bilder hinzufügen. Dies sind die Rollen des<br>Administrators und des kaufmännische Personals.<br>165. F.: Wie sollen die Dateien auf dem Verzeichnis abgelegt werden (bestimmte<br>Benennung)?<br>Von unserer Seite gibt es hierfür keine Anforderungen.|
|---|---|
|/LF110/|Vor dem Hinzufügen von neuen Daten soll eine Überprüfung stattfnden, ob diese<br>eventuell schon vorhanden sind.<br>166. F.: Was wird überprüf?<br>Es wird überprüf, ob Datensätze mit identischen Schlüsselattributen (Kun-<br>dennummer, Mitarbeiternummer, Lieferantennummer, Firmennummer) bereits<br>existieren. Bei Material und Lieferanten muss zudem der Name eindeutig sein<br>(siehe Seite 30).<br>167. F.: Was passiert, wenn ein Konfikt erkannt wird?<br>Der Nutzer soll durch ein Pop-Up gewarnt werden, wenn er versucht einen<br>Eintrag mit Duplikat zu erstellen.<br>168. F.: Gilt die Überprüfung nur für alle Werkzeuge und Anlagen?<br>Die Überprüfung gilt sowohl für Werkzeuge und Anlagen als auch für Kunden,<br>Mitarbeiter, Lieferanten und Aufräge.<br>169. F.: Soll diese Überprüfung nur beim Hinzufügen stattfnden?<br>Beim Löschen sollte eine Warnung ausgegeben werden, wenn das zu löschende<br>Element mit einer Referenz aus der Datenbank entfernt werden soll. Wenn<br>beispielsweise ein Werkzeug oder eine Anlage gelöscht wird, dann darf es keine<br>Bilder mehr geben, die eine Referenz auf diese haben.<br>170. F.: Sollen Administratoren gesonderte Rechte für die Aufösung oder Verwal-<br>tung von Duplikaten haben?<br>Nein, auch der Administrator soll keine Duplikate anlegen können.|



42 

Analyse des Lastenhefts 

43 

## **2.2.6 Produktdaten** 

|/LD10/|Die Daten sollen in einer zentralen Datenbasis abgespeichert werden.<br>171. F.: Gibt es bereits ein Backup-System?<br>Ja, jeden Monat wurde händisch ein Backup erstellt, indem Kopien der Daten<br>auf eine andere Festplatte angelegt wurden.<br>172. F.: Gibt es Anforderungen an ein Backup-System?<br>Einmal im Monat soll ein Backup automatisch ausgeführt werden. Es kann<br>jedoch jederzeit auch manuell ausgelöst werden von dem Administrator.<br>Intern: Hierzu kann die Import und Export-Funktionalität genutzt werden.|
|---|---|



## **2.2.7 Produktleistungen** 

|/LL10/|Die Anzahl der zu verwaltenden Elemente wird auf ca. 100.000 geschätzt.<br>173. F.: Was für Elemente fallen in diese Kategorie?<br>Zu diesen Elementen zählen alle Elemente wie Kunden, Aufräge, Rechnungen,<br>Materialien, Lieferanten, Werkzeuge, Anlagen, Angebote sowie die jeweiligen<br>Posten dieser Dokumente.<br>174. F.: Ändert sich diese Datenbasis regelmäßig und in welchem Maße?<br>Ja, die Datenbasis ändert sich kontinuierlich. Täglich kommen neue Aufräge,<br>Angebote und Rechnungen hinzu. Gleichzeitig werden bestehende Einträge<br>aktualisiert oder archiviert. Im Durchschnitt wird mit ca. 100–500 Änderungen<br>pro Tag gerechnet.|
|---|---|
|/LL20/|Um bei möglichst allen Kunden unsere Sofware installieren und ausführen zu<br>können muss zwingend auf Plattformunabhängigkeit geachtet werden.<br>175. F.: Was für Plattformen fallen in diese Unabhängigkeit?<br>Die Plattformunabhängigkeit bezieht sich darauf, dass die Sofware auf verschie-<br>denen Windows-Versionen (Windows 10, Windows 11), MacOS 13, 14, 15 und<br>Ubuntu 20.04 oder höher problemlos läuf. Mobile Geräte sollen über die Web-<br>Applikation angebunden werden können in der Zukunf.|



43 

Analyse des Lastenhefts 

44 

## **2.2.8 Qualitätsanforderungen** 

|Produktqualität|sehr gut|gut|normal|nicht relevant|
|---|---|---|---|---|
|Funktionalität||X|||
|Zuverlässigkeit||X|||
|Efzienz||X|||
|Benutzbarkeit (auch Gestaltung)|X||||
|Wartbarkeit|||X||
|Übertragbarkeit (Portabilität)||X|||



176. F.: In welchem Sinne ist Wartbarkeit gemeint? 

Wartbarkeit bezieht sich darauf, dass die Software modular aufgebaut ist, sodass einzelne Komponenten (z.B. GUI, Datenbankzugriffe, Business-Logik) unabhängig voneinander gepflegt und aktualisiert werden können. Fehlerbehebungen oder Erweiterungen sollen so mit minimalem Aufwand möglich sein. 

177. F.: Soll diese Wartung von dem Distributionsunternehmen übernommen werden oder wird dies an den Handwerksbetrieb ausgelagert? 

Die Wartung der Software wird primär vom Distributionsunternehmen übernommen. Der Handwerksbetrieb kümmert sich lediglich um kleinere administrative Aufgaben wie Nutzerverwaltung oder die Pflege von Konfigurationsdateien. 

178. F.: Steht dies nicht in einem Widerspruch zu der Anforderung mit Plugins? 

Nein, die Wartung der Kernsoftware und die der Plugins sind getrennt zu betrachten. Die Plugins werden entweder vom Distributionsunternehmen selbst entwickelt oder über zertifizierte Partner bezogen. Dadurch bleibt die Wartbarkeit der Hauptanwendung gewährleistet. 

44 

Analyse 

45 

## **3 Analyse** 

## **3.1 Use-Case-Diagramm** 

Im Rahmen der in diesem Abschnitt folgenden Use-Case-Analyse wird die Funktionalität der gesamten Anwendung untersucht und verdeutlicht. Zunächst wird ein allgemeines UseCase-Diagramm erstellt. Hierbei wird ein funktionsorientierter Ansatz verfolgt, so kann differenzierter auf die einzelnen Funktionalitäten eingegangen werden. Beispielhaft wurde für einen Use-Case eine Verfeinerung vorgenommen, um die Funktionalität des Verwaltens im Bezug auf einen Termin näher darzustellen. 

## **3.1.1 Rollen-Erläuterung der Anwendung** 

Das Diagramm wird aus sechs Akteuren zusammengesetzt, von denen die meisten den Rollen in der Anwendung entsprechen, wie sie auch im Lastenheft erwähnt wurden. Lediglich der Kunde ist ein externer Akteur, der nicht in der Anwendung vorkommt. Der Mitarbeiter ist eine zusätzlicher Akteur, der Verhalten anderer Akteure vereint. 

## **Mitarbeiter** 

Hierbei handelt es sich um eine Basisrolle, die Grundlage vieler weiterer Benutzer ist. Dies ist allerdings eine fiktive Rolle, die den Anforderungen des Lastenheftes entsprechend keinem Endnutzer direkt zugewiesen wird. Diese Rolle wurde eingeführt, um die Gemeinsamkeiten der anderen Rollen durch Generalisierungen der Akteure deutlicher darzustellen. Jeder Mitarbeiter verfügt über die Fähigkeit, seine eigenen Termine zu verwalten und die GUI zu konfigurieren. Außerdem kann er nach kaufmännischen Daten, wie sie unten beschrieben werden, suchen & filtern. Allerdings gilt dies nur für Daten, die direkt in Aufträgen vorkommen, denen er zugeordnet ist. So kann er auf Lieferanten und Rechnungsdaten zugreifen, die in ihm zugeordneten Aufträgen vorkommen. 

## **Ausgewählter Mitarbeiter** 

Der Lagermitarbeiter, oder auch ausgewählte Mitarbeiter genannt, umfasst alle Funktionalitäten eines Mitarbeiters und ist zusätzlich für die Verwaltung von Werkzeugen und Anlagen befähigt. Darunter zählt auch das Verwalten der Bilddokumentation für die Werkzeuge und Anlagen. 

## **Kaufmännisches Personal** 

Das kaufmännische Personal umfasst ebenso die Funktionen eines Mitarbeiters. Darüber hinaus hat diese Rolle die meisten Funktionalitäten. So wird von dieser Rolle vorwiegend das Lesen und Bearbeiten von kaufmännischen Daten vorgenommen (siehe Abschnitt 3.2 kaufmännische Daten bearbeiten). 

45 

Analyse 

46 

## **Vorgesetzter** 

Vorgesetzte haben Leserechte auf sämtliche Daten der ihnen zugeordneten Mitarbeiter. Diese zugeordneten Mitarbeiter können entweder ausgewählte Mitarbeiter oder kaufmännisches Personal sein. Vorgesetzte dürfen allerdings keinen dieser ihnen untergeordneten Datensätze anlegen oder bearbeiten, sondern lediglich einsehen. Dies gilt selbstverständlich nicht für die eigenen Daten des Vorgesetzten. Allerdings haben Vorgesetzte das Recht, Mitarbeiterdaten zu verwalten und auf Anlagedaten lesend zuzugreifen. 

## **Administrator** 

Der Administrator verfügt über sämtliche Rechte innerhalb der Anwendung. Der Übersicht halber wurden diese Vererbungen zu Lagermitarbeiter, kaufmännischen Personal, Vorgesetzten und Kunden nicht explizit dargestellt. Neben der vollen Daten-Zugriffsberechtigung berechtigt diese Rolle zu Systemverwaltungs-Funktionen wie das Anlegen und Zuweisen von Benutzerrollen, das manuelle Erstellen von Backups, das Importieren und Exportieren von Daten. 

## **Kunde** 

Der Kunde ist ein externer Akteur, der vorwiegend indirekt mit dem System interagiert, wenn das kaufmännische Personal Kundenaufträge verwaltet. Hierbei wird diese Aktion durch das kaufmännische Personal abgewickelt, auch wenn der Kunde dies auslöst. Direkt tritt der Kunde mit dem System in Berührung, wenn eine Bezahlung über die Terminals stattfindet. 

46 

Analyse 

47 

## **3.2 Use-Case Diagramm der gesamten Anwendung** 

Abbildung 1 — Use-Case-Diagramm der gesamten Anwendung 

Wenn in dem Use-Case-Diagramm die Rede von “verwalten” ist, dann ist hiermit sowohl das Lesen als auch die Bearbeitung der erwähnten Elemente gemeint. Diese Wahl ist weniger präzise, ermöglicht allerdings eine Zusammenfassung der Use-Cases, wenn eine Unterscheidung sowieso nicht nötig ist, weil sich das Verwalten von einzelnen Funktionen nicht groß unterscheidet. Ebenso, der Einfachheit halber, werden keine Pfeilspitzen von Akteuren zu UseCases dargestellt, solange die Richtung nicht relevant ist. 

## **Daten übertragen** 

Ermöglicht den manuellen oder automatisierten Transfer von Daten zwischen der Anwendung und externen Systemen – etwa für Backup-Prozesse. 

## **Backup erstellen** 

Erzeugt ein Sicherungsabbild der zentralen Datenbasis. Diese Funktionalität kann nach dem Lastenheft automatisch oder bei Bedarf manuell ausgelöst werden. Zweiterer Fall ist hier dargestellt. 

## **Rollen vergeben** 

Dies ist ein administrativer Vorgang zur Zuweisung und Verwaltung von Benutzerrollen mit 

47 

Analyse 

48 

entsprechenden Zugriffs- und Bearbeitungsrechten innerhalb der Software. Beispielsweise die Festlegung, wer die Rollen des kaufmännischen Personals, des Vorgesetzten oder des ausgewählten Mitarbeiters hat. 

## **Termine verwalten** 

Ermöglicht das Anlegen, Bearbeiten und Löschen von Terminen im betrieblichen Kalender. Mit dieser Art der Darstellung wurde entgegen den meisten anderen Use-Cases ein elementgetriebener Ansatz gewählt, der aber zu eine besseren Übersichtlichkeit in der Übersicht der Anwendung führt und dementsprechend in einer Verfeinerung näher betrachtet wird (siehe Abschnitt 3.3). 

## **GUI konfigurieren** 

Bietet dem Nutzer die Möglichkeit, Einstellungen zur Benutzeroberfläche lokal vorzunehmen. 

## **Material & Werkzeug lesen** 

Erlaubt ausgewählten Nutzern das Einsehen von Material- und Werkzeugbeständen. Material und Werkzeug fallen unter die Kategorie “Kaufmännische Daten” und können dementsprechend über ein eigenes Use-Case von dem kaufmännischen Personal bearbeitet werden. 

## **Mitarbeiterdaten verwalten** 

Ein Vorgesetzter besitzt die Fähigkeit, die Benutzerdaten, der von ihm untergeordneten Mitarbeitern einzulesen. Das kaufmännische Personal kann hingegen alle Mitarbeiterdaten verwalten. Ein Vorgesetzter hat Lesezugriff auf Anlagen und Werkzeuge, während das kaufmännische Personal Vollzugriff auf Werkzeuge und Anlagen hat. Die Erstellung und Verwaltung von Werkzeugen und Anlagen umfasst ebenso die Bilddokumentation. Bilder werden entsprechend dem Lastenheft bei der Erstellung oder Bearbeitung eines solchen Eintrags hinzugefügt und beim Löschen eines Werkzeugs oder einer Anlage wieder entfernt. 

## **Kaufmännische Daten bearbeiten** 

Das kaufmännische Personal ist in der Lage kaufmännische Daten zu bearbeiten. Unter den Begriff „kaufmännische Daten“ fallen alle Betriebsdaten: Personal, Kunden, Angebote, Rechnungen, Firmen, Lieferung, Zahlungserinnerung. Die Bearbeitung von kaufmännischen Daten kann direkt durch das kaufmännische Personal erfolgen, kann aber auch im Zuge der Erstellung eines Kundenauftrags vorgenommen werden. 

## **Kaufmännische Daten lesen** 

Unter kaufmännische Daten fallen die Daten wie sie oben beschrieben sind. Diese Daten können direkt von dem kaufmännischen Personal gelesen werden. Das Lesen kann aber auch Bestandteil des Erstellens von Bestelllisten, des Suchens & Filterns oder dem Drucken von Rechnungen und Angeboten sein. Für das Lesen dieser Daten müssen zudem Daten aus dem FiBuSys gelesen werden. Das Suchen und Filtern bezieht sich auf die Attribute wie sie in Seite 36 beschrieben sind. 

## **Bezahlen per Terminal** 

Dies ist Teil des FiBuSys-Systems. Für die kaufmännischen Daten werden benötigte Informationen für Zahlungen aus dem System geholt. Dies betrifft beispielsweise Lohn und Gehaltsabrechnungen. 

48 

Analyse 

49 

## **3.3 Verfeinerung „Termin verwalten“** 

Als Verfeinerung wurde “Termin verwalten” aus obigem Diagramm auf Seite 47 ausgewählt, da es sich um eine zentrale Funktionalität handelt, auf die die Benutzer unterschiedlichen Zugriff haben. 

Abbildung 2 — Use-Case - Verfeinerung für die Verwaltung von Terminen 

## **Termin erstellen** 

Wie im Lastenheft festgehalten, können vier verschiedene Terminarten erstellt werden. Dies sind die Kategorien: Zwischentermin, Haupttermin, Urlaub, interner Termin. Einem Hauptoder Zwischentermin muss zusätzlich immer ein Kundenauftrag zugeordnet werden. Für die Erstellung eines Termins werden Attribute benötigt, wie sie im Lastenheft angegeben sind. Auf einen einzelnen Use-Case für diese wurde aufgrund von Redundanz verzichtet. Die Unterschiede wurden durch eine Erweiterung der Kategorien an Terminen verdeutlicht. Ansonsten gibt es keine Unterschiede bei Terminen. Die Erstellung jeder Art von Terminen umfasst das Zuordnen eines Mitarbeiters, das Prüfen, ob dieser Mitarbeiter überhaupt verfügbar ist und ob in dem ausgewählten Zeitraum eine Terminüberschneidung vorliegt. 

49 

Analyse 

50 

## **Überprüfung der Termindaten** 

Es werden zwei Arten von Überprüfungen bei der Erstellung eines Termins durchgeführt. Erstens wird überprüft, ob der dem Termin zugeordnete Mitarbeiter überhaupt existiert und ob dieser überhaupt berechtigt ist einen solchen Termin anzulegen. Ein Mitarbeiter kann nämlich nur einen Termin für sich selbst anlegen. Ein Vorgesetzter kann nur einen Termin für sich und seine untergeordneten Mitarbeiter anlegen und der Administrator hat sowieso die Berechtigungen für alle Mitarbeiter. Zweitens wird überprüft, ob eine Terminüberschneidung im Zeitraum des Termins vorliegt. Haupttermine sind von dieser Überprüfung ausgenommen, da ein Mitarbeiter mehrere Haupttermine/Aufträge gleichzeitig haben darf. Um dies zu überprüfen, werden die Termine in einem Zeitraum ausgewählt (siehe unten nähere Erläuterung). Führt einer dieser Überprüfungen zu einem Fehler, dann wird die Erstellung eines Termins beendet und es wird dem Benutzer in einem Pop-Up eine Fehlermeldung angezeigt. Deswegen wird auch ein expliziter Pfeil in Richtung des Mitarbeiters gezogen. 

## **Termin bearbeiten** 

Jeder Mitarbeiter kann neben dem Erstellen eines Termins auch einen Termin bearbeiten, sofern es sich um einen ihm zugeordneten Termin handelt. Ein Admin kann alle möglichen Termine erstellen und bearbeiten. Auch bei der Bearbeitung eines Termins werden Überprüfungen durchgeführt, die zu einer Fehlermeldung führen können, sodass die Veränderung nicht vorgenommen wird. Für die Bearbeitung eines Termins muss der Termin jedoch zunächst gelesen werden, damit die Informationen geändert werden können. 

## **Termin(e) lesen** 

Hierbei handelt es sich um die Lesenden-Funktionalitäten einer oder mehrerer Termine. Der Use-Case “Termin(e) in Zeitraum auswählen” ist dafür da, dass alle Termine, die in einem Zeitraum stattfinden, ausgewählt werden. Der Grund für die Unterscheidung zwischen dem Anzeigen und dem Lesen eines Termins ist, dass die Funktionalität des Lesens für das Bearbeiten benötigt wird (siehe oben), die des Anzeigens aber nur für das eigentliche und direkte Lesen aller Termine eines Mitarbeiters, Admins oder Vorgesetzten interessant ist. Dies wird dargestellt durch das Use-Case “Termin(e) anzeigen”, wobei alle zukünftigen Termine eines (wenn Admin, dann aller) Mitarbeiters oder Vorgesetzten mit seinen Mitarbeitern angezeigt werden, unabhängig von einem bestimmten Zeitraum. Der Use-Case “Termin lesen” liest einen bestimmten Termin, wenn beispielsweise ein ausgewählter Termin aus der Liste angeklickt wird. Wie bereits oben erwähnt, ist dies auch für das Bearbeiten eines Termins relevant. 

50 

Analyse 

51 

## **3.4 Analyseklassendiagramm** 

Abbildung 3 — Analyseklassendiagramm des gesamten Handwerkbetriebs 

In der Darstellung wurde sich dafür entschieden, bidirektionale Pfeile ohne Pfeilspitzen zu verwenden. Assoziationen, die nur in eine Richtung gehen, sind mit Pfeilspitzen versehen. So werden Pfeile und Pfeilspitzen eingespart. 

Zudem wurde versucht durch eine farbliche Markierung in Abbildung 3 inhaltlich zusammengehörende Objekte zu gruppieren. 

51 

Analyse 

52 

## **3.4.1 Analysemuster** 

Für eine genauere Nachvollziebarkeit werden im Folgenden einzelne Gruppen an Objekte kurz näher erläutert. Insbesondere wird dabei auf die verwendeten Analysemuster und die Beziehungen mit deren Multiplizitäten eingegangen. Es wurden genau vier Analysemuster benutzt. 

Zentrales Element der Anwendung ist ein Auftrag. Hierbei gibt es zwei Arten von Aufträgen, die durch eine Vererbung unterschieden und in rot dargestellt sind. Jedem dieser Aufträge kann eine Lieferung, ein Angebot und eine Rechnung zugeordnet sein. Bei der Erstellung eines Auftrags sind diese Objekte zunächst nicht erforderlich. Ein Auftrag kann auch mehreren dieser Objekte zugeordnet werden (siehe Seite 24). Umgedreht kann eine Lieferung und ein Angebot auch zu mehreren Aufträgen gehören. Dies wird sich damit erklärt, dass eine solche Verallgemeinerung über mehrere Aufträge hinweg nützlich ist und eventuell doppeltes Anlegen von ähnlichen Lieferungen und Angeboten vermeidet. Eine Rechnung soll hingegen immer genau einem Auftrag zugeordnet sein, denn die Existenz dieser Rechnung ist nur sinnvoll, wenn dahinter genau ein Auftrag steht. Einer Rechnung liegen unmittelbar ein oder mehrere Angebote zugrunde, denn diese fassen die Kosten für Material oder Dienstleistungen zusammen. Während ein Angebot in genau einer Rechnung vorkommen kann. 

Bei Lieferungen, Angeboten und Rechnungen handelt es sich um Aggregat-Objekte, da hier das Analysemuster **Liste** verwendet wurde. Lieferungen, Angebote und Rechnungen enthalten jeweils mehrere Posten. Dabei muss immer mindestens ein Posten vorhanden sein, denn sonst wären die Aggregat-Objekte nicht vollständig. Ein Posten ist immer existenzabhängig von dem Aggregat-Objekt. Alle Posten wiederum umfassen die Menge an referenzierten Objekten. 

Abbildung 4 — Analysemuster Liste bei Lieferungsposten 

52 

Analyse 

53 

Im Fall eines Lieferungspostens ist dies immer genau eine Materialgruppe. Umgedreht kann eine Materialgruppe auch in mehreren Lieferungsposten vorkommen. Diese Materialgruppe ist das Analysemuster **Gruppe** (siehe unten weiteres Beispiel) und umfasst mehrere Materialien. Einer Lieferung kann direkt aber immer nur einem Lieferanten zugeordnet werden. Materialgruppe und Lieferant können auch ohne eine Lieferung existieren. 

Abbildung 5 — Analysemuster Liste bei Angebotsposten 

Ein Angebotsposten kann einen Verweis auf eine Materialgruppe haben. Dann besteht das Angebot unter anderem aus materiellen Posten. Ein solcher Posten kann aber auch aus Dienstleistungen bestehen und hat in einem solchen Fall keine Referenz, sondern besteht nur aus Einzelpreisen. 

53 

Analyse 

54 

Abbildung 6 — Analysemuster Liste bei Rechnungsposten 

Eine Rechnung hat einen Verweis auf einen Kunden, an den die Rechnung gestellt ist. Dies kann entweder ein Privat- oder Geschäftskunde sein. Somit kann auch eine Rechnung an den Handwerksbetrieb selbst oder eine externe Firma gestellt werden. Umgedreht ist es auch möglich zu prüfen, in welchen Rechnungen welche Kunden vorkommen. Ein Kunde kann aber auch existieren, ohne dass er in einer Rechnung vorkommt, wenn dieser beispielsweise erst angelegt wurde, aber in noch keiner Rechnung erwähnt wird. Ein Rechnungsposten verweist wie in Abbildung 6 ersichtlich ist, auf immer ein Angebotsposten. Ein Bäcker verweist so beispielsweise in der Rechnung auf die einzelnen Angebotsposten einer Torte. Ein Elektroinstallateur verweist auf die Angebotsposten „Anfahrtskosten“, „Materialkosten“ und „Stundenlohn“ beim Wechsel einer Glühbirne. 

Bei den Mitarbeitern wurde das Analysemuster **Gruppe** verwendet. 

54 

Analyse 

55 

Abbildung 7 — Analysemuster Gruppe bei den Mitarbeitern eines Handwerksbetriebs 

Mehrere Mitarbeiter können so zu einer Gruppe, beispielsweise einer Projektgruppe oder einem Fachbereich zusammengefasst werden. Es kann sein, dass sie in mehreren Gruppen oder Fachbereichen arbeiten. Allerdings ist es sinnvoll, dass sie mindestens in einer Gruppe und einem Fachbereich tätig sind, weil dies einen Mitarbeiter ausmacht. Zusätzlich ist jeder Gruppe immer genau ein Vorgesetzter zugeordnet. Ein Vorgesetzter muss aber mindestens eine Abteilung oder Gruppe führen, damit ihn dies von den anderen Mitarbeitern unterscheidet. Dies ist allerdings nicht mehr direkt Teil des Analysemusters **Gruppe** . Ein Termin hat mehrere Referenzen auf sich selbst. Um diese unterscheiden zu können wurde sich für das Analysemuster einer **Rolle** entschieden. 

55 

Analyse 

56 

Abbildung 8 — Analysemuster Rolle im Zusammenhang eines Termins 

Diese Referenzen auf sich selbst sind bedingt durch die verschiedenen Kategorien an Terminen (siehe Seite 28). Das Konzept des Haupttermins existiert, um die gesamte Dauer eines Kundenauftrags abzudecken. Deshalb referenziert ein Kundenauftrag auch immer auf genau einen Haupttermin. So entsteht die Rollenzuweisung innerhalb eines Termins: 

- Ein Haupttermin verweist möglicherweise auf mehrere Zwischentermine. 

- Ein Zwischentermin verweist immer auf genau einen Haupttermin. 

Das Analysemuster **Exemplar** wurde bei den Betriebsmitteln verwendet. 

56 

Analyse 

57 

Abbildung 9 — Analysemuster Exemplar anhand der Betriebsmittel Werkzeuge und Anlagen 

Eine konkrete Ausprägung eines Werkzeugs oder einer Anlage ist Teil eines Auftrags. Diese Zuweisung zu einem Auftrag ist nicht zwingend erforderlich, allerdings können diese im Zusammenhang eines Auftrags eingesetzt werden. Deswegen können Werkzeuge und Anlagen auch einem Termin zugeordnet werden. Konkret wird hier an einen Zwischentermin gedacht, in dem ein oder mehrere Betriebsmittel Verwendung finden. Anlagen und Werkzeuge vereint, dass sie ein Betriebsmittel sind und somit eine allgemeine Beschreibung haben. Umgedreht muss eine Beschreibung immer mindestens einem Exemplar in Form von einer Anlage oder Werkzeug zugeordnet sein. Dieser Beschreibung wird eine explizite Inventarnummer zugewiesen und ist Teil des gesamten Inventars eines Handwerkbetriebs. Wobei hier angemerkt werden sollte, dass das Lager und das Inventar grundsätzlich zwei verschiedene Dinge in einem Handwerksbetrieb sind. 

Entgegen den Anforderungen auf Seite 24 ist ein Kundenauftrag (rot) nicht direkt einem Lieferanten zugeordnet. Denn dies erfolgt indirekt über eine Lieferung oder eine Bestellliste. Bevor allerdings keine Bestellliste beziehungsweise eine Lieferung existiert, ist einem Kundenauftrag kein Lieferant zugeordnet. Die Beziehung besteht so nur über eine Bestellung. In dieser Hinsicht wird auch keiner Anforderung widersprochen. Denn das Lastenheft lässt offen, wie diese Beziehung zu gestalten ist, solange wie in diesem Fall bei Bedarf die Beziehung hergestellt werden kann. 

57 

Analyse 

58 

Abbildung 10 — Darstellung der Bestellliste 

Eine Bestellliste besteht entweder aus einer Auswahlliste oder einem (oder mehreren) Paaren von Lieferanten und Materialgruppen. Dies ist durch die Notiz festgehalten. So können Bestelllisten basierend auf einer Auswahlliste erstellt werden oder durch eine direkte Zuweisung zu einem Lieferanten und einer Materialgruppe. Die Bestellliste kann somit Grundlage für eine Lieferung in einem Auftrag sein. Erwähnenswert ist dieser Teil des Diagramms, wegen der besonderen Beziehung zu Auswahllisten (siehe Seite 30). Eine Kombination von Lieferanten und Materialgruppe kann nämlich durch eine Auswahlliste abgedeckt werden. Ihr Zweck ist vor allem, dass sie je nach Branche des Handwerksbetriebs eine Vorauswahl bereitstellen. Beispielsweise kann so durch eine Auswahlliste von einem Bäcker eine Liste von Lieferanten und Materialien für eine Torte geliefert werden. Diese ist Grundlage für eine oder mehrere Bestelllisten. 

Als letztes sind die Objekte Handwerksbetrieb, Adresse, Lager und Firma zu erwähnen, die in einem einfachen blau dargestellt sind. Diese haben kein Analysemuster und heben sich insofern von den anderen Objekten ab, als das sie Informationen über den Handwerksbetrieb und externe Firmen enthalten. 

58 

Analyse 

59 

## **3.5 GUI-Mockups** 

Die Benutzeroberfläche wurde so gestaltet, dass sie den Anforderungen an Übersichtlichkeit, einfacher Bedienbarkeit und rollenbasiertmn Zugriff entspricht. Im Mittelpunkt stehen dabei die Anforderungen aus der vorhergehenden Analyse, insbesondere aus LF10, LF40 und LF70 (siehe in entsprechender Reihenfolge Seite 20ff., Seite 28ff. und Seite 36ff.). 

Oben links befinden sich das Logo sowie der Name des Handwerksbetriebs. Wie gewünscht bietet die Anwendung die Möglichkeit, die Sprache auszuwählen, um auch mehrsprachige Nutzer zu unterstützen. Zudem können Einstellungen zum Benutzer über das Auswahlfeld am oberen rechten Rand getroffen werden. Das sind die Einstellungen, die der Mitarbeiter für seine Benutzeroberfläche vornehmen kann (siehe Konfigurationsdateien). Die Hauptnavigation erfolgt über eine dauerhaft sichtbare Menüleiste am linken Bildschirmrand. Diese enthält ausschließlich die für die jeweilige Benutzerrolle freigegebenen Bereiche. Funktionen, für die keine Berechtigung besteht – wie z.B. Mitarbeiterverwaltung oder Systemeinstellungen für einen regulären Mitarbeiter – sind ausgegraut dargestellt. Auf diese Weise wird die Oberfläche bewusst reduziert und der Nutzer nicht mit unnötigen Optionen konfrontiert. 

Die Menüpunkte Angebote, Lager, Kunden und Bestellungen werden nicht als Mockups gesondert dargestellt, basieren jedoch auf einem ähnlichen Aufbau wie die Ansicht der Aufträge. Sie zeigen die jeweiligen Daten in tabellarischer Form an. Unter dem Menüpunkt Lager wird durch Tabs zwischen Materialien und Betriebsmittel unterschieden. Das heißt auch, dass unter Betriebsmittel Bilder der Werkzeuge und Anlagen angezeigt werden. Bei entsprechender Berechtigung sind Benutzer in der Lage, diese Daten zu bearbeiten. 

Der Menüpunkt für Rechnungen zeigt eine tabellarische Übersicht aller Rechnungen. Hier kann kaufmännisches Personal Rechnungen einsehen und diese über einen Button ausdrucken. Im Bereich Firmendaten kann das kaufmännische Personal referenzierte Firmen einsehen, etwa die Adresse, die in Rechnungen verwendet wird. Der Menüpunkt Datensicherung erlaubt es dem Administrator, Backups zu erstellen und wiederherzustellen. Unter Systemhinweise kann der Administrator grundlegende statische Informationen zum Handwerksbetrieb pflegen, wie etwa den Namen oder die Branche des Betriebs. Die Mitarbeiterverwaltung ermöglicht – entsprechend dem Lastenheft – Vorgesetzten und Administratoren das Verwalten von Mitarbeitenden. 

Dazu wurden drei zentrale Anwendungsbereiche exemplarisch als Mockups umgesetzt: Dashboard-Seite, Kalenderansicht und die Suche nach Kundenaufträgen. In den dargestellten Mockups werden ausschließlich Funktionen eines regulären Mitarbeiters ohne Administratorrechte gezeigt. Funktionen mit erweiterten Rechten – z. B. das Bearbeiten oder Erstellen von Aufträgen – werden an geeigneter Stelle erläutert, sind aber in diesen Ansichten nicht aktiv. Sämtliche Textfelder sind mit Beispielinhalten gefüllt, deren Inhalt sich inkonsistent auf verschiedene Arten von Handwerkbetrieben bezieht. Der Aufbau der Benutzeroberfläche und nicht der Inhalt steht im Vordergrund dieser Mockups. 

59 

Analyse 

60 

## **3.5.1 Dashboard Ansicht** 

Abbildung 11 — GUI Ansicht Dashboard 

Das Dashboard dient als zentrale Einstiegsseite und Übersicht. Im Mittelpunkt steht ein Monatskalender, der ausschließlich die Wochentage und Kalendertage anzeigt. Der aktuelle Tag ist optisch hervorgehoben. Ein Klick auf einen beliebigen Tag führt den Benutzer automatisch weiter zur Kalenderansicht mit detaillierter Tagesübersicht. Direkt unter dem Kalender sind die heutigen Termine aufgelistet, also alle für den Mitarbeiter geplanten Termine inklusive Uhrzeit und Titel. Rechts daneben befindet sich eine To-Do-Liste, in der persönliche Aufgaben abgehakt oder ergänzt werden können. 

Zusätzlich werden im rechten Bereich neu eingegangene Aufträge chronologisch angezeigt mit Auftragstitel, Eingangszeit und Auftragsnummer – sowie die Übersicht laufender Aufträge mit Auftragstitel und Auftragsnummer. 

60 

Analyse 

61 

## **3.5.2 Kalender Ansicht** 

Abbildung 12 — GUI Ansicht Kalender 

Wie gewünscht, kann der Benutzer in der Kalenderansicht flexibel zwischen Tages-, Wochenund Monatsansicht wechseln. Das vorliegende Mockup zeigt exemplarisch eine Wochenansicht. Dabei werden ausschließlich die Termine des aktuell eingeloggten Mitarbeiters angezeigt, so bleibt die Übersicht kompakt und relevant. Ein Vorgesetzter könnte die Termine der ihm untergeordneten Mitarbeiter einsehen. Ein Administrator könnte die Termine aller Mitarbeiter sehen/lesen, auch wenn dies wahrscheinlich unübersichtlich wird. Dies entspricht jedoch den Anforderungen aus dem Lastenheft. In dem Beispiel handelt es sich allerdings nur um die Termine eines Mitarbeiters. Der Benutzer kann seine eigenen Termine bei Bedarf durch einen Klick auf den Stift-Icon bearbeiten. Außerdem kann über das Suchfeld oben nach dem Titel von Terminen gesucht werden. 

Zusätzlich hat der Mitarbeiter die Möglichkeit, selbstständig eigene Termine anzulegen. Über den gut sichtbaren „+“-Button kann ein neuer Haupttermin, Urlaub oder interner Termin erstellt werden. Beim Klick darauf öffnet sich ein Eingabefenster, in dem relevante Informationen wie Datum, Uhrzeit, Terminkategorie, Ort, Bemerkungen und die Auftragsnummer direkt eingegeben werden können. Auch dieser Ablauf wurde als Mockup umgesetzt und ist unten rechts in der Kalenderansicht dargestellt. In diesem Beispiel wurde ein interner Termin als Kategorie ausgewählt. Da interne Termine keinem Auftrag zugeordnet sind und auch keinem Haupttermin unterliegen, sind die entsprechenden Felder für Auftrag und Haupttermin im Eingabebereich ausgegraut. Ein Zwischentermin hingegen kann angelegt werden, indem auf einen bestehenden Haupttermin geklickt wird. Daraufhin erscheint ebenfalls der „+“-Button, 

61 

Analyse 

62 

mit dem, wie in dem Mockup am unteren Rand zu sehen ist, ein neuer Termin erstellt werden kann. Der Unterschied besteht jedoch darin, dass in diesem Fall die Felder für Auftrag und Haupttermin automatisch vorausgefüllt sind, sodass die Zuordnung eindeutig festgelegt ist. Zur besseren Orientierung werden die Termine anhand ihrer Kategorie farblich unterschieden: interne Termine, Urlaub, Haupttermine sowie Zwischentermine sind jeweils mit einer eigenen Farbe gekennzeichnet. Durch einen Klick auf das kleine „i“-Symbol neben einem Termin kann der Benutzer die zugehörigen Detailinformationen einblenden. Auch hierzu wurde ein beispielhafter Screenshot erstellt, der die Detailansicht eines typischen Kalendereintrags veranschaulicht: 

Abbildung 13 — GUI Ansicht Kalendereintrag Detailansicht 

In dem hier gezeigten Beispiel handelt es sich um einen Zwischentermin, was anhand der entsprechenden Farbe auf einen Blick erkennbar ist. Da Zwischentermine in der Regel zu einem übergeordneten Auftrag gehören, ist der zugehörige Haupttermin bzw. Kundenhauptauftrag direkt verlinkt. Klickt der Benutzer auf diesen Verweis, wird er automatisch zur zugehörigen Detailansicht des Auftrags weitergeleitet. 

62 

Analyse 

63 

## **3.5.3 Suchen nach Kundenaufträgen** 

Abbildung 14 — GUI Ansicht Suche nach Kundenaufträgen 

Ein weiterer zentraler Anwendungsbereich, der exemplarisch als Mockup umgesetzt wurde, ist die Suche nach Kundenaufträgen. Im Lastenheft wurde nicht explizit die Forderung gestellt Eigenaufträge suchen zu können (siehe Seite 36). Dies wird hier jedoch über einen Tab oben ermöglicht. In dem Beispiel ist der Tab für die Suche nach Kundenaufträgen geöffnet. Die Ansicht für Eigenaufträge wäre ähnlich aufgebaut. 

Die Kundenauftrag-Ansicht ist bewusst schlank gehalten und zeigt dem Benutzer nur die für ihn relevanten Funktionen. Da normale Mitarbeiter lediglich Leserechte für Kundenaufträge haben, können sie in dieser Ansicht ausschließlich nach bestehenden Aufträgen suchen und sich deren Details anzeigen lassen – ein Bearbeiten oder Löschen ist nicht vorgesehen. 

Wie vom Kunden gewünscht, muss der Benutzer vor der Suche zunächst auswählen, nach welchem Attribut gesucht werden soll, entweder nach der Kundennummer oder der Auftragsnummer. Erst danach wird das entsprechende Eingabefeld aktiviert und die Suchanfrage kann gestartet werden. Die Ergebnisse erscheinen anschließend in einer übersichtlichen Tabelle darunter. Diese klare Trennung der Suchattribute stellt sicher, dass die Suche gezielt abläuft. Bei Attributen, die auf andere Elemente im System verweisen, wie z.B. die Rechnungsnummer, sollen die Nummern zusätzlich als Verlinkung dienen, sodass der Benutzer direkt zur zugehörigen Detailansicht des referenzierten Elements springen kann. Beispielsweise führt ein Klick auf die Rechnungsnummer direkt zur vollständigen Rechnung. Im Falle, dass mehrere Rechnungen oder Angebote referenziert werden, wird eine Liste an Nummern angezeigt. Der Administrator und das kaufmännische Personal hätten die Rechte Aufträge zu erstellen 

63 

Analyse 

64 

und zu bearbeiten, was wie erwähnt in dieser Ansicht für einen Mitarbeiter nicht der Fall ist. Für das Bearbeiten eines Eintrags würde in jeder Zeile ein Stift Icon erscheinen. Für das Hinfügen wäre auf Höhe des Suchfeldes ein „+“-Button vorgesehen, der ein Eingabefenster öffnet, in dem die erforderlichen Informationen für einen neuen Auftrag eingegeben werden können. Ähnlich wie dies beim Erstellen und Bearbeiten eines Termins gezeigt wurde (siehe Abschnitt 3.5.2). 

64 

Sequenzdiagramm 

65 

## **4 Sequenzdiagramm** 

Im folgenden Abschnitt wird das Szenario „Auftrag durchführen“, vom Erstkontakt bis zur Bezahlung der Rechnung, betrachtet. Mithilfe eines Sequenzdiagramms wird dieses visualisiert, erläutert und anschließend in einem Pseudocode wiedergegeben. Exemplarisch wurde bei der Erstellung des Sequenzdiagrammes von einer Großbäckerei ausgegangen, welche Großbestellungen von Geschäftskunden entgegennimmt. Da das Diagramm sowie auch der Pseudocode jedoch auf sämtliche Handwerksbetriebe anwendbar sein soll, wurde auf konkrete Bezeichnungen für Bäckereibetriebe, wie z. B. Zutaten statt Materialen, verzichtet. Obwohl zu Beginn eine leere Datenbasis zugrunde liegt, wird auch die Möglichkeit berücksichtigt, dass Objekte im Laufe der Zeit angelegt werden, wodurch die Datenbasis gefüllt wird. Das erstellte Sequenzdiagramm dient dazu, die Interaktion zwischen den verschiedenen Akteuren und Objekten in zeitlicher Reihenfolge darzustellen. Zu Beginn des Sequenzdiagrammes gibt es zwei Akteure: den Kunden und den Benutzer sowie die zwei Objekte: UI-Bäckereibetrieb und Datenbasis. Durch Interaktionen wird das Sequenzdiagramm auf dieser Basis erweitert. Der Benutzer stellt in diesem Fall das kaufmännische Personal dar, welches dazu in der Lage ist, alle weiteren benötigten Objekte in der Verwaltungssoftware anzulegen. 

Im nachfolgenden Sequenzdiagramm sowie im Pseudocode wurde zugunsten einer besseren Übersichtlichkeit und Verständlichkeit auf die detaillierte Darstellung bestimmter technischer und systemnaher Prozesse verzichtet. Dazu zählen insbesondere: 

- **Authentifizierungs- und Anmeldevorgänge** , wie z. B. das Einloggen des kaufmännischen Personals oder Sicherheitsprüfungen bei Zugriffen auf die Benutzeroberfläche. 

- **Fehlermeldungen und Ausnahmebehandlungen** , wie z. B. bei Verbindungsproblemen, fehlerhaften Nutzereingaben, Systemausfällen oder Datenbankfehlern wurden nicht berücksichtigt, da sie den Ablauf unnötig verkomplizieren würden und vom eigentlichen Prozessablauf ablenken. 

- **Nebenläufige Prozesse** oder parallele Abläufe, die in der Praxis auftreten können (z. B. gleichzeitige Bearbeitung mehrerer Anfragen), sind im Diagramm nicht abgebildet. 

- Ebenso wurde auf die **Darstellung von Systemantworten** (z. B. Bestätigungsdialoge, Statusanzeigen, UI-Feedback) weitgehend verzichtet, da sie für das Verständnis der Prozesslogik nicht zwingend erforderlich sind. 

- **Datenzugriffe und Vorgänge bezüglich der Datenbasis** werden nicht durchgehend referenziert und detailliert dargestellt. Sie erfolgen exemplarisch und nur dort, wo es für das Verständnis des konkreten Ablaufs erforderlich ist. 

65 

Sequenzdiagramm 

66 

Das gesamte Sequenzdiagramm wurde UI-orientiert entwickelt. Um eine strukturierte und übersichtliche Darstellung des Szenarios zu ermöglichen, wurden Unterprogramme eingesetzt. Durch die Wiederverwendbarkeit der Unterprogramme werden redundante Abläufe vermieden, da die einmal definierten Abläufe mehrfach im Diagramm aufgerufen werden können. 

Sowohl im Pseudocode als auch im Sequenzdiagramm wurden exemplarische Zeitangaben, wie z.B. „nach einer Woche“ oder „nach drei Tagen“, für eine bessere Verständlichkeit und Realitätsnähe verwendet. Bei den exemplarischen Zeitangaben handelt es sich um Werktage, wodurch Wochenenden und Feiertage ausgeschlossen werden. Zur Unterstützung des kaufmännischen Personals könnten die Zeitfristen im System beispielsweise durch rückwärtszählende Timer realisiert werden. 

66 

67 

## Sequenzdiagramm **4.1 Sequenzdiagramm: Auftrag durchführen** 

Abbildung 15 — Sequenzdiagramm Auftrag durchführen 67 

Sequenzdiagramm 

68 

Das Sequenzdiagramm beginnt mit einer Angebotsanfrage eines Kunden. Geht eine Anfrage ein, prüft das kaufmännische Personal diese auf Vollständigkeit. Solange relevante Informationen fehlen, erfolgt eine wiederholte Rücksprache mit dem Kunden, was im Sequenzdiagramm mit einer loop-Schleife dargestellt wird. 

Im zweiten Schritt erfolgt die Angebotserstellung. Für jede Anfrage zu einem Großauftrag, welche mind. drei Wochen vor Enddatum erfolgen müssen, sind Angebote erforderlich. Hierfür greift der Benutzer auf die UI zu, um ein passendes Angebot zu finden. Das System durchsucht vorhandene Angebote, welche mit der Suchanfrage des Benutzers übereinstimmen. Die Angebote werden in Form einer Liste über die UI ausgegeben. Existiert kein passendes Angebot, wird ein neues Angebot über das Unterprogramm „Objekt anlegen“ erstellt. Das ausgewählte Angebot wird anschließend an den Kunden übermittelt. 

Im nächsten Schritt wird auf die Angebotsbestätigung gewartet. Erhält das kaufmännische Personal zwei Wochen nach der Angebotsübermittlung keine Bestätigung, wird der Prozess abgebrochen und die Anfrage beendet. Damit wird das Szenario „Auftrag durchführen“ beendet. Ist eine Bestätigung eingetroffen, erstellt das kaufmännische Personal einen Auftrag. Hierfür wird das Unterprogramm „Objekt anlegen“ aufgerufen. Sollte der entsprechende Kunde noch nicht im System existieren, muss dieser innerhalb des Unterprogramms ebenfalls neu angelegt werden. Bei Kunden wird in der Software zwischen Privat- und Geschäftskunden unterschieden, auf was im Sequenzdiagramm jedoch nicht weiter eingegangen wird. Auch der Haupttermin des Auftrags muss im Unterprogramm neu angelegt werden. Da ein Auftrag auch einem Hauptverantwortlichen Mitarbeiter zugeordnet werden muss, erfolgt dies ebenfalls im Unterprogramm „Objekt anlegen“. Danach stellt das kaufmännische Personal den Auftrag dem Kunden bereit. 

Die Bearbeitung des Auftrags setzt eine unterschriebene Bestätigung voraus. Erhält das kaufmännische Personal innerhalb einer Woche keine Bestätigung, wird der Auftrag mit den dazugehörigen Referenzen gelöscht und das Szenario beendet. Andernfalls erfolgt anschließend die Materialbestellung durch das kaufmännische Personal. Die Materialbestellung wird in Abschnitt 5.1 im Aktivitätsdiagramm genauer dargestellt. Für die Abarbeitung der Zwischentermine ist ebenfalls ein Unterprogramm gedacht, welches nicht weiter verfeinert wurde. Stattdessen wird in der nächsten Referenz für die Rechnungserstellung wieder das Unterprogramm „Objekt anlegen“ aufgerufen. 

Möchte ein Kunde nachträgliche Änderungen am Auftrag vornehmen, muss der Benutzer zuerst die Realisierbarkeit der Änderung überprüfen. Besonders berücksichtigt werden muss hierbei die noch verbleibende Zeit bis zum Haupttermin, die Kapazität sowie die bereits erledigten Arbeitsschritte. Ist eine Änderung möglich, springt der Prozess zurück zur Auftragserstellung, da der Auftrag ebenfalls auf die Änderung angepasst werden muss. 

68 

Sequenzdiagramm 

69 

Sobald das Enddatum erreicht ist, wird die Ware entweder geliefert oder zur Abholung bereitgestellt. Das kaufmännische Personal ist nun dafür zuständig, dem Kunden die Rechnung zur Verfügung zu stellen. Der Zahlungsvorgang, mit welchem der Prozess und somit auch das Sequenzdiagramm beendet wird, ist in dem Unterprogramm „Zahlvorgang abschließen”, genauer beschrieben. 

## **4.1.1 Unterprogramm: Objekt anlegen** 

Abbildung 16 — Unterprogramm Objekt anlegen 

Das Unterprogramm „Objekt anlegen“ basiert auf dem Konzept einer generischen Benutzeroberfläche. Diese verfolgt das Ziel, verschiedene Objekte über eine einheitliche, wiederverwendbare Struktur zu erstellen. Dabei werden dynamisch je nach Objekttyp die relevanten Felder und Prozesse generiert, die zur Interaktion notwendig sind. Hierzu gehören unter anderem die Objekte Kunde, Auftrag, Angebot, Termin, Rechnung und Zahlungserinnerung. Der Ablauf beginnt mit dem Zugriff auf die UI. Nacheinander wählt der Benutzer die zu befüllenden Eingabefelder aus. Dies wurde im Sequenzdiagramm mit einer loop-Schleife dargestellt. Bei jedem Eingabefeld wird zwischen einem einfachen Datentyp (z.B. Texteingabe) oder einer Referenz (Verknüpfung zu einem anderen Objekt) unterschieden. Handelt es sich um einen einfachen Datentyp, gibt das kaufmännische Personal die Daten in das Eingabefeld ein. Bei einer Referenz sucht der Benutzer über die UI nach dem passenden Objekt. In der Datenbasis werden die passenden Objekte abgefragt, welche anschließend in einer Objektliste 

69 

Sequenzdiagramm 

70 

dem Benutzer über die UI angezeigt werden. Existiert das Objekt, kann dieses vom Benutzer ausgewählt werden. 

Ist dies nicht der Fall, wird ein verschachtelter Aufruf desselben Unterprogramms durchgeführt, um das verknüpfte Objekt anzulegen. Nach Eingabe der Daten muss der Benutzer die Datenfelder manuell speichern. Wurden die Daten in der Datenbasis gesichert, erhält der Benutzer eine Meldung über die erfolgreiche Speicherung. 

## **Diskussion: Vor- und Nachteile des verschachtelten Aufrufs** 

Der verschachtelte Aufruf wurde bewusst eingebracht, um die wiederverwendbare Logik für das Anlegen eines Objekts modular und konsistent abbilden zu können. Die Struktur unterstützt eine bessere UI-Kompatibilität, da generische Abläufe zentral definiert und wiederverwendbar angesteuert werden können, was der Architektur einer dynamischen, generischen Benutzeroberfläche entgegenkommt. Gleichzeitig werden dabei die Grenzen der Ausdruckskraft von Sequenzdiagrammen erreicht. Im gezeigten Hauptsequenzdiagramm (siehe Abschnitt 4.1) wird beim Erstellen eines Angebots ein neues Objekt mit new markiert. Sind noch nicht alle Referenzen, wie z. B. bei einem Eigenauftrag das Objekt Firma, vorhanden, muss das jeweilige Objekt durch einen erneuten Aufruf „Objekt anlegen“ neu erstellt werden. Dieser Ablauf findet jedoch nur im inneren „Objekt anlegen“-Fragment statt und ist im Hauptsequenzdiagramm nicht sichtbar, wodurch dynamische Abhängigkeiten nicht direkt nachvollziehbar sind. Das Zusammenspiel zwischen verschiedenen Objektarten (z. B. Angebot, Kunde, Firma) bleibt dadurch schwer ersichtlich und muss durch zusätzliche Dokumentation ergänzt werden. Bei der Umsetzung könnte ein solches komplex verschachteltes Sequenzdiagramm zu Problemen und Herausforderungen führen. 

70 

Sequenzdiagramm 

71 

## **4.1.2 Unterprogramm: Zahlvorgang abschließen** 

Abbildung 17 — Unterprogramm Zahlvorgang abschließen 

Das Unterprogramm „Zahlvorgang abschließen“ wird ausgeführt, sobald das Fälligkeitsdatum der Rechnung erreicht ist. Zu Beginn wird die Zahlung durch das kaufmännische Personal überprüft. Hierfür wird das referenzierte Unterprogramm „Zahlung prüfen“ aufgerufen. Bis die Zahlung korrekt erfolgt ist, wird anschließend eine loop-Schleife durchlaufen, in welcher eine neue Zahlungserinnerung über das Unterprogramm „Objekt anlegen“ erstellt wird. Das kaufmännische Personal ist nun dafür zuständig, das passende Objekt auszuwählen und an den Kunden zu versenden. Um den Status der Zahlung zu aktualisieren, wird auf das Unterprogramm „Status setzen“ referenziert. Anschließend wird der Zahlungseingang erneut über das Unterprogramm „Zahlung prüfen“ kontrolliert. Durch die Verschachtelung der Unterprogramme in der loop-Schleife wird sichergestellt, dass höchstens drei Zahlungserinnerungen versendet werden können. 

71 

Sequenzdiagramm 

72 

## **4.1.3 Unterprogramm: Zahlung prüfen** 

Abbildung 18 — Unterprogramm Zahlung prüfen 

Zu Beginn des Unterprogramms prüft der Benutzer den Zahlungseingang auf Korrektheit. Ist die Zahlung korrekt erfolgt, muss das kaufmännische Personal den Status für die Rechnung sowie für den Auftrag auf bezahlt bzw. auf abgeschlossen aktualisieren. Dieser Vorgang wird über das Unterprogramm „Status setzen“ aufgerufen. Nachdem der Status gesetzt wurde, ist das Szenario „Auftrag durchführen“ an dieser Stelle beendet. Bei ausbleibender oder fehlerhafter Zahlung wird geprüft, ob bereits drei Mahnungen verschickt wurden. Sollte dies der Fall sein, werden rechtliche Schritte eingeleitet, womit ebenfalls das betrachtete Szenario beendet wird. Aufgrund der Komplexität wurde auch hierfür auf ein Unterprogramm referenziert, welches nicht weiter verfeinert wurde. 

72 

Sequenzdiagramm 

73 

## **4.1.4 Unterprogramm: Status setzen** 

Abbildung 19 — Unterprogramm Status setzen 

Das Unterprogramm „Status setzen“, welches im Unterprogramm „Zahlvorgang abschließen“ referenziert ist, wird zur Aktualisierung des Bearbeitungsstands von beispielsweise Rechnungen oder Aufträgen verwendet. Nach dem Zugriff auf die Benutzeroberfläche wird das entsprechende Objekt von dem Benutzer im System gesucht. Hierfür wird aus der Datenbasis eine Liste der Objekte geladen und über die UI dem Benutzer ausgegeben. Nachdem der Benutzer das passende Objekt ausgewählt hat, kann dieser das Statusfeld auswählen und den passenden Status über eine vordefinierte Auswahl setzen. Für Angebote stehen z. B. die Zustände offen, angenommen oder abgelehnt zur Verfügung, während Rechnungen als ausstehend oder bezahlt aufgeführt werden. Nach der Auswahl muss der neue Status durch den Benutzer gespeichert werden. Wurde der Status auch in der Datenbasis erfolgreich hinterlegt, erhält der Benutzer über die UI eine entsprechende Meldung. 

73 

Sequenzdiagramm 

74 

## **4.2 Pseudocode: Auftrag durchführen** 

Alle Aktivitäten im folgenden Pseudocode werden vom kaufmännischen Personal durchgeführt. Alle Vorgänge, die innerhalb oder von der Datenbasis und der UI aus ablaufen, sind im Pseudocode daher nicht aufgeführt. Im Sequenzdiagramm werden diese jedoch berücksichtigt. 

## 1 **BEGINN** 

- 2 Anfrage von Kunde erhalten # _E-Mail, Telefon, mündlich_ 

- 3 Anfrage auf Vollständigkeit prüfen # _Kundendaten, Bestellung, Anzahl, Termin_ 

- 4 **SOLANGE** Anfrage unvollständig 

- 5 Rücksprache mit Kunden halten 

- 6 **ENDE SOLANGE** 

- 7 Passendes Angebot suchen 

- 8 **WENN** Passendes Angebot nicht existiert 

- 9 **FÜHRE** OBJEKT ANLEGEN für Angebot **AUS** 

- 10 **ENDE WENN** 

- 11 Passendes Angebot auswählen 

- 12 Angebot an Kunden versenden 

- 13 **SOLANGE** Bestätigung nicht vorhanden 

- 14 Anfrage nicht weiter bearbeiten 

- 15 **WENN** Bestätigung nach zwei Wochen nicht erhalten 

- 16 Anfrage archivieren 

- 17 Breche die SOLANGE-Schleife ohne Erfolg ab 

- 18 # _Szenario wird beendet_ 

- 19 **ENDE WENN** 

- 20 **ENDE SOLANGE** 

- 21 **FÜHRE** OBJEKT ANLEGEN für Auftrag **AUS** 

- 22 **WENN** Kunde nicht vorhanden 

- 23 # _Im Sequenzdiagramm wird von einer leeren Datenbasis augegangen_ 

- 24 **FÜHRE** OBJEKT ANLEGEN für neuen Kunden **AUS** 

- 25 **ENDE WENN** 

- 26 **FÜHRE** OBJEKT ANLEGEN für Termin **AUS** # _als Haupttermin festlegen_ # _Alle Referenzen des Auftrags wurden im Sequenzdiagramm innerhalb des Unterpro-_ 

- 27 _gramms OBJEKT ANLEGEN bereits zugeordnet (hier: Kunde, Termin und Hauptverantwortlicher)_ 

- 28 Auftrag auswählen 

- 29 Auftrag dem Kunden bereitstellen # _Mail, Ausdruck, Post_ 

- 30 **SOLANGE** Unterschrift nicht vorhanden 

- 31 Auftrag nicht weiter bearbeiten 

- 32 **WENN** unterschriebener Auftrag nach einer Woche nicht erhalten 

74 

Sequenzdiagramm 

75 

- 33 Auftrag archivieren 

- 34 Breche die SOLANGE-Schleife ohne Erfolg ab 

- 35 # _Szenario wird beendet_ 

- 36 **ENDE WENN** 

- 37 **ENDE SOLANGE** 

- 38 **FÜHRE** MATERIALBESTELLUNG DURCHFÜHREN **AUS** # _Im Aktivitätsdiagramm_ 39 **FÜHRE** ZWISCHENTERMINE ABARBEITEN **AUS** 

- 40 # _Unterprogramm wurde nicht weiter verfeinert_ 

- # _Das Unterprogramm „ZWISCHENTERMINE ABARBEITEN“ wird von den zuständi-_ 

- 41 _gen Mitarbeitern durchgeführt. Das kaufmännische Personal ist hierbei nicht beteiligt_ 

- 42 **FÜHRE** OBJEKT ANLEGEN für Rechnung **AUS** 

- # _Alle Referenzen (Kunde, Auftrag, Rechnungsposten) der Rechnung wurden innerhalb_ 

- 43 _des Unterprogramms OBJEKT ANLEGEN zugeordnet_ 

- 44 **WENN** Änderung des Auftrags erwünscht 

- 45 

   - Realisierbarkeit überprüfen # _prüfen, was schon erledigt ist, ob noch genug Zeit und Kapazität ist_ 

- 46 **WENN** Änderung nicht realisierbar 47 Änderung ablehnen 

- 48 **SONST** 

- **FÜHRE** OBJEKT ANLEGEN für Auftrag **AUS** # _An dieser Stelle wird das_ 

- 49 _Szenario ab „OBJEKT ANLEGEN für Auftrag“ ausgeführt, wobei alle Schritte, die von der Änderung betroffen sind, erneut ausgeführt werden müssen_ 

- 50 **ENDE WENN** 

- 51 **ENDE WENN** 

- 52 **SOLANGE** Enddatum noch nicht erreicht 

- 53 **WENN** offene Zwischentermine vorhanden 

- 54 

   - **FÜHRE** Zwischentermine abarbeiten **AUS** # _Unterprogramm wurde nicht weiter verfeinert_ 

- 55 **ENDE WENN** 

- 56 **ENDE SOLANGE** 

- 57 Bestellung liefern oder abholen lassen 

- 58 Rechnung dem Kunden bereitstellen # _Mail, ausgedruckt per Hand/Post_ 

- 59 **FÜHRE** ZAHLVORGANG ABSCHLIESSEN **AUS** 

- 60 **ENDE** 

Nachfolgend werden einzelne Unterprogramme in Form von Pseudocode modelliert. 

75 

Sequenzdiagramm 

76 

## **Pseudocode Unterprogramm: Objekt anlegen** 

## 1 **BEGINN** 

- 2 Auf UI zugreifen 

- 3 **WIEDERHOLE** 

- 4 Eingabefeld auswählen 

- 5 **WENN** einfacher (primitiver) Datentyp 6 Daten eingeben 

- 7 **SONST** 

- 8 Objekt suchen 9 **WENN** Objekt existiert 

- 10 Objekt auswählen 11 **SONST** 

- 12 **FÜHRE** OBJEKT ANLEGEN **AUS** 13 **ENDE WENN** 14 **ENDE WENN** 

- 15 Datenfelder speichern 

- 16 **BIS** alle Eingabefelder vollständig ausgefüllt sind 

- 17 **ENDE** 

## **Pseudocode zu Unterprogramm: Zahlvorgang abschließen** 

- 1 **BEGINN** 

- 2 **WENN** Fälligkeitsdatum der Zahlung erreicht 

- 3 **FÜHRE** ZAHLUNG PRÜFEN **AUS** 

- 4 **WIEDERHOLE** 

- 5 **FÜHRE** OBJEKT ANLEGEN für Zahlungserinnerung **AUS** 

- 6 Zahlungserinnerung auswählen 

- 7 Zahlungserinnerung versenden 

- 8 **FÜHRE** STATUS SETZEN für Rechnung **AUS** 9 **FÜHRE** ZAHLUNG PRÜFEN **AUS** 

- 10 **BIS** Zahlung korrekt erfolgt 

- 11 **ENDE WENN** 

- 12 **ENDE** 

76 

Sequenzdiagramm 

77 

## **Pseudocode zu Unterprogramm: Zahlung prüfen** 

## 1 **BEGINN** 

- 2 Zahlungseingang auf Korrektheit prüfen 

- 3 **WENN** Zahlung korrekt erfolgt 

- 4 **FÜHRE** STATUS SETZEN für Rechnung **AUS** 5 **FÜHRE** STATUS SETZEN für Auftrag **AUS** 6 # _An dieser Stelle wird das Szenario beendet_ 

- 7 **SONST** 

- 8 **WENN** Drei Zahlungserinnerungen bereits versendet **FÜHRE** Rechtliche Schritte einleiten **AUS** # _Unterprogramm wurde nicht_ 

- 9 _weiter verfeinert_ 

- 10 # _An dieser Stelle wird das Szenario beendet_ 

- 11 **ENDE WENN** 

- 12 **ENDE WENN** 

- 13 **ENDE** 

## **Pseudocode zu Unterprogramm: Status setzen** 

## 1 **BEGIN** 

- 2 Auf UI zugreifen 

- 3 Objekt suchen 

- 4 Objekt auswählen 

- 5 Status des Objekts auswählen 

- 6 Status speichern 

- 7 **ENDE** 

Im Pseudocode gibt es an einer Stelle einen Befehl, der auf eine bereits ausgeführte Stelle im Code zurückführt und diese erneut ausführen lässt (bei der Änderung eines Auftrags). Solche Sprünge (sogenannte Goto-Sprünge) sind in Pseudocodes unüblich und sollten normalerweise vermieden werden. Gleichzeitig war jedoch auch das Ziel, den Pseudocode nicht unübersichtlicher und komplizierter zu gestalten, was mit weiteren Schleifen und tiefen Verschachtelungen der Fall gewesen wäre. Der Goto-Sprung wurde daher umschrieben, indem im Code an der Stelle des Sprungs nur das Unterprogramm ausgeführt wird, ab welchem der Ablauf wieder einsetzt. Mithilfe von Kommentaren wurde im Code darauf hingewiesen, dass alle Schritte, welche von der Änderung betroffen sind, erneut ausgeführt werden müssen. 

77 

Aktivitätsdiagramm 

78 

## **5 Aktivitätsdiagramm** 

Im folgenden Aktivitätsdiagramm wird das Szenario „Materialbestellungen durchführen“ dargestellt. Anschließend werden die einzelnen Schritte, welche auch im Pseudocode wiederzufinden sind, beschrieben. Wie bereits beim Sequenzdiagramm wurde das Szenario anhand einer Großbäckerei erstellt. Um die Anwendbarkeit auf sämtliche Handwerksbetriebe zu gewährleisten, wurden allgemeine und keine bäckereibezogenen Begrifflichkeiten verwendet. Die visualisierten Abläufe im Aktivitätsdiagramm stimmen größtenteils mit den Abläufen im Pseudocode überein. Da im Pseudocode viele Eventualitäten berücksichtigt und abgedeckt wurden, wurden im Aktivitätsdiagramm aus Gründen der Komplexität nicht alle möglichen Szenarien abgebildet, sondern teilweise vereinfacht dargestellt. Unterschiede zwischen Aktivitätsdiagramm und Pseudocode werden in solchen Ausnahmefällen in der nachfolgenden Beschreibung erläutert. Aus Gründen der Übersichtlichkeit wurden außerdem zusammenhängende Abläufe in Aktivitäten unterteilt. Hierzu gehören die Aktivitäten „Materialsuche“, „Lieferant anlegen“, „Materialauswahl“, „Bestellliste erzeugen“ und „Lieferung“. 

Wie auch im Sequenzdiagramm, wurden im Aktivitätsdiagramm exemplarische Zeitangaben verwendet (genaue Erläuterung siehe Abschnitt 4). 

78 

Aktivitätsdiagramm 

79 

## **5.1 Aktivitätsdiagramm: Materialbestellungen durchführen** 

Abbildung 20 — Aktivitätsdiagramm Materialbestellungen durchführen 

79 

Aktivitätsdiagramm 

80 

Um eine Materialbestellung durchführen zu können, muss über die Benutzeroberfläche der passende Kundenauftrag unter dem Menüpunkt „Auftrag“ geöffnet werden. Für jede einzelne Materialgruppe, welche für jedes Produkt existiert, muss der nun folgende beschriebene Ablauf durchlaufen werden. Zur Vermeidung von verschachtelten for-Schleifen wird das Szenario im Aktivitätsdiagramm exemplarisch an einer Materialgruppe gezeigt, lässt sich jedoch auf weitere Materialgruppen analog anwenden. 

## **Prüfung der Materialverfügbarkeit im Lager** 

Nachdem die jeweilige Materialgruppe geöffnet wurde, erfolgt die Überprüfung, ob die benötigten Materialien in ausreichender Menge im Lagerbestand vorhanden sind. Hierfür muss jedes Material (bzw. jede Zutat) einzeln geprüft werden. Im Aktivitätsdiagramm wird dafür eine for-Schleife verwendet, in welcher die Variable i = 0 eingeführt wird. Sobald ein Material abgearbeitet ist, wird das i um 1 erhöht. Erst wenn der Wert der Variablen i gleich der Anzahl der Materialien in der Materialgruppe ist, wird die for-Schleife nach einem letzten Durchgang verlassen. Innerhalb der for-Schleife muss für die Überprüfung der Materialverfügbarkeit auch beachtet werden, ob die Materialien zu den entsprechenden Zwischenterminen zur Verfügung stehen oder ob sie möglicherweise bereits einem anderen Auftrag zugewiesen wurden. Diese Prüfung ist entscheidend, um festzustellen, ob eine Bestellung notwendig ist oder nicht. Sind alle Materialien der Materialliste im Lager verfügbar, wird das gesamte Szenario beendet, da in diesem Fall keine Materialbestellung notwendig ist. 

## **Materialsuche** 

Für den Fall, dass das Material im Lager nicht verfügbar ist, beginnt die Materialsuche. Die Suche nach dem passenden Material erfolgt über eine Auswahlliste, welche unter dem Menüpunkt „Lieferanten“ geöffnet werden kann. Im Aktivitätsdiagramm wird an dieser Stelle in die Aktivität „Materialsuche“ übergegangen. Ist die WENN-Abfrage der Suche erfolgreich und das Material somit in der Liste vorhanden, wird das Szenario mit der Materialauswahl fortgeführt. Andernfalls muss ein passender Lieferant gesucht werden. Die Kontaktaufnahme mit verschiedenen Lieferanten sowie das Einholen von Angeboten kann dabei parallel ablaufen, da nicht erst auf ein Angebot gewartet werden muss, bevor der nächste Lieferant kontaktiert werden kann. Um dies zu verdeutlichen, wurden die zwei Aktionen mit einem Parallelisierungsknoten eingeführt und im Anschluss wieder mit einem Synchronisationsbalken zusammengeführt. Auf Grundlage des Angebotsvergleiches wird schließlich ein Angebot ausgewählt, wodurch die Aktivität Materialsuche als abgeschlossen gilt. 

## **Lieferant anlegen** 

Mit einer weiteren WENN-Abfrage wird überprüft, ob der Lieferant des ausgewählten Angebots bereits im System und somit auch in der Auswahlliste hinterlegt ist. Ist dies nicht der Fall, wird im Aktivitätsdiagramm die Aktivität „Lieferant anlegen“ begonnen und das Einga- 

80 

Aktivitätsdiagramm 

81 

beformular für das Anlegen neuer Lieferanten geöffnet. Dort werden die relevanten Attribute eingegeben. Sollte es dabei zu fehlerhaften Eingaben kommen (weitere WENN-Abfrage), wird der Fehler vom System erkannt, woraufhin eine passende Fehlermeldung über die UI ausgegeben wird. Sind die Eingaben korrekt, wird das neue Objekt Lieferant gespeichert. Mit der Hinterlegung des Lieferanten im System wird die Aktivität „Lieferanten anlegen“ beendet. Das benötigte Material wird ebenfalls in den Auswahllisten angelegt und mit dem entsprechenden Lieferanten verknüpft. Das Anlegen des Materials in den Auswahllisten erfolgt analog zum Anlegen des Objekts Lieferant. 

## **Materialauswahl** 

Die Auswahl des Materials wird in der Aktivität „Materialauswahl“ dargestellt. Sind für das gesuchte Material mehrere Lieferanten verfügbar, wird geprüft, ob es bereits eine offene Bestellliste für einen dieser Lieferanten gibt und ob eventuell Mengenrabatte angeboten werden. Ist dies der Fall, erfolgt ein Vergleich zwischen dem rabattierten Preis und dem günstigsten Einzelpreis. Dieser Vergleich ist entscheidend über die nun folgende Auswahl des Materials. Mit der Auswahl des Materials wird die Aktivität „Materialauswahl“ wieder verlassen. Eine offene Bestellliste, welche noch nicht abgeschickt wurde, zeichnet sich durch bereits zur Bestellung hinzugefügten Materialien aus. 

## **Bestellliste erzeugen** 

Nach Auswahl des Materials wird in die Aktivität „Bestellliste erzeugen“ übergegangen. Über eine WENN-Abfrage wird zuerst geprüft, ob eine offene Bestellliste des Lieferanten existiert (ob bereits Materialien bei dem Lieferanten bestellt werden möchten). Ist dies nicht der Fall, stellt sich die Frage, ob bereits eine Vorlage für die Bestellliste des entsprechenden Lieferanten vorhanden ist. Wenn nicht, wird ein neues Objekt Bestellliste mit den notwendigen Attributen angelegt. Dieser Vorgang geschieht analog zu „Lieferant anlegen“. Nachdem die entsprechende Bestellliste geöffnet wurde, wird das Material nun mit der entsprechenden Menge zur Bestellliste hinzugefügt und anschließend gespeichert. Dieser Schritt wird auch ausgeführt, wenn bereits eine offene Bestellliste vorhanden ist. 

## **Versand der Bestellungen per E-Mail** 

Wir gehen hier vereinfacht davon aus, dass alle Bestellungen bei den Lieferanten lediglich per E-Mail erfolgen können. Sobald alle Materialien der aktuellen Materialgruppe bearbeitet wurden, wird das Mailprogramm geöffnet. Für jede Bestellliste, die einem Lieferanten zugeordnet ist, wird eine neue E-Mail erstellt. Anschließend wird die jeweilige E-Mail-Adresse aus der Bestellliste übernommen, die E-Mail verfasst, die Bestellliste als Anhang beigefügt und versendet. Um sicher zu gehen, dass alle Bestelllisten bearbeitet werden, wurde im Aktivitätsdiagramm der Vorgang in einer while-do-Schleife ausgeführt. 

81 

Aktivitätsdiagramm 

82 

## **Rückmeldung des Lieferanten** 

Nun wird auf eine Rückmeldung des Lieferanten gewartet. Bleibt diese aus, wird nach einer Woche eine Erinnerungs-E-Mail versendet. Erfolgt danach innerhalb von drei Tagen weiterhin keine Rückmeldung, wird der Lieferauftrag storniert. In diesem Fall beginnt der Vorgang erneut mit der Materialsuche eines alternativen Lieferanten. Aus Gründen der Übersichtlichkeit und der Reduzierung der Komplexität wurde im Aktivitätsdiagramm der soeben beschriebene Fall, dass keine Rückmeldung eintrifft, nicht berücksichtigt. Mit den Möglichkeiten einer Absage und einer Bestätigung wird das Aktivitätsdiagramm in der Aktivität „Lieferung“ nun wieder passend zum Pseudocode fortgeführt. Wird ein Lieferauftrag von einem Lieferanten abgelehnt, wird ebenfalls ein anderer Lieferant gesucht und der Vorgang wiederholt sich. Im Aktivitätsdiagramm wird daher wieder in die Aktivität „Materialsuche“ übergegangen. 

## **Lieferung** 

Wird das bestellte Material zum vereinbarten Liefertermin geliefert, wird die zugehörige Rechnung im System gespeichert. Die Rechnung wird anschließend beglichen und der Lagerbestand wird entsprechend aktualisiert. Sollte die Lieferung nicht rechtzeitig eintreffen, wird der Lieferant kontaktiert, um eine Nachlieferung zu klären. Erfolgt diese nicht innerhalb eines angemessenen Zeitrahmens, wird der Lieferauftrag storniert. Nach der Stornierung des Lieferauftrags werden zwei Aktivitäten parallel ausgeführt: die Abstimmung mit dem Kunden und die erneute Ausführung der einzelnen Schritte, beginnend bei der Aktivität Materialsuche. Auf die explizite Darstellung eines Synchronisationsknotens wurde verzichtet, da beide Aktivitäten inhaltlich eng verzahnt sind und im weiteren Verlauf ohnehin zusammen enden. Die Abstimmung mit dem Kunden läuft bis zum Abschluss des Szenarios „Materialbestellung durchführen“ weiter, da die Ergebnisse dieser Kommunikation direkten Einfluss auf die weitere Materialbestellung haben können. Die gemeinsame Beendigung beider Prozesse ergibt sich somit implizit aus dem Ablauf und erfordert keine zusätzliche Synchronisation im Diagramm. Erfolgt die Lieferung dennoch im angemessenen Zeitraum, wird wie zu Beginn des Abschnittes vom Idealfall ausgegangen. Die Rechnung wird somit im System gespeichert und beglichen. Abschließend werden die Materialien im Lagerbestand aktualisiert. 

## **5.2 Pseudocode: Materialbestellungen durchführen** 

## 1 **BEGINN** 

- 2 Auf UI zugreifen 

- 3 Tab Kundenauftrag unter Menüpunkt Auftrag öffnen 

- 4 **FÜR** jede Materialgruppe 

- # _Im Aktivitätsdiagramm wird das Szenario aus Gründen der Übersichtlichkeit_ 

- 5 _exemplarisch an einer Materialgruppe gezeigt_ 

82 

Aktivitätsdiagramm 

83 

|6|Materialgruppe öfnen|
|---|---|
|7|**WIEDERHOLE**|
|8|Material-Verfügbarkeit im Lager prüfen|
||#_Zutaten/Materialien müssen zu den entsprechenden Zwischenterminen_|
|9||
||_vorhanden sein_|
||#_prüfen, ob das Material schon einem anderen Aufrag zugeordnet ist_|
|10||
||_(wird hier nicht weiter verfeinert)_|
|11|**WENN**Material im Lager nicht verfügbar|
|12|Menüpunkt Lieferanten öfnen|
|13|Auswahlliste öfnen|
|14|Nach entsprechendem Material suchen|
|15|**WENN**Material nicht in der Liste vorhanden|
|16|Nach passenden Lieferanten suchen #_Internet, Broschüre_|
|17|Lieferanten kontaktieren|
|18|Angebote einholen|
|19|Angebote vergleichen|
|20|Angebot auswählen|
|21|**WENN**Lieferant noch nicht in Auswahlliste vorhanden|
|22|Lieferant Eingabeformular öfnen|
|23|Attribute für den Lieferanten ausfüllen|
|24|**WENN**Eingabe nicht korrekt|
|25|Fehler erkennen|
|26|Fehlermeldung anzeigen|
|27|**SONST**|
|28|Objekt Lieferant speichern|
|29|**ENDE WENN**|
|30|**ENDE WENN**|
|31|Material in Auswahlliste anlegen|
||#_Eingabeformular öfnen und Attribute ausfüllen (analog zu Objekt_|
|32||
||_Lieferant anlegen)_|
|33|Material mit Lieferanten referenzieren|
|34|**ENDE WENN**|
|35|**WENN**Liste der Lieferanten > 1|
||**WENN**bereits ofene Bestellliste des Lieferanten vorhanden|
|36||
||und Lieferant Mengenrabatt anbietet|
||Material mit Mengenrabatt mit günstigstem Material der|
|37||
||Liste vergleichen|
|38|**ENDE WENN**|
|39|**ENDE WENN**|



83 

Aktivitätsdiagramm 

84 

- 40 Material auswählen **WENN** offene Bestellliste des ausgewählten Lieferanten nicht 

- 41 vorhanden 

- 42 **WENN** Objekt der Bestellliste des Lieferanten nicht existiert Objekt Bestellliste für den Lieferanten mit notwendigen 

- 43 Attributen anlegen 

- 44 # _analog zu Objekt Lieferant_ 45 **ENDE WENN** 46 Neue Bestellliste des Lieferanten öffnen 47 **ENDE WENN** Material mit entsprechender Menge zur Bestellliste des Lieferan- 

- 48 ten hinzufügen 

- 49 Liste speichern 50 **ENDE WENN** 51 **BIS** jede Zutat/Material abgearbeitet 52 Mailprogramm öffnen 53 **SOLANGE** nicht jede Bestellliste (pro Lieferant) abgearbeitet: 54 Neue E-Mail erstellen 55 E-Mail Adresse aus Bestellliste in Empfänger kopieren 

- 56 E-Mail für Lieferanten verfassen 57 Bestellliste anhängen 

- 58 E-Mail versenden 

- 59 **ENDE SOLANGE** 

- 60 **SOLANGE** Rückmeldung nicht eingetroffen 

- 61 Nicht weiter vorgehen 

- 62 **WENN** Rückmeldung eine Woche später nicht eingetroffen 

- 63 Entsprechende E-Mail erneut senden 

- 64 Auf Bestätigung warten 

- 65 **WENN** Rückmeldung 3 Tage später nicht eingetroffen 

- 66 Lieferauftrag stornieren 

- 67 Anderen Lieferanten suchen # _An dieser Stelle wird das Szenario ab „Nach entsprechendem_ 

- 68 _Material suchen“ erneut ausgeführt_ 

- 69 **ENDE WENN** 

- 70 **ENDE WENN** 

- 71 **ENDE SOLANGE** 

- 72 **WENN** Lieferauftrag abgelehnt wird 

- 73 Anderen Lieferanten suchen 

84 

Aktivitätsdiagramm 

85 

# _An dieser Stelle wird das Szenario ab „Nach entsprechendem Material_ 74 _suchen“ erneut ausgeführt_ 

- 75 **ENDE WENN** 

- 76 **WENN** Lieferung zum Liefertermin erhalten 77 Rechnung im Menüpunkt Auftrag dem Eigenauftrag zuordnen 78 Rechnung begleichen 79 Materialien im Lagerbestand aktualisieren 80 **SONST** 

- 81 Lieferanten kontaktieren 

- 82 

   - **WENN** Lieferant Lieferung nicht mehr im angemessenen Zeitraum nachliefert 

- 83 Lieferauftrag stornieren 84 Anderen Lieferanten suchen # _An dieser Stelle wird das Szenario ab „Nach entsprechendem Mate-_ 

- 85 _rial suchen“ erneut ausgeführt_ 

- 86 Mit Kunden absprechen 87 **SONST** 88 Rechnung im System speichern 89 Rechnung begleichen 90 Materialien im Lagerbestand aktualisieren 91 **ENDE WENN** 92 **ENDE WENN** 93 **ENDE** 

Wie auch im Pseudocode des Sequenzdiagrammes ergab sich bei der Erstellung an drei Stellen im Code das Problem mit den Sprüngen. Letztendlich wurde dieses Problem wieder durch Umschreibungen und Kommentare gelöst. Die Alternative, Sprünge durch tiefe Verschachtelungen zu lösen, wurde im Hinblick auf die Übersichtlichkeit und Komplexität vermieden. 

85 

Entwurf 

86 

## **6 Entwurf** 

## **6.1 Entwurfsklassendiagramm** 

In folgendem Kapitel wird das Entwurfsklassendiagramm gezeigt und erläutert. Dieses baut auf dem in Abschnitt 3.4 entwickelten Analyseklassendiagramm auf und erweitert dieses um weitere Klassen und Details. Neben einer veränderten Struktur und Darstellung der Modellklassen wurden einzelne Elemente genauer analysiert und in einzelne Packages unterteilt. Aus Gründen der Übersichtlichkeit wurden die verschiedenen Packages farblich gekennzeichnet. 

Die folgende Beschreibung bezieht sich auf die Veränderungen des Entwurfsklassendiagrammes in Bezug auf das AKD. Auf gleichgebliebene Strukturen wird nicht genauer eingegangen. 

Abbildung 21 — Entwurfsklassendiagramm 

86 

Entwurf 

87 

## **6.1.1 Packages** 

Im Folgenden werden die einzelnen Packages genauer erläutert. 

## **ModelDataTypes** 

Im Gegensatz zum Analyseklassendiagramm wurden alle Attribute durch exakte Attributtypen erweitert. Da einige Attribute noch in weitere Attribute aufgeteilt werden können, kann die Auswahl der Attributtypen teilweise nicht eindeutig getroffen werden. Aus diesem Grund wurde das Package „DataTypes“ erstellt, in dem neue Attributtypen definiert wurden. Wird in einer Klasse nun beispielsweise der Attributtyp „E-Mail“ aufgerufen, können im Package „DataTypes“ die dazugehörenden Attribute mit den entsprechenden Methoden aufgerufen werden. Ein weiterer Vorteil ist die Möglichkeit, zentrale Änderungen an einem Attribut vornehmen zu können, welche dann automatisch an allen Stellen der Software, an denen der entsprechende Attributtyp aufgerufen wird, umgesetzt wird. 

## **ModelMitarbeiter** 

Das Package „modelMitarbeiter“ umfasst alle zentralen Klassen, die zur Verwaltung von Mitarbeitern notwendig sind. Ein wesentlicher Unterschied zum AKD ist die Einführung der Enumerationen (enums) für „Rolle“, „Beschäftigungsart“ und „Bereich“. Enumerationen werden für zahlenmäßig begrenzte Elemente und Konstanten eingesetzt, wie z.B. für das enum „Beschäftigungsart” die Elemente Vollzeit oder Teilzeit. Während „Bereich“ zuvor als standardmäßige Klasse dargestellt wurde, wurden „Rolle“ und „Beschäftigungsart“ als zuvor definierte Attribute aus der Klasse Mitarbeiter gezogen. Die Klasse Rolle bezieht sich hierbei auf verschiedene Berechtigungsrollen, die den Mitarbeitern zugeteilt werden. 

Die ursprünglichen Klassen Kaufmännisches Personal, Administrator, Ausgewählter Mitarbeiter unterscheiden sich prinzipiell nicht. Aus diesem Grund wurden die Unterklassen im Entwurfsklassendiagramm durch die Rollen „Gruppenmitglied“ und „Bereichsmitglied“ ersetzt und von der Klasse Mitarbeiter aus entsprechend zu den Klassen Bereich und Gruppe referenziert. Eine Gruppe sowie ein Bereich können aus mehreren Mitgliedern bestehen und ein Mitglied kann wiederum mehreren Gruppen und/oder mehreren Bereichen zugeteilt sein. Auch die Klasse „Vorgesetzter“, welche im AKD mit der Klasse Gruppe verbunden ist, wurde durch die Rolle „Gruppenvorgesetzter“ ersetzt. Während ein Mitarbeiter die Funktion eines Vorgesetzten für mehrere Gruppen übernehmen kann, kann eine Gruppe nur einen Vorgesetzten haben. Außerdem wurde die Rolle „Bereichsleitung“ eingeführt, wobei ein Bereich durch eine Bereichsleitung angeführt wird und ein Mitarbeiter die Funktion der Bereichsleitung für genau einen Bereich erfüllen kann. 

## **ModelLogistik** 

87 

Entwurf 

88 

Das Package „modelLogistik“ umfasst die Klassen des Liefer- und Bestellprozesses. Auch hier wurden verschiedene Attribute aus Klassen gezogen und als eigene enums abgebildet. Hierzu gehören die enums „Lieferungsstatus“, „Material“ und „Branche“. Die Branche wurde als Attribut aus der Klasse Handwerksbetrieb herausgenommen und in das Package „modelLogistik“ eingefügt. Grund hierfür ist die zum Bestellvorgang gehörende branchenabhängige Auswahl der Produkte aus den Auswahllisten. Die Klasse Handwerksbetrieb wurde in kein spezielles Package eingefügt, da sie eine zentrale Rolle einnimmt und dadurch Referenzen zu mehreren Packages besitzt. 

## **ModelAuftragsmanagement** 

Das Package „modelAuftragsmanagement“ bildet die zentrale Logik zur Verwaltung von Angeboten, Aufträgen, Kunden und Rechnungen. Die Oberklasse Auftrag wurde als abstrakte Klasse umgesetzt, da sie lediglich der Vererbung dient. Im Programm kann so sichergestellt werden, dass es sich stets um einen konkreten „Eigenauftrag“ oder „Kundenauftrag“ handelt. Auch die Klasse Kunde wurde als abstrakt modelliert, da jeder Kunde entweder ein „Privatkunde“ oder ein „Geschäftskunde“ sein muss. Die Klasse Adresse wurde aus dem Modell herausgelöst und als eigener Datentyp im Package „modelDataTypes“ modelliert. Statt Referenzen enthält z.B. Kunde nun ein Attribut vom Typ Adresse. Dies erhöht die Wiederverwendbarkeit und reduziert Abhängigkeiten. 

Folgende Attribute aus dem AKD wurden in Enumerationen überführt: 

- Angebotsstatus (z.B. neu, angenommen) 

- Auftragskategorie (z.B. Reparatur, Wartung) 

- Rabattgruppe (z.B. Rabattgruppe 0, Rabattgruppe 1, …) 

## **ModelBetriebsmittel** 

Das Package „modelBetriebsmittel“ umfasst alle Klassen zur Verwaltung von eingesetzten Ressourcen wie Maschinen, Anlagen oder zugehörigen Informationen. Das Attribut „Kategorie“ der Klasse Bild wurde hier als Enum modelliert. 

## **ModelBuchhaltung** 

Das Package „modelBuchhaltung“ wurde im Entwurfsklassendiagramm neu eingeführt. Es bildet die für die Abrechnung relevanten Abläufe ab und integriert zwei wichtige externe Komponenten: das Finanzbuchhaltungsprogramm FiBuSys und ein Kartenlesegerät zur Abwicklung von Kartenzahlungen. Grundlage für diese Erweiterung sind Anforderungen aus dem Abschnitt 2.2.4 “Zusammenspiel mit anderen Systemen” aus dem Lastenheft. 

88 

Entwurf 

89 

Da das FiBuSys eine externe Anwendung ist, wurde im Entwurf eine eigene Schnittstellenklasse erstellt, die über ihre Methoden gezielt auf Funktionen der Finanzsoftware zugreifen kann. Die Methode **getGehaltsdaten(Miterarbeiternummer : int)** liefert beispielsweise Informationen der Klasse „Gehaltsdaten“ für den jeweiligen Mitarbeiter, welche aus dem FiBuSys bezogen und hier eingebunden werden. Eine vergleichbare Schnittstelle wurde auch für das Kartenlesegerät implementiert. Da beide Systeme extern betrieben werden, erfolgt im Klassendiagramm lediglich eine abstrahierte Darstellung über Schnittstellen. Zur Abwicklung der Zahlungen wurde zusätzlich die Klasse Karte modelliert, von der die beiden konkreten Klassen EC-Karte und Kreditkarte erben. Um sicherzustellen, dass wie gewünscht nur auf diese zwei Arten bezahlt werden kann, wurde die Oberklasse Karte abstrakt umgesetzt. Zusätzlich wurden die Enums „Auftragsstatus“, „Zahlungsstatus” und „Mahnstufe“ eingeführt, da laut Lastenheft der Auftragsstatus und der damit eingehende Zahlungsstatus durch die FiBuSys-Schnittstelle gesetzt werden sollen. Da das Mahnverfahren eng mit der Zahlungsverwaltung verbunden ist, wurde dies ebenfalls hier umgesetzt. 

## **ModelTermin** 

Im Vergleich zum Analysemodell wurde das Attribut „Terminkategorie“ in ein Enum überführt. Ein Termin muss immer einer der folgenden Kategorien zugeordnet werden: Haupttermin, Zwischentermin, Interner Termin oder Urlaub. So wird nun durch das Enum sichergestellt, dass nur gültige, vorgegebene Kategorien ausgewählt werden können. 

## **Util** 

Das „Util-Package“ stellt grundlegende Funktionalitäten zur Verwaltung von Entitäten sowie zum Datenimport und -export dar. Die Klasse GUIController ist hierbei lediglich als Ausschnitt enthalten. Die vollständige Modellierung der Benutzeroberfläche erfolgt im nächsten Kapitel und ist in diesem Entwurfsdiagramm aus Gründen der Übersichtlichkeit nicht enthalten. 

Ein weiteres zentrales Element ist der ImportAdapter, der den Datenimport aus verschiedenen Dateiformaten ermöglicht. Er verwendet zwei Schnittstellen: XMLReader für den Import von XML-Dateien und CSVReader für den Import von CSV-Dateien. Während im AnalyseTeil (Fragen-Antworten) noch festgehalten wurde, dass der Import hauptsächlich über XML erfolgen soll, hat sich bei der genaueren Modellierung gezeigt, dass CSV-Dateien in der Praxis ebenfalls eine wichtige Rolle spielen. Um den unterschiedlichen Anforderungen und Datenquellen gerecht zu werden, wird der Import daher sowohl für XML- als auch für CSV-Dateien unterstützt.Die beiden Komponenten XMLReader und CSVReader wurden im Entwurfsdiagramm als Interfaces modelliert, um eine hohe Flexibilität und Erweiterbarkeit zu ermöglichen. Durch die Verwendung von Schnittstellen kann der ImportAdapter unabhängig vom konkreten Dateiformat arbeiten und bleibt dadurch offen für zukünftige Erweiterungen, z.B. für JSON-Importe. Ein Interface definiert dabei nur das Verhalten, nicht jedoch die konkrete Umsetzung. 

89 

Entwurf 

90 

Der Export erfolgt hingegen weiterhin ausschließlich im XML-Format, da dieses im eigenen System als Standard festgelegt werden kann. Im Gegensatz zum Import, bei dem verschiedene Formate berücksichtigt werden müssen, ist beim Export eine einheitliche und strukturierte Ausgabe möglich. XML eignet sich hierfür besonders gut, da es komplexe Daten zuverlässig abbildet und sich gut für die Weiterverarbeitung in anderen Systemen eignet. 

## **6.1.2 Verwendete Entwurfsmuster** 

Im Rahmen der Modellierung des Entwurfsklassendiagramms wurden verschiedene Entwurfsmuster eingesetzt. Ein Entwurfsmuster ist eine bewährte Schablone für ein Entwurfsproblem und eine wiederverwendbare Vorlage zur Problemlösung. Die eingesetzten Muster werden im Folgenden beschrieben. 

## **Singleton** 

Die Klasse Datenbank wurde als Singleton umgesetzt, um sicherzustellen, dass nur eine einzige Instanz im gesamten System existiert. Diese Instanz verwaltet alle gespeicherten Elemente und wird durch den EntityManager angesprochen, um Objekte einzufügen, abzufragen oder zu entfernen. Die zentrale Instanz garantiert konsistenten Zugriff und verhindert, dass mehrere unabhängige Datenbestände entstehen, was zu Fehlern führen könnte. Daneben wurde auch die Klasse Handwerksbetrieb als Singleton umgesetzt. Der Handwerksbetrieb stellt das zentrale Kontextobjekt des gesamten Systems dar und muss daher systemweit eindeutig sein. 

## **Adapter (Objektadapter)** 

Ein Objektadapter wurde im System im Bereich des Datenimports eingeführt, um die Wiederverwendbarkeit und Flexibilität zu erhöhen. Die zentrale Klasse ImportAdapter ruft, abhängig davon, welche Art von Daten importiert werden soll, lediglich eine einheitliche Methode auf. Der ImportAdapter selbst stellt dabei nicht die konkrete Logik für den Import dar, sondern nutzt intern eines der beiden Schnittstellenimplementierungen: XMLReader oder CSVReader. So wird je nach Datenquelle entweder eine strukturierte XML-Datei oder eine CSV-Datei verarbeitet. 

## **Factory Method (Fabrikmethode)** 

Zur zentralen Erzeugung von Systemobjekten wie Aufträgen, Mitarbeitern oder Terminen kommt die ElementFactory zum Einsatz. Sie bündelt alle Erstellungsprozesse an einem Ort und sorgt so für eine saubere Trennung zwischen Objektinstanziierung und Geschäftslogik. Änderungen an der Art und Weise, wie ein Objekt erzeugt wird, können dadurch zentral umgesetzt werden, ohne Auswirkungen auf andere Systembereiche. 

90 

Entwurf 

91 

## **6.2 GUI Modellierung** 

Zur Reduzierung der Komplexität des Entwurfklassendiagrammes ist die GUI-Modellierung in dem folgenden separaten Diagramm zu finden. Hierfür wurde das in Abbildung 14 gezeigte Mockup analysiert und das entsprechende Kommunikationsschema mit UML-Komponentenn modelliert. Ziel ist es, das Zusammenspiel zwischen den relevanten GUI-Komponenten, den zugrunde liegenden Modellklassen sowie der Steuerung über beispielsweise Controller verständlich darzustellen. 

Das zugrunde liegende Mockup veranschaulicht die Benutzeroberfläche im Bereich der Kundenaufträge. Es dient als visuelle Basis für die UML-Modellierung und zeigt zentrale Aspekte wie Tab-basierte Ansichten, eine Suchleiste, ein DropDown-Menü sowie die tabellarische Darstellung von Auftragsdaten. Eine genaue Beschreibung des Mockups mit sämtlichen Funktionalitäten ist in Abschnitt 3.5.3 zu finden. Während in der GUI-Modellierung Komponenten der Java-Bibliothek verwendet wurden, wurde bei der Erstellung der Mockups auf eine strikt javagetreue Darstellung verzichtet. Ziel war es, eine moderne, zeitgemäße und benutzerfreundliche Oberfläche zu entwerfen, wie sie in aktuellen Webanwendungen oder modernen Desktop-Systemen üblich ist. Die Möglichkeiten der klassischen Java-Oberflächen, insbesondere in Bezug auf die visuelle Darstellung, sind in der Praxis deutlich eingeschränkt, weshalb das Design unabhängig von konkreten Java-Komponenten erstellt wurde. Dennoch lassen sich die Komponenten der Java-Bibliotheken in einer vereinfachten Version auf das Mockup abbilden. 

## **6.2.1 Aufbau GUI-Beispiel: Suchen nach Kundenaufträgen** 

Die folgende Darstellung ordnet den einzelnen Bereichen und Elementen des Mockups jeweils eine geeignete Java-Swing-Komponente zu. 

Abbildung 22 — GUI-Modellierung: Komponenten der Java Java-Bibliothek 

91 

Entwurf 

92 

Der linke Bereich stellt das Hauptmenü der Anwendung dar und wurde mithilfe einer `JToolBar` realisiert. Innerhalb dieser `JToolBar` befinden sich mehrere `JButton-Elemente` , die jeweils mit einem `ImageIcon` versehen sind. Diese Buttons repräsentieren zentrale Navigationspunkte wie „Dashboard“, „Kalender“, „Aufträge“, „Kunden“ oder „Lager“. Die Menüüberschrift „MENÜ“ wurde durch ein `JLabel` umgesetzt. Am oberen Rand der Oberfläche befindet sich eine `JMenuBar` , die übergreifende Funktionen wie die Spracheinstellung und das Benutzerprofil abbildet. Die `JMenuBar` besteht aus einem oder mehreren `JMenu-Elementen` , welche wiederum aus `JMenuItems` zusammengesetzt sind. Unter dem Menüpunkt Auftrag kommt ein `JTabbedPane` zum Einsatz. Dieses steuert die Sichtbarkeit der Hauptinhalte durch zwei Tabs: „Kundenaufträge“ und „Eigenaufträge“. Je nach aktivem Tab verändert sich der dargestellte Inhalt dynamisch. In der Auftragssuche, wird ein Suchbereich verwendet, der aus einer `JComboBox` und einem `JTextField` besteht. Die `JComboBox` dient der Auswahl des Suchkriteriums (Kundennummer oder Auftragsnummer), während das `JTextField` die eigentliche Eingabe aufnimmt. Der `JButton` mit dem Drucker-Icon am rechten Rand ermöglicht das Drucken der Liste. Die Ergebnisdarstellung der Suche wird durch eine `JTable` realisiert, welche zeilenweise alle im System gefundenen Auftragsobjekte abbildet. Sie ist scrollbar ( `JScrollpane` ) und für größere Datenmengen ausgelegt. 

Bei Attributen, die auf andere Elemente im System verweisen, wie beispielsweise die Rechnungsnummer, ist vorgesehen, diese zusätzlich als interaktive Verlinkung zu gestalten. In der Umsetzung mithilfe von Java Swing kann hierfür innerhalb der `JTable` ein `JLabel` verwendet werden, das als Zelleninhalt fungiert und durch einen `MouseListener` klickbar gemacht wird. Wie bereits in Abschnitt 3.5.3 beschrieben, entspricht die dargestellte Oberfläche der Sicht eines einfachen Mitarbeiters, der über Lesezugriff verfügt. Eine Bearbeitung oder das Löschen von Einträgen ist in dieser Ansicht nicht vorgesehen. 

## **6.2.2 Kommunikationsschema** 

Die folgende Abbildung zeigt das mit UML visualisierte Kommunikationsschema der GUI für das Suchen von Kundenaufträgen (siehe Abbildung 14). 

92 

Entwurf 

93 

Abbildung 23 — Kommunikationsschema 

Wie auch in den Diagrammen zuvor, sind die Klassen und Komponenten der GUI-Modellierung farblich voneinander abgehoben, um eine bessere visuelle Strukturierung zu erhalten. Folgend wird die Bedeutung der Farben erklärt: 

- Blau (package views): Alle konkreten GUI-Komponenten (auch der Mouse Adapter, da dieser direkt innerhalb der GUI-Komponenten zur Anwendung kommt) 

- Rosa (package views): Java-Swing-Komponenten, die zur grafischen Gestaltung verwendet werden. Diese Komponenten sind technisch gesehen die JComponent-basierten GUI-Bausteine. Sie sind eingebettet in die größeren Komponenten in Hellblau. 

- Hellblau (package events): Elemente der Event- und Observer-Struktur. Es sind Interfaces und konkrete Observer-Klassen enthalten, die auf Ereignisse reagieren. 

Die GUI-Modellierung besteht aus den drei Packages „view“, „event“ und „model“. Der GUIController ist so konzipiert, dass er als zentrale Kommunikationsinstanz zwischen den drei Packages agiert. Er übernimmt die Aufgabe, Benutzeraktionen aus der GUI entgegenzunehmen, diese in verarbeitbare Befehle umzuwandeln und die notwendigen Reaktionen in den Modellklassen auszulösen. Die Modellierung der GUI spiegelt nicht nur das visuelle Layout, sondern auch das zugrunde liegende Interaktionsverhalten gemäß dem MVC-Pattern wider. Durch die Verwendung des Observer-Patterns wurde sichergestellt, dass keine direkte 

93 

Entwurf 

94 

Kommunikation zwischen Views und den Modellklassen stattfindet. Dadurch können Modellklassen wiederverwendet werden. Die Verbindung zwischen dem GUIController und den Klassen Datenbank und Handwerksbetrieb wurde aus dem obigen Entwurfsklassendiagramm übernommen, um die Verbindung zwischen der GUI-Modellierung und dem Entwurfsklassendiagramm verständlich zu machen. 

## **View-Package** 

Das view-Package wird über eine Verbindung zwischen dem GUI-Controller und der MainGUI erreicht. Die zentrale MainGUI stellt dabei den Ausgangspunkt für sämtliche Navigationsund Interaktionsprozesse der Benutzeroberfläche dar. Die einzelnen Java-Swing-Elemente der Oberfläche, welche im view-Package zu finden sind, wurden bereits in Abbildung Abbildung 22 gezeigt und erläutert. Während die Benutzer zwischen der Ansicht Kundenaufträge und Eigenaufträge wechseln können, wurde in der GUI-Modellierung nur die Ansicht der Eigenaufträge weiter verfeinert. 

Wie bereits in der GUI-Modellierung notiert, erben alle Component-Klassen von GUIComponent, welche wiederum von der abstrakten Klasse OberservableComponent erbt. Diese beinhaltet auch die Aktivierung sowie die Deaktivierung der Observer. Durch die Methoden der Klasse ObservableComponent und der entsprechenden Vererbung können UpdateEvents und GuiEvents durch Benutzeraktionen ausgelöst werden. Die Events werden über den GUIController und anschließend über das Interface IGUIEventListener von dem jeweiligen Observer verarbeitet. Im event-Package befinden sich exemplarische Observer-Interfaces wie zum Beispiel AufträgeNavigationObserver, DruckenObserver oder FilterObserver. Diese Interfaces definieren jeweils eine oder mehrere Methoden, über die auf bestimmte Aktionen reagiert werden kann. Zur Unterstützung der Kommunikation zwischen Komponenten stellt das event-Package die Interfaces IUpdateEventSender und IUpdateEventListener bereit, welche vom GUIController implementiert werden. Sender erzeugen dabei aktiv Ereignisse und geben diese an Listener weiter. Listener wiederum sind Komponenten, die auf Ereignisse „hören“ und darauf reagieren. 

Beispiel: GUI-Komponenten wie Panels oder Menüeinträge erzeugen bei Benutzeraktionen (z. B. Mausklicks) ein entsprechendes GUIEvent. Der GUIController löst wiederum über die definierten Observer-Interfaces weitere Aktionen im System aus. So wird beispielsweise beim Klick auf ein Menüfeld ein MouseEvent ausgelöst. Dieser erzeugt ein GUIEvent, das z.B. an den Observer AufträgeNavigationObserver weitergegeben wird. Der GUIController kann nun darauf reagieren, indem er z. B. die Ansicht aktualisiert oder Daten lädt. 

94 

Besonderheiten 

95 

## **7 Besonderheiten** 

Für den Programmentwurf wurden methodische Ansätze und Schwerpunkte gewählt, die das Projekt von anderen Entwurfsansätzen unterscheiden und abheben. 

## **7.1 Allgemeinheit** 

Die Anwendung wurde so konzipiert, dass sie möglichst breit für unterschiedliche Handwerksbetriebe nutzbar ist. Zwar besitzen einzelne Betriebe wie Bäckereien, Dachdecker oder Heizungsbetriebe spezifische Anforderungen, diese werden jedoch nicht in der Kernanwendung, sondern über erweiterbare Plugins abgebildet. Die Kernsoftware enthält alle Funktionen, die in den meisten Handwerksbetrieben benötigt werden, und ist somit branchenübergreifend einsetzbar. 

## **7.2 Technische Expertise** 

Da es sich beim Auftraggeber um ein Softwareunternehmen handelt, das bereits Erfahrung mit der Entwicklung von Anwendungen für Handwerksbetriebe hat, wird von erweiterten technischen Grundkenntnissen ausgegangen. Zwar agiert das Unternehmen primär als Distributionsunternehmen, ist jedoch für die Wartung der Systeme zuständig. Dies setzt Grundkenntnisse über die Software voraus. Die Vorkenntnisse der Endnutzer können jedoch variieren und sind nicht den Kenntnissen des Auftragsgebers gleichzusetzen. 

## **7.3 Wartung** 

Die Wartung der Software erfolgt zentral durch die HWSoft Vertriebs-GmbH, um eine kontinuierliche Weiterentwicklung sicherzustellen. Dazu zählen insbesondere die Behebung von Fehlern und Sicherheitslücken, das Einspielen von Updates sowie die Pflege und Erweiterung der Plugin-Schnittstellen. Die Kundenbetriebe selbst müssen sich nicht um technische Details kümmern, sondern erhalten einen zuverlässigen Service aus einer Hand. Die Wartbarkeit ist somit nicht die höchste Priorität bei der Erstellung der Softwarelösung, soll jedoch durch entsprechende Dokumentation grundsätzlich gewährleistet werden. 

95 

Besonderheiten 

96 

## **7.4 Auswahllisten** 

Eine spezifische Anforderung des Auftraggebers sind branchenspezifische Auswahllisten. Hierbei wurde sich zum Beispiel ein Bäckereibetrieb vorgestellt, der die Zutaten für eine Schwarzwälder Kirschtorte bestellen möchte. Es kann dann sein, dass in den vom Distributionsunternehmen zur Verfügung gestellten Auswahllisten für eine Bäckerei genau eine solche Schwarzwälder Kirschtorte enthalten ist. In einem solchen Fall verfügt der Bäckereibetrieb über einen oder mehrere Namen von Lieferanten, bei denen er die benötigten Zutaten bestellen kann. Auf diese Weise muss nicht für jede einzelne Zutat jedes Mal ein Lieferant gesucht werden, sondern es kann auf eine vordefinierte Liste zurückgegriffen werden. So wird über die Zeit hinweg häufiger bei denselben Lieferanten bestellt, die dann auch bereits im System hinterlegt sind. Andere Handwerksbetriebe verfügen zum Beispiel über Auswahllisten für bestimmte Dachziegel oder Heizungsanlagen. Da wir bei den Diagrammen dennoch von einer leeren Datenbasis ausgehen, wurde jedes Material bzw. jede Zutat einzeln abgearbeitet. 

## **7.5 Finanzbuchhaltungssystem** 

Das FiBuSys ist ein gegebenes System der HWSoft Vertriebs-GmbH, das für die Finanzbuchhaltung der Kundenbetriebe genutzt wird. Denoch müssen in der Softwarelösung Finanzdaten wie Rechnungen abgebildet werden. Daher wird eine Rechnung in der Softwarelösung erstellt, die dann an das FiBuSys übergeben wird. Dort wird der Status aktualisiert und der Status mit dem FiBuSys synchronisiert. Bezahlungen wie das Terminal können so auch wie es bereits erfolgt über das FiBuSys abgewickelt werden. 

## **7.6 Termine** 

Die Verwaltung von Terminen erfolgt immer über eine definierte Zeitspanne. Da Aufträge zentraler Bestandteil der Software sind, gibt es für einen Auftrag immer einen Haupttermin. Während dieses Haupttermins, also der Dauer des Termins, können weitere sogenannte Zwischentermine durchgeführt werden. So können zum Beispiel bei einer Reparatur eines Daches mehrere Termine für die Anlieferung von Materialien und die Durchführung der Reparatur anfallen. 

## **7.7 UI-orientierte Modellierung** 

Ein zentrales Merkmal ist der stark UI-orientierte Aufbau der Diagramme und der Pseudocodes. Vor allem beim Sequenz- und Aktivitätsdiagramm wurde dies bewusst umgesetzt, da es 

96 

Besonderheiten 

97 

eine enge Orientierung an realen Benutzerinteraktionen ermöglicht und die spätere Umsetzung in einer benutzerfreundlichen Oberfläche unterstützt. Durch den Fokus auf typische Abläufe innerhalb der Benutzeroberfläche wird eine praxisnahe und nachvollziehbare Modellierung erreicht. 

## **7.8 Abdeckung zahlreicher Eventualitäten** 

Die Diagramme zeichnen sich durch eine detaillierte Modellierungstiefe aus. Es wurden dabei Sonderfälle, Abbrüche und alternative Verläufe durchgehend dargestellt. Um die Komplexität einzugrenzen und die Übersichtlichkeit zu wahren, wurden zum Beispiel beim Sequenzdiagramm einige verfeinerte Unterdiagramme erstellt, wodurch auch spezifische Abläufe gezielt betrachtet werden können. 

## **7.9 Mockups** 

Zur besseren Veranschaulichung der Software wurden drei verschiedene Mockups erstellt, um verschiedene Ansichten und Anwendungsfälle abzubilden. Besonders großen Wert haben wir dabei auf die Gestaltung einer intuitiven und übersichtlichen Benutzeroberfläche gelegt. Im Rahmen der GUI-Modellierung erfolgt eine Zuordnung der sichtbaren Elemente des Mockups zu passenden Java-Swing-Komponenten. Diese Analyse stellt eine Brücke zwischen konzeptionellem UI-Design und technischer Umsetzung dar. 

## **7.10 Rechtschreibung und Grammatik** 

Kapitel 2 und 3, welche gemeinsam in der Großgruppe bearbeitet wurden, sind in unserem Dokument nochmals auf Rechtschreib- und Grammatikfehler überprüft und korrigiert worden, was zu Unterschieden in den Dokumenten der Kleingruppen geführt hat. 

97 

