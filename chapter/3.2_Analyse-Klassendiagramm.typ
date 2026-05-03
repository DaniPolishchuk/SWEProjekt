= Analyse-Klassendiagramm

== Uebersicht

Das folgende Analyse-Klassendiagramm modelliert die zentralen Entitaeten der Verwaltungssoftware fuer das Bauunternehmen. Die Modellierung erfolgt auf Analyseebene und orientiert sich an den im Lastenheft definierten Produktfunktionen (LF 10 -- LF 100) sowie den identifizierten Entitaeten aus der Lastenheftanalyse. Saemtliche Referenzen auf andere Objekte werden als Assoziationslinien dargestellt, nicht als Attribute in den Klassen.

Das Diagramm ist in folgende thematische Bereiche gegliedert:
- *Mitarbeiter und Gruppen* (LF 20, LF 90): Personalstammdaten, Rollen, Organisationsstruktur und Anwesenheitszeiten
- *Projekte und Auftraege* (LF 30, LF 40): Projektstruktur, Arbeitsauftraege, Unterauftraege und Terminplanung
- *Finanzdokumente*: Rechnungen (extern, nur lesend aus dem Finanzbuchhaltungssystem)
- *Geraete und Ausruestung* (LF 50): Baumaschinen, Bauwerkzeuge und deren Zubehoer
- *Buchungen* (LF 50): Reservierung und Verfuegbarkeitsverwaltung der Geraete
- *Bilder* (LF 80): Zuordnung von Bilddateien zu allen relevanten Entitaeten
- *Externe Systeme*: Schnittstellen zu Finanzbuchhaltung, Altsystem und Drucker

#figure(image("../assets/klassendiagramm/klassendiagramm.svg", height: 100%), caption: [Analyse-Klassendiagramm der Verwaltungssoftware]) <fig-analyse-klassendiagramm>

== Beschreibung der Klassen

=== Mitarbeiter

Die Klasse `Mitarbeiter` bildet die zentrale Personalentitaet des Bauunternehmens ab. Sie enthaelt alle relevanten Stammdaten wie Mitarbeiternummer, Name, Geburtsdatum, Kontaktdaten (E-Mail, Telefonnummer) sowie die Beschaeftigungsart (Vollzeit oder Teilzeit) und den Vertragszeitraum (LF 20, LF 90). Das Attribut `position` unterscheidet zwischen den im Lastenheft genannten Mitarbeitertypen: Projektleiter, Bauleiter, Baugruppenleiter, Vorarbeiter, gelernter/ungelernter Bauarbeiter und Verwaltungsmitarbeiter.

Die Wohnadresse wird ueber eine unidirektionale Assoziation zur Klasse `Adresse` modelliert. Ebenso verweist jeder Mitarbeiter auf genau eine `Rolle`, die seine Zugriffsrechte im System bestimmt.

=== Adresse

Die Klasse `Adresse` kapselt die Adressinformationen (Strasse, Hausnummer, PLZ, Ort, Land) und wird von mehreren Klassen referenziert: Mitarbeiter (Wohnadresse), Projekte und Arbeitsauftraege (Einsatzort), Lager (Lagerstandort) sowie Unterauftragnehmer (Firmenadresse). Durch diese zentrale Modellierung wird Redundanz vermieden.

=== Rolle

Die Klasse `Rolle` definiert die Benutzerrolle eines Mitarbeiters im System. Die vordefinierten Rollen (Administrator, Verwaltungsmitarbeiter, Bauleiter, Bauarbeiter, Vorarbeiter, Mitarbeiter) bestimmen die Zugriffsrechte gemaess der Berechtigungstabelle aus der Lastenheftanalyse. Jeder Mitarbeiter hat genau eine Rolle.

=== Gruppe

