= Entwurfsklassendiagramm

== Einleitung

Nachdem in Kapitel 4 das Analyse-Klassendiagramm die fachlichen Entitäten der Verwaltungssoftware und ihre wesentlichen Beziehungen aus Sicht des Lastenhefts modelliert hat, verlagert das nun vorgestellte Entwurfsklassendiagramm den Modellierungsschwerpunkt auf die softwaretechnische Umsetzung. Es baut inhaltlich vollständig auf dem Analyse-Klassendiagramm auf, verfeinert dieses jedoch um Sichtbarkeiten, Datentypen, Konstruktoren und fachliche Operationen, führt zentrale Entwurfsmuster ein und ergänzt diejenigen technischen Klassen, die zur konkreten Realisierung der Software erforderlich sind, aber im Analyseklassendiagramm bewusst ausgeblendet blieben.

Das Entwurfsklassendiagramm ist gemäß Aufgabenstellung 3.3 zu erstellen und bildet gemeinsam mit dem Kommunikationsschema die verbindliche Entwurfsgrundlage für die Implementierung. Während das Kommunikationsschema die Auftragsübersicht im Detail zeigt, konzentriert sich dieses Kapitel auf die Gesamtarchitektur des fachlichen Kerns und der Persistenzschicht; die view- und ereignisspezifischen Klassen werden hier nicht wiederholt. Das GUI-Paket ist auf zwei Ankerklassen (`GUIController` und die Schnittstelle `IUpdateEventListener`) reduziert, die den Bezug zum Beobachter-Muster und zur zentralen Datenbasis erkennbar halten. Konsistent zum Kommunikationsschema implementieren die View-Klassen (etwa `AufträgeÜbersichtPanel`) die Schnittstelle `IUpdateEventListener`, während der `GUIController` als Bindeglied die Beobachter beim `Datenbasis`-Singleton an- und abmeldet.

Die in den Kapiteln 6 und 7 eingeführten Unterprogramme des Pseudocodes (OBJEKT-ANLEGEN, DUPLIKATSPRUEFUNG, STATUS-SETZEN, AUFTRAG-ARCHIVIEREN, LAGER-AUSWAEHLEN-ODER-ANLEGEN, VERFUEGBARKEIT-PRUEFEN, BUCHUNG-ANLEGEN) sind auf Entwurfsebene den folgenden Klassen und Operationen zugeordnet, wodurch die Analyse-Ebene lückenlos in die Entwurfsebene übergeht:

- *OBJEKT-ANLEGEN* wird durch die Konstruktoren der jeweiligen Domänenklassen sowie durch die Fabrikoperationen `AuftragFactory.erzeugeAuftrag(...)` und `Projekt.auftragAnlegen()` realisiert.
- *DUPLIKATSPRUEFUNG* entspricht der Operation `Datenbasis.existiertBereits(kriterien)`, die für sämtliche gemäß LF 100 zu prüfenden Entitäten (Auftrag, Mitarbeiter, Gerät, Geräte-Typ, Lager) verwendbar ist.
- *STATUS-SETZEN* wird durch Setter-Operationen auf den betroffenen Klassen (`Arbeitsauftrag.setStatus(s: AuftragStatus)`, `Buchung.setStatus(s: BuchungStatus)`, `Gerät.setStatus(s: GerätStatus)`) umgesetzt. Die Namenskonvention lautet einheitlich `setStatus` und wird durchgängig in allen Klassen des Entwurfsdiagramms verwendet.
- *AUFTRAG-ARCHIVIEREN* entspricht der zusammenfassenden Operation `Arbeitsauftrag.archivieren()`, die vor der eigentlichen Statusänderung die aktiven Buchungen storniert. Sie steht ebenso an der Klasse `Arbeitsauftrag` wie die genannten `setStatus`-Operationen.
- *VERFUEGBARKEIT-PRUEFEN* ist die Operation `Gerät.istVerfügbarIn(z: Zeitraum): boolean`.
- *BUCHUNG-ANLEGEN* wird durch den Konstruktor `Buchung(g: Gerät, a: Arbeitsauftrag, z: Zeitraum, m: Mitarbeiter)` inkl. anschließender Registrierung an der `Datenbasis` realisiert.

Diese Zuordnung stellt sicher, dass die im Analyse-Pseudocode formulierten Verantwortlichkeiten im Entwurfsklassendiagramm eindeutig lokalisiert werden können.

