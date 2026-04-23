#let qa-counter = counter("qa-counter")

#show figure.where(kind: "qa"): it => align(left, it.body)

#let QaA(question, answer, labelName: "") = {
  qa-counter.step()
  context {
    let n = qa-counter.get().first()
    let lblName = ""
    if(labelName == ""){
      lblName = "q_" + str(n)
    }else{
      lblName = "q_" + labelName
    }
    let lbl = label(lblName)
    [#figure(
      block(
        inset: (left: 1em),
        [
          #text(fill: orange, weight: "bold")[F#str(n). #question] \
          #text(fill: green)[ #answer]
        ]
      ),
      kind: "qa",
      supplement: "Frage",
      caption: none,
    )#lbl]
  }
}

 
#let tableGrid(cells) = {
  table(..cells, columns: 2, stroke: none,
    inset: (right: 0.5em),
  )
}

//question for the tutor
#let ask(body) = text(fill: red, highlight(fill: yellow)[TODO: Herrn Lutz Fragen: #body])

//reference goal
#let referenceG(labelName) = {
 [(siehe #link(label(labelName), labelName))]
}

//reference question
#let referenceQ(labelName) = {
 [(siehe #ref(label(labelName)))]
}

#let textFigure(short, body) = {
  context {
    let count = counter(figure.where(kind: short)).get().at(0) + 1
    let label_name = short + " " +  str(count) + "0"
    
    [#figure(kind: short, supplement: short, body) #label(label_name)]
  }
}

#show ref: it => {
  let el = it.element
  if el != none and el.func() == heading {
    let num = numbering(el.numbering, ..counter(heading).at(el.location()))
    [(siehe #link(el.location(), [#num #el.body]))]
  } else {
    it
  }
}


= Analyse des Lastenhefts

== Einleitung <chapter-Einleitung>
#include "chapter/original/1.0_Einleitung.typ"

#QaA[Wie viele Mitarbeiter sind konkret in der Verwaltung tätig und wie viele arbeiten auf den Baustellen?][
  Von den ca. 200 Mitarbeitern arbeiten etwa 30 in der Verwaltung (Büro) und etwa 170 auf den Baustellen.
]
#QaA[Welche überregionalen Gebiete deckt das Bauunternehmen ab und gibt es geplante Expansionen in weitere Regionen?][
  Das Kerngebiet ist die Rhein-Neckar-Region sowie angrenzende Gebiete in Baden-Württemberg und Rheinland-Pfalz. Eine Expansion ist derzeit nicht geplant.
]
#QaA[Welche konkreten Fachbereiche umfasst das breite Angebotsspektrum im Hoch- und Tiefbau neben den genannten Bauwerkstypen?][
  Hochbau: Wohngebäude, Bürogebäude, Hallenbauten \
  Tiefbau: Brücken, Unterführungen, Kanalbau \
  Zusätzlich: Sanierung und Modernisierung bestehender Bauwerke.
]
#QaA[Wie soll die neue Verwaltungssoftware die bisherigen Verwaltungsarbeiten konkret vereinfachen - welche manuellen Arbeitsschritte sollen automatisiert werden?][
  Bisher werden Aufträge, Baumaschinen und Personalzuordnungen teilweise in Excel-Listen. Die neue Software soll das Anlegen und Suchen von Aufträgen, die Buchung von Baumaschinen und die Zuordnung von Mitarbeitern zu Projekten zentral und digital ermöglichen.
]
#QaA[Welches vorhandene Softwarewerkzeug wird aktuell für die Verwaltung eingesetzt?][
  Aktuell wird eine Kombination aus einer älteren Desktop-Anwendung und diversen Excel-Tabellen verwendet. Die Daten liegen in einer lokalen Datenbank.
]
#QaA[Was waren die positiven Aspekte der alten Verwaltungssoftware, die in das neue System übernommen werden sollen?][
  Die übersichtliche Darstellung der Auftragsdaten und die einfache Suche nach Mitarbeitern wurden als positiv bewertet. Diese Übersichtlichkeit soll beibehalten werden.
]
#QaA[Welche negativen Erfahrungen haben die Mitarbeiter mit der bisherigen veralteten Software gemacht, die im neuen System vermieden werden sollen?][
  Die alte Software war langsam, konnte nur von einem Arbeitsplatz bedient werden und bot keine Möglichkeit, Daten mobil abzurufen. Außerdem fehlte eine zentrale Datenhaltung, sodass Daten teilweise doppelt gepflegt wurden.
]
#QaA[Wie kamen technisch weniger versierte Mitarbeiter mit der bisherigen Software zurecht und welche Bedienungsprobleme traten dabei regelmäßig auf?][
  Vorarbeiter und Bauleiter hatten Schwierigkeiten mit der unübersichtlichen Menüstruktur. Häufig wurden falsche Eingabefelder befüllt. Die neue Software soll deshalb klare, einfache Eingabemasken bieten.
]
#QaA[Was genau wird unter einer "intuitiven, leicht bedienbaren Benutzeroberfläche" verstanden - soll die neue Oberfläche nach einem bestimmten Gestaltungsprinzip aufgebaut sein (z.B. möglichst wenige Klicks, alle wesentlichen Informationen auf einen Blick)?][
  Die wichtigsten Informationen (Aufträge, Baumaschinen, Mitarbeiter) sollen von einer zentralen Übersichtsseite aus erreichbar sein. Maximal drei Klicks bis zur gewünschten Information. Keine Kommandozeile oder technische Fehlermeldungen.
]
#QaA(labelName: "plattformunabhängige Lösung")[Wie stellt man sich die plattformunabhängige Lösung konkret vor - soll es eine native Desktop-Anwendung mit Java, eine Web-Applikation oder eine hybride Lösung sein?][
  Es soll eine Java-Desktop-Anwendung sein, die plattformunabhängig auf Windows, Linux und macOS läuft #referenceQ("q_Leistung-PC"). Für das spätere Tablet-Projekt wird eine separate Web- oder App-Lösung in Betracht gezogen.
]
#QaA[Wie viele Desktoprechnern im Büro sollen gleichzeitig auf die zentrale Datenbasis zugreifen können?][
  Bis zu 15 Desktop-Rechner sollen gleichzeitig auf die zentrale Datenbasis zugreifen können.
]
#QaA[Welche ausgewählten Teile der Daten und Arbeitsabläufe sollen auf den mobilen Endgeräten (Laptops, Tablets) vor Ort verfügbar sein?][
  Auf mobilen Endgeräten sollen Auftragsdaten (Einsatzort, Termine, beteiligte Personen), Baumaschinenstandorte und Arbeitsaufträge lesend verfügbar sein.
]
#QaA[Sollen die mobilen Endgeräte auch ohne bestehende Netzverbindung (offline) auf zwischengespeicherte Daten zugreifen können und wie sollen Datenänderungen bei der anschließenden Synchronisation behandelt werden?][
  Ja, eine Offline-Fähigkeit ist wünschenswert. Änderungen sollen beim nächsten Verbindungsaufbau synchronisiert werden.
]
#QaA[Welche beteiligte Personen und Verantwortliche sollen neben Bau- und Projektleitern im neuen System verwaltet werden (z.B. externe Auftragnehmer, Architekten, Behördenkontakte)?][
  Neben den eigenen Mitarbeitern sollen auch externe Unterauftragnehmer als Kontaktdaten verwaltet werden. Architekten und Behörden werden nicht im System gepflegt. #referenceG("LF 20")
]
#QaA[Gibt es konkrete zeitliche Erwartungen oder einen gewünschten Projektfahrplan für die Einführung der neuen Verwaltungssoftware?][
  Die Analyse und der Entwurf sollen innerhalb des aktuellen Semesters abgeschlossen werden. Ein konkreter Produktionstermin ist nicht festgelegt.
]
#QaA[Wie hoch ist das Budget für die neue Verwaltungssoftware und gibt es finanzielle Einschränkungen bei der Wahl der eingesetzten Technologien oder Lizenzen?][
  Es sollen ausschließlich kostenfreie und quelloffene Technologien verwendet werden. Es stehen keine zusätzlichen Lizenzbudgets zur Verfügung.

  #ask[Budget nötig?]
]
#QaA[Gibt es gesetzliche oder branchenspezifische Vorschriften (z.B. Datenschutz, Baurecht, Aufbewahrungsfristen), die bei der neuen Verwaltungssoftware zwingend berücksichtigt werden müssen?][
  Ja, alle Auftragsdaten müssen gemäß gesetzlicher Aufbewahrungsfristen mindestens 10 Jahre verfügbar bleiben. Personenbezogene Mitarbeiterdaten unterliegen den Datenschutzbestimmungen (DSGVO).
]

== Lastenheft
=== Zielsetzung
#include "chapter/original/2.1_Zielsetzung.typ"

