## **Software Engineering I** 

**Grundlagen der objektorientierten Datenmodellierung mit UML Instanzen- und Klassendiagramme** 

KIT – Universität des Landes Baden-Württemberg und nationales Forschungszentrum in der Helmholtz-Gemeinschaft 

**Diagramme der Unified Modeling Language (UML)** Die meistgenutzten und wichtigsten Diagramme der UML 2 

Strukturdiagramme Objekt- bzw. Instanzendiagramm Klassendiagramm Paketdiagramm 

## Verhaltensdiagramme 

Use-Case-Diagramm (Anwendungsfalldiagramm) Sequenzdiagramm Aktivitätsdiagramm Zustandsdiagramm 

**2** 01.12.2021 

Instanzen- und Klassendiagramme 

R. Lutz, Institut für Automation und angewandte Informatik (IAI) 

## **Objekte, Klassen, Instanzen, Methoden, Operationen ???** 

: Objekte (alternativ: Instanzen) 

reale Elemente in Alltag, Problemumfeld und Programm  Inhalt des Arbeitsspeichers Klassen: 

. Beschreibung (Definition, Schablone) eines Objekts Eine Klasse besteht aus Attributen (Eigenschaften bzw. Daten) und Methoden (Verhalten) 

: Operation 

Beschreibung des Verhaltens von Objekten einer Klasse Methode: 

Realisierung (Implementierung, Quellcode) einer Operation Wird oft auch als alternativer Begriff für Operation verwendet 

**3** 01.12.2021 

Grundlagen der Objektorientierung 

R. Lutz, Institut für Automation und angewandte Informatik (IAI) 

## **Darstellung von Klassen und Instanzen** 

Person Klasse Instanz 

MeierHans : Person 

## UML-Notation für Instanznamen: 

**Instanzname : Klasse** 

wenn die Instanz benannt werden soll. Der Instanzname entspricht i. A. dem Referenznamen im Quellcode: 

(Java): **`Person MeierHans = new Person();`** 

**: Klasse** ~~SS~~ **Instanzname** 

bei einer anonymen Instanz nur Klassenname mit Doppelpunkt wenn nur der Instanzname ausreicht () 

Der Instanzname wird unterstrichen 

**4** 01.12.2021 

Instanzen- und Klassendiagramme 

R. Lutz, Institut für Automation und angewandte Informatik (IAI) 

## **Darstellung von Klassen- und Instanz-Attributen** 

Person nachname: String vorname: String alter: int groesse: float 

MeierHans : Person nachname:String = “Meier“ vorname:String = “Hans“ alter:int = 48 groesse:float = 1,78 

Klasse 

Instanz 

**5** 01.12.2021 

Instanzen- und Klassendiagramme 

R. Lutz, Institut für Automation und angewandte Informatik (IAI) 

## **Darstellung von Klassen- und Instanz-Methoden** 

Person nachname: String vorname: String alter: int groesse: float schlafen(): void essen(): void = 

MeierHans : Person nachname:String = “Meier“ vorname:String = “Hans“ alter:int = 48 groesse:float = 1,78 

(keine Methoden) 

Instanz 

**6** 

01.12.2021 

Instanzen- und Klassendiagramme 

R. Lutz, Institut für Automation und angewandte Informatik (IAI) 

Klasse 

## **Klassen und Instanzen:  allgemeine Darstellung** 

Klassenname Instanzname **:** Klassenname Attribut Attribut **:** Datentyp = “Wert“ Attribut: Datentyp Attribut: Datentyp = Anfangswert Operation Operation() **:** Operation(Arg-Liste) Ergebnistyp Klasse Instanz **7** 01.12.2021 Instanzen- und Klassendiagramme R. Lutz, Institut für Automation und angewandte Informatik (IAI) 

## **Klassen und Instanzen:  Mapping zu Java-Code** 

**`public class BeispielKlasse{`** BeispielKlasse **`public int Attribut1; public float Attribut2;`** Attribut1 **`public String Attribut3=“Hi Welt“;`** Attribut2: float Attribut3: String = “Hi Welt“ **`public void Operation1(){ … }; public void Operation2(){ … };`** Operation1 **`public double Operation3( float ff,`** Operation2() **`int ii  ){`** Operation3(ff: float, ii: int) **:** double _**`// some code lines …`**_ **`}; }`** Klasse Java-Code **8** 01.12.2021 Instanzen- und Klassendiagramme R. Lutz, Institut für Automation und angewandte Informatik (IAI) 

## **Beispiel zur Instanzen- und Klassendarstellung** Gegeben:  identifizierte Objekte und deren Attribute (S. Grundlagen der Objektorientierung) 

## PKW: 

Hersteller, Modell, Höhe, Breite, Länge, Leistung, Verbrauch, Gewicht, Farbe, an/aus, offen/zu, Sitzplätze, … fahren, stehen, tanken, beschleunigen, …  Motor, Räder, Sitze, Besitzer, **Faltdach** , … 

## LKW: 

Hersteller, Modell, Höhe, Breite, Länge, Leistung, Verbrauch, Gewicht, Farbe, an/aus, offen/zu, Sitzplätze, … fahren, stehen, tanken, beschleunigen, …  Motor, Räder, Sitze, Besitzer, **Kran, Seilwinde,** … 

## Bus: 

Hersteller, Modell, Höhe, Breite, Länge, Leistung, Verbrauch, Gewicht, Farbe, an/aus, offen/zu, Sitzplätze, … fahren, stehen, tanken, beschleunigen, …  Motor, Räder, Sitze, Besitzer, **Mikrofon** , … 

**==> picture [75 x 7] intentionally omitted <==**

**----- Start of picture text -----**<br>
9 01.12.2021<br>**----- End of picture text -----**<br>


Instanzen- und Klassendiagramme 

R. Lutz, Institut für Automation und angewandte Informatik (IAI) 

## **Beispiel zur Klassen-Darstellung** 

**PKW LKW Bus** hersteller: String hersteller: String hersteller: String modell: String modell: String modell: String hoehe: int hoehe: int hoehe: int breite: int breite: int breite: int laenge: int laenge: int laenge: int offen: boolean offen: boolean offen: boolean **Faltdach Kran Mikrofon Seilwinde** fahren(): void fahren(): void fahren(): void stehen(): void stehen(): void stehen(): void 

**10** 

Instanzen- und Klassendiagramme 

R. Lutz, Institut für Automation und angewandte Informatik (IAI) 

## **Beispiel zur Instanzen-Darstellung** 

Fiat500 : PKW DB-ASW : LKW DB-O321 : Bus hersteller = Fiat hersteller = M-Benz hersteller = M-Benz modell = 500 modell = ASW modell = O321 hoehe : int = 1440 hoehe : int = 2950 hoehe : int = 2800 breite: int = 1350 breite : int = 2490 breite : int = 2450 laenge: int = 3240 laenge : int = 6858 laenge : int = 11250 offen : boolean = true offen: boolean = false offen : boolean = false 

**11** 

R. Lutz, Institut für Automation und angewandte Informatik (IAI) 

Instanzen- und Klassendiagramme 

## **Klassendiagramm** 

Grafische Notation, um **Klassen** und deren Relationen zu anderen Klassen darzustellen. 

Schema, Muster oder Template (Schablone) zur Beschreibung vieler . möglichen Objektinstanzen 

Jede Klasse ist nur einmalig vorhanden. 

**PKW LKW** hersteller: String hersteller: String modell: String modell: String . . . . . . fahren(): void fahren(): void stehen(): void stehen(): void 

**Bus** hersteller: String modell: String . . . fahren(): void stehen(): void 

**12** 01.12.2021 

Grundlagen der Objektorientierung 

