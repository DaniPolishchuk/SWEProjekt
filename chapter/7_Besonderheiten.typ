= Besonderheiten

Für den vorliegenden Programmentwurf wurden an mehreren Stellen methodische und fachliche Schwerpunkte gesetzt, die über die geforderten Mindestanforderungen hinausgehen. Die folgenden Abschnitte fassen diese Besonderheiten zusammen; die ausführliche Behandlung findet sich jeweils im referenzierten Kapitel.

== Umfangreiche und systematische Lastenheftanalyse

Die Analyse hinterfragt jeden Absatz des Originaltextes, nicht nur die zehn Funktionalanforderungen. Es entstand ein durchgängig nummerierter Fragenkatalog mit vollständigen Attributtabellen je Entität; interne Entwurfsentscheidungen des Teams sind konsequent mit dem Präfix "Intern:" gekennzeichnet und von Rückfragen an den Auftraggeber abgegrenzt.

== Konsequente Anwendung von Analysemustern

Im Analyse-Klassendiagramm (siehe @fig-analyse-klassendiagramm) sind fünf Analysemuster aus der Vorlesung explizit benannt und jeweils mit Bezug zur Lastenheftanforderung begründet: Exemplartyp (`Geräte-Typ`/`Gerät`), Baugruppe (`Ausrüstung`/`Gerät`), Liste (Kompositionen der Auftragshierarchie), Koordinator (`Buchung` als Assoziationsklasse) und Rolle (`Mitarbeiter` in mehreren benannten Assoziationen).

== Sechs Entwurfsmuster mit begründeter Auswahl

Das Entwurfsklassendiagramm (siehe @fig-entwurfs-klassendiagramm) ergänzt die Analysemuster um sechs klassische Entwurfsmuster: Singleton, Kompositum, Beobachter, Fabrikmethode, Objektadapter und die Assoziationsklasse als Realisierung des Koordinator-Musters. Jedes Muster wurde bewusst und mit expliziter Begründung eingesetzt.

== Strikte Einhaltung der SWE1-UML-Konventionen

Sämtliche Klassendiagramme folgen den Notationsregeln der Vorlesung: Multiplizitäten nur am navigierten Ende, unidirektionale Assoziationen bevorzugt, Referenzen ausschließlich als Assoziationslinien statt als Attribute. Kompositionen sind für existenzabhängige Teile mit kaskadierendem Löschen reserviert, Aggregationen für nicht-exklusive Teilbeziehungen wie zwischen `Ausrüstung` und `Gerät`.

== Verbindliche Enumerationen mit sauberer Trennung von Berechtigung und Funktion

Alle statuslastigen Attribute wurden auf Analyse- und Entwurfsebene als Enumerationen festgeschrieben und einheitlich verwendet. Besonderes Augenmerk lag auf der Trennung zwischen Berechtigung (`Rolle`) und fachlicher Aufgabe (`Position`) sowie darauf, dass der `GerätStatus` ausschließlich technische Zustände trägt, während die zeitraumbezogene Belegung eines Geräts aus aktiven `Buchung`-Objekten abgeleitet wird.

== Umfassende und rollenbasierte GUI-Ausarbeitung

Statt der geforderten zwei GUI-Ansichten wurden acht produktionsnahe Mockups ausgearbeitet, die einen typischen Tagesablauf eines Bau-/Projektleiters abbilden (siehe Kapitel "GUI-Mockups"). Sämtliche Ansichten folgen einem einheitlichen Designsystem mit permanenter Seitenleiste, verankerter Topbar und konsistenter Statusfarbpalette; die Sichtbarkeit einzelner Funktionen ist an die Enumeration `Rolle` gekoppelt.

== Duplikatsprüfung als durchgängiges Querschnittskonzept

Die in LF 100 geforderte Duplikatsprüfung ist über alle Modellierungsebenen hinweg realisiert: als eigenständiges Unterprogramm im Sequenzdiagramm, als Verfeinerung im Aktivitätsdiagramm, in nummeriertem Pseudocode sowie als sichtbarer Live-Hinweis im GUI-Mockup zum Anlegen eines Auftrags. Der Administrator-Override ist als eigener Fallzweig modelliert.

== Wiederverwendbare Unterprogramme im Sequenzdiagramm

