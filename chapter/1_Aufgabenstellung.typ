#import "../utils.typ": *
#import "@preview/codly:1.3.0": *
#import "@preview/codly-languages:0.1.1": *
#show: codly-init.with()
#let entityTable = "entityTable"
#let qa-counter = counter("qa-counter")
#let basicStroke = (0.5pt + gray)
#let basicForeGround = arguments(weight: "bold", fill: white)
#let answerColor = green

//own functions
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
        align(left)[
          #text(fill: orange, weight: "bold")[F#str(n). #question] \
          #text(fill: answerColor)[#answer]
        ]
      ),
      kind: "qa",
      supplement: "Frage",
      caption: none,
    )#lbl]
  }
}

#let tableGrid(cells) = {
  show table.cell.where(y: 0): it => {
    text(fill: black, weight: "regular", it)
  }
  table(..cells, fill: white, columns: 2, stroke: none,
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
  
//figure for entity tables
#let entityFigure(entityName, cells) = {
  [#figure(kind: entityTable, supplement: "Entität", caption: entityName, table(
    fill: (x, y) => if y == 0 { rgb("#9b9b9b") 
    } else if y == 1 {
      rgb("#b7b7b7") 
    },
    columns: 3,
    table.cell(colspan: 3, text(..basicForeGround)[*Entität: #entityName*]),
    table.cell(text(..basicForeGround)[*Attribut*]), table.cell(text(..basicForeGround)[*Datentyp*]), table.cell(text(..basicForeGround)[*Beschreibung*]),
     ..cells, align: left)) #label("e_" + entityName)]
}

//figure for text (special for goals (LL, LD, ...))
#let textFigure(short, body) = {
  context {
    let count = counter(figure.where(kind: short)).get().at(0) + 1
    let label_name = short + " " +  str(count) + "0"
    
    [#figure(kind: short, supplement: short, body) #label(label_name)]
  }
}

= Analyse des Lastenhefts
== Einleitung <chapter-Einleitung>
#include "original/1.0_Einleitung.typ"

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
  Aufträge, Baumaschinen und Personalzuordnungen liegen bisher in Excel-Listen. Die Software soll Anlegen und Suchen von Aufträgen, Buchung von Baumaschinen und Zuordnung von Mitarbeitern zu Projekten zentral ermöglichen.
]
#QaA[Welches vorhandene Softwarewerkzeug wird aktuell für die Verwaltung eingesetzt?][
  Eine ältere Desktop-Anwendung mit lokaler Datenbank, ergänzt um diverse Excel-Tabellen.
]
#QaA[Welche positiven und negativen Erfahrungen gab es mit der bisherigen Software, die im neuen System berücksichtigt werden sollen?][
  Positiv bewertet und beizubehalten: die übersichtliche Darstellung der Auftragsdaten und die einfache Mitarbeitersuche. Negativ: die Software war langsam, nur an einem Arbeitsplatz bedienbar und bot keinen mobilen Zugriff; ohne zentrale Datenhaltung wurden Daten teilweise doppelt gepflegt.
]
#QaA[Wie kamen technisch weniger versierte Mitarbeiter mit der bisherigen Software zurecht und welche Bedienungsprobleme traten dabei regelmäßig auf?][
  Vorarbeiter und Bauleiter hatten Schwierigkeiten mit der unübersichtlichen Menüstruktur und befüllten häufig falsche Eingabefelder. Die neue Software soll deshalb klare, einfache Eingabemasken bieten.
]
#QaA[Was genau wird unter einer "intuitiven, leicht bedienbaren Benutzeroberfläche" verstanden - soll die neue Oberfläche nach einem bestimmten Gestaltungsprinzip aufgebaut sein (z.B. möglichst wenige Klicks, alle wesentlichen Informationen auf einen Blick)?][
  Die wichtigsten Informationen (Aufträge, Baumaschinen, Mitarbeiter) sollen von einer zentralen Übersichtsseite aus erreichbar sein. Maximal drei Klicks bis zur gewünschten Information. Keine Kommandozeile oder technische Fehlermeldungen.
]
#QaA(labelName: "plattformunabhängige Lösung")[Wie stellt man sich die plattformunabhängige Lösung konkret vor - soll es eine native Desktop-Anwendung mit Java, eine Web-Applikation oder eine hybride Lösung sein?][
  Es soll eine Java-Desktop-Anwendung sein, die plattformunabhängig auf Windows, Linux und macOS läuft #referenceQ("q_Leistung-PC"). Für das spätere Tablet-Projekt wird eine separate Web- oder App-Lösung in Betracht gezogen.
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
#QaA[Gibt es gesetzliche oder branchenspezifische Vorschriften (z.B. Datenschutz, Baurecht, Aufbewahrungsfristen), die bei der neuen Verwaltungssoftware zwingend berücksichtigt werden müssen?][
  Ja, alle Auftragsdaten müssen gemäß gesetzlicher Aufbewahrungsfristen mindestens 10 Jahre verfügbar bleiben. Personenbezogene Mitarbeiterdaten unterliegen den Datenschutzbestimmungen (DSGVO).
]

#QaA(labelName: "Eigenschaften-Fahrzeuge")[Welche Eigenschaften müssen Fahrzeuge im System haben?][
  Fahrzeuge werden im System als "Baumaschinen" bezeichnet.]
#QaA[Welche Eigenschaften müssen Rechnungen im System haben?][
  Rechnungen umfassen folgende Attribute:
  #entityFigure("Rechnung", arguments(
    [Rechnungsnummer], [Ganzzahl], [Eindeutige ID, automatisch vergeben],
    [Auftrag], [Referenz], [Referenz auf zugehörigen Auftrag],
    [Betrag], [Dezimalzahl], [Rechnungsbetrag],
    [Fälligkeitsdatum], [Datum], [Fälligkeitsdatum der Rechnung],
    [Status], [Text], [Offen, bezahlt, überfällig (aus dem Finanzbuchhaltungssystem übernommen)],
    [Dokument], [Referenz], [Referenz auf zugehörige Rechnungs-PDF aus dem Finanzbuchhaltungssystem #referenceQ("q_Dokument-Entitaet")],
  ))
]
#QaA[Können einem Arbeitsauftrag mehrere Rechnungen zugeordnet sein?][
  Ja, üblicherweise gibt es zu einem Auftrag mehrere Rechnungen (z.B. Teil- und Schlussrechnungen). Jede Rechnung gehört dabei zu genau einem Auftrag. Die Rechnungen werden aus dem Finanzbuchhaltungssystem übernommen und sollen in der Auftragsdetailansicht einsehbar sein.
]


== Lastenheft
=== Zielsetzung
#include "original/2.1_Zielsetzung.typ"

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
  Maximal 5 zeitgleiche Zugriffe. Ein Offline-Betrieb mit Synchronisation bei Rückkehr ins Büro ist vorgesehen, sodass auch ohne aktive Verbindung gearbeitet werden kann.
]
#QaA[[INTERN] Soll eine bestimmte Sicherheit beim Zugriff von außen existieren?][
  Der Server läuft im internen Firmennetz ohne öffentliche Internet-Exposition. Der spätere Tablet-Zugriff erfolgt über gesichertes VPN mit Offline-First-Synchronisation (siehe oben).
]
#QaA[Auf welche Teile des Systems soll zugegriffen werden dürfen (Siehe Rollen)?][
  Der Zugriff richtet sich nach den Benutzerrollen:
  - Verwaltung Vollzugriff auf Verwaltungsdaten
  - Bau-/Projektleiter haben Vollzugriff auf projektbezogene Daten
  - Vorarbeiter haben Lesezugriff auf ihre Arbeitsaufträge
  - Administrator hat Vollzugriff auf alles
  @chapter-Zielgruppe-Rollen
]
#QaA[Sollen alle Daten vom Tablet aus auf der Baustelle verfügbar sein?][
  Nein. Lesend: Auftragsdaten (Termine, Einsatzort, beteiligte Personen), Baumaschinenstandorte und Baupläne. Schreibzugriff nur auf projektbezogene Daten der eigenen Projekte.
]
#QaA(labelName: "Import-Format")[Welche Formate der Daten sollen im Import bevorzugt werden?][
  CSV-Dateien (Semikolon-separiert, UTF-8) als primäres Importformat -- lesbar und einfach zu verarbeiten.
]

#codefigure(caption: "Beispiel für das Importformat")[ 
  #set text(size: 11pt)
    ```csv
  Mitarbeiternummer;Vorname;Nachname;Geburtsdatum;Email;Position;Rolle
  1001;Max;Mustermann;1985-03-15;max.mustermann@bau.de;Bauleiter;BAU_PROJEKTLEITER
  1002;Anna;Schmidt;1990-07-22;anna.schmidt@bau.de;Verwaltungsmitarbeiter;VERWALTUNGSMITARBEITER
  ```
]

#QaA(labelName: "Export-Format")[Welche Formate der Daten sollen im Export bevorzugt werden?][
  Ebenfalls CSV, zur Kompatibilität mit anderen Systemen.
]
#QaA(labelName: "Import-Export-Daten")[Welche Daten sollen genau Importiert bzw. Exportiert werden?][
  Import: alle importierbaren Altsystemdaten (Auftrags-, Mitarbeiter-, Baumaschinen- und Werkzeugdaten, Gruppenzuordnungen). Export: selektiver CSV-Export einzelner Datensätze (z.B. Aufträge, Mitarbeiterlisten) für Berichte oder Backups.
]
#QaA[Gibt es Daten, die nicht aus dem alten System übertragen werden sollen?][
  Finanztechnische Daten (Gehälter, Löhne, Projektkosten) werden nicht übertragen, da sie im separaten Finanzbuchhaltungssystem verwaltet werden.
]
#QaA(labelName: "Export-Verschlüsselung")[[INTERN] Sollen die Exportdaten verschlüsselt werden?][
  Nein, eine Verschlüsselung der Exportdaten ist nicht erforderlich. Die Dateien werden nur intern verwendet.
]

=== Anwendungsbereiche
#include "original/2.2_Anwendungsbereiche.typ" 

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
  Mitarbeiter- und Gruppendaten, Aufträge und Projekte, Baumaschinen und Werkzeuge mit Standorten/Lagerorten, Buchungen, Anwesenheitszeiten und Bilder (genaue Definition: @verwalteten-Objekte).
]
#QaA[Welche relevanten Informationen sollen über Arbeitsaufträge dargestellt werden? ][
  Auftragsbezeichnung, zugehöriges Projekt, Start-/End-/Zwischentermine, beteiligte Personen und Gruppen, gebuchte Baumaschinen, Einsatzort, Status sowie zugeordnete Dokumente #referenceQ("q_Dokument-Entitaet") (genaue Definition: @e_Arbeitsauftrag).
]
#QaA[Sollen die Bauleiter über weitere Endgeräte auf das System zugreifen können? ][
  Nur über Tablets und Laptops vor Ort auf den Baustellen.
]


=== Zielgruppen, Benutzerrollen und Verantwortlichkeiten <chapter-Zielgruppe-Rollen>
#include "original/2.3_Zielgruppen-Benutzerrollen-Verantwortlichkeiten.typ"

#QaA[Welche Rollen soll es geben?][
    Es gibt folgende Rollen:
    #figure(table(columns: 2, align: left,
    [*Rolle*], [*Berechtigung*],
    [Administrator], 
      [
        - Vollzugriff auf alle Daten, Systemverwaltung, Benutzer- und Rollenzuweisung, Backup, Import/Export
      ],
    [Verwaltungsmitarbeiter], 
      [
        - Vollzugriff auf Mitarbeiterstammdaten und Gruppenzuordnungen
        - Vollzugriff auf Geräteverwaltung
        - Leserechte auf projektbezogene Daten
      ],
    [Bau-/Projektleiter], 
      [
        - Vollzugriff auf Projekte, Arbeitsaufträge, Buchungen
        - Bearbeitungsrechte auf Geräte
        - volle Einsicht in den Terminplaner
      ],
    [Vorarbeiter],
      [
        - Lesezugriff auf Arbeitsaufträge, Geräte und Terminplaner mit den für ihre Arbeit relevanten Informationen; einfache Bauarbeiter erhalten dieselbe Rolle mit denselben lesenden Rechten

      ],
  ), caption: "Berechtigungen")<Rolle-Berechtigungen>

  Die Rolle wird -- da das Rollensystem fest vorgegeben ist und zur Laufzeit weder erweitert noch verändert werden soll -- modellierungstechnisch als Enumeration umgesetzt. Sie ist ausschließlich der Zugriffssteuerung zugeordnet und darf nicht mit dem Analysemuster "Rolle" der Vorlesung (mehrere benannte Assoziationen einer Person zu verschiedenen Bezugsobjekten) verwechselt werden.

  #entityFigure("Rolle", arguments(
    [`ADMINISTRATOR`], [Enum-Wert], [Vollzugriff auf alle Daten, Systemverwaltung, Import/Export, Backup],
    [`VERWALTUNGSMITARBEITER`], [Enum-Wert], [Vollzugriff auf Verwaltungsdaten, Leserechte auf projektbezogene Daten],
    [`BAU_PROJEKTLEITER`], [Enum-Wert], [Vollzugriff auf Projekte, Arbeitsaufträge und Buchungen],
    [`VORARBEITER`], [Enum-Wert], [Lesezugriff auf Arbeitsaufträge, Geräte und Terminplaner],
  ))

  Die *fachliche Tätigkeit* eines Mitarbeiters (Projektleiter, Bauleiter, Baugruppenleiter, Vorarbeiter, Bauarbeiter, Verwaltungsmitarbeiter) wird davon getrennt als Enumeration `Position` modelliert und ist ein Attribut der Klasse `Mitarbeiter`. Eine Sonderrolle `MITARBEITER` als Berechtigungsstufe existiert bewusst nicht; Bauarbeiter ohne Verwaltungsaufgaben erhalten die Rolle `VORARBEITER` mit Lesezugriff auf die für sie relevanten Daten.
]

#QaA(labelName: "Attribute-Mitarbeiter")[Welche Attribute soll ein Mitarbeiter haben?][
  Mitarbeiter und Unterauftragnehmer teilen gemeinsame Personenstammdaten. Diese werden in der abstrakten Basisklasse `Person` zusammengefasst, von der beide erben:

  #entityFigure("Person", arguments(
    [Vorname], [Text], [Vorname der Person],
    [Nachname], [Text], [Nachname der Person],
    [Telefonnummer], [Text], [Telefonnummer],
    [E-Mail], [Text], [E-Mail-Adresse],
    [Adresse], [Referenz], [Referenz auf Adresse]
  ))

  Ein Mitarbeiter erbt von `Person` und ergänzt folgende Attribute:

  #entityFigure("Mitarbeiter", arguments(
    [Mitarbeiternummer], [Ganzzahl], [Eindeutige ID, automatisch vergeben],
    [Geburtsdatum], [Datum], [Geburtsdatum des Mitarbeiters],
    [Position], [Text], [Projektleiter, Bauleiter, Baugruppenleiter, Vorarbeiter, gelernter/ungelernter Bauarbeiter, Verwaltungsmitarbeiter],
    [Beschäftigungsort], [Text], [Büro oder Baustelle],
    [Vertragsbeginn], [Datum], [Beginn des Arbeitsverhältnisses],
    [Vertragsende], [Datum], [Ende des Arbeitsverhältnisses (optional)],
    [Rolle], [Enum-Wert], [Berechtigungsstufe vom Typ der Enumeration `Rolle` (`ADMINISTRATOR`, `VERWALTUNGSMITARBEITER`, `BAU_PROJEKTLEITER`, `VORARBEITER`)],
  ))
]
#QaA[Hat eine Person genau eine Adresse oder können auch mehrere Adressen hinterlegt werden (z.B. Haupt- und Zweitwohnsitz)?][
  Genau eine. Für Lohnzettel und Korrespondenz reicht die Hauptadresse aus. Bei einem Umzug wird die alte Adresse ersetzt, nicht zusätzlich gespeichert.
]
#[#set text(fill: answerColor)
  Eine Adresse umfasst folgende Attribute (wird von Personen und Lagern, referenziert):

  #entityFigure("Adresse", arguments(
    [Straße], [Text], [Straßenname],
    [Hausnummer], [Text], [Hausnummer],
    [PLZ], [Text], [Postleitzahl],
    [Ort], [Text], [Stadt/Ortschaft],
    [Land], [Text], [Optional: Deutschland (Standard)],
  ))

  Intern: Die Datentypen "Text" und "Ganzzahl" entsprechen in Java String und int bzw. Integer. "Referenz" bedeutet eine Objektreferenz bzw. Fremdschlüssel in der Datenbank.
]

#QaA(labelName: "Aufgabe-Verwaltung-Admin")[Soll es Mitarbeiter geben, die nur für die Verwaltung der Daten angestellt sind?][
  Ja, die Verwaltungsmitarbeiter im Büro sind primär für die Datenpflege zuständig; dedizierte Datenbankadministratoren gibt es nicht. Intern: "Verwaltungsmitarbeiter" ist sowohl Position (Mitarbeitertyp) als auch Benutzerrolle (Zugriffskontrolle) und wird der Gruppe "Verwaltung" zugeordnet.
]
#QaA[Wie sollen die Berechtigungen umgesetzt werden? Soll es ein bestimmtes Rollensystem geben?][
  Ja, es soll ein festes Rollensystem mit vier vordefinierten Rollen geben: Verwaltungsmitarbeiter, Bau-/Projektleiter, Vorarbeiter und Administrator. Die Rollen sind fest vorgegeben und nicht konfigurierbar.@e_Rolle
]
#QaA[Wer soll genau zur "Verwaltung" zählen - nur Büromitarbeiter oder auch Bau- und Projektleiter im Büro? ][
  Zur Verwaltung zählen ausschließlich die Verwaltungsmitarbeiter im Büro. Bau- und Projektleiter haben eine eigene Rolle mit anderen Rechten.
]
#QaA[Was sollen "reine Verwaltungsdaten" konkret sein - welche Daten fallen darunter, welche sind ausgeschlossen? ][
  Verwaltungsdaten umfassen: Mitarbeiterstammdaten, Gruppenzuordnungen, Gerätedaten und Bilder. Ausgeschlossen sind projektbezogene Daten wie Projekte und Arbeitsaufträge.
]
#QaA(labelName: "Verwaltungsmitarbeiter-Leserecht-Projektdaten")[Sollen Verwaltungsmitarbeiter auf projektbezogene Daten nur Leserechte oder auch Schreibzugriff haben? ][
  Verwaltungsmitarbeiter haben auf projektbezogene Daten nur Leserechte. Schreibzugriff auf Projekte und Aufträge haben nur Bau-/Projektleiter und der Administrator. Ausnahme ist die Geräteverwaltung, wo Verwaltungsmitarbeiter Vollzugriff haben.
]
#QaA[Soll ein Bau-/Projektleiter Vollzugriff auf alle oder nur auf seine eigenen Projekte haben? ][
  Vollzugriff auf alle projektbezogenen Daten, nicht nur die zugeordneten -- dies ermöglicht Projektzusammenarbeit und Vertretung.
]
#QaA(labelName: "Vorarbeiter-zukünftige-Arbeitsaufträge")[Soll ein Vorarbeiter nur aktuelle Arbeitsaufträge einsehen oder auch vergangene und zukünftige Arbeitsauträge? ][
  Ein Vorarbeiter kann seine aktuellen und zukünftigen Arbeitsaufträge einsehen. Vergangene abgeschlossene Aufträge sind ebenfalls lesbar.
]
#QaA(labelName: "Rollen-gleichzeitig")[Soll eine Person mehrere Rollen gleichzeitig haben können, und sollen dann die kombinierten Rechte gelten? ][
  Nein, jeder Benutzer hat genau eine Rolle. Ein Projektleiter, der auch Verwaltungsaufgaben übernimmt, erhält die Rolle mit den höheren Rechten.
]
#QaA[Wer soll die Benutzerkonten und Rollenzuweisungen verwalten - ausschließlich der Administrator? ][
  Ja, ausschließlich der Administrator verwaltet Benutzerkonten und weist Rollen zu.
]
#QaA(labelName: "dedizierte-IT-Person")[Soll der Administrator eine dedizierte IT-Person oder ein normaler Mitarbeiter mit Zusatzrechten sein? ][
  Der Administrator ist ein Verwaltungsmitarbeiter mit erweiterten Rechten. Eine dedizierte IT-Person ist nicht vorgesehen.
]
#QaA[Sollen die Rollen fest vordefiniert sein oder soll der Administrator neue Rollen konfigurieren können? ][
  Der Administrator kann keine neuen Rollen erstellen #referenceQ("q_Rollen-gleichzeitig").
]
#QaA[Welche charakteristischen Daten sollen Projekte verwalten? ][
  Ein Projekt umfasst folgende Attribute:

  #entityFigure("Projekt", arguments(
    [Projektnummer], [Ganzzahl], [Eindeutige ID, automatisch vergeben],
    [Projektname], [Text], [Bezeichnung des Projekts],
    [Projektleiter], [Referenz], [Referenz auf Mitarbeiter (Projektleiter)],
    [Einsatzort], [Referenz], [Referenz auf Adresse der Baustelle],
    [Termine], [Referenz], [Genau ein Starttermin und ein Endtermin (Multiplizität 2). Zwischentermine werden auf Projektebene nicht modelliert, sondern ergeben sich aus den Terminen der zugehörigen Arbeitsaufträge.],
    [Beschreibung], [Text], [Detaillierte Projektbeschreibung],
    [Dokumente], [Referenz], [Liste übergeordneter Projektdokumente (z.B. Projektpläne, Verträge) #referenceQ("q_Dokument-Entitaet")],
    [Status], [Enum-Wert], [Wert der Enumeration `ProjektStatus` (`GEPLANT`, `LAUFEND`, `ABGESCHLOSSEN`); die auftragsspezifischen Zustände `PAUSIERT`, `VERZUG` und `ARCHIVIERT` treten auf Projektebene bewusst nicht auf, da die entsprechende Semantik nur einzelnen Arbeitsaufträgen zukommt],
  ))
]
#QaA[Wie viele Projektleiter hat ein Projekt? Kann ein Projekt zeitweise auch ohne Projektleiter sein?][
  Genau einen, direkt beim Anlegen zugewiesen; ein Projekt ohne Projektleiter gibt es nicht. Ein Projektleiter kann mehrere Projekte gleichzeitig leiten. Zwischentermine werden auf Projektebene nicht angelegt, sondern ergeben sich aus den Terminen der Arbeitsaufträge.
]
#QaA(labelName: "charakteristischen-Daten")[Welche charakteristischen Daten sollen Arbeitsaufträge verwalten? ][
  Ein Arbeitsauftrag umfasst folgende Attribute:

  #entityFigure("Arbeitsauftrag", arguments(
    [Auftragsnummer], [Ganzzahl], [Eindeutige ID, automatisch vergeben],
    [Auftragsbezeichnung], [Text], [Kurzbeschreibung des Auftrags],
    [Projekt], [Referenz], [Referenz auf zugehöriges Projekt],
    [Dokumente], [Referenz], [Liste zugeordneter Dokumente (Baupläne, Kostenvoranschläge, Angebote, Mahnungen) #referenceQ("q_Dokument-Entitaet")],
    [Mitarbeiter], [Referenz], [Liste der beteiligten Mitarbeiter (Multiplizität 1..\*; mindestens ein Mitarbeiter muss zugeordnet sein)],
    [Einsatzort], [Referenz], [Referenz auf Adresse der Baustelle],
    [Termine], [Referenz], [Liste aller Termine des Auftrags (Multiplizität 2..\*; mindestens ein Starttermin und ein Endtermin vom Typ 'Starttermin' bzw. 'Endtermin' sind Pflicht, Zwischentermine optional)],
    [Status], [Enum-Wert], [Wert der Enumeration `AuftragStatus` (`OFFEN`, `IN_ARBEIT`, `PAUSIERT`, `VERZUG`, `ABGESCHLOSSEN`, `ARCHIVIERT`); `ARCHIVIERT` realisiert das logische Löschen gemäß LL 20],
    [Bemerkung], [Text], [Zusätzliche Hinweise],
  ))
]
#QaA[Kann ein Arbeitsauftrag ohne beteiligte Mitarbeiter existieren?][
  Nein, mindestens ein Mitarbeiter ist Pflicht (Multiplizität 1..\*). Die Referenz zeigt auf konkrete Mitarbeiter-Instanzen, nicht auf `Person`, da nur angestellte Mitarbeiter -- keine externen Unterauftragnehmer -- Arbeitsaufträge erhalten.
]
#QaA[Muss jeder Arbeitsauftrag einen Start- und Endtermin haben?][
  Ja, genau ein Start- und ein Endtermin sind Pflicht (Multiplizität 2..\*), Zwischentermine optional. Der Typ wird über das Attribut _Typ_ der Termin-Entität unterschieden und auf Anwendungsebene erzwungen.
]
#QaA[Wie hängen Projekte und Arbeitsaufträge zusammen?][
  Die Zuordnung ist 1:n: Ein Projekt enthält einen oder mehrere Arbeitsaufträge, jeder Auftrag gehört zu genau einem Projekt. Ein neu angelegtes Projekt kann zunächst ohne Aufträge existieren; ein Auftrag ohne Projekt ist nicht zulässig. Mehrere Projekte pro Auftrag sind nicht vorgesehen -- stattdessen kann ein Arbeitsauftrag mehrere Unteraufträge enthalten #referenceG("LF 40").
]
#QaA[Was passiert mit den Arbeitsaufträgen, wenn ein Projekt gelöscht wird?][
  Sie werden mitgelöscht (Komposition), da ein Arbeitsauftrag ohne Projekt nicht existieren kann. In der Praxis werden Projekte aber als abgeschlossen markiert statt gelöscht -- die Daten bleiben gemäß 10-Jahres-Frist erhalten #referenceG("LL 20").
]
#QaA[Kann ein Mitarbeiter gleichzeitig in mehreren Arbeitsaufträgen mitarbeiten?][
  Ja. Ein Mitarbeiter kann mehreren Arbeitsaufträgen zugewiesen sein. Außerdem soll jeder Mitarbeiter (insbesondere Vorarbeiter) in der Anwendung sehen können, welche Arbeitsaufträge ihm zugewiesen sind #referenceQ("q_Vorarbeiter-zukünftige-Arbeitsaufträge").
]
#QaA[Sollen Mitarbeiter eine Mitarbeiternummer haben? ][
  Ja, jeder Mitarbeiter erhält eine eindeutige Mitarbeiternummer, die automatisch vom System vergeben wird #referenceQ("q_Attribute-Mitarbeiter")
]
#QaA[Wie soll die Anmeldung funktionieren (Zertifikat, Passwort, 2FA)? ][
  Aufgrund der Vereinfachung nicht weiter betrachtet.
]

=== Zusammenspiel mit anderen Systemen
#include "original/2.4_Zusammenspiel-mit-anderen-Systemen.typ"

#QaA[Wie lange soll die alte Software parallel betrieben werden - bis zur vollständigen Datenmigration oder darüber hinaus?][
  Bis die Datenmigration abgeschlossen ist und das neue System stabil läuft; vorgesehen ist eine Überlappungsphase von ca. 2-4 Wochen.
]
#QaA[Soll die Anforderung "keine externe Netzverbindung" für alle Arbeitsplätze, oder nur für bestimmte gelten?][
  Die Anforderung gilt für alle Bürorechner im Bürogebäude. Der Zugriff von außen (Tablet-Projekt) ist nicht Teil des ersten Entwicklungsauftrags.
]
#QaA[Soll es weitere finanzbezogene Daten geben, die beachter werden sollen?][
  Nein. Gehälter, Löhne und Projektkosten werden im separaten Finanzbuchhaltungssystem verwaltet. Nur Rechnungen, Mahnungen und Kostenvoranschläge werden lesend aus dem Finanzsystem übernommen und im System als `Dokument` modelliert #referenceQ("q_Dokument-Entitaet").
]
#QaA[[INTERN] Über welche Schnittstelle soll das neue System die Finanzdaten (Rechnungen, Mahnungen, Kostenvoranschläge) aus dem Finanzbuchhaltungssystem einlesen?][
  Über einen CSV-Export aus dem Finanzbuchhaltungssystem. Die Schnittstelle ist unidirektional (nur lesen). Die übernommenen Dokumente (Rechnungen, Mahnungen, Kostenvoranschläge) werden über die Entität `Dokument` verwaltet #referenceQ("q_Dokument-Entitaet").
]
#QaA[Wie häufig sollen die Finanzdaten aus dem Buchhaltungssystem synchronisiert werden - in Echtzeit, täglich oder manuell?][
  Die Synchronisation erfolgt manuell durch den Administrator bei Bedarf (z.B. wöchentlich oder nach Rechnungsstellung).
]
#QaA[An wie viele Drucker soll das System angebunden werden, und sollen bestimmte Drucker für bestimmte Dokumente vorgesehen sein?][
  3-5 Netzwerkdrucker im Büro, primär für Rechnungen. Der Drucker wird beim Druckvorgang ausgewählt.
]
#QaA[[INTERN] Wie sollen die Drucker mit den Geräten verbunden werden?][
  Die Drucker werden über das interne Büronetzwerk (LAN) angebunden. Die Java-Anwendung nutzt die Standard-Druckfunktionen des Betriebssystems.
]
#QaA[Soll die mobile Lösung auch offline funktionieren?][
  Ja, zwingend, da auf Baustellen nicht immer eine Verbindung besteht. Synchronisation beim nächsten Verbindungsaufbau (Firmen-WLAN oder VPN).
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
    Folgende charakteristischen Daten sollen verwaltet werden:
    #figure(table(columns: 2, align: left,
      text(..basicForeGround)[*Daten*], text(..basicForeGround)[*Verweis zur Definition*],
      [Person (abstrakt)], [@e_Person],
      [Mitarbeiter], [@e_Mitarbeiter],
      [Rolle], [@e_Rolle],
      [Gruppe], [@e_Gruppe],
      [Adresse], [@e_Adresse],
      [Arbeitsauftrag], [@e_Arbeitsauftrag],
      [Unterauftrag], [@e_Unterauftrag],
      [Unterauftragnehmer], [@e_Unterauftragnehmer],
      [Projekt], [@e_Projekt],
      [Bauplan], [wird gemäß Vereinfachung als Dateipfad innerhalb der Entität #link(label("e_Dokument"))[Dokument] modelliert @chapter-Vereinfachungen],
      [Dokument], [@e_Dokument],
      [Ausrüstung], [@e_Ausrüstung],
      [Geräte-Typ], [@e_Geräte-Typ],
      [Gerät], [@e_Gerät],
      [Lager], [@e_Lager],
      [Termin], [@e_Termin],
      [Buchung], [@e_Buchung],
      [Anwesenheitszeit], [@e_Anwesenheitszeit],
      [Bild], [@e_Bild],
      [Rechnung], [@e_Rechnung],

    ), caption: "Übersicht der Entitäten") <verwalteten-Objekte>
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
  #QaA(labelName: "Gruppenerstellung")[Sollen die Gruppen einmalig festgelegt werden oder sollen sie manuell erstellt werden können? ][
    Die Gruppentypen (Verwaltung, Planung, Projektleitung, Bauleitung, Baugruppen) sind fest vorgegeben. Konkrete Baugruppen können aber von Verwaltungsmitarbeiter dynamisch erstellt und verwaltet werden.
    Eine Gruppe umfasst folgende Attribute:

    #entityFigure("Gruppe", arguments(
      [Gruppennummer], [Ganzzahl], [Eindeutige ID, automatisch vergeben],
      [Gruppenname], [Text], [Name der Gruppe (z.B. "Baugruppe Süd", "Verwaltung")],
      [Gruppentyp], [Text], [Verwaltung, Planung, Projektleitung, Bauleitung, Baugruppe],
      [Gruppenleiter], [Referenz], [Referenz auf Mitarbeiter (optional)],
      [Beschreibung], [Text], [Zusätzliche Informationen zur Gruppe],
    ))

    Die Zuordnung von Mitarbeitern zu Gruppen erfolgt über eine n:m-Beziehung.
  ]
  #QaA[Muss jeder Mitarbeiter zu einer Gruppe gehören oder kann er auch ohne Gruppe geführt werden?][
    Nein, ein Mitarbeiter muss nicht zwingend einer Gruppe zugeordnet sein. Zum Beispiel kann der Administrator oder ein neu eingestellter Mitarbeiter zunächst ohne Gruppe geführt werden, bis die Zuordnung erfolgt.
  ]
  ],
  textFigure(short)[LF 30], [Zu den zentralen Daten eines Auftrags gehören: Projekt- und Baupläne, alle erstellten Angebote, Rechnungen und Mahnungen, Kostenvoranschläge, alle am Auftrag beteiligte Personen, Großgeräte, Einsatzort, Start-, End- und Zwischentermine usw.
  #QaA[Über welche charakteristischen Merkmale sollen die zentralen Daten verfügen? ][
    Siehe @q_charakteristischen-Daten.
  ]
  #QaA[Sollen alle Daten auf einer einzelnen GUI sichtbar sein oder sollen sie weiter unterteilt werden? ][
    Die Hauptinformationen (Bezeichnung, Projekt, Termine, Status) werden in einer Übersicht angezeigt. Detaildaten (Baupläne, beteiligte Personen, Baumaschinen) werden über Tabs oder Detailansichten zugänglich gemacht.
  ]
  #QaA[[INTERN] In welcher Form sollen die Daten vorliegen (einzelne Dateien, Daten in der Datenbank)? ][
    Strukturierte Daten (Aufträge, Mitarbeiter, Buchungen) liegen zunächst in lesbaren Dateien (CSV), später in einer Datenbank. Baupläne und sonstige Auftragsdokumente werden über die Entität `Dokument` #referenceQ("q_Dokument-Entitaet"), Bilder über die Entität `Bild` als separate Dateien im Dateisystem abgelegt und über Dateipfade referenziert #referenceG("LD 10").
  ]
  #QaA(labelName: "Dokument-Entitaet")[Wie sollen Baupläne, Kostenvoranschläge, Angebote, Mahnungen und ähnliche Auftragsdokumente einheitlich verwaltet werden?][
    Sämtliche dokumentartigen Dateien (Baupläne, Kostenvoranschläge, Angebote, Mahnungen, Rechnungs-PDFs) werden über eine zentrale Entität `Dokument` verwaltet und -- analog zu Bildern #referenceG("LF 80") -- als separate Dateien im Dateisystem abgelegt. Das vermeidet redundante Datei-Attribute an mehreren Entitäten. Auf Dokumente verweisen `Arbeitsauftrag`, `Projekt` und `Rechnung`.

    Ein Dokument umfasst folgende Attribute:

    #entityFigure("Dokument", arguments(
      [Dokument-ID], [Ganzzahl], [Eindeutige ID, automatisch vergeben],
      [Titel], [Text], [Vom Benutzer vergebener Titel des Dokuments],
      [Dokumenttyp], [Text], [Bauplan, Kostenvoranschlag, Angebot, Mahnung, Rechnung, Sonstiges],
      [Dateipfad], [Text], [Pfad zur Datei im zentralen Dokumentenverzeichnis],
      [Dateiname], [Text], [Ursprünglicher Dateiname],
      [Format], [Text], [PDF, DOCX, XLSX, TXT],
      [Dateigröße], [Ganzzahl], [Größe in Bytes],
      [Hochladedatum], [Datum], [Datum des Uploads in das System],
      [Hochlader], [Referenz], [Referenz auf Mitarbeiter, der das Dokument hochgeladen hat],
    ))

    Hinweis: Die Klasse `Bild` #referenceG("e_Bild") bleibt davon unberührt, da Bilder eine eigene Anzeigelogik (Galerie, Thumbnails) und gesonderte Anforderungen besitzen #referenceG("LF 80").
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
      Der Unterauftrag erbt das Projekt und den Einsatzort vom Auftrag. Er kann eigene Termine haben. Mitarbeiter und Baumaschinen werden auf Unterauftrags-Ebene nicht zugewiesen, da diese vom externen Unterauftragnehmer selbst gestellt werden.
    ]
    #QaA[Sollen die Unterauftragnehmer ebenfalls separat verwaltet werden? ][
      Ja, externe Unterauftragnehmer werden als Kontaktdaten (Name, Firma, Telefon, E-Mail) verwaltet und können Unteraufträgen zugeordnet werden.
    ]
    #QaA(labelName: "Ansicht-Unteraufträge")[Sollen die Unteraufträge in der Auftrag-GUI verwaltet werden? ][
      Ja, Unteraufträge werden in der Detailansicht des Auftrags angezeigt und können dort erstellt, bearbeitet und gelöscht werden.
    ]
    #QaA[Welche charakteristischen Daten enthält ein Unterauftrag? ][
      Ein Unterauftrag umfasst folgende Attribute:

      #entityFigure("Unterauftrag", arguments(
        [Unterauftragsnummer], [Ganzzahl], [Eindeutige ID, automatisch vergeben],
        [Bezeichnung], [Text], [Kurzbeschreibung des Unterauftrags],
        [Arbeitsauftrag], [Referenz], [Referenz auf den übergeordneten Arbeitsauftrag],
        [Unterauftragnehmer], [Referenz], [Referenz auf genau einen externen Unterauftragnehmer (Pflicht)],
        [Termine], [Referenz], [Liste aller Termine des Unterauftrags (mindestens ein Starttermin und ein Endtermin sind Pflicht, weitere Zwischentermine optional -- analog zum Arbeitsauftrag)],
        [Status], [Enum-Wert], [Wert der Enumeration `AuftragStatus`, analog zum übergeordneten Arbeitsauftrag; `IN_ARBEIT` beschreibt die aktive Bearbeitung durch den Unterauftragnehmer],
        [Kosten], [Dezimalzahl], [Vereinbarter Betrag],
        [Bemerkung], [Text], [Zusätzliche Hinweise],
      ))

    ]
    #QaA[Muss zu jedem Unterauftrag ein Unterauftragnehmer angegeben werden, und kann er an mehrere Firmen vergeben werden?][
      Jeder Unterauftrag wird an genau eine externe Firma vergeben (Pflicht). Sollen zwei Firmen mitwirken, werden zwei getrennte Unteraufträge angelegt -- auch für die Abrechnung übersichtlicher.
    ]
    #QaA[Sollen einem Unterauftrag eigene Mitarbeiter oder Baumaschinen zugewiesen werden?][
      Nein. Der Unterauftragnehmer stellt eigenes Personal und Material; das System speichert nur ihn als Vertragspartner sowie Termine und Kosten.
    ]

    #[#set text(fill: answerColor)
      Ein Unterauftragnehmer erbt von `Person` (Vorname, Nachname, Telefonnummer, E-Mail, Adresse werden von dort übernommen) und ergänzt folgende Attribute:

      #entityFigure("Unterauftragnehmer", arguments(
        [Unterauftragnehmer-ID], [Ganzzahl], [Eindeutige ID, automatisch vergeben],
        [Firmenname], [Text], [Name der Firma],
        [Fachbereich], [Text], [z.B. Elektroinstallation, Sanitär, Heizung],
      ))
    ]

    #QaA[Welche Funktionalitäten soll der Terminplaner konkret bieten? ][
      Anzeige aller Aufträge und Projekte mit ihren Terminen, Filterung nach Datum/Zeitraum, Anzeige von Start-, End- und Zwischenterminen, Übersicht über Ressourcenverfügbarkeit (Geräte, Mitarbeiter).

      Der Terminplan verweist dabei auf einen oder mehrere Termine, wobei diese folgende Attribute umfassen:
      #entityFigure("Termin", arguments(
        [Termin-ID], [Ganzzahl], [Eindeutige ID, automatisch vergeben],
        [Bezeichnung], [Text], [Titel des Termins (z.B. "Starttermin Projekt X")],
        [Typ], [Text], [Starttermin, Endtermin, Zwischentermin],
        [Datum], [Datum], [Konkretes Datum des Termins],
        [Uhrzeit], [Zeit], [Optionale Uhrzeit des Termins],
        [Arbeitsauftrag], [Referenz], [Liste aller Arbeitsaufträge],
        [Projekt], [Referenz], [Liste aller Projekte],
        [Buchung], [Referenz], [Liste aller Buchungen],
      ))
    ]
    #QaA(labelName: "Form-Terminplaner")[In welcher Form soll der Terminplaner vorliegen (Kalender, Zeitleiste)? Wie sollen die Daten im Terminplaner vorliegen (Navigation zu einer weiteren Ansicht, Ansicht der Aufgaben nach Datum sortiert)? ][
      Als Kalenderansicht mit Monats- und Wochenansicht. Arbeitsaufträge und Projekte werden nach Datum sortiert angezeigt. Ein Klick auf einen Eintrag öffnet die Detailansicht.
    ]
    #QaA(labelName: "Rechte-Terminplaner")[Wie sollen die Zugriffsberechtigungen für den Terminplaner verteilt werden. Soll es Beschränkungen für bestimmte Daten geben? ][
      Mitarbeiter und Vorarbeiter haben eingeschränkte Leserechte auf die nötigsten Daten wie die Start- und Endzeiten von ihren Projekten. Verwaltungsmitarbeiter haben vollen Lesezugriff. Schreibrechte haben nur Bau-/Projektleiter und Administrator.
    ]
  ],
  textFigure(short)[LF 50], [Es müssen die Baumaschinen (Bagger, LKWs, Kräne, Rüttler, Großbohrmaschinen, uvm.) sowie größere Bauwerkzeuge (Schalungsteile, Bausicherungen, Zäune, etc.) verwaltet werden. \
  Die Baumaschinen und -werkzeuge haben unterschiedliche Ausrüstungen, nach denen sie bei der Suche unterschieden werden (z.B. Baggerschaufel, Kranzubehör (Behälter, Gewichte, Haken, usw.). \
  Damit Baumaschinen und Geräte planbar zur Verfügung stehen, müssen sie über das System gebucht werden. Die Buchung kann direkt beim Anlegen eines Auftrags geschehen oder auch später bei Bedarf. \
  Alle Baumaschinen und -werkzeuge sind einzelnen Lagern zugeordnet (Plätze und/oder Gebäude auf mehreren Grundstücken). Der momentane Standort muss zur Optimierung der Projektabläufe aktualisiert werden können. \
  Daneben müssen Benutzungszeiträume angegeben werden können, um die Verfügbarkeit eines Geräts zu erhalten. Hier soll z.B. eine Baumaschine nach Ort und Verfügbarkeit gesucht werden können ("welche Maschine steht wann zur Verfügung und ist am nächsten zum Einsatzort?").
  #QaA[Sollen die Arten von Baumaschinen, Bauwerkzeugen und Ausrüstung fest vorgegeben oder dynamisch vom Benutzer änderbar sein?][
    Es gibt vordefinierte Standardkategorien (Bagger, LKW, Kran, Rüttler, Bohrmaschine, Schalungsteil, Zaun, Bausicherung etc.). Der Administrator kann bei Bedarf weitere Kategorien hinzufügen; die Umsetzung erfolgt über ein Kategorieattribut.
  ]

  #QaA(labelName: "Oberbegriff-Gerät")[Gibt es einen Unterschied zwischen "Baumaschine", "Bauwerkzeug" und "Gerät" bzw. ist "Gerät" ein allgemeiner Begriff für Baumaschinen und Bauwerkzeuge?][
    Ja, Gerät wird als Oberbegriff für Baumaschinen und Bauwerkzeuge verwendet, wobei es sich bei Baumaschinen um Fahrzeuge handelt #referenceQ("q_Eigenschaften-Fahrzeuge"). Die Unterscheidung findet im Attribut "Typ" statt.

    Da im Fuhrpark mehrere Geräte desselben Typs existieren (z.B. drei Bagger CAT 320), werden gemeinsame Typ-Eigenschaften in einer separaten Klasse `Geräte-Typ` zusammengefasst. Jedes konkrete Gerät (Exemplar) verweist auf genau einen `Geräte-Typ`. Damit wird vermieden, dass Typ-Attribute wie Bezeichnung und Kategorie bei jedem Exemplar redundant gespeichert werden (Exemplartyp-Muster, siehe @fig-analyse-klassendiagramm).

    Ein Geräte-Typ umfasst folgende Attribute:
  ]

  #[#set text(fill: answerColor)
    #entityFigure("Geräte-Typ", arguments(
      [Geräte-Typ-ID], [Ganzzahl], [Eindeutige ID, automatisch vergeben],
      [Bezeichnung], [Text], [Name des Gerätetyps (z.B. “Bagger CAT 320”)],
      [Typ], [Text], [Baumaschine oder Bauwerkzeug],
      [Kategorie], [Text], [Bagger, LKW, Kran, Rüttler, Bohrmaschine, Schalungsteil, Zaun, Bausicherung],
    ))

    Ein konkretes Gerät (Exemplar) ergänzt folgende Attribute:

    #entityFigure("Gerät", arguments(
      [Gerätenummer], [Ganzzahl], [Eindeutige ID, automatisch vergeben],
      [Geräte-Typ], [Referenz], [Referenz auf Geräte-Typ],
      [Seriennummer], [Text], [Herstellerseriennummer],
      [Lager], [Referenz], [Referenz auf das Lager],
      [Standort], [Text], [Aktueller Standort (falls nicht im Lager)],
      [Status], [Enum-Wert], [Wert der Enumeration `GerätStatus` (`VERFUEGBAR`, `IN_WARTUNG`, `DEFEKT`, `AUSSER_BETRIEB`). Der `GerätStatus` beschreibt ausschließlich dauerhafte technische Zustände; die zeitraumbezogene Belegung eines Geräts wird bewusst *nicht* als Statuswert `GEBUCHT` modelliert, sondern anhand aktiver `Buchung`-Objekte für den jeweiligen Zeitraum ermittelt (siehe LF 50, Verfügbarkeitsprüfung)],
      [Ausrüstung], [Referenz], [Liste der aktuell montierten Ausrüstungsteile \(z.B. Baggerschaufel, Anbauhammer\). Eine Ausrüstung kann am Gerät montiert oder im Lager frei verfügbar sein. Multiplizität 0..\*],
      [Anschaffungsdatum], [Datum], [Datum der Anschaffung],
      [Letzter Wartungstermin], [Datum], [Datum der letzten Wartung],
      [Nächster Wartungstermin], [Datum], [Geplanter nächster Wartungstermin],
    ))

    Die Benutzungszeiträume werden über Buchungen ermittelt.

    Hinweis: Anschaffungsdatum, letzter und nächster Wartungstermin werden als einfaches `Datum` modelliert und nicht als Referenz auf die Entität `Termin`. Wartungsdaten sind reine administrative Metadaten des Geräts und erscheinen nicht im Terminplaner — eine Verknüpfung mit der `Termin`-Entität wäre daher nicht sinnvoll.
  ]

  #QaA[Wie werden Baumaschinen und Bauwerkzeuge unterschieden und welche Kategorien existieren?][
    Beide werden über den Oberbegriff "Gerät" mit derselben Oberfläche verwaltet; die Unterscheidung erfolgt über ein Typ- und Kategorieattribut. Vordefinierte Kategorien: Bagger, LKW, Kran, Rüttler, Bohrmaschine, Schalungsteil, Zaun, Bausicherung; der Administrator kann weitere hinzufügen.
  ]
  #QaA[[INTERN] Sollen die Bauwerkzeuge generisch verwaltet werden?][
    Ja, Baumaschinen und Bauwerkzeuge werden über eine gemeinsame Basisklasse generisch verwaltet. Spezifische Eigenschaften können über Attribute oder eine Vererbungshierarchie abgebildet werden.
  ]
  #QaA[Soll die Ausrüstung für Baumaschinen und Bauwerkzeuge einzeln verwaltet werden oder soll die Ausrüstung ausschließlich über die Suche nach den Geräten verwaltet werden? ][
    Die Ausrüstung (z.B. Baggerschaufel, Kranzubehör) wird als separate Entität verwaltet und kann Baumaschinen zugeordnet werden. Über die Suche kann nach Baumaschinen mit bestimmter Ausrüstung gefiltert werden.

    Eine Ausrüstung umfasst folgende Attribute:

    #entityFigure("Ausrüstung", arguments(
      [Ausrüstungsnummer], [Ganzzahl], [Eindeutige ID, automatisch vergeben],
      [Bezeichnung], [Text], [Name der Ausrüstung (z.B. "Baggerschaufel 1,5m")],
      [Typ], [Text], [Baggerschaufel, Kranzubehör (Behälter, Gewichte, Haken), Anbaugeräte],
      [Kompatibel mit], [Text], [Gerätetypen, mit denen die Ausrüstung kompatibel ist],
      [Gewicht], [Dezimalzahl], [Gewicht in kg],
      [Status], [Text], [Verfügbar, zugeordnet, in Wartung, defekt],
    ))
  ]
  #QaA[Wie hängen Geräte und Ausrüstung zusammen? Gehört die Ausrüstung fest zu einem Gerät oder kann sie ausgetauscht werden?][
    Eine Ausrüstung (z.B. Baggerschaufel oder Anbauhammer) kann an einem passenden Gerät montiert sein, ist aber nicht fest mit ihm verbunden. Sie kann abmontiert und an einem anderen kompatiblen Gerät genutzt werden. Wenn eine Ausrüstung gerade nicht an einem Gerät hängt, liegt sie im Lager. Ein Gerät kann mehrere Ausrüstungsteile gleichzeitig haben (z.B. ein Bagger mit Schaufel und Anbauhammer).
  ]
  #QaA[Was passiert mit der Ausrüstung, wenn das Gerät gebucht wird? Muss sie separat gebucht werden?][
    Wenn ein Gerät gebucht wird, geht die aktuell daran montierte Ausrüstung automatisch mit -- es ist also keine separate Buchung der montierten Teile nötig. Wird eine Ausrüstung später für ein anderes Gerät gebraucht, wird sie umgebaut. Eine Ausrüstung allein (ohne Gerät) wird nicht gebucht.
  ]
  #QaA[Nach welchen Kriterien soll gesucht werden -- auch nach Ausrüstung? ][
    Kombination aus Textsuche (Bezeichnung, Seriennummer) und Filterung nach Kategorie, Standort/Lager und Verfügbarkeit (Zeitraum). Ergänzend kann nach Ausrüstung gefiltert werden, etwa nach Ausrüstungstyp ("Kranzubehör") oder Bezeichnung ("Baggerschaufel").
  ]
  #QaA[Wie soll eine Buchung ablaufen? Was beinhaltet der Prozess (Bestätigung bestimmter Personen, etc.)? ][
    Der Benutzer wählt eine Baumaschine, gibt den Zeitraum (Start- und Enddatum) und den Auftrag an. Das System prüft die Verfügbarkeit. Bei Verfügbarkeit wird die Buchung gespeichert. Eine Bestätigung durch weitere Personen ist nicht erforderlich.

    Eine Buchung umfasst folgende Attribute:

    #entityFigure("Buchung", arguments(
      [Buchungsnummer], [Ganzzahl], [Eindeutige ID, automatisch vergeben],
      [Gerät], [Referenz], [Referenz auf genau ein gebuchtes Gerät -- für mehrere Geräte werden separate Buchungen angelegt],
      [Auftrag], [Referenz], [Referenz auf Arbeitsauftrag],
      [Startdatum], [Datum], [Beginn der Buchung],
      [Enddatum], [Datum], [Ende der Buchung],
      [Gebucht von], [Referenz], [Referenz auf Mitarbeiter (wer hat gebucht)],
      [Buchungsdatum], [Datum], [Datum der Buchungserstellung],
      [Status], [Text], [Aktiv, abgeschlossen, storniert],
    ))
  ]
  #QaA[Wird mit einer Buchung genau ein Gerät gebucht, oder können auch mehrere Geräte gemeinsam in einer Buchung erfasst werden?][
    Genau ein Gerät pro Buchung. Wenn für eine Baustelle mehrere Geräte benötigt werden (z.B. Bagger, Kran und LKW), werden dafür separate Buchungen angelegt. Das ist übersichtlicher und erleichtert die Verfügbarkeitsprüfung sowie die spätere Abrechnung.
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

    #entityFigure("Lager", arguments(
      [Lagernummer], [Ganzzahl], [Eindeutige ID, automatisch vergeben],
      [Lagerbezeichnung], [Text], [Name des Lagers (z.B. "Lager Nord", "Hauptlager")],
      [Typ], [Text], [Platz (Außengelände) oder Gebäude (Lagerhalle)],
      [Adresse], [Referenz], [Referenz auf Adresse (Straße, Hausnummer, PLZ, Ort)],
      [Grundstück], [Text], [Optional: Grundstücksbezeichnung],
      [Kapazität], [Ganzzahl], [Optional: Maximale Anzahl Geräte],
    ))
  ]
  #QaA[Woher soll die Information über das zugehörige Lager erhalten werden (GPS, Eintrag in der GUI, Buchungen)? ][
    Über manuelle Eingabe in der GUI: Beim Anlegen wird das Lager zugeordnet, bei Standortwechsel manuell aktualisiert.
  ]
  #QaA[Soll man in der Lager-Übersicht sehen können, welche Geräte sich aktuell in einem Lager befinden?][
    Ja, die Lagerdetailansicht zeigt alle aktuell zugeordneten Geräte.
  ]
  #QaA[Soll die/ das nächste Baumaschine/ -Werkzeug angezeigt werden?][
    Die Suche zeigt verfügbare Geräte mit ihrem Lagerstandort an. Eine kilometergenaue Berechnung der Distanz zum Einsatzort mit Routing-Diensten oder GPS-Ortung ist ausdrücklich *nicht* gefordert. Optional -- und im GUI-Kapitel als bewusst gewählte Zusatzfunktion ausgewiesen -- kann eine grobe Sortierung nach Entfernung auf Basis der beim Lager hinterlegten statischen Adresse (Postleitzahl-/Ortsvergleich) angeboten werden; ein externer Kartendienst ist dafür nicht erforderlich.
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
  #QaA(labelName: "Anzeige-Suchergebnisse")[In welchem Format sollen die Suchergebnisse angezeigt werden (Tabelle, Suchergebnisliste)? ][
    Als Tabelle mit den wichtigsten Attributen (z.B. Bezeichnung, Kategorie, Status, Standort). Ein Klick auf einen Eintrag öffnet die Detailansicht #referenceQ("q_wesentlichen-Daten").
  ]
  #QaA(labelName: "wesentlichen-Daten")[Was sind die "wesentlichen" Daten, nach denen gesucht werden soll?][
    Mitarbeiter, Gruppen, Aufträge, Projekte, Baumaschinen, Bauwerkzeuge, Lager, Buchungen und Anwesenheitszeiten.

    Entnehme die oben genannten Entitäten aus den in @verwalteten-Objekte aufgelisteten zentralen Daten.
  ] 
  #QaA(labelName: "Sortierung-Suchergebnisse")[Ist eine Sortierung nötig? ][
    Ja, die Suchergebnisse sollen nach verschiedenen Spalten sortierbar sein (aufsteigend/absteigend).
  ]
  #QaA[Welche Suchmasken soll es geben und wie werden sie aufgeteilt?][
    Aufteilung nach Datentyp: eine Maske für Personaldaten (Mitarbeiter, Gruppen), eine für Projektdaten (Aufträge, Projekte) und eine für Ressourcen (Baumaschinen, Werkzeuge, Lager). Spezifischere Daten werden über kleinere, verschachtelte Suchmasken abgedeckt.
  ]
  #QaA(labelName: "Suchmasken")[Wie viele Suchmasken soll es maximal geben? ][
    Maximal große 5 Suchmasken - der Rest wird über spezifische kleinere Suchmasken abgedeckt.
  ]
  #QaA(labelName: "Beschreibung-der-Suche")[Wie soll die Suche erfolgen? Volltextsuche, Suche nach Schlüsselwörtern, Suche nach Kategorien, ... ][
    Kombination aus Textsuche (Name, Bezeichnung) und Filterung nach Kategorien/Attributen (z.B. Status, Datum, Standort). Keine komplexe Volltextsuche erforderlich.
  ]
  ],
  textFigure(short)[LF 70], [Die Auswahl der Daten soll möglichst über (eventuell durchsuchbare) Auswahllisten erfolgen. Dies gilt vor allem für Zuordnungen von Daten zu anderen Daten (z.B. Bau- fahrzeuge und Personen zu Projekten und Arbeitsaufträgen usw.). Die Auswahllisten sollen auf einfache Weise erweiterbar und für sämtliche Mitarbeiter im System verfügbar sein.
  #QaA[Wie sollen Auswahllisten dargestellt werden und wie werden Beziehungen abgebildet? ][
    Als Listen mit einzelnen Objekten (z.B. alle Mitarbeiter, alle Baumaschinen). Beziehungen werden in Detailansichten über Referenzlisten angezeigt (z.B. "Zugeordnete Mitarbeiter", "Gebuchte Baumaschinen"), nicht grafisch visualisiert.
  ]
  #QaA[Welche Such- und Filtermöglichkeiten sollen die Auswahllisten haben und wie werden sie angezeigt? ][
    Textsuche zum Filtern während der Eingabe sowie Kategoriefilter. Darstellung als Dropdown-Menüs mit Suchfunktion oder als scrollbare Listen bei größeren Datenmengen.
  ]
  #QaA[Wie sollen sich die Auswahllisten verhalten (Vorauswahl, Mehrfachauswahl, inaktive Einträge)? ][
    Bei bekannten Zuordnungen (z.B. beim Bearbeiten eines Auftrags) werden zugeordnete Objekte vorausgewählt. Für Zuordnungen zu Aufträgen ist Mehrfachauswahl möglich (z.B. mehrere Mitarbeiter oder Baumaschinen). Gelöschte oder inaktive Einträge werden standardmäßig ausgeblendet, lassen sich aber über einen Filter "Inaktive anzeigen" einblenden.
  ]
  #QaA[Wie sollen die Auswahllisten erweitert werden? ][
    Durch das Anlegen neuer Objekte in der jeweiligen Verwaltungsansicht; neue Einträge werden automatisch in den Auswahllisten verfügbar.
  ]
  #QaA[[INTERN]: Soll es Lazy Loading geben oder sollen alle Daten direkt geladen werden?][
    Bei kleineren Listen (unter 100 Einträge) werden alle Daten direkt geladen. Bei größeren Listen kann Lazy Loading implementiert werden, um die Performance zu verbessern.
  ]
  ],
  textFigure(short)[LF 80], [Allen Elementen sollen beliebig viele Bilder mit Titel zugeordnet werden können, die zentral auf einem Verzeichnis liegen sollen
  #QaA[Was ist ein Element (z.B. auch Terminplaner)? ][
    Ein Element ist jedes verwaltete Objekt (siehe @verwalteten-Objekte).
  ]
  #QaA[Sind alle Elemente gemeint oder sollen nur ausgewählte Elemente über Bilder verfügen? ][
    Primär Aufträge, Projekte, Baumaschinen und Bauwerkzeuge. Mitarbeiter können optional auch Bilder haben (z.B. Profilbilder). Gruppen sind vom Kunden ursprünglich als optional bildfähig genannt worden; da im Datenmodell jedoch keine sinnvolle Anzeigemöglichkeit für ein "Gruppenbild" vorgesehen ist (Gruppen werden ausschließlich über Mitgliederlisten dargestellt), wird auf eine Bildzuordnung für die Klasse `Gruppe` bewusst verzichtet. Diese Reduktion wird im Analyse-Klassendiagramm dadurch sichtbar, dass `Gruppe` kein Untertyp von `Bildbar` ist.

    Buchung, Anwesenheitszeit, Bild, Rechnung und Finanzbuchhaltungssystem können keine Bilder.
  ]
  #QaA[[INTERN] Welche Bildformate sollen, unterstützt werden können? ][
    Standard-Bildformate: JPG, PNG, GIF. PDFs und andere Dateiformate werden nicht über die Bild-Entität, sondern über die Entität `Dokument` verwaltet #referenceQ("q_Dokument-Entitaet").
  ]
  #QaA[Dürfen gleiche Bilder doppelt existieren oder soll es eine zentrale Bildverwaltung geben? Wie werden die Bilder organisiert?][
    Bilder werden zentral in einem Verzeichnis mit eindeutigen Dateinamen gespeichert; mehrere Objekte können dasselbe Bild über den Dateipfad referenzieren. Optional sind Unterverzeichnisse nach Typ oder Projekt möglich.
  ]
  #QaA[Wie sollen die Bilder angezeigt werden? (In einer Galerie, als Thumbnails, ...) ][
    In der Detailansicht als Galerie mit Thumbnails. Ein Klick auf ein Thumbnail öffnet das Bild in voller Größe.
  ]
  #QaA[[INTERN] Welche Informationen sollen in den Bildern enthalten sein (Metadaten)? ][
    Ein Bild umfasst folgende Attribute:

    #entityFigure("Bild", arguments(
      [Bild-ID], [Ganzzahl], [Eindeutige ID, automatisch vergeben],
      [Titel], [Text], [Vom Benutzer vergebener Titel],
      [Dateipfad], [Text], [Pfad zur Bilddatei im Verzeichnis],
      [Dateiname], [Text], [Ursprünglicher Dateiname],
      [Hochladedatum], [Datum], [Datum des Uploads],
      [Hochlader], [Referenz], [Referenz auf Mitarbeiter (Uploader)],
      [Dateigröße], [Ganzzahl], [Größe in Bytes],
      [Format], [Text], [JPG, PNG, GIF],
    ))

    Die Zuordnung des Bildes zum darzustellenden Objekt (Auftrag, Projekt, Gerät, Mitarbeiter) erfolgt bewusst nicht über die Attribute `Element` und `Elementtyp`, wie im Lastenheft-Beispiel skizziert, sondern polymorph über die im Analyse-Klassendiagramm eingeführte Klasse `Bildbar` (siehe @fig-analyse-klassendiagramm). Dadurch entfallen die redundanten Attribute im `Bild`, und die Typinformation ergibt sich zur Laufzeit unmittelbar aus dem konkreten `Bildbar`-Untertyp.
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
  #QaA(labelName: "Erfassung-Anwesenheitszeiten")[Wie sollen die Anwesenheitszeiten erfasst werden? (Manuell, automatisch, durch Stempelkarten, ...) ][
    In der Firma werden Stempelkarten verwendet, die automatisch die Start- und Endzeiten erfassen. Diese Daten werden täglich in das System importiert.
  ]
  #QaA(labelName: "Rechte-auf-Anwesenheitszeiten")[Wer hat Lese- und Schreibrechte für die Anwesenheitszeiten? ][
    Schreibrechte: Administrator \
    Leserechte: Jeder Mitarbeiter kann seine eigenen Zeiten einsehen und der Vorgesetzte kann die Zeiten seiner direkten Mitarbeiter einsehen.
  ]
  #QaA[Wie sollen die Anwesenheitszeiten dargestellt werden? (Nach Tagen, nach Wochen, nach Monaten, nach Stunden, nach Minuten...) ][
    Als Tabelle mit Einträgen pro Tag. Anzeigemöglichkeiten: nach Tag, Woche oder Monat filtern. Jeder Eintrag zeigt Datum, Startzeit, Endzeit und Gesamtstunden.
  ]
  #QaA[Welche charakteristischen Merkmale sollen die Anwesenheitszeiten enthalten (z.B. Uhrzeit, Dauer, Grund für Abwesenheit, ...)? ][
    Eine Anwesenheitszeit umfasst folgende Attribute:

    #entityFigure("Anwesenheitszeit", arguments(
      [Anwesenheits-ID], [Ganzzahl], [Eindeutige ID, automatisch vergeben],
      [Mitarbeiter], [Referenz], [Referenz auf Mitarbeiter],
      [Datum], [Datum], [Arbeitstag],
      [Startzeit], [Zeit], [Beginn der Arbeitszeit (z.B. 08:00)],
      [Endzeit], [Zeit], [Ende der Arbeitszeit (z.B. 17:00)],
      [Typ], [Text], [Anwesend, Urlaub, Krankheit, sonstige Abwesenheit],
      [Bemerkung], [Text], [Optional: z.B. "Baustelle Projekt X"],
    ))
  ]
  #QaA[Was passiert mit den erfassten Anwesenheitszeiten, wenn ein Mitarbeiter aus dem System entfernt wird?][
    Sie gehören fest zum Mitarbeiter (Komposition) und werden mit ihm aus dem aktiven System entfernt, aus rechtlichen Gründen aber gemäß Aufbewahrungsfrist archiviert statt vernichtet #referenceG("LL 20").
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
  #QaA[Wie soll die Überprüfung erfolgen und welche Merkmale werden berücksichtigt?][
    Automatisch beim Speichern neuer Datensätze. Je nach Datentyp werden geprüft: Mitarbeiter (Vorname + Nachname + Geburtsdatum), Baumaschinen (Seriennummer bzw. Bezeichnung + Kategorie), Aufträge (Bezeichnung + Projekt), Lager (Name + Adresse).
  ]
  #QaA[[INTERN] Was soll passieren, wenn die Daten bereits vorhanden sind, und wer darf ein Duplikat dennoch anlegen?][
    Es wird eine Warnung angezeigt ("Möglicherweise bereits vorhanden: [Vorhandener Eintrag]"). Der Benutzer kann abbrechen, den vorhandenen Eintrag bearbeiten oder -- mit Administratorrechten -- das Duplikat dennoch anlegen.
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
    Der Administrator hat vollen Zugriff auf die Datenbasis #referenceQ("q_dedizierte-IT-Person"). Eine dedizierte IT-Abteilung gibt es nicht.
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
    Verfügbar: Server mit ca. 500 GB Speicher. Benötigt: ca. 100-150 GB (Datenbank: 5-10 GB, Bilder: 20-30 GB, Dokumente wie Baupläne und Kostenvoranschläge als PDF: 50-100 GB #referenceQ("q_Dokument-Entitaet")), abhängig von der Anzahl und Größe der Dokumente.
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
  #QaA(labelName: "10-Jahres-Frist-Ablauf")[Was passiert nach der 10 Jahres Frist? Können die Daten dann gelöscht werden? ][
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

#pagebreak()
 
== Qualitätsanforderung
#include "original/2.8_Qualitätsanforderung.typ"

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
    #QaA(labelName: "automatische-Datensicherung")[Soll das zuverlässige System eine automatische Datensicherung (Backup) in regelmäßigen Intervallen durchführen und wenn ja, in welchem zeitlichen Abstand?][
      Ja, automatische Backups täglich (inkrementell) und wöchentlich (vollständig). Der Administrator kann Backups auch manuell auslösen.
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
      Es reichen die gesetzlichen Anforderungen an Barrierefreiheit (z.B. ausreichende Kontraste, skalierbare Schriftgrößen). Es müssen keine weiteren speziellen Funktionen implementiert werden.
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