R. Lutz, Institut für Automation und angewandte Informatik (IAI) 

## **Klassendiagramm (2)** 

**==> picture [670 x 433] intentionally omitted <==**

**----- Start of picture text -----**<br>
Q Ein Klassendiagramm ist Basis für unendlich viele Instanzendiagramme<br>Klassendiagramm f —— ee ee ee ee eB eB ee ee eB ee ee ee eS eS eee eee ceededelie<br>.<br>PKW LKW Bus<br>:<br>!! Hersteller: String Hersteller: String Hersteller: String<br>! Modell: String Modell: String Modell: String<br>:<br>! . . .  . . .  . . .<br>!<br>!<br>fahren(): void fahren(): void fahren(): void<br>' stehen(): void stehen(): void stehen(): void<br>!1 = = — i]<br>N 4<br>Se LL LL LL LL eeeee LL ee oo ___. —-7<br>Instanzendiagramm<br>/ —— ee ee ee ee ee eS eS ——_ = = ee ee ee eS =—— = = = = = ——_ = = ee ee ee eS alienlioniioniioniontS<br>.<br>1<br>:<br>.<br>~ ‘ > }: ,<br>Male mragnseert °<br>1 —n =~ - ag ; @ 0 co<br> —— a 6 Se =<br>N<br>Seo LL LL LL LL LL LL LL LL LL LL LL LL LL LL LLos -7<br>13 01.12.2021 Grundlagen der Objektorientierung R. Lutz, Institut für Automation und angewandte Informatik (IAI)<br>**----- End of picture text -----**<br>


## **Instanzendiagramm (Objektdiagramm)** 

Formale grafische Notation, um real vorhandene **Objekte** und deren Relationen zu anderen Objekten darzustellen. 

Es können beliebig viele Objekte desselben Typs (Klasse) existieren. 

Besonders nützlich, um Testfälle (vor allem Szenarien) zu dokumentieren und Beispiele zu diskutieren. 

**==> picture [686 x 282] intentionally omitted <==**

**----- Start of picture text -----**<br>
pkw1:PKW aa<br>!<br>Hersteller=“VW“<br>I pkw2:PKW  \<br>PKW Modell= “Golf V“<br>!<br>Hersteller=“Opel“<br>I . . .  [\]<br>Hersteller: String Modell= “Astra“<br>I<br>Modell: String I . . .  [\]<br>. . .  I pkw3:PKW<br>I Hersteller=“VW“ [|]<br>fahren(): void pkw4:PKW Modell= “T4 Multivan“<br>stehen(): void \ Hersteller=“BMW“ . . .  []]<br>\<br>\ Modell= “Z4“ /<br>Klasse \ . . .<br>.<br>\ eee 4 ,<br>—_ S| | = = = — a<br>= — = —=—- WW Lee -” -<br>Instanzendiagramm<br>14 01.12.2021 Grundlagen der Objektorientierung R. Lutz, Institut für Automation und angewandte Informatik (IAI)<br>**----- End of picture text -----**<br>


## **Begrifflichkeit:** _**Attribut**_ **vs.** _**Referenz**_ 

**„Attribut“:** a primitive Typen (int, float, double, …) a Arrays primitiver Typen a „primitive Klassen“ (Float, Double, Integer, String, …) **„Referenz“:** a Höherwertige Elemente (Klassen und Interfaces) 

**==> picture [636 x 240] intentionally omitted <==**

**----- Start of picture text -----**<br>
Attribute werden grafisch innerhalb des Klassen-Symbols dargestellt,<br>Referenzen als Verbindungslinien zwischen zwei Klassen (Assoziation)<br>Referenz<br>BeispielKlasse ***<br>AttributXX<br>—— :<br>01.12.2021 Instanzen- und Klassendiagramme R. Lutz, Institut für Automation und angewandte Informatik (IAI)<br>**----- End of picture text -----**<br>


**15** 01.12.2021 

## **Kommentar, Notiz** 

Kommentare bzw. Notizen können mithilfe des Notiz-Symbols in das Diagramm gezeichnet werden Das Notizsymbol kann durch eine gestrichelte Linie mit einem beliebigen Diagrammelement verbunden werden 

**==> picture [670 x 257] intentionally omitted <==**

**----- Start of picture text -----**<br>
Klasse_1 Klasse_2<br>~<br>~<br>~<br>~<br>~<br>~<br>~<br>~<br>~<br>~<br>~<br>~<br>~<br>~<br>~ ~ Das<br>~<br>~<br>~ ist eine<br>Notiz<br>16 01.12.2021 Instanzen- und Klassendiagramme R. Lutz, Institut für Automation und angewandte Informatik (IAI)<br>**----- End of picture text -----**<br>


## **Referenzen zwischen zwei Klassen bzw. Instanzen:** 

## **Assoziationen (allgemeine Darstellung)** 

_**Multiplizität_1 Label Multiplizität _2**_ Klasse_1 Klasse_2 _**Rolle_1 Rolle_2**_ 

**Label:** Beliebiger Bezeichner der Assoziation über/unter der Mitte der Linie. Beispiel: „ _wird verwendet von_ “ Label hat **keinen** Einfluss auf den späteren Quellcode! **Rolle:** Genaue Beschreibung der verknüpften Klasse aus der Sicht der jeweils anderen Klasse. Steht am Ende der Linie. („ _Rolle_2_ ist die Rolle, die _Klasse_2_ aus Sicht von _Klasse_1 spielt“_ ) 

**Multiplizität:** (auch „Kardinalität“) Anzahl der referenzierten Elemente 

**17** 01.12.2021 

Instanzen- und Klassendiagramme 

R. Lutz, Institut für Automation und angewandte Informatik (IAI) 

## **Assoziation: Beispiel** 

**==> picture [600 x 315] intentionally omitted <==**

**----- Start of picture text -----**<br>
Land hat Hauptstadt Stadt<br>ist Hauptstadt von<br>Name Name<br>hat Hauptstadt<br>F : Land Paris : Stadt<br>Name:String = “Frankreich“ Name:String = “Paris“<br>a<br>< ist Hauptstadt von<br>hat Hauptstadt<br>E : Land M : Stadt<br>Name:String = “Spanien“ Name:String = “Madrid“<br>S S<br>< ist Hauptstadt von<br>**----- End of picture text -----**<br>


**18** 01.12.2021 

Instanzen- und Klassendiagramme 

R. Lutz, Institut für Automation und angewandte Informatik (IAI) 

## **Assoziationen** 

## Bemerkungen zur Darstellung der Beziehung zwischen zwei **Instanzen** 

**E : Land M : Stadt** Name:String = “Spanien“ Name:String = “Madrid“ 

Bidirektionale Assoziationen ohne Beschriftung sind bei **Instanzendiagrammen** nicht eindeutig, meist liegt tatsächlich eine Unidirektionale Beziehung vor! (Programmiersprachen kennen nur unidirektionale Assoziationen) 

 Eindeutiger sind dann gerichtete Assoziationen: 

**E : Land M : Stadt** Name:String = “Spanien“ Name:String = “Madrid“ kommt später … 

In SWE1: unidirektionale Assoziationen verwenden! 

**19** 01.12.2021 

Instanzen- und Klassendiagramme 

R. Lutz, Institut für Automation und angewandte Informatik (IAI) 

**==> picture [670 x 484] intentionally omitted <==**

