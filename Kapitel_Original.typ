#let question(body) = text(fill: color.rgb("#d88d1d"), body)

= Aufgabenstellung

== Einleitung
#include "chapter/original/1.0_Einleitung.typ"

== Lastenheft
=== Zielsetzung
#include "chapter/original/2.1_Zielsetzung.typ"

=== Anwendungsbereiche
#include "chapter/original/2.2_Anwendungsbereiche.typ"

=== Zielgruppen, Benutzerrollen und Verantwortlichkeiten
#include "chapter/original/2.3_Zielgruppen-Benutzerrollen-Verantwortlichkeiten.typ"

=== Zusammenspiel mit anderen Systemen
#include "chapter/original/2.4_Zusammenspiel-mit-anderen-Systemen.typ"

=== Produktfunktionen
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

=== Produktdaten
- LD 10: Die Daten sollen zunächst in einer zentralen Datenbasis (lesbare Dateien) abgespeichert und später in eine Datenbank überführt werden.


=== Produktleistungen
- LL10 Die Anzahl der zu verwaltenden Elemente wird auf ca. 100.000 geschätzt. 
- LL20 Die Daten müssen aus rechtlichen Gründen 10 Jahre online verfügbar sein.
- LL30 Um bei HW- und SW-Anschaffungen und -neuerungen flexibel zu bleiben, ist auf Platt-formunabhängigkeit besonders zu achten.

=== Qualitätsanforderung
#include "chapter/original/2.8_Qualitätsanforderung.typ"

== Aufgabe
Es handelt sich hier um eine stark vereinfachte Verwaltungs-Software. Einzelne Lastenheft-punkte sind bewusst offengehalten. Denken Sie darüber nach, welche Informationen zusätz-lich sinnvoll oder auch notwendig sind. Recherchieren Sie auch nach einzelnen Zusammen-hängen im Internet.

=== Analyse
Für die Analyse sind zu erstellen:
-	Analyse des Lastenhefts (Fragen und Antworten). 
-	Ein Use-Case-Diagramm der gesamten Anwendung incl. Beschreibung.
-	Eine Verfeinerung des Use-Case-Diagramms incl. Beschreibung. (nach Absprache!)
-	Ein Analyse-Klassendiagramm incl. Beschreibung (Untersuchen Sie dabei den Einsatz geeigneter Analysemuster)
-	Einfache GUI-Skizzen (Mockups) von mindestens zwei wesentlichen GUI-Komponenten (Hauptseite, Tabs, etc.). Die Skizzen können mit einem einfachen Gra-fikprogramm erstellt werden. Auch sorgfältige Handzeichnungen sind erlaubt. Keine Login-GUI skizzieren (wird zumindest nicht bewertet)


=== Sequenzdiagramm und Aktivitätsdiagramm (Analyse oder Ent-wurf)
Erstellen Sie ein Sequenzdiagramm und ein Aktivitätsdiagramm (incl. Beschreibung) für fol-gende Szenarios (ein AD für das eine Szenario, ein SD für das andere Szenario):
-	Aktion „Auftrag anlegen und Auftrag löschen“ (z.B. Bau einer Garage oder eines Hau-ses)
-	Aktion "Anlegen und Buchung einer Baumaschine (z.B. Bagger mit Zubehör)“ 
Die Bewertung Ihrer Diagramme erfolgt auf der Basis der Nutzung der UML-Elemente, auf Ihrer Kreativität sowie dem Detaillierungsgrad des jeweiligen Diagramms.
Fassen Sie bei beiden Diagrammen die Eingabe aller primitiven Attribute eines Elements (Float, String, Integer, …) in einer einzigen Aktion zusammen (z.B. „Attribute eintragen“).
Für das Sequenzdiagramm ist das gewählte Szenario ausführlich zu entwickeln (idealer-weise mit Pseudocode oder einer anderen Modellierungsmethode Ihrer Wahl). Es sind sämtli-che referenzierten Elemente zu berücksichtigen, die zugeordnet werden können. 
In allen Fällen wird eine (noch) *leere Datenbasis* angenommen. Denken Sie an geeignete Diagrammverfeinerungen. 

=== Entwurf 
Abzuliefern sind hier jeweils mit Beschreibung:
-	Entwurfsklassendiagramm (Untersuchen Sie dabei den Einsatz geeigneter Entwurfs-muster)
-	GUI-Modellierung (UML): Es ist das Kommunikationsschema eines Teils der während der Analyse skizzierten GUI mit UML zu modellieren. Die Anwendung selbst soll dabei nach dem einfachen Model-View-Control-Muster aufgebaut sein. Dazu sind mindestens ein Controller, die erforderlichen Modellklassen sowie eine unabhängige GUI (View) erforderlich.
-	Die meisten GUI-Elemente sowie einzelne Tools werden über eine einfache kleine Ja-va-Bibliothek zur Verfügung gestellt (swe-utils), deren GUI-Komponenten in das Klas-sendiagramm zu integrieren sind, wo immer sie verwendet werden können.
-	Die GUI-Modellierung kann in einem separaten Diagramm mit den relevanten (gewähl-ten bzw. benötigten) Modellklassen erfolgen, falls das Entwurfsklassendiagramm sonst zu komplex werden würde. 

== Vereinfachungen für den Programmentwurf
#enum(numbering: "a)",
[Es muss nicht dafür gesorgt werden, dass auf dieselben Daten bzw. CSV-Dateien nicht gleichzeitig zugegriffen werden kann, d.h. es ist kein Locking-Mechanismus er-forderlich.],
[Eine Protokollierfunktion und ein Login-Vorgang sind für die Anwendung nicht erforder-lich (in der Realität natürlich schon!).],
[Informationen über das Bürogebäude (Räume, PCs usw.) müssen nicht modelliert werden.],
[Projekt- und Baupläne können als Text (Pfad auf Dateien im Dateisystem) modelliert werden.],
[Der Terminplaner kann durch eine einfache Klasse modelliert werden.],

)

== Besonderheiten
#highlight()[In diesem Abschnitt nennen Sie alle Besonderheiten, die ich als Bewertender zusätzlich be-urteilen soll, damit ich Ihre besonderen Ideen und Realisierungen beim Korrigieren nicht über-sehe. 

Dazu gehören auch einzelne Beiträge, welche die mit den anderen Gruppen gemeinsam er-stellten Analyseergebnisse erweitern.
]
