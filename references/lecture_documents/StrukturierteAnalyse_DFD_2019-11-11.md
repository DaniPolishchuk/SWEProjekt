**SWE 1** 

## **Strukturierte Analyse** 

## **Grundlegendes über Datenflussdiagramme** 

Stand 06.11.2019 

R. Lutz,  KIT/IAI 

**Strukturierte Analyse (DFD++)** 

1 

**SWE 1** 

## **Datenflussdiagramm (DFD)** 

Ein Datenflussdiagramm (DFD, _data flow diagram_ ) beschreibt 

# • die Wege von **Daten** bzw. **Informationen** zwischen 

   - **Funktionen** , 

   - **Speichern** und 

   - **Schnittstellen** 

- die **Transformation der Daten** bzw. **Informationen** durch 

   - **Funktionen** 

R. Lutz,  KIT/IAI 

**Strukturierte Analyse (DFD++)** 

2 

**SWE 1** 

## **DFD-Symbole** 

Datenname 

**Datenfluss** , 

(Kanäle, in denen Informationseinheiten fließen) 

Funktionsname -_ Speichername Schnittstellenname ~~_~~ 

**Funktion** bzw. **Prozess** oder **Transformation** 

**Datenspeicher** 

**Schnittstelle** zur Umwelt (Terminator) 

R. Lutz,  KIT/IAI 

**Strukturierte Analyse (DFD++)** 

3 

**SWE 1** 

## **DFD** 

## **Grundidee beim Erstellen eines Datenflussdiagramms:** 

## : **Vorstellung** 

- das zu entwickelnde System laufe bereits. 

- Initialisierung und Terminierung vorerst uninteressant 

- Konzentration darauf, welche Daten von wo nach wo durch 

das System fließen 

R. Lutz,  KIT/IAI 

**Strukturierte Analyse (DFD++)** 

4 

**SWE 1** 

## **Kontext-Diagramm** 

## **Kontext-Diagramm** 

- bildet die **oberste Ebene** der Datenflussdiagramm-Hierarchie 

- beschreibt die **Schnittstellen** des Gesamtsystems zur Außenwelt 

- In einem Kontext-Diagramm wird das betrachtete System durch einen einzigen **Prozess** dargestellt. Dieser Prozess erhält noch keine Prozessnummer 

- In den nächsten Stufen wird nun das zu betrachtende System weiter verfeinert (Diagramm D0, D1, D2, …) 

- Ein Kontextdiagramm enthält mindestens eine Schnittstelle 

R. Lutz,  KIT/IAI 

**Strukturierte Analyse (DFD++)** 

5 

**SWE 1** 

## **Diagramm D0** 

## **Diagramm D0** 

- bildet die zweite Ebene der Datenflussdiagramm-Hierarchie 

- erhält den Namen der Funktion des Kontextdiagramms 

- hier werden nun die einzelnen Teilfunktionen definiert und durchnummeriert 

- Jede Funktion einer weiteren Verfeinerung erhält die Basisnummerierung des übergeordneten Diagramms sowie eine weitere Unternummerierung 

R. Lutz,  KIT/IAI 

**Strukturierte Analyse (DFD++)** 

6 

## **SWE 1** 

## **Diagramm-Nummerierung** 

**==> picture [628 x 379] intentionally omitted <==**

**----- Start of picture text -----**<br>
KD<br>Schnittstelle<br>® ¥v<br>$ %<br>© %<br>@ L %<br>Hauptfunktion<br>\. D0 Oow v<br>.<br>i %<br>.<br>Unterfunkion A<br>Unterfunkion B<br>1.<br>2.<br>DF1 DF3<br>Unterfunkion C<br>3. Speicher_X<br>DF2<br>**----- End of picture text -----**<br>


**==> picture [71 x 10] intentionally omitted <==**

**----- Start of picture text -----**<br>
R. Lutz,  KIT/IAI<br>**----- End of picture text -----**<br>


