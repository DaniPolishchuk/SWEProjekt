= Analyse-Klassendiagramm

== Übersicht

Das Analyse-Klassendiagramm modelliert die zentralen Entitäten der Verwaltungssoftware auf Analyseebene, orientiert an den Produktfunktionen (LF 10 -- LF 100) und den in der Lastenheftanalyse identifizierten Entitäten. Referenzen auf andere Objekte werden als Assoziationslinien dargestellt, nicht als Attribute.

Das Diagramm ist in folgende thematische Bereiche gegliedert, die zur besseren Übersicht farblich hervorgehoben wurden:
- *Personen und Mitarbeiter* (LF 20, LF 90): Personalstammdaten, Rollen, Organisationsstruktur und Anwesenheitszeiten -- dargestellt in *Blau*
- *Projekte und Aufträge* (LF 30, LF 40): Projektstruktur, Arbeitsaufträge, Unteraufträge und Terminplanung -- dargestellt in *Orange*
- *Finanzdokumente*: Rechnungen (extern, nur lesend aus dem Finanzbuchhaltungssystem) -- dargestellt in *Orange*
- *Geräte und Ausrüstung* (LF 50): Gerätetypen, konkrete Geräteexemplare sowie deren Zubehör -- dargestellt in *Grün*
- *Buchungen* (LF 50): Reservierung und Verfügbarkeitsverwaltung der Geräte -- dargestellt in *Grün*
- *Bilder* (LF 80): Zuordnung von Bilddateien zu allen relevanten Entitäten -- dargestellt in *Rot*
- *Externe Systeme*: Schnittstellen zu Finanzbuchhaltung, Altsystem und Drucker -- dargestellt in *Lila*

Klassen, die von mehreren Bereichen genutzt werden (`Adresse`, `Termin`), wurden bewusst ohne Farbmarkierung dargestellt, da sie als Querschnittsklassen keinem einzelnen Bereich eindeutig zugeordnet werden können.

*Hinweis zu den Attributbezeichnungen:* Die im Kapitel "Analyse des Lastenhefts" pro Entität aufgeführten Attributtabellen (etwa @e_Mitarbeiter, @e_Gruppe, @e_Lager) sind für alle Diagramme dieser Arbeit verbindlich. Falls in einer früheren Fassung des exportierten Klassendiagramms noch abweichende Schreibungen (`Geburtstag` statt `Geburtsdatum`, `Beschäftigungsart` statt `Beschäftigungsort`, `Gruppetyp` statt `Gruppentyp`, ein transient gebliebenes `Entwurf`-Attribut bei `Lager`) sichtbar geblieben sind, sind diese durch die zugehörige Entitätstabelle zu ersetzen -- sie stellen redaktionelle Übertragungsfehler dar, keine fachlichen Modelländerungen.

#figure(image("../assets/klassendiagramm/Klassendiagramm.png", width: 100%), caption: [Analyse-Klassendiagramm der Verwaltungssoftware]) <fig-analyse-klassendiagramm>

== Beschreibung der Klassen

*Person*

Die abstrakte Basisklasse `Person` fasst die gemeinsamen Personenstammdaten zusammen, die sowohl für Mitarbeiter als auch für Unterauftragnehmer relevant sind: Vorname, Nachname, Telefonnummer sowie E-Mail-Adresse. Die Adresse wird über eine unidirektionale Assoziation zur Klasse `Adresse` modelliert. Durch diese Abstraktion wird Redundanz in den abgeleiteten Klassen vermieden.

*Mitarbeiter*

