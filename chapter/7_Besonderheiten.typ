= Besonderheiten

Für den vorliegenden Programmentwurf wurden an mehreren Stellen methodische und fachliche Schwerpunkte gesetzt, die über die in der Aufgabenstellung geforderten Mindestanforderungen hinausgehen. Die folgenden Abschnitte fassen diese Besonderheiten zusammen.

== Umfangreiche und systematische Lastenheftanalyse

Die Analyse des Lastenhefts wurde nicht auf die zehn Funktionalanforderungen beschränkt, sondern hinterfragt jeden Absatz des Originaltextes -- einschließlich der Einleitung, der Zielgruppen und Rollen, der Produktdaten sowie der Qualitätsanforderungen. Insgesamt entstand ein Fragenkatalog von mehr als 170 durchgängig nummerierten Fragen mit ausführlichen Antworten. Für jede identifizierte Entität wurde eine vollständige Attributtabelle mit Datentyp und Beschreibung erstellt; interne Entwurfsentscheidungen des Teams sind konsequent mit dem Präfix "Intern:" gekennzeichnet und von Rückfragen an den Auftraggeber abgegrenzt. Querverweise zwischen den Abschnitten machen die Analyse als zusammenhängendes Dokument lesbar und verhindern isolierte Insellösungen.

== Konsequente Anwendung von Analysemustern

Im Analyse-Klassendiagramm wurden fünf Analysemuster aus der Vorlesung explizit identifiziert, in eigenen Unterabschnitten benannt und jeweils fachlich begründet: das Exemplartyp-Muster für die Trennung von `Geräte-Typ` und konkretem Geräteexemplar, das Baugruppe-Muster für die Zuordnung von `Ausrüstung` zu einem `Gerät`, das Listen-Muster für die Kompositionen entlang der Auftragshierarchie, das Koordinator-Muster für die `Buchung` als Assoziationsklasse sowie das Rollen-Muster für die mehrfach benannten Assoziationen zwischen `Mitarbeiter` und seinen Bezugsobjekten. Die Muster wurden nicht nur benannt, sondern jeweils mit konkretem Bezug zur Lastenheftanforderung motiviert.

== Sechs Entwurfsmuster mit begründeter Auswahl

Das Entwurfsklassendiagramm greift die Analysemuster auf und ergänzt sie um sechs klassische Entwurfsmuster: Singleton für `Datenbasis` und `GUIController`, Kompositum für die selbstreferenzielle Auftragshierarchie über die abstrakte Klasse `Auftrag`, Beobachter für die Datenaktualisierung über eigene Listener-Schnittstellen, Fabrikmethode für die typspezifische Erzeugung von `Arbeitsauftrag` und `Unterauftrag`, Objektadapter für die Anbindung des Altsystems sowie die Assoziationsklasse als Realisierung des Koordinator-Musters. Jedes Muster wurde bewusst und mit expliziter Begründung eingesetzt, nicht als Selbstzweck.

== Strikte Einhaltung der SWE1-UML-Konventionen

Sämtliche Klassendiagramme folgen konsequent den in der Vorlesung vereinbarten Notationsregeln: Multiplizitäten werden ausschließlich am navigierten Ende der Assoziation angegeben, unidirektionale Assoziationen werden bevorzugt, und Referenzen auf andere Klassen erscheinen ausnahmslos als Assoziationslinien, nicht als Attribute innerhalb der Klasse. Kompositionen sind für existenzabhängige Teile mit kaskadierendem Löschen reserviert, Aggregationen ausschließlich für nicht-exklusive Teilbeziehungen wie die zwischen `Ausrüstung` und `Gerät`. Diese Konvention wird explizit in der Kapitelbeschreibung des Analyse-Klassendiagramms festgehalten und lässt sich in jedem Einzeldiagramm der Arbeit nachvollziehen.

== Verbindliche Enumerationen mit sauberer Trennung von Berechtigung und Funktion

Alle statuslastigen Attribute (`AuftragStatus`, `BuchungStatus`, `GerätStatus`, `Rolle`, `Position`, `Gruppentyp`, `TerminTyp`, `DokumentTyp`, `AnwesenheitTyp`, `GerätKategorie`) wurden auf Analyse- und Entwurfsebene als Enumerationen festgeschrieben und im gesamten Dokument mit denselben, in Großbuchstaben notierten Werten verwendet. Besonderes Augenmerk lag auf der Trennung zwischen Berechtigung (`Rolle`) und fachlicher Aufgabe (`Position`) sowie darauf, dass der `GerätStatus` ausschließlich technische Zustände (`VERFUEGBAR`, `IN_WARTUNG`, `DEFEKT`, `AUSSER_BETRIEB`) trägt, während die zeitraumbezogene Belegung eines Geräts aus aktiven `Buchung`-Objekten abgeleitet wird -- eine Modellierung, die die im Lastenheft geforderte Verfügbarkeitssuche über beliebige Zeiträume überhaupt erst tragfähig macht.

== Umfassende und rollenbasierte GUI-Ausarbeitung