**Strukturierte Analyse (DFD++)** 

7 

**SWE 1** 

## **Diagramm-Nummerierung (2)** 

## _**Haupt-Funktion**_ 

**==> picture [576 x 315] intentionally omitted <==**

**----- Start of picture text -----**<br>
D2<br>Unterfunkion A .<br>Unterfunkion B<br>je 1. Toa possess sss s sss sess sss sss c cece<br>DF1 DF3<br>\o3=_ ,<br>‘Speicher_X<br>. DF2 _ ah? a<br>.. < i ae TT tee<br>‘ OTT tee<br>N TSS<br>ie<br>\ Otten<br>‘ ‘<br>D3<br>D1<br>DF1 Unterfunktion-X<br>3.1<br>- |<br>Unterfunktion-Y<br>3.2<br>DF31<br>**----- End of picture text -----**<br>


R. Lutz,  KIT/IAI 

**Strukturierte Analyse (DFD++)** 

8 

**SWE 1** 

## **Regeln beim Zeichnen der Diagramme** 

- Jede **Schnittstelle** ist nur einmal vorhanden. Ausnahme: 

Wird dadurch das Diagramm unübersichtlich, dann kann eine Schnittstelle auch mehrfach gezeichnet werden 

- Zwischen zwei **Schnittstellen** oder zwei **Speichern** und zwischen **Speichern** und **Schnittstellen** gibt es **keine direkten Datenflüsse!** 

- Jeder **Datenfluss** hat einen Namen 

   - Ausnahme: 

Datenflüsse, die zu **Speichern** führen oder dort beginnen und keinen Namen haben, transportieren die **gesamten** gespeicherten Daten 

R. Lutz,  KIT/IAI 

**Strukturierte Analyse (DFD++)** 

9 

**SWE 1** 

## **Semantische Regeln** 

- Das DFD beschreibt den **Datenfluss** , nicht den Kontrollfluss. Daher enthält es weder Entscheidungen noch Schleifen 

- **Datenerhaltungsprinzip** : jede Transformation kann nur die Ausgaben erzeugen, für die sie relevante Eingaben erhält 

- Ein **Datenflussname** besteht aus einem Substantiv oder einem Adjektiv und einem Substantiv. Datenflussnamen enthalten niemals Verben 

(Bsp:   „ _gefilterte Filmdaten_ “, „ _Fehlermeldung: ‚kein Film gefunden‘_ “) 

- Die DF-Namen sind so zu wählen, dass sie nicht nur die Daten beschreiben, die fließen, sondern etwas darüber aussagen, was über die Daten bekannt ist (Bsp: „ _gefundene Filmdaten_ “, „ _neu erstellter Darsteller_ “ ) 

- **Funktionsnamen** repräsentieren **Aktionen** 

(Bsp: „ _Darsteller einem Film zuordnen_ “, „ _Filmdaten eingeben_ “) 

R. Lutz,  KIT/IAI 

**Strukturierte Analyse (DFD++)** 

10 

**SWE 1** 

## **Semantische Regeln (2)** 

## • **: Verfeinerung** 

- jede Transformation ergibt ein eigenes Diagramm 

- Die Ein-/Ausgaben des übergeordneten Diagramms müssen mit den Ein-/Ausgaben des untergeordneten Diagramms übereinstimmen 

- Datenspeicher, die von mehreren Transformationen benötigt werden, werden i.d.R. auf der obersten Ebene beschrieben 

R. Lutz,  KIT/IAI 

**Strukturierte Analyse (DFD++)** 

11 

**SWE 1** 

## **Zusammenführen und Aufspalten von Datenflüssen** 

Verwendung: 

zur Reduktion von Pfeilen innerhalb eines Diagramms und über Diagrammebenen hinaus (Übersichtlichkeit). 

## A — B A+B A A+B —~< B 

Zusammenführung zweier Datenflüsse 

