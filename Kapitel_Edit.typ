#let QaA(question, answer) = {
  block(
    [
      #text(fill: orange, weight: "bold")[#question] \
      #text(fill: green)[#sym.arrow #answer]
    ]
  )
}
 
#let tableGrid(cells) = {
  table(..cells, columns: 2, stroke: none,
    inset: (right: 0.5em),
  )
}

= Analyse des Lastenhefts

== Einleitung
Unser Bauunternehmen ist ein überregional agierendes Unternehmen im Hoch- und Tiefbau. Mit einem breiten Angebotsspektrum und ca. 200 Mitarbeitern gehören wir zu den führenden mittelständischen Unternehmen in der Rhein-Neckar-Region für den Bereich mittelgroßer Bauwerke (Ein- und Mehrfamilienhäuser, kleinere Brücken und Unterführungen, mittlere Hallenbauten wie Sport- und Festhallen sowie mittelgroße Bürogebäude).
Da die vorhandene Verwaltungssoftware teilweise auf veralteten Technologien basiert und eine Überarbeitung verhältnismäßig teuer ist, hat der Vorstand beschlossen eine neue Verwaltungssoftware mit zusätzlicher Funktionalität erstellen zu lassen.
Neben Projekten, Aufträgen, den Fahrzeugen, Großwerkzeugen sollen sämtliche beteiligte Personen und Verantwortliche sowie mehrere Benutzer verwaltet werden, um die anfallenden Verwaltungsarbeiten einfacher und schneller erledigen zu können.
Wir wünschen eine plattformunabhängige Lösung, die es ermöglicht, die kompletten Arbeits-abläufe auf unseren Desktoprechnern im Büro sowie ausgewählte Teile unserer Daten und Arbeitsabläufe auch auf Laptops und Tablets vor Ort einsehen und ändern zu können.
Da in den Büros mehrere verantwortliche Mitarbeiter arbeiten, muss es möglich sein, auf die Daten von mehreren Arbeitsplätzen aus zugreifen zu können. Hierzu ist eine zentrale Daten-haltung unerlässlich. Eine intuitive, leicht bedienbare Benutzeroberfläche setzen wir als selbstverständlich voraus