**----- Start of picture text -----**<br>
Assoziationen:  Mapping zu Java-Code<br>Land hat Hauptstadt Stadt<br>ist Hauptstadt von<br>name name<br>E : Land M : Stadt<br>name:String = “Spanien“ \ name:String = “Madrid“<br>Poy<br>PN<br>/ \<br>/ \<br>/ \<br>public class Land{ public class Stadt{<br>7 ¢ ¢ 4 4 \\ \ \<br>private String name; - a . . private String name;<br>// hat Hauptstadt // ist Hauptstadt von ~<br>private Stadt stadt;  //(hauptstadt) private Land land;<br>. . .   . . .<br>} }<br>20 01.12.2021 Instanzen- und Klassendiagramme R. Lutz, Institut für Automation und angewandte Informatik (IAI)<br>**----- End of picture text -----**<br>


## **Multiplizitäten** 

Stellen die Anzahl der assoziierten Objekte einer Klassenbeziehung dar. Ein Objekt einer Klasse referenziert **X** Objekte der Klasse _ClassY_ 

**==> picture [635 x 328] intentionally omitted <==**

**----- Start of picture text -----**<br>
ClassY Genau eins<br>0 .. *<br>ClassY m (null oder mehr)<br>0 .. 1<br>ClassY Optional (null oder eins)<br>N .. *<br>ClassY N (als reale Zahl) oder mehr<br>ClassY 3, 7<br>Genau drei oder genau sieben<br>ClassY 1..4, 7<br>Zwischen eins und vier oder genau sieben<br>21 01.12.2021<br>**----- End of picture text -----**<br>


Instanzen- und Klassendiagramme 

R. Lutz, Institut für Automation und angewandte Informatik (IAI) 

## **Multiplizitäten: Beispiel** 

**==> picture [670 x 393] intentionally omitted <==**

**----- Start of picture text -----**<br>
Kunde Konto<br>1 gehört zu 1 ... *<br>Name KontoNummer<br>besitzt<br>Adresse Kontentyp<br>Kontostand<br>Alternativ: gerichtete Assoziationen<br>1<br>gehört zu<br>Kunde Konto<br>Name KontoNummer<br>besitzt 1 ... *<br>Adresse Kontentyp<br>Kontostand<br>22 01.12.2021 Instanzen- und Klassendiagramme R. Lutz, Institut für Automation und angewandte Informatik (IAI)<br>**----- End of picture text -----**<br>


**Multiplizitäten: Beispiel Klassen- u. Instanzendiagramm** Karlsruher Institut fir Technologie Klassendiagramm: _**1 besitzt 0..***_ Land Bundesland Instanzendiagramm: Deutschland:Land Bayern:Bundesland Hessen:Bundesland Sachsen:Bundesland Es sollten keine Multiplizitäten bei (wichtigen) Instanzen verwendet werden! 01.12.2021 Instanzen- und Klassendiagramme R. Lutz, Institut für Automation und angewandte Informatik (IAI) 

**23** 01.12.2021 

## **Unsere Fahrzeug-Klassen nun mit Referenzen** 

**==> picture [670 x 372] intentionally omitted <==**

**----- Start of picture text -----**<br>
PKW LKW Bus<br>hersteller: String hersteller: String hersteller: String<br>modell: String modell: String modell: String<br>. . . . . . . . .<br>offen: boolean offen: boolean offen: boolean<br>Faltdach Kran Mikrofon<br>Seilwinde<br>fahren(): void fahren(): void<br>fahren(): void<br>stehen(): void stehen(): void<br>stehen(): void<br>Seilwinde<br>Faltdach<br>. . . Mikrofon<br>. . .<br>. . .<br>Kran<br>. . .<br>24 Instanzen- und Klassendiagramme R. Lutz, Institut für Automation und angewandte Informatik (IAI)<br>**----- End of picture text -----**<br>


## **Übungsaufgaben** 

**25** 01.12.2021 

Instanzen- und Klassendiagramme 

R. Lutz, Institut für Automation und angewandte Informatik (IAI) 

## **Aufgabe 1:  Instanzendiagramm**  **Klassendiagramm** 

## Entwickeln Sie ein Klassendiagramm aus folgendem Instanzendiagramm 

**==> picture [534 x 201] intentionally omitted <==**

**----- Start of picture text -----**<br>
P1  : Punkt<br>P2 : Punkt<br>Poly1 : Polygon<br>x : int = -10<br>x : int = 10<br>y : int = 10<br>y : int = 10<br>P3 : Punkt P4 : Punkt<br>x : int = -10 x : int = 10<br>y : int = -10 y : int = -10<br>**----- End of picture text -----**<br>


Wie viele Punkte sind erforderlich, um ein Polygon zu konstruieren? Welche Konsequenzen ergeben sich aus bidirektionalen Verbindungen? 

**26** 01.12.2021 

Instanzen- und Klassendiagramme 

R. Lutz, Institut für Automation und angewandte Informatik (IAI) 

## **Aufgabe 1: Lösungsvorschlag** 

**==> picture [641 x 274] intentionally omitted <==**

**----- Start of picture text -----**<br>
3..*<br>Punkt Polygon<br>x : int<br>y : int<br>public class Punkt{ public class Polygon{<br>private int x; private List<Punkt> Punkte;<br>private int y; . . .<br>}<br>private Polygon polygon;<br>. . .<br>}<br>**----- End of picture text -----**<br>


: bidirektionale Verbindung 

- Punkt „kennt“ Polygon  (nicht erforderlich  Lastenheft) 

- Punkt schlecht wiederverwendbar  eher nicht bidirektional modellieren 

**27** 01.12.2021 

Instanzen- und Klassendiagramme 

R. Lutz, Institut für Automation und angewandte Informatik (IAI) 

**Aufgabe 2:  Instanzendiagramm**  **Klassendiagramm** 

Entwickeln Sie ein Klassendiagramm aus folgendem Instanzendiagramm 

**==> picture [649 x 325] intentionally omitted <==**

**----- Start of picture text -----**<br>
M1: Mäppchen<br>T1 : Textmarker<br>B1 : Bleistift<br>farbe:Color=ROT farbe:Color=GRÜN<br>dm:String=“klein“<br>B2 : Bleistift<br>farbe:Color=BLAU<br>R1 : Radiergummi<br>dm:String=“gross“<br>farbe:Color=ROT<br>S1 : Spitzer<br>material:String=“Stahl“ S2 : Spitzer<br>dm:String=“gross“<br>material:String=“Plastik“<br>dm:String=“klein“<br>**----- End of picture text -----**<br>


## dm = Durchmesser 

**==> picture [312 x 9] intentionally omitted <==**

**----- Start of picture text -----**<br>
28 01.12.2021 Instanzen- und Klassendiagramme<br>**----- End of picture text -----**<br>


**==> picture [252 x 10] intentionally omitted <==**

**----- Start of picture text -----**<br>
R. Lutz, Institut für Automation und angewandte Informatik (IAI)<br>**----- End of picture text -----**<br>


## **Aufgabe 2: Lösungsvorschlag** 

**==> picture [661 x 393] intentionally omitted <==**

**----- Start of picture text -----**<br>
0..* 0..*<br>Spitzer Mäppchen Textmarker<br>material:String farbe:Color<br>dm:String 0..*<br>0..*<br>0..*<br>addBleistift(B:b) Bleistift<br>Radiergummi<br>\<br>\ farbe:Color<br>SN<br>dm:String farbe:Color<br>Dm prüfen …<br>Problematik: prüfen, ob Bleistift und Spitzer zusammenpassen<br>•<br>Verwendung einer Methode, welche das Prüfen (mit) übernimmt (  addBleistift(*)  )<br>•<br>(plus) Kommentar<br>Wichtig: Aus welcher Sicht wird modelliert?<br>•<br>Mäppchenhersteller oder beliebiges reales Mäppchen  siehe Lastenheft!<br>**----- End of picture text -----**<br>


**29** 01.12.2021 Instanzen- und Klassendiagramme R. Lutz, Institut für Automation und angewandte Informatik (IAI) 

## **Rollennamen** 

## Ein Rollenname 

ist ein Name, der ein Ende einer Assoziation eindeutig identifiziert. beschreibt, welche Aufgabe ein Objekt in einer Assoziation wahrnimmt bzw. welche Rolle es aus der Sicht einer anderen Klasse spielt 

**==> picture [670 x 283] intentionally omitted <==**

**----- Start of picture text -----**<br>
1 1 ..*<br>beschäftigt<br>Firma Person<br>Arbeitgeber<br>ist angestellt bei Arbeitnehmer<br>Alternativ: gerichtete Assoziationen<br>1 ..*<br>beschäftigt<br>Arbeitnehmer<br>Firma Person<br>ist angestellt bei<br>Arbeitgeber<br>30 01.12.2021 Instanzen- und Klassendiagramme R. Lutz, Institut für Automation und angewandte Informatik (IAI)<br>**----- End of picture text -----**<br>


## **Rollennamen** 

## Rollennamen werden explizit verlangt, wenn 

mehrere Assoziationen von einer Klasse zu einer anderen existieren mithilfe eines Modellierungswerkzeugs automatisch Quellcode erzeugt werden soll (Rollennamen werden dort meist als Referenznamen verwendet) 

**==> picture [610 x 253] intentionally omitted <==**

**----- Start of picture text -----**<br>
1 ..*<br>beschäftigt<br>Arbeitnehmer<br>Firma Person<br>ist angestellt bei<br>Arbeitgeber<br>5..*<br>Aufsichtsräte<br>Kunden<br>1..*<br>Instanzen- und Klassendiagramme R. Lutz, Institut für Automation und angewandte Informatik (IAI)<br>**----- End of picture text -----**<br>


**==> picture [75 x 7] intentionally omitted <==**

**----- Start of picture text -----**<br>
31 01.12.2021<br>**----- End of picture text -----**<br>


**==> picture [673 x 484] intentionally omitted <==**

**----- Start of picture text -----**<br>
Multiplizitäten + Rollen:  Mapping zu Java-Code<br>Karlsruher Institut fur Technologie<br>1 ..*<br>beschäftigt<br>Arbeitnehmer<br>Firma Person<br>ist angestellt bei<br>Arbeitgeber<br>5..*<br>Aufsichtsräte<br>Kunden<br>1..*<br>public class Firma{ public class Person{<br>// beschaeftigt // ist angestellt bei<br>private List<Person> Arbeitnehmer; private Firma Arbeitgeber;<br>private List<Person> Aufsichtsräte; . . .<br>private List<Person> Kunden; }<br>. . .<br>}<br>32 01.12.2021 Instanzen- und Klassendiagramme R. Lutz, Institut für Automation und angewandte Informatik (IAI)<br>**----- End of picture text -----**<br>


## **Assoziationen und Rollen? Reichen nicht Attributnamen?** 

## **Klassendiagramm ausschließlich mit Attributdarstellung** 

**OKlasseO KlasseG KlasseA KlasseB** B : KlasseB O : OKlasseO A : KlasseA A : KlasseA G: KlasseG ~~SB~~ Ff ~~&~~ **KlasseC KlasseD UKlasseA UKlasseC** A : KlasseA **UKlasseB** C : KlasseC B:  KlasseB B:  KlasseB D : KlasseD C : KlasseC D : KlasseD F: KlasseF ~~S = e#e=~~ **KlasseF** D : KlasseD a **33** 01.12.2021 

**==> picture [140 x 9] intentionally omitted <==**

**----- Start of picture text -----**<br>
Instanzen- und Klassendiagramme<br>**----- End of picture text -----**<br>


**==> picture [252 x 10] intentionally omitted <==**

**----- Start of picture text -----**<br>
R. Lutz, Institut für Automation und angewandte Informatik (IAI)<br>**----- End of picture text -----**<br>


## **Warum Assoziationen, reichen nicht Attributnamen? Klassendiagramm mit „zusätzlicher“ Referenzdarstellung** 

**==> picture [615 x 334] intentionally omitted <==**

**----- Start of picture text -----**<br>
OKlasseO<br>KlasseG<br>KlasseA KlasseB<br>B : KlasseB O : OKlasseO<br>A : KlasseA A : KlasseA G: KlasseG<br>KlasseC KlasseD<br>UKlasseA UKlasseC<br>A : KlasseA UKlasseB<br>C : KlasseC<br>B:  KlasseB B:  KlasseB D : KlasseD C : KlasseC<br>D : KlasseD<br>F: KlasseF<br>KlasseF<br>D : KlasseD<br>Instanzen- und Klassendiagramme R. Lutz, Institut für Automation und angewandte Informatik (IAI)<br>**----- End of picture text -----**<br>


**==> picture [75 x 7] intentionally omitted <==**

**----- Start of picture text -----**<br>
34 01.12.2021<br>**----- End of picture text -----**<br>


## **Warum Assoziationen, reichen nicht Attributnamen?** 

## **Klassendiagramm mit Referenzdarstellung plus Rollennamen** 

**==> picture [670 x 339] intentionally omitted <==**

**----- Start of picture text -----**<br>
A<br>OKlasseO O<br>KlasseG<br>KlasseA KlasseB B<br>B : KlasseB O : OKlasseO<br>A : KlasseA A : KlasseA G: KlasseG O<br>A<br>A B<br>B<br>KlasseC KlasseD<br>UKlasseA UKlasseC<br>A : KlasseA UKlasseB<br>C : KlasseC<br>D<br>B:  KlasseB C B:  KlasseB D : KlasseD C : KlasseC<br>D : KlasseD<br>F: KlasseF<br>D D<br>F<br>KlasseF<br>D : KlasseD<br>35 01.12.2021 Instanzen- und Klassendiagramme R. Lutz, Institut für Automation und angewandte Informatik (IAI)<br>**----- End of picture text -----**<br>


## **Warum Assoziationen, reichen nicht Attributnamen?** 

## **Klassendiagramm mit Referenzdarstellung plus Rollennamen**  **ersetzt Attributdarstellung** 

**==> picture [670 x 339] intentionally omitted <==**

**----- Start of picture text -----**<br>
A<br>OKlasseO A<br>KlasseG<br>KlasseA KlasseB B<br>O<br>A<br>A B<br>B<br>KlasseC KlasseD<br>UKlasseA UKlasseC<br>UKlasseB<br>D<br>C<br>D D<br>F<br>KlasseF<br>36 01.12.2021 Instanzen- und Klassendiagramme R. Lutz, Institut für Automation und angewandte Informatik (IAI)<br>**----- End of picture text -----**<br>


**Übungsaufgaben** 

**37** 01.12.2021 

Instanzen- und Klassendiagramme 

R. Lutz, Institut für Automation und angewandte Informatik (IAI) 

## **Aufgabe 3:  Klassendiagramm für Translationsfläche** 

**Flächen** können auf unterschiedliche Art dargestellt werden. Erstellen Sie für jede der folgenden Darstellungen ein Klassen- **und** ein Instanzendiagramm: 

Eine erste Fläche (Translationsfläche) ist definiert durch eine Linie, die entlang einer Raumkurve "gezogen" wird. 

Die Linie selbst verweist auf einen Anfangs- und einen Endpunkt. 

Die Raumkurve verweist ebenfalls auf einen Anfangs- und einen Endpunkt sowie auf eine Liste von (z.B. 5) Basispunkten. 

**==> picture [353 x 120] intentionally omitted <==**

**----- Start of picture text -----**<br>
EP<br>BP5 EP<br>BP4<br>BP2 BP3<br>BP1<br>AP<br>**----- End of picture text -----**<br>


**38** 01.12.2021 

Instanzen- und Klassendiagramme 

R. Lutz, Institut für Automation und angewandte Informatik (IAI) 

## **Aufgabe 4:  Klassendiagramme für Kreisbögen** 

**Kreisbögen** können auf unterschiedliche Art dargestellt werden. Erstellen Sie für jede der folgenden Darstellungen ein Klassen- **und** ein Instanzendiagramm: 

- Ein Kreisbogen ist definiert durch drei Punkte (Anfangs- und Endpunkt sowie ein dazwischen liegender Punkt auf dem Kreisumfang). 

- Ein weiterer Kreisbogen ist ebenfalls definiert durch drei Punkte (Anfangs- End- und Mittelpunkt). 

**==> picture [312 x 9] intentionally omitted <==**

**----- Start of picture text -----**<br>
39 01.12.2021 Instanzen- und Klassendiagramme<br>**----- End of picture text -----**<br>


**==> picture [252 x 10] intentionally omitted <==**

**----- Start of picture text -----**<br>
R. Lutz, Institut für Automation und angewandte Informatik (IAI)<br>**----- End of picture text -----**<br>


## **Reflexive Assoziationen** 

**==> picture [670 x 398] intentionally omitted <==**

**----- Start of picture text -----**<br>
k1<br>Klasse k1 Klasse<br>Attribut Attribut<br>k2 k2<br>hat Hauptstadt Stadt<br>Land Hauptstadt<br>name<br>Bundesland<br>name<br>0..*<br>Nation 0,1<br>40 01.12.2021 Instanzen- und Klassendiagramme R. Lutz, Institut für Automation und angewandte Informatik (IAI)<br>**----- End of picture text -----**<br>


## **Reflexive Assoziationen:  Mapping zu Java-Code** 

**==> picture [670 x 409] intentionally omitted <==**

**----- Start of picture text -----**<br>
Land hat Hauptstadt Stadt<br>Land<br>Hauptstadt<br>Bundesländer name<br>name<br>0..*<br>0,1<br>Nation<br>public class Land{ public class Stadt{<br>private Stadt Hauptstadt; private Land Land;<br>. . .<br>private List<Land> Bundesländer; }<br>private Land Nation;<br>. . .<br>}<br>41 01.12.2021 Instanzen- und Klassendiagramme R. Lutz, Institut für Automation und angewandte Informatik (IAI)<br>**----- End of picture text -----**<br>


## **Reflexive Assoziationen:  Anwendungsbeispiele** 

Verwaltung aller Instanzen einer Klasse (siehe _Multiton-Pattern_ und _Listenklassen_ ) 

**==> picture [670 x 355] intentionally omitted <==**

**----- Start of picture text -----**<br>
public class KlasseABC{<br>KlasseABC alleABCs<br>0..* private static List<KlasseABC> alleABCs;<br>. . .<br>}<br>Verkettete Listen<br>public class KlasseXY{<br>KlasseXY Vorgänger private KlasseXY nachfolger;<br>1 private KlasseXY vorgänger;<br>Nachfolger 1 . . .<br>}<br>42 01.12.2021 Instanzen- und Klassendiagramme R. Lutz, Institut für Automation und angewandte Informatik (IAI)<br>**----- End of picture text -----**<br>


## **Aggregation** 

Assoziation, bei der hervorgehoben werden soll, dass zwischen den beteiligten Klassen eine Beziehung besteht, die durch „ist Teil von“ oder „besteht aus" beschrieben werden kann. 

**==> picture [670 x 282] intentionally omitted <==**

**----- Start of picture text -----**<br>
0..*<br>Ganzes Teil<br>besteht aus<br>1..* 0..*<br>Dokument Absatz Satz<br>43 01.12.2021 Instanzen- und Klassendiagramme R. Lutz, Institut für Automation und angewandte Informatik (IAI)<br>**----- End of picture text -----**<br>


## **Komposition** 

Eine Komposition ist eine besondere Form der Aggregation. Sie sind durch eine gefüllte Raute gekennzeichnet: 

Sie liegt vor, wenn die Einzelteile vom Aggregat (vom Ganzen) zusätzlich existenz **ab** hängig sind. 

**==> picture [398 x 156] intentionally omitted <==**

**----- Start of picture text -----**<br>
Ganzes abhängigerTeil<br>1..*<br>Rechnung Rechnungsposten<br>1..*<br>Gebäude Raum<br>**----- End of picture text -----**<br>


**==> picture [75 x 7] intentionally omitted <==**

**----- Start of picture text -----**<br>
44 01.12.2021<br>**----- End of picture text -----**<br>


**==> picture [140 x 9] intentionally omitted <==**

**----- Start of picture text -----**<br>
Instanzen- und Klassendiagramme<br>**----- End of picture text -----**<br>


**==> picture [252 x 10] intentionally omitted <==**

**----- Start of picture text -----**<br>
R. Lutz, Institut für Automation und angewandte Informatik (IAI)<br>**----- End of picture text -----**<br>


## **Aggregationen und Kompositionen im Java-Code** 

Aggregation und Komposition werden im Code **identisch** definiert (bestenfalls wird vom Modellierungstool ein Kommentar erzeugt) 

**`public class Gebaeude{ -`** _**`// Komposition besteht aus`**_ **`private List<Raum> alleRaeume;`** 

**`. . .`** 

**`}`** 

## Existenzabhängigkeiten bei Kompositionen: 

kaskadierendes Löschen (explizit oder mit Annotationen (z.B. JPA)) 

**45** 01.12.2021 

Instanzen- und Klassendiagramme 

R. Lutz, Institut für Automation und angewandte Informatik (IAI) 

## **Kompositionen:  Problematik der Existenzabhängigkeit** 

kaskadierendes Löschen: 

Wer löscht hier was? **Gebäude Raum Reinigungsfirma** Beim Löschen der Reinigungsfirma wird auch das Gebäude gelöscht! (und umgekehrt) 

**Raum Reinigungsfirma** 

„Sparsam“ verwenden und Konsistenz beachten! 

**46** 01.12.2021 

Instanzen- und Klassendiagramme 

R. Lutz, Institut für Automation und angewandte Informatik (IAI) 

## **Vererbung (1)** 

Modellierungsspezifische Erweiterungen zum Thema Vererbung in „Grundlagen der Objektorientierung“: 

Vererbung bzw. Generalisierung gelten über eine beliebige Zahl von Ebenen hinweg. 

Unterklasse kann durch _**„ist ein …“**_ beschrieben werden UML-Darstellung: Pfeil mit Dreieck an der Spitze 

Oberklasse Unterklasse 

**47** 01.12.2021 

Instanzen- und Klassendiagramme 

R. Lutz, Institut für Automation und angewandte Informatik (IAI) 

## **Aufgabe 5:  Grafikeditor (mit Vererbung)** 

Zeichnen Sie ein Klassendiagramm für einen Graphikeditor, der das Konzept der Gruppierung unterstützt. Folgendes sei angenommen: 

Ein Graphikdokument enthält beliebig viele Blätter. 

Jedes Blatt enthält Grafikobjekte (z.B. Text, geometrische Objekte sowie Gruppen ( d.h. eine Gruppe ist hier ein Grafikobjekt!) ). Geometrische Objekte sind Kreise, Ellipsen, Rechtecke, Linien und Quadrate. Eine Gruppe ist einfach eine Menge von Grafikobjekten, die ihrerseits Gruppen enthalten kann. 

Eine Gruppe muss mindestens zwei Grafikobjekte enthalten. Ein Grafikobjekt kann ein direktes Mitglied von höchstens einer Gruppe sein. 

**48** 01.12.2021 

Instanzen- und Klassendiagramme 

R. Lutz, Institut für Automation und angewandte Informatik (IAI) 

## **Vererbung (2)** 

Operationen, Attribute und Referenzen, die für eine Gruppe von Unterklassen gelten, werden 

**==> picture [678 x 383] intentionally omitted <==**

**----- Start of picture text -----**<br>
der Oberklasse zugewiesen<br>von den einzelnen Unterklassen gemeinsam genutzt<br>Adresse Person<br>Name<br>Vorname<br>Adresse getName()<br>. . .<br>Angestellter Kunde<br>Name Name<br>Angestellter Kunde<br>Vorname Vorname<br>getName() getName()<br>. . .  . . .  Java: Kunde k = new Kunde(“Müller“);<br>System.out.println( k.getName());<br>49 01.12.2021 Instanzen- und Klassendiagramme R. Lutz, Institut für Automation und angewandte Informatik (IAI)<br>**----- End of picture text -----**<br>


## **Vererbung (3)** 

Jede Unterklasse 8 erbt alle Attribute und Operationen ihrer Oberklasse(n) 8 und fügt ihre eigenen Attribute und Operationen hinzu 

## Ohne Oberklasse: 

**==> picture [670 x 299] intentionally omitted <==**

**----- Start of picture text -----**<br>
Person<br>Name<br>Angestellter Kunde Alter<br>getName()<br>Name Name<br>Alter Alter . . .<br>PersonalNr KundenNr<br>getName() getName()<br>Angestellter Kunde<br>getPersonalNr() getKundenNr()<br>PersonalNr KundenNr<br>getPersonalNr() getKundenNr()<br>50 01.12.2021 Instanzen- und Klassendiagramme R. Lutz, Institut für Automation und angewandte Informatik (IAI)<br>**----- End of picture text -----**<br>


## **Beispiel für Vererbung:** 

• **unsere bereits bekannten Fahrzeuge** 

**==> picture [670 x 380] intentionally omitted <==**

**----- Start of picture text -----**<br>
Landfahrzeug<br>Fahrzeug<br>Wasserfahrzeug<br>Fahrzeug<br>„ist ein“<br>Landfahrzeug Wasserfahrzeug<br>„ist ein“<br>PKW LKW Bus Floß Boot<br>51 01.12.2021 Instanzen- und Klassendiagramme R. Lutz, Institut für Automation und angewandte Informatik (IAI)<br>**----- End of picture text -----**<br>


## **Beispiel für Vererbung (Klassendiagramm zur Erinnerung)** 

**==> picture [670 x 420] intentionally omitted <==**

**----- Start of picture text -----**<br>
PKW LKW Bus<br>hersteller: String hersteller: String hersteller: String<br>modell: String modell: String modell: String<br>. . . . . . . . .<br>offen: boolean offen: boolean offen: boolean<br>fahren(): void fahren(): void fahren(): void<br>stehen(): void stehen(): void stehen(): void<br>Seilwinde<br>Faltdach Kran<br>Mikrofon<br> lauter identische Attribute und Operationen!<br>52 Instanzen- und Klassendiagramme R. Lutz, Institut für Automation und angewandte Informatik (IAI)<br>**----- End of picture text -----**<br>


**==> picture [670 x 484] intentionally omitted <==**

**----- Start of picture text -----**<br>
Beispiel für Vererbung<br>Karlsruher Institut fur Technologie<br>Landfahrzeug<br>hersteller: String<br>modell: String<br>. . .<br>offen: boolean<br>fahren(): void<br>stehen(): void<br>PKW LKW Bus<br>Faltdach<br>Seilwinde<br>Kran Mikrofon<br>== .<br>: i AzA <iDae J<br>53 Instanzen- und Klassendiagramme R. Lutz, Institut für Automation und angewandte Informatik (IAI)<br>**----- End of picture text -----**<br>


**==> picture [679 x 484] intentionally omitted <==**

**----- Start of picture text -----**<br>
Beispiel für Vererbung (Forts. für Landfahrzeuge)<br>Referenzen für PKW, LKW und Bus:<br>nur PKW:  Faltdach<br> Motor, Räder, Sitze, Besitzer, …<br>nur LKW:  Kran, Seilwinde<br>nur Bus:  Mikrofon<br>Fahrzeug<br>es<br>hoehe: int<br>1<br>breite: int Motor<br>gemeinsame Attribute<br>5<br>Rad<br>fahren(): void<br>gemeinsame<br>gemeinsame Operationen<br>stehen(): void<br>Referenzen<br>Sitz<br>2..*<br>Wasserfahrzeug<br>Landfahrzeug<br>gemeinsame Attribute offen: boolean<br>individuelle<br>Referenzen<br>0,1<br>Bus Mikro<br>0,1 Kran<br>Faltdach PKW LKW 0,1 0,1 Seilwinde<br>54 01.12.2021 Instanzen- und Klassendiagramme R. Lutz, Institut für Automation und angewandte Informatik (IAI)<br>**----- End of picture text -----**<br>


**==> picture [688 x 484] intentionally omitted <==**

**----- Start of picture text -----**<br>
Beispiel für Vererbung (Forts. für Landfahrzeuge)<br>Referenzen für PKW, LKW und Bus:<br>nur PKW:  Faltdach<br> Motor, Räder, Sitze, Besitzer, …<br>nur LKW:  Kran, Seilwinde<br><=><br>nur Bus: Mikrofon<br>Fahrzeug<br>a 1<br>Besitzer<br>hersteller: String<br>gemeinsame Attribute<br>modell: String 1..*<br>= > Sitz<br>fahren(): void<br>gemeinsame Operationen<br>stehen(): void gemeinsame<br>Referenzen<br>2..*<br>Rad<br>| J UR Cc) ZZ<br>Wasserfahrzeug<br>Landfahrzeug<br>Motor<br>1..*<br>offen: boolean<br>gemeinsame Attribute<br>individuelle<br>Referenzen<br>Bus 0,1 Mikro<br>0,1 Kran<br>0,1<br>Faltdach PKW LKW 0,1 Seilwinde<br>55 01.12.2021 Instanzen- und Klassendiagramme R. Lutz, Institut für Automation und angewandte Informatik (IAI)<br>**----- End of picture text -----**<br>


**==> picture [676 x 484] intentionally omitted <==**

**----- Start of picture text -----**<br>
Vererbung:  Mapping zu Java-Code<br>1<br>Fahrzeug Besitzer<br>po oe<br>/\<br>Sitz<br>1..*<br>Landfahrzeug<br>ee =<br>Rad<br>2..*<br>0,1<br>Faltdach PKW LKW Bus<br>Motor<br>a ee 1..*<br>| |<br>public class Fahrzeug{ public class Landfahrzeug<br>private Besitzer besitzer; extends Fahrzeug{<br>private List<Sitz> sitze; private List<Rad> raeder;<br>. . .   private List<Motor> motoren;<br>} . . .<br>}<br>public class PKW extends Landfahrzeug{<br>private Faltdach faltdach;<br>. . .<br>}<br>56 01.12.2021 Instanzen- und Klassendiagramme R. Lutz, Institut für Automation und angewandte Informatik (IAI)<br>**----- End of picture text -----**<br>


## **Navigierbarkeit von Assoziationen** 

Darstellung durch Pfeilspitze und Kreuz (einfaches Linienende: _unspezifiziert_ ) 

Beide Richtungen (Standardfall) Eine (bevorzugte) Richtung Beide Richtungen Ausschließlich eine Richtung Möglich, aber wenig sinnvoll ;) 

- Zusätzlich können an beiden (!) Enden Multiplizitäten eingetragen werden. 

- Modelle möglich, die so nicht sinnvoll Implementiert werden können / müssen 

- IDEs: Details für Quellcode-Generierung müssen dort bestimmt werden 

**57** 01.12.2021 

Instanzen- und Klassendiagramme 

R. Lutz, Institut für Automation und angewandte Informatik (IAI) 

## **Navigierbarkeit von Assoziationen** 

Navigierbarkeit: 

- Darstellung durch Pfeilspitze und optionales Kreuz 

- Pfeilspitze: Klasse A „kennt“ Klasse B 

|Fall 1:|Fall 1:|A||B|Beide Richtungen (Standard,_unspezifiziert_)|
|---|---|---|---|---|---|
|Fall 2:|Fall 2:|A||B|Beide Richtungen|
|Fall 3:|Fall 3:|A||B|Eine (bevorzugte) Richtung|
|Fall 4:|Fall 4:|A||B|Ausschließlich eine Richtung|
|Fall 5:|Fall 5:|A||B|Möglich, aber wenig sinnvoll ;)|



- Zusätzlich können an beiden (!) Enden Multiplizitäten eingetragen werden. 

- => Modelle möglich, die so nicht sinnvoll Implementiert werden können/müssen 

- • IDEs: Details für Quellcode-Generierung müssen dort bestimmt werden 

**58** 01.12.2021 

Instanzen- und Klassendiagramme 

R. Lutz, Institut für Automation und angewandte Informatik (IAI) 

## **Navigierbarkeit (Java-Mapping, Fall 1+2)** 

||A<br>A|**(1..*)**<br>**(0..*)**|B<br>Beide Richtungen (Standardfall,_unspezifiziert_)<br>Beide Richtungen mit Navigationsangabe<br>B|B<br>Beide Richtungen (Standardfall,_unspezifiziert_)<br>Beide Richtungen mit Navigationsangabe<br>B|B<br>Beide Richtungen (Standardfall,_unspezifiziert_)<br>Beide Richtungen mit Navigationsangabe<br>B|
|---|---|---|---|---|---|
||**public class A{**|||**public class A{**||
|||**private B bb;**||**private List<B>Bs;**||
|||**. . .**||**. . .**||
||**}**|||**}**||
||**public class B{**|||**public class B{**||
|||**private A aa;**||**private List<A>As;**||
|||**. . .**||**. . .**||
||**}**|||**}**||
||Einfache Referenz|||Referenzmit Multiplizität 0..*/1..*||
|**59**|01.12.2021|Instanzen- und Klassendiagramme||R. Lutz, Institut für Automation und angewandte Informatik (IAI)|R. Lutz, Institut für Automation und angewandte Informatik (IAI)|



R. Lutz, Institut für Automation und angewandte Informatik (IAI) 

## **Navigierbarkeit (Java-Mapping, Fall 3+4)** 

**==> picture [670 x 406] intentionally omitted <==**

**----- Start of picture text -----**<br>
A B Eine (bevorzugte) Richtung<br>A B Ausschließlich eine Richtung<br>(1..*)<br>public class A{<br>private B bb;<br>Einfache Referenz:<br>. . .   ~ ~~ . ~ ~. . = ~ ~s public class B{<br>}<br>. . .<br>}<br>7 7]<br>7<br>public class A{ 7 7<br>Referenz  7<br>7<br>private List<B> Bs; 7<br>mit Multiplizität „1..*“<br>an Pfeilspitze: . . .<br>}<br>60 01.12.2021 Instanzen- und Klassendiagramme R. Lutz, Institut für Automation und angewandte Informatik (IAI)<br>**----- End of picture text -----**<br>


