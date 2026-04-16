#let question(body) = text(fill: color.rgb("#d88d1d"), body)

= Einleitung
Unser Bauunternehmen ist ein überregional agierendes Unternehmen im Hoch- und Tiefbau. Mit einem breiten Angebotsspektrum und ca. 200 Mitarbeitern gehören wir zu den führenden mittelständischen Unternehmen in der Rhein-Neckar-Region für den Bereich mittelgroßer Bauwerke (Ein- und Mehrfamilienhäuser, kleinere Brücken und Unterführungen, mittlere Hallenbauten wie Sport- und Festhallen sowie mittelgroße Bürogebäude).
Da die vorhandene Verwaltungssoftware teilweise auf veralteten Technologien basiert und eine Überarbeitung verhältnismäßig teuer ist, hat der Vorstand beschlossen eine neue Verwaltungssoftware mit zusätzlicher Funktionalität erstellen zu lassen.
Neben Projekten, Aufträgen, den Fahrzeugen, Großwerkzeugen sollen sämtliche beteiligte Personen und Verantwortliche sowie mehrere Benutzer verwaltet werden, um die anfallenden Verwaltungsarbeiten einfacher und schneller erledigen zu können.
Wir wünschen eine plattformunabhängige Lösung, die es ermöglicht, die kompletten Arbeits-abläufe auf unseren Desktoprechnern im Büro sowie ausgewählte Teile unserer Daten und Arbeitsabläufe auch auf Laptops und Tablets vor Ort einsehen und ändern zu können.
Da in den Büros mehrere verantwortliche Mitarbeiter arbeiten, muss es möglich sein, auf die Daten von mehreren Arbeitsplätzen aus zugreifen zu können. Hierzu ist eine zentrale Daten-haltung unerlässlich. Eine intuitive, leicht bedienbare Benutzeroberfläche setzen wir als selbstverständlich voraus


= Lastenheft
== Zielsetzung
Ziel des Entwicklungsauftrags soll eine Software für die Verwaltung unserer Bauunternehmensdaten sein. Eine zentrale Datenhaltung sowie ein Mehrbenutzersystem müssen realisiert werden. Daneben soll ein Zugriff von unseren Baustellen aus auf Teile des Systems möglich sein.
Ein Import und Export ausgewählter Daten muss möglich sein, ebenso müssen möglichst alle Daten aus dem alten System in das neue System übertragen werden

== Anwendungsbereiche
Die Software wird ausschließlich für die Verwaltung unserer bauunternehmensspezifischen Daten eingesetzt. Es sollen mehrere PCs in den Büros installiert werden und mehrere PCs in Planungsräumen, in denen die Vorarbeiter alle relevanten Informationen über ihre Arbeitsaufträge lesen können. Sämtliche PCs befinden sich in unserem Bürogebäude, Bauleiter sollen vor Ort per Tablet oder Laptop auf Teile des Systems zugreifen können.

== Zielgruppen, Benutzerrollen und Verantwortlichkeiten
Zur Zielgruppe zählen alle angestellten Mitarbeiter, die für die Erfassung und Verwaltung der Daten angestellt sind. 
Der Zugriff auf einzelne Daten soll je nach Berechtigung unterschiedlich erfolgen:
-	Alle Mitarbeiter in der Verwaltung sollen für sämtliche Daten Leserechte besitzen. Das bezieht sich auch auf den (selektiven) Export von Daten. Sie haben Vollzugriff auf die reinen Verwaltungsdaten.
-	Bau- und Projektleiter sollen Vollzugriff auf projektbezogene Daten haben.
-	Vorarbeiter sollen lesenden Zugriff auf ihre Arbeitsaufträge haben.
-	Ein Administrator hat Vollzugriff auf sämtliche Daten, vor allem für deren Import und Export sowie deren Backup.
Es sollen keine besonderen Computerkenntnisse zur Bedienung der Software erforderlich sein.