- #QaA[Wie viele Mitarbeiter sind konkret in der Verwaltung tätig und wie viele arbeiten auf den Baustellen?][
  Von den ca. 200 Mitarbeitern arbeiten etwa 30 in der Verwaltung (Büro) und etwa 170 auf den Baustellen.
]
- #QaA[Welche überregionalen Gebiete deckt das Bauunternehmen ab und gibt es geplante Expansionen in weitere Regionen?][
  Das Kerngebiet ist die Rhein-Neckar-Region sowie angrenzende Gebiete in Baden-Württemberg und Rheinland-Pfalz. Eine Expansion ist derzeit nicht geplant.
]
- #QaA[Welche konkreten Fachbereiche umfasst das breite Angebotsspektrum im Hoch- und Tiefbau neben den genannten Bauwerkstypen?][
  Hochbau: Wohngebäude, Bürogebäude, Hallenbauten. Tiefbau: Brücken, Unterführungen, Kanalbau. Zusätzlich: Sanierung und Modernisierung bestehender Bauwerke.
]
- #QaA[Wie soll die neue Verwaltungssoftware die bisherigen Verwaltungsarbeiten konkret vereinfachen – welche manuellen Arbeitsschritte sollen automatisiert werden?][
  Bisher werden Aufträge, Baumaschinen und Personalzuordnungen teilweise in Excel-Listen und auf Papier verwaltet. Die neue Software soll das Anlegen und Suchen von Aufträgen, die Buchung von Baumaschinen und die Zuordnung von Mitarbeitern zu Projekten zentral und digital ermöglichen.
]
- #QaA[Welches vorhandene Softwarewerkzeug wird aktuell für die Verwaltung eingesetzt und auf welcher technologischen Basis ist dieses aufgebaut?][
  Aktuell wird eine Kombination aus einer älteren Desktop-Anwendung (basierend auf Visual Basic) und diversen Excel-Tabellen verwendet. Die Daten liegen in einer lokalen Datenbank.
]
- #QaA[Was waren die positiven Aspekte der alten Verwaltungssoftware, die in das neue System übernommen werden sollen?][
  Die übersichtliche Darstellung der Auftragsdaten und die einfache Suche nach Mitarbeitern wurden als positiv bewertet. Diese Übersichtlichkeit soll beibehalten werden.
]
- #QaA[Welche negativen Erfahrungen haben die Mitarbeiter mit der bisherigen veralteten Software gemacht, die im neuen System vermieden werden sollen?][
  Die alte Software war langsam, konnte nur von einem Arbeitsplatz bedient werden und bot keine Möglichkeit, Daten mobil abzurufen. Außerdem fehlte eine zentrale Datenhaltung, sodass Daten teilweise doppelt gepflegt wurden.
]
- #QaA[Wie kamen technisch weniger versierte Mitarbeiter mit der bisherigen Software zurecht und welche Bedienungsprobleme traten dabei regelmäßig auf?][
  Vorarbeiter und Bauleiter hatten Schwierigkeiten mit der unübersichtlichen Menüstruktur. Häufig wurden falsche Eingabefelder befüllt. Die neue Software soll deshalb klare, einfache Eingabemasken bieten.
]
- #QaA[Was genau wird unter einer „intuitiven, leicht bedienbaren Benutzeroberfläche" verstanden – soll die neue Oberfläche nach einem bestimmten Gestaltungsprinzip aufgebaut sein (z.B. möglichst wenige Klicks, alle wesentlichen Informationen auf einen Blick)?][
  Die wichtigsten Informationen (Aufträge, Baumaschinen, Mitarbeiter) sollen von einer zentralen Übersichtsseite aus erreichbar sein. Maximal drei Klicks bis zur gewünschten Information. Keine Kommandozeile oder technische Fehlermeldungen.
]
- #QaA[Soll eine bestimmte Barrierefreiheit (Accessibility) bei der grafischen Benutzeroberfläche beachtet werden (z.B. Unterstützung für Sehbehinderte, Spracheingabe)?][
  Barrierefreiheit ist derzeit keine Anforderung. Es gibt keine Mitarbeiter mit entsprechenden Einschränkungen.
]
- #QaA[Wie stellt man sich die plattformunabhängige Lösung konkret vor – soll es eine native Desktop-Anwendung mit Java, eine Web-Applikation oder eine hybride Lösung sein?][
  Es soll eine Java-Desktop-Anwendung sein, die plattformunabhängig auf Windows, Linux und macOS läuft. Für das spätere Tablet-Projekt wird eine separate Web- oder App-Lösung in Betracht gezogen.
]
- #QaA[Wie viele Desktoprechnern im Büro sollen gleichzeitig auf die zentrale Datenbasis zugreifen können?][
  Bis zu 15 Desktop-Rechner sollen gleichzeitig auf die zentrale Datenbasis zugreifen können.
]
- #QaA[Welche ausgewählten Teile der Daten und Arbeitsabläufe sollen auf den mobilen Endgeräten (Laptops, Tablets) vor Ort verfügbar sein?][
  Auf mobilen Endgeräten sollen Auftragsdaten (Einsatzort, Termine, beteiligte Personen), Baumaschinenstandorte und Arbeitsaufträge lesend verfügbar sein. Das Tablet-Projekt ist aber nicht Bestandteil des ersten Entwicklungsauftrags.
]
- #QaA[Sollen die mobilen Endgeräte auch ohne bestehende Netzverbindung (offline) auf zwischengespeicherte Daten zugreifen können und wie sollen Datenänderungen bei der anschließenden Synchronisation behandelt werden?][
  Ja, eine Offline-Fähigkeit ist wünschenswert. Änderungen sollen beim nächsten Verbindungsaufbau synchronisiert werden. Dies ist jedoch Teil des späteren Tablet-Projekts und nicht des aktuellen Auftrags.
]
- #QaA[Wie viele verantwortliche Mitarbeiter arbeiten typischerweise gleichzeitig im Büro an der Software?][
  Typischerweise arbeiten 5 bis 10 Verwaltungsmitarbeiter gleichzeitig mit der Software.
]
- #QaA[Welche beteiligte Personen und Verantwortliche sollen neben Bau- und Projektleitern im neuen System verwaltet werden (z.B. externe Auftragnehmer, Architekten, Behördenkontakte)?][
  Neben den eigenen Mitarbeitern sollen auch externe Unterauftragnehmer als Kontaktdaten verwaltet werden. Architekten und Behörden werden nicht im System gepflegt.
]
- #QaA[Gibt es konkrete zeitliche Erwartungen oder einen gewünschten Projektfahrplan für die Einführung der neuen Verwaltungssoftware?][
  Die Analyse und der Entwurf sollen innerhalb des aktuellen Semesters abgeschlossen werden. Ein konkreter Produktionstermin ist nicht festgelegt.
]
- #QaA[Soll bei der Überarbeitung der veralteten Technologien auf eine bestimmte Programmiersprache oder ein bestimmtes Framework gesetzt werden, oder ist die technologische Entscheidung dem Entwicklungsteam überlassen?][
  Es soll Java eingesetzt werden, da es plattformunabhängig ist und in die bestehende Systemlandschaft passt. Die GUI soll mit der bereitgestellten swe-utils-Bibliothek umgesetzt werden.
]
- #QaA[Wie hoch ist das Budget für die neue Verwaltungssoftware und gibt es finanzielle Einschränkungen bei der Wahl der eingesetzten Technologien oder Lizenzen?][
  Es sollen ausschließlich kostenfreie und quelloffene Technologien verwendet werden. Es stehen keine zusätzlichen Lizenzbudgets zur Verfügung.
]
- #QaA[Gibt es gesetzliche oder branchenspezifische Vorschriften (z.B. Datenschutz, Baurecht, Aufbewahrungsfristen), die bei der neuen Verwaltungssoftware zwingend berücksichtigt werden müssen?][
  Ja, alle Auftragsdaten müssen gemäß gesetzlicher Aufbewahrungsfristen mindestens 10 Jahre verfügbar bleiben. Personenbezogene Mitarbeiterdaten unterliegen den Datenschutzbestimmungen (DSGVO).
]

