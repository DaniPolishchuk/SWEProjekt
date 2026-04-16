**==> picture [411 x 387] intentionally omitted <==**

**----- Start of picture text -----**<br>
Software Engineering I<br>Grundlagen der Objektorientierung<br>Einführung in die objektorientierte Datenmodellierung<br>Institut für Angewandte Informatik (IAI)<br><<enumeration>> 1?<br>kann explzk referenzient werden, \ ge ¥ 1 oS andor<br>JdRef.OR-Becingungauf Eigentinzeltel)(ansonsten aber ra /f ,o\\ % Ssi ae Me eS<br>4 i f / \ Ke SS oe<br>' i: | [| [| [| [sd<br>| os<br>10 ¢ i) [Crenaisree<br>— [Cd<br>-Laenge : float Klasse _—4+ nN a ae<br>—_—_=J _— ad Ss.<br>a A 0.2 [| / Y<br>— — —_<br>jena<br>Klasse<br>Imebrere 4 A<br>w [<br>KIT – Universität des Landes Baden-Württemberg und<br>nationales Forschungszentrum in der Helmholtz-Gemeinschaft<br>**----- End of picture text -----**<br>


## **Historie** 

## Objektorientierte Programmierung 

Seit den späten 50er bzw. frühen 60er Jahren bekannt (LISP, Simula 67, Smalltalk, später C++, C#, Java, … ) Beinhaltet Attribute, Funktionen sowie Verbindungen zu anderen Objekten 

## Objektorientierte Modellierung 

1990:  OOD (Object Oriented Design, Booch) 

1992:  OMT (Object Modeling Technique, Rumbaugh) OOA (Object Oriented Analysis, Coad/Yourdon) OOSE (Object Oriented Software Engineering, Jacobsen) 1997:  UML (Unified Modeling Language, Booch/Jacobsen/Rumbaugh), standardisiert durch OMG (Object Management Group) 2004:  UML 2.0 

Grundlagen der Objektorientierung 

R. Lutz, Institut für Automation und angewandte Informatik (IAI) 

**2** 18.11.2019 

## **Softwareentwicklungs-Prozess** 

Jede Softwareentwicklung beinhaltet eine gründliche **Analyse** der Problemstellung! 

Teilweise drastische Reduzierung von Zeit und Komplexität  bei Entwurf, Implementierung und Test der späteren Software. Analyse führt zur Identifikation der beteiligten Elemente und Zusammenhänge (Klassen, Objekte und Relationen) 

„Ur-Modell“ ist das Wasserfallmodell nach Royce und Böhm 

(bildet die Grundlage fast aller weiteren Vorgehensmodelle der Softwareentwicklung. Es kann modifiziert auch heute noch auf Komponentenebene gut eingesetzt werden) 

Anforderungen 

Analyse 

Entwurf 

Implementierung 

Test 

Betrieb 

Grundlagen der Objektorientierung 

R. Lutz, Institut für Automation und angewandte Informatik (IAI) 

**3** 18.11.2019 

**Was ist ein Objekt?** 

allgemein: eine Sache oder ein Gegenstand eine Einheit beim Programmieren 

eine Einheit beim Modellieren, d.h. Analysieren und Entwerfen ein Objekt kann konkret oder auch konzeptuell sein: 

## _**konkret**_ 

Datei in Dateisystem, Hund, Katze, Person, Haus, Computer, … 

_**konzeptuell**_ 

Zuteilungsstrategie in einem Multiprozessor-Betriebssystem, Buchung eines Flugs oder eines Zimmers, Kauf eines Gegenstands, usw. 

Grundlagen der Objektorientierung 

R. Lutz, Institut für Automation und angewandte Informatik (IAI) 

**4** 18.11.2019 

**Was ist Objektorientierung?** 

Methodik und Vorgehensweise beim Erstellen von Softwareprodukten, bei denen Objekte und deren Zusammenhänge im Mittelpunkt stehen Objekte vereinen Daten(-struktur) **und** Verhalten (Funktionalität) in sich Gegensatz: konventionelle, _prozedurale SW-Entwicklung (Programmierung)_ Funktionen und Strukturen stehen im Mittelpunkt Datenstruktur und Verhalten sind nur lose miteinander verbunden 

Grundlagen der Objektorientierung 

R. Lutz, Institut für Automation und angewandte Informatik (IAI) 

**5** 18.11.2019 

**Was ist objektorientierte Modellierung?** 

Möglichst genaue Abbildung eines Problembereichs der realen Welt in die Modellwelt. 

Wird für die Analyse des Problemumfelds und für den Entwurf der Software verwendet (A & E stehen im SW-Entwicklungsprozess **vor** grundsätzlich der Implementierung) 

Ab einer bestimmten Komplexität des Problemumfelds unerlässlich (vermeidet fehleranfälliges „happy hacking“) Ein Teil des Modells kann direkt in Quellcode umgewandelt werden. 

Grundlagen der Objektorientierung 

R. Lutz, Institut für Automation und angewandte Informatik (IAI) 

**6** 18.11.2019 

**Was ist der Vorteil von Objektorientierung?** 

Aufgaben, Strukturen, Eigenschaften (Attribute) können klar getrennt und separat behandelt werden (Übersichtlichkeit) Gemeinsamkeiten können gebündelt werden (Vereinfachung) 

Ergebniselemente (Klassen) können leichter in anderen SW-Produkten verwendet werden 

**hohe Wiederverwendbarkeit!** 

Grundlagen der Objektorientierung 

R. Lutz, Institut für Automation und angewandte Informatik (IAI) 

**7** 18.11.2019 

**Objekte, Klassen, Instanzen, Methoden, Operationen ???** 

: Objekte (alternativ: Instanzen) 

reale Elemente in Alltag, Problemumfeld und Programm 

Klassen: 

Beschreibung (Definition, Schablone) eines Objekts. Eine Klasse besteht aus Attributen (Eigenschaften bzw. Daten) und Methoden (Verhalten) 

: Operation Beschreibung des Verhaltens von Objekten einer Klasse 

Methode: O Realisierung (Implementierung, Quellcode) einer Operation Wird oft auch als alternativer Begriff für Operation verwendet 

Grundlagen der Objektorientierung 

R. Lutz, Institut für Automation und angewandte Informatik (IAI) 

**8** 18.11.2019 

**==> picture [670 x 484] intentionally omitted <==**

**----- Start of picture text -----**<br>
Herausforderung<br>Karlsruher Institut fur Technologie|<br>a) Wie kommt man von der realen Welt in die Modellwelt?<br>a) Wie findet man die passenden Objekte, Klassen und Attribute?<br>??? Software<br>Klassen<br>Referenzen<br>Attribute<br>Funktionalität<br>9 18.11.2019 Grundlagen der Objektorientierung R. Lutz, Institut für Automation und angewandte Informatik (IAI)<br>**----- End of picture text -----**<br>