== Zusammenspiel mit anderen Systemen
Es soll zunächst für unsere Bürorechner lauffähig gemacht werden. Parallel dazu soll die alte Software so lange weiterlaufen. Das zu entwickelnde Softwaresystem soll für unsere Büro-rechner aus Sicherheitsgründen ohne Netzverbindung nach Außen lauffähig sein. Mehrere Drucker sollen für die Erstellung der Rechnungen angeschlossen sein.
In einem weiterführenden Entwicklungsauftrag sollen ausgewählte Daten über einen Laptop oder ein Tablet direkt vor Ort verwaltet werden können. Das erhöht die Flexibilität unserer Bau- und Projektleiter vor Ort und senkt die Wartezeit bei Anfragen, Wünschen und kleineren Änderungen. Dieses „Tablet-Projekt“ selbst ist nicht direkter Bestandteil des ersten Entwicklungsauftrags, es sollen jedoch konkrete Vorschläge zur Realisierung (GUI, Schnittstellen, grobe Architektur) gemacht werden.
Die finanztechnischen Daten über die Mitarbeiter und Projekte (Gehälter bzw. Löhne, Projektkosten, Anschaffungen, Reparaturen, Reinigung usw.) werden separat durch ein vorhandenes Finanzbuchhaltungsprogramm verwaltet und müssen hier nicht berücksichtigt werden.
Die finanztechnischen Daten über Projekte (Rechnungen bzw. Mahnungen und Kostenvor-anschläge) müssen vom Finanzbuchhaltungssystem gelesen werden können, um sie im neuen System darstellen zu können. Die Erstellung und Änderung dieser Finanzdaten erfolgt ausschließlich im Finanzbuchhaltungssystem.
Vorhandene Daten aus dem Altsystem sollen in das neue System übernommen werden.

== Produktfunktionen
- LF 10: Der jeweilige Benutzer muss die Möglichkeit haben, über eine grafische Benutzeroberfläche alle für ihn relevanten Daten einfach und übersichtlich zu verwalten. Es sollen zahlreiche Konfigurationsdaten lesbar gespeichert und beim nächsten Start des Programms verwendet werden (z.B. aktuelle Größe und Position des Fensters). Daneben sollen einige Elemente vor dem Start konfigurierbar sein (z.B. Überschriften, Schriftarten und -größen usw.)

- LF 20: Als Mitarbeiter unterscheiden wir Projektleiter, Bauleiter, Baugruppenleiter, Vorarbeiter, gelernte und ungelernte Bauarbeiter sowie Verwaltungsmitarbeiter. Daneben gibt es mehrere Gruppen (Verwaltung, Planung (z.B. Bauingenieure und Architekten), Projektleitung (v.a. Bauingenieure), Bauleitung, Baugruppen (enthalten Arbeitsgruppen)). Eine Gruppe kann dabei mehrere Mitarbeiter beinhalten, ein Mitarbeiter kann mehreren Gruppen angehören.

- LF 30: Zu den zentralen Daten eines Auftrags gehören: Projekt- und Baupläne, alle erstellten Angebote, Rechnungen und Mahnungen, Kostenvoranschläge, alle am Auftrag beteiligte Personen, Großgeräte, Einsatzort, Start-, End- und Zwischentermine usw.

- LF 40: Ein Auftrag kann von mehreren Unterauftragnehmern ausgeführt werden, d.h. Aufträge können Unteraufträge enthalten. Zur Abwicklung eines Auftrags ist ein Terminplaner erforderlich, der sämtliche Daten eines Auftrags bzw. Projekts beinhaltet.