Die Klasse `Mitarbeiter` erbt von `Person` und erweitert die Personenstammdaten um mitarbeiterspezifische Attribute wie Mitarbeiternummer, Geburtsdatum, Position (Enumeration `Position` mit den Werten `PROJEKTLEITER`, `BAULEITER`, `BAUGRUPPENLEITER`, `VORARBEITER`, `BAUARBEITER` und `VERWALTUNGSMITARBEITER`), Beschäftigungsort sowie Vertragszeit (LF 20, LF 90). Jeder Mitarbeiter besitzt zusätzlich genau eine Berechtigungsstufe vom Typ der Enumeration `Rolle`, die seine Zugriffsrechte im System bestimmt. Ein Mitarbeiter kann gleichzeitig mehrere benannte Rollen gegenüber anderen Klassen einnehmen: Projektleiter eines Projekts, Gruppenleiter einer Gruppe, beteiligte Person eines Arbeitsauftrags und buchender Mitarbeiter einer Buchung -- diese Mehrfachbeziehungen realisieren das Rollen-Muster der Vorlesung.

*Unterauftragnehmer*

Die Klasse `Unterauftragnehmer` erbt von `Person` und erweitert die Personenstammdaten um Firmenname und Fachbereich (LF 40). Externe Unterauftragnehmer werden ausschließlich als Kontaktdatensatz verwaltet und keinen Arbeitsaufträgen direkt zugeordnet -- stattdessen werden ihnen Unteraufträge zugewiesen.

*Adresse*

Die Klasse `Adresse` kapselt Adressinformationen (Straße, Hausnummer, PLZ, Ort, Land) und wird von mehreren Klassen referenziert: `Person` (Wohnadresse), `Projekt` und `Arbeitsauftrag` (Einsatzort), `Lager` (Lagerstandort). Durch diese zentrale Modellierung wird Redundanz vermieden; `Adresse` ist ein passives Wertobjekt ohne Rückreferenz.

*Rolle (Berechtigungs-Enumeration)*

Die Enumeration `Rolle` definiert die Berechtigungsstufe eines Mitarbeiters im System. Die vordefinierten Werte -- `ADMINISTRATOR`, `VERWALTUNGSMITARBEITER`, `BAU_PROJEKTLEITER` und `VORARBEITER` -- bestimmen die Zugriffsrechte gemäß der Berechtigungstabelle aus der Lastenheftanalyse. Jeder Mitarbeiter hat genau eine Rolle. Diese Enumeration übernimmt konsequent die Sicht des Entwurfsklassendiagramms; sie ist ausschließlich für die Zugriffssteuerung zuständig und nicht mit dem Analysemuster "Rolle" im Sinne der Vorlesung zu verwechseln. Ein zusätzlicher Rollenwert `MITARBEITER` als Berechtigungsstufe existiert bewusst nicht: Einfache Bauarbeiter und Vorarbeiter erhalten dieselbe lesende Berechtigung über den Wert `VORARBEITER`; die fachliche Unterscheidung erfolgt über die davon getrennte Enumeration `Position`.

Die *fachliche Funktion* eines Mitarbeiters im Unternehmen (etwa Projektleiter, Bauleiter, Baugruppenleiter, Vorarbeiter oder Bauarbeiter) wird davon getrennt als Enumeration `Position` modelliert und ist ein Attribut der Klasse `Mitarbeiter`. Dadurch werden Berechtigungen (`Rolle`) und Aufgabenprofil (`Position`) sauber voneinander abgegrenzt: Ein Mitarbeiter kann beispielsweise die Position `BAULEITER` innehaben und gleichzeitig die Rolle `BAU_PROJEKTLEITER` tragen -- die Position spiegelt die fachliche Tätigkeit im Bauunternehmen wider, während die Rolle den systemseitigen Berechtigungsrahmen setzt.

*Gruppe*