**==> picture [670 x 484] intentionally omitted <==**

**----- Start of picture text -----**<br>
Navigierbarkeit (Java-Mapping, Fall 3a)<br>Karlsruher Institut fur Technologie<br>1<br>A B Eine (bevorzugte) Richtung<br>1..*<br>A B<br>public class A{ public class B{ public class B{<br>private B bb; private A aa; private List<A> aAs;<br>. . .   . . .<br>. . .<br>} }<br>}<br>Referenz mit  Referenz mit<br>Multiplizität „1“ Multiplizität „1..*“<br>61 01.12.2021 Instanzen- und Klassendiagramme R. Lutz, Institut für Automation und angewandte Informatik (IAI)<br>**----- End of picture text -----**<br>


## **Navigierbarkeit (Vereinbarung)** 

**Multiplizitäten am Pfeilende tragen meist mehr zur Verwirrung als zum Verständnis bei** 

## **=> Vereinbarungen:** 

1. Multiplizitäten ausschließlich an der Pfeilspitze angeben. 

2. Existiert eine Rück-Referenz (Backpointer), dann diese als bidirektionalen Pfeil oder als separaten Pfeil eintragen 

3. Keine Multiplizität an der Pfeilspitze bedeutet die Multiplizität 1 

4. Assoziationen ohne Pfeilspitzen und Multiplizitäten bedeuten ebenfalls die Multiplizität 1 