== Lastenheft
=== Zielsetzung
Ziel des Entwicklungsauftrags soll eine Software für die Verwaltung unserer Bauunternehmensdaten sein. Eine zentrale Datenhaltung sowie ein Mehrbenutzersystem müssen realisiert werden. Daneben soll ein Zugriff von unseren Baustellen aus auf Teile des Systems möglich sein.
Ein Import und Export ausgewählter Daten muss möglich sein, ebenso müssen möglichst alle Daten aus dem alten System in das neue System übertragen werden
- #QaA[Auf welchen Geräten soll die Software laufen können?][
  Primär auf Desktop-PCs im Büro (Windows, Linux). Später auch auf Laptops und Tablets (Tablet-Projekt, nicht Teil des ersten Auftrags).
]
- #QaA[Soll der Server extern oder intern gehostet werden?][
  Der Server soll intern im eigenen Bürogebäude gehostet werden. Ein externer Server ist aus Sicherheitsgründen nicht gewünscht.
]
- #QaA[Wie viele Personen sollen die Software gleichzeitig nutzen?][
  Bis zu 15 Personen gleichzeitig im Normalbetrieb, maximal 20 in Spitzenzeiten.
]
- #QaA[Gibt es besondere Anforderungen an Performance?][
  Suchanfragen und das Laden von Auftrags- oder Maschinendaten sollen innerhalb weniger Sekunden abgeschlossen sein. Lange Wartezeiten sind nicht akzeptabel.
]
- #QaA[Welche Erfahrungen hatten die Nutzer mit dem alten System (Postivie/Negative Askpekte)?][
  Positiv: einfache Auftragsübersicht. Negativ: langsame Reaktionszeiten, kein Mehrbenutzerzugriff, keine mobile Nutzung, Daten mussten doppelt gepflegt werden.
]
- #QaA[Von wo aus soll auf die Software zugegriffen werden können?][
  Primär von den Büroarbeitsplätzen im Bürogebäude. Später soll ein Zugriff von Baustellen per Tablet möglich sein (Tablet-Projekt).
]
- #QaA[Wo soll die zentrale Datenhaltung sein?][
  Auf einem zentralen Server im Bürogebäude. Alle Büro-PCs greifen über das interne Netzwerk darauf zu.
]
- #QaA[[INTERN] Wie kann man sich das Mehrbenutzersystem genau vorstellen?][
  Mehrere Benutzer greifen gleichzeitig über das interne Netzwerk auf dieselbe zentrale Datenbasis zu. Jeder Benutzer hat eine eigene Rolle mit entsprechenden Rechten. Ein Locking-Mechanismus ist laut Vereinfachung nicht erforderlich.
]
- #QaA[[INTERN] Wie soll dieser Zugriff aussehen?][
  Über eine Java-Desktop-Anwendung, die auf jedem Büro-PC installiert wird und sich per Netzwerk mit der zentralen Datenbasis verbindet.
]
- #QaA[Wie oft soll auf das System von außerhalb zugegriffen werden?][
  Derzeit kein Zugriff von außerhalb geplant. Der externe Zugriff ist Teil des späteren Tablet-Projekts.
]
- #QaA[Soll eine bestimmte Sicherheit beim Zugriff von außen existieren?][
  Da das System zunächst ohne Netzverbindung nach außen lauffähig sein soll, ist kein externer Zugriff vorgesehen. Für das spätere Tablet-Projekt soll ein gesicherter Zugang (z.B. VPN) vorgesehen werden.
]
- #QaA[Auf welche Teile des Systems soll zugegriffen werden dürfen (Siehe Rollen)?][
  Der Zugriff richtet sich nach den Benutzerrollen: Verwaltung hat Leserechte auf alles und Vollzugriff auf Verwaltungsdaten. Bau-/Projektleiter haben Vollzugriff auf projektbezogene Daten. Vorarbeiter haben Lesezugriff auf ihre Arbeitsaufträge. Administrator hat Vollzugriff auf alles.
]
- #QaA[Sollen alle Daten von der Baustelle aus verfügbar sein?][
  Nein, nur ausgewählte Daten: Auftragsinformationen, Einsatzort, beteiligte Personen und Baumaschinenstandorte. Dies ist aber Teil des Tablet-Projekts.
]
- #QaA[Wie sind die alten Daten gespeichert?][
  Die alten Daten liegen in einer lokalen Datenbank und teilweise in Excel-Dateien vor.
]
- #QaA[Welche Formate der Daten sollen im Import bevorzugt werden?][
  CSV-Dateien (Semikolon-separiert) als primäres Importformat. Diese sind lesbar und einfach zu verarbeiten.
]
- #QaA[Welche Formate der Daten sollen im Export bevorzugt werden?][
  Der Export soll ebenfalls im CSV-Format erfolgen, um Kompatibilität mit anderen Systemen zu gewährleisten.
]
- #QaA[Welche Daten sollen genau Importiert bzw. Exportiert werden?][
  Import: alle bestehenden Auftragsdaten, Mitarbeiterdaten, Baumaschinen- und Werkzeugdaten aus dem Altsystem. Export: selektiver Export einzelner Datensätze (z.B. Aufträge, Mitarbeiterlisten) für Berichte oder Backups.
]
- #QaA[Gibt es Daten, die nicht aus dem alten System übertragen werden sollen?][
  Finanztechnische Daten (Gehälter, Löhne, Projektkosten) werden nicht übertragen, da sie im separaten Finanzbuchhaltungssystem verwaltet werden.
]
- #QaA[[INTERN] Sollen die Exportdaten verschlüsselt werden?][
  Nein, eine Verschlüsselung der Exportdaten ist nicht erforderlich. Die Dateien werden nur intern verwendet.
]