== Aufbau des Diagramms

Das Entwurfsklassendiagramm ist in neun thematisch abgegrenzte Pakete gegliedert, die zur besseren Übersicht farblich hervorgehoben und mit einem `Package`-Rahmen umgeben sind. Die farbliche Kodierung wurde weitgehend aus dem Analyse-Klassendiagramm übernommen, sodass sich verwandte Klassen in beiden Diagrammen wiederfinden:

- *Externe Systeme* (lila): Finanzbuchhaltung, Altsystem und Drucker als Nachbarsysteme mit dem Stereotyp `<<external>>`.
- *Personen* (blau): abstrakte Klasse `Person` sowie `Mitarbeiter`, `Unterauftragnehmer`, `Anwesenheitszeit`, `Gruppe` und die Assoziationsklasse `Gruppenmitgliedschaft` an der n:m-Beziehung zwischen `Mitarbeiter` und `Gruppe`.
- *Projekte und Aufträge* (orange): abstrakte Klasse `Auftrag` als Wurzel der Auftragshierarchie sowie `Arbeitsauftrag`, `Unterauftrag`, `Projekt`, `Rechnung`, `Dokument` und `Termin`.
- *Geräteverwaltung* (grün): `Geräte-Typ`, `Gerät`, `Ausrüstung`, `Lager` und die Assoziationsklasse `Buchung`.
- *Bilder* (rot): Schnittstelle `Bildbar` und Klasse `Bild`.
- *Persistenz und Import/Export* (dunkelgrün): `Datenbasis` als Singleton, `AuftragFactory` mit ihren konkreten Fabriken sowie die Adapter-Kette rund um `IImportQuelle` und `AltsystemAdapter`.
- *GUI* (hellblau, reduziert): `GUIController` und `IUpdateEventListener` als Ankerklassen, ergänzt durch einen expliziten Verweis auf das ausführliche Kommunikationsschema in Kapitel 8.
- *Datentypen* (grau): die Wertklassen `Adresse`, `Zeitraum` und `Datei` sowie sämtliche Enumerationen (`Rolle`, `Position`, `AuftragStatus`, `ProjektStatus`, `BuchungStatus`, `GerätStatus`, `AnwesenheitTyp`, `GerätKategorie`, `Gruppentyp`, `TerminTyp` und `DokumentTyp`). Die Enumeration `TerminTyp` umfasst dabei ausschließlich die drei fachlichen Werte `STARTTERMIN`, `ENDTERMIN` und `ZWISCHENTERMIN`; Wartungstermine eines Geräts sind bewusst nicht als `Termin`-Instanzen modelliert, sondern -- konsistent zur Antwort in der Lastenheftanalyse -- als einfache Datumsattribute (`letzterWartungstermin`, `nächsterWartungstermin`) direkt am Gerät geführt.

Um die Übersichtlichkeit zu wahren, wurden im Paket _Datentypen_ keine Assoziationslinien zu den restlichen Klassen eingezeichnet. Die Verwendung der Enumerationen ergibt sich unmittelbar aus den typisierten Attributen der jeweiligen Klasse (z.B. `- status: AuftragStatus`); für die Wertobjekte `Adresse`, `Zeitraum` und `Datei` gilt derselbe Zusammenhang -- sie sind mit dem Stereotyp `<<datatype>>` versehen und werden konsequent als *Attributtypen* (nicht als eigenständige Referenzen) modelliert, sodass die SWE1-Regel "Referenzen als Assoziationslinien" für sie nicht greift. Dies ist eine bewusste Verfeinerung gegenüber der Analyse: Dort wurde `Adresse` noch als eigenständige Klasse mit Assoziationslinien geführt; im Entwurf wird sie in ein unveränderliches Wertobjekt überführt, da eine Adresse ohne fachliche Identität ausschließlich beschreibende Eigenschaften trägt. Diese Verfeinerung wird an dieser Stelle explizit begründet, um den scheinbaren Widerspruch zur allgemeinen Regel des Analyse-Klassendiagramms nicht offen stehen zu lassen.

#pagebreak(weak: true)

#figure(
  image("../assets/klassendiagramm/Entwurfsklassendiagramm.drawio.svg", width: 100%),
  caption: [Entwurfsklassendiagramm der Verwaltungssoftware],
) <fig-entwurfs-klassendiagramm>

#pagebreak(weak: true)

== Wesentliche Änderungen gegenüber dem Analyse-Klassendiagramm

