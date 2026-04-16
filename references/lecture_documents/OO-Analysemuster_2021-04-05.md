## **SWE 1** 

## **Analysemuster** 

**(Analysis Pattern)** 

**(Quelle: H. Balzert u.a.)** 

**SWE 1** 

## **Was sind Muster?** 

- „Ein Muster ist eine Idee, die sich in einem praktischen Kontext als nützlich erwiesen hat und es auch in anderen sein wird.“ (M. Fowler) 

- „Ein Analysemuster ist eine Gruppe von Klassen mit feststehenden Verantwortlichkeiten und Interaktionen.“ (P. Coad) 

- Es kann eine Gruppe von Klassen sein, die durch Beziehungen verknüpft ist, oder eine Gruppe von kommunizierenden Objekten. 

-  schematische Lösung für eine Klasse verwandter Probleme 

-  Muster zur Modellierung häufig vorkommender Strukturen 

2/28 

**R. Lutz,  KIT-CN/IAI** 

**Grundlagen der Objektorientierung – Analysemuster** 

**==> picture [670 x 471] intentionally omitted <==**

**----- Start of picture text -----**<br>
SWE<br>1<br>Klassifikation von Mustern<br>Muster<br>Strukturmuster<br>Organisations- Vorgehens-<br>——l__ muster muster<br>Universelle phasenspezifische<br>Strukturmuster Strukturmuster<br>Analysemuster Architektur- Entwurfsmuster Sprach-<br>muster idiome<br>———<br>fachgebiets- fachgebiets-<br>übergreifend spezifisch<br>**----- End of picture text -----**<br>


3/28 

**R. Lutz,  KIT-CN/IAI** 

**Grundlagen der Objektorientierung – Analysemuster** 

**SWE 1** 

## **Welche Muster werden hier behandelt?** 

1. Liste 

2. Exemplartyp 

3. Baugruppe 

4. Stückliste 

5. Koordinator 

6. Rollen 

7. Wechselnde Rollen 

8. Historie 

9. Gruppe 

10.Gruppenhistorie 

4/28 

**R. Lutz,  KIT-CN/IAI** 

**Grundlagen der Objektorientierung – Analysemuster** 

|mADHBW|mADHBW|**Muster 1:  Liste**|**Muster 1:  Liste**|**SWE1**|**SWE1**|**SWE1**|
|---|---|---|---|---|---|---|
|**Beispiel:  Bestellung**<br>Bestellnummer:          167334<br>~~aa~~||~~aa~~|Datum:     01.06.2004<br>~~aa~~||~~aa~~|~~aa~~|
||||||||
|Nr.|Bezeichnung|Einzelpreis|Anzahl|Preis|||
|47|Kugelschreiber|1,20|100|120,00|||
|11|Folienstift|2,50|5|12,50|||
|13|…||||||
||||||||
||||Summe:           132,50<br>~~a~~||~~a~~|~~a~~|



5/28 

**R. Lutz,  KIT-CN/IAI** 

**Grundlagen der Objektorientierung – Analysemuster** 

## **SWE 1** 

## **Muster 1:  Liste** 

**==> picture [580 x 104] intentionally omitted <==**

**----- Start of picture text -----**<br>
Bestellung<br>Artikel<br>Nummer 1..  * Bestellposition 0 .. *<br>Nummer<br>Datum<br>Anzahl<br>/Summe Bezeichnung<br>/Preis<br>1 Preis<br>erfasse Position()<br>**----- End of picture text -----**<br>


## **Eigenschaften:** 

-  Komposition (Listenelemente in genau einer Kollektion, nicht allein existent) 

- Ein Ganzes besteht aus gleichartigen Teilen, d.h. es gibt nur eine Teil-Klasse ( _BP_ ) 

- Teil-Objekte sind einem Aggregat-Objekt fest zugeordnet, lassen sich aber löschen, ohne das Ganze zu löschen 

- Attributwerte des Aggregat-Objekts gelten auch für die Teile (z.B. _Nummer, Datum_ ) 

- Das Aggregat-Objekt enthält im allgemeinen mindestens ein Teil-Objekt, d.h. die Multiplizität ist meist **1..*** 

6/28 

**R. Lutz,  KIT-CN/IAI** 

**Grundlagen der Objektorientierung – Analysemuster** 

**==> picture [66 x 25] intentionally omitted <==**