=== Anwendungsbereiche
Die Software wird ausschließlich für die Verwaltung unserer bauunternehmensspezifischen Daten eingesetzt. Es sollen mehrere PCs in den Büros installiert werden und mehrere PCs in Planungsräumen, in denen die Vorarbeiter alle relevanten Informationen über ihre Arbeitsaufträge lesen können. Sämtliche PCs befinden sich in unserem Bürogebäude, Bauleiter sollen vor Ort per Tablet oder Laptop auf Teile des Systems zugreifen können.
[INTERN] Welche Leistung haben die PCs (Welche technische Anforderungen)? 

- #QaA[[INTERN] Soll es eine Webapp oder eine eigene Applikation sein?][

]
- #QaA[Wie viele Tablets und PCs sollen gleichzeitig mit der neuen Software verwendet werden? ][
  
]
- #QaA[Welche Betriebssysteme sollen unterstützt werden? ][
  
]
- #QaA[Welche Betriebssysteme sollen bei den Tablets und Laptops Einsatz sein? ][
  
]
- #QaA[Welche charakteristischen Merkmale weisen die bauunternehmensspezifischen Daten auf und welche Daten sollen darunter verstanden werden? ][
  
]
- #QaA[Welche relevanten Informationen sollen über Arbeitsaufträge dargestellt werden? ][
  
]
- #QaA[Wie soll die Anbindung dieser PCs an die Software realisiert werden? ][
  
]
- #QaA[Auf welche Teile genau sollen Bauleiter zugreifen können? ][
  
]
- #QaA[[INTERN] Wie sollen diese Bauleiter auf das System zugreifen? ][
  
]
- #QaA[Sollen die Bauleiter über weitere Endgeräte auf das System zugreifen können? ][
  
]
- #QaA[Da die Bauleiter vor Ort per Tablet zugreifen sollen, wie soll der Datenaustausch technisch erfolgen, wenn die Bürorechner keine Netzverbindung nach außen haben dürfen? ][
  
]
- #QaA[[INTERN] Soll der Zugriff der Endgeräte über ein internes WLAN vor Ort oder über eine physische Synchronisation (Docking-Station) nach Rückkehr ins Büro erfolgen? ][
  
]