Die im Folgenden aufgezählten Änderungen sind bewusste Entwurfsentscheidungen und werden in den anschließenden Abschnitten inhaltlich begründet.

+ *Einführung der abstrakten Klasse `Auftrag`.* `Arbeitsauftrag` und `Unterauftrag` erben nunmehr gemeinsam von einer neuen, abstrakten Oberklasse `Auftrag`. Damit werden die im Analyse-Klassendiagramm noch redundant modellierten Attribute (Auftragsnummer, Bezeichnung, Status, Bemerkung) sowie die Terminzuordnung in einer einzigen Klasse zusammengeführt. Die abstrakte Methode `kosten(): BigDecimal` wird von den beiden konkreten Unterklassen in typspezifischer Weise überschrieben.
+ *Korrekte Darstellung der Buchung als Assoziationsklasse.* Die im Analyse-Klassendiagramm bereits als Koordinator eingeführte `Buchung` wird im Entwurf über die gestrichelte Verbindungslinie an die Assoziation zwischen `Gerät` und `Arbeitsauftrag` angeschlossen und damit -- entsprechend dem Koordinator-Muster und der UML-Notation -- als vollwertige Assoziationsklasse ausgezeichnet.
+ *`Rolle` als Enumeration.* Da die im Lastenheft geforderten Benutzerrollen fest vorgegeben sind und zur Laufzeit weder erweitert noch verändert werden, wurde die zuvor als eigenständige Klasse modellierte Rolle in eine Enumeration überführt. Damit ist die Menge der zulässigen Rollen bereits zur Übersetzungszeit garantiert und die Zugriffsprüfung wird typsicher.
+ *Auslagerung von Wertobjekten in ein eigenes Datentypen-Paket.* Die drei rein deskriptiven Wertklassen `Adresse`, `Zeitraum` und `Datei` sowie alle Enumerationen wurden mit dem Stereotyp `<<datatype>>` bzw. `<<enumeration>>` versehen und in einem eigenen Paket zusammengefasst. Hierdurch werden Vorschriften über deren Unveränderlichkeit auf einer einzigen Stelle sichtbar; Änderungen an einem Enumerationswert wirken sich konsistent im gesamten Modell aus.
+ *Explizite Modellierung der Bildzuordnung durch das Interface `Bildbar`.* Der im Analyse-Klassendiagramm eingeführte abstrakte Obertyp `Bildbar` wird im Entwurf zum `<<interface>>` verfeinert, damit die vier bildtragenden Klassen `Arbeitsauftrag`, `Projekt`, `Gerät` und `Mitarbeiter` diese Zusage auch bei bereits vorhandener Basisklasse (`Person`) tragen können. Die Zuordnung selbst bleibt semantisch gleich: `Bild` kennt weiterhin genau einen abstrakten Bindungspunkt statt vier unterschiedliche.
+ *Einführung der Datenbasis als Singleton.* Die im Lastenheft (LD 10) geforderte zentrale Datenhaltung wird durch die Klasse `Datenbasis` mit dem Stereotyp `<<singleton>>` realisiert. Sie hält für jede persistente Entitätsart eine Liste vor und stellt zentrale Suchmethoden (`findAufträge`), Duplikatsprüfung (`existiertBereits`, LF 100) sowie das Ereignisnetz für den Beobachter-Mechanismus zur Verfügung.
+ *Zentrale Objekterzeugung über `AuftragFactory`.* Um Auftragsnummern konsistent zu vergeben und die Erzeugung von `Arbeitsauftrag` bzw. `Unterauftrag` einheitlich zu regeln, wird eine abstrakte Fabrik eingeführt, die in Form der konkreten Ableitungen `ArbeitsauftragFactory` und `UnterauftragFactory` implementiert ist (Fabrikmethode).
+ *Assoziationsklasse `Gruppenmitgliedschaft`.* Die im Analyse-Klassendiagramm nur textlich beschriebene n:m-Beziehung zwischen `Mitarbeiter` und `Gruppe` wird im Entwurf zu einer echten Assoziationsklasse verfeinert. `Gruppenmitgliedschaft` trägt die Attribute `rolleInGruppe`, `seit` und `istStellvertreter` und macht damit die in der GUI (Kapitel 5) bereits sichtbaren Zusatzinformationen zur Mitgliedschaft auch modellseitig eindeutig zugreifbar.
+ *Neue Enumeration `ProjektStatus`.* Das Attribut `Projekt.status` erhält im Entwurf einen eigenen Enumerationstyp `ProjektStatus` mit den Werten `GEPLANT`, `LAUFEND` und `ABGESCHLOSSEN`, damit die auftragsspezifischen Zustände `PAUSIERT`, `VERZUG` und `ARCHIVIERT` aus `AuftragStatus` -- die auf Projektebene fachlich unpassend sind -- nicht mehr verwendet werden können.
+ *Adapter für den Altsystem-Import.* Die im Lastenheft geforderte Datenmigration aus dem alten System wird über die Schnittstelle `IImportQuelle` und den Objektadapter `AltsystemAdapter` gekapselt. Ein alternativer `CSVImporter` implementiert dieselbe Schnittstelle, sodass die aufrufende Klasse `ImportAdapter` unverändert bleibt, wenn zusätzliche Importquellen ergänzt werden.

