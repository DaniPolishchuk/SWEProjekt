#let question(body) = text(fill: color.rgb("#d88d1d"), body)

#let QaA(question, answer) = {
  block(
    inset: (left: 1em), // Ganzen Block einrücken
    [
      #text(fill: orange, weight: "bold")[#question] \
      #text(fill: green)[#sym.arrow #answer]
    ]
  )
}

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

- #QaA[Wie viele Mitarbeiter sind im Büro und vor Ort?][

]
- #QaA[Wie viele Mitarbeiter sollen gleichzeitig durchschnittlich auf das System zugreifen können? ][

]


== Anwendungsbereiche
Die Software wird ausschließlich für die Verwaltung unserer bauunternehmensspezifischen Daten eingesetzt. Es sollen mehrere PCs in den Büros installiert werden und mehrere PCs in Planungsräumen, in denen die Vorarbeiter alle relevanten Informationen über ihre Arbeitsaufträge lesen können. Sämtliche PCs befinden sich in unserem Bürogebäude, Bauleiter sollen vor Ort per Tablet oder Laptop auf Teile des Systems zugreifen können.
- #QaA[Auf welchen Geräten soll die Software laufen können?][
  siehe 2.2: auf PC, Laptop, Tablet 
]
- #QaA[Soll der Server extern oder intern gehostet werden?][
  TODO
]
- #QaA[Wie viele Personen sollen die Software gleichzeitig nutzen?][

]
- #QaA[Gibt es besondere Anforderungen an Performance?][

]
- #QaA[Welche Erfahrungen hatten die Nutzer mit dem alten System (Postivie/Negative Askpekte)?][

]
- #QaA[Von wo aus soll auf die Software zugegriffen werden können?][

]
- #QaA[Wo soll die zentrale Datenhaltung sein?][

]
- #QaA[[INTERN] Wie kann man sich das Mehrbenutzersystem genau vorstellen?][

]
- #QaA[[INTERN] Wie soll dieser Zugriff aussehen?][

]
- #QaA[Wie oft soll auf das System von außerhalb zugegriffen werden?][

]
- #QaA[Soll eine bestimmte Sicherheit beim Zugriff von außen existieren?][

]
- #QaA[Auf welche Teile des Systems soll zugegriffen werden dürfen (Siehe Rollen)?][

]
- #QaA[Sollen alle Daten von der Baustelle aus verfügbar sein?][

]
- #QaA[Wie sind die alten Daten gespeichert?][

]
- #QaA[Welche Formate der Daten sollen im Import bevorzugt werden?][

]
- #QaA[Welche Formate der Daten sollen im Export bevorzugt werden?][

]
- #QaA[Welche Daten sollen genau Importiert bzw. Exportiert werden?][

]
- #QaA[Gibt es Daten, die nicht aus dem alten System übertragen werden sollen?][

]
- #QaA[[INTERN] Sollen die Exportdaten verschlüsselt werden?][

]

== Zielgruppen, Benutzerrollen und Verantwortlichkeiten
Zur Zielgruppe zählen alle angestellten Mitarbeiter, die für die Erfassung und Verwaltung der Daten angestellt sind. 
Der Zugriff auf einzelne Daten soll je nach Berechtigung unterschiedlich erfolgen:
-	Alle Mitarbeiter in der Verwaltung sollen für sämtliche Daten Leserechte besitzen. Das bezieht sich auch auf den (selektiven) Export von Daten. Sie haben Vollzugriff auf die reinen Verwaltungsdaten.
-	Bau- und Projektleiter sollen Vollzugriff auf projektbezogene Daten haben.
-	Vorarbeiter sollen lesenden Zugriff auf ihre Arbeitsaufträge haben.
-	Ein Administrator hat Vollzugriff auf sämtliche Daten, vor allem für deren Import und Export sowie deren Backup.
Es sollen keine besonderen Computerkenntnisse zur Bedienung der Software erforderlich sein.