Statt der geforderten zwei GUI-Ansichten wurden acht produktionsnahe Mockups ausgearbeitet, die einen typischen Tagesablauf eines Bau-/Projektleiters vollständig abbilden -- vom Dashboard über die Auftragsübersicht und -detailansicht bis zur Buchungsmaske mit Verfügbarkeitssuche, dem Terminplaner und dem Mitarbeiterprofil mit Gruppenzuordnung. Sämtliche Ansichten folgen einem einheitlichen Designsystem mit permanenter Seitenleiste, verankerter Topbar, einer konsistenten Statusfarbpalette und einer domänenauthentischen Akzentfarbe. Die Sichtbarkeit einzelner Funktionen wurde konsequent an die im Klassendiagramm modellierte Enumeration `Rolle` gekoppelt und im GUI-Kapitel ausdrücklich diskutiert; nicht skizzierte Ansichten wie Lagerverwaltung, Anwesenheitszeiten oder Bilderkatalog werden im letzten Abschnitt des GUI-Kapitels ergänzend beschrieben.

== Duplikatsprüfung als durchgängiges Querschnittskonzept

Die im Lastenheft in LF 100 geforderte Duplikatsprüfung wird nicht nur erwähnt, sondern durchgängig über alle Modellierungsebenen hinweg realisiert: als eigenständiges Unterprogramm im Sequenzdiagramm, als hellblau markierte Verfeinerung im Aktivitätsdiagramm, in nummeriertem Pseudocode für alle relevanten Entitäten sowie als sichtbarer Live-Hinweis im GUI-Mockup zum Anlegen eines neuen Auftrags. Der im Lastenheft vorgesehene Administrator-Override der Duplikatswarnung ist als eigener Fallzweig im Pseudocode und als Notiz im Sequenzdiagramm modelliert. Die Prüfung greift konsequent vor der Aufnahme neuer Datensätze in die zentrale Datenbasis und erstreckt sich neben Aufträgen ausdrücklich auch auf Geräte-Typen, Geräte, Mitarbeiter und Lager.

== Wiederverwendbare Unterprogramme im Sequenzdiagramm

Das Sequenzdiagramm zum Szenario "Auftrag anlegen" wurde bewusst nicht monolithisch, sondern über vier eigenständige Untersequenzdiagramme (`OBJEKT-ANLEGEN`, `DUPLIKATSPRUEFUNG`, `STATUS-SETZEN`, `AUFTRAG-ARCHIVIEREN`) modularisiert. Insbesondere das Unterprogramm `OBJEKT-ANLEGEN` wurde generisch und rekursiv aufrufbar gestaltet, sodass es unabhängig von der konkreten Domänenklasse wiederverwendbar ist und die im Lastenheft (LF 70) geforderte Erweiterbarkeit von Auswahllisten bereits in der Modellierung sichtbar wird. Der zugehörige nummerierte Pseudocode nutzt für Kontrollwörter durchgängig die aus der Vorlesung bekannten deutschen Großbuchstaben ohne Umlaute; operative Verben innerhalb einer einzelnen Aktion behalten aus Gründen der Lesbarkeit ihre natürlichsprachige Schreibweise, was in den Vorbemerkungen zu Sequenz- und Aktivitätsdiagramm ausdrücklich begründet ist.

== Ausdifferenziertes MVC-Kommunikationsschema

Die geforderte GUI-Modellierung mit MVC wurde um ein eigenes Event-Paket mit vier fachlich benannten Listener-Schnittstellen (`IFilterListener`, `IAuftragSelectionListener`, `IUpdateEventListener`, `IUpdateEventSender`) ergänzt, das die Schichten View, Controller und Model vollständig entkoppelt. Der Nachrichtenfluss beim exemplarischen Filtervorgang wurde in acht aufeinanderfolgenden Schritten beschrieben; die bewusste Koexistenz eines nativen Java-Swing-Beobachterpfads zwischen `AbstractTableModel` und `JTable` und eines fachlich eigenen Ereignispfads für die verbleibenden Sichten wurde im Reflexionsteil ausdrücklich begründet. Damit ist die Modellierung sowohl mit den Standardklassen aus `javax.swing` kompatibel als auch für spätere View-Erweiterungen offen.

== Bildbar-Abstraktion für einheitliche Bildzuordnung

Statt vier separate Assoziationen zwischen der Klasse `Bild` und den bildtragenden Entitäten (`Mitarbeiter`, `Arbeitsauftrag`, `Projekt`, `Gerät`) vorzusehen, wurde ein gemeinsamer Obertyp `Bildbar` eingeführt. Auf Analyseebene erscheint dieser als abstrakter Obertyp mit der Generalisierungsmenge `{disjoint, incomplete}`; auf Entwurfsebene wird er konsequent als `<<interface>>` verfeinert, um die in Java unzulässige Mehrfachvererbung -- insbesondere für `Mitarbeiter`, der bereits von `Person` erbt -- zu vermeiden. Die Bildzuordnung wird dadurch in einer einzigen Komposition modelliert und bleibt für weitere bildtragende Entitäten ohne Änderung an der Klasse `Bild` erweiterbar. Damit ist die im Lastenheft (LF 80) geforderte Bildhinterlegung sowohl elegant als auch technisch umsetzbar realisiert.