== Beschreibung der Pakete

Die inhaltliche Erläuterung des Entwurfsklassendiagramms erfolgt paketweise. Auf die einzelnen Attribute und Signaturen wird nur dann eingegangen, wenn deren Bedeutung nicht bereits aus dem Klassenkopf im Diagramm hervorgeht.

=== Externe Systeme

Das Paket _Externe Systeme_ fasst die drei Nachbarsysteme zusammen, mit denen die Verwaltungssoftware kommuniziert. Die Klasse `Finanzbuchhaltung` stellt die Schnittstelle für den ausschließlich lesenden Zugriff auf Rechnungs-, Mahnungs- und Kostenvoranschlagsdaten bereit; die Verbindung zur Klasse `Rechnung` wird als `<<use>>`-Abhängigkeit modelliert. Die Klasse `Altsystem` kapselt das im Lastenheft beschriebene Legacy-System und wird ausschließlich durch den `AltsystemAdapter` verwendet. Die Klasse `Drucker` bündelt die Druckfunktionen für `Dokument` und `Rechnung` und ist ebenfalls über eine `<<use>>`-Abhängigkeit an das Paket _Projekte und Aufträge_ gebunden.

=== Personen

Das Paket _Personen_ übernimmt weitgehend die Struktur des Analyse-Klassendiagramms, konkretisiert sie jedoch um Sichtbarkeiten und Typangaben. Die abstrakte Klasse `Person` fasst die gemeinsamen Personenstammdaten zusammen und definiert einen `protected`-Konstruktor sowie die Operation `getFullName(): String`. `Mitarbeiter` und `Unterauftragnehmer` erben von `Person` und ergänzen ihre jeweiligen Fachattribute. Die Klasse `Mitarbeiter` bietet zusätzlich die Operation `anwesenheitEintragen(...)` an, die eine neue `Anwesenheitszeit` erzeugt und der Komposition hinzufügt; die Rückreferenz auf die Rolle erfolgt typsicher über das Enum `Rolle`. Die Klasse `Gruppe` bleibt in ihrer Analyse-Struktur bestehen, wird aber um explizite Operationen zur Mitgliederverwaltung erweitert. Die n:m-Beziehung zwischen `Mitarbeiter` und `Gruppe` wird zusätzlich um die Assoziationsklasse `Gruppenmitgliedschaft` verfeinert; sie trägt die Attribute `rolleInGruppe`, `seit` und `istStellvertreter` und stellt damit die im GUI-Mockup sichtbaren Zusatzinformationen zur Gruppenzugehörigkeit modellseitig bereit. Der bereits im Analyse-Klassendiagramm formulierte Constraint, dass Gruppen vom Typ `BAUGRUPPE` mindestens einen Gruppenleiter besitzen müssen, gilt auf Entwurfsebene unverändert weiter und wird auf Anwendungsebene erzwungen.

=== Projekte und Aufträge