Die Klasse `Gruppe` repräsentiert die Organisationsstruktur des Unternehmens. Die Gruppentypen (Verwaltung, Planung, Projektleitung, Bauleitung, Baugruppe) werden über das Attribut `Gruppentyp` unterschieden (LF 20). Ein Mitarbeiter kann mehreren Gruppen angehören, und eine Gruppe kann mehrere Mitarbeiter enthalten (n:m-Beziehung, bidirektional). Da in der GUI zusätzlich der zeitliche Beginn der Mitgliedschaft, eine Rolle innerhalb der Gruppe (Mitglied, Stellvertreter) sowie ein optionaler Kennzeichner für Stellvertretung sichtbar gemacht werden sollen, wird die n:m-Beziehung textlich um eine Assoziationsklasse `Gruppenmitgliedschaft` mit den Attributen `rolleInGruppe`, `seit` und `istStellvertreter` konkretisiert; das Klassendiagramm zeigt zur besseren Übersicht nur die zugrundeliegende n:m-Assoziation. Jede Gruppe kann optional einen Gruppenleiter haben, der über eine separate Assoziation zu `Mitarbeiter` referenziert wird. Bei Gruppen vom Typ `Baugruppe` gilt zusätzlich der textliche Constraint, dass mindestens ein Gruppenleiter zugewiesen sein muss (Baugruppenleiter-Pflicht); für alle anderen Gruppentypen bleibt der Gruppenleiter fakultativ. Die Constraint-Formulierung in OCL-artiger Notation lautet: `if gruppentyp = BAUGRUPPE then gruppenleiter->size() = 1 and mitglieder->size() >= 1`.

*Anwesenheitszeit*

Die Klasse `Anwesenheitszeit` erfasst die täglichen Arbeitszeiten eines Mitarbeiters (LF 90). Sie wird als Komposition zu `Mitarbeiter` modelliert, da Anwesenheitszeiten ohne den zugehörigen Mitarbeiter keine Daseinsberechtigung haben. Das Attribut `Typ` unterscheidet zwischen Anwesend, Urlaub, Krankheit und sonstiger Abwesenheit.

*Projekt*

Die Klasse `Projekt` bildet die übergeordnete organisatorische Einheit für Bauvorhaben ab (LF 30). Ein Projekt hat genau einen verantwortlichen Projektleiter (Assoziation zu `Mitarbeiter`), einen Einsatzort (Assoziation zu `Adresse`) sowie genau zwei Termine -- einen Starttermin und einen Endtermin. Die Zuordnung zu `Arbeitsauftrag` ist als Komposition modelliert: Ein Projekt kann null oder mehrere Arbeitsaufträge enthalten; wird ein Projekt gelöscht, werden alle zugehörigen Aufträge mitgelöscht (kaskadierendes Löschen).

*Arbeitsauftrag*

Die Klasse `Arbeitsauftrag` enthält alle wesentlichen Auftragsdaten (LF 30). Der zugehörige Statuswert wird über die Enumeration `AuftragStatus` mit den festen Werten `OFFEN`, `IN_ARBEIT`, `PAUSIERT`, `VERZUG`, `ABGESCHLOSSEN` und `ARCHIVIERT` modelliert; letzterer Wert wird für das im Sinne von LL 20 vorgesehene logische Löschen verwendet, sodass Auftragsdaten die geforderten zehn Jahre online verfügbar bleiben. Dem Arbeitsauftrag werden beteiligte Personen (`Mitarbeiter`, mindestens einer), ein Einsatzort (`Adresse`) sowie Dokumente zugeordnet. Termine werden per Komposition zu `Termin` verwaltet, wobei mindestens ein Starttermin und ein Endtermin vorhanden sein müssen (Multiplizität `2..*`); die Komposition macht sichtbar, dass Termine ohne den zugehörigen Arbeitsauftrag keine Daseinsberechtigung haben und ihr Lebenszyklus vollständig an den Auftrag gebunden ist. Über eine weitere Komposition enthält ein Arbeitsauftrag null oder mehr Unteraufträge.

*Unterauftrag*

Die Klasse `Unterauftrag` modelliert die hierarchische Gliederung von Arbeitsaufträgen (LF 40). Unteraufträge werden per Komposition dem übergeordneten `Arbeitsauftrag` zugeordnet und müssen genau einem externen `Unterauftragnehmer` zugewiesen sein. Sie können eigene Termine, Kosten sowie eine optionale Bemerkung tragen.

*Termin*

Die Klasse `Termin` modelliert einzelne Termine innerhalb der Projektplanung (LF 40, gemäß Vereinfachung als einfache Klasse modelliert). Über das Attribut `Typ` (Starttermin, Endtermin, Zwischentermin) wird die Rolle des Termins unterschieden. Ein Termin kann einem `Arbeitsauftrag`, einem `Unterauftrag`, einem `Projekt` oder einer `Buchung` zugeordnet werden.