**==> picture [670 x 484] intentionally omitted <==**

**----- Start of picture text -----**<br>
Herausforderung 1:  Identifizieren der Klassen<br>Karlsruher Institut fur Technologie<br>Laptop<br>Boot<br>Tasse<br>10 18.11.2019 Grundlagen der Objektorientierung R. Lutz, Institut für Automation und angewandte Informatik (IAI)<br>**----- End of picture text -----**<br>


**Herausforderung 2:  Identifizieren der Attribute** Karlsruher Institut fur Technologie Attribute beschreiben die charakteristischen Eigenschaften einer Klasse 

## Laptop: 

Bildschirmgröße, Farbe, Höhe, Breite, Tiefe, Ausstattung, … an/aus, offen/zu, am Netz / nicht am Netz, 

… 

Boot: 

Form, Farbe, Höhe, Länge, Gewicht, Breite, Platzanzahl, Material, … fahrend/stehend, leer/besetzt, … 

Tasse: 

Form, Farbe, Höhe, Aufdruck, Durchmesser, Material, … 

leer/voll, heiß/kalt, bruchfest/zerbrechlich, 

… 

**11** 18.11.2019 

Grundlagen der Objektorientierung 

R. Lutz, Institut für Automation und angewandte Informatik (IAI) 

**Herausforderung 3:  Identifizieren der Funktionalität** Karlsruher Institut fur Grundfrage:  was macht das Objekt, wenn es „dazu beauftragt“ wird? 

Laptop: 

starten, herunterfahren, Programm ausführen, mit Netz verbinden, … 

Boot: 

losfahren, anhalten, beschleunigen, wenden, … 

Tasse: 

???, … 

**12** 18.11.2019 

Grundlagen der Objektorientierung 

R. Lutz, Institut für Automation und angewandte Informatik (IAI) 

**Herausforderung 4:  Identifizieren assoziierter Klassen** Karlsruher Grundfrage:  zu welchen anderen Objekten gibt es Verbindungen? 