Die Klasse `Gruppe` repraesentiert die Organisationsstruktur des Unternehmens. Gemaess dem Lastenheft (LF 20) existieren mehrere Gruppentypen (Verwaltung, Planung, Projektleitung, Bauleitung, Baugruppe), die ueber das Attribut `gruppentyp` unterschieden werden. Ein Mitarbeiter kann mehreren Gruppen angehoeren, und eine Gruppe kann mehrere Mitarbeiter enthalten (n:m-Beziehung). Jede Gruppe kann optional einen Gruppenleiter haben, der ueber eine unidirektionale Assoziation zur Klasse `Mitarbeiter` referenziert wird.

=== Anwesenheitszeit

Die Klasse `Anwesenheitszeit` erfasst die taeglichen Arbeitszeiten eines Mitarbeiters (LF 90). Sie wird als Komposition der Klasse `Mitarbeiter` modelliert, da Anwesenheitszeiten ohne den zugehoerigen Mitarbeiter keine Daseinsberechtigung haben. Neben dem Arbeitstag und den Start-/Endzeiten erfasst das Attribut `typ` den Grund (Anwesend, Urlaub, Krankheit, sonstige Abwesenheit).

=== Projekt

Die Klasse `Projekt` bildet die uebergeordnete organisatorische Einheit fuer Bauvorhaben ab. Ein Projekt hat einen verantwortlichen Projektleiter (Assoziation zu `Mitarbeiter`), einen Einsatzort (Assoziation zu `Adresse`) sowie Start- und Endtermine. Die Beziehung zu `Arbeitsauftrag` ist als n:m-Beziehung modelliert: Ein Projekt enthaelt einen oder mehrere Arbeitsauftraege, und ein Arbeitsauftrag kann aus mehreren Projekten bestehen.

=== Arbeitsauftrag

Die Klasse `Arbeitsauftrag` enthaelt alle wesentlichen Auftragsdaten (LF 30). Zentrale Attribute sind die Auftragsbezeichnung, der Bauplan (als Dateipfad gemaess Vereinfachung), Start- und Endtermine, der Kostenvoranschlag (aus dem Finanzsystem lesend) und der Status. Dem Arbeitsauftrag werden beteiligte Personen (Assoziation zu `Mitarbeiter`, 1..\*), ein Einsatzort (Assoziation zu `Adresse`) und Zwischentermine (Assoziation zu `Termin`) zugeordnet.

=== Unterauftrag

Die Klasse `Unterauftrag` modelliert die hierarchische Gliederung von Arbeitsauftraegen (LF 40). Unterauftraege werden per Komposition dem uebergeordneten Arbeitsauftrag zugeordnet und koennen einem externen Unterauftragnehmer zugewiesen sein. Sie erben den Einsatzort und das Projekt vom Arbeitsauftrag, koennen aber eigene Termine und Kosten haben.

=== Unterauftragnehmer

Die Klasse `Unterauftragnehmer` verwaltet die Kontaktdaten externer Firmen, die Unterauftraege ausfuehren (LF 40). Sie enthaelt Firmenname, Ansprechperson, Kontaktdaten und Fachbereich und verweist ueber eine Assoziation auf eine `Adresse`.

=== Termin

Die Klasse `Termin` bildet den Terminplaner ab (LF 40, gemaess Vereinfachung als einfache Klasse modelliert). Ein Termin verweist auf die zugehoerigen Arbeitsauftraege, Projekte und Buchungen. Hierdurch wird die im Lastenheft geforderte Uebersicht ueber alle terminrelevanten Daten ermoeglicht.

=== Rechnung

Die Klasse `Rechnung` enthaelt die aus dem Finanzbuchhaltungssystem lesend uebernommenen Rechnungsdaten (Rechnungsnummer, Betrag, Faelligkeitsdatum, Status). Rechnungen sind per Assoziation einem Arbeitsauftrag zugeordnet. Der Zugriff erfolgt unidirektional und ausschliesslich lesend ueber das externe Finanzbuchhaltungssystem.

=== Geraet