Das Paket _Projekte und Aufträge_ ist im Entwurf gegenüber der Analyse deutlich strukturierter, da hier die abstrakte Klasse `Auftrag` als Wurzel der Auftragshierarchie eingeführt wird. Sie bündelt die für `Arbeitsauftrag` und `Unterauftrag` identischen Attribute, definiert die zugehörigen `Termin`-Assoziationen mit Multiplizität `2..*` und fordert von ihren Ableitungen die konkrete Implementierung der abstrakten Operation `kosten(): BigDecimal`. Die Selbstassoziation `Auftrag "1" *-- "0..*" Auftrag` mit den Rollennamen `parent` und `enthält` realisiert das Kompositum-Muster (siehe zugehörigen Unterabschnitt im Kapitel "Verwendete Entwurfsmuster"). `Projekt` bleibt aus der Analyse übernommen und stellt weiterhin über eine Komposition den Container für die zugehörigen Arbeitsaufträge dar; die Operation `auftragAnlegen(): Arbeitsauftrag` delegiert die Erzeugung an die zuständige `ArbeitsauftragFactory`. `Rechnung`, `Dokument` und `Termin` bleiben inhaltlich unverändert, werden aber um Typreferenzen auf die Enumerationen `DokumentTyp` und `TerminTyp` sowie auf die Wertklasse `Datei` angereichert.

=== Geräteverwaltung

Im Paket _Geräteverwaltung_ finden sich die aus der Analyse bekannten Klassen `Geräte-Typ`, `Gerät`, `Ausrüstung`, `Lager` und `Buchung` in unveränderter fachlicher Bedeutung, aber mit deutlich präzisierter Notation. Der `GerätStatus` bleibt auch auf Entwurfsebene ausschließlich für dauerhafte technische Zustände reserviert (`VERFUEGBAR`, `IN_WARTUNG`, `DEFEKT`, `AUSSER_BETRIEB`); ein Statuswert `GEBUCHT` ist konsequent nicht enthalten, da eine zeitraumbezogene Belegung -- wie im Aktivitätsdiagramm sichtbar -- ausschließlich aus aktiven `Buchung`-Objekten abgeleitet wird. Analog trägt das Attribut `Projekt.status` den Typ der eigenen Enumeration `ProjektStatus` (`GEPLANT`, `LAUFEND`, `ABGESCHLOSSEN`) und nicht `AuftragStatus`, da die auftragsspezifischen Werte `PAUSIERT`, `VERZUG` und `ARCHIVIERT` auf Projektebene fachlich unpassend wären. Die Assoziationsklasse `Buchung` ist -- wie oben beschrieben -- korrekt über eine gestrichelte Linie an die Assoziation `Gerät ↔ Arbeitsauftrag` angebunden und trägt den Zeitraum als Attribut vom Wertklassentyp `Zeitraum` sowie den Status vom Enumerationstyp `BuchungStatus` (`AKTIV`, `ABGESCHLOSSEN`, `STORNIERT`). Die Operation `istVerfügbarIn(z: Zeitraum): boolean` an der Klasse `Gerät` realisiert die im Lastenheft geforderte Verfügbarkeitssuche (LF 50) und bildet gleichzeitig den zentralen Aufrufpunkt für die Verfügbarkeitsprüfung im Sequenzdiagramm (siehe Kapitel 6).

=== Bilder

Das Paket _Bilder_ umfasst die Schnittstelle `Bildbar` und die konkrete Klasse `Bild`. Die vier Klassen `Arbeitsauftrag`, `Projekt`, `Gerät` und `Mitarbeiter` implementieren `Bildbar` (gestrichelte Linien mit ausgefüllter Dreieckspitze). Die inhaltliche Aussage des Analyse-Klassendiagramms -- eine einheitliche Bildzuordnung über einen gemeinsamen Obertyp -- wird auf Entwurfsebene technisch dadurch realisiert, dass `Bildbar` als Interface umgesetzt wird. So bleibt die einzelne Assoziation `Bild "0..*" -- "0..1" Bildbar` bestehen, während zugleich Mehrfachvererbungen (etwa an `Mitarbeiter`, der bereits von `Person` erbt) vermieden werden. Neue bildtragende Klassen können nachträglich hinzugefügt werden, ohne dass die Klasse `Bild` verändert werden muss.

=== Persistenz und Import/Export

Das Paket _Persistenz und Import/Export_ ist die zentrale Neuerung des Entwurfs und verbindet den fachlichen Kern mit Datenhaltung und externen Systemen. Herzstück ist die `<<singleton>>`-Klasse `Datenbasis` (LD 10), die alle persistenten Entitäten aggregiert und globale Suche (`findAufträge`), Duplikatsprüfung (`existiertBereits`, LF 100) sowie das Beobachter-Ereignisnetz bereitstellt. Die abstrakte `AuftragFactory` mit den Ableitungen `ArbeitsauftragFactory` und `UnterauftragFactory` kapselt die Auftragserzeugung inkl. Nummernvergabe. Für Migration und Import implementieren `AltsystemAdapter` (mit `<<use>>` auf `Altsystem`) und `CSVImporter` die Schnittstelle `IImportQuelle`; der `CSVExporter` übernimmt den Export.