== Konsequente Umsetzung der Aufbewahrungspflicht LL 20

Die im Lastenheft geforderte zehnjährige Aufbewahrungspflicht (LL 20) wurde nicht als reine Textannotation belassen, sondern konsequent in das Datenmodell und die dynamischen Diagramme übertragen. Aufträge werden nicht physisch aus der Datenbasis entfernt, sondern über den Statuswert `ARCHIVIERT` logisch gelöscht; das entsprechende Unterprogramm `AUFTRAG-ARCHIVIEREN` ist als eigenes Sequenzdiagramm ausgearbeitet und über den zugehörigen Pseudocode nachvollziehbar dokumentiert. Analoges gilt für Geräte, deren Löschen auf einen Statuswechsel nach `AUSSER_BETRIEB` reduziert wird, sowie für Buchungen, die statt Löschung einen `STORNIERT`-Zustand kennen. Damit ist die rechtliche Anforderung durchgängig in der Modellierung verankert.

== Domänenspezifische Verfügbarkeitssuche mit optionaler Standortlogik

Die Buchung von Geräten wurde nicht auf eine einfache Verfügbarkeitsprüfung reduziert, sondern durchgängig um die im Lastenheft für den Bauleiter praktisch relevanten Dimensionen erweitert. Die im GUI-Mockup dargestellte Suche kombiniert Gerätekategorie, Buchungszeitraum, Einsatzort und Ausrüstungsanforderung; die Ergebnisliste ordnet die Kandidaten primär nach Verfügbarkeit im gewünschten Zeitraum. Ergänzend wird eine über das Lastenheft hinausgehende, statische Entfernungssortierung auf Basis der beim Lager hinterlegten Adresse angeboten, deren freiwilliger Charakter im GUI-Kapitel ausdrücklich als Zusatzfunktion ausgewiesen ist. Damit erfüllen die Anforderungen LF 50 und LF 60 einen für den Bauleiter unmittelbar praktikablen Bedienzweck.

== Ehrliche Reflexionsabschnitte an allen zentralen Diagrammen

Sowohl das Sequenzdiagramm als auch das Aktivitätsdiagramm, das MVC-Kommunikationsschema und das Entwurfsklassendiagramm schließen mit einem eigenen Reflexionsabschnitt, in dem bewusste Modellierungsvereinfachungen, Entwurfsentscheidungen und Grenzen der Darstellung offen benannt werden. Beispiele hierfür sind die Auslagerung des Löschvorgangs aus dem Sequenzdiagramm zugunsten eines dedizierten Untersequenzdiagramms, die Kennzeichnung des Fork/Join-Konstrukts im Aktivitätsdiagramm als Modellierungsvereinfachung sowie die Diskussion des hybriden Beobachter-Modells im MVC-Schema. Diese Selbsttransparenz macht die Arbeit für den Prüfer nachvollziehbar und schließt Interpretationslücken bereits im Text.

== Konsistenz zwischen den Diagrammen

Über sämtliche Diagramme hinweg wurden Farbcodierung, Terminologie und Multiplizitätskonvention einheitlich gehalten: Die Farbgruppen des Analyse-Klassendiagramms (Personen blau, Projekte und Aufträge orange, Geräte grün, externe Systeme lila) finden sich im Entwurfsklassendiagramm und in den Statusfarben der GUI wieder. Attribut-, Klassen- und Rollenbezeichnungen wurden über Lastenheftanalyse, Use-Case-Diagramm, Analyse- und Entwurfsklassendiagramm, Sequenz- und Aktivitätsdiagramm sowie das MVC-Kommunikationsschema konsistent verwendet. Enum-Werte werden in allen Diagrammen mit derselben Schreibweise geführt, sodass ein durchgängiger roter Faden von der Lastenheftanalyse bis zum Entwurfsklassendiagramm entsteht.

== Vorschlag zur Tablet-Realisierung und Übertragbarkeit

Der im Lastenheft angesprochene Tablet-Ansatz, der nicht Teil des ersten Auftrags ist, wurde in der GUI-Reflexion und im Entwurfsklassendiagramm konzeptionell vorbereitet: Die kartenbasierten Layouts der Mockups sind bewusst mobiletauglich gehalten, und die strikte Schichtentrennung im MVC-Kommunikationsschema erlaubt einen späteren Austausch der View-Schicht ohne Eingriffe in die Geschäftslogik. Für die Umsetzung wird eine gemeinsame Datenbasis mit einer schmalen HTTP-Schnittstelle zwischen Tablet-Client und Server empfohlen, sodass die im Entwurfsklassendiagramm modellierte Adapter- und Fabrikstruktur unverändert wiederverwendet werden kann. Damit ist die Anwendung nicht nur für das Bauunternehmen der Rhein-Neckar-Region ausgelegt, sondern grundsätzlich auf weitere Bauunternehmen und Endgeräte übertragbar.