Die Klasse `Geraet` bildet den Oberbegriff fuer Baumaschinen und Bauwerkzeuge ab (LF 50). Die Unterscheidung erfolgt ueber das Attribut `typ` (Baumaschine oder Bauwerkzeug) sowie `kategorie` (Bagger, LKW, Kran, Ruettler, Bohrmaschine, Schalungsteil, Zaun, Bausicherung). Jedes Geraet hat eine eindeutige Seriennummer, einen aktuellen Standort (als Text), einen Status (Verfuegbar, gebucht, in Wartung, defekt) sowie Wartungstermine. Die Zuordnung zu einem Lager erfolgt per unidirektionaler Assoziation.

=== Ausruestung (Baugruppe-Muster)

Die Klasse `Ausruestung` modelliert Zubehoerteile, die Geraeten zugeordnet werden koennen (LF 50): Baggerschaufeln, Kranzubehoer (Behaelter, Gewichte, Haken) und Anbaugeraete. Die Zuordnung wird als Aggregation modelliert, da Ausruestungsteile zwischen Geraeten wechseln koennen, aber prinzipiell einem Geraet zugehoeren. Ueber das Attribut `kompatibelMit` wird die Kompatibilitaet mit Geraetetypen dokumentiert.

=== Lager

Die Klasse `Lager` repraesentiert die Lagerorte der Geraete (LF 50). Lager koennen als Platz (Aussengelaende) oder Gebaeude (Lagerhalle) typisiert sein und verfuegen ueber eine Adresse (Assoziation zu `Adresse`), eine optionale Grundstuecksbezeichnung und eine optionale Kapazitaetsangabe. Jedes Geraet ist genau einem Lager zugeordnet.

=== Buchung (Koordinator-Muster)

Die Klasse `Buchung` realisiert das Koordinator-Muster (LF 50). Sie verknuepft ein oder mehrere Geraete mit einem Arbeitsauftrag und traegt eigene Attribute: Buchungszeitraum (Start- und Enddatum), Buchungsdatum und Status (Aktiv, Abgeschlossen, Storniert). Zusaetzlich wird der buchende Mitarbeiter referenziert. Durch die Buchung wird die Verfuegbarkeit der Geraete gesteuert und die im Lastenheft geforderte Verfuegbarkeitssuche ermoeglicht.

=== Bild

Die Klasse `Bild` ermoeglicht die Zuordnung beliebig vieler Bilder mit Titel zu Mitarbeitern, Arbeitsauftraegen, Projekten und Geraeten (LF 80). Bilder werden per Komposition den jeweiligen Elementen zugeordnet. Zusaetzlich wird der hochladende Mitarbeiter als Referenz gespeichert. Die Dateien liegen zentral in einem Verzeichnis und werden ueber den Dateipfad referenziert.

=== Externe Systeme

Die externen Systeme (Finanzbuchhaltung, Altsystem, Drucker) werden als Klassen mit dem Stereotyp `<<extern>>` dargestellt. Die Finanzbuchhaltung greift ueber eine Dependency (gestrichelte Linie) lesend auf Rechnungen zu. Das Altsystem stellt eine Importschnittstelle fuer die Datenmigration bereit. Der Drucker ermoeglicht das Drucken von Dokumenten.

== Eingesetzte Analysemuster

=== Muster: Gruppe

#figure(caption: [Analysemuster Gruppe -- Organisationsstruktur])[
  Die n:m-Beziehung zwischen `Mitarbeiter` und `Gruppe` bildet das Gruppen-Muster ab. Ein Mitarbeiter kann mehreren Gruppen angehoeren, eine Gruppe kann temporaer leer sein. Jede Gruppe kann optional einen Gruppenleiter haben.
]