=== GUI (reduziert)

Das Paket _GUI_ ist -- wie eingangs erwähnt -- bewusst reduziert dargestellt. Es enthält lediglich die als `<<singleton>>` gekennzeichnete Klasse `GUIController` als zentrale Steuerinstanz der Benutzeroberfläche sowie die Schnittstelle `IUpdateEventListener`, welche im Kommunikationsschema (siehe Kapitel 8) von den konkreten View-Klassen wie `AufträgeÜbersichtPanel` implementiert wird. Die Aufgabe des `GUIController` besteht darin, Benutzereingaben aus den Views an die Fachschicht weiterzuleiten und die konkreten Views als Beobachter beim `Datenbasis`-Singleton zu registrieren; das eigentliche Empfangen von Datenaktualisierungen erfolgt in den View-Klassen selbst. Eine begleitende Notiz weist auf das ausführliche Kommunikationsschema in Kapitel 8 hin, in dem die weiteren View-, Controller- und Event-Klassen samt Java-Swing-Anbindung vollständig modelliert sind.

=== Datentypen

Das Paket _Datentypen_ fasst sämtliche Wertobjekte und Enumerationen zusammen. Die Wertklassen `Adresse`, `Zeitraum` und `Datei` sind mit dem Stereotyp `<<datatype>>` versehen; die zehn Enumerationen `Rolle`, `Position`, `AuftragStatus`, `BuchungStatus`, `GerätStatus`, `AnwesenheitTyp`, `GerätKategorie`, `Gruppentyp`, `TerminTyp` und `DokumentTyp` sind einheitlich als `<<enumeration>>` gekennzeichnet. Wie im Aufbau bereits erwähnt, wurden aus Gründen der Übersichtlichkeit keine Assoziationslinien zu den übrigen Klassen eingezeichnet.

== Verwendete Entwurfsmuster

Entwurfsmuster sind Lösungsvorlagen für wiederkehrende Probleme des Softwareentwurfs. Im Folgenden werden die im Entwurfsklassendiagramm eingesetzten Muster einzeln vorgestellt und ihre Anwendung begründet.

=== Singleton

Die Klassen `Datenbasis` und `GUIController` sind jeweils mit dem Stereotyp `<<singleton>>` ausgezeichnet. Beide Klassen dürfen im gesamten System genau eine Instanz besitzen: die `Datenbasis`, weil die im Lastenheft (LD 10) geforderte zentrale Datenhaltung ansonsten in verschiedene, potentiell inkonsistente Zustände zerfallen würde, und der `GUIController`, weil er als Bindeglied zwischen sämtlichen Views und der Geschäftslogik einen eindeutigen Eintrittspunkt bilden muss. Der Zugriff erfolgt in beiden Fällen über die statische Operation `getInstance()`, das jeweilige `INSTANCE`-Attribut ist als privat und statisch (im Diagramm unterstrichen) markiert, der Konstruktor ist privat. Auf diese Weise wird sowohl die Einzigartigkeit als auch die kontrollierte Erzeugung sichergestellt.

=== Kompositum

Das Kompositum-Muster wird durch die Selbstassoziation der abstrakten Klasse `Auftrag` realisiert: Sowohl `Arbeitsauftrag` als auch `Unterauftrag` erben von `Auftrag` und können über die Referenz `parent`/`enthält` rekursiv weitere Unteraufträge tragen. So entsteht eine Baumstruktur, die über die im Lastenheft (LF 40) skizzierte Zwei-Ebenen-Struktur hinausgeht (ein Spezialfall der allgemeinen Kompositstruktur) und die für Bauprojekte reale mehrstufige Verschachtelung von Gewerken erlaubt. Da die Operation `kosten(): BigDecimal` an der abstrakten Wurzel definiert ist, lässt sich der Gesamtaufwand durch rekursive Summation bestimmen, ohne dass der Client zwischen Blatt- und Kompositknoten unterscheiden muss.

=== Beobachter