**==> picture [204 x 139] intentionally omitted <==**

**----- Start of picture text -----**<br>
=1<br>A B<br>=1 =1<br>A B<br>**----- End of picture text -----**<br>


**62** 01.12.2021 

Instanzen- und Klassendiagramme 

R. Lutz, Institut für Automation und angewandte Informatik (IAI) 

## **Sichtbarkeit und Eigenschaften von Attributen und Methoden** 

Sichtbarkeitszeichen vor den Namen des Attributs bzw. der Operation 

- - private iD + +name public # protected #vorname ~ package ~nochWas 

Statische Attribute bzw. Operationen werden unterstrichen: 

KlasseX +publicStaticAttribute +publicStaticOperation() 

**63** 01.12.2021 

R. Lutz, Institut für Automation und angewandte Informatik (IAI) 

Instanzen- und Klassendiagramme 

## **Abhängigkeit vs. Assoziation** 

Klasse **B** im Quellcode von **A** als Klassenattribut bzw. Klassenvariable modelliert: **Referenz** (Assoziation, Aggregation oder Komposition) 

Klasse **C** im Quellcode von **A** nur „kurzfristig“ in einer Methode oder als Rückgabeobjekt verwendet: **Abhängigkeit** (gestrichelter Pfeil) 

**==> picture [674 x 317] intentionally omitted <==**