**----- Start of picture text -----**<br>
SWE<br>1<br>**----- End of picture text -----**<br>


## **Muster 1:  Liste** 

**==> picture [624 x 440] intentionally omitted <==**

**----- Start of picture text -----**<br>
Beispiel 2:  Lager Lager<br>Bezeichnung<br>Standort<br>Verwalter<br>Bezeichnung:        Süd<br>Standort: Karlsruhe 1..  *<br>Verwalter:             Hans Müller Lagerplatz<br>Ebene<br>Gang<br>Ebene      Gang Platz          Artikel      Anzahl Platz<br>1 1 1 ABC 120<br>pf |ff belegt mit<br>1 3 2 XYZ 345<br>0..  *<br>po] | v<br>1 2 1 … … Artikel<br>|<br>… … …<br>| [| | | ]|<br>R. Lutz,  KIT-CN/IAI Grundlagen der Objektorientierung – Analysemuster<br>**----- End of picture text -----**<br>


7/28 

**Grundlagen der Objektorientierung – Analysemuster** 

**SWE 1** 

## **Welche Muster werden hier behandelt?** 

## 1. Liste 

2. Exemplartyp 

3. Baugruppe 

4. Stückliste 

5. Koordinator 

6. Rollen 

7. Wechselnde Rollen 

8. Historie 

9. Gruppe 

10.Gruppenhistorie 

8/28 

**R. Lutz,  KIT-CN/IAI** 

**Grundlagen der Objektorientierung – Analysemuster** 

**SWE 1** 

## **Muster 2:  Exemplartyp** 

## **Problembeschreibung:** 

- Es gibt Gruppen von Objekten, deren Eigenschaften im wesentlichen identisch sind, sodass man sie als Kopien voneinander oder als Exemplare des selben Typs ansehen kann. 

- Eigenschaften des Typs (Werte seiner Attribute) sind auch Eigenschaften der Exemplare dieses Typs. 

- Die Exemplare haben eine Seriennummer oder Inventarnummer, durch die sie unterscheidbar sind (werden i.d.R. nie mehr verändert), ansonsten nur sehr wenige weitere Eigenschaften, die nicht schon durch den Typ gegeben sind. 

- **Beispiel:  Von einem Buch sind mehrere Exemplare zu verwalten** 

- Bei Modellierung einer einzigen Klasse _**Buch**_ : identische Attributwerte bei mehreren Objekte bei _Titel_ , _Autor_ und _Verlag_ 

- Bessere Modellierung: 

Zusammenfassung der gemeinsamen Attributwerte mehrerer Buchexemplare in einer neuen Klasse _**Buchbeschreibung**_ 

9/28 

**R. Lutz,  KIT-CN/IAI** 

**Grundlagen der Objektorientierung – Analysemuster** 

## **SWE 1** 

## **Muster 2:  Exemplartyp** 

|**Buchbeschreibung**||**Buchexemplar**|
|---|---|---|
|Titel<br>Autor|0 ..<br>*****|Signatur<br>Ausleihdatum|
|Verlag||Rückgabedatum|



## **Eigenschaften:** 

-  einfache Assoziation (keine _whole-part_ -Beziehung (Aggregation/Komposition)) 

- Erstellte Objektverbindungen werden nicht verändert. Sie werden nur gelöscht, wenn das betreffende Exemplar gelöscht wird 

- Der Name der neuen Klasse enthält oft Begriffe wie _Typ_ , _Gruppe_ , _Beschreibung_ , _Spezifikation_ 

- Eine Beschreibung kann unabhängig von konkreten Exemplaren existieren. Daher ist die Multiplizität meist **0..*** 

- Würde auf die neue Klasse verzichtet, so würde als Nachteil lediglich die redundante „Speicherung“ von Attributwerten auftreten 

10/28 

**R. Lutz,  KIT-CN/IAI** 

**Grundlagen der Objektorientierung – Analysemuster** 

**SWE 1** 

## **Welche Muster werden hier behandelt?** 

## 1. Liste 

2. Exemplartyp 

3. Baugruppe 

4. Stückliste 

5. Koordinator 

6. Rollen 

7. Wechselnde Rollen 

8. Historie 

9. Gruppe 

10.Gruppenhistorie 

11/28 

**R. Lutz,  KIT-CN/IAI** 

**Grundlagen der Objektorientierung – Analysemuster** 

**SWE 1** 

## **Muster 3:  Baugruppe** 

