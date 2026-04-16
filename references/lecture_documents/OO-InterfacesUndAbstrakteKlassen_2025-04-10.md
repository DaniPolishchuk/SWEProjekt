**SWE 1** 

## Grundlagen der Objektorientierung 

# **Interfaces und abstrakte Klassen (bei Java und UML) Stand 10.04.2025** 

R. Lutz,  KIT/IAI 

Grundlagen der Objektorientierung – Interfaces und abstrakte Klassen 

1 

**SWE 1** 

**Interfaces und abstrakte Klassen** 

- Elemente zur Modellierung von: 

– gemeinsamem Verhalten 

– Vererbungen / Generalisierungen / „Gruppierungen“ / Abstraktionen 

- Erhöhung der Flexibilität  => Wiederverwendbarkeit 

- Wesentliche Elemente u.a. in Design Patterns 

R. Lutz,  KIT/IAI 

Grundlagen der Objektorientierung – Interfaces und abstrakte Klassen 

2 

**SWE 1** 

## **Abstrakte Klassen** 

- Können **nicht direkt** instanziiert werden, nur als anonyme Instanzen mit direktem Überschreiben der deklarierten Methoden: 

`public abstract class AbstractClass { public abstract void doSomething(); }` 

`AbstractClass ac = new AbstractClass() { @Override` 

`public void doSomething() { System.out.println( "moin!" ); }; }; ac.doSomething();` 

- Können implementierte **und** lediglich deklarierte Methoden enthalten. 

- Dienen dazu, als Basisklasse (Oberklasse) genutzt zu werden, wobei ausschließlich die Unterklassen instanziiert werden sollen. 

- Bei der Implementierung **müssen alle** nur deklarierten Methoden realisiert (implementiert) werden. 

R. Lutz,  KIT/IAI 

Grundlagen der Objektorientierung – Interfaces und abstrakte Klassen 

3 

**SWE 1** 

## **Abstrakte Klassen bei Java und UML** 

## **Java:** 

- Ableitung (Vererbung) mit Schlüsselwort _extends_ 

- Deklaration der abstrakten Methoden mit _abstract_ 

- Werden nicht alle abstrakten Methoden einer abstrakten Klassen in der Unterklasse implementiert, so muss diese Unterklasse ebenfalls als abstrakt deklariert werden. 

## **UML:** 

- Vererbungspfeil wie bei „normalen“ Klassen 

_<<abstract>>_ _**AbstractClass**_ **ConcreteClass** 

- Abstrakte Klassen werden durch einen _kursiv_ geschriebenen Namen und/oder dem Stereotyp _<<abstract>>_ dargestellt 

R. Lutz,  KIT/IAI 

Grundlagen der Objektorientierung – Interfaces und abstrakte Klassen 

5 

**SWE 1** 

## **Interfaces** 

- Können **nicht direkt** instanziiert werden, nur als anonyme Instanzen mit direktem Überschreiben der deklarierten Methoden: 

`ActionListener al = new ActionListener();   // geht nicht !` 

   - `JButton btn = new JButton( "hallo" ); btn.addActionListener( new ActionListener() { @Override` 

      - `public void actionPerformed( ActionEvent e ) { // insert code here` 

      - `}` 

   - `} );` 

- Können wie Klassen weitervererbt werden (auch Mehrfachvererbung bei Java!). Beispiel: _java.util.Collection_ vererbt an _BeanContext_ , _BeanContextServices_ , _List_ , _Set_ und _SortedSet_ 

- Bei der Implementierung **müssen alle** Operationen realisiert (implementiert) oder durch abstrakte Klassen an deren Unterklassen „durchgereicht“ werden 

R. Lutz,  KIT/IAI 

Grundlagen der Objektorientierung – Interfaces und abstrakte Klassen 

6 

## **SWE 1** 

## **Interfaces (Attribute und Methoden)** 

- Enthalten bis Java 8 **ausschließlich** deklarierte Methoden und Konstanten. 

   - Es können keine Attribute deklariert werden 

   - Es können keine statischen Methoden deklariert werden 

   - Methodenrümpfe können seit Java 8 implementiert werden: `public String[] getNames();   // Deklaration` 

      - `public default List<String> getNamesAsList(){  // seit Java 8 return Arrays.asList( this.getNames() );` 

      - `}` 

- Sie dienen dazu, als Template (Schablone) für die Implementierung des Verhaltens und der Eigenschaften einer „Gruppe“ von Klassen genutzt zu werden. 

- Eine Klasse kann mehrere Interfaces implementieren ( Vorsicht bei identischen Methodennamen in den Interfaces!) 

R. Lutz,  KIT/IAI 

Grundlagen der Objektorientierung – Interfaces und abstrakte Klassen 

7 