**----- Start of picture text -----**<br>
Abhängigkeiten sollen aufzeigen, welche Klassen von anderen Klassen benutzt<br>werden => vollständige Übersicht möglich (Analyse, Entwurf)<br>public class A{<br>B bb;     => Klassenvariable (Referenz)=> Klassenvariable (Referenz)<br>B<br>public A( B b {<br>this.bb = b;<br>A . . .<br>anx }<br>C public C aMethod( C c ){<br>C cc = new C(); } [[=> Abhängigkeit]]<br>. . .<br>}<br>}<br>64 01.12.2021<br>**----- End of picture text -----**<br>


**`B bb;     => Klassenvariable (Referenz)=> Klassenvariable (Referenz) public A( B b { this.bb = b; . . . } public C aMethod( C c ){ C cc = new C(); }[[=> Abhängigkeit]] . . . } }`** Instanzen- und Klassendiagramme R. Lutz, Institut für Automation und angewandte Informatik (IAI) 

## **Schnittstellen (Interfaces)** 

**==> picture [670 x 424] intentionally omitted <==**

**----- Start of picture text -----**<br>
<< interface >> „Stereotyp“<br>Schnittstellen-Name<br>Notation:<br>Konstante<br>Operation()<br>Implementierung: Verwendung:<br><<interface>><br><<interface>><br>Schnittstellenname<br>Schnittstellenname<br><<use>><br>Klasse_2<br>Klasse_1<br>| —<br>Klasse_2<br>alternativ: Klasse_1<br>Schnittstellenname<br>a oe Schnittstellenname I<br>65 01.12.2021 Instanzen- und Klassendiagramme R. Lutz, Institut für Automation und angewandte Informatik (IAI)<br>**----- End of picture text -----**<br>