## **Problembeschreibung:** 

- Gliederung des Ganzen in viele Teile 

- Physische Objekte 

- Objektverbindungen bestehen meist über längere Zeit 

- Existenzabhängige Zugehörigkeit der Teile 

- „Zugang“ zu Teilen nur über das Ganze 

**==> picture [104 x 113] intentionally omitted <==**

**----- Start of picture text -----**<br>
Baugruppe<br>1..  *<br>**----- End of picture text -----**<br>


**==> picture [54 x 13] intentionally omitted <==**

**----- Start of picture text -----**<br>
Bauteil<br>**----- End of picture text -----**<br>


- Teile können unterschiedlichen Typs sein 

- Objektverbindungen bestehen meist über längeren Zeitraum 

- Trennen der Objekte möglich und an andere Baugruppen anschließbar 

12/28 

**R. Lutz,  KIT-CN/IAI** 

**Grundlagen der Objektorientierung – Analysemuster** 

## **SWE 1** 

## **Muster 3:  Baugruppe** 

**==> picture [573 x 158] intentionally omitted <==**

**----- Start of picture text -----**<br>
Beispiel:<br>Rechner<br>1..  2<br>Hersteller Bildschirm<br>Typ<br>1..  * 1..  *<br>Prozessor USB-Schnittstelle<br>**----- End of picture text -----**<br>


## **Weitere Beispiele:** 

- Schaltkreis – Bauteile 

- Festplatte – Bauteile 

- Auto – Räder (Handelt es sich dabei um eine Baugruppe?) 

- Wie sieht es bei einem Laptop aus? 

13/28 

**R. Lutz,  KIT-CN/IAI** 

**Grundlagen der Objektorientierung – Analysemuster** 

**SWE 1** 

## **Welche Muster werden hier behandelt?** 

## 1. Liste 

2. Exemplartyp 

3. Baugruppe 

4. Stückliste 

5. Koordinator 

6. Rollen 

7. Wechselnde Rollen 

8. Historie 

9. Gruppe 

10.Gruppenhistorie 

14/28 

**R. Lutz,  KIT-CN/IAI** 

**Grundlagen der Objektorientierung – Analysemuster** 

**SWE 1** 

## **Muster 4:  Stückliste (Kompositum)** 

**Problembeschreibung:** 

- Modellierung einer Teil/Ganzes-Hierarchie 

- unbekannte / ungleichmäßige / zeitlich variierende Schachtelungstiefe 

- die (Teil-von-)Struktur ist ein Baum, die atomaren Bestandteile bilden die Blätter, die unterschiedlichen Typs sein können 

- alle Knoten (Blätter) des Baums weisen einheitliche Merkmale bzw. Verhaltensweisen auf 

- die zusammengesetzten Teile müssen oft genauso wie atomare Bestandteile behandelt werden (lokale Namen, werden komplett gelöscht oder kopiert) 

- Teil-Objekte können einem Aggregat-Objekt zugeordnet werden 

15/28 

**R. Lutz,  KIT-CN/IAI** 

**Grundlagen der Objektorientierung – Analysemuster** 

## **SWE 1** 

## **Muster 4:  Stückliste** 

**==> picture [580 x 171] intentionally omitted <==**

**----- Start of picture text -----**<br>
Lösung:<br>Komponente<br>Name 0 .. *<br>Größe …<br>0..1<br>A B Aggregat<br>**----- End of picture text -----**<br>


-  **Komposition** (Multiplizität bei der Aggregatklasse ist **0,1** ) 

- eine (später abstrakte) Oberklasse, die die gemeinsamen Eigenschaften (und Operationen) von atomaren und zusammengesetzten Komponenten modelliert 

- je eine Klasse für jeden konkreten Typ von atomaren Bestandteilen (Blätter der Teil-von-Struktur) 

- Genau eine Klasse für die zusammengesetzten Bestandteile (d.h. die inneren Knoten der Teil-von-Struktur  _Aggregat_ ) 

16/28 

**R. Lutz,  KIT-CN/IAI** 

**Grundlagen der Objektorientierung – Analysemuster** 

## **Muster 4:  Stückliste** 

## **SWE 1** 

## **Beispiel:  Verzeichnisbaum** 

- Ein Verzeichnis soll Verknüpfungen, Dateien und weitere Verzeichnisse enthalten können 