- LF 50: Es müssen die Baumaschinen (Bagger, LKWs, Kräne, Rüttler, Großbohrmaschinen, uvm.) sowie größere Bauwerkzeuge (Schalungsteile, Bausicherungen, Zäune, etc.) verwaltet werden. Die Baumaschinen und -werkzeuge haben unterschiedliche Ausrüstungen, nach denen sie bei der Suche unterschieden werden (z.B. Baggerschaufel, Kranzubehör (Behälter, Gewichte, Haken, usw.). Damit Baumaschinen und Geräte planbar zur Verfügung stehen, müssen sie über das System gebucht werden. Die Buchung kann direkt beim Anlegen eines Auftrags geschehen oder auch später bei Bedarf. Alle Baumaschinen und -werkzeuge sind einzelnen Lagern zugeordnet (Plätze und/oder Gebäude auf mehreren Grundstücken). Der momentane Standort muss zur Optimierung der Projektabläufe aktualisiert werden können. Daneben müssen Benutzungszeiträume angegeben werden können, um die Verfügbarkeit eines Geräts zu erhalten. Hier soll z.B. eine Baumaschine nach Ort und Verfügbarkeit gesucht werden können („welche Maschine steht wann zur Verfügung und ist am nächsten zum Einsatzort?“)

- LF 60: Nach allen wesentlichen Daten sollen mittels einer oder mehrerer Suchmaske im Datenbestand gesucht werden können.

- LF 70: Die Auswahl der Daten soll möglichst über (eventuell durchsuchbare) Auswahllisten erfolgen. Dies gilt vor allem für Zuordnungen von Daten zu anderen Daten (z.B. Bau- fahrzeuge und Personen zu Projekten und Arbeitsaufträgen usw.). Die Auswahllisten sollen auf einfache Weise erweiterbar und für sämtliche Mitarbeiter im System verfügbar sein. 

- LF 80: Allen Elementen sollen beliebig viele Bilder mit Titel zugeordnet werden können, die zentral auf einem Verzeichnis liegen sollen.

- LF 90: Viele unserer Angestellten sind teilzeitbeschäftigt. Für alle Angestellten sollen deshalb die Anwesenheitszeiten erfasst werden.

- LF 100: Vor dem Hinzufügen von neuen Daten soll eine Überprüfung stattfinden, ob diese eventuell schon vorhanden sind.

== Produktdaten
- LD 10: Die Daten sollen zunächst in einer zentralen Datenbasis (lesbare Dateien) abgespeichert und später in eine Datenbank überführt werden.


== Produktleistungen
- LL10 Die Anzahl der zu verwaltenden Elemente wird auf ca. 100.000 geschätzt. 
- LL20 Die Daten müssen aus rechtlichen Gründen 10 Jahre online verfügbar sein.
- LL30 Um bei HW- und SW-Anschaffungen und -neuerungen flexibel zu bleiben, ist auf Platt-formunabhängigkeit besonders zu achten.

== Qualitätsanforderung
#table(columns: 5,
  [Produktqualität], [sehr gut], [gut], [normal], [nicht relevant],
  [Funktionalität], [], [X], [], [],
  [Zuverlässigkeit], [], [X], [], [],
  [Effizienz], [], [X], [], [],
  [Benutzbarkeit (auch Gestaltung)], [X], [], [], [],
  [Wartbarkeit], [], [], [X], [], 
  [Übertragbarkeit (Portabilität)], [], [X], [], [],
)

= Aufgabe
Es handelt sich hier um eine stark vereinfachte Verwaltungs-Software. Einzelne Lastenheft-punkte sind bewusst offengehalten. Denken Sie darüber nach, welche Informationen zusätz-lich sinnvoll oder auch notwendig sind. Recherchieren Sie auch nach einzelnen Zusammen-hängen im Internet.

== Analyse
Für die Analyse sind zu erstellen:
-	Analyse des Lastenhefts (Fragen und Antworten). 
-	Ein Use-Case-Diagramm der gesamten Anwendung incl. Beschreibung.
-	Eine Verfeinerung des Use-Case-Diagramms incl. Beschreibung. (nach Absprache!)
-	Ein Analyse-Klassendiagramm incl. Beschreibung (Untersuchen Sie dabei den Einsatz geeigneter Analysemuster)
-	Einfache GUI-Skizzen (Mockups) von mindestens zwei wesentlichen GUI-Komponenten (Hauptseite, Tabs, etc.). Die Skizzen können mit einem einfachen Gra-fikprogramm erstellt werden. Auch sorgfältige Handzeichnungen sind erlaubt. Keine Login-GUI skizzieren (wird zumindest nicht bewertet)