- #QaA[Welche Mitarbeiterpositionen soll es geben?][

]
- #QaA[Soll es Mitarbeiter geben, die nur für die Verwaltung der Daten angestellt sind?][

]
- #QaA[Wie sollen die Berechtigungen umgesetzt werden? Soll es ein bestimmtes Rollensystem geben?][

]
- #QaA[Wer soll genau zur „Verwaltung" zählen – nur Büromitarbeiter oder auch Bau- und Projektleiter im Büro? ][

]
- #QaA[Was sollen „reine Verwaltungsdaten" konkret sein – welche Daten fallen darunter, welche sind ausgeschlossen? ][

]
- #QaA[Sollen Verwaltungsmitarbeiter auf projektbezogene Daten nur Leserechte oder auch Schreibzugriff haben? ][

]
- #QaA[Soll ein Bau-/Projektleiter Vollzugriff auf alle oder nur auf seine eigenen Projekte haben? ][

]
- #QaA[Soll ein Vorarbeiter nur aktuelle Arbeitsaufträge einsehen oder auch vergangene und zukünftige Arbeitsauträge? ][

]
- #QaA[Soll eine Person mehrere Rollen gleichzeitig haben können, und sollen dann die kombinierten Rechte gelten? ][

]
- #QaA[Wer soll die Benutzerkonten und Rollenzuweisungen verwalten? – ausschließlich der Administrator? ][

]
- #QaA[Soll der Administrator eine dedizierte IT-Person oder ein normaler Mitarbeiter mit Zusatzrechten sein? ][

]
- #QaA[Sollen die Rollen fest vordefiniert sein oder soll der Administrator neue Rollen konfigurieren können? ][

]
- #QaA[Welche charakteristischen Merkmale soll die Benutzeroberfläche erfüllen, um für Menschen ohne besondere Computerkenntnisse?][

]
- #QaA[bedienbar zu sein? ][

]
- #QaA[Welche charakteristischen Daten sollen Projekte verwalten? ][

]
- #QaA[Welche charakteristischen Daten sollen Arbeitsaufträge verwalten? ][

]
- #QaA[Sollen Projekte zu Arbeitsaufträge zugeordnet werden? ][

]
- #QaA[Sollen mehrere Projekte zu einem Arbeitsauftrag gehören können? ][

]
- #QaA[Soll es Projekte ohne Aufträge geben können? ][

]
- #QaA[Soll es Aufträge ohne Projekte geben können? ][

]
- #QaA[Sollen Mitarbeiter eine Mitarbeiternummer haben? ][

]
- #QaA[Wie soll die Anmeldung funktionieren (Zertifikat, Passwort)? ][

]
- #QaA[Soll es eine 2FA geben? ][

]

== Zusammenspiel mit anderen Systemen
Es soll zunächst für unsere Bürorechner lauffähig gemacht werden. Parallel dazu soll die alte Software so lange weiterlaufen. Das zu entwickelnde Softwaresystem soll für unsere Büro-rechner aus Sicherheitsgründen ohne Netzverbindung nach Außen lauffähig sein. Mehrere Drucker sollen für die Erstellung der Rechnungen angeschlossen sein.
In einem weiterführenden Entwicklungsauftrag sollen ausgewählte Daten über einen Laptop oder ein Tablet direkt vor Ort verwaltet werden können. Das erhöht die Flexibilität unserer Bau- und Projektleiter vor Ort und senkt die Wartezeit bei Anfragen, Wünschen und kleineren Änderungen. Dieses „Tablet-Projekt“ selbst ist nicht direkter Bestandteil des ersten Entwicklungsauftrags, es sollen jedoch konkrete Vorschläge zur Realisierung (GUI, Schnittstellen, grobe Architektur) gemacht werden.
Die finanztechnischen Daten über die Mitarbeiter und Projekte (Gehälter bzw. Löhne, Projektkosten, Anschaffungen, Reparaturen, Reinigung usw.) werden separat durch ein vorhandenes Finanzbuchhaltungsprogramm verwaltet und müssen hier nicht berücksichtigt werden.
Die finanztechnischen Daten über Projekte (Rechnungen bzw. Mahnungen und Kostenvor-anschläge) müssen vom Finanzbuchhaltungssystem gelesen werden können, um sie im neuen System darstellen zu können. Die Erstellung und Änderung dieser Finanzdaten erfolgt ausschließlich im Finanzbuchhaltungssystem.
Vorhandene Daten aus dem Altsystem sollen in das neue System übernommen werden.
#question[
- Wie genau erfolgt die Anbindung an das Finanzbuchhaltungssystem? (Dateiimport, API, Datenbankzugriff?)
- In welchem Format liegen die Daten vor (CSV, XML, JSON)?
- Wie oft müssen Daten synchronisiert werden?
- Wie sieht die Struktur der Altdaten aus?
- Gibt es Dokumentation zum Altsystem?
- Müssen Daten validiert oder bereinigt werden beim Import?
]