- Sowohl das Verzeichnis und alle darin enthaltenen Objekte als Einheit als auch jedes dieser Objekte sollen einzeln behandelt werden können (z.B. für rekursives Kopieren und Löschen) 

## **Hierarchiemöglichkeit (Instanzendiagramm):** 

**==> picture [419 x 183] intentionally omitted <==**

**----- Start of picture text -----**<br>
: Verzeichnis<br>Pana<br>: Verzeichnis : Datei : Datei<br>: Datei : Verknüpfung<br>=  |<br>**----- End of picture text -----**<br>


17/28 

**R. Lutz,  KIT-CN/IAI** 

**Grundlagen der Objektorientierung – Analysemuster** 

**SWE 1** 

## **Muster 4:  Stückliste** 

## **Verzeichnisbaum, Lösung:** 

**==> picture [475 x 198] intentionally omitted <==**

**----- Start of picture text -----**<br>
Dateiobjekt<br>1<br>Name 0 .. *<br>Ort<br>Größe<br>Erstellungsdatum<br>0..1<br>Verknüpfung Datei Verzeichnis<br>**----- End of picture text -----**<br>


18/28 

**R. Lutz,  KIT-CN/IAI** 

**Grundlagen der Objektorientierung – Analysemuster** 

**SWE 1** 

## **Welche Muster werden hier behandelt?** 

## 1. Liste 

2. Exemplartyp 

3. Baugruppe 

4. Stückliste 

5. Koordinator 

6. Rollen 

7. Wechselnde Rollen 

8. Historie 

9. Gruppe 

10.Gruppenhistorie 

19/28 

**R. Lutz,  KIT-CN/IAI** 

**Grundlagen der Objektorientierung – Analysemuster** 

## **SWE 1** 

## **Muster 5:  Koordinator** 

## **Problembeschreibung:** 

- Für eine Assoziation sind zusätzliche Attribute zu speichern, die zu keiner der beteiligten Klassen gehören. 

## **Lösungsmöglichkeit:** 

(a) Verwendung der so genannten "Assoziationsklassen" von UML (b) Einführung einer eigenen Klasse für die Assoziation X Y Klasse A Klasse B Klasse A Klasse B X Y Klasse C Klasse C AssoziationsAssoziationsattribute attribute ~~=P ees~~ **R. Lutz,  KIT-CN/IAI Grundlagen der Objektorientierung – Analysemuster** 20/28 

**SWE 1** 

## **Muster 5:  Koordinator** 

## **Beispiel:** 

- Ein Kunde nimmt an mehreren Kursen teil. Die Kurse selbst werden von 

mehreren Kunden gebucht.. 

**==> picture [705 x 256] intentionally omitted <==**

**----- Start of picture text -----**<br>
0..* 0..*<br>Kurs Kunde Kurs Kunde<br>1 1<br>0..* 0..*<br>Teilnahme<br>Teilnahme<br>Datum<br>Datum<br>Gebühr<br>Gebühr<br>Bp - = ]<br>•<br>Es liegen einfache Assoziationen vor<br>•<br>Die Koordinator-Klasse besitzt kaum Attribute/Operationen, sondern mehrere<br>Assoziationen zu anderen Klassen, i. a. zu genau einem Objekt jeder Klasse<br>**----- End of picture text -----**<br>


- Beim Koordinator sind **Beziehungen** wichtig, nicht Attribute 

21/28 

**R. Lutz,  KIT-CN/IAI** 

**Grundlagen der Objektorientierung – Analysemuster** 

**SWE 1** 

## **Welche Muster werden hier behandelt?** 

## 1. Liste 

2. Exemplartyp 

3. Baugruppe 

4. Stückliste 

5. Koordinator 

6. Rollen 

7. Wechselnde Rollen 

8. Historie 

9. Gruppe 

10.Gruppenhistorie 

22/28 

**R. Lutz,  KIT-CN/IAI** 

**Grundlagen der Objektorientierung – Analysemuster** 

## **SWE 1** 

## **Muster 6:  Rollen** 

Rollen werden verwendet, wenn eine Klasse in Bezug auf eine andere Klasse unterschiedliche Rollen spielen kann. 

## **Beispiel:** 

Zu einem Tutorium sind Vortragende und Zuhörer zu verwalten. Dabei kann ein Referent sowohl Vortragender als auch Zuhörer von Tutorien sein. 

**==> picture [588 x 109] intentionally omitted <==**