=== Zielgruppen, Benutzerrollen und Verantwortlichkeiten
Zur Zielgruppe zählen alle angestellten Mitarbeiter, die für die Erfassung und Verwaltung der Daten angestellt sind. 
Der Zugriff auf einzelne Daten soll je nach Berechtigung unterschiedlich erfolgen:
-	Alle Mitarbeiter in der Verwaltung sollen für sämtliche Daten Leserechte besitzen. Das bezieht sich auch auf den (selektiven) Export von Daten. Sie haben Vollzugriff auf die reinen Verwaltungsdaten.
-	Bau- und Projektleiter sollen Vollzugriff auf projektbezogene Daten haben.
-	Vorarbeiter sollen lesenden Zugriff auf ihre Arbeitsaufträge haben.
-	Ein Administrator hat Vollzugriff auf sämtliche Daten, vor allem für deren Import und Export sowie deren Backup.
Es sollen keine besonderen Computerkenntnisse zur Bedienung der Software erforderlich sein.

- #QaA[Welche Mitarbeiterpositionen soll es geben?][
  Projektleiter, Bauleiter, Baugruppenleiter, Vorarbeiter, gelernte Bauarbeiter, ungelernte Bauarbeiter und Verwaltungsmitarbeiter.
]
- #QaA[Soll es Mitarbeiter geben, die nur für die Verwaltung der Daten angestellt sind?][
  Ja, die Verwaltungsmitarbeiter im Büro sind primär für die Datenpflege zuständig. Es gibt keine dedizierten Datenbankadministratoren – diese Aufgabe übernimmt der Administrator.
]
- #QaA[Wie sollen die Berechtigungen umgesetzt werden? Soll es ein bestimmtes Rollensystem geben?][
  Ja, es soll ein festes Rollensystem mit vier vordefinierten Rollen geben: Verwaltungsmitarbeiter, Bau-/Projektleiter, Vorarbeiter und Administrator. Die Rollen sind fest vorgegeben und nicht konfigurierbar.
]
- #QaA[Wer soll genau zur „Verwaltung" zählen – nur Büromitarbeiter oder auch Bau- und Projektleiter im Büro? ][
  Zur Verwaltung zählen ausschließlich die Verwaltungsmitarbeiter im Büro. Bau- und Projektleiter haben eine eigene Rolle mit anderen Rechten.
]
- #QaA[Was sollen „reine Verwaltungsdaten" konkret sein – welche Daten fallen darunter, welche sind ausgeschlossen? ][
  Verwaltungsdaten umfassen: Mitarbeiterstammdaten, Gruppenzuordnungen, Anwesenheitszeiten und allgemeine Konfigurationsdaten. Ausgeschlossen sind projektbezogene Daten (Aufträge, Baumaschinen-Buchungen).
]
- #QaA[Sollen Verwaltungsmitarbeiter auf projektbezogene Daten nur Leserechte oder auch Schreibzugriff haben? ][
  Verwaltungsmitarbeiter haben auf projektbezogene Daten nur Leserechte. Schreibzugriff auf Projekte und Aufträge haben nur Bau-/Projektleiter und der Administrator.
]
- #QaA[Soll ein Bau-/Projektleiter Vollzugriff auf alle oder nur auf seine eigenen Projekte haben? ][
  Ein Bau-/Projektleiter hat Vollzugriff nur auf die Projekte und Aufträge, denen er zugeordnet ist. Auf andere Projekte hat er Lesezugriff.
]
- #QaA[Soll ein Vorarbeiter nur aktuelle Arbeitsaufträge einsehen oder auch vergangene und zukünftige Arbeitsauträge? ][
  Ein Vorarbeiter kann seine aktuellen und zukünftigen Arbeitsaufträge einsehen. Vergangene abgeschlossene Aufträge sind ebenfalls lesbar.
]
- #QaA[Soll eine Person mehrere Rollen gleichzeitig haben können, und sollen dann die kombinierten Rechte gelten? ][
  Nein, jeder Benutzer hat genau eine Rolle. Ein Projektleiter, der auch Verwaltungsaufgaben übernimmt, erhält die Rolle mit den höheren Rechten.
]
- #QaA[Wer soll die Benutzerkonten und Rollenzuweisungen verwalten? – ausschließlich der Administrator? ][
  Ja, ausschließlich der Administrator verwaltet Benutzerkonten und weist Rollen zu.
]
- #QaA[Soll der Administrator eine dedizierte IT-Person oder ein normaler Mitarbeiter mit Zusatzrechten sein? ][
  Der Administrator ist ein Verwaltungsmitarbeiter mit erweiterten Rechten. Eine dedizierte IT-Person ist nicht vorgesehen.
]
- #QaA[Sollen die Rollen fest vordefiniert sein oder soll der Administrator neue Rollen konfigurieren können? ][
  Die vier Rollen (Verwaltungsmitarbeiter, Bau-/Projektleiter, Vorarbeiter, Administrator) sind fest vordefiniert. Der Administrator kann keine neuen Rollen erstellen.
]
- #QaA[Welche charakteristischen Merkmale soll die Benutzeroberfläche erfüllen, um für Menschen ohne besondere Computerkenntnisse bedienbar zu sein? ][
  Klare Beschriftungen, große Schaltflächen, übersichtliche Eingabemasken, keine technischen Fachbegriffe in der Oberfläche. Maximal drei Klicks bis zur gewünschten Funktion.
]
- #QaA[Welche charakteristischen Daten sollen Projekte verwalten? ][
  Ein Projekt hat: Projektname, Projektleiter, Einsatzort, Start- und Endtermin, zugeordnete Aufträge, zugeordnete Baugruppen und eine Beschreibung.
]
- #QaA[Welche charakteristischen Daten sollen Arbeitsaufträge verwalten? ][
  Ein Arbeitsauftrag hat: Auftragsbezeichnung, zugehöriges Projekt, Baupläne (als Dateipfad), beteiligte Personen, gebuchte Baumaschinen, Einsatzort, Start-/End-/Zwischentermine, Kostenvoranschlag, Status (offen, in Bearbeitung, abgeschlossen).
]
- #QaA[Sollen Projekte zu Arbeitsaufträge zugeordnet werden? ][
  Ja, ein Projekt enthält einen oder mehrere Arbeitsaufträge. Die Zuordnung erfolgt 1:n (ein Projekt hat viele Aufträge).
]
- #QaA[Sollen mehrere Projekte zu einem Arbeitsauftrag gehören können? ][
  Nein, ein Arbeitsauftrag gehört immer zu genau einem Projekt.
]
- #QaA[Soll es Projekte ohne Aufträge geben können? ][
  Ja, ein neu angelegtes Projekt kann zunächst ohne Aufträge existieren. Aufträge werden dann später hinzugefügt.
]
- #QaA[Soll es Aufträge ohne Projekte geben können? ][
  Nein, jeder Auftrag muss einem Projekt zugeordnet sein.
]
- #QaA[Sollen Mitarbeiter eine Mitarbeiternummer haben? ][
  Ja, jeder Mitarbeiter erhält eine eindeutige Mitarbeiternummer, die automatisch vom System vergeben wird.
]
- #QaA[Wie soll die Anmeldung funktionieren (Zertifikat, Passwort)? ][
  Laut den Vereinfachungen ist kein Login-Vorgang erforderlich. Die Anmeldung entfällt für den Programmentwurf.
]
- #QaA[Soll es eine 2FA geben? ][
  Nein, da kein Login-Vorgang erforderlich ist (siehe Vereinfachungen), entfällt auch eine 2FA.
]