Laptop: 

Tastatur, Festplatte, CPU, Touchpad, Bildschirm, Netzverbindung, Besitzer, … 

Boot: 

Motor, Sitze, Lenkrad, Kajüte, Fahrer, Besitzer, Mitfahrer, … 

Tasse: 

Besitzer, Deckel, Inhalt, … 

**13** 18.11.2019 

Grundlagen der Objektorientierung 

R. Lutz, Institut für Automation und angewandte Informatik (IAI) 

**Herausforderung 5:  Identifizieren von Gemeinsamkeiten** Karlsruher Institut Grundfrage:  welche Gemeinsamkeiten und Unterschiede gibt es für „gleichartige“ Objekte? 

## PKW: 

Hersteller, Modell, Höhe, Breite, Länge, Leistung, Verbrauch, Gewicht, Farbe, an/aus, offen/zu, Sitzplätze, … fahren, stehen, tanken, beschleunigen, …  Motor, Räder, Sitze, Besitzer, **Faltdach** , … 

## LKW: 

Hersteller, Modell, Höhe, Breite, Länge, Leistung, Verbrauch, Gewicht, Farbe, an/aus, offen/zu, Sitzplätze, … fahren, stehen, tanken, beschleunigen, …  Motor, Räder, Sitze, Besitzer, **Kran, Seilwinde,** … 

## Bus: 

Hersteller, Modell, Höhe, Breite, Länge, Leistung, Verbrauch, Gewicht, Farbe, an/aus, offen/zu, Sitzplätze, … fahren, stehen, tanken, beschleunigen, …  Motor, Räder, Sitze, Besitzer, **Mikrofon** , … 

**14** 18.11.2019 Grundlagen der Objektorientierung 

R. Lutz, Institut für Automation und angewandte Informatik (IAI) 

**Wie werden die Objekte geeignet dargestellt?** 

Objektdiagramm, Instanzendiagramm 

Formale grafische Notation, um real vorhandene **Objekte** und deren Relationen zu anderen Objekten darzustellen. Es können beliebig viele Objekte desselben Typs (Klasse) existieren. 

Besonders nützlich, um Testfälle (vor allem Szenarien) zu dokumentieren und Beispiele zu diskutieren. 

Klassendiagramm 

Grafische Notation, um **Klassen** und deren Relationen zu anderen Klassen darzustellen. Schema, Muster oder Template (Schablone) zur Beschreibung vieler möglichen Objektinstanzen. Ein Klassendiagramm beschreibt Objektklassen. 

Jede Klasse ist nur einmalig vorhanden. 

Ein gegebenes Klassendiagramm entspricht einer unendlichen Menge von Instanzendiagrammen 

Grundlagen der Objektorientierung 

R. Lutz, Institut für Automation und angewandte Informatik (IAI) 

**15** 18.11.2019 

**Die 5 wichtigsten Aspekte der Objektorientierung** 

Identität Klassifikation Vererbung Polymorphie (Polymorphismus) Kapselung 

Grundlagen der Objektorientierung 

R. Lutz, Institut für Automation und angewandte Informatik (IAI) 

**16** 18.11.2019 

## **Die 5 wichtigsten Aspekte der OO:  1.) Identität** 

Daten werden diskreten, unterscheidbaren Entitäten (Objekten) zugeordnet Jedes Objekt besitzt eine eigene inhärente ("ihm innewohnende") Identität, d.h. zwei Objekte sind klar voneinander unterscheidbar, selbst wenn alle ihre Attributwerte (wie Name oder Größe) identisch sind 

Jedes Objekt hat in einer Programmiersprache einen eindeutigen " _Anfasser_ “ (z.B. Speicheradresse „0xN“)  ermöglicht eindeutigen Zugriff 

Klasse: _**Bild**_ 

Attribute:  Titel Name d. Künstlers Breite Höhe Stilrichtung 

0x1 0x2 0x3 0x4 0x5 

Grundlagen der Objektorientierung 

**17** 18.11.2019 

R. Lutz, Institut für Automation und angewandte Informatik (IAI) 

## **Die 5 wichtigsten Aspekte der OO:  1.) Identität (2)** 

## Objektzugriffe 

sind einheitlich und unabhängig vom Inhalt der Objekte 

erlauben es, gemischte Objektkollektionen zu erzeugen (z.B. durch ein Dateisystem-Verzeichnis, das sowohl Dateien als auch Unterverzeichnisse enthält).  siehe _Polymorphie_ 