Aufspaltung eines Datenflusses in zwei einzelne Datenflüsse. 

Dabei müssen alle (Teil-) Datenflüsse benannt werden! 

R. Lutz,  KIT/IAI 

**Strukturierte Analyse (DFD++)** 

12 

**SWE 1** 

## **Beispiele** 

**1. Klausuranmeldung** 

**2. Adressverwaltung** 

**3. Bibliotheksverwaltung** 

R. Lutz,  KIT/IAI 

**Strukturierte Analyse (DFD++)** 

13 

**SWE 1** 

## **1. Beispiel Klausuranmeldung** 

(siehe Aufgabensammlung) 

Eine Anwendung zur Unterstützung der Klausuranmeldungen für Studenten soll erstellt werden. 

Dazu sollen zunächst zur Mitte des Vorsemesters die für das nächste Semester geplanten Klausuren in das System übernommen werden. Diese Eingaben (incl. Raum der Klausur, Länge der Klausur, Klausurtag, Aufsichtsführende, Prüfer etc.) werden vom Vorsitzenden des Prüfungsausschusses durchgeführt. 

Wenn alle Klausuren erfasst worden sind, erzeugt das System zwei Prüfungspläne: 

1. Der Prüfungsplan für die Professoren beinhaltet die Aufsichtsführenden der jeweiligen Klausur und den jeweiligen Erst- und Zweitprüfer. Er wird allen Professoren zugestellt. 

2. Den Prüfungsplan für die Studenten ohne diese Informationen. Dieser Prüfungsplan wird den Studenten zugestellt. 

R. Lutz,  KIT/IAI 

**Strukturierte Analyse (DFD++)** 

14 

**SWE 1** 

## **Beispiel Klausuranmeldung** 

Studenten können sich sodann an speziellen Terminals für ihre Klausuren anmelden. 

Das System überprüft, ob die Studenten für die Klausur zugelassen sind und ob es die Klausur überhaupt gibt. Zur Überprüfung der Vorleistung wird eine bereits existierende Vorleistungsdatei genutzt. 

Ist der Student für die Klausur zugelassen, erhält er eine Anmeldungsbestätigung und wird in die Teilnehmerdatei für die Klausur übernommen. Ansonsten erhält er eine Anmeldungsablehnung mit Begründung. 

Nach Ablauf des Anmeldungszeitraums erhalten die jeweiligen Erstprüfer eine Teilnehmerliste mit den für ihre Klausur zugelassenen Studenten. 

Entwickeln Sie ein **Datenflussdiagramm** für diesen Vorgang. 

R. Lutz,  KIT/IAI 

**Strukturierte Analyse (DFD++)** 

15 

**SWE 1** 

## **1. Beispiel Klausuranmeldung** 

OOOO Schnittstelle Datenfluss Speicher Eine Anwendung zur Unterstützung der Klausuranmeldungen für Studenten soll erstellt werden. a 

Dazu sollen zunächst zur Mitte des Vorsemesters die für das nächste Semester geplanten Klau-suren in das System übernommen werden. Diese Klausurdaten (incl. Raum und Länge der Klausur, Klausurtag, Aufsichtsführende, Prüfer etc.) werden vom | CC Vorsitzenden des Prüfungsausschusses in das System eingegeben. 

Wenn alle Klausuren erfasst worden sind, erzeugt das System zwei Prüfungspläne: 

1. Der Prüfungsplan für die Professoren beinhaltet die Aufsichtsführenden der jeweiligen Klausur und den jeweiligen Erst- und Zweitprüfer. Er wird allen Professoren zugestellt. ee a 2. Den Prüfungsplan für die Studenten ohne diese Informationen. Dieser Prüfungsplan wird den Studenten es a zugestellt. 

Studenten können sich sodann an speziellen Terminals für ihre Klausuren anmelden. 