**SWE 1** 

## **Interfaces (Referenzen)** 

- Es können keine dynamischen Referenzen auf andere Klassen existieren 

- Es können nur Methoden modelliert werden, die mit diesen Referenzen „arbeiten“ (z.B. get-/set-Methoden) 

- Jedoch sind statische Container möglich: 

## `public interface IReferenceTest {` 

`public static final List<String> alleStrings = new ArrayList<>(); public default void addString( String s ) { this.alleStrings.add( s );` 

Modell 

`}}}` 

- `public abstract class AbstractClass implements IReferenceTest { public void printList() {` 

`alleStrings.forEach( e -> System.out.println ( e ) );` 

`}}` 

`AbstractClass ac = new AbstractClass() { @Override public void printList() { alleStrings.forEach( e -> System.out.println( e ) );` 

`}` 

Realisierung: `};` (anonyme Klasse) `ac.addString( “das ist” ); ac.addString( “cool” ); ac.printList();` 

R. Lutz,  KIT/IAI 

Grundlagen der Objektorientierung – Interfaces und abstrakte Klassen 

8 

**SWE 1** 

## **Interfaces (Referenzen)** 

**==> picture [577 x 390] intentionally omitted <==**

**----- Start of picture text -----**<br>
||||||||
|---|---|---|---|---|---|---|
|public|interface|IReferenceTest|{|
|public|static|final List<String> alleStrings|= new|ArrayList<>();|
|public|default|void|addString( String s ) {|
|this.alleStrings.add( s );|
|}}}|
|Modell|
|public abstract class AbstractClass|implements IReferenceTest|{|
|public void printList() {|
|alleStrings.forEach( e -> System.out.println|( e ) );|
|}}|
|AbstractClass|acEins|= new AbstractClass() {|
|@Override public void printList() {|
|alleStrings.forEach( e -> System.out.println( e ) );|
|}|
|Realisierung|};|
|von 2|acEins|.addString( “das ist”);   // für|1. Instanz|
|anonymen|AbstractClass|acZwei|= new AbstractClass() {|// wie|oben|};|
|Klassen:|
|acZwei|.addString( “echt”);      // für|2. Instanz|
|acEins|.addString( “cool!”);|// nochmal|für|1. Instanz|
|acZwei|.printList();|
|Das ist|
|Ausgabe:|echt|
|cool!||identische|Ausgabe|für|acEins|.printList();|

**----- End of picture text -----**<br>


R. Lutz,  KIT/IAI 

Grundlagen der Objektorientierung – Interfaces und abstrakte Klassen 

9 

**SWE 1** 

## **Interfaces bei Java und UML** 

## **Java:** 

- Implementierung mit Schlüsselwort _implements_ 

**<<interface>> GUI-Interface** 

- Deklaration der Methoden ohne Methodenrumpf (geschweifte Klammern) und mit Semikolon 

- Bem.: in Java sind Interfaces auch Klassen! 

**GUI-Component** 

## **UML:** 

- Interfaces werden wie Klassen auch durch ein Rechteck dargestellt 

- Realisierungen ( _implements_ ) werden mit gestrichelten Vererbungs-Pfeilen gezeichnet 

- Zusätzlich wird über den Namen das Stereotyp <<interface>> geschrieben 

R. Lutz,  KIT/IAI 

Grundlagen der Objektorientierung – Interfaces und abstrakte Klassen 

10 

**SWE 1** 

## **Verwendung von Interfaces und abstrakten Klassen** 

## **1. Als „Platzhalter“ für Referenzen auf Klassen desselben „Typs“.** 

: Beispiel (Java) 

Verweis auf eine _java.util.List_ anstatt auf eine _java.util.ArrayList_  Spätere Änderungen der Containerklasse, welche ebenfalls _List_ implementiert, ist ohne Auswirkung auf Quellcode der referenzierenden Klasse möglich. 

(analog _java.util.Map_ und _java.util.HashMap_ usw.) 

**2. Zur Trennung von Klassen für verschiedene Anwendungsbereiche** 

Beispiel: 

Gemeinsame Oberklasse für unterschiedliche Datenbank-Arten. Der Zugriff auf die jeweilige Datenbank ist grundlegend anders und wird in den (konkreten) Unterklassen entsprechend implementiert. 

 z.B.Gemeinsame GUI möglich ohne oder mit minimaler Anpassung 

R. Lutz,  KIT/IAI 

Grundlagen der Objektorientierung – Interfaces und abstrakte Klassen 

11 

**SWE 1** 

## **Verwendung von Interfaces und abstrakten Klassen (2)** 

## **3. Zur Realisierung gemeinsamen Verhaltens verschiedener Klassen** 

Hier finden v.a. _**Interfaces**_ ihre Verwendung. 

_**Abstrakte Klassen**_ werden dann modelliert, wenn das Verhalten aller Unterklassen bereits teilweise in der Oberklasse realisiert werden kann. 

## **4. Zur Definition programmweiter Konstanten** 

## Beispiele: 

`javax.swing.SwingConstants, javax.xml.datatype.DatatypeConstants ,` uvm. 

R. Lutz,  KIT/IAI 

Grundlagen der Objektorientierung – Interfaces und abstrakte Klassen 

12 

**SWE 1** 

## **Verwendung von Interfaces und abstrakten Klassen (3)** 

## **5. Zur „Kommunikation“ zwischen zwei Klassen (s. Observer)** 

Beispiel: 

Eine „neutrale“ GUI-Komponente soll mit der sie erzeugenden Klasse kommunizieren, d.h. beim Drücken eines Buttons soll in dieser Klasse eine bestimmte Funktion ausgeführt werden. 

 Deklaration dieser Funktion in einem Interface, das von der erzeugenden Klasse implementiert werden muss. 

**==> picture [666 x 158] intentionally omitted <==**

**----- Start of picture text -----**<br>
<<interface>>  “<br>„references“ iFace GUI-Component- „implements<br>Interface<br>doSomething(...)<br>IN ss,<br>(Java-Code)<br>. . .  GUI- GUI-Main<br>iFace.doSomething(*) Component<br>. . .<br>doSomething(…)<br>**----- End of picture text -----**<br>


> R. Lutz,  KIT/IAI Grundlagen der Objektorientierung – Interfaces und abstrakte Klassen 

13 

**SWE 1** 

## **Implementierungsbeispiele** 

`public abstract class ExampleAbstractClass { public abstract void anyAbstractFunction( int ijk ); public void implementedAbstractFunction( int klm ){ System.out.println( ”Der Wert von klm ist ” + klm ); }` 

`}` 

`public interface ExampleInterface {` 

`public void anyFunction( int ijk ); public void anyOtherFunction( int klm );` 

`}` 

R. Lutz,  KIT/IAI 

Grundlagen der Objektorientierung – Interfaces und abstrakte Klassen 

14 

**SWE 1** 

## **Implementierungsbeispiele (2)** 

## **Erben von einer abstrakten Klasse** 

`public class ImplClass extends ExampleAbstractClass{` 

- `// muss implementiert werden:` 

`public void anyAbstractFunction( int ijk ){ // do something;` 

`}` 

- `// implementedAbstractFunction() muss nicht implementiert // werden, da bereits in Oberklasse implementiert` 

`}` 

R. Lutz,  KIT/IAI 

Grundlagen der Objektorientierung – Interfaces und abstrakte Klassen 

15 

**SWE 1** 

## **Implementierungsbeispiele (3)** 

## **Einfache Implementierung eines Interfaces** 

`public class ImplClass1 implements ExampleInterface {` 

- `// alle Methoden des Interfaces müssen implementiert // werden:` 

- `public void anyFunction( int ijk ) ){ // do something;` 

`}` 

- `public void anyOtherFunction( int klm ) ){ // do something;` 

`}` 

`}` 

R. Lutz,  KIT/IAI 

Grundlagen der Objektorientierung – Interfaces und abstrakte Klassen 

16 

**SWE 1** 

## **Implementierungsbeispiele (4)** 

## **Implementierung mehrerer Interfaces** 

`public class ImplClass2 implements ExampleInterface, Runnable{` 

- `// alle Methoden ALLER Interfaces müssen implementiert // werden (s.o.).` 

- `// Probleme kann es geben, wenn zwei unterschiedliche` 

- `// Interfaces Methoden mit dem selben Namen deklarieren!` 

`}` 

R. Lutz,  KIT/IAI 

Grundlagen der Objektorientierung – Interfaces und abstrakte Klassen 

17 

**SWE 1** 

## **Implementierungsbeispiele (5)** 

## **Erben von einer abstrakten Klasse und gleichzeitige Implementierung eines Interfaces** 

`public class ImplClassMulti extends ExampleAbstractClass implements ExampleInterface {` 

`// alle Methoden des Interfaces sowie alle abstrakten // Methoden der Oberklasse müssen implementiert // werden (s.o.).` 

`// Probleme kann es geben, wenn das Interface` 

`// und die abstrakte Klasse zwei unterschiedliche // Methoden desselben Namens deklarieren!` 

`}` 

R. Lutz,  KIT/IAI 

Grundlagen der Objektorientierung – Interfaces und abstrakte Klassen 

18 

**SWE 1** 

## **Beispiel aus der Java-Welt:  java.sql** 

R. Lutz,  KIT/IAI 

Grundlagen der Objektorientierung – Interfaces und abstrakte Klassen 

19 

**SWE 1** 

## **Beispiel aus der Java-Welt:  java.sql** 

R. Lutz,  KIT/IAI 

Grundlagen der Objektorientierung – Interfaces und abstrakte Klassen 

20 

**SWE 1** 

## **Beispiel aus der Praxis** 

KIT-Projekt WISA (Wiss. Informationssystem für die Atmosphärenforschung) 

- Für die Datensätze der Instrumente MIPAS und GLORIA existieren mehrere Versionen und Plattformen (Ballon, Satellit, Flugzeug): so genannte _**Cube Files**_ 

- Die Datensätze sind ähnlich aufgebaut, sie unterscheiden sich vor allem in den Metadaten (Versionen, Header) und dem Speichertyp ( _short_ , _unsigned short_ , usw.) 

- Alle Datensätze sollen mit einem einzigen UI-Modul visualisiert werden. Dabei sollen die einzelnen Datensätze automatisch gelesen werden, ohne dass vom Benutzer die unterschiedlichen Versionen beachtet werden müssen. 

- Die erforderlichen _Reader_ unterscheiden sich nur in wenigen Methoden (Funktionen) 

R. Lutz,  KIT/IAI 

Grundlagen der Objektorientierung – Interfaces und abstrakte Klassen 

21 

**SWE 1** 

## **Beispiel aus der Praxis** 

KIT-Projekt WISA (Wiss. Informationssystem für die Atmosphärenforschung) 

Lösungsmöglichkeit: 

Verwendung eines (abstrakten) _Readers_ , der die gemeinsamen Methoden realisiert sowie für jede Version (konkrete) _Reader_ , welche die Unterschiede implementieren: 

**==> picture [453 x 179] intentionally omitted <==**

**----- Start of picture text -----**<br>
<<abstract>><br>AbstractCubeReader<br>readCube(...)<br>—<br>FE<br>V1CubeReader V2CubeReader V*CubeReader<br>readCube(...) readCube(...) readCube(...)<br>**----- End of picture text -----**<br>


R. Lutz,  KIT/IAI 

Grundlagen der Objektorientierung – Interfaces und abstrakte Klassen 

22 

**SWE 1** 

## **Beispiel aus der Praxis** Darstellung unterschiedlicher Klassen/Objekte in einer einfachen GUI-Tabelle Lösungsmöglichkeit mit abstrakter Klasse 

**==> picture [595 x 189] intentionally omitted <==**

**----- Start of picture text -----**<br>
0..*<br>GUITable <<abstract>><br>TableInfo<br>AbstractElement<br>getID(): long<br>getTableInfos(...): TableInfo<br>ElementA ElementB Element*<br>getTableInfos(...) getTableInfos(...) getTableInfos(...)<br>**----- End of picture text -----**<br>


R. Lutz,  KIT/IAI 

Grundlagen der Objektorientierung – Interfaces und abstrakte Klassen 

23 

**SWE 1** 

## **Beispiel aus der Praxis** 

Darstellung unterschiedlicher Klassen/Objekte in einer einfachen GUI-Tabelle 

**==> picture [649 x 311] intentionally omitted <==**

**----- Start of picture text -----**<br>
Lösungsmöglichkeit mit Interface<br><<interface>><br>0..*<br>IAbstractElement<br>getID(): long<br>GUITable<br>getTableInfos(...): TableInfo<br>/ iva<br>ElementA Element*<br>ElementB<br>getID() getID()<br>getID()<br>getTableInfos(...) getTableInfos(...)<br>getTableInfos(...)<br>TableInfo<br>**----- End of picture text -----**<br>


R. Lutz,  KIT/IAI 

Grundlagen der Objektorientierung – Interfaces und abstrakte Klassen 

24 

## **SWE 1** 

## **Beispiel aus der Praxis** 

Darstellung unterschiedlicher Klassen/Objekte in einer einfachen GUI-Tabelle Lösungsmöglichkeit mit Interface UND abstrakter Klasse 

**==> picture [590 x 314] intentionally omitted <==**

**----- Start of picture text -----**<br>
<<interface>><br>IAbstractElement<br>getID(): long<br>getTableInfos(...): TableInfo<br>—<br>0..*<br><<abstract>><br>GUITable TableInfo<br>AbstractElement<br>getID(): long<br>getTableInfos(...): TableInfo<br>ElementA ElementB Element*<br>getTableInfos(...) getTableInfos(...) getTableInfos(...)<br>**----- End of picture text -----**<br>


Grundlagen der Objektorientierung – Interfaces und abstrakte Klassen 

R. Lutz,  KIT/IAI 

25 

**SWE 1** 

R. Lutz,  KIT/IAI 

Grundlagen der Objektorientierung – Interfaces und abstrakte Klassen 

26 