*Rechnung*

Die Klasse `Rechnung` enthält die aus dem Finanzbuchhaltungssystem lesend übernommenen Rechnungsdaten: Rechnungsnummer, Betrag, Fälligkeitsdatum sowie Status (LF 30). Rechnungen sind per Assoziation einem `Arbeitsauftrag` zugeordnet; einem Auftrag können mehrere Rechnungen (Teil- und Schlussrechnungen) zugeordnet sein. Der Zugriff erfolgt ausschließlich lesend über das externe Finanzbuchhaltungssystem.

*Dokument*

Die Klasse `Dokument` kapselt Datei-Objekte, die einem `Arbeitsauftrag` oder `Projekt` zugeordnet werden (LF 30). Hierunter fallen insbesondere Baupläne, Kostenvoranschläge, Angebote und Mahnungen. Durch die Auslagerung in eine eigene Klasse können beliebig viele Dokumente pro Entität verwaltet werden, ohne Dateiattribute redundant zu speichern.

*Geräte-Typ (Exemplartyp-Muster)*

Die Klasse `Geräte-Typ` beschreibt die gemeinsamen Eigenschaften gleichartiger Baumaschinen und Bauwerkzeuge (LF 50): Bezeichnung, Typ (Baumaschine oder Bauwerkzeug) sowie Kategorie (Bagger, LKW, Kran, Rüttler usw.). Diese Attribute sind für alle Exemplare desselben Typs identisch und werden durch die Trennung in eine eigene Klasse nicht redundant gespeichert.

*Gerät (Exemplartyp-Muster)*

Die Klasse `Gerät` repräsentiert ein konkretes, physisch vorhandenes Geräteexemplar mit individueller Seriennummer (LF 50). Jedes Exemplar verweist auf genau einen `Geräte-Typ` und trägt eigene Attribute: Gerätenummer, Seriennummer, Status sowie Anschaffungsdatum. Der `GerätStatus` beschreibt ausschließlich technische Zustände (`VERFUEGBAR`, `IN_WARTUNG`, `DEFEKT`, `AUSSER_BETRIEB`); die aktuelle oder zukünftige Belegung eines Geräts wird bewusst *nicht* über den Status abgebildet, sondern anhand aktiver `Buchung`-Objekte für den jeweiligen Zeitraum ermittelt (siehe LF 50 sowie das Unterprogramm VERFUEGBARKEIT-PRUEFEN im Aktivitätsdiagramm). Dadurch bleibt der Gerätestatus reserviert für dauerhafte Zustandsaussagen, während zeitlich befristete Belegungen durchgängig aus dem Buchungsbestand abgeleitet werden. Die Zuordnung zu einem `Lager` erfolgt per bidirektionaler Assoziation, da die Lagerdetailansicht alle zugeordneten Geräte anzeigen soll.

*Ausrüstung (Baugruppe-Muster)*

Die Klasse `Ausrüstung` modelliert Zubehörteile, die Geräten zugeordnet werden können (LF 50): Baggerschaufeln, Kranzubehör und Anbaugeräte. Die Zuordnung wird als Aggregation modelliert; die leere Raute wird gemäß UML-Regel am *Ganzen* -- also am `Gerät` -- platziert, da Ausrüstungsteile nicht fest mit einem Gerät verbunden sind: sie können abmontiert und an einem anderen kompatiblen Gerät genutzt werden, und wenn kein Gerät zugeordnet ist, liegen sie im Lager.

*Lager*

Die Klasse `Lager` repräsentiert die Lagerorte der Geräte (LF 50). Attribute umfassen Lagernummer, Lagerbezeichnung, Typ (Platz oder Gebäude), Grundstück sowie Kapazität. Lager verfügen über eine Adresse (Assoziation zu `Adresse`). Jedes Gerät ist genau einem Lager zugeordnet; die Beziehung ist bidirektional, damit die Lagerdetailansicht alle dort befindlichen Geräte auflisten kann.