Das System überprüft, ob die Studenten für die Klausur zugelassen sind und ob es die Klausur überhaupt gibt. Zur Überprüfung der Vorleistung wird eine bereits existierende Vorleistungsdatei genutzt. | Ist der Student für die Klausur zugelassen, erhält er eine Anmeldungsbestätigung und wird in die Teilnehmerdatei für die Klausur übernommen. Ansonsten erhält er eine Anmeldungsablehnung mit Begründung. —_ee Nach Ablauf des Anmeldungszeitraums erhalten die jeweiligen Erstprüfer eine Teilnehmerliste mit den für ihre a Klausur zugelassenen Studenten. 

R. Lutz,  KIT/IAI 

**Strukturierte Analyse (DFD++)** 

16 

## **SWE 1** 

## **Beispiel Klausuranmeldung** 

## **Vorgehensweise zur Erstellung des Kontextdiagramms:** el 

Ermitteln der Schnittstellen und Datenflüsse 

**Schnittstellen:** 

- Professoren 

- Studenten 

- Vorsitzender des Prüfungsausschusses 

**Datenflüsse:** 

## **Eingaben:** 

- Klausurdaten 

- Klausuranmeldungen 

**Ausgaben:** 

   - Prüfungsplan für Professoren 

   - Prüfungsplan für Studenten 

   - Anmeldungsbestätigung 

   - Anmeldungsablehnung 

   - Teilnehmerlisten 

- 

- **Speicher:** Vorleistungsdatei 

R. Lutz,  KIT/IAI 

**Strukturierte Analyse (DFD++)** 

19 

**SWE 1** 

## **Beispiel Klausuranmeldung** 

R. Lutz,  KIT/IAI 

**Strukturierte Analyse (DFD++)** 

20 

**SWE 1** 

## **Beispiel Klausuranmeldung** 

## **Vorgehensweise zur Erstellung des Diagramms D0** EE **:** 

## **1. Ermitteln der einzelnen Hauptfunktionen** 

- Klausuren planen 

- Klausuranmeldung überprüfen 

- Listen ausgeben 

**2. Einzeichnen der Ein- und Ausgabe-Datenflüsse des Kontextdiagramms** 

R. Lutz,  KIT/IAI 

**Strukturierte Analyse (DFD++)** 

21 

**SWE 1** 

## **Beispiel Klausuranmeldung (Erstellung von D0)** 

## **2. Einzeichnen der Ein- und Ausgabe-Datenflüsse** 

**==> picture [71 x 10] intentionally omitted <==**

**----- Start of picture text -----**<br>
R. Lutz,  KIT/IAI<br>**----- End of picture text -----**<br>


**==> picture [172 x 12] intentionally omitted <==**

**----- Start of picture text -----**<br>
Strukturierte Analyse (DFD++)<br>**----- End of picture text -----**<br>


22 

**SWE 1** 

## **Beispiel Klausuranmeldung (Erstellung von D0)** 

## **3. Vervollständigen mit internen Datenflüssen und Speichern** 

**==> picture [71 x 10] intentionally omitted <==**

**----- Start of picture text -----**<br>
R. Lutz,  KIT/IAI<br>**----- End of picture text -----**<br>


**==> picture [172 x 12] intentionally omitted <==**

**----- Start of picture text -----**<br>
Strukturierte Analyse (DFD++)<br>**----- End of picture text -----**<br>


23 

**SWE 1** 

## **Beispiel Klausuranmeldung** 

**Vorgehensweise zur Erstellung der Unterdiagramme D1, D2, … , Dx.y:** Analog zur Erstellung von D0 bezogen auf das übergeordnete Diagramm 

R. Lutz,  KIT/IAI 

**Strukturierte Analyse (DFD++)** 

24 

**SWE 1** 

## **Beispiel Klausuranmeldung** 

**Vorgehensweise zur Erstellung der Unterdiagramme D1, D2, … , Dx.y:** 

Analog zur Erstellung von D0 bezogen auf das übergeordnete Diagramm 