**----- Start of picture text -----**<br>
0..*<br>Referent<br>Tutorium<br>Zu haltendes Tutorium<br>ee 1 ee<br>Name<br>Bezeichnung<br>Firma<br>Datum 0..* Vortragender<br>Kosten<br>0..* Zuhörer<br>oe Besuchtes Tutorium —<br>**----- End of picture text -----**<br>


23/28 

**R. Lutz,  KIT-CN/IAI** 

**Grundlagen der Objektorientierung – Analysemuster** 

## **SWE 1** 

## **Muster 6:  Rollen** 

**==> picture [523 x 102] intentionally omitted <==**

**----- Start of picture text -----**<br>
0..*<br>Referent<br>Tutorium<br>Zu haltendes Tut.<br>1<br>Name<br>Bezeichnung<br>Vortragender<br>Firma<br>Datum 0..*<br>Kosten<br>0..* Zuhörer<br>Besuchtes Tut.<br>**----- End of picture text -----**<br>


## **Eigenschaften:** 

- Zwischen zwei Klassen existieren zwei oder mehrere einfache Assoziationen. 

- Ein Objekt kann – zu einem Zeitpunkt – in Bezug auf die Objekte (Instanzen) der anderen Klasse verschiedene Rollen spielen. 

- Objekte, die verschiedene Rollen spielen können, besitzen unabhängig von der jeweiligen Rolle die gleichen Eigenschaften und gleiche Operationen. 

24/28 

**R. Lutz,  KIT-CN/IAI** 

**Grundlagen der Objektorientierung – Analysemuster** 

**SWE 1** 

## **Welche Muster werden hier behandelt?** 

## 1. Liste 

2. Exemplartyp 

3. Baugruppe 

4. Stückliste 

5. Koordinator 

6. Rollen 

7. Wechselnde Rollen 

8. Historie 

9. Gruppe 

10.Gruppenhistorie 

25/28 

**R. Lutz,  KIT-CN/IAI** 

**Grundlagen der Objektorientierung – Analysemuster** 

**SWE 1** 

## **Muster 7:  Wechselnde Rollen** 

## **Beispiel:** 

Ein kassenärztlich registrierter Arzt übt zu verschiedenen Zeiten und Praxen eine Tätigkeit als angestellter Arzt aus, bevor er seine Zulassung erhält. 

:RegistrierterArzt :AngestellterArzt :AngestellterArzt :ZugelassenerArzt Zeitraum = Zeitraum = Zeitraum = (1.1.02 - 30.6.04) (1.7.04 - 31.12.04) (1.1.05, ) 

26/28 

**R. Lutz,  KIT-CN/IAI** 

**Grundlagen der Objektorientierung – Analysemuster** 

**SWE 1** 

**==> picture [597 x 493] intentionally omitted <==**

**----- Start of picture text -----**<br>
Muster 7:  Wechselnde Rollen<br>RegistrierterArzt<br>1..*<br>Status<br>Abstrakte Rolle<br>Zeitraum<br>Fachgebiet<br>eS.<br>AngestellterArzt ZugelassenerArzt<br>Konkrete Rolle<br>Beschäftigungsart Ruhezeiten<br>———<br>Grundlagen der Objektorientierung – Analysemuster<br>**----- End of picture text -----**<br>


27/28 

**R. Lutz,  KIT-CN/IAI** 

## **SWE 1** 

## **Muster 7:  Wechselnde Rollen** 

**==> picture [498 x 157] intentionally omitted <==**

**----- Start of picture text -----**<br>
1..* Status<br>= Abstrakte Rolle<br>RegistrierterArzt<br>Zeitraum<br>Fachgebiet<br>AngestellterArzt ZugelassenerArzt<br>=<br>Beschäftigungsart Ruhezeiten Konkrete Rolle<br>**----- End of picture text -----**<br>


## **Eigenschaften:** 

- Ein Objekt der realen Welt kann zu verschiedenen Zeiten verschiedene Rollen spielen. In jeder Rolle kann es unterschiedliche Eigenschaften und Operationen besitzen. 

- Die unterschiedlichen Rollen werden mittels Vererbung modelliert. 

- Objektverbindungen zwischen dem Objekt und seine Rollen werden nur erweitert, d.h. weder gelöscht noch zu anderen Objekten aufgebaut. 

28/28 

**R. Lutz,  KIT-CN/IAI** 