=== Zusammenspiel mit anderen Systemen
Es soll zunächst für unsere Bürorechner lauffähig gemacht werden. Parallel dazu soll die alte Software so lange weiterlaufen. Das zu entwickelnde Softwaresystem soll für unsere Büro-rechner aus Sicherheitsgründen ohne Netzverbindung nach Außen lauffähig sein. Mehrere Drucker sollen für die Erstellung der Rechnungen angeschlossen sein.
In einem weiterführenden Entwicklungsauftrag sollen ausgewählte Daten über einen Laptop oder ein Tablet direkt vor Ort verwaltet werden können. Das erhöht die Flexibilität unserer Bau- und Projektleiter vor Ort und senkt die Wartezeit bei Anfragen, Wünschen und kleineren Änderungen. Dieses „Tablet-Projekt“ selbst ist nicht direkter Bestandteil des ersten Entwicklungsauftrags, es sollen jedoch konkrete Vorschläge zur Realisierung (GUI, Schnittstellen, grobe Architektur) gemacht werden.
Die finanztechnischen Daten über die Mitarbeiter und Projekte (Gehälter bzw. Löhne, Projektkosten, Anschaffungen, Reparaturen, Reinigung usw.) werden separat durch ein vorhandenes Finanzbuchhaltungsprogramm verwaltet und müssen hier nicht berücksichtigt werden.
Die finanztechnischen Daten über Projekte (Rechnungen bzw. Mahnungen und Kostenvor-anschläge) müssen vom Finanzbuchhaltungssystem gelesen werden können, um sie im neuen System darstellen zu können. Die Erstellung und Änderung dieser Finanzdaten erfolgt ausschließlich im Finanzbuchhaltungssystem.
Vorhandene Daten aus dem Altsystem sollen in das neue System übernommen werden.