#QaA[Auf welchen Geräten soll die Software laufen können?][
  Primär auf Desktop-PCs im Büro #referenceQ("q_Leistung-PC"). Später auch auf Laptops und Tablets (Tablet-Projekt, nicht Teil des ersten Auftrags) #referenceQ("q_plattformunabhängige Lösung").
]
#QaA[Gibt es bereits einen internen Server?][
  Ja, es gibt bereits einen internen Server, der verwendet werden soll.
]
#QaA[Wie viele Personen sollen die Software gleichzeitig nutzen?][
  Bis zu 15 Personen gleichzeitig im Normalbetrieb. Bei Zugriffen von außen maximal 20 in Spitzenzeiten.
]
#QaA[Von wo aus soll auf die Software zugegriffen werden können?][
  Primär von den Büroarbeitsplätzen im Bürogebäude. Später soll ein Zugriff von Baustellen per Tablet möglich sein @chapter-Einleitung.
]
#QaA[Wo soll die zentrale Datenhaltung sein?][
  Auf einem bereits vorhandenen internen Server im Bürogebäude. Alle Büro-PCs greifen über das interne Netzwerk darauf zu.
]
#QaA[[INTERN] Wie kann man sich das Mehrbenutzersystem genau vorstellen?][
  Mehrere Benutzer greifen gleichzeitig über das interne Netzwerk auf dieselbe zentrale Datenbasis zu. Jeder Benutzer hat eine eigene Rolle mit entsprechenden Rechten. Ein Locking-Mechanismus ist laut Vereinfachung nicht erforderlich.
]
#QaA[[INTERN] Wie soll dieser Zugriff aussehen?][
  Alle PCs im Büro und in den Planungsräumen sind über das interne LAN mit dem zentralen Server verbunden. Die Java-Anwendung läuft lokal auf jedem PC und greift über Netzwerk auf die zentrale Datenbasis zu. Planungsräume haben PCs speziell für Vorarbeiter zum Lesen ihrer Arbeitsaufträge.

  Beim Tablet-System: Zugriff über die Tablet-App mittels einer VPN und einer REST-API zum Server. Die App synchronisiert Daten vor Ort und ermöglicht auch Offline-Arbeit.
]
#QaA[Wie oft soll auf das System von außerhalb zugegriffen werden?][
  Es wird eine Anzahl von maximal 5 zeitglichen Zugriffen erwartet. Zudem ist ein Offline-Betrieb mit Synchronisation bei Rückkehr ins Büro vorgesehen, sodass auch ohne aktive Verbindung gearbeitet werden kann und sich die Anzahl an Zugriffen entsprechend anpasst.
]
#QaA[[INTERN] Soll eine bestimmte Sicherheit beim Zugriff von außen existieren?][
  Das System hat keine direkte externe Internetverbindung (kein Zugriff über öffentliche Netzwerke). Der Server läuft im internen Firmennetz. Für das spätere Tablet-Projekt: Bauleiter können per VPN auf das interne Firmennetz zugreifen (z.B. über gesichertes VPN vom Laptop/Tablet). Die Daten werden dabei vor der Fahrt zur Baustelle synchronisiert (Offline-First-Ansatz), sodass auch ohne aktive Verbindung gearbeitet werden kann. Bei erneuter VPN-Verbindung (z.B. nach Rückkehr oder bei verfügbarem WLAN) werden Änderungen automatisch synchronisiert. Eine ungeschützte Internet-Exposition des Servers ist nicht vorgesehen.
]
#QaA[Auf welche Teile des Systems soll zugegriffen werden dürfen (Siehe Rollen)?][
  Der Zugriff richtet sich nach den Benutzerrollen:
  - Verwaltung hat Leserechte auf alles und Vollzugriff auf Verwaltungsdaten
  - Bau-/Projektleiter haben Vollzugriff auf projektbezogene Daten
  - Vorarbeiter haben Lesezugriff auf ihre Arbeitsaufträge
  - Administrator hat Vollzugriff auf alles.
  @chapter-Zielgruppe-Rollen
]
#QaA[Sollen alle Daten vom Tablet aus auf der Baustelle verfügbar sein?][
  Nein, nur ausgewählte Daten: 
  - Auftragsinformationen
  - Einsatzort
  - beteiligte Personen 
  - Baumaschinenstandorte

  Lesender Zugriff auf: Auftragsdaten (Termine, Einsatzort, beteiligte Personen), Baumaschinenstandorte, Baupläne. \
  Schreibzugriff auf projektbezogene Daten ihrer eigenen Projekte.
]
#QaA[Welche Formate der Daten sollen im Import bevorzugt werden?][
  CSV-Dateien (Semikolon-separiert, UTF-8-kodiert) als primäres Importformat. Diese sind lesbar und einfach zu verarbeiten.

  TODO: Formatierung anpassen

  Intern: Beispiel-Format für Mitarbeiter-Import:
  ```csv
  Mitarbeiternummer;Vorname;Nachname;Geburtsdatum;Email;Position;Rolle
  1001;Max;Mustermann;1985-03-15;max.mustermann@bauunternehmen.de;Bauleiter;Bau-/Projektleiter
  1002;Anna;Schmidt;1990-07-22;anna.schmidt@bauunternehmen.de;Verwaltungsmitarbeiter;Verwaltungsmitarbeiter
  ```
]
#QaA[Welche Formate der Daten sollen im Export bevorzugt werden?][
  Der Export soll ebenfalls im CSV-Format erfolgen, um Kompatibilität mit anderen Systemen zu gewährleisten.
]
#QaA[Welche Daten sollen genau Importiert bzw. Exportiert werden?][
  Import: Alle relevanten Daten aus dem Altsystem werden übertragen, soweit sie in einem importierbaren Format vorliegen. Dazu gehören: Auftragsdaten, Mitarbeiterdaten, Baumaschinen- und Werkzeugdaten, Gruppenzuordnungen. Export: Selektiver Export einzelner Datensätze (z.B. Aufträge, Mitarbeiterlisten) im CSV-Format für Berichte oder Backups.
]
#QaA[Gibt es Daten, die nicht aus dem alten System übertragen werden sollen?][
  Finanztechnische Daten (Gehälter, Löhne, Projektkosten) werden nicht übertragen, da sie im separaten Finanzbuchhaltungssystem verwaltet werden.
]
#QaA[[INTERN] Sollen die Exportdaten verschlüsselt werden?][
  Nein, eine Verschlüsselung der Exportdaten ist nicht erforderlich. Die Dateien werden nur intern verwendet.
]

=== Anwendungsbereiche
#include "chapter/original/2.2_Anwendungsbereiche.typ" 

#QaA(labelName: "Leistung-PC")[[INTERN] Welche Leistung haben die PCs (Welche technische Anforderungen)?][
  Folgende Mindestanforderungen gelten für die Büro-PCs:
  - Arbeitsspeicher (RAM): 8 GB
  - Prozessor: Dual-Core-Prozessor (oder besser), mindestens 2 GHz
  - Festplattenspeicher: 100 GB freier Speicherplatz
  - Betriebssystem: Windows 10/11, Linux (Ubuntu 20.04+), macOS 11+
  - Software: Java Runtime Environment (JRE) Version 11 oder höher
  - Netzwerk: LAN-Anbindung (mindestens 100 Mbit/s)
]
#QaA[Welche Betriebssysteme sollen bei den Tablets und Laptops Einsatz sein? ][
  Das ist Teil des späteren Tablet-Projekts. Voraussichtlich iOS (iPad) und Android. Die konkrete Entscheidung erfolgt im zweiten Entwicklungsauftrag.
]
#QaA[Welche charakteristischen Merkmale weisen die bauunternehmensspezifischen Daten auf und welche Daten sollen darunter verstanden werden? ][
  Mitarbeiter- und Gruppendaten, Aufträge und Projekte, Baumaschinen und Werkzeuge mit Standorten, Buchungen, Termine, Anwesenheitszeiten, Baupläne (als Dateipfade) und Bilder.

  TODO: Verweis auf Tabellen wenn es passende gibt, sonst erstellen
]
#QaA[Welche relevanten Informationen sollen über Arbeitsaufträge dargestellt werden? ][
  Auftragsbezeichnung, zugehöriges Projekt, Start-/End-/Zwischentermine, beteiligte Personen und Gruppen, gebuchte Baumaschinen, Einsatzort, Status, Kostenvoranschlag (aus Finanzsystem).

  TODO: Verweis auf Tabellen wenn es passende gibt, sonst erstellen
]
#QaA[Sollen die Bauleiter über weitere Endgeräte auf das System zugreifen können? ][
  Nur über Tablets und Laptops vor Ort auf den Baustellen.
]


=== Zielgruppen, Benutzerrollen und Verantwortlichkeiten <chapter-Zielgruppe-Rollen>
#include "chapter/original/2.3_Zielgruppen-Benutzerrollen-Verantwortlichkeiten.typ"