*Buchung (Koordinator-Muster)*

Die Klasse `Buchung` realisiert das Koordinator-Muster (LF 50) in Form einer Assoziationsklasse zwischen `Gerät` und `Arbeitsauftrag`. Sie verknüpft genau ein Gerät mit genau einem `Arbeitsauftrag` und trägt eigene Attribute: Buchungsnummer, Startdatum und Enddatum als Buchungszeitraum, Buchungsdatum (Zeitpunkt der Buchungserstellung) sowie den Status vom Typ `BuchungStatus` mit den festen Werten `AKTIV`, `ABGESCHLOSSEN` und `STORNIERT`. Zusätzlich wird über eine benannte Assoziation `gebuchtVon` der buchende Mitarbeiter referenziert. Diese Attribute stimmen mit der Attributtabelle aus der Lastenheftanalyse (Frage zur Buchung) überein und bilden zugleich die Grundlage der im Aktivitätsdiagramm modellierten Verfügbarkeitsprüfung -- ohne Start- und Enddatum wäre `VERFUEGBARKEIT-PRUEFEN` nicht aus dem Modell ableitbar. Die zeitraumbezogene Belegung eines Geräts ergibt sich ausschließlich aus den aktiven Buchungen; darauf setzt die im Lastenheft geforderte Verfügbarkeitssuche unmittelbar auf. Die Notation als Assoziationsklasse wird bereits im Analyse-Klassendiagramm durch eine gestrichelte Anschlusslinie an die Assoziation `Gerät ↔ Arbeitsauftrag` sichtbar gemacht und ist somit konsistent zur Modellierung im Entwurfsklassendiagramm.

*Bildbar (abstrakter Obertyp)*

`Bildbar` fungiert im Analyse-Klassendiagramm als gemeinsamer abstrakter Obertyp für alle Entitäten, denen Bilder zugeordnet werden können (LF 80). Die Klassen `Mitarbeiter`, `Arbeitsauftrag`, `Projekt` und `Gerät` sind Untertypen von `Bildbar`. Dadurch wird die Bildzuordnung einheitlich über eine einzige Komposition `Bildbar ◆──> Bild` modelliert, anstatt vier separate Assoziationen zu benötigen. Die Generalisierungsmenge ist `{disjoint, incomplete}`. Auf der Entwurfsebene (siehe @fig-entwurfs-klassendiagramm) wird `Bildbar` konsequent als *Interface* umgesetzt, um Mehrfachvererbung -- etwa zwischen `Mitarbeiter` (bereits Untertyp von `Person`) und `Bildbar` -- zu vermeiden. Die Analyseaussage bleibt inhaltlich unverändert: `Bildbar` bündelt bildtragende Entitäten; im Entwurf trägt sie das technisch angemessene Stereotyp `<<interface>>`.

*Bild*

Die Klasse `Bild` ermöglicht die Zuordnung beliebig vieler Bilder mit Titel zu den bildtragenden Entitäten (LF 80). Jedes Bild besitzt die Attribute Bild-ID, Titel, Dateipfad, Dateiname, Hochladedatum sowie Format. Ein Attribut `Elementtyp` gemäß Lastenheft-Beispiel entfällt bewusst, da die Zuordnung zum jeweiligen Element bereits über die `Bildbar`-Komposition eindeutig geregelt und typsicher ist; der ursprüngliche Zweck des `Elementtyp`-Attributs (Information über die Kategorie des zugeordneten Elements) lässt sich zur Laufzeit unmittelbar aus dem konkreten `Bildbar`-Untertyp ableiten. Unabhängig davon verweist die `hochlader`-Assoziation auf den Mitarbeiter, der das Bild hochgeladen hat.

*Externe Systeme*

Die externen Systeme (Finanzbuchhaltung, Altsystem, Drucker) werden als Klassen mit dem Stereotyp `<<external>>` dargestellt. Die Finanzbuchhaltung greift über eine Dependency (gestrichelte Linie) lesend auf Rechnungen zu. Das Altsystem stellt eine Importschnittstelle für die Datenmigration bereit. Der Drucker ermöglicht das Drucken von Dokumenten und Rechnungen.