- #QaA[Wie lange soll die alte Software parallel betrieben werden – bis zur vollständigen Datenmigration oder darüber hinaus?][
 
]
- #QaA[Welche charakteristischen Daten sollen aus dem Altsystem übernommen werden, und in welchem Format liegen diese vor?][
  
]
- #QaA[Soll die Anforderung „keine externe Netzverbindung" für alle Arbeitsplätze, oder nur für bestimmte gelten?][
  
]
- #QaA[Wie sollen Mitarbeiter von der Baustelle aus auf das System zugreifen können?][
  
]
- #QaA[Soll es weitere finanzbezogene Daten geben, die beachter werden sollen?][
  
]
- #QaA[[INTERN] Über welche Schnittstelle soll das neue System die Finanzdaten (Rechnungen, Mahnungen, Kostenvoranschläge) aus dem Finanzbuchhaltungssystem einlesen?][
  
]
- #QaA[[INTERN] In welchem Format liefert das Finanzbuchhaltungssystem die Daten – z. B. CSV, XML oder eine direkte Datenbankanbindung?][
  
]
- #QaA[Wie häufig sollen die Finanzdaten aus dem Buchhaltungssystem synchronisiert werden – in Echtzeit, täglich oder manuell?][
  
]
- #QaA[An wie viele Drucker soll das System angebunden werden, und sollen bestimmte Drucker für bestimmte Dokumente vorgesehen sein?][
  
]
- #QaA[[INTERN] Wie sollen die Drucker mit den Geräten verbunden werden (WLAN)?][
  
]
- #QaA[Welche konkreten Anforderungen bestehen für das „Tablet-Projekt" – welche Daten und Funktionen sollen mobil verfügbar sein?][
  
]
- #QaA[Soll die mobile Lösung auch offline funktionieren?][
  
]
- #QaA[[INTERN] Wie sollen Datenkonflikte bei der Synchronisation behandelt werden?][
  
]
- #QaA[Welche Verfügbarkeit des Systems soll bereitgestellt werden. Gibt es Zeiten, in denen das System nicht verwendet wird?][
  
]

=== Produktfunktionen