Java-Beispiel: 

**public class Hundeschule{** 

**. . .** 

**Hund fiffi = new Hund(„Fiffi“); Hund bello = new Hund(„Bello“); bello.machMaennchen(); fiffi.machMaennchen(); bello.sitz(); fiffi.sitz();** 

**. . .** 

**}** 

Grundlagen der Objektorientierung 

R. Lutz, Institut für Automation und angewandte Informatik (IAI) 

**18** 18.11.2019 

**Die 5 wichtigsten Aspekte der OO: 2.) Klassifikation** 

Objekte mit der gleichen Datenstruktur ( _**Attribute**_ ) und dem gleichen Verhalten ( _**Operationen, Methoden**_ ) können zu einer _**Klasse**_ gruppiert werden 

**==> picture [670 x 253] intentionally omitted <==**

**----- Start of picture text -----**<br>
TA. —— Landfahrzeug<br>==<br>= soe<br>Fahrzeug<br>ao” *&<br>Wasserfahrzeug<br>19 18.11.2019 Grundlagen der Objektorientierung R. Lutz, Institut für Automation und angewandte Informatik (IAI)<br>**----- End of picture text -----**<br>


**Die 5 wichtigsten Aspekte der OO: 2.) Klassifikation (2)** 

Eine _**Klasse**_ ist eine Abstraktion, die die Eigenschaften beschreibt, die für eine Anwendung wichtig sind, und den Rest ignoriert. Die Wahl von Klassen ist immer beliebig und hängt von der Anwendung ab Jede Klasse beschreibt eine unendliche Menge individueller Objekte. Jedes Objekt (Instanz) der Klasse besitzt eigene **Werte** für alle ihre Attribute, während sie die Attributnamen und Operationen mit anderen Instanzen der Klasse teilt. Titel='Kirche von Auvers' se Künstler='Vincent van Gogh' Klasse: _**Bild**_ Breite=74 ee ; el Ay Höhe=94 Titel='Turm der blauen Pferde' Stil='Impressionismus' Künstler='Franz Marc' Attribute:  Titel Breite=130 a Höhe=200 }. Künstler Stil='Expressionismus' Breite Titel='Mona Lisa' ae 0 Höhe Künstler='Leonardo da Vinci' mee AP ae Stil ; Breite=53 ) a Höhe=77 Stil='Renaissance' ibe fy : bi 18.11.2019 Grundlagen der Objektorientierung R. Lutz, Institut für Automation und angewandte Informatik (IAI) 

**20** 18.11.2019 

R. Lutz, Institut für Automation und angewandte Informatik (IAI) 

**==> picture [670 x 484] intentionally omitted <==**

**----- Start of picture text -----**<br>
Die 5 wichtigsten Aspekte der OO:  3.) Vererbung<br>Karlsruher Institut fur Technologie<br>Mehrere Klassen mit denselben Attributen und/oder demselben Verhalten<br>können durch eine gemeinsame Oberklasse repräsentiert werden<br>( Generalisierung , v.a. in Analysephase)<br>Eine Klasse kann sehr allgemein definiert sein und dann in immer detailliertere<br>Unterklassen verfeinert werden ( Verfeinerung , v.a. in Entwurfsphase)<br>Fahrzeug<br>Oberklassen<br>Landfahrzeug Wasserfahrzeug<br>Unterklassen<br>PKW LKW Bus Floß Boot<br>21 18.11.2019 Grundlagen der Objektorientierung R. Lutz, Institut für Automation und angewandte Informatik (IAI)<br>**----- End of picture text -----**<br>


**Die 5 wichtigsten Aspekte der OO: 3.) Vererbung (2)** 

Jede Unterklasse übernimmt oder erbt alle Eigenschaften und Methoden ihrer Oberklasse und fügt ihre eigenen individuellen Eigenschaften und Methoden hinzu 

**public class Oberklasse{** 

**. . .** 

**public int OberklassenAttribut; public void doSomething(){..} }** 

**public class Unterklasse extends Oberklasse{ public int UnterklassenAttribut; public void doItYourself() }** 

geerbt 

eigen 

**public class IrgendeineKlasse{ public Unterklasse ukl; . . . ukl = new Unterklasse(); ukl.doSomething(); ukl.OberklassenAttribut=5;** 

**ukl.doItYourself(); ukl.UnterklassenAttribut=4; . . .** 

**}** 