== Produktfunktionen
- LF 10: Der jeweilige Benutzer muss die Möglichkeit haben, über eine grafische Benutzeroberfläche alle für ihn relevanten Daten einfach und übersichtlich zu verwalten. Es sollen zahlreiche Konfigurationsdaten lesbar gespeichert und beim nächsten Start des Programms verwendet werden (z.B. aktuelle Größe und Position des Fensters). Daneben sollen einige Elemente vor dem Start konfigurierbar sein (z.B. Überschriften, Schriftarten und -größen usw.)
#question[
- Sollen die einzelnen User unterschiedliche Konfigurationen haben oder soll es eine globale Konfiguration geben?
- Welche Daten sollen lesbar gespeichert werden (z.B. JSON, XML, CSV, ...)?
- Sollen Konfigurationen exportierbar sein?
- Sollen Konfigurationen lokal oder zentral gespeichert werden (z.B. in der Cloud)?
- Gibt es Einschränkungen bezüglich Farbenblindheit, Sehschwäche, ...?
]

- LF 20: Als Mitarbeiter unterscheiden wir Projektleiter, Bauleiter, Baugruppenleiter, Vorarbeiter, gelernte und ungelernte Bauarbeiter sowie Verwaltungsmitarbeiter. Daneben gibt es mehrere Gruppen (Verwaltung, Planung (z.B. Bauingenieure und Architekten), Projektleitung (v.a. Bauingenieure), Bauleitung, Baugruppen (enthalten Arbeitsgruppen)). Eine Gruppe kann dabei mehrere Mitarbeiter beinhalten, ein Mitarbeiter kann mehreren Gruppen angehören.
#question[
  - Wer kann Mitarbeiter und Gruppen anlegen, bearbeiten und löschen?
]

- LF 30: Zu den zentralen Daten eines Auftrags gehören: Projekt- und Baupläne, alle erstellten Angebote, Rechnungen und Mahnungen, Kostenvoranschläge, alle am Auftrag beteiligte Personen, Großgeräte, Einsatzort, Start-, End- und Zwischentermine usw.
#question[
  - Sind alles Pflichtfelder?
  - Soll es Vorlagen geben?
  - Sollen Personen referenziert werden oder als Zeichenkette angegeben werden?
]

- LF 40: Ein Auftrag kann von mehreren Unterauftragnehmern ausgeführt werden, d.h. Aufträge können Unteraufträge enthalten. Zur Abwicklung eines Auftrags ist ein Terminplaner erforderlich, der sämtliche Daten eines Auftrags bzw. Projekts beinhaltet.
#question[
  - Soll es Templates für Aufträge geben?
  - Gibt es Pflichtfelder für Aufträge?
  - Was sind "sämtliche Daten eines Auftrags bzw. Projekts"?
]

- LF 50: Es müssen die Baumaschinen (Bagger, LKWs, Kräne, Rüttler, Großbohrmaschinen, uvm.) sowie größere Bauwerkzeuge (Schalungsteile, Bausicherungen, Zäune, etc.) verwaltet werden. Die Baumaschinen und -werkzeuge haben unterschiedliche Ausrüstungen, nach denen sie bei der Suche unterschieden werden (z.B. Baggerschaufel, Kranzubehör (Behälter, Gewichte, Haken, usw.). Damit Baumaschinen und Geräte planbar zur Verfügung stehen, müssen sie über das System gebucht werden. Die Buchung kann direkt beim Anlegen eines Auftrags geschehen oder auch später bei Bedarf. Alle Baumaschinen und -werkzeuge sind einzelnen Lagern zugeordnet (Plätze und/oder Gebäude auf mehreren Grundstücken). Der momentane Standort muss zur Optimierung der Projektabläufe aktualisiert werden können. Daneben müssen Benutzungszeiträume angegeben werden können, um die Verfügbarkeit eines Geräts zu erhalten. Hier soll z.B. eine Baumaschine nach Ort und Verfügbarkeit gesucht werden können („welche Maschine steht wann zur Verfügung und ist am nächsten zum Einsatzort?“)

- LF 60: Nach allen wesentlichen Daten sollen mittels einer oder mehrerer Suchmaske im Datenbestand gesucht werden können.
#question[
  - Was sind die wesentlichen Daten, nach denen gesucht werden soll?
  - Ist eine Sortierung nötig?
  - Welche Suchmaske(n) sind nötig?
  - Wie sollen die Suchmasken aufgeteilt werden?
  - Wie viele Suchmasken soll es maximal geben?
  - Wie soll die Suche erfolgen? Volltextsuche, Suche nach Schlüsselwörtern, Suche nach Kategorien, ...
]