== Produktfunktionen
#tableGrid(arguments(
  [LF 10], [Der jeweilige Benutzer muss die Möglichkeit haben, über eine grafische Benutzeroberfläche alle für ihn relevanten Daten einfach und übersichtlich zu verwalten. Es sollen zahlreiche Konfigurationsdaten lesbar gespeichert und beim nächsten Start des Programms verwendet werden (z.B. aktuelle Größe und Position des Fensters). Daneben sollen einige Elemente vor dem Start konfigurierbar sein (z.B. Überschriften, Schriftarten und -größen usw.)
  - #QaA[Welche charakteristischen Daten sollen verwaltet werden? ][

  ]
  - #QaA[Was soll eine übersichtliche Verwaltung bedeuten? Welche Kriterien soll die Benutzeroberfläche erfüllen?][

  ]
  - #QaA[Was gehört zu den Konfigurationsdaten? Welche Daten sollen konfiguriert werden können? ][
    
  ]
  - #QaA[Welche Elemente sollen vor dem Start konfigurierbar sein? Sollen sie nur einmal eingestellt werden können?  ][
    
  ]
  - #QaA[[INTERN] In welcher Form, soll die Konfiguration erfolgen (GUI, CLI)? ][
    
  ]
  - #QaA[[INTERN] In welchem Format sollen die Konfigurationsdaten gespeichert werden? ][
    
  ]
  ],
  [LF 20], [Als Mitarbeiter unterscheiden wir Projektleiter, Bauleiter, Baugruppenleiter, Vorarbeiter, gelernte und ungelernte Bauarbeiter sowie Verwaltungsmitarbeiter. Daneben gibt es mehrere Gruppen (Verwaltung, Planung (z.B. Bauingenieure und Architekten), Projektleitung (v.a. Bauingenieure), Bauleitung, Baugruppen (enthalten Arbeitsgruppen)). Eine Gruppe kann dabei mehrere Mitarbeiter beinhalten, ein Mitarbeiter kann mehreren Gruppen angehören.
  - #QaA[[INTERN] Wie stehen die Gruppen in der technischen Umsetzung in Relation mit den Mitarbeitern? ][

  ]
  - #QaA[Welche Kriterien müssen die einzelnen Gruppen bei der Auswahl der Mitarbeiter beachten (mind. Ein bestimmter Mitarbeiter, max. x verschiedene Mitarbeiter)? ][
    
  ]
  - #QaA[Gehören die Gruppen und/ oder Mitarbeiter zu den relevanten Daten aus LF10, die angezeigt werden sollen? ][
    
  ]
  - #QaA[Sollen Arbeitsgruppen innerhalb einer Baugruppe denselben Mitarbeiter mehrfach einsetzten können? ][
    
  ]
  - #QaA[Sollen die Gruppen einmalig festgelegt werden oder sollen sie manuell erstellt werden können? ][
    
  ]
  ],
  [LF 30], [Zu den zentralen Daten eines Auftrags gehören: Projekt- und Baupläne, alle erstellten Angebote, Rechnungen und Mahnungen, Kostenvoranschläge, alle am Auftrag beteiligte Personen, Großgeräte, Einsatzort, Start-, End- und Zwischentermine usw.
  - #QaA[Über welche charakteristischen Merkmale sollen die zentralen Daten verfügen? ][

  ]
  - #QaA[Sollen alle Daten auf einer einzelnen GUI sichtbar sein oder sollen sie weiter unterteilt werden? ][
    
  ]
  - #QaA[[INTERN] In welcher Form sollen die Daten vorliegen (einzelne Dateien, Daten in der Datenbank)? ][
    
  ]
  - #QaA[Sollen die beteiligten Personen aufgelistet werden oder sollen im Zuge der Übersichtlichkeit Gruppen aufgezeigt werden, die Auskunft über die Mitarbeiter geben? ][
    
  ]
  ],
  [LF 40], [Ein Auftrag kann von mehreren Unterauftragnehmern ausgeführt werden, d.h. Aufträge können Unteraufträge enthalten. Zur Abwicklung eines Auftrags ist ein Terminplaner erforderlich, der sämtliche Daten eines Auftrags bzw. Projekts beinhaltet.],
  [LF 50], [Es müssen die Baumaschinen (Bagger, LKWs, Kräne, Rüttler, Großbohrmaschinen, uvm.) sowie größere Bauwerkzeuge (Schalungsteile, Bausicherungen, Zäune, etc.) verwaltet werden. Die Baumaschinen und -werkzeuge haben unterschiedliche Ausrüstungen, nach denen sie bei der Suche unterschieden werden (z.B. Baggerschaufel, Kranzubehör (Behälter, Gewichte, Haken, usw.). Damit Baumaschinen und Geräte planbar zur Verfügung stehen, müssen sie über das System gebucht werden. Die Buchung kann direkt beim Anlegen eines Auftrags geschehen oder auch später bei Bedarf. Alle Baumaschinen und -werkzeuge sind einzelnen Lagern zugeordnet (Plätze und/oder Gebäude auf mehreren Grundstücken). Der momentane Standort muss zur Optimierung der Projektabläufe aktualisiert werden können. Daneben müssen Benutzungszeiträume angegeben werden können, um die Verfügbarkeit eines Geräts zu erhalten. Hier soll z.B. eine Baumaschine nach Ort und Verfügbarkeit gesucht werden können („welche Maschine steht wann zur Verfügung und ist am nächsten zum Einsatzort?“)],
  [LF 60], [Nach allen wesentlichen Daten sollen mittels einer oder mehrerer Suchmaske im Datenbestand gesucht werden können.],
  [LF 70], [Die Auswahl der Daten soll möglichst über (eventuell durchsuchbare) Auswahllisten erfolgen. Dies gilt vor allem für Zuordnungen von Daten zu anderen Daten (z.B. Bau- fahrzeuge und Personen zu Projekten und Arbeitsaufträgen usw.). Die Auswahllisten sollen auf einfache Weise erweiterbar und für sämtliche Mitarbeiter im System verfügbar sein.
],
  [LF 80], [Allen Elementen sollen beliebig viele Bilder mit Titel zugeordnet werden können, die zentral auf einem Verzeichnis liegen sollen],
  [LF 90], [Viele unserer Angestellten sind teilzeitbeschäftigt. Für alle Angestellten sollen deshalb die Anwesenheitszeiten erfasst werden.],
  [LF 100], [Vor dem Hinzufügen von neuen Daten soll eine Überprüfung stattfinden, ob diese eventuell schon vorhanden sind.],
))
 
== Produktdaten
#tableGrid(arguments(
  [LD 10], [Die Daten sollen zunächst in einer zentralen Datenbasis (lesbare Dateien) abgespeichert und später in eine Datenbank überführt werden.],
))
 
 
== Produktleistungen
#tableGrid(arguments(
  [LL 10], [Die Anzahl der zu verwaltenden Elemente wird auf ca. 100.000 geschätzt.],
  [LL 20], [Die Daten müssen aus rechtlichen Gründen 10 Jahre online verfügbar sein.],
  [LL 30], [Um bei HW- und SW-Anschaffungen und -neuerungen flexibel zu bleiben, ist auf Platt-formunabhängigkeit besonders zu achten.],
))
 
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