*Begruendung:* LF 20 fordert explizit: "Eine Gruppe kann dabei mehrere Mitarbeiter beinhalten, ein Mitarbeiter kann mehreren Gruppen angehören." Die Gruppentypen (Verwaltung, Planung, Projektleitung, Bauleitung, Baugruppe) werden ueber ein Attribut `gruppentyp` unterschieden.

=== Muster: Liste

#figure(caption: [Analysemuster Liste -- Kompositionen])[
  Mehrere Kompositionen modellieren das Listen-Muster:
  - Arbeitsauftrag enthaelt 0..\* Unterauftraege
  - Mitarbeiter hat 0..\* Anwesenheitszeiten
  - Mitarbeiter/Arbeitsauftrag/Projekt/Geraet hat 0..\* Bilder
]

*Begruendung:* Die genannten Listenelemente existieren ausschliesslich im Kontext ihres uebergeordneten Objekts und werden bei dessen Loeschung mit entfernt (kaskadierendes Loeschen). Anwesenheitszeiten beispielsweise sind ohne den zugehoerigen Mitarbeiter sinnlos, ebenso Bilder ohne ihr zugeordnetes Element.

=== Muster: Baugruppe

#figure(caption: [Analysemuster Baugruppe -- Geraet mit Ausruestung])[
  Die Aggregation zwischen `Geraet` und `Ausruestung` modelliert physische Baugruppen mit austauschbaren Teilen.
]

*Begruendung:* Das Lastenheft (LF 50) nennt explizit: "Baggerschaufel, Kranzubehör (Behälter, Gewichte, Haken)". Diese Ausruestungsteile koennen zwischen Geraeten ausgetauscht werden (daher Aggregation, nicht Komposition), gehoeren aber stets zu einem Geraet. Die Kompatibilitaet wird ueber das Attribut `kompatibelMit` dokumentiert.

=== Muster: Koordinator (Assoziationsklasse)

#figure(caption: [Analysemuster Koordinator -- Buchung])[
  Die Klasse `Buchung` verknuepft `Geraet` und `Arbeitsauftrag` und traegt eigene Attribute (Zeitraum, Status, buchender Mitarbeiter). Sie realisiert das Koordinator-Muster.
]

*Begruendung:* Die Buchung eines Geraets fuer einen Arbeitsauftrag benoetigt eigene Attribute (Buchungszeitraum, Buchungsstatus, buchender Mitarbeiter), die weder dem Geraet noch dem Auftrag sinnvoll zugeordnet werden koennen. Die Buchung ermoeglicht die im Lastenheft geforderte Verfuegbarkeitssuche und Planbarkeit (LF 50).

=== Muster: Rolle

#figure(caption: [Analysemuster Rolle -- Mitarbeiter und Benutzerrolle])[
  Die Assoziation zwischen `Mitarbeiter` und `Rolle` modelliert die Trennung von Person und Berechtigung.
]

*Begruendung:* Das Lastenheft unterscheidet explizit zwischen verschiedenen Benutzerrollen (Administrator, Verwaltungsmitarbeiter, Bau-/Projektleiter, Vorarbeiter, Mitarbeiter) mit unterschiedlichen Zugriffsrechten. Die Modellierung als separate Klasse `Rolle` erlaubt es, Berechtigungen zentral zu definieren und einem Mitarbeiter genau eine Rolle zuzuweisen.

== Multiplizitaeten und Navigierbarkeit

Gemaess den Kurskonventionen (SWE1) werden folgende Regeln angewendet:
- Multiplizitaeten werden an beiden Enden der Assoziation angegeben
- Unidirektionale Assoziationen (Pfeilspitze) werden bevorzugt
- Bidirektionale Assoziationen nur dort, wo beide Navigationsrichtungen geschaeftlich benoetigt werden (z.B. Mitarbeiter -- Gruppe)
- Kompositionen (gefuellte Raute) kennzeichnen existenzabhaengige Teile
- Aggregationen (leere Raute) kennzeichnen "ist Teil von"-Beziehungen mit eigenstaendiger Existenz der Teile