**Grundlagen der Objektorientierung – Analysemuster** 

**SWE 1** 

## **Welche Muster werden hier behandelt?** 

## 1. Liste 

2. Exemplartyp 

3. Baugruppe 

4. Stückliste 

5. Koordinator 

6. Rollen 

7. Wechselnde Rollen 

8. Historie 

9. Gruppe 

10.Gruppenhistorie 

29/28 

**R. Lutz,  KIT-CN/IAI** 

**Grundlagen der Objektorientierung – Analysemuster** 

**SWE 1** 

## **Muster 8:  Historie** 

- Der zeitliche Verlauf einer Information (bzw. Merkmals, Eigenschaft Zustand) über ein Objekt soll verwaltet werden 

**==> picture [686 x 387] intentionally omitted <==**

**----- Start of picture text -----**<br>
•<br>Zu einem bestimmten Zeitpunkt gilt nur ein Wert<br>•<br>Für jede Information ist der Zeitraum festzuhalten<br>:<br>Angestellter<br>Tätigkeit<br>:<br>Tätigkeit Funktion<br>1..*<br>Zeitraum =  Aufgabe<br>(1.1.04, 30.6.04) Angestellter {t=1} Zeitraum<br>: Tätigkeit Name<br>0..*<br>Adresse<br>Zeitraum =  Fortbildung<br>(1.7.04, 31.12.05)<br>Kurs<br>:Fortbildung Zeitraum<br>B ee<br>R. Lutz,  KIT-CN/IAI Grundlagen der Objektorientierung – Analysemuster 30/28<br>**----- End of picture text -----**<br>


**SWE 1** 

## **Muster 8:  Historie** 

**==> picture [498 x 206] intentionally omitted <==**

**----- Start of picture text -----**<br>
Tätigkeit<br>Funktion<br>1..*<br>Aufgabe<br>Angestellter {t=1} Zeitraum<br>Name<br>0..*<br>Adresse<br>Fortbildung<br>Kurs<br>Zeitraum<br>Eigenschaften:<br>**----- End of picture text -----**<br>


- Einfache Assoziation 

- Die zeitliche Restriktion {t = k} (k = gültige Multiplizität, hier k=1) sagt aus, was zu einem Zeitpunkt gelten muss: _{ t=1 }_  _zu einem Zeitpunkt genau 1 Tätigkeit_ 

- Tätigkeiten u. Fortbildungen werden nicht gelöscht, sondern nur erweitert 

31/28 

**R. Lutz,  KIT-CN/IAI** 

**Grundlagen der Objektorientierung – Analysemuster** 

**SWE 1** 

## **Welche Muster werden hier behandelt?** 

## 1. Liste 

2. Exemplartyp 

3. Baugruppe 

4. Stückliste 

5. Koordinator 

6. Rollen 

7. Wechselnde Rollen 

8. Historie 

9. Gruppe 

10.Gruppenhistorie 

32/28 

**R. Lutz,  KIT-CN/IAI** 

**Grundlagen der Objektorientierung – Analysemuster** 

## **SWE 1** 

## **Muster 9:  Gruppe** 

**==> picture [656 x 104] intentionally omitted <==**

**----- Start of picture text -----**<br>
:<br>Angestellter<br>Angestellter 0..* Abteilung<br>: :<br>Angestellter Abteilung Name Kürzel<br>Adresse 0..1 Bezeichnung<br>: Angestellter Spezialgebiet bestehtSeit<br>**----- End of picture text -----**<br>


## **Eigenschaften:** 

- - zum . 

- Mehrere Einzelobjekte gehören - zu einem Zeitpunkt selben Gruppenobjekt Zeitweise kann die Gruppe auch leer sein (Ggs. zur Liste). 

- Jedes Einzelobjekt kann _höchstens in einer Gruppe_ Mitglied sein. Ein Einzelobjekt ist ggf. keiner Gruppe zugeordnet. 

- Es ist jeweils zu prüfen, ob die Gruppe - zeitweise - ohne Einzelobjekte  existieren kann oder ob sie immer eine Mindestanzahl von Einzelobjekten enthalten muss ( 1..* oder 0..* bzw.  0..1 oder 1 als Multiplizität). 

- Die Objektbeziehungen können erstellt und wieder gelöscht werden. 

-  Einfache Assoziation 

33/28 

**R. Lutz,  KIT-CN/IAI** 

**Grundlagen der Objektorientierung – Analysemuster** 