R. Lutz,  KIT/IAI 

**Strukturierte Analyse (DFD++)** 

25 

**SWE 1** wh DHBW **2. Beispiel Adressverwaltung** Falsche Benutzer Adresse Liste AuswahlAdresse kriterien AdressVerwaltung om R. Lutz,  KIT/IAI **Strukturierte Analyse (DFD++)** 26 

**SWE 1** 

## **3. Beispiel Bibliotheksverwaltung** 

**==> picture [683 x 360] intentionally omitted <==**

**----- Start of picture text -----**<br>
Liste<br>(Buch-<br>Fehler-<br>Benutzer daten)<br>Meldung<br>Buch- Such-<br>daten kriterien<br>Bibliotheks-<br>Verwaltung<br>(Anmerkungen zu den Punkten   1   - 6   siehe nächste Seite)<br>OO<br>**----- End of picture text -----**<br>


R. Lutz,  KIT/IAI 

**Strukturierte Analyse (DFD++)** 

27 

**SWE 1** 

## **Anmerkungen zum DFD „Bibliotheksverwaltung“** 

1. Eine Fehlermeldung kann auch an die Ausgabefunktion weitergeleitet werden. Dies ist hier aus Übersichtlichkeitsgründen nicht erforderlich, wäre allerdings konsequenter. 

2. Dasselbe gilt auch für diesen Punkt. 

3. Die Eingabe der Suchkriterien kann ebenso über die Funktion _Erfassung+Prüfung_ an die Funktion _Suche_ weitergeleitet werden. Dies bedeutet, dass generell alle Eingaben über eine Funktion _Eingabe_ abgehandelt werden kann, was für die Entwicklung der Benutzeroberfläche hilfreicher sein könnte. 

4. Hier ist der Inhalt des Datenflusses das Suchergebnis (eine gefundene Menge von Buchdaten/Büchern). 

5. Dieser Datenfluss entsteht, wenn eine Verfeinerung der Suche möglich sein soll. 

6. Die Sortierung der Buchdaten kann hier auf dieser Ebene oder auch innerhalb oder auch vor der Funktion _Ausgabe_ erfolgen. 

R. Lutz,  KIT/IAI 

**Strukturierte Analyse (DFD++)** 

28 

**SWE 1** 

## **Strukturierte Analyse** 

## nach Tom DeMarco 

## drei Darstellungsmittel: 

DFD Graphische Darstellung der Datenflüsse und Funktionen des S stems y 

Data Dictionary Erläuterung aller Datendefinitionen in einem Datenlexikon Prozess(Mini-) Spezifikation, eine umgangssprachliche Beschreibung der Spezifikation Aufgaben der Funktionen: 

- Umfang max. 1 Seite. Transformation evtl. weiter zerlegen 

- Beschreibung der Transformationen in der Sprache des Anwenders 

- programmiertechnische Besonderheiten sind nicht zulässig 

- • Beschreibungsmittel: 

Nassi-Shneiderman-Diagramme, PAP, Pseudocode sowie Entscheidun stabellen g 

R. Lutz,  KIT/IAI 

**Strukturierte Analyse (DFD++)** 

30 

**SWE 1** 

## **Strukturierte Analyse** 

Durchführung: 

- Die Abstimmung der Arbeitsergebnisse ( DFD, Datenlexikon, Minispezifikation ) erfolgt nach jedem Schritt mit dem Benutzer (Anwender, Auftraggeber) 

- Die sich daraus ergebenden Vorteile sind: 

   - das spätere System entspricht den Anforderungen der Benutzer 

   - Ergebnis ist eine umfassende, aber übersichtliche Spezifikation 

   - Änderungen können leicht durchgeführt werden 

   - Der Umfang der Dokumentationen ist wesentlich kleiner als herkömmliche Beschreibungen 

R. Lutz,  KIT/IAI 

**Strukturierte Analyse (DFD++)** 

32 