#QaA[Welche Mitarbeiterpositionen soll es geben?][
  Projektleiter, Bauleiter, Baugruppenleiter, Vorarbeiter, gelernte Bauarbeiter, ungelernte Bauarbeiter und Verwaltungsmitarbeiter.
]
#QaA(labelName: "Attribute-Mitarbeiter")[Welche Attribute soll ein Mitarbeiter haben?][
  Ein Mitarbeiter umfasst folgende Attribute:

  #table(
    columns: 3,
    [*Attribut*], [*Datentyp*], [*Beschreibung*],
    [Mitarbeiternummer], [Ganzzahl], [Eindeutige ID, automatisch vergeben],
    [Vorname], [Text], [Vorname des Mitarbeiters],
    [Nachname], [Text], [Nachname des Mitarbeiters],
    [Geburtsdatum], [Datum], [Geburtsdatum des Mitarbeiters],
    [E-Mail], [Text], [E-Mail-Adresse],
    [Telefonnummer], [Text], [Telefonnummer],
    [Adresse], [Referenz], [Referenz auf Adresse (PLZ, Ort, Straße, Hausnummer)],
    [Position], [Text], [Projektleiter, Bauleiter, Baugruppenleiter, Vorarbeiter, gelernter/ungelernter Bauarbeiter, Verwaltungsmitarbeiter],
    [Beschäftigungsart], [Text], [Vollzeit oder Teilzeit],
    [Vertragsbeginn], [Datum], [Beginn des Arbeitsverhältnisses],
    [Vertragsende], [Datum], [Ende des Arbeitsverhältnisses (optional)],
    [Rolle], [Text], [Verwaltungsmitarbeiter, Bau-/Projektleiter, Vorarbeiter, Administrator],
  )

  Eine Adresse umfasst folgende Attribute (wird von Mitarbeitern, Lagern, Unterauftragnehmern referenziert):

  #table(
    columns: 3,
    [*Attribut*], [*Datentyp*], [*Beschreibung*],
    [Straße], [Text], [Straßenname],
    [Hausnummer], [Text], [Hausnummer],
    [PLZ], [Text], [Postleitzahl],
    [Ort], [Text], [Stadt/Ortschaft],
    [Land], [Text], [Optional: Deutschland (Standard)],
  )

  Intern: Die Datentypen "Text" und "Ganzzahl" entsprechen in Java String und int bzw. Integer. "Referenz" bedeutet eine Objektreferenz bzw. Fremdschlüssel in der Datenbank.
]
#QaA[Soll es Mitarbeiter geben, die nur für die Verwaltung der Daten angestellt sind?][
  Ja, die Verwaltungsmitarbeiter im Büro sind primär für die Datenpflege zuständig. Es gibt keine dedizierten Datenbankadministratoren - diese Aufgabe übernimmt der Administrator. Hinweis zur Begriffstrennung: "Verwaltungsmitarbeiter" ist sowohl eine Position (Mitarbeitertyp) als auch eine Benutzerrolle (Zugriffskontrolle). Diese Mitarbeiter werden der Gruppe "Verwaltung" zugeordnet.
]
#QaA[Wie sollen die Berechtigungen umgesetzt werden? Soll es ein bestimmtes Rollensystem geben?][
  Ja, es soll ein festes Rollensystem mit vier vordefinierten Rollen geben: Verwaltungsmitarbeiter, Bau-/Projektleiter, Vorarbeiter und Administrator. Die Rollen sind fest vorgegeben und nicht konfigurierbar.
]
#QaA[Wer soll genau zur "Verwaltung" zählen - nur Büromitarbeiter oder auch Bau- und Projektleiter im Büro? ][
  Zur Verwaltung zählen ausschließlich die Verwaltungsmitarbeiter im Büro. Bau- und Projektleiter haben eine eigene Rolle mit anderen Rechten.
]
#QaA[Was sollen "reine Verwaltungsdaten" konkret sein - welche Daten fallen darunter, welche sind ausgeschlossen? ][
  Verwaltungsdaten umfassen: Mitarbeiterstammdaten, Gruppenzuordnungen, Anwesenheitszeiten und allgemeine Konfigurationsdaten. Ausgeschlossen sind projektbezogene Daten (Aufträge, Baumaschinen-Buchungen).
]
#QaA[Sollen Verwaltungsmitarbeiter auf projektbezogene Daten nur Leserechte oder auch Schreibzugriff haben? ][
  Verwaltungsmitarbeiter haben auf projektbezogene Daten nur Leserechte. Schreibzugriff auf Projekte und Aufträge haben nur Bau-/Projektleiter und der Administrator.
]
#QaA[Soll ein Bau-/Projektleiter Vollzugriff auf alle oder nur auf seine eigenen Projekte haben? ][
  Ein Bau-/Projektleiter hat Vollzugriff auf alle projektbezogenen Daten (alle Projekte und Aufträge), nicht nur auf die ihm zugeordneten. Dies ermöglicht flexible Projektzusammenarbeit und Vertretungsregelungen.
]
#QaA[Soll ein Vorarbeiter nur aktuelle Arbeitsaufträge einsehen oder auch vergangene und zukünftige Arbeitsauträge? ][
  Ein Vorarbeiter kann seine aktuellen und zukünftigen Arbeitsaufträge einsehen. Vergangene abgeschlossene Aufträge sind ebenfalls lesbar.
]
#QaA(labelName: "Rollen-gleichzeitig")[Soll eine Person mehrere Rollen gleichzeitig haben können, und sollen dann die kombinierten Rechte gelten? ][
  Nein, jeder Benutzer hat genau eine Rolle. Ein Projektleiter, der auch Verwaltungsaufgaben übernimmt, erhält die Rolle mit den höheren Rechten.

  TODO: Tabelle zu Rollen und Berechtigungen erstellen
]
#QaA[Wer soll die Benutzerkonten und Rollenzuweisungen verwalten? - ausschließlich der Administrator? ][
  Ja, ausschließlich der Administrator verwaltet Benutzerkonten und weist Rollen zu.
]
#QaA[Soll der Administrator eine dedizierte IT-Person oder ein normaler Mitarbeiter mit Zusatzrechten sein? ][
  Der Administrator ist ein Verwaltungsmitarbeiter mit erweiterten Rechten. Eine dedizierte IT-Person ist nicht vorgesehen.
]
#QaA[Sollen die Rollen fest vordefiniert sein oder soll der Administrator neue Rollen konfigurieren können? ][
  Der Administrator kann keine neuen Rollen erstellen #referenceQ("q_Rollen-gleichzeitig").
]
#QaA[Welche charakteristischen Merkmale soll die Benutzeroberfläche erfüllen, um für Menschen ohne besondere Computerkenntnisse bedienbar zu sein? ][
  Klare Beschriftungen, große Schaltflächen, übersichtliche Eingabemasken, keine technischen Fachbegriffe in der Oberfläche. Maximal drei Klicks bis zur gewünschten Funktion.
]
#QaA[Welche charakteristischen Daten sollen Projekte verwalten? ][
  Ein Projekt umfasst folgende Attribute:

  #table(
    columns: 3,
    [*Attribut*], [*Datentyp*], [*Beschreibung*],
    [Projektnummer], [Ganzzahl], [Eindeutige ID, automatisch vergeben],
    [Projektname], [Text], [Bezeichnung des Projekts],
    [Projektleiter], [Referenz], [Referenz auf Mitarbeiter (Projektleiter)],
    [Einsatzort], [Text], [Adresse der Baustelle],
    [Starttermin], [Datum], [Geplanter Projektbeginn],
    [Endtermin], [Datum], [Geplantes Projektende],
    [Beschreibung], [Text], [Detaillierte Projektbeschreibung],
    [Status], [Text], [Geplant, laufend, abgeschlossen],
  )
]
#QaA[Welche charakteristischen Daten sollen Arbeitsaufträge verwalten? ][
  Ein Arbeitsauftrag umfasst folgende Attribute:

  #table(
    columns: 3,
    [*Attribut*], [*Datentyp*], [*Beschreibung*],
    [Auftragsnummer], [Ganzzahl], [Eindeutige ID, automatisch vergeben],
    [Auftragsbezeichnung], [Text], [Kurzbeschreibung des Auftrags],
    [Projekt], [Referenz], [Referenz auf zugehöriges Projekt],
    [Baupläne], [Text], [Dateipfad zu Bauplänen (PDF-Dateien)],
    [Einsatzort], [Text], [Adresse der Baustelle],
    [Starttermin], [Datum], [Auftragsbeginn],
    [Endtermin], [Datum], [Geplantes Auftragsende],
    [Zwischentermine], [Referenz], [Liste von Zwischenterminen (0 bis viele)],
    [Kostenvoranschlag], [Dezimalzahl], [Geschätzter Betrag (aus Finanzsystem lesend)],
    [Status], [Text], [Offen, in Bearbeitung, abgeschlossen],
    [Bemerkung], [Text], [Zusätzliche Hinweise],
  )
]
#QaA[Sollen Projekte zu Arbeitsaufträge zugeordnet werden? ][
  Ja, ein Projekt enthält einen oder mehrere Arbeitsaufträge. Die Zuordnung erfolgt 1:n (ein Projekt hat viele Aufträge).
]
#QaA[Sollen mehrere Projekte zu einem Arbeitsauftrag gehören können? ][
  Nein, ein Arbeitsauftrag gehört immer zu genau einem Projekt.

  #ask[Gehört ein Arbeitsauftrag immer zu einem Projekt]
]
#QaA[Soll es Projekte ohne Aufträge geben können? ][
  Ja, ein neu angelegtes Projekt kann zunächst ohne Aufträge existieren. Aufträge werden dann später hinzugefügt.
]
#QaA[Soll es Aufträge ohne Projekte geben können? ][
  Nein, jeder Auftrag muss einem Projekt zugeordnet sein.
]
#QaA[Sollen Mitarbeiter eine Mitarbeiternummer haben? ][
  Ja, jeder Mitarbeiter erhält eine eindeutige Mitarbeiternummer, die automatisch vom System vergeben wird #referenceQ("q_Attribute-Mitarbeiter")
]
#QaA[Wie soll die Anmeldung funktionieren (Zertifikat, Passwort)? ][
  Aufgrund von Vereinfachung nicht weiter betrachtet.
]
#QaA[Soll es eine 2FA geben? ][
  Aufgrund von Vereinfachung nicht weiter betrachtet.
]

=== Zusammenspiel mit anderen Systemen
#include "chapter/original/2.4_Zusammenspiel-mit-anderen-Systemen.typ"

#QaA[Wie lange soll die alte Software parallel betrieben werden - bis zur vollständigen Datenmigration oder darüber hinaus?][
  Die alte Software soll parallel betrieben werden, bis die Datenmigration abgeschlossen ist und die neue Software im produktiven Betrieb stabil läuft. Eine Überlappungsphase von ca. 2-4 Wochen ist vorgesehen.
]
#QaA[Soll die Anforderung "keine externe Netzverbindung" für alle Arbeitsplätze, oder nur für bestimmte gelten?][
  Die Anforderung gilt für alle Bürorechner im Bürogebäude. Der Zugriff von außen (Tablet-Projekt) ist nicht Teil des ersten Entwicklungsauftrags.
]
#QaA[Soll es weitere finanzbezogene Daten geben, die beachter werden sollen?][
  Nein. Gehälter, Löhne und Projektkosten werden im separaten Finanzbuchhaltungssystem verwaltet. Nur Rechnungen, Mahnungen und Kostenvoranschläge werden lesend aus dem Finanzsystem übernommen.
]
#QaA[[INTERN] Über welche Schnittstelle soll das neue System die Finanzdaten (Rechnungen, Mahnungen, Kostenvoranschläge) aus dem Finanzbuchhaltungssystem einlesen?][
  Über einen CSV-Export aus dem Finanzbuchhaltungssystem. Die Schnittstelle ist unidirektional (nur lesen).
]
#QaA[Wie häufig sollen die Finanzdaten aus dem Buchhaltungssystem synchronisiert werden - in Echtzeit, täglich oder manuell?][
  Die Synchronisation erfolgt manuell durch den Administrator bei Bedarf (z.B. wöchentlich oder nach Rechnungsstellung).
]
#QaA[An wie viele Drucker soll das System angebunden werden, und sollen bestimmte Drucker für bestimmte Dokumente vorgesehen sein?][
  Es sollen 3-5 Netzwerkdrucker im Büro angebunden werden. Die Drucker werden primär für die Erstellung von Rechnungen benötigt. Die Benutzer wählen den Drucker beim Druckvorgang aus.
]
#QaA[[INTERN] Wie sollen die Drucker mit den Geräten verbunden werden?][
  Die Drucker werden über das interne Büronetzwerk (LAN) angebunden. Die Java-Anwendung nutzt die Standard-Druckfunktionen des Betriebssystems.
]
#QaA[Soll die mobile Lösung auch offline funktionieren?][
  Ja, eine Offline-Fähigkeit ist zwingend erforderlich, da auf den Baustellen nicht zwangsläufig eine Netzwerkverbindung besteht. Die Synchronisation erfolgt beim nächsten Verbindungsaufbau mit dem internen Firmen-WLAN im Bürogebäude oder über eine VPN.
]
#QaA[[INTERN] Wie sollen Datenkonflikte bei der Synchronisation behandelt werden?][
  Der Benutzer wird zu einer manuellen Konfliktauflösung aufgefordert.
]
#QaA[Welche Verfügbarkeit des Systems soll bereitgestellt werden. Gibt es Zeiten, in denen das System nicht verwendet wird?][
  Das System soll während der Bürozeiten (Mo-Fr, 7:00-18:00 Uhr) verfügbar sein. Wartungsfenster können außerhalb dieser Zeiten oder am Wochenende eingeplant werden.
]