Das Szenario "Auftrag anlegen" (siehe @fig:sd_auftrag) ist über vier eigenständige Untersequenzdiagramme modularisiert. Insbesondere `OBJEKT-ANLEGEN` wurde generisch und rekursiv gestaltet, sodass es unabhängig von der konkreten Domänenklasse wiederverwendbar ist und die in LF 70 geforderte Erweiterbarkeit bereits in der Modellierung sichtbar wird.

== Ausdifferenziertes MVC-Kommunikationsschema

Die geforderte GUI-Modellierung mit MVC (siehe @fig:mvc-kommunikation) wurde um ein eigenes Event-Paket mit vier fachlich benannten Listener-Schnittstellen ergänzt, das die Schichten View, Controller und Model vollständig entkoppelt. Der Nachrichtenfluss ist in acht Schritten beschrieben; die bewusste Koexistenz eines nativen Java-Swing-Beobachterpfads und eines fachlich eigenen Ereignispfads ist im Reflexionsteil begründet.

== Bildbar-Abstraktion für einheitliche Bildzuordnung

Statt vier separater Assoziationen zwischen `Bild` und den bildtragenden Entitäten wurde ein gemeinsamer Obertyp `Bildbar` eingeführt. Auf Analyseebene ist dieser ein abstrakter Obertyp, auf Entwurfsebene wird er als `<<interface>>` verfeinert, um die in Java unzulässige Mehrfachvererbung zu vermeiden. Die Bildzuordnung bleibt so in einer einzigen Komposition modelliert und ohne Änderung an `Bild` erweiterbar (LF 80).

== Konsequente Umsetzung der Aufbewahrungspflicht LL 20

Die zehnjährige Aufbewahrungspflicht wurde konsequent in das Datenmodell und die dynamischen Diagramme übertragen. Aufträge, Geräte und Buchungen werden logisch gelöscht (`ARCHIVIERT`, `AUSSER_BETRIEB`, `STORNIERT`) statt physisch entfernt; das Unterprogramm `AUFTRAG-ARCHIVIEREN` ist als eigenes Sequenzdiagramm ausgearbeitet und im Pseudocode dokumentiert.

== Domänenspezifische Verfügbarkeitssuche mit optionaler Standortlogik

Die Gerätesuche kombiniert Gerätekategorie, Buchungszeitraum, Einsatzort und Ausrüstungsanforderung und ordnet die Kandidaten primär nach Verfügbarkeit. Ergänzend wird eine über das Lastenheft hinausgehende, statische Entfernungssortierung angeboten, deren freiwilliger Charakter im GUI-Kapitel ausdrücklich als Zusatzfunktion ausgewiesen ist (LF 50, LF 60).

== Ehrliche Reflexionsabschnitte an allen zentralen Diagrammen

Sequenzdiagramm, Aktivitätsdiagramm, MVC-Kommunikationsschema und Entwurfsklassendiagramm schließen jeweils mit einem Reflexionsabschnitt, in dem bewusste Modellierungsvereinfachungen, Entwurfsentscheidungen und Grenzen der Darstellung offen benannt werden. Diese Selbsttransparenz macht die Arbeit für den Prüfer nachvollziehbar.

== Konsistenz zwischen den Diagrammen

Über sämtliche Diagramme hinweg wurden Farbcodierung, Terminologie und Multiplizitätskonvention einheitlich gehalten. Attribut-, Klassen- und Rollenbezeichnungen sowie Enum-Werte werden von der Lastenheftanalyse über die Use-Case-, Analyse- und Entwurfsdiagramme bis zum MVC-Schema durchgängig identisch geführt, sodass ein roter Faden entsteht.

== Vorschlag zur Tablet-Realisierung und Übertragbarkeit

Der im Lastenheft angesprochene, nicht zum ersten Auftrag gehörende Tablet-Ansatz wurde konzeptionell vorbereitet: Die kartenbasierten Layouts sind mobiletauglich, und die strikte MVC-Schichtentrennung erlaubt einen späteren Austausch der View-Schicht ohne Eingriff in die Geschäftslogik. Empfohlen wird eine gemeinsame Datenbasis mit einer schmalen HTTP-Schnittstelle, sodass die modellierte Adapter- und Fabrikstruktur unverändert wiederverwendbar bleibt.