Grundlagen der Objektorientierung 

R. Lutz, Institut für Automation und angewandte Informatik (IAI) 

**22** 18.11.2019 

**Die 5 wichtigsten Aspekte der OO : 4.) Polymorphie** 

Polymorphie tritt immer im Zusammenhang mit Vererbung und Schnittstellen, d.h. mit Oberklassen und Interfaces auf 

**Die 2 wichtigsten Arten von Polymorphie:** 

Polymorphie von Datentypen oder Klassen Polymorphie einer Methode  bzw. Operation 

Grundlagen der Objektorientierung 

R. Lutz, Institut für Automation und angewandte Informatik (IAI) 

**23** 18.11.2019 

**Die 5 wichtigsten Aspekte der OO: 4.) Polymorphie** 

**Polymorphie von Datentypen oder Klassen:** 

Eigenschaft einer Variablen, für Objekte verschiedener Klassen stehen zu können („Platzhalter“) 

Deklaration: 

Erzeugung bzw. Verwendung: 

**public class Oberklasse{ public class IrgendeineKlasse{ . . . public Oberklasse okl; public void doSomething(){ . . . . . . okl = new UnterklasseEins(); } okl.doSomething(); } . . . okl = new UnterklasseZwei(); public class UnterklasseEins okl.doSomething(); extends Oberklasse{…} . . . } public class UnterklasseZwei extends Oberklasse{…}** 

Grundlagen der Objektorientierung 

**24** 18.11.2019 

R. Lutz, Institut für Automation und angewandte Informatik (IAI) 

**Die 5 wichtigsten Aspekte der OO:  4.) Polymorphie Polymorphie einer Methode bzw. Operation:** 

Eine **Methode** ist **polymorph** , wenn sie in verschiedenen Klassen die gleiche Spezifikation hat, jedoch in der jeweiligen Klasse individuell implementiert ist (so genanntes _Überschreiben_ ) 

**public class Oberklasse{** 

**. . . public void doSomething(){ . . . } }** 

**public class UK1 extends Oberklasse{ public class UK2 extends Oberklasse{ . . . . . . public void doSomething(){ public void doSomething(){ // spezifische Impl. für UK1 // spezifische Impl. für UK2 } } . . . . . . } } 25** 18.11.2019 Grundlagen der Objektorientierung R. Lutz, Institut für Automation und angewandte Informatik (IAI) 

**==> picture [252 x 10] intentionally omitted <==**

**----- Start of picture text -----**<br>
R. Lutz, Institut für Automation und angewandte Informatik (IAI)<br>**----- End of picture text -----**<br>


**Die 5 wichtigsten Aspekte der OO:  5.) Kapselung** 

Unter Kapselung versteht man das Verbergen von Implementierungsdetails, Daten oder Informationen vor dem Zugriff von außen. Der direkte Zugriff auf interne Daten(-struktur) wird unterbunden und erfolgt stattdessen ausschließlich über definierte Schnittstellen („Black-Box-Modell“, „kontrollierbare“ _set-_ Methoden ) 

Objekte können den Zustand anderer Objekte _nicht direkt_ unerlaubt lesen oder ändern. Das kann über so genannte Sichtbarkeitskriterien gesteuert werden ( _private, public, protected,_ etc.) 

**public class AnyClass { . . . public int anAttribute = 0; . . .** 

**public class CallingClass{** 

Besser! 

**public class AnyClass { . . . private int anAttribute = 0;** 

**. . .** 

**public void setAnAttribute( int val ){ this.anAttribute = val; log(“anAttribute changed to “+val); }** 

**. . .** 

**AnyClass ac = new AnyClass(…); ac.anAttribute = 123;** 

**. . . AnyClass ac = new AnyClass(…); ac.setAnAttribute( 123 );** 

**. . .** 

**. . .** 

Grundlagen der Objektorientierung 

R. Lutz, Institut für Automation und angewandte Informatik (IAI) 

**26** 18.11.2019 

**Zusammenfassung** 

Erläuterung der Begriffe: 

Objektorientierung: Objekt, Klasse, Instanz, Attribut, Operation, .. Identifizieren von Objekten und Klassen Erklärung der 5 wichtigsten Aspekte der Objektorientierung Identität Klassifikation Vererbung Polymorphie (Polymorphismus) Kapselung 

Grundlagen der Objektorientierung 

R. Lutz, Institut für Automation und angewandte Informatik (IAI) 

**27** 18.11.2019 