=== Produktfunktionen
#let short = "LF"
#tableGrid(arguments(
  textFigure(short)[LF 10], [Der jeweilige Benutzer muss die Möglichkeit haben, über eine grafische Benutzeroberfläche alle für ihn relevanten Daten einfach und übersichtlich zu verwalten. \
  Es sollen zahlreiche Konfigurationsdaten lesbar gespeichert und beim nächsten Start des Programms verwendet werden (z.B. aktuelle Größe und Position des Fensters). Daneben sollen einige Elemente vor dem Start konfigurierbar sein (z.B. Überschriften, Schriftarten und -größen usw.)
  #QaA[Welche charakteristischen Daten sollen verwaltet werden? ][
    Mitarbeiter, Gruppen, Aufträge, Projekte, Baumaschinen, Bauwerkzeuge, Lager, Buchungen, Anwesenheitszeiten, Bilder und Konfigurationsdaten.

    TODO: Tabelle erstellen bzw. referenzieren
  ]
  #QaA[Was soll eine übersichtliche Verwaltung bedeuten? Welche Kriterien soll die Benutzeroberfläche erfüllen?][
    Klare Struktur mit maximal drei Klicks bis zur gewünschten Information, große Schaltflächen, verständliche Beschriftungen ohne technische Fachbegriffe, Hauptfunktionen über zentrale Übersichtsseite erreichbar.
  ]
  #QaA[Was gehört zu den Konfigurationsdaten? Welche Daten sollen konfiguriert werden können? ][
    Fenstergröße und -position, Spaltenbreiten in Tabellen, Sortierreihenfolge, zuletzt geöffnete Ansichten, Schriftarten und -größen, Überschriften und Farbschemata.
  ]
  #QaA[Welche Elemente sollen vor dem Start konfigurierbar sein? Sollen sie nur einmal eingestellt werden können?  ][
    Schriftarten, Schriftgrößen und Überschriften. Diese können über eine Konfigurationsdatei vor dem Start angepasst werden und bleiben persistent. Änderungen sind jederzeit möglich.
  ]
  #QaA[[INTERN] In welcher Form, soll die Konfiguration erfolgen (GUI, CLI)? ][
    Die Konfiguration der Laufzeitdaten (Fenstergröße etc.) erfolgt automatisch. Die Vorkonfiguration (Schriftarten etc.) erfolgt über eine lesbare Konfigurationsdatei (z.B. Properties-Datei).
  ]
  #QaA[[INTERN] In welchem Format sollen die Konfigurationsdaten gespeichert werden? ][
    Die Konfigurationsdaten werden in einer Java-Properties-Datei oder im JSON-Format gespeichert. Beides ist lesbar und einfach zu bearbeiten.
  ]
  ],
  textFigure(short)[LF 20], [Als Mitarbeiter unterscheiden wir Projektleiter, Bauleiter, Baugruppenleiter, Vorarbeiter, gelernte und ungelernte Bauarbeiter sowie Verwaltungsmitarbeiter. Daneben gibt es mehrere Gruppen (Verwaltung, Planung (z.B. Bauingenieure und Architekten), Projektleitung (v.a. Bauingenieure), Bauleitung, Baugruppen (enthalten Arbeitsgruppen)). \
  Eine Gruppe kann dabei mehrere Mitarbeiter beinhalten, ein Mitarbeiter kann mehreren Gruppen angehören.
  #QaA[[INTERN] Wie stehen die Gruppen in der technischen Umsetzung in Relation mit den Mitarbeitern? ][
    Eine n:m-Beziehung. Ein Mitarbeiter kann mehreren Gruppen angehören, eine Gruppe kann mehrere Mitarbeiter enthalten. Dies wird über eine Assoziationsklasse oder Zuordnungstabelle realisiert.
  ]
  #QaA[Welche Kriterien müssen die einzelnen Gruppen bei der Auswahl der Mitarbeiter beachten (mind. Ein bestimmter Mitarbeiter, max. x verschiedene Mitarbeiter)? ][
    Keine festen Beschränkungen. Eine Gruppe kann temporär auch leer sein. Eine Baugruppe benötigt mindestens einen Baugruppenleiter. Die Größe ist nach oben nicht begrenzt.
  ]
  #QaA[Gehören die Gruppen und/ oder Mitarbeiter zu den relevanten Daten aus LF10, die angezeigt werden sollen? ][
    Ja, beide gehören zu den zentralen Daten. Mitarbeiter und Gruppen sollen über die GUI verwaltet, angezeigt, gesucht und bearbeitet werden können.
  ]
  #QaA[Sollen Arbeitsgruppen innerhalb einer Baugruppe denselben Mitarbeiter mehrfach einsetzten können? ][
    Nein, ein Mitarbeiter kann in einer Baugruppe nur einmal vorkommen. Er kann jedoch in mehreren verschiedenen Baugruppen gleichzeitig Mitglied sein.
  ]
  #QaA[Sollen die Gruppen einmalig festgelegt werden oder sollen sie manuell erstellt werden können? ][
    Die Gruppentypen (Verwaltung, Planung, Projektleitung, Bauleitung, Baugruppen) sind fest vorgegeben. Konkrete Baugruppen können aber vom Benutzer dynamisch erstellt und verwaltet werden.

    Eine Gruppe umfasst folgende Attribute:

    #table(
      columns: 3,
      [*Attribut*], [*Datentyp*], [*Beschreibung*],
      [Gruppennummer], [Ganzzahl], [Eindeutige ID, automatisch vergeben],
      [Gruppenname], [Text], [Name der Gruppe (z.B. "Baugruppe Süd", "Verwaltung")],
      [Gruppentyp], [Text], [Verwaltung, Planung, Projektleitung, Bauleitung, Baugruppe],
      [Gruppenleiter], [Referenz], [Referenz auf Mitarbeiter (optional)],
      [Beschreibung], [Text], [Zusätzliche Informationen zur Gruppe],
    )

    Die Zuordnung von Mitarbeitern zu Gruppen erfolgt über eine n:m-Beziehung.
  ]
  ],
  textFigure(short)[LF 30], [Zu den zentralen Daten eines Auftrags gehören: Projekt- und Baupläne, alle erstellten Angebote, Rechnungen und Mahnungen, Kostenvoranschläge, alle am Auftrag beteiligte Personen, Großgeräte, Einsatzort, Start-, End- und Zwischentermine usw.
  #QaA[Über welche charakteristischen Merkmale sollen die zentralen Daten verfügen? ][
    Jeder Auftrag hat: Auftragsbezeichnung, Projekt (Referenz), Baupläne (Dateipfad), beteiligte Personen/Gruppen, gebuchte Baumaschinen, Einsatzort, Start-/End-/Zwischentermine, Kostenvoranschlag (lesend aus Finanzsystem), Status (offen, in Bearbeitung, abgeschlossen).

    TODO: Tabelle erstellen bzw. referenzieren
  ]
  #QaA[Sollen alle Daten auf einer einzelnen GUI sichtbar sein oder sollen sie weiter unterteilt werden? ][
    Die Hauptinformationen (Bezeichnung, Projekt, Termine, Status) werden in einer Übersicht angezeigt. Detaildaten (Baupläne, beteiligte Personen, Baumaschinen) werden über Tabs oder Detailansichten zugänglich gemacht.
  ]
  #QaA[[INTERN] In welcher Form sollen die Daten vorliegen (einzelne Dateien, Daten in der Datenbank)? ][
    Strukturierte Daten (Aufträge, Mitarbeiter, Buchungen) liegen zunächst in lesbaren Dateien (CSV), später in einer Datenbank. Baupläne und Bilder bleiben als separate Dateien im Dateisystem, referenziert über Dateipfade #referenceG("LD 10").
  ]
  #QaA[Sollen die beteiligten Personen aufgelistet werden oder sollen im Zuge der Übersichtlichkeit Gruppen aufgezeigt werden, die Auskunft über die Mitarbeiter geben? ][
    Beide Ansichten sollen möglich sein. In der Übersicht werden die zugeordneten Gruppen angezeigt. In der Detailansicht können die einzelnen Mitglieder der Gruppen aufgelistet werden.
  ]
  ],
  textFigure(short)[LF 40], [Ein Auftrag kann von mehreren Unterauftragnehmern ausgeführt werden, d.h. Aufträge können Unteraufträge enthalten. Zur Abwicklung eines Auftrags ist ein Terminplaner erforderlich, der sämtliche Daten eines Auftrags bzw. Projekts beinhaltet.
    #QaA[[INTERN] Wie sollen Unteraufträge im System abgebildet werden (Objekt im Auftrag, eigene Klasse)? ][
      Als eigene Klasse mit Referenz zum Auftrag. Die Beziehung ist 1:n (ein Auftrag kann mehrere Unteraufträge haben).
    ]
    #QaA[[INTERN] Welche Abhängigkeiten soll der Unterauftrag von seinem Auftrag haben (z.B. geteilte Ressourcen)? ][
      Der Unterauftrag erbt das Projekt und den Einsatzort vom Auftrag. Er kann eigene Termine, beteiligte Personen und Baumaschinen haben.
    ]
    #QaA[Sollen die Unterauftragnehmer ebenfalls separat verwaltet werden? ][
      Ja, externe Unterauftragnehmer werden als Kontaktdaten (Name, Firma, Telefon, E-Mail) verwaltet und können Unteraufträgen zugeordnet werden.
    ]
    #QaA[Sollen die Unteraufträge in der Auftrag-GUI verwaltet werden? ][
      Ja, Unteraufträge werden in der Detailansicht des Auftrags angezeigt und können dort erstellt, bearbeitet und gelöscht werden.
    ]
    #QaA[Welche charakteristischen Daten enthält ein Unterauftrag? ][
      Ein Unterauftrag umfasst folgende Attribute:

      #table(
        columns: 3,
        [*Attribut*], [*Datentyp*], [*Beschreibung*],
        [Unterauftragsnummer], [Ganzzahl], [Eindeutige ID, automatisch vergeben],
        [Bezeichnung], [Text], [Kurzbeschreibung des Unterauftrags],
        [Auftrag], [Referenz], [Referenz auf den Auftrag],
        [Unterauftragnehmer], [Referenz], [Referenz auf externen Unterauftragnehmer],
        [Starttermin], [Datum], [Beginn des Unterauftrags],
        [Endtermin], [Datum], [Ende des Unterauftrags],
        [Status], [Text], [Offen, in Bearbeitung, abgeschlossen],
        [Kosten], [Dezimalzahl], [Vereinbarter Betrag],
        [Bemerkung], [Text], [Zusätzliche Hinweise],
      )

      Ein Unterauftragnehmer umfasst folgende Attribute:

      #table(
        columns: 3,
        [*Attribut*], [*Datentyp*], [*Beschreibung*],
        [Unterauftragnehmer-ID], [Ganzzahl], [Eindeutige ID, automatisch vergeben],
        [Firmenname], [Text], [Name der Firma],
        [Ansprechperson], [Text], [Vor- und Nachname],
        [Telefon], [Text], [Telefonnummer],
        [E-Mail], [Text], [E-Mail-Adresse],
        [Adresse], [Referenz], [Referenz auf Adresse],
        [Fachbereich], [Text], [z.B. Elektroinstallation, Sanitär, Heizung],
      )
    ]
    #QaA[Welche Funktionalitäten soll der Terminplaner konkret bieten? ][
      Anzeige aller Aufträge und Projekte mit ihren Terminen, Filterung nach Datum/Zeitraum, Anzeige von Start-, End- und Zwischenterminen, Übersicht über Ressourcenverfügbarkeit (Baumaschinen, Mitarbeiter).

      TODO: Tabelle erstellen
    ]
    #QaA[In welcher Form soll der Terminplaner vorliegen (Kalender, Zeitleiste)? Wie sollen die Daten im Terminplaner vorliegen (Navigation zu einer weiteren Ansicht, Ansicht der Aufgaben nach Datum sortiert)? ][
      Als Kalenderansicht mit Monats- und Wochenansicht. Aufträge werden nach Datum sortiert angezeigt. Ein Klick auf einen Eintrag öffnet die Detailansicht des Auftrags.
    ]
    #QaA[Wie sollen die Zugriffsberechtigungen für den Terminplaner verteilt werden. Soll es Beschränkungen für bestimmte Daten geben? ][
      Bau-/Projektleiter und Verwaltungsmitarbeiter haben vollen Lesezugriff. Vorarbeiter sehen nur ihre eigenen Arbeitsaufträge. Schreibrechte haben nur Bau-/Projektleiter und Administrator.
    ]
    #QaA[Welche Daten sollen unter die "sämtliche” Daten fallen? ][
      Alle Aufträge und Projekte mit ihren Terminen (Start, Ende, Zwischen), zugeordnete Baugruppen, gebuchte Baumaschinen, zugewiesene Mitarbeiter und Unteraufträge.
    ]
  ],
  textFigure(short)[LF 50], [Es müssen die Baumaschinen (Bagger, LKWs, Kräne, Rüttler, Großbohrmaschinen, uvm.) sowie größere Bauwerkzeuge (Schalungsteile, Bausicherungen, Zäune, etc.) verwaltet werden. \
  Die Baumaschinen und -werkzeuge haben unterschiedliche Ausrüstungen, nach denen sie bei der Suche unterschieden werden (z.B. Baggerschaufel, Kranzubehör (Behälter, Gewichte, Haken, usw.). \
  Damit Baumaschinen und Geräte planbar zur Verfügung stehen, müssen sie über das System gebucht werden. Die Buchung kann direkt beim Anlegen eines Auftrags geschehen oder auch später bei Bedarf. \
  Alle Baumaschinen und -werkzeuge sind einzelnen Lagern zugeordnet (Plätze und/oder Gebäude auf mehreren Grundstücken). Der momentane Standort muss zur Optimierung der Projektabläufe aktualisiert werden können. \
  Daneben müssen Benutzungszeiträume angegeben werden können, um die Verfügbarkeit eines Geräts zu erhalten. Hier soll z.B. eine Baumaschine nach Ort und Verfügbarkeit gesucht werden können ("welche Maschine steht wann zur Verfügung und ist am nächsten zum Einsatzort?“)
  Welche Baumaschinen soll es geben? Gibt es Baumaschinen, die eine besondere Art der Verwaltung benötigen? 
  #QaA[Sollen die Arten von Baumaschinen/ -Werkzeuge/ Ausrüstung fest vorgegeben oder dynamisch vom Benutzer änderbar sein?][
    Es gibt vordefinierte Standardkategorien (Bagger, LKW, Kran, Rüttler, Bohrmaschine, Schalungsteil, Zaun, Bausicherung etc.). Der Administrator kann bei Bedarf weitere Kategorien hinzufügen. Die konkrete Umsetzung erfolgt über ein Kategorieattribut in einer gemeinsamen Geräteklasse.
  ]
  #QaA[Welche Daten sind relevant für die Verwaltung einer Baumaschine/ eines Bauwerkzeugs? ][
    Eine Baumaschine bzw. ein Bauwerkzeug umfasst folgende Attribute:

    #table(
      columns: 3,
      [*Attribut*], [*Datentyp*], [*Beschreibung*],
      [Gerätenummer], [Ganzzahl], [Eindeutige ID, automatisch vergeben],
      [Bezeichnung], [Text], [Name des Geräts (z.B. "Bagger CAT 320")],
      [Kategorie], [Text], [Bagger, LKW, Kran, Rüttler, Bohrmaschine, Schalungsteil, Zaun, Bausicherung],
      [Typ], [Text], [Baumaschine (motorisiert) oder Bauwerkzeug (nicht motorisiert)],
      [Seriennummer], [Text], [Herstellerseriennummer],
      [Lager], [Referenz], [Referenz auf aktuelles Lager],
      [Standort], [Text], [Aktueller Standort (falls nicht im Lager)],
      [Status], [Text], [Verfügbar, gebucht, in Wartung, defekt],
      [Anschaffungsdatum], [Datum], [Datum der Anschaffung],
      [Letzter Wartungstermin], [Datum], [Datum der letzten Wartung],
      [Nächster Wartungstermin], [Datum], [Geplanter nächster Wartungstermin],
    )

    Die Benutzungszeiträume werden über Buchungen ermittelt.
  ]
  #QaA[Gibt es Unterschiede in der Definition/ den Eigenschaften der Baugeräte (groß, klein, Kategorie)? ][
    Nein, im System werden alle Baugeräte (Baumaschinen und Bauwerkzeuge) über eine gemeinsame Geräteklasse mit einem Kategorieattribut verwaltet.
  ]
  #QaA[[INTERN] Sollen die Bauwerkzeuge generisch verwaltet werden?  ][
    Ja, Baumaschinen und Bauwerkzeuge werden über eine gemeinsame Basisklasse generisch verwaltet. Spezifische Eigenschaften können über Attribute oder eine Vererbungshierarchie abgebildet werden.
  ]
  #QaA[Falls die Arten von Baumaschinen/ -Werkzeuge/ Ausrüstung fest vorgegeben sind (z.B. durch Klassen): Welche Arten sollen jeweils konkret existieren? ][
    Es gibt vordefinierte Standardkategorien: Bagger, LKW, Kran, Rüttler, Bohrmaschine, Schalungsteil, Zaun, Bausicherung. Der Administrator kann bei Bedarf weitere Kategorien hinzufügen.
  ]
  #QaA[Sollen Bauwerkzeuge und Baumaschinen zusammen verwaltet werden? ][
    Ja, beide werden über die gleiche Verwaltungsoberfläche verwaltet. Die Unterscheidung erfolgt über ein Kategorieattribut (Maschine vs. Werkzeug).
  ]
  #QaA[Soll die Ausrüstung für Baumaschinen und Bauwerkzeuge einzeln verwaltet werden oder soll die Ausrüstung ausschließlich über die Suche nach den Geräten verwaltet werden? ][
    Die Ausrüstung (z.B. Baggerschaufel, Kranzubehör) wird als separate Entität verwaltet und kann Baumaschinen zugeordnet werden. Über die Suche kann nach Baumaschinen mit bestimmter Ausrüstung gefiltert werden.

    Eine Ausrüstung umfasst folgende Attribute:

    #table(
      columns: 3,
      [*Attribut*], [*Datentyp*], [*Beschreibung*],
      [Ausrüstungsnummer], [Ganzzahl], [Eindeutige ID, automatisch vergeben],
      [Bezeichnung], [Text], [Name der Ausrüstung (z.B. "Baggerschaufel 1,5m")],
      [Typ], [Text], [Baggerschaufel, Kranzubehör (Behälter, Gewichte, Haken), Anbaugeräte],
      [Kompatibel mit], [Text], [Gerätetypen, mit denen die Ausrüstung kompatibel ist],
      [Gewicht], [Dezimalzahl], [Gewicht in kg],
      [Status], [Text], [Verfügbar, zugeordnet, in Wartung, defekt],
    )
  ]
  #QaA[Gibt es einen Unterschied zwischen "Baumaschine” und "Gerät”? Ist mit "Gerät” eigentlich ein "Werkzeug” gemeint? Oder ist "Gerät” ein allgemeiner Begriff für Baumaschinen/Werkzeuge? ][
    "Gerät” ist der Oberbegriff für sowohl Baumaschinen als auch Bauwerkzeuge. Im System wird zwischen Baumaschinen und nicht-motorisierten Bauwerkzeugen unterschieden.

    #ask[Was bedeutet "Gerät"?]
  ]
  #QaA[Nach welchen Kriterien soll gesucht werden (Filter, Textsuche, Eigenschaften)? ][
    Kombination aus Textsuche (Bezeichnung, Seriennummer), Filterung nach Kategorie, Standort/Lager, Verfügbarkeit (Zeitraum) und Ausrüstung.
  ]
  #QaA[Wie soll nach der Ausrüstung gesucht werden (Kategorie, Textsuche)? ][
    Textsuche nach Bezeichnung der Ausrüstung (z.B. "Baggerschaufel") oder Filterung nach Ausrüstungstyp (z.B. "Kranzubehör").
  ]
  #QaA[Wie soll eine Buchung ablaufen? Was beinhaltet der Prozess (Bestätigung bestimmter Personen, etc.)? ][
    Der Benutzer wählt eine Baumaschine, gibt den Zeitraum (Start- und Enddatum) und den Auftrag an. Das System prüft die Verfügbarkeit. Bei Verfügbarkeit wird die Buchung gespeichert. Eine Bestätigung durch weitere Personen ist nicht erforderlich.

    Eine Buchung umfasst folgende Attribute:

    #table(
      columns: 3,
      [*Attribut*], [*Datentyp*], [*Beschreibung*],
      [Buchungsnummer], [Ganzzahl], [Eindeutige ID, automatisch vergeben],
      [Gerät], [Referenz], [Referenz auf Baumaschine/Bauwerkzeug],
      [Auftrag], [Referenz], [Referenz auf Arbeitsauftrag],
      [Startdatum], [Datum], [Beginn der Buchung],
      [Enddatum], [Datum], [Ende der Buchung],
      [Gebucht von], [Referenz], [Referenz auf Mitarbeiter (wer hat gebucht)],
      [Buchungsdatum], [Datum], [Datum der Buchungserstellung],
      [Status], [Text], [Aktiv, abgeschlossen, storniert],
    )
  ]
  #QaA[[INTERN] Wie soll der Umgang mit gleichzeitigen Buchungen erfolgen (First come, first served)? ][
    Ja, First-come-first-served. Laut Vereinfachung ist kein Locking-Mechanismus erforderlich. Bei zeitgleichen Buchungen gewinnt die zuerst gespeicherte.
  ]
  #QaA[Soll die Buchung über die Suche nach Baumaschinen und Geräten verfügbar sein oder soll es dafür eine separate Benutzeroberfläche geben? ][
    Beides. In der Suchansicht kann direkt eine Buchung vorgenommen werden. Zusätzlich gibt es eine Buchungsverwaltung zur Übersicht aller aktuellen und zukünftigen Buchungen.
  ]
  #QaA[Wo soll das Lager der Baumaschinen und -Werkzeuge verwaltet werden? Soll es über die Geräte in der Suche verfügbar sein? ][
    Lager werden separat verwaltet (mit Name, Adresse, Typ). In der Geräteverwaltung wird das zugeordnete Lager angezeigt und kann geändert werden. Bei der Suche kann nach Lagerstandort gefiltert werden.
  ]
  #QaA[Wie oft soll die Aktualisierung des Lagers erfolgen? Soll die automatisch oder manuell erfolgen?  ][
    Manuell. Beim Zurücktransport einer Baumaschine oder eines Werkzeugs wird der Standort vom Benutzer aktualisiert.
  ]
  #QaA[Soll ein Grundstück zu einem Lager zugeordnet werden können? Soll zwischen der Art des Lagers unterschieden werden können (Platz, Gebäude, …)? ][
    Ja, beides. Ein Lager hat ein Typ-Attribut (Platz oder Gebäude) und kann optional einem Grundstück zugeordnet werden.
  ]
  #QaA[Was sollen die charakteristischen Eigenschaften eines Lagers sein? ][
    Ein Lager umfasst folgende Attribute:

    #table(
      columns: 3,
      [*Attribut*], [*Datentyp*], [*Beschreibung*],
      [Lagernummer], [Ganzzahl], [Eindeutige ID, automatisch vergeben],
      [Lagerbezeichnung], [Text], [Name des Lagers (z.B. "Lager Nord", "Hauptlager")],
      [Typ], [Text], [Platz (Außengelände) oder Gebäude (Lagerhalle)],
      [Adresse], [Referenz], [Referenz auf Adresse (Straße, Hausnummer, PLZ, Ort)],
      [Grundstück], [Text], [Optional: Grundstücksbezeichnung],
      [Kapazität], [Ganzzahl], [Optional: Maximale Anzahl Geräte],
    )
  ]
  #QaA[Woher soll die Information über das zugehörige Lager erhalten werden (GPS, Eintrag in der GUI, Buchungen)? ][
    Über manuelle Eingabe in der GUI. Beim Anlegen einer Baumaschine wird das Lager zugeordnet. Bei Standortwechsel wird das Lager manuell aktualisiert.
  ]
  #QaA[Sollen die Benutzungszeiträume manuell eingegeben werden oder über die Buchungen ermittelt werden? ][
    Die Benutzungszeiträume werden automatisch über die Buchungen ermittelt. Jede Buchung hat einen Start- und Endzeitpunkt.
  ]
  #QaA[Soll die/ das nächste Baumaschine/ -Werkzeug angezeigt werden?][
    Die Suche zeigt verfügbare Geräte mit ihrem Lagerstandort an. Eine Berechnung der Distanz zum Einsatzort wird nicht benötigt. GPS-Ortung ist nicht erforderlich.
  ]
  #QaA[Ist auch der Ort eines Objekts innerhalb eines Lagers relevant (z.B. "Regal 3, oben rechts”)? ][
    Nein, die genaue Position innerhalb eines Lagers ist nicht erforderlich. Es reicht die Zuordnung zum Lager selbst.
  ]
  #QaA[[INTERN] In welchem Format sollen Lager gespeichert werden? ][
    Als Objekte in der Datenbasis (CSV/JSON-Format bei lesbaren Dateien, später Datenbanktabelle).
  ]
  #QaA[Soll es eine separate Suche zur Verfügbarkeit geben oder soll sie mit der Suche nach Geräten zusammengefasst werden?][
    Die Verfügbarkeitssuche ist Teil der Gerätesuche. Der Benutzer kann einen Zeitraum angeben, und das System zeigt nur verfügbare Geräte an.
  ] 
  ],
  textFigure(short)[LF 60], [Nach allen wesentlichen Daten sollen mittels einer oder mehrerer Suchmaske im Datenbestand gesucht werden können.
  #QaA[In welchem Format sollen die Suchergebnisse angezeigt werden (Tabelle, Suchergebnisliste)? ][
    Als Tabelle mit den wichtigsten Attributen (z.B. Bezeichnung, Kategorie, Status, Standort). Ein Klick auf einen Eintrag öffnet die Detailansicht #referenceQ("q_wesentlichen-Daten").
  ]
  #QaA(labelName: "wesentlichen-Daten")[Was sind die "wesentlichen" Daten, nach denen gesucht werden soll?][
    Mitarbeiter, Gruppen, Aufträge, Projekte, Baumaschinen, Bauwerkzeuge, Lager, Buchungen und Anwesenheitszeiten.

    TODO: Tabelle erstellen bzw. referenzieren
  ] 
  #QaA[Ist eine Sortierung nötig? ][
    Ja, die Suchergebnisse sollen nach verschiedenen Spalten sortierbar sein (aufsteigend/absteigend).
  ]
  #QaA[Welche Suchmaske(n) sind sollen verwendet werden? ][
    Je eine Suchmaske für: Mitarbeiter, Aufträge/Projekte, Baumaschinen/Werkzeuge. Alternativ eine zentrale Suchmaske mit Kategorie-Auswahl.
  ]
  #QaA[Wie sollen die Suchmasken aufgeteilt werden? ][
    Nach Datentyp: eine Maske für Personaldaten (Mitarbeiter, Gruppen), eine für Projektdaten (Aufträge, Projekte), eine für Ressourcen (Baumaschinen, Werkzeuge, Lager).
  ]
  #QaA[Wie viele Suchmasken soll es maximal geben? ][
    Maximal 5 Suchmasken: Mitarbeiter, Gruppen, Aufträge/Projekte, Baumaschinen/Werkzeuge, Lager. Eine zentrale Suche mit Filter ist ebenfalls denkbar.
  ]
  #QaA[Wie soll die Suche erfolgen? Volltextsuche, Suche nach Schlüsselwörtern, Suche nach Kategorien, ... ][
    Kombination aus Textsuche (Name, Bezeichnung) und Filterung nach Kategorien/Attributen (z.B. Status, Datum, Standort). Keine komplexe Volltextsuche erforderlich.
  ]
  ],
  textFigure(short)[LF 70], [Die Auswahl der Daten soll möglichst über (eventuell durchsuchbare) Auswahllisten erfolgen. Dies gilt vor allem für Zuordnungen von Daten zu anderen Daten (z.B. Bau- fahrzeuge und Personen zu Projekten und Arbeitsaufträgen usw.). Die Auswahllisten sollen auf einfache Weise erweiterbar und für sämtliche Mitarbeiter im System verfügbar sein.
  #QaA[Wie sollen Auswahllisten dargestellt werden (einzelne Auswahllisten mit einzelnen Objekten oder mit komplexer Beziehung)? ][
    Als Listen mit einzelnen Objekten (z.B. Liste aller Mitarbeiter, Liste aller Baumaschinen). Komplexe Beziehungen werden über Referenzlisten angezeigt (z.B. "Mitarbeiter aus Gruppe X").
  ]
  #QaA[Welche Such- und Filtermöglichkeiten sollen die Auswahllisten haben? ][
    Textsuche (Eingabefeld zum Filtern der Liste während der Eingabe) und Filterung nach Kategorien (z.B. nur Mitarbeiter einer bestimmten Gruppe anzeigen).
  ]
  #QaA[Soll es eine Vorauswahl geben? ][
    Ja, bei bekannten Zuordnungen (z.B. beim Bearbeiten eines Auftrags) werden die bereits zugeordneten Objekte vorausgewählt angezeigt.
  ]
  #QaA[Wie sollen die Beziehungen zwischen den Daten dargestellt werden? ][
    In Detailansichten über Referenzlisten (z.B. "Zugeordnete Mitarbeiter", "Gebuchte Baumaschinen"). Die Beziehungen werden nicht grafisch visualisiert.
  ]
  #QaA[Wie sollen die Auswahllisten angezeigt werden? (z.B. Dropdown-Menüs, Listen, Scrollbar)? ][
    Als Dropdown-Menüs mit Suchfunktion oder als scrollbare Listen bei größeren Datenmengen (z.B. Mitarbeiterauswahl).
  ]
  #QaA[Wie sollen die Auswahllisten erweitert werden? ][
    Durch das Anlegen neuer Objekte in der jeweiligen Verwaltungsansicht. Neue Mitarbeiter, Baumaschinen etc. werden automatisch in den Auswahllisten verfügbar.
  ]
  #QaA[Soll eine Mehrfachauswahl möglich sein?  ][
    Ja, bei Zuordnungen zu Aufträgen (z.B. mehrere Mitarbeiter, mehrere Baumaschinen) soll eine Mehrfachauswahl möglich sein.
  ]
  #QaA[Sollen gelöschte oder inaktive Einträge bestimmt angezeigt werden? ][
    Nein, gelöschte oder inaktive Einträge werden standardmäßig nicht in Auswahllisten angezeigt. Optional kann ein Filter "Inaktive anzeigen" aktiviert werden.
  ]
  #QaA[[INTERN]: Soll es Lazy Loading geben oder sollen alle Daten direkt geladen werden?][
    Bei kleineren Listen (unter 100 Einträge) werden alle Daten direkt geladen. Bei größeren Listen kann Lazy Loading implementiert werden, um die Performance zu verbessern.
  ]
  ],
  textFigure(short)[LF 80], [Allen Elementen sollen beliebig viele Bilder mit Titel zugeordnet werden können, die zentral auf einem Verzeichnis liegen sollen
  #QaA[Was ist ein Element (z.B. auch Terminplaner)? ][
    Ein Element ist jedes verwaltete Objekt: Mitarbeiter, Gruppe, Auftrag, Projekt, Baumaschine, Bauwerkzeug, Lager, Unterauftrag.

    TODO: Pürfen ob komplett, Tabelle erstellen bzw. referenzieren
  ]
  #QaA[Sind alle Elemente gemeint oder sollen nur ausgewählte Elemente über Bilder verfügen? ][
    Primär Aufträge, Projekte, Baumaschinen und Bauwerkzeuge. Mitarbeiter und Gruppen können optional auch Bilder haben (z.B. Profilbilder).
  ]
  #QaA[[INTERN] Welche Bildformate sollen, unterstützt werden können? ][
    Standard-Bildformate: JPG, PNG, GIF. Optional auch PDF für Dokumente.
  ]
  #QaA[Dürfen gleiche Bilder doppelt existieren oder soll es eine zentrale Bildverwaltung geben? ][
    Bilder werden zentral in einem Verzeichnis gespeichert. Mehrere Objekte können auf dasselbe Bild referenzieren (über Dateipfad).
  ]
  #QaA[Wie sollen die Bilder organisiert werden? (Nach Kategorien, nach Datum, nach Projekten, ...) ][
    Zentral in einem Verzeichnis, mit eindeutigen Dateinamen. Optional können Unterverzeichnisse nach Typ (Auftrag, Maschine) oder Projekt angelegt werden.
  ]
  #QaA[Wie sollen die Bilder angezeigt werden? (In einer Galerie, als Thumbnails, ...) ][
    In der Detailansicht als Galerie mit Thumbnails. Ein Klick auf ein Thumbnail öffnet das Bild in voller Größe.
  ]
  #QaA[[INTERN] Welche Informationen sollen in den Bildern enthalten sein (Metadaten)? ][
    Ein Bild umfasst folgende Attribute:

    #table(
      columns: 3,
      [*Attribut*], [*Datentyp*], [*Beschreibung*],
      [Bild-ID], [Ganzzahl], [Eindeutige ID, automatisch vergeben],
      [Titel], [Text], [Vom Benutzer vergebener Titel],
      [Dateipfad], [Text], [Pfad zur Bilddatei im Verzeichnis],
      [Dateiname], [Text], [Ursprünglicher Dateiname],
      [Element], [Referenz], [Referenz auf zugeordnetes Objekt (Auftrag, Projekt, Maschine, Mitarbeiter)],
      [Elementtyp], [Text], [Typ des zugeordneten Elements (zur Filterung)],
      [Hochladedatum], [Datum], [Datum des Uploads],
      [Hochlader], [Referenz], [Referenz auf Benutzer (Mitarbeiter)],
      [Dateigröße], [Ganzzahl], [Größe in Bytes],
      [Format], [Text], [JPG, PNG, GIF, PDF],
    )
  ]
  #QaA[[INTERN] Wie viel Speicherplatz soll für die Bilder vorgesehen werden? ][
    Zunächst ca. 20-30 GB für Bilder. Der Speicherplatz kann bei Bedarf erweitert werden.
  ]
  #QaA[Soll eine Versionshistorie erstellt werden? ][
    Nein, eine Versionierung der Bilder ist nicht erforderlich. Bilder können ersetzt oder gelöscht werden.
  ]
  #QaA[Sollen die Bilder von der Software zur Verfügung gestellt werden oder soll der Nutzer die Bilder eigenständig Hinzufügen können? ][
    Der Nutzer fügt Bilder eigenständig hinzu (Upload-Funktion). Die Software stellt keine vordefinierten Bilder bereit.
  ]
  ],
  textFigure(short)[LF 90], [Viele unserer Angestellten sind teilzeitbeschäftigt. Für alle Angestellten sollen deshalb die Anwesenheitszeiten erfasst werden.
  #QaA[Wie sollen die Anwesenheitszeiten erfasst werden? (Manuell, automatisch, durch Stempelkarten, ...) ][
    In der Firma werden Stempelkarten verwendet, die automatisch die Start- und Endzeiten erfassen. Diese Daten werden täglich in das System importiert.
  ]
  #QaA[Wer hat Lese- und Schreibrechte für die Anwesenheitszeiten? ][
    Schreibrechte: Administrator \
    Leserechte: Jeder Mitarbeiter kann seine eigenen Zeiten einsehen und der Vorgesetzte kann die Zeiten seiner direkten Mitarbeiter einsehen.
  ]
  #QaA[Wie sollen die Anwesenheitszeiten dargestellt werden? (Nach Tagen, nach Wochen, nach Monaten, nach Stunden, nach Minuten...) ][
    Als Tabelle mit Einträgen pro Tag. Anzeigemöglichkeiten: nach Tag, Woche oder Monat filtern. Jeder Eintrag zeigt Datum, Startzeit, Endzeit und Gesamtstunden.
  ]
  #QaA[Welche charakteristischen Merkmale sollen die Anwesenheitszeiten enthalten (z.B. Uhrzeit, Dauer, Grund für Abwesenheit, ...)? ][
    Eine Anwesenheitszeit umfasst folgende Attribute:

    #table(
      columns: 3,
      [*Attribut*], [*Datentyp*], [*Beschreibung*],
      [Anwesenheits-ID], [Ganzzahl], [Eindeutige ID, automatisch vergeben],
      [Mitarbeiter], [Referenz], [Referenz auf Mitarbeiter],
      [Datum], [Datum], [Arbeitstag],
      [Startzeit], [Zeit], [Beginn der Arbeitszeit (z.B. 08:00)],
      [Endzeit], [Zeit], [Ende der Arbeitszeit (z.B. 17:00)],
      [Typ], [Text], [Anwesend, Urlaub, Krankheit, sonstige Abwesenheit],
      [Bemerkung], [Text], [Optional: z.B. "Baustelle Projekt X"],
    )
  ]
  #QaA[Soll Abwesenheit auch erfasst werden? Wenn ja, wie soll das erfolgen? ][
    Ja, Abwesenheiten (Urlaub, Krankheit) werden als separate Einträge mit Typ (Urlaub, Krankheit, sonstige) und Zeitraum erfasst.
  ]
  #QaA[Muss Datenschutz beachtet werden? ][
    Ja, Anwesenheitsdaten sind personenbezogene Daten und unterliegen der DSGVO. Zugriff nur für berechtigte Personen, keine unbefugte Weitergabe.
  ]
  #QaA[In Bezug auf die Zielsetzung: müssen die Daten exportierbar und importierbar sein?][
    Ja, Anwesenheitszeiten sollen im CSV-Format exportierbar sein (z.B. für Lohnabrechnung oder Archivierung). Import ist optional.
  ]
  ],
  textFigure(short)[LF 100], [Vor dem Hinzufügen von neuen Daten soll eine Überprüfung stattfinden, ob diese eventuell schon vorhanden sind.
  #QaA[Wie soll die Überprüfung erfolgen (manuell, automatisch, durch eine Suchfunktion, bei welchen Daten soll die Prüfung durchgeführt werden ...)? ][
    Automatisch beim Speichern neuer Datensätze. Geprüft werden: Mitarbeiter (Name + Geburtsdatum), Baumaschinen (Seriennummer), Aufträge (Projektreferenz + Bezeichnung), Lager (Name).
  ]
  #QaA[Wer darf eine Überprüfung durchführen (wer hat Überschreibrechte)? ][
    Die Überprüfung erfolgt automatisch für alle Benutzer. Bei erkanntem Duplikat wird eine Warnung angezeigt. Der Administrator kann die Warnung überschreiben und das Duplikat dennoch anlegen.
  ]
  #QaA[Welche charakteristischen Merkmale sollen bei der Überprüfung berücksichtigt werden (z.B. Name, Datum, Kategorie, ...)? ][
    Je nach Datentyp: Mitarbeiter (Vorname + Nachname + Geburtsdatum), Baumaschinen (Seriennummer oder Bezeichnung + Kategorie), Aufträge (Bezeichnung + Projekt), Lager (Name + Adresse).
  ]
  #QaA[[INTERN] Was soll passieren, wenn die Daten bereits vorhanden sind? Sollen sie aktualisiert werden, sollen sie ignoriert werden, soll eine Fehlermeldung ausgegeben werden, ...? ][
    Eine Warnmeldung wird angezeigt ("Möglicherweise bereits vorhanden: [Vorhandener Eintrag]"). Der Benutzer kann entscheiden: Abbrechen, dennoch anlegen, oder vorhandenen Eintrag bearbeiten.
  ]
  ],
))
 
== Produktdaten
#let short = "LD"
#tableGrid(arguments(
  textFigure(short)[LD 10], [Die Daten sollen zunächst in einer zentralen Datenbasis (lesbare Dateien) abgespeichert und später in eine Datenbank überführt werden.
  #QaA[[INTERN] Hat die vorherige Applikation eine Datenbank benutzt? Wenn ja, sollen wir die gleiche benutzen? ][
    Ja, eine lokale Datenbank. Das neue System soll zunächst mit lesbaren Dateien arbeiten und später auf eine moderne Datenbank (z.B. SQLite, PostgreSQL) migriert werden.
  ]
  #QaA[Gibt es vorhandene Software-Lizenzen, die verwendet werden sollen? ][
    Nein, es sollen ausschließlich kostenfreie und quelloffene Technologien verwendet werden (Java, Open-Source-Datenbanken).
  ]
  #QaA[Wer hat Zugriff auf die Datenbasis? Gibt es Admins, oder eine IT Abteilung? ][
    Der Administrator hat vollen Zugriff auf die Datenbasis. Eine dedizierte IT-Abteilung gibt es nicht. Der Administrator ist ein Verwaltungsmitarbeiter mit erweiterten Rechten.
  ]
  ],
))
 
#let short = "LL"
== Produktleistungen
#tableGrid(arguments(
  textFigure(short)[LL 10], [Die Anzahl der zu verwaltenden Elemente wird auf ca. 100.000 geschätzt.
  #QaA[[INTERN] Wie soll der Fall, dass die Anzahl der Elemente deutlich ansteigt, technisch gehandhabt werden? ][
    Durch Paginierung in der GUI, Indizierung in der Datenbank und effiziente Suchalgorithmen. Bei Bedarf Umstellung auf eine performantere Datenbank.
  ]
  #QaA[Wie kommt die Schätzung von 100.000 Elementen zu Stande? ][
    Hochrechnung basierend auf: ca. 200 Mitarbeiter, 500 Aufträge pro Jahr über 10 Jahre = 5.000 Aufträge, 100 Baumaschinen/Werkzeuge, Anwesenheitszeiten (200 Mitarbeiter × 250 Arbeitstage × 10 Jahre = 500.000 Einträge, aber nur aktuelle Jahre online).
  ]
  #QaA[[INTERN] Wie viel Speicher steht zur Verfügung und wie viel wird benötigt? ][
    Verfügbar: Server mit ca. 500 GB Speicher. Benötigt: ca. 100-150 GB (Datenbank: 5-10 GB, Bilder: 20-30 GB, Baupläne als PDF: 50-100 GB), abhängig von der Anzahl und Größe der Dokumente.
  ]
  #QaA[Aus welchen Arten von Daten sollen die Elemente bestehen (nur Text oder hochauflösende Baupläne usw.)? ][
    Strukturierte Textdaten (Aufträge, Mitarbeiter, Buchungen) und Dateien (Baupläne als PDF, Bilder als JPG/PNG). Baupläne können mehrere MB groß sein.
  ]
  #QaA[Welche Anforderungen gibt es bei der Suchzeit innerhalb der 100.000 Datenelemente ][
    Suchanfragen sollen innerhalb von 2-3 Sekunden abgeschlossen sein. Bei sehr großen Ergebnismengen ist Paginierung erforderlich.
  ]
  ],
  textFigure(short)[LL 20], [Die Daten müssen aus rechtlichen Gründen 10 Jahre online verfügbar sein.
  #QaA[[INTERN] Wie sollen die Daten gespeichert werden? Welches Datenformat soll verwendet werden? ][
    Zunächst in lesbaren Dateien (CSV/JSON), später in einer relationalen Datenbank (z.B. PostgreSQL, SQLite). Dateien (Baupläne, Bilder) bleiben im Dateisystem.
  ]
  #QaA[Was passiert nach der 10 Jahres Frist? Können die Daten dann gelöscht werden? ][
    Ja, Daten können nach Ablauf der gesetzlichen Aufbewahrungsfrist gelöscht werden, sofern keine anderen rechtlichen oder geschäftlichen Gründe dagegen sprechen.
  ]
  #QaA[Wer muss über die 10 Jahre einen Zugriff auf die Daten haben? ][
    Verwaltungsmitarbeiter, Administrator und bei Bedarf externe Prüfer (z.B. Finanzamt, Wirtschaftsprüfer). Der Zugriff muss auch nach Personalwechseln gewährleistet sein.
  ]
  #QaA[Soll verhindert werden, dass die Daten aufgrund von Softwareupdates oder Umstrukturierungen für einige Stunden nicht verfügbar sind? ][
    Wartungsfenster außerhalb der Bürozeiten sind akzeptabel. Eine 24/7-Verfügbarkeit ist nicht erforderlich. Updates sollten am Wochenende oder abends durchgeführt werden.
  ]
  ],
  textFigure(short)[LL 30], [Um bei HW- und SW-Anschaffungen und -neuerungen flexibel zu bleiben, ist auf Platt-formunabhängigkeit besonders zu achten.
  #QaA[Sollen die UI-Elemente auf allen Endgeräten gleich aussehen? ][
    Ja, die Java-Desktop-Anwendung soll auf allen Betriebssystemen (Windows, Linux, macOS) einheitlich aussehen und sich bedienen lassen.
  ]
  #QaA[[INTERN] Wie stellt man sicher, dass die Software auf Desktops, Laptops und Tablets läuft? ][
    Durch Verwendung von Java (plattformunabhängig) und der swe-utils-Bibliothek. Für Tablets ist eine separate Web- oder App-Lösung im späteren Tablet-Projekt vorgesehen.
  ]
  #QaA[[INTERN] Welche Faktoren sollen beachtet werden damit die Plattformunabhängigkeit gewährleistet ist? ][
    Verwendung von Java, Verzicht auf betriebssystemspezifische APIs, Testen auf allen Zielplattformen (Windows, Linux, macOS), Verwendung relativer Pfade statt absoluter Pfade.
  ]
  #QaA[Wie sollen die Endgeräte priorisiert werden? ][
    Priorität 1: Desktop-PCs im Büro (Windows, Linux). Priorität 2: Laptops. Priorität 3: Tablets (späteres Projekt).
  ]
  ],
))
 
== Qualitätsanforderung
#include "chapter/original/2.8_Qualitätsanforderung.typ"

#table(columns: 2,
  [*Produktqualität*], [*Fragen und Antworten*],
  [Funktionalität], 
  [
    #QaA[Wie soll die als "gut" bewertete Funktionalität sichergestellt werden - soll die korrekte Funktion durch automatisierte Tests, manuelle Abnahmetests oder beides verifiziert werden?][
      Beides. Automatisierte Unit-Tests für die Geschäftslogik und manuelle Abnahmetests durch die Anwender für die GUI und Geschäftsprozesse.
    ]
    #QaA[Gibt es bestimmte Qualitätsmerkmale, die in der obigen Tabelle nicht aufgeführt sind, aber für das Bauunternehmen trotzdem wichtig wären (z.B. Sicherheit, Skalierbarkeit, Datenschutzkonformität)?][
      Ja, Datenschutzkonformität (DSGVO) ist wichtig, da personenbezogene Daten verwaltet werden. Sicherheit (Zugriffsrechte, Backups) ist ebenfalls relevant. Skalierbarkeit ist weniger kritisch, da die Mitarbeiterzahl stabil bleibt.
    ]
  ],
  [Zuverlässigkeit], 
  [
    #QaA[Wie soll die als "gut" bewertete Zuverlässigkeit gewährleistet werden - wie soll das System bei unerwarteten Fehlern (z.B. Datenbankausfall, Netzwerkunterbrechung) reagieren?][
      Fehlermeldungen in verständlicher Sprache anzeigen, Daten wo möglich zwischenspeichern, automatische Wiederverbindungsversuche bei Netzwerkproblemen. Bei kritischen Fehlern wird der Administrator benachrichtigt.
    ]
    #QaA[Soll das zuverlässige System eine automatische Datensicherung (Backup) in regelmäßigen Intervallen durchführen und wenn ja, in welchem zeitlichen Abstand?][
      Ja, automatische Backups täglich (nachts) und wöchentlich (vollständig). Der Administrator kann Backups auch manuell auslösen.
    ]
  ],
  [Effizienz], 
  [
    #QaA[Wie soll die als "gut" eingestufte Effizienz konkret gemessen werden - gibt es maximale Antwortzeiten für typische Verwaltungsoperationen wie die Suche nach Aufträgen oder Baumaschinen (z.B. unter 2 Sekunden)?][
      Ja, Suchoperationen sollen in unter 2-3 Sekunden abgeschlossen sein. Das Laden von Detailansichten in unter 1 Sekunde. Längere Operationen (Import, Export) zeigen einen Fortschrittsbalken.

      Lange Wartezeiten (über 5 Sekunden) sind nicht akzeptabel und müssen durch Optimierung oder Hintergrundverarbeitung vermieden werden.
    ]
  ],
  [Benutzbarkeit (auch Gestaltung)],
  [
    #QaA[Wie soll die als "sehr gut" bewertete Benutzbarkeit konkret umgesetzt werden - soll die grafische Oberfläche nach bestimmten Usability-Richtlinien gestaltet werden?][
      Die Oberfläche orientiert sich an bewährten Usability-Prinzipien: klare Struktur, konsistente Bedienung, verständliche Beschriftungen, maximal drei Klicks bis zur gewünschten Information.
    ]
    #QaA[Wie soll die Gestaltung der Benutzeroberfläche aussehen - soll ein einheitliches Farbschema, ein firmeneigenes Corporate Design oder ein modernes, minimalistisches Design verwendet werden?][
      Ein modernes, minimalistisches Design mit einheitlichem Farbschema (neutral, professionell). Ein firmeneigenes Corporate Design ist nicht zwingend erforderlich.
    ]
    #QaA[Soll die hohe Benutzbarkeit durch integrierte Hilfefunktionen, Tooltips oder eine kontextsensitive Benutzerdokumentation unterstützt werden?][
      Ja, Tooltips bei allen wichtigen UI-Elementen und eine integrierte Hilfe-Funktion (F1-Taste). Eine ausführliche Benutzerdokumentation (PDF) soll separat bereitgestellt werden.
    ]
    #QaA[Wie soll die qualitativ hochwertige Benutzbarkeit für die verschiedenen Benutzerrollen differenziert werden - sollen rollenspezifische, angepasste Oberflächen bereitgestellt werden?][
      Ja, die GUI passt sich der Rolle an. Verwaltungsmitarbeiter sehen alle Verwaltungsfunktionen, Vorarbeiter nur ihre Arbeitsaufträge, Bau-/Projektleiter ihre Projekte, Administrator alle Funktionen. Die Basis-GUI bleibt einheitlich.
    ]

    #QaA[Soll eine bestimmte Barrierefreiheit (Accessibility) bei der grafischen Benutzeroberfläche beachtet werden (z.B. Unterstützung für Sehbehinderte, Spracheingabe)?][
      Es reichen die gesätzlichen Anforderungen an Barrierefreiheit (z.B. ausreichende Kontraste, skalierbare Schriftgrößen). Es müssen keine weiteren speziellen Funktionen implementiert werden.
    ]
  ],
  [Wartbarkeit], 
  [
    #QaA[Wie soll die als "normal" bewertete Wartbarkeit umgesetzt werden - soll die Software modular aufgebaut sein, sodass einzelne Komponenten (z.B. GUI, Datenbankzugriff, Geschäftslogik) unabhängig voneinander gewartet und aktualisiert werden können?][
      Ja, Schichtenarchitektur: GUI-Schicht, Geschäftslogik-Schicht, Datenzugriff-Schicht. Änderungen in einer Schicht sollen die anderen Schichten möglichst nicht beeinflussen.
    ]
    #QaA[Soll die wartbare Software so dokumentiert werden, dass ein neues Entwicklerteam ohne aufwendige Einarbeitung Fehler beheben und Erweiterungen vornehmen kann?][
      Ja, technische Dokumentation (Architektur, Klassendiagramme, Datenbankschema) und Code-Kommentare für komplexe Stellen. Eine vollständige API-Dokumentation ist wünschenswert.
    ]
    #QaA[Wer soll die langfristige Wartung der fertigen Software übernehmen - das interne IT-Personal des Bauunternehmens oder ein externer Dienstleister?][
      Der interne Administrator übernimmt die laufende Wartung (Backups, Updates). Für größere Änderungen oder Erweiterungen kann ein externer Dienstleister beauftragt werden.
    ]
    #QaA[Steht die "normale" Wartbarkeit im Widerspruch zur gewünschten 10-jährigen Datenverfügbarkeit - wie soll sichergestellt werden, dass Software-Updates über diesen langen Zeitraum die bestehende Funktionalität nicht beeinträchtigen?][
      Kein Widerspruch. Daten und Software sind getrennt. Die Datenbank bleibt stabil, Software-Updates betreffen nur die Applikation. Vor größeren Updates werden Backups erstellt und Tests durchgeführt.
    ]
  ],
  [Übertragbarkeit (Portabilität)],
  [
    #QaA[Wie soll die als "gut" bewertete Übertragbarkeit (Portabilität) sichergestellt werden - soll die fertige Software ohne größere Anpassungen auf unterschiedlichen Betriebssystemen (Windows, Linux, macOS) lauffähig sein?][
      Ja, durch Verwendung von Java und plattformunabhängigen Bibliotheken. Tests auf allen drei Betriebssystemen vor Auslieferung.
    ]
    #QaA[Soll die portierbare Software auch auf verschiedenen Bildschirmauflösungen und Displaygrößen (Desktop-Monitor, Laptop, Tablet) ohne Einbußen bei der Benutzbarkeit funktionieren?][
      Ja, die GUI soll responsive sein und sich an verschiedene Bildschirmauflösungen anpassen. Mindestauflösung: 1280x720 Pixel.
    ]
  ],
)