## **Abstrakte Klassen** 

Können (dürfen) nicht instanziiert werden 

Können Methoden implementieren und den Unterklassen zur Verfügung stellen 

Können (ebenfalls abstrakte) Methoden deklarieren, die von den Unterklassen implementiert werden **müssen** (analog zu Interfaces) UML: Klassensymbol mit Stereotyp _<<abstract>>_ und/oder kursiv geschriebenem Klassennamen 

**<<** _**abstract**_ **>>** _**AbstractClass**_ Attribute Operationen 

**66** 01.12.2021 

Instanzen- und Klassendiagramme 

R. Lutz, Institut für Automation und angewandte Informatik (IAI) 

## **Besonderheiten bei UML-Klassendiagrammen** 

**67** 01.12.2021 

Instanzen- und Klassendiagramme 

R. Lutz, Institut für Automation und angewandte Informatik (IAI) 

## **Assoziationsklassen** 

Vereint die Eigenschaften der Klasse und der Assoziation in sich Sind mit einer Assoziation verbunden 

Dient dazu, Eigenschaften näher zu beschreiben, die keiner der beiden beteiligten Klassen sinnvoll zuzuordnen sind 

**==> picture [75 x 7] intentionally omitted <==**

**----- Start of picture text -----**<br>
68 01.12.2021<br>**----- End of picture text -----**<br>