== Eingesetzte Analysemuster

=== Muster: Exemplartyp

#figure(caption: [Analysemuster Exemplartyp -- Geräte-Typ und Gerät])[
  Die Klassen `Geräte-Typ` und `Gerät` realisieren das Exemplartyp-Muster. Gemeinsame Typ-Eigenschaften (Bezeichnung, Typ, Kategorie) werden in `Geräte-Typ` zusammengefasst, während individuelle Instanz-Eigenschaften (Seriennummer, Status, Wartungsdaten) in `Gerät` modelliert werden. Die Assoziation `Gerät "0..*" --> "1" Geräte-Typ` stellt sicher, dass jedes Exemplar genau einem Typ zugeordnet ist.
]

*Begründung:* Das Lastenheft (LF 50) beschreibt einen Fuhrpark mit mehreren Geräten gleichen Typs (z.B. mehrere Bagger CAT 320). Ohne das Exemplartyp-Muster würden Typ-Attribute wie Bezeichnung und Kategorie bei jedem Exemplar redundant gespeichert. Die Aufteilung in Typ- und Exemplarklasse eliminiert diese Redundanz und ermöglicht eine konsistente Verwaltung der Typ-Stammdaten unabhängig von der Anzahl der Exemplare.

=== Muster: Baugruppe

#figure(caption: [Analysemuster Baugruppe -- Gerät mit Ausrüstung])[
  Die Aggregation zwischen `Gerät` und `Ausrüstung` (`Gerät "1" ◇── "0..*" Ausrüstung`) modelliert physische Baugruppen mit zugehörigem Zubehör. Die leere Raute (Aggregation) sitzt am *Gerät* als übergeordnetem Teil und drückt aus, dass ein Gerät null bis mehrere Ausrüstungsteile aufnehmen kann, umgekehrt eine Ausrüstung aber auch unabhängig vom Gerät im Lager existieren darf.
]

*Begründung:* Das Lastenheft (LF 50) nennt explizit Zubehörteile wie Baggerschaufeln und Kranzubehör, die einem Gerät zugeordnet werden können, aber nicht fest mit ihm verbunden sind. Eine Ausrüstung kann abmontiert und an einem anderen kompatiblen Gerät genutzt werden. Daher wird eine Aggregation (leere Raute am Ganzen, d.h. am Gerät) statt einer Komposition verwendet: Ausrüstung kann ohne ein zugeordnetes Gerät im Lager liegen und wird beim Löschen des Geräts nicht mitgelöscht.

=== Muster: Liste

#figure(caption: [Analysemuster Liste -- Kompositionen])[
  Mehrere Kompositionen modellieren das Listen-Muster:
  - `Projekt "1" ◆── "0..*" Arbeitsauftrag`
  - `Arbeitsauftrag "1" ◆── "0..*" Unterauftrag`
  - `Mitarbeiter "1" ◆── "0..*" Anwesenheitszeit`
  - `Bildbar "1" ◆── "0..*" Bild`
]

*Begründung:* Die genannten Listenelemente existieren ausschließlich im Kontext ihres übergeordneten Objekts und werden bei dessen Löschung kaskadierend entfernt. Arbeitsaufträge sind ohne Projekt sinnlos und werden beim Löschen eines Projekts mitgelöscht (LF 30). Anwesenheitszeiten und Bilder sind ohne ihre zugehörige Entität inhaltlich bedeutungslos. Das Listen-Muster macht diese Existenzabhängigkeit im Diagramm explizit sichtbar.

=== Muster: Koordinator (Assoziationsklasse)