== Sequenzdiagramm und Aktivitätsdiagramm (Analyse oder Ent-wurf)
Erstellen Sie ein Sequenzdiagramm und ein Aktivitätsdiagramm (incl. Beschreibung) für fol-gende Szenarios (ein AD für das eine Szenario, ein SD für das andere Szenario):
-	Aktion „Auftrag anlegen und Auftrag löschen“ (z.B. Bau einer Garage oder eines Hau-ses)
-	Aktion "Anlegen und Buchung einer Baumaschine (z.B. Bagger mit Zubehör)“ 
Die Bewertung Ihrer Diagramme erfolgt auf der Basis der Nutzung der UML-Elemente, auf Ihrer Kreativität sowie dem Detaillierungsgrad des jeweiligen Diagramms.
Fassen Sie bei beiden Diagrammen die Eingabe aller primitiven Attribute eines Elements (Float, String, Integer, …) in einer einzigen Aktion zusammen (z.B. „Attribute eintragen“).
Für das Sequenzdiagramm ist das gewählte Szenario ausführlich zu entwickeln (idealer-weise mit Pseudocode oder einer anderen Modellierungsmethode Ihrer Wahl). Es sind sämtli-che referenzierten Elemente zu berücksichtigen, die zugeordnet werden können. 
In allen Fällen wird eine (noch) *leere Datenbasis* angenommen. Denken Sie an geeignete Diagrammverfeinerungen. 

== Entwurf 
Abzuliefern sind hier jeweils mit Beschreibung:
-	Entwurfsklassendiagramm (Untersuchen Sie dabei den Einsatz geeigneter Entwurfs-muster)
-	GUI-Modellierung (UML): Es ist das Kommunikationsschema eines Teils der während der Analyse skizzierten GUI mit UML zu modellieren. Die Anwendung selbst soll dabei nach dem einfachen Model-View-Control-Muster aufgebaut sein. Dazu sind mindestens ein Controller, die erforderlichen Modellklassen sowie eine unabhängige GUI (View) erforderlich.
-	Die meisten GUI-Elemente sowie einzelne Tools werden über eine einfache kleine Ja-va-Bibliothek zur Verfügung gestellt (swe-utils), deren GUI-Komponenten in das Klas-sendiagramm zu integrieren sind, wo immer sie verwendet werden können.
-	Die GUI-Modellierung kann in einem separaten Diagramm mit den relevanten (gewähl-ten bzw. benötigten) Modellklassen erfolgen, falls das Entwurfsklassendiagramm sonst zu komplex werden würde. 

= Vereinfachungen für den Programmentwurf
#enum(numbering: "a)",
[Es muss nicht dafür gesorgt werden, dass auf dieselben Daten bzw. CSV-Dateien nicht gleichzeitig zugegriffen werden kann, d.h. es ist kein Locking-Mechanismus er-forderlich.],
[Eine Protokollierfunktion und ein Login-Vorgang sind für die Anwendung nicht erforder-lich (in der Realität natürlich schon!).],
[Informationen über das Bürogebäude (Räume, PCs usw.) müssen nicht modelliert werden.],
[Projekt- und Baupläne können als Text (Pfad auf Dateien im Dateisystem) modelliert werden.],
[Der Terminplaner kann durch eine einfache Klasse modelliert werden.],

)

= Besonderheiten
#highlight()[In diesem Abschnitt nennen Sie alle Besonderheiten, die ich als Bewertender zusätzlich be-urteilen soll, damit ich Ihre besonderen Ideen und Realisierungen beim Korrigieren nicht über-sehe. 

Dazu gehören auch einzelne Beiträge, welche die mit den anderen Gruppen gemeinsam er-stellten Analyseergebnisse erweitern.
]

Use Case
Analyse 


Markos Lennard Elias
Johannes Luis Paula
Dani Justus
Jamie Simon
Cynthia Nico