**SWE 1** 

## **Welche Muster werden hier behandelt?** 

## 1. Liste 

2. Exemplartyp 

3. Baugruppe 

4. Stückliste 

5. Koordinator 

6. Rollen 

7. Wechselnde Rollen 

8. Historie 

9. Gruppe 

10.Gruppenhistorie 

34/28 

**R. Lutz,  KIT-CN/IAI** 

**Grundlagen der Objektorientierung – Analysemuster** 

**SWE 1** 

## **Muster 10:  Gruppenhistorie** 

**==> picture [669 x 224] intentionally omitted <==**

**----- Start of picture text -----**<br>
Angestellter Abteilung<br>: Angestellter :Abteilung Name 0..* 0..* Kürzel<br>Adresse Bezeichnung<br>Spezialgebiet {t=0..1} bestehtSeit<br>:Abteilung<br>Eigenschaften: Zugehörigkeit<br>Zugehörigkeit zur Gruppe über einen Zeitraum Zeitraum<br>(Historie) wird dokumentiert Beendigungsgrund<br>_<br>**----- End of picture text -----**<br>


- Zugehörigkeit zur Gruppe über einen Zeitraum (Historie) wird dokumentiert 

- Historie modelliert mit Assoziationsklasse 

- {t=k} (k = gültige Kardinalität) sagt aus, was zu einem Zeitpunkt gelten muss 

- Objektverbindungen bleiben bestehen, neue Verbindungen werden hinzugefügt. 

- Unterschied zu Koordinator: Zugehörigkeit besitzt Zeitraum 

35/28 

**R. Lutz,  KIT-CN/IAI** 

**Grundlagen der Objektorientierung – Analysemuster** 

**SWE 1** 

## **Übungsaufgaben** 

Erstellen Sie jeweils ein Klassendiagramm für die folgenden Problemstellungen: 

1. Mehrere Personen schließen sich zu einer Fahrgemeinschaft  zusammen. 

2. Ein Projektplan besteht aus mehreren Planungsschritten. 

3. In einem Grafiksystem bilden Kreise und Rechtecke eine Gruppe. Diese Gruppe kann wiederum Teil einer anderen Gruppe sein. 

4. Bei mehreren Videokassetten in einer Videothek handelt es sich um den gleichen Film. 

36/28 

**R. Lutz,  KIT-CN/IAI** 

**Grundlagen der Objektorientierung – Analysemuster** 

## **SWE 1** 

## **Übungsaufgaben (2)** 

Erstellen Sie jeweils ein Klassendiagramm für die folgenden Problemstellungen: 

5. Ein Mitarbeiter tritt als Programmierer in ein Unternehmen ein. Nach ein paar Jahren wird er als Manager tätig und steigt später zum Geschäftsführer auf. Für Programmierer, Manager und Geschäftsführer sind unterschiedliche Eigenschaften festzuhalten. 

6. In einem Sportverein sind Sportler zu verschiedenen Zeiten in unterschiedlichen Mannschaften aktiv. 

7. Zu einem Inventarstück in einem Museum sollen – sofern die Daten vorhanden sind – der derzeitige Eigentümer, der Vorbesitzer, der Finder und/oder der Überbringer festgehalten werden, die jeweils die gleichen Eigenschaften besitzen. Eine Person kann z.B. sowohl Eigentümer als auch Finder sein. 

8. Für Personen sollen die Wohnsitze der letzten 10 Jahre ermittelt werden können. Zu einem Zeitpunkt muss jede Person mindestens einen und kann höchstens zwei Wohnsitze besitzen. 

37/28 

**R. Lutz,  KIT-CN/IAI** 

**Grundlagen der Objektorientierung – Analysemuster** 

**SWE 1** 

## **Literatur** 

- Heide Balzert: 

   - _Lehrbuch der Objektmodellierung - Analyse und Entwurf;_ Spektrum Akademischer Verlag - Heidelberg, Berlin, 1999; ISBN 3-8274-0285-9 

- Fowler, Martin: Analysis Patterns – Reusable Object Models; Addison Wesley, 1996; ISBN 0-201-89542-0 

- Kelter, Udo: Lehrmodul Analysemuster – Vorlesung Softwaretechnik an der Universität Siegen; 2010 

38/28 

**R. Lutz,  KIT-CN/IAI** 

**Grundlagen der Objektorientierung – Analysemuster** 