#figure(caption: [Analysemuster Koordinator -- Buchung])[
  Die Klasse `Buchung` verknüpft `Gerät` und `Arbeitsauftrag` und trägt eigene Attribute (Buchungszeitraum bestehend aus Start- und Enddatum, Buchungsnummer, Status sowie Referenz auf den buchenden Mitarbeiter). Sie realisiert das Koordinator-Muster in der UML-Notation einer Assoziationsklasse, die über eine gestrichelte Anschlusslinie an die Assoziation zwischen `Gerät` und `Arbeitsauftrag` angebunden ist. Zwei separate Assoziationen der `Buchung` zu `Gerät` bzw. `Arbeitsauftrag` werden bewusst nicht verwendet, da die Attribute der Buchung fachlich nur der Verbindung als Ganzes zuzuordnen sind.
]

*Begründung:* Die Buchung eines Geräts für einen Arbeitsauftrag benötigt eigene Attribute (Buchungszeitraum, Buchungsstatus, buchender Mitarbeiter), die weder dem Gerät noch dem Auftrag sinnvoll zugeordnet werden können. Pro Buchung wird genau ein Gerät reserviert; bei Bedarf an mehreren Geräten werden separate Buchungen angelegt. Die Buchung ermöglicht die im Lastenheft geforderte Verfügbarkeitssuche und Planbarkeit (LF 50).

=== Muster: Rolle

#figure(caption: [Analysemuster Rolle -- Mitarbeiter in mehreren benannten Assoziationen])[
  Das Rollen-Muster zeigt sich in den mehreren benannten Assoziationen zwischen der Klasse `Mitarbeiter` und anderen Klassen. Ein Mitarbeiter kann gleichzeitig verschiedene Rollen einnehmen: Projektleiter (`Projekt --> Mitarbeiter`), Gruppenleiter (`Gruppe --> Mitarbeiter`), beteiligte Person (`Arbeitsauftrag --> Mitarbeiter`) und buchender Mitarbeiter (`Buchung --> Mitarbeiter`).
]

*Begründung:* Das Rollen-Muster der Vorlesung beschreibt die Situation, dass zwischen zwei Klassen mehrere einfache Assoziationen mit unterschiedlicher Semantik existieren. Im vorliegenden Domänenmodell nimmt ein Mitarbeiter gegenüber Projekten, Gruppen, Arbeitsaufträgen und Buchungen jeweils spezifische, benannte Rollen ein. Die Rollennamen (`projektleiter`, `gruppenleiter`, `gebuchtVon`) sind im Diagramm an den jeweiligen Assoziationen vermerkt, um die unterschiedliche Semantik eindeutig zu kennzeichnen. Die Enumeration `Rolle` (Berechtigungsstufe) dient hingegen ausschließlich der Zugriffssteuerung und ist nicht mit diesem Analysemuster zu verwechseln.

== Multiplizitäten und Navigierbarkeit

Gemäß den Kurskonventionen (SWE1) werden folgende Regeln angewendet:
- Multiplizitäten werden bei unidirektionalen Assoziationen ausschließlich am navigierten Ende (Pfeilspitze) angegeben; das Ursprungsende bleibt gemäß Vorlesungskonvention unbeschriftet und wird implizit als `1` gelesen
- Bei den wenigen bewusst bidirektional geführten Assoziationen (Mitarbeiter -- Gruppe für die n:m-Beziehung; Gerät -- Lager, damit die Lagerdetailansicht alle dort befindlichen Geräte auflisten kann) sind Multiplizitäten an beiden Enden erforderlich, damit die geforderte Rückrichtung eindeutig lesbar bleibt; diese Ausnahme wird pro Assoziation im Diagramm sichtbar durch das Fehlen der Pfeilspitze und im Text ausdrücklich benannt
- Unidirektionale Assoziationen (Pfeilspitze) werden konsequent bevorzugt und stellen die Regel dar
- Kompositionen (gefüllte Raute) kennzeichnen existenzabhängige Teile mit kaskadierendem Löschen; die Raute wird immer am *Ganzen* platziert
- Aggregationen (leere Raute) kennzeichnen nicht-exklusive Teilbeziehungen; die Raute steht ebenfalls am *Ganzen* -- bei der Beziehung `Gerät ◇── Ausrüstung` folglich am Gerät als übergeordnetem Teil
- Referenzen auf andere Klassen werden ausschließlich als Assoziationslinien modelliert, nicht als Attribute in der Klasse