**==> picture [558 x 252] intentionally omitted <==**

**----- Start of picture text -----**<br>
Assoziationsname<br>==  „AssoKlasse“ 1..*<br>KlasseA I KlasseB<br>I<br>I<br>I<br>I<br>I<br>AssoKlasse<br>Attribute<br>Operationen<br>Instanzen- und Klassendiagramme R. Lutz, Institut für Automation und angewandte Informatik (IAI)<br>**----- End of picture text -----**<br>


## **Assoziationsklassen – alternative Darstellung / Umwandlung** 

Beispiel (aus „ UML 2 glasklar“) Modell: 

Nach Code-Generierung (VisualParadigm™, 2014): 

> **Zugabe** 1..* **Cocktail Zutat** i ~~Cee~~ l l l l l l l l **Zugabe** menge: int ruehren():void schuetteln():void 

**==> picture [293 x 201] intentionally omitted <==**

**----- Start of picture text -----**<br>
Cocktail Zutat<br>||<br>Zugabe<br>1..*<br>menge: int<br>ruehren():void<br>schuetteln():void<br>**----- End of picture text -----**<br>


**69** 01.12.2021 

Instanzen- und Klassendiagramme 

R. Lutz, Institut für Automation und angewandte Informatik (IAI) 

## **Generalisierungsmengen und -eigenschaften** 

Bei Vererbungen/Generalisierungen können zusätzlich Bedingungen angegeben werden: 

## **Eigenschaftswerte:** 

**Fahrzeug** 

: **complete** Vollständige Spezialisierung, keine Unterklassen mehr möglich / erlaubt 

**„Menge“** —> **Typ** —> **Eigenschaften {disjoint}** 

: **incomplete** weitere Spezialisierungen möglich 

: **disjoint** Unterklassen werden klar voneinander unterschieden 

: **overlapping** 

**PKW LKW** 

Eine nachfolgende Klasse kann Unterklasse von mehreren der mit _overlapping_ gekennzeichneten Unterklassen sein 

**70** 01.12.2021 

Instanzen- und Klassendiagramme 

R. Lutz, Institut für Automation und angewandte Informatik (IAI) 

## **Einschränkungen (** _**Constraints**_ **)** 

## Oft auch _Zusicherungen_ genannt 

Bedingungen, die für ein Element erfüllt sein müssen. Es kann sich dabei um einen OCL-Ausdruck handeln ( _Object Constraint Language_ ), zugelassen ist aber auch ein sprachlicher Ausdruck. 

Constraints können an beliebige Modellelemente angefügt werden (Attribute, Operationen, Klassen, Assoziationen, …) 

Sie werden zwischen geschweiften Klammern geschrieben Beispiele: 

**==> picture [620 x 139] intentionally omitted <==**

**----- Start of picture text -----**<br>
Dachfenster<br>PKW<br>l<br>{XOR}<br>I<br>hoehe: int<br>Klimaanlage<br>breite: int<br>laenge: int = 2000  { >breite }<br>{ordered}<br>Motor Zylinder<br>1..12<br>**----- End of picture text -----**<br>


**==> picture [252 x 10] intentionally omitted <==**

**----- Start of picture text -----**<br>
R. Lutz, Institut für Automation und angewandte Informatik (IAI)<br>**----- End of picture text -----**<br>


**71** 01.12.2021 

Instanzen- und Klassendiagramme 

## **Innere Klassen** 

Innere Klassen besitzen denselben Namensraum wie ihre Elternklasse Sie werden bei Java innerhalb der Klassendeklaration definiert 

**==> picture [104 x 133] intentionally omitted <==**

**----- Start of picture text -----**<br>
Basisklasse<br>Innere Klasse<br>**----- End of picture text -----**<br>


**72** 01.12.2021 

Instanzen- und Klassendiagramme 

R. Lutz, Institut für Automation und angewandte Informatik (IAI) 

## **Parametrisierte Klassen (Generics)** 

Definition durch gestricheltes Rechteck rechts oben am Klassensymbol Realisierung durch Implementierungspfeil mit Angabe der verwendeten Parameterklasse („ _bind“_ ) Über mehrere Vererbungshierarchien möglich (s. _java.util.HashMap_ ) 

**==> picture [670 x 310] intentionally omitted <==**

**----- Start of picture text -----**<br>
K, V<br><<interface>> L _— |<br>1 ——o i java.util.Map<br>T I<br>L--—-<br>onc<br>MyGeneric \ __ K, V |<br>\ java.util.AbstractMap<br>I -————4<br>I<br><<bind>> <T->ClassX> K, V<br>I java.util.HashMap<br>:<br>MyGeneric<br>| I<br><<bind>> <K->String, V->Person><br>I<br>allePersonen : HashMap<br>73 01.12.2021 Instanzen- und Klassendiagramme R. Lutz, Institut für Automation und angewandte Informatik (IAI)<br>**----- End of picture text -----**<br>


## **Literatur** 

Mario Jeckle: UML 2.0, Die neue Version der Standardmodellierungssprache; http://www.jeckle.de/files/umltutorial.pdf 

UML 2 glasklar Mario Jeckle, Chris Rupp, Jürgen Hahn, Barbara Zengler, Stefan Queins Hanser Verlag München Wien, 2004 

UML 2.0 in a Nutshell Dan Pilone, Neil Pitman O‘Reilly Verlag, 2006 

**74** 01.12.2021 

Instanzen- und Klassendiagramme 

R. Lutz, Institut für Automation und angewandte Informatik (IAI) 

## **Zusammenfassung** 

## Erläuterung der Begriffe: 

Objektorientierung: Objekt, Klasse, Instanz, Attribut, Operation, .. Identifizieren von Objekten und Klassen Erklärung der 5 wichtigsten Aspekte der Objektorientierung Identität Klassifikation Vererbung Polymorphie (Polymorphismus) Spätes Binden ( _late binding_ ) 

**75** 01.12.2021 

Instanzen- und Klassendiagramme 

R. Lutz, Institut für Automation und angewandte Informatik (IAI) 