- LF 70: Die Auswahl der Daten soll möglichst über (eventuell durchsuchbare) Auswahllisten erfolgen. Dies gilt vor allem für Zuordnungen von Daten zu anderen Daten (z.B. Bau- fahrzeuge und Personen zu Projekten und Arbeitsaufträgen usw.). Die Auswahllisten sollen auf einfache Weise erweiterbar und für sämtliche Mitarbeiter im System verfügbar sein. 
#question[
  - Was sollen es für Auswahllisten sein (einzelne Auswahllisten mit einzelnen Objekte oder mit komplexen Beziehung)?
  - Welche Such- und Filtermöglichkeiten sollen die Auswahllisten haben?
  - Soll es eine Vorauswahl geben?
  - Wie sollen die Beziehungen zwischen den Daten dargestellt werden?
  - Wie sollen die Auswahllisten angezeigt werden? (z.B. Dropdown-Menüs, Listen, Scrollbar)?
  - Wie sollen die Auswahllisten erweitert werden? 
  - Soll Mehrfachauswahl möglich sein?
  - Sollen gelöschte oder inaktive Einträge bestimmt angezeigt werden?
  - INTERN: Soll es Lazy Loading geben oder sollen alle Daten direkt geladen werden?
]

- LF 80: Allen Elementen sollen beliebig viele Bilder mit Titel zugeordnet werden können, die zentral auf einem Verzeichnis liegen sollen
#question[
  - Was ist ein Element (z.B. auch Terminplaner)?
  - Für welche Elemente gilt das? Wirkliche alle?
  - Welche Bildformate sollen verwendet werden?
  - Dürfen gleiche Bilder doppelt existieren oder soll es eine zentrale Bildverwaltung geben?
  - Wie sollen die Bilder organisiert werden? Nach Kategorien, nach Datum, nach Projekten, ...
  - Wie sollen die Bilder angezeigt werden? In einer Galerie, als Thumbnails, ...
  - Welche Informationen sollen in den Bildern enthalten sein (Metadaten)?
  - Wie viel Speicherplatz soll für die Bilder vorgesehen werden?
  - Welche Dateiformate sind erlaubt?
  - Ist eine Versionshistorie notwendig?
  - Muss das Urheberrecht der Bilder beachtet werden?
]

- LF 90: Viele unserer Angestellten sind teilzeitbeschäftigt. Für alle Angestellten sollen deshalb die Anwesenheitszeiten erfasst werden.
#question[
  - Wie sollen die Anwesenheitszeiten erfasst werden? Manuell, automatisch, durch Stempelkarten, ...
  - Wer hat Lese- und Schreibrechte für die Anwesenheitszeiten?
  - Wie sollen die Anwesenheitszeiten organisiert werden? Nach Tagen, nach Wochen, nach Monaten, nach Stunden, nach Minuten...
  - Welche Informationen sollen in den Anwesenheitszeiten enthalten sein (z.B. Uhrzeit, Dauer, Grund für Abwesenheit, ...)?
  - Muss Abwesenheit auch erfasst werden? Wenn ja, wie soll das erfolgen?
  - Muss Datenschutz beachtet werden?
  - In Bezug auf die Zielsetzung: müssen die Daten exportierbar und importierbar sein?
]

- LF 100: Vor dem Hinzufügen von neuen Daten soll eine Überprüfung stattfinden, ob diese eventuell schon vorhanden sind.
#question[
  - Wie soll die Überprüfung erfolgen (manuell, automatisch, durch eine Suchfunktion, bei welchen Daten soll die Prüfung durchgeführt werden ...)?
  - Wer darf eine Überprüfung durchführen (wer hat Überschreibrechte)? 
  - Welche Informationen sollen bei der Überprüfung berücksichtigt werden (z.B. Name, Datum, Kategorie, ...)?
  - Was soll passieren, wenn die Daten bereits vorhanden sind? Sollen sie aktualisiert werden, sollen sie ignoriert werden, soll eine Fehlermeldung ausgegeben werden, ...?
]

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