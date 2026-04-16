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

- #QaA[Wie viele Mitarbeiter sind im Büro und vor Ort?][
  Ca. 30 Mitarbeiter arbeiten im Büro (Verwaltung, Planung, Projektleitung), ca. 170 Mitarbeiter sind auf den Baustellen tätig.
]
- #QaA[Wie viele Mitarbeiter sollen gleichzeitig durchschnittlich auf das System zugreifen können? ][
  Im Durchschnitt sollen 10 bis 15 Mitarbeiter gleichzeitig auf das System zugreifen. In Spitzenzeiten bis zu 20.
]


=== Anwendungsbereiche
Die Software wird ausschließlich für die Verwaltung unserer bauunternehmensspezifischen Daten eingesetzt. Es sollen mehrere PCs in den Büros installiert werden und mehrere PCs in Planungsräumen, in denen die Vorarbeiter alle relevanten Informationen über ihre Arbeitsaufträge lesen können. Sämtliche PCs befinden sich in unserem Bürogebäude, Bauleiter sollen vor Ort per Tablet oder Laptop auf Teile des Systems zugreifen können.
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
#question[
- Wie genau erfolgt die Anbindung an das Finanzbuchhaltungssystem? (Dateiimport, API, Datenbankzugriff?)
  - Die Anbindung erfolgt über einen Dateiimport. Das Finanzbuchhaltungssystem exportiert Rechnungen, Mahnungen und Kostenvoranschläge als CSV-Dateien, die vom neuen System eingelesen werden.
- In welchem Format liegen die Daten vor (CSV, XML, JSON)?
  - Die Finanzdaten liegen im CSV-Format (Semikolon-separiert) vor.
- Wie oft müssen Daten synchronisiert werden?
  - Die Synchronisation erfolgt manuell bei Bedarf, z.B. einmal täglich durch einen Verwaltungsmitarbeiter oder den Administrator.
- Wie sieht die Struktur der Altdaten aus?
  - Die Altdaten liegen in einer lokalen relationalen Datenbank (einzelne Tabellen für Aufträge, Mitarbeiter, Maschinen) sowie in separaten Excel-Dateien vor. Ein einheitliches Schema gibt es nicht.
- Gibt es Dokumentation zum Altsystem?
  - Es gibt keine vollständige Dokumentation. Die Tabellenstrukturen der Datenbank und die Spaltenbezeichnungen der Excel-Dateien sind aber bekannt.
- Müssen Daten validiert oder bereinigt werden beim Import?
  - Ja, beim Import sollen die Daten auf Vollständigkeit und Duplikate geprüft werden (siehe auch LF100). Fehlerhafte Datensätze sollen markiert und dem Administrator zur Prüfung angezeigt werden.
]

=== Produktfunktionen
- LF 10: Der jeweilige Benutzer muss die Möglichkeit haben, über eine grafische Benutzeroberfläche alle für ihn relevanten Daten einfach und übersichtlich zu verwalten. Es sollen zahlreiche Konfigurationsdaten lesbar gespeichert und beim nächsten Start des Programms verwendet werden (z.B. aktuelle Größe und Position des Fensters). Daneben sollen einige Elemente vor dem Start konfigurierbar sein (z.B. Überschriften, Schriftarten und -größen usw.)
#question[
- Sollen die einzelnen User unterschiedliche Konfigurationen haben oder soll es eine globale Konfiguration geben?
  - Jeder Benutzer soll eine eigene benutzerspezifische Konfiguration haben (z.B. Fenstergröße, Position). Daneben gibt es eine globale Konfiguration für Überschriften und Schriftarten.
- Welche Daten sollen lesbar gespeichert werden (z.B. JSON, XML, CSV, ...)?
  - Die Konfigurationsdaten sollen im CSV-Format gespeichert werden, da das gesamte System zunächst auf lesbaren Dateien basiert (siehe LD10).
- Sollen Konfigurationen exportierbar sein?
  - Nein, Konfigurationen sind rein lokal und müssen nicht exportiert werden.
- Sollen Konfigurationen lokal oder zentral gespeichert werden (z.B. in der Cloud)?
  - Benutzerspezifische Konfigurationen werden lokal auf dem jeweiligen Arbeitsplatz gespeichert. Die globale Konfiguration liegt auf der zentralen Datenbasis.
- Gibt es Einschränkungen bezüglich Farbenblindheit, Sehschwäche, ...?
  - Derzeit keine. Es soll aber auf ausreichenden Kontrast und lesbare Schriftgrößen geachtet werden.
]

- LF 20: Als Mitarbeiter unterscheiden wir Projektleiter, Bauleiter, Baugruppenleiter, Vorarbeiter, gelernte und ungelernte Bauarbeiter sowie Verwaltungsmitarbeiter. Daneben gibt es mehrere Gruppen (Verwaltung, Planung (z.B. Bauingenieure und Architekten), Projektleitung (v.a. Bauingenieure), Bauleitung, Baugruppen (enthalten Arbeitsgruppen)). Eine Gruppe kann dabei mehrere Mitarbeiter beinhalten, ein Mitarbeiter kann mehreren Gruppen angehören.
#question[
  - Wer kann Mitarbeiter und Gruppen anlegen, bearbeiten und löschen?
    - Mitarbeiter anlegen und löschen: nur der Administrator. Mitarbeiter bearbeiten (z.B. Gruppenzuordnung): Administrator und Verwaltungsmitarbeiter. Gruppen anlegen und löschen: nur der Administrator. Mitarbeiter zu Gruppen zuordnen: Administrator und Verwaltungsmitarbeiter.
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

=== Produktdaten
- LD 10: Die Daten sollen zunächst in einer zentralen Datenbasis (lesbare Dateien) abgespeichert und später in eine Datenbank überführt werden.


=== Produktleistungen
- LL10 Die Anzahl der zu verwaltenden Elemente wird auf ca. 100.000 geschätzt. 
- LL20 Die Daten müssen aus rechtlichen Gründen 10 Jahre online verfügbar sein.
- LL30 Um bei HW- und SW-Anschaffungen und -neuerungen flexibel zu bleiben, ist auf Platt-formunabhängigkeit besonders zu achten.

=== Qualitätsanforderung
#table(columns: 5,
  [Produktqualität], [sehr gut], [gut], [normal], [nicht relevant],
  [Funktionalität], [], [X], [], [],
  [Zuverlässigkeit], [], [X], [], [],
  [Effizienz], [], [X], [], [],
  [Benutzbarkeit (auch Gestaltung)], [X], [], [], [],
  [Wartbarkeit], [], [], [X], [],
  [Übertragbarkeit (Portabilität)], [], [X], [], [],
)

- #QaA[Wie soll die als „sehr gut" bewertete Benutzbarkeit konkret umgesetzt werden – soll die grafische Oberfläche nach bestimmten Usability-Richtlinien (z.B. DIN EN ISO 9241) gestaltet werden?][

]
- #QaA[Wie soll die Gestaltung der Benutzeroberfläche aussehen – soll ein einheitliches Farbschema, ein firmeneigenes Corporate Design oder ein modernes, minimalistisches Design verwendet werden?][

]
- #QaA[Soll die hohe Benutzbarkeit durch integrierte Hilfefunktionen, Tooltips oder eine kontextsensitive Benutzerdokumentation unterstützt werden?][

]
- #QaA[Wie soll die als „gut" bewertete Funktionalität sichergestellt werden – soll die korrekte Funktion durch automatisierte Tests, manuelle Abnahmetests oder beides verifiziert werden?][

]
- #QaA[Wie soll die als „gut" bewertete Zuverlässigkeit gewährleistet werden – wie soll das System bei unerwarteten Fehlern (z.B. Datenbankausfall, Netzwerkunterbrechung) reagieren?][

]
- #QaA[Soll das zuverlässige System eine automatische Datensicherung (Backup) in regelmäßigen Intervallen durchführen und wenn ja, in welchem zeitlichen Abstand?][

]
- #QaA[Wie soll die als „gut" eingestufte Effizienz konkret gemessen werden – gibt es maximale Antwortzeiten für typische Verwaltungsoperationen wie die Suche nach Aufträgen oder Baumaschinen (z.B. unter 2 Sekunden)?][

]
- #QaA[Wie soll die als „gut" bewertete Übertragbarkeit (Portabilität) sichergestellt werden – soll die fertige Software ohne größere Anpassungen auf unterschiedlichen Betriebssystemen (Windows, Linux, macOS) lauffähig sein?][

]
- #QaA[Soll die portierbare Software auch auf verschiedenen Bildschirmauflösungen und Displaygrößen (Desktop-Monitor, Laptop, Tablet) ohne Einbußen bei der Benutzbarkeit funktionieren?][

]
- #QaA[Wie soll die als „normal" bewertete Wartbarkeit umgesetzt werden – soll die Software modular aufgebaut sein, sodass einzelne Komponenten (z.B. GUI, Datenbankzugriff, Geschäftslogik) unabhängig voneinander gewartet und aktualisiert werden können?][

]
- #QaA[Soll die wartbare Software so dokumentiert werden, dass ein neues Entwicklerteam ohne aufwendige Einarbeitung Fehler beheben und Erweiterungen vornehmen kann?][

]
- #QaA[Wer soll die langfristige Wartung der fertigen Software übernehmen – das interne IT-Personal des Bauunternehmens oder ein externer Dienstleister?][

]
- #QaA[Steht die „normale" Wartbarkeit im Widerspruch zur gewünschten 10-jährigen Datenverfügbarkeit – wie soll sichergestellt werden, dass Software-Updates über diesen langen Zeitraum die bestehende Funktionalität nicht beeinträchtigen?][

]
- #QaA[Gibt es bestimmte Qualitätsmerkmale, die in der obigen Tabelle nicht aufgeführt sind, aber für das Bauunternehmen trotzdem wichtig wären (z.B. Sicherheit, Skalierbarkeit, Datenschutzkonformität)?][

]
- #QaA[Wie soll die qualitativ hochwertige Benutzbarkeit für die verschiedenen Benutzerrollen (Verwaltungsmitarbeiter, Bauleiter, Vorarbeiter, Administrator) differenziert werden – sollen rollenspezifische, angepasste Oberflächen bereitgestellt werden?][

]