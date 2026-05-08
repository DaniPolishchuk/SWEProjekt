= Analyse-Klassendiagramm

== Übersicht

Das folgende Analyse-Klassendiagramm modelliert die zentralen Entitäten der Verwaltungssoftware für das Bauunternehmen. Die Modellierung erfolgt auf Analyseebene und orientiert sich an den im Lastenheft definierten Produktfunktionen (LF 10 -- LF 100) sowie den identifizierten Entitäten aus der Lastenheftanalyse. Sämtliche Referenzen auf andere Objekte werden als Assoziationslinien dargestellt, nicht als Attribute in den Klassen.

Das Diagramm ist in folgende thematische Bereiche gegliedert:
- *Personen und Mitarbeiter* (LF 20, LF 90): Personalstammdaten, Rollen, Organisationsstruktur und Anwesenheitszeiten
- *Projekte und Aufträge* (LF 30, LF 40): Projektstruktur, Arbeitsaufträge, Unteraufträge und Terminplanung
- *Finanzdokumente*: Rechnungen (extern, nur lesend aus dem Finanzbuchhaltungssystem)
- *Geräte und Ausrüstung* (LF 50): Gerätetypen, konkrete Geräteexemplare (Exemplartyp-Muster) und deren Zubehör (Baugruppe-Muster)
- *Buchungen* (LF 50): Reservierung und Verfügbarkeitsverwaltung der Geräte
- *Bilder* (LF 80): Zuordnung von Bilddateien zu allen relevanten Entitäten
- *Externe Systeme*: Schnittstellen zu Finanzbuchhaltung, Altsystem und Drucker

#figure(image("../assets/klassendiagramm/Klassendiagramm.png", width: 100%), caption: [Analyse-Klassendiagramm der Verwaltungssoftware]) <fig-analyse-klassendiagramm>

== Beschreibung der Klassen

=== Person

Die abstrakte Basisklasse `Person` fasst die gemeinsamen Personenstammdaten zusammen, die sowohl für Mitarbeiter als auch für Unterauftragnehmer relevant sind: Vorname, Nachname, Telefonnummer sowie E-Mail-Adresse. Durch diese Abstraktion wird Redundanz in den abgeleiteten Klassen vermieden. `Person` stellt damit das strukturelle Fundament für alle am System beteiligten natürlichen Personen bereit.

=== Mitarbeiter

Die Klasse `Mitarbeiter` erbt von `Person` und erweitert die Personenstammdaten um mitarbeiterspezifische Attribute: Mitarbeiternummer, Geburtsdatum, Position (Projektleiter, Bauleiter, Baugruppenleiter, Vorarbeiter, gelernter/ungelernter Bauarbeiter, Verwaltungsmitarbeiter), Beschäftigungsort, Vertragsbeginn sowie Vertragsende (LF 20, LF 90).

Die Wohnadresse wird über eine unidirektionale Assoziation zur Klasse `Adresse` modelliert. Ebenso verweist jeder Mitarbeiter auf genau eine `Rolle`, die seine Zugriffsrechte im System bestimmt.

Ein Mitarbeiter kann gleichzeitig mehrere benannte Rollen gegenüber anderen Klassen einnehmen: Er kann Projektleiter eines Projekts, Gruppenleiter einer Gruppe, beteiligte Person eines Arbeitsauftrags und buchender Mitarbeiter einer Buchung sein. Diese Mehrfachbeziehungen realisieren das Rollen-Muster (siehe Abschnitt Analysemuster).

=== Adresse

Die Klasse `Adresse` kapselt die Adressinformationen (Straße, Hausnummer, PLZ, Ort, Land) und wird von mehreren Klassen referenziert: `Mitarbeiter` (Wohnadresse), `Projekt` und `Arbeitsauftrag` (Einsatzort), `Lager` (Lagerstandort) sowie `Unterauftragnehmer` (Firmenadresse). Durch diese zentrale Modellierung wird Redundanz vermieden.

=== Rolle (Berechtigungsklasse)

Die Klasse `Rolle` definiert die Benutzerrolle eines Mitarbeiters im System über die Attribute Rollennummer und Name. Die vordefinierten Rollen (Administrator, Verwaltungsmitarbeiter, Bauleiter, Bauarbeiter, Vorarbeiter, Mitarbeiter) bestimmen die Zugriffsrechte gemäß der Berechtigungstabelle aus der Lastenheftanalyse. Jeder Mitarbeiter hat genau eine Rolle. Es handelt sich hierbei um eine Berechtigungsklasse zur Zugriffssteuerung, nicht um das Analysemuster "Rolle" im Sinne der Vorlesung -- dieses wird stattdessen durch die mehreren benannten Assoziationen zwischen `Mitarbeiter` und anderen Klassen realisiert (siehe Abschnitt Analysemuster).

=== Gruppe

Die Klasse `Gruppe` repräsentiert die Organisationsstruktur des Unternehmens. Gemäß dem Lastenheft (LF 20) existieren mehrere Gruppentypen (Verwaltung, Planung, Projektleitung, Bauleitung, Baugruppe), die über das Attribut `Gruppentyp` unterschieden werden. Das Attribut `Beschreibung` ermöglicht eine erläuternde Dokumentation der jeweiligen Gruppe. Ein Mitarbeiter kann mehreren Gruppen angehören, und eine Gruppe kann mehrere Mitarbeiter enthalten (n:m-Beziehung). Jede Gruppe kann optional einen Gruppenleiter haben, der über eine unidirektionale Assoziation zur Klasse `Mitarbeiter` referenziert wird.

Hinweis: Das formale Gruppen-Muster der Vorlesung (Muster 9) ist hier nicht anwendbar, da es als Kerneigenschaft verlangt, dass jedes Einzelobjekt höchstens einer Gruppe angehören darf. LF 20 fordert jedoch explizit eine n:m-Zuordnung. Die Beziehung wird daher als einfache bidirektionale n:m-Assoziation modelliert.

=== Anwesenheitszeit

Die Klasse `Anwesenheitszeit` erfasst die täglichen Arbeitszeiten eines Mitarbeiters (LF 90). Sie wird als Komposition der Klasse `Mitarbeiter` modelliert, da Anwesenheitszeiten ohne den zugehörigen Mitarbeiter keine Daseinsberechtigung haben. Neben der Anwesenheits-ID, dem Arbeitstag und den Start-/Endzeiten erfasst das Attribut `Typ` den Grund (Anwesend, Urlaub, Krankheit, sonstige Abwesenheit). Das optionale Attribut `Bemerkung` ermöglicht die Erfassung ergänzender Informationen, beispielsweise bei Krankheit oder sonstiger Abwesenheit.

=== Projekt

Die Klasse `Projekt` bildet die übergeordnete organisatorische Einheit für Bauvorhaben ab. Attribute sind Projektnummer, Projektname, Beschreibung, Start- und Endtermin sowie Status. Ein Projekt hat einen verantwortlichen Projektleiter (Assoziation zu `Mitarbeiter`) und einen Einsatzort (Assoziation zu `Adresse`). Die Beziehung zu `Arbeitsauftrag` ist als n:m-Beziehung modelliert: Ein Projekt kann null oder mehrere Arbeitsaufträge enthalten (ein neu angelegtes Projekt kann zunächst ohne Aufträge existieren), und ein Arbeitsauftrag kann mehreren Projekten zugeordnet sein.

=== Arbeitsauftrag

Die Klasse `Arbeitsauftrag` enthält alle wesentlichen Auftragsdaten (LF 30). Zentrale Attribute sind die Auftragsnummer, die Auftragsbezeichnung, der Bauplan (als Dateipfad gemäß Vereinfachung), Start- und Endtermin, der Zwischentermin, der Kostenvoranschlag (aus dem Finanzsystem lesend), Status sowie eine Bemerkung. Dem Arbeitsauftrag werden beteiligte Personen (Assoziation zu `Mitarbeiter`, 1..\*) und ein Einsatzort (Assoziation zu `Adresse`) zugeordnet. Über eine Assoziation zu `Termin` werden die dem Auftrag zugeordneten Termine verwaltet.

=== Unterauftrag

Die Klasse `Unterauftrag` modelliert die hierarchische Gliederung von Arbeitsaufträgen (LF 40). Unteraufträge werden per Komposition dem übergeordneten `Arbeitsauftrag` zugeordnet und können einem externen `Unterauftragnehmer` zugewiesen sein. Attribute sind Unterauftragsnummer, Bezeichnung, Start- und Endtermin, Status, Kosten sowie eine optionale Bemerkung. Unteraufträge können eigene Termine und Kosten haben.

=== Unterauftragnehmer

Die Klasse `Unterauftragnehmer` erbt von `Person` und verwaltet die Kontaktdaten externer Firmen, die Unteraufträge ausführen (LF 40). Sie erweitert die Personenstammdaten um Firmenname und Fachbereich und verweist über eine Assoziation auf eine `Adresse`. Durch die Vererbung von `Person` sind Vorname, Nachname, Telefonnummer und E-Mail bereits vorhanden.

=== Termin

Die Klasse `Termin` modelliert einzelne Termine innerhalb der Projektplanung (LF 40, gemäß Vereinfachung als einfache Klasse modelliert). Über unidirektionale Assoziationen kann ein Termin einem `Arbeitsauftrag`, einem `Projekt` oder einer `Buchung` zugeordnet werden. Dadurch wird die im Lastenheft geforderte Übersicht über alle terminrelevanten Daten ermöglicht, ohne Referenzen als Attribute in der Klasse zu speichern.

=== Rechnung

Die Klasse `Rechnung` enthält die aus dem Finanzbuchhaltungssystem lesend übernommenen Rechnungsdaten: Rechnungsnummer, Betrag, Fälligkeitsdatum sowie Status. Rechnungen sind per Assoziation einem `Arbeitsauftrag` zugeordnet. Der Zugriff erfolgt unidirektional und ausschließlich lesend über das externe Finanzbuchhaltungssystem.

=== Geräte-Typ (Exemplartyp-Muster)

Die Klasse `Geräte-Typ` beschreibt die gemeinsamen Eigenschaften gleichartiger Baumaschinen und Bauwerkzeuge (LF 50). Attribute sind Geräte-Typ-ID, Bezeichnung, Typ (Baumaschine oder Bauwerkzeug) sowie Kategorie (Bagger, LKW, Kran, Rüttler, Bohrmaschine, Schalungsteil, Zaun, Bausicherung). Diese Attribute sind für alle Exemplare desselben Typs identisch und werden durch die Trennung in eine eigene Klasse nicht redundant gespeichert.

=== Gerät (Exemplartyp-Muster)

Die Klasse `Gerät` repräsentiert ein konkretes, physisch vorhandenes Geräteexemplar mit individueller Seriennummer (LF 50). Jedes Exemplar verweist über eine unidirektionale Assoziation auf genau einen `Geräte-Typ` und trägt eigene Attribute: Gerätenummer, Seriennummer, Standort (als Text), Status (Verfügbar, Gebucht, In Wartung, Defekt), Anschaffungsdatum, letzter Wartungstermin sowie nächster Wartungstermin. Die Zuordnung zu einem `Lager` erfolgt per unidirektionaler Assoziation. Durch das Exemplartyp-Muster wird vermieden, dass bei mehreren Geräten desselben Typs (z.B. drei Bagger CAT 320) die Typ-Attribute redundant gespeichert werden.

=== Ausrüstung (Baugruppe-Muster)

Die Klasse `Ausrüstung` modelliert Zubehörteile, die Geräten zugeordnet werden können (LF 50): Baggerschaufeln, Kranzubehör (Behälter, Gewichte, Haken) und Anbaugeräte. Attribute sind Ausrüstungsnummer, Bezeichnung, kompatibel-mit (Kompatibilität mit bestimmten Gerätetypen), Gewicht sowie Status. Die Zuordnung wird als Komposition modelliert, da Ausrüstungsteile ohne ein zugehöriges Gerät nicht existenzberechtigt sind -- sie werden stets im Kontext eines konkreten Geräts verwaltet und bei dessen Löschung mitentfernt. Die Multiplizität `0..*` berücksichtigt, dass nicht jedes Gerät zwingend Zubehör besitzt (z.B. ein Rüttler).

=== Lager

Die Klasse `Lager` repräsentiert die Lagerorte der Geräte (LF 50). Attribute sind Lagernummer, Lagerbezeichnung, Typ (Platz oder Gebäude), Grundstück sowie Kapazität. Lager verfügen über eine Adresse (Assoziation zu `Adresse`). Jedes Gerät ist genau einem Lager zugeordnet.

=== Buchung (Koordinator-Muster)

Die Klasse `Buchung` realisiert das Koordinator-Muster (LF 50). Sie verknüpft ein oder mehrere Geräte mit einem `Arbeitsauftrag` und trägt eigene Attribute: Buchungsnummer, Startdatum, Enddatum sowie Status (Aktiv, Abgeschlossen, Storniert). Zusätzlich wird der buchende Mitarbeiter referenziert. Durch die Buchung wird die Verfügbarkeit der Geräte gesteuert und die im Lastenheft geforderte Verfügbarkeitssuche ermöglicht.

=== Bild

Die Klasse `Bild` ermöglicht die Zuordnung beliebig vieler Bilder mit Titel zu Mitarbeitern, Arbeitsaufträgen, Projekten und Geräten (LF 80). Jedes Bild besitzt die Attribute Bild-ID, Titel, Dateipfad, Dateiname, Elementtyp (zur Filterung nach zugeordnetem Objekttyp), Hochladedatum, Dateigröße und Format. Bilder werden per Komposition den jeweiligen Elementen zugeordnet -- dies drückt die Zugehörigkeit aus: Ein Bild existiert nur im Kontext seines zugeordneten Elements und wird bei dessen Löschung mitentfernt. Unabhängig davon verweist die separate Hochlader-Assoziation auf den Mitarbeiter, der das Bild hochgeladen hat. Diese zweite Assoziation ist semantisch verschieden von der Komposition: Während die Komposition die Besitzbeziehung abbildet, dokumentiert die Hochlader-Assoziation lediglich den Urheber des Uploads.

=== Externe Systeme

Die externen Systeme (Finanzbuchhaltung, Altsystem, Drucker) werden als Klassen mit dem Stereotyp `<<extern>>` dargestellt. Die Finanzbuchhaltung greift über eine Dependency (gestrichelte Linie) lesend auf Rechnungen zu. Der Abhängigkeitspfeil zeigt von `Finanzbuchhaltung` zu `Rechnung` und drückt aus, dass die Rechnungsdaten vom externen Finanzbuchhaltungssystem bereitgestellt und durch dieses in das System eingelesen werden -- die Abhängigkeit besteht also in der Leserichtung des externen Systems. Das Altsystem stellt eine Importschnittstelle für die Datenmigration bereit. Der Drucker ermöglicht das Drucken von Dokumenten.

== Eingesetzte Analysemuster

=== Muster: Exemplartyp

#figure(caption: [Analysemuster Exemplartyp -- Geräte-Typ und Gerät])[
  Die Klassen `Geräte-Typ` und `Gerät` realisieren das Exemplartyp-Muster. Gemeinsame Typ-Eigenschaften (Bezeichnung, Typ, Kategorie) werden in `Geräte-Typ` zusammengefasst, während individuelle Instanz-Eigenschaften (Seriennummer, Standort, Status, Wartungstermine) in `Gerät` modelliert werden. Die Assoziation `Gerät "0..*" --> "1" Geräte-Typ` stellt sicher, dass jedes Exemplar genau einem Typ zugeordnet ist.
]

*Begründung:* Das Lastenheft (LF 50) beschreibt einen Fuhrpark mit mehreren Geräten gleichen Typs (z.B. mehrere Bagger CAT 320). Ohne das Exemplartyp-Muster würden Typ-Attribute wie Bezeichnung und Kategorie bei jedem Exemplar redundant gespeichert. Die Aufteilung in Typ- und Exemplarklasse eliminiert diese Redundanz und ermöglicht eine konsistente Verwaltung der Typ-Stammdaten.

=== Muster: Baugruppe

#figure(caption: [Analysemuster Baugruppe -- Gerät mit Ausrüstung])[
  Die Komposition zwischen `Gerät` und `Ausrüstung` (`Gerät "1" *-- "0..*" Ausrüstung`) modelliert physische Baugruppen mit zugehörigen Teilen. Die gefüllte Raute (Komposition) drückt die Existenzabhängigkeit der Ausrüstungsteile aus.
]

*Begründung:* Das Lastenheft (LF 50) nennt explizit Zubehörteile wie Baggerschaufeln und Kranzubehör (Behälter, Gewichte, Haken), die einem konkreten Gerät zugeordnet werden. Die Komposition stellt sicher, dass Ausrüstungsteile nicht ohne zugehöriges Gerät im System existieren können. Die Multiplizität `0..*` (statt des im Muster üblichen `1..*`) berücksichtigt, dass nicht jedes Gerät zwingend Zubehör besitzt -- ein Rüttler oder eine Bohrmaschine hat kein Anbauteil.

=== Muster: Liste

#figure(caption: [Analysemuster Liste -- Kompositionen])[
  Mehrere Kompositionen modellieren das Listen-Muster:
  - `Arbeitsauftrag "1" *-- "0..*" Unterauftrag`
  - `Mitarbeiter "1" *-- "0..*" Anwesenheitszeit`
  - `Mitarbeiter/Arbeitsauftrag/Projekt/Gerät "1" *-- "0..*" Bild`
]

*Begründung:* Die genannten Listenelemente existieren ausschließlich im Kontext ihres übergeordneten Objekts und werden bei dessen Löschung mit entfernt (kaskadierendes Löschen). Anwesenheitszeiten beispielsweise sind ohne den zugehörigen Mitarbeiter sinnlos, ebenso Bilder ohne ihr zugeordnetes Element und Unteraufträge ohne ihren Arbeitsauftrag.

=== Muster: Koordinator (Assoziationsklasse)

#figure(caption: [Analysemuster Koordinator -- Buchung])[
  Die Klasse `Buchung` verknüpft `Gerät` und `Arbeitsauftrag` und trägt eigene Attribute (Buchungszeitraum bestehend aus Start- und Enddatum, Buchungsnummer, Status sowie Referenz auf den buchenden Mitarbeiter). Sie realisiert das Koordinator-Muster als eigenständige Klasse mit Assoziationen zu beiden beteiligten Klassen.
]

*Begründung:* Die Buchung eines Geräts für einen Arbeitsauftrag benötigt eigene Attribute (Buchungszeitraum, Buchungsstatus, buchender Mitarbeiter), die weder dem Gerät noch dem Auftrag sinnvoll zugeordnet werden können. Die Buchung ermöglicht die im Lastenheft geforderte Verfügbarkeitssuche und Planbarkeit (LF 50).

=== Muster: Rolle

#figure(caption: [Analysemuster Rolle -- Mitarbeiter in mehreren benannten Assoziationen])[
  Das Rollen-Muster zeigt sich in den mehreren benannten Assoziationen zwischen der Klasse `Mitarbeiter` und anderen Klassen. Ein Mitarbeiter kann gleichzeitig verschiedene Rollen einnehmen: Projektleiter (`Projekt --> Mitarbeiter`), Gruppenleiter (`Gruppe --> Mitarbeiter`), beteiligte Person (`Arbeitsauftrag --> Mitarbeiter`) und buchender Mitarbeiter (`Buchung --> Mitarbeiter`).
]

*Begründung:* Das Rollen-Muster der Vorlesung (Muster 6) beschreibt die Situation, dass zwischen zwei Klassen mehrere einfache Assoziationen mit unterschiedlicher Semantik existieren. Im vorliegenden Domänenmodell nimmt ein Mitarbeiter gegenüber Projekten, Gruppen, Arbeitsaufträgen und Buchungen jeweils spezifische, benannte Rollen ein. Die separate Klasse `Rolle` (Berechtigungsklasse) dient hingegen ausschließlich der Zugriffssteuerung im System und ist nicht mit dem Analysemuster zu verwechseln.

== Multiplizitäten und Navigierbarkeit

Gemäß den Kurskonventionen (SWE1) werden folgende Regeln angewendet:
- Multiplizitäten werden an beiden Enden der Assoziation angegeben
- Unidirektionale Assoziationen (Pfeilspitze) werden bevorzugt
- Bidirektionale Assoziationen nur dort, wo beide Navigationsrichtungen geschäftlich benötigt werden (z.B. Mitarbeiter -- Gruppe)
- Kompositionen (gefüllte Raute) kennzeichnen existenzabhängige Teile
- Referenzen auf andere Klassen werden ausschließlich als Assoziationslinien modelliert, nicht als Attribute in der Klasse