Die Klasse `Datenbasis` realisiert die Schnittstelle `IUpdateEventSender` und bringt über die Operationen `register(l: IUpdateEventListener)`, `unregister(l: IUpdateEventListener)` und `fireUpdate()` einen klassischen Beobachter-Mechanismus ein. Interessierte Empfänger implementieren die Schnittstelle `IUpdateEventListener` und werden bei relevanten Datenänderungen automatisch benachrichtigt. Konkrete Beobachter sind gemäß dem Kommunikationsschema (Kapitel 8) die View-Klassen wie `AufträgeÜbersichtPanel`; die Aufgabe des `GUIController` besteht darin, diese Views beim `Datenbasis`-Singleton an- und abzumelden. Das Muster entkoppelt die Datenbasis von den konkreten Empfängern ihrer Ereignisse -- die `Datenbasis` selbst kennt keine der aufrufenden Sichten und bleibt entsprechend testbar.

=== Fabrikmethode

Die zentrale Erzeugung neuer Auftragsobjekte ist über das Fabrikmethode-Muster geregelt. Die abstrakte Klasse `AuftragFactory` definiert die Signatur `erzeugeAuftrag(...): Auftrag`, die von den beiden konkreten Ableitungen `ArbeitsauftragFactory` und `UnterauftragFactory` typspezifisch überschrieben wird. Der Zähler an der abstrakten Klasse gewährleistet die eindeutige Vergabe von Auftragsnummern über beide Arten hinweg. Vorteil dieses Musters ist, dass ein aufrufender Client (etwa `Projekt.auftragAnlegen()`) unverändert bleibt, wenn im späteren Entwurf zusätzliche Auftragsarten hinzukommen sollten; die Erweiterung erfolgt ausschließlich über eine neue Fabrikklasse.

=== Objektadapter

Der Objektadapter wird beim Datenimport aus dem Altsystem eingesetzt. Die Schnittstelle `IImportQuelle` gibt eine einheitliche Sicht auf beliebige Importquellen vor (`leseDaten(): List<Object>` und `istVerfügbar(): boolean`). Die konkrete Klasse `AltsystemAdapter` implementiert diese Schnittstelle und delegiert intern an die externe Klasse `Altsystem`, deren proprietäres Format (`legacyExport(): byte[]`) sie in die für die restliche Anwendung einheitliche Datenstruktur überführt. Analog dazu implementiert `CSVImporter` dieselbe Schnittstelle für den Import aus CSV-Dateien. Der `ImportAdapter` als aufrufender Client kennt nur die Schnittstelle `IImportQuelle`, wodurch sich zusätzliche Importquellen ohne Änderungen an der aufrufenden Klasse ergänzen lassen. Damit wird die im Lastenheft geforderte Datenmigration konsequent nach dem Prinzip der Abhängigkeitsumkehr modelliert.

=== Assoziationsklasse (Koordinator)

Die Klasse `Buchung` bleibt inhaltlich das aus dem Analyse-Klassendiagramm bekannte Koordinator-Objekt zwischen `Gerät` und `Arbeitsauftrag`, wird jedoch im Entwurf durch die korrekte UML-Notation der Assoziationsklasse gekennzeichnet. Die reguläre Assoziation zwischen `Gerät` und `Arbeitsauftrag` wird um eine gestrichelte Verbindungslinie zur Klasse `Buchung` ergänzt; damit ist unmissverständlich modelliert, dass die Attribute der Buchung (Zeitraum, Status, buchender Mitarbeiter) nicht einer der beiden beteiligten Klassen allein zugeordnet werden können, sondern der Assoziation selbst.

== Reflexion

Das Entwurfsklassendiagramm bündelt die fachliche Struktur des Analyse-Klassendiagramms mit den zur Umsetzung erforderlichen infrastrukturellen Klassen. Die abstrakte Klasse `Auftrag` vermeidet redundante Attribute und platziert zugleich das Kompositum-Muster; die Schnittstelle `Bildbar` löst die in der Analyse offen gelassene Bildzuordnung erweiterbar; die Trennung von Wertobjekten und Enumerationen in ein eigenes Paket erhöht die Lesbarkeit.

Die Modellierungstiefe wurde bewusst begrenzt: keine Assoziationslinien im Datentypen-Paket, nur zwei Ankerklassen im GUI-Paket mit Verweis auf das Kommunikationsschema, und Reduktion des Beobachter-Mechanismus auf die Kernklassen. Die feinere Ausgestaltung findet sich im Kommunikationsschema sowie in den Sequenz- und Aktivitätsdiagrammen, während dieses Diagramm den strukturellen Gesamtblick liefert.
