**SWE 1** 

## Grundlagen der Objektorientierung 

## _**Use-Cases**_ 

R. Lutz,  KIT-CN 

**Grundlagen der Objektorientierung – Use-Cases** 

1 

**SWE 1** 

Was sind Use-Cases und wozu dienen sie? 

R. Lutz,  KIT-CN 

**Grundlagen der Objektorientierung – Use-Cases** 

2 

**SWE 1** 

## **Was sind Use-Cases?** 

## • (engl.) _Use Case_ = **Geschäftsprozess** , **Anwendungsfall** 

Daten Daten **Geschäftsprozess** (Vor-)Ergebnisse, Ergebnisse, Voraussetzungen Nachbedingungen • **Beispiele:** Rechnung erstellen • Einzelteil aus Lager holen • Stückliste erstellen • Buchung aufnehmen • Buch ausleihen • Klausur schreiben 

R. Lutz,  KIT-CN 

**Grundlagen der Objektorientierung – Use-Cases** 

3 

## **SWE 1** 

## **Was sind Use-Cases (2) ?** 

- Erste allgemein verwendbare Notation von Ivar Jacobson (1992) 

- Jacobson unterscheidet zwischen Use-Cases in einem 

   - Informationssystem 

 „Sequenz von zusammengehörigen Transaktionen, die von einem Akteur im Dialog mit einem System ausgeführt werden, um dem Akteur ein Ergebnis von messbarem Wert zu erstellen“ 

- 

- Unternehmen 

- „Sequenz von Transaktionen in einem System (=Unternehmen)  

- „ _Business Process_ “ (Geschäftsprozess) 

Die ausgeführte Aufgabe soll für den Akteur des Unternehmens von messbarem Wert sein 

R. Lutz,  KIT-CN 

**Grundlagen der Objektorientierung – Use-Cases** 

4 

**SWE 1** 

## **Was sind Use-Cases (3) ?** 

Ein Use-Case beschreibt einen speziellen Aspekt eines Systems. 

## **Beispiele:** 

1. die Anmeldung eines Users am System 

2. die Reaktion eines Regelsystems auf das Überschreiten eines gemessenen Grenzwertes 

3. Jede beliebige Funktion eines Systems 

R. Lutz,  KIT-CN 

**Grundlagen der Objektorientierung – Use-Cases** 

5 

**SWE 1** 

## **Wozu Use-Cases und Use-Case-Diagramme?** 

## Zu Beginn der Entwicklung: 

- sämtliche Funktionalitäten und Abläufe des zu entwickelnden Systems erfassen ( _„was soll das System bieten?“_ ) 

- alle Benutzerrollen identifizieren ( _„wer nutzt das System?“_ ) 

- Alle Funktionalitäten/Abläufe für jede Benutzerrolle festlegen ( _„wer darf was?“_ ) 

- Übersichtliche grafische Darstellung (u.U. über mehrere Hierarchien hinweg) 

R. Lutz,  KIT-CN 

**Grundlagen der Objektorientierung – Use-Cases** 

6 

**SWE 1** 

## **Wie werden Use-Cases erfasst?** 

- Ermitteln, welche Aufgaben mit dem neuen Softwaresystem zu bewältigen sind, um die gewünschten Ergebnisse zu erzielen. 

- Es soll nicht nur die Funktionalität der Software spezifiziert werden, sondern die **ergebnisorientierten Abläufe bei der Benutzung** dieser Software! 

- In der Regel werden diese Use-Cases zunächst auf Karteikarten stichwortartig erfasst, um sie dann bei Bedarf in ein Diagramm umzusetzen. 

- Diese Use-Cases müssen am Beginn eines Projekts gesammelt werden, um alle möglichen Fälle abzudecken. 

- Es werden **Szenarios** erstellt, die den Use-Case repräsentieren, der modelliert werden soll. 

R. Lutz,  KIT-CN 

**Grundlagen der Objektorientierung – Use-Cases** 

7 

**SWE 1** 

## Szenarios … !? 

R. Lutz,  KIT-CN 

**Grundlagen der Objektorientierung – Use-Cases** 

8 

**SWE 1** 

## **Was ist ein Szenario?** 

- Ein Szenario ist ein Bestandteil eines Use-Cases 

- Ein Use-Case wird durch ein Szenario oder einer Kollektion von Szenarios dokumentiert. 

- Ein Szenario ist eine Sequenz von Verarbeitungsschritten, die unter bestimmten Bedingungen auszuführen ist. 

- Diese Schritte sollen das Hauptziel eines Akteurs realisieren und ein entsprechendes Ergebnis liefern. 

- Sie beginnen mit einem auslösenden Ereignis und werden fortgesetzt, bis das Ziel erreicht ist oder aufgegeben wird. 

- Jedes Szenario wird durch eine oder mehrere Bedingungen definiert, die zu einem speziellen Ablauf des jeweiligen _Use Cases_ führen. 

R. Lutz,  KIT-CN 

**Grundlagen der Objektorientierung – Use-Cases** 

9 

**SWE 1** 

## **Szenario- Beispiel** _**Telefonverbindung (UML-Spec.)**_ 

Anrufer hebt Hörer ab Wählton (Freizeichen) beginnt Anrufer wählt Ziffer (5) Wählton (Freizeichen) endet Anrufer wählt Ziffer (4) Anrufer wählt Ziffer (3) Anrufer wählt Ziffer (2) Angerufenes Telefon beginnt zu klingeln Anrufendes Telefon signalisiert Rufton Angerufener Teilnehmer meldet sich Angerufenes Telefon hört auf zu klingeln Anrufendes Telefon signalisiert Rufton nicht mehr Telefone werden verbunden Angerufener Teilnehmer hängt ein Telefone werden getrennt Anrufer hängt ein 

R. Lutz,  KIT-CN 

**Grundlagen der Objektorientierung – Use-Cases** 

10 

**SWE 1** 

## **Szenario- Beispiel** _**Telefonverbindung (verbessert)**_ 

## `BEGINN Telefonverbindung` 

`Anrufer hebt Hörer ab` 

`Wählton (Freizeichen) beginnt Anrufer wählt erste Ziffer (z.B. 5) Wählton (Freizeichen) endet` 

`Anrufer wählt restliche Ziffern (4, 3, 2, ..) Angerufenes Telefon beginnt zu klingeln Anrufendes Telefon signalisiert Rufton` 

`WENN sich angerufener Teilnehmer meldet: Angerufenes Telefon hört auf zu klingeln` 

`Anrufendes Telefon signalisiert Rufton nicht mehr Telefone werden verbunden` 

`WENN angerufener Teilnehmer ODER Anrufer den Hörer auflegt: Telefone werden getrennt` 

`ENDE-WENN` 

`SONST` 

`Anrufer legt auf ENDE-WENN` 

`ENDE Telefonverbindung` 

R. Lutz,  KIT-CN 

**Grundlagen der Objektorientierung – Use-Cases** 

11 

**SWE 1** 

## **Szenario - Übungsbeispiele** 

## Für die einzelnen Lastenheftanalysen: 

**1. Zooverwaltung** _**:  „Tier anlegen“**_ 

**2. Vereinsverwaltung** _**:  „Mitglied anlegen“**_ 

**3. Arztpraxis** _**:  „Arztbesuch“**_ 

## **Hinweis:** 

bei allen Übungen sollen die Elemente „komplett“ angelegt werden, d.h. mit allen Referenzen zu anderen Elementen. 

R. Lutz,  KIT-CN 

**Grundlagen der Objektorientierung – Use-Cases** 

12 

**SWE 1** 

## **Szenario – weitere Übungsbeispiele** 

_**1. Bei Firma bewerben**_ 

_**2. Vorstellungsgespräch „erleben“**_ 

_**3. Vorlesung besuchen**_ 

_**4. Prüfung schreiben**_ 

_**5. Praxis-/Bachelorarbeit anfertigen**_ 

## **Hinweis:** 

bei allen Übungen sollen die Elemente „komplett“ angelegt werden, d.h. mit allen Referenzen zu anderen Elementen. 

R. Lutz,  KIT-CN 

**Grundlagen der Objektorientierung – Use-Cases** 

13 

**SWE 1** 

## Formalisierte Beschreibung 

## von Use-Cases 

R. Lutz,  KIT-CN 

**Grundlagen der Objektorientierung – Use-Cases** 

14 

**SWE 1** 

## **Use-Case-Beschreibung** 

Formalisierte Darstellung (Schablone, Template) zur besseren Übersicht: 

- Name des Use-Cases 

- Ziel des Use-Cases im Kontext (der SW) 

- Liste der beteiligten Akteure 

- Trigger (Auslöser, auslösendes Ereignis) 

- Vorbedingungen 

- Nachbedingungen (a) bei Erfolg und (b) bei Fehlschlag 

- Essenzielle Schritte (als Szenario, z.B. mit Pseudocode) 

- Erweiterungen 

- Alternativen 

- Bedingungen (optional) 

- Häufigkeit (optional) 

R. Lutz,  KIT-CN 

**Grundlagen der Objektorientierung – Use-Cases** 

15 

## **SWE 1** 

## **Use-Case-Beschreibung** 

## Formalisierte Darstellung (Schablone, Template) zur besseren Übersicht: 

|**Name**des Use-Cases|(2-3 Wörter, was wird getan?)|
|---|---|
|**Ziel**des Use-Cases im<br>Kontext (der SW)|globale Zielsetzung bei erfolgreicher Ausführung des UC|
|Liste der beteiligten<br>**Akteure**|Rollen von Personen und anderen Systemen, die den Use-<br>Case auslösen oder daran beteiligt sind|
|**Trigger**(Auslöser,<br>auslösendes Ereignis)|Wenn dieses Ereignis eintritt, dann wird  der Use-Case initiiert|
|**Vorbedingungen**|Erwarteter Zustand, bevor der Use-Case beginnt<br>Der betrachtete Use-Case kann nur ausgeführt werden, wenn<br>die genannte Vorbedingung erfüllt ist.|



R. Lutz,  KIT-CN 

**Grundlagen der Objektorientierung – Use-Cases** 

16 

**SWE 1** 

## **Use-Case-Beschreibung** 

## Formalisierte Darstellung zur besseren Übersicht (Forts.): 

|**Nachbedingungen**<br>bei**Erfolg**|Erwarteter Zustand nacherfolgreicherAusführung des Use-<br>CaseErgebnis des Use-Case|
|---|---|
|**Nachbedingungen**<br>bei**Fehlschlag**|Erwarteter Zustand, wenn Zielnichterreicht werden kann<br>Die Nachbedingung eines Use-Cases**A**kann für einen Use-<br>Case**B**eine Vorbedingung  bilden.<br>Reihenfolge von Use-Cases teilweise bestimmbar!|
|**Essenzielle Schritte**|1.erste Aktion,   2. zweite Aktion, … (ugs.,**Szenario**)|
|**Erweiterungen**|1a.Erweiterungen des Funktionsumfangs der 1. Aktion<br>2a. Erweiterungen des Funktionsumfangs der 1. Aktion usw.|
|**Alternativen**|1a. Alternative Ausführung der ersten Aktion<br>1b. Weitere Alternativen zur ersten Aktion|



R. Lutz,  KIT-CN 

**Grundlagen der Objektorientierung – Use-Cases** 

17 

**SWE 1** 

## **Use-Case-Templates (5)** 

## **Beispiel** für Erweiterungen und Alternativen 

**Essenzielle Schritte:** 1. Kundendaten abrufen 2. Lieferbarkeit prüfen 3. Rechnung erstellen 4. Auftrag vom Lager ausführen lassen 5. Rechnungskopie an Buchhaltung geben **Erweiterung:** 1a  Kundendaten aktualisieren **Alternativen:** 1b  Neukunden erfassen 3a  Rechnung mit Nachnahme erstellen 3b  Rechnung mit Bankeinzug erstellen 

R. Lutz,  KIT-CN 

**Grundlagen der Objektorientierung – Use-Cases** 

18 

**SWE 1** 

## **Use-Case-Beschreibung (Beispiel)** 

|**Name**|**Taxi bestellen**|
|---|---|
|Ziel im Kontext|Ein Kunde bestellt ein Taxi|
|Akteure|Kunde, Taxivermittler (TV)|
|Trigger|Kunde ruft den Taxivermittler an|
|Essenzielle Schritte|1. Ein Kunde ruft den Taxivermittler an, um ein Taxi zu bestellen.<br>2. Der Kunde teilt dem Taxivermittler die Bestelldetails mit.<br>3. Der Taxivermittler registriert den Auftrag im System.<br>4. Der Taxivermittler bestätigt dem Kunden den Bestellauftrag.|
|Erweiterungen|3a. Der Taxivermittler stellt fest, dass kein Taxi verfügbar ist:<br>3a1. Der TV stellt Anfrage an den übergeordneten Taxiverband<br>3a2. Der TV erhält die Bestätigung vom Taxiverband.<br>3b. Der TV stellt fest, dass Kunde nicht vertrauenswürdig ist:<br>3b1. Der TV lehnt den Auftragab.|



R. Lutz,  KIT-CN 

**Grundlagen der Objektorientierung – Use-Cases** 

19 

**SWE 1** 

## **Use-Case-Beispiel** _**einfacher Internetshop**_ 

|**Name**|**Use Case 1: Bestellung auf einer Internetseite**|
|---|---|
|Ziel im Kontext|Ein Kunde bestellt Waren auf einer Internetseite|
|Akteure|Kunde|
|Trigger|Der Kunde legt eine ausgewählte Ware in den Warenkorb|
|Essenzielle Schritte|1. Der Kunde gibt eine Warenbestellung auf der Internetseite ein<br>2. Beim Bezahlvorgang muss sich der Kunde mit seinem<br>Benutzernamen einloggen|
|Erweiterungen|2.a wenn der Benutzer noch nicht registriert ist, muss er sich<br>registrieren<br>2.b wenn der Benutzer seine Login-Daten nicht mehr weiß …|
|Bedingungen|Um einen bereits gespeicherten Zahlungsweg zu nutzen, ist die<br>Anmeldungmit Passwort notwendig|



R. Lutz,  KIT-CN 

**Grundlagen der Objektorientierung – Use-Cases** 

20 

**SWE 1** 

## **Use-Case-Beispiel** _**einfacher Internetshop**_ 

## **Erfassung der Use-Cases (Forts.)** 

|**Name**|**Use Case 2: Versand einer Bestellung (**auf einer Internetseite**)**|
|---|---|
|Ziel im Kontext|Ein Händler versendet bestellte Waren|
|Akteure|Händler|
|Trigger|Ein Kunde hat eine Bestellung getätigt|
|Essenzielle Schritte|1. Der Händler prüft die (Bestell-)Daten des Kunden<br>2. Sind die Daten in Ordnung, verpackt er die Ware und<br>versendet sie|
|Erweiterungen|2.a. Ist die Ware als Geschenk erwünscht, wird sie<br>(zusätzlich)als Geschenk verpackt|



R. Lutz,  KIT-CN 

**Grundlagen der Objektorientierung – Use-Cases** 

21 

**SWE 1** 

## **Use-Case-Beispiel** _**einfacher Internetshop**_ 

**Erfassung der Use-Cases (Forts.)** 

Use-Case 3: Kundendaten prüfen Use-Case 4: Waren verpacken Use-Case 5: Waren als Geschenk verpacken Use-Case 6: In System einloggen (Kunde) Use-Case 7: Am System registrieren (Kunde) 

R. Lutz,  KIT-CN 

**Grundlagen der Objektorientierung – Use-Cases** 

22 

**SWE 1** 

## Grundelemente 

von Use-Case-Diagrammen 

R. Lutz,  KIT-CN 

**Grundlagen der Objektorientierung – Use-Cases** 

23 

**SWE 1** 

## **Use-Case-Elemente** 

System 

**==> picture [107 x 273] intentionally omitted <==**

**----- Start of picture text -----**<br>
Use Case<br>+<br>Akteur<br>**----- End of picture text -----**<br>


**==> picture [240 x 135] intentionally omitted <==**

**----- Start of picture text -----**<br>
Kommunikations- und<br>a raed<br>Zuordnungs-Pfeile<br>**----- End of picture text -----**<br>


R. Lutz,  KIT-CN 

**Grundlagen der Objektorientierung – Use-Cases** 

24 

**SWE 1** 

## **Use-Case-Elemente** 

StandardDarstellung 

- Ein _**Use-Case**_ besteht aus mehreren zusammenhängen-den Aufgaben, die von einem Akteur durchgeführt werden, um ein Ziel zu erreichen bzw. ein gewünschtes Ergebnis zu erzielen. 

- Beschreibung eines Use-Cases: 

   - Ein einfacher Anwendungsfall kann umgangssprachlich beschrieben werden 

stereotypisierte Darstellung 

- Bei einer umfangreichen Spezifikation ist der Einsatz von _Use-Case-Templates_ erforderlich. 

- Ebenso können Zustands- und Sequenzdiagramme, Pseudocode, PAP, Struktogramme usw. verwendet werden. 

R. Lutz,  KIT-CN 

**Grundlagen der Objektorientierung – Use-Cases** 

25 

**SWE 1** 

## **System - Systemgrenze** 

- System(-grenze), **in** dem die Use-Cases stattfinden 

- Darstellung als Rechteck mit Benennung 

- Jeder Akteur befindet sich stets außerhalb des Systems 

- Jeder Use-Case kann selbst durch ein eigenes System definiert sein („Untersystem“). 

**==> picture [106 x 18] intentionally omitted <==**

**----- Start of picture text -----**<br>
Systemname<br>**----- End of picture text -----**<br>


## _**Die zu entwickelnde Software**_ 

R. Lutz,  KIT-CN 

**Grundlagen der Objektorientierung – Use-Cases** 

26 

**SWE 1** 

## **Akteure** 

- Ein Akteur (actor) ist eine Rolle, d.h. Menschen oder auch automatisierte Systeme, die ein Benutzer des Systems spielt. 

– er kommuniziert **mit** dem System 

– hat einen gewissen Einfluss auf das System. 

**A** 

- Vererbung bzgl. Verantwortlichkeit ist möglich (Vererbungspfeil). 

 Bedeutung: eine Instanz von Akteur B kann mit denselben Use-Cases kommunizieren wie eine Instanz von Akteur A (und evtl. mehr) 

**B** 

_**Anwender des Systems**_ 

R. Lutz,  KIT-CN 

**Grundlagen der Objektorientierung – Use-Cases** 

27 

**SWE 1** 

## **Akteure und Systeme** 

## **Beispiele für Akteure** 

**==> picture [523 x 379] intentionally omitted <==**

**----- Start of picture text -----**<br>
Handelshaus<br>(System=Unternehmen)<br>$ k<br>Kunde Lieferant<br>zs 7<br>Kundensachbearbeiter Auftrags- und  Lieferantensachbearbeiter<br>Bestellwesen<br>(Softwaresystem)<br>22<br>Lagersachbearbeiter Buchhaltung<br>Grundlagen der Objektorientierung – Use-Cases<br>**----- End of picture text -----**<br>


R. Lutz,  KIT-CN 

28 

**SWE 1** 

## **Assoziationen** 

- Assoziation eines Akteurs mit einem Use-Case. Pfeile können die Kommunikationsrichtung hervorheben 

<<include>> 

<<extend>> 

- **include** -Beziehung (Auslagern gemeinsamer Funktionalität mehrerer Use-Cases) 

- **extend** -Beziehung (spezialisierte Erweiterung eines Use-Case) 

- Generalisierung (Vererbung). 

   - (Nur für Akteure sinnvoll, für Use-Cases in der UML nicht sauber definiert) 

R. Lutz,  KIT-CN 

**Grundlagen der Objektorientierung – Use-Cases** 

29 

**SWE 1** 

## **<<include>>-Assoziation** 

- Eine **include** -Beziehung liegt vor, wenn Use-Cases (z.B: **B1** und **B2** ) ein gemeinsames (Teil-)Verhalten besitzen, 

- <<include>> das in dem Use-Case **A** spezifiziert ist. 

   - Use-Case **A** wird analog zu einem Unterprogramm oder einem Macro aufgerufen bzw. benutzt. 

   - Die **include** -Beziehung erspart die mehrmalige redundante Beschreibung des gleichen Verhaltens. 

   - Der inkludierte Use-Case ist nicht optional und wird auf jeden Fall aufgerufen (Workaround:  Kommentar) 

**==> picture [662 x 151] intentionally omitted <==**

**----- Start of picture text -----**<br>
Wareneingang<br>aus Einkauf Wareneingang<br>aus Produktion<br>bearbeiten<br>bearbeiten<br>yN <<include>> <<include>> ae<br>> = Cc ><br>B1<br>B2<br>Ware<br>einlagern<br>A<br>**----- End of picture text -----**<br>


R. Lutz,  KIT-CN 

**Grundlagen der Objektorientierung – Use-Cases** 

30 

## **SWE 1** 

## **<<extend>>-Assoziation** 

   - Eine **extend** -Beziehung liegt vor, wenn ein Use-Case **B** ähnlich einem Use-Case **A** ist, aber „ _etwas mehr tut als_ _**A**_ “. 

- Der erweiternde Use-Case **B** ist optional und ergänzt den vorhandenen Use-Case **A** 

- <<extend>> 

   - Die **extend** -Beziehung ermöglicht es, einen komplexen Use-Case zunächst in vereinfachter Form zu spezifizieren, und komplexe Sonderfälle in die Erweiterungen zu verlagern (s. auch _Extension Point_ in übernächster Folie) 

   - Der erweiternde Use-Case wird nur unter bestimmten Bedingungen aufgerufen 

**==> picture [527 x 162] intentionally omitted <==**

**----- Start of picture text -----**<br>
Auftrag<br>durchführen <<extend>> Auftrag mit<br>Nachlieferung<br>extension points<br>ausführen<br>Nachlieferung: ...<br>B<br>A<br>Grundlagen der Objektorientierung – Use-Cases<br>**----- End of picture text -----**<br>


R. Lutz,  KIT-CN 

31 

## **SWE 1** 

## **<<extend>>-Assoziation (Vorbedingungen)** 

• Die Vorbedingungen, die zur Verwendung eines erweiternden Use-Cases führen und die entsprechenden _Extension Points_ werden als Notiz an die **extend** -Beziehung gehängt. 

<<extends>> 

**==> picture [530 x 230] intentionally omitted <==**

**----- Start of picture text -----**<br>
Vorbedingung:<br>{Es müssen einige Artikel nachgeliefert werden}<br>Extension Point : Nachlieferung<br>Auftrag<br>durchführen <<extend>> Auftrag mit<br>extension points Nachlieferung<br>ausführen<br>Nachlieferung: ...<br>B<br>A<br>**----- End of picture text -----**<br>


R. Lutz,  KIT-CN 

**Grundlagen der Objektorientierung – Use-Cases** 

32 

## **SWE 1** 

## **<<extend>>-Assoziation (** _**Extension Points**_ **)** 

- Ein Use-Case kann mehrere _**Extension Points**_ ( **Erweiterungspunkte** ) enthalten. 

( **Erweiterungspunkte** ) enthalten. Daten archivieren **extension points** • Ein Erweiterungspunkt ist eine Referenz zu einem Ort EP 1 [:Beschreibung] innerhalb eines Use-Cases, wo Aktions-Sequenzen und EP 2 [:Beschreibung] Verhalten anderer Use-Cases eingefügt werden können. ~~=~~ • Jeder Erweiterungspunkt  hat innerhalb eines Use-Cases einen **eindeutigen Namen** und eine **Beschreibung** , an welcher Stelle des Use-Cases dieser um einen anderen Use-Case erweitert wird. Daten archivieren **extension points** EP 1 [:Beschreibung] EP 2 [:Beschreibung] ~~—_~~ 

- Jeder Erweiterungspunkt  hat innerhalb eines Use-Cases einen **eindeutigen Namen** und eine **Beschreibung** , an welcher Stelle des Use-Cases dieser um einen anderen Use-Case erweitert wird. 

R. Lutz,  KIT-CN 

**Grundlagen der Objektorientierung – Use-Cases** 

33 

**SWE 1** 

## Use-Case-Diagramm 

Beispiel: _einfacher Internetshop_ 

R. Lutz,  KIT-CN 

**Grundlagen der Objektorientierung – Use-Cases** 

34 

**SWE 1** 

## **Use-Case-Beispiel** _**einfacher Internetshop**_ 

**Erfassung der Use-Cases (Forts.)** Use-Case 1: **Bestellung** auf einer Internetseite Use-Case 2: Versand einer Bestellung Use-Case 3: Kundendaten prüfen Use-Case 4: Waren verpacken Use-Case 5: Waren als Geschenk verpacken Use-Case 6: In System einloggen (Kunde) Use-Case 7: Am System registrieren (Kunde) 

R. Lutz,  KIT-CN 

**Grundlagen der Objektorientierung – Use-Cases** 

35 

**==> picture [683 x 441] intentionally omitted <==**

**----- Start of picture text -----**<br>
SWE<br>1<br>DHE<br>Use-Case-Beispiel: einfacher Internet-Shop<br>Einfacher Internet-Shop<br>anmelden<br>Kundendaten<br>£ —C 6 prüfen<br>Kunde <<include>> 3<br><<include>><br>bestellen<br>1 Ware<br>verpacken<br><<include>><br>4<br><<extend>><br>registrieren<br><<include>><br>Sx SA 9<br>7<br>Ware als  Händler<br>Geschenk<br>verpacken<br>Bestellung<br>5 versenden<br>2<br>**----- End of picture text -----**<br>


R. Lutz,  KIT-CN 

**Grundlagen der Objektorientierung – Use-Cases** 

36 

**SWE 1** 

## **<<include>>-Assoziation** 

**==> picture [645 x 356] intentionally omitted <==**

**----- Start of picture text -----**<br>
Einfacher Internet-Shop<br>anmelden<br>Kundendaten<br>6 prüfen<br>Kunde <<include>> 3<br><<include>><br>bestellen<br>1 Ware<br>verpacken<br><<include>><br>4<br><<extend>><br>registrieren<br><<include>><br>7<br>Ware als  Händler<br>Geschenk<br>verpacken<br>Bestellung<br>5 versenden<br>2<br>on<br>**----- End of picture text -----**<br>


R. Lutz,  KIT-CN 

**Grundlagen der Objektorientierung – Use-Cases** 

37 

**SWE 1** 

## **<<extend>>-Assoziation** 

## Einfacher Internet-Shop 

**==> picture [645 x 381] intentionally omitted <==**

**----- Start of picture text -----**<br>
anmelden<br>Kundendaten<br>t C) 6 prüfen<br>Kunde <<include>> 3<br><<include>><br>bestellen<br>1 Ware<br>verpacken<br><<include>><br>4<br><<extend>><br>registrieren<br><<include>><br>7<br>Ware als  Händler<br>Geschenk<br>verpacken<br>Bestellung<br>5 versenden<br>2<br>CE<br>R. Lutz,  KIT-CN Grundlagen der Objektorientierung – Use-Cases<br>**----- End of picture text -----**<br>


R. Lutz,  KIT-CN 

38 

**SWE 1** 

## und schließlich: 

Hierarchisierung (Verfeinerung) von Use-Case-Diagrammen 

R. Lutz,  KIT-CN 

**Grundlagen der Objektorientierung – Use-Cases** 

39 

**SWE 1 Hierarchisierung von Use-Cases**  analog zu Datenflussdiagrammen XX verwalten ~~z~~ **B** YY verwalten **A** ZZ YY verwalten verwalten YY anlegen YY ändern **A B** YY suchen ~~salSt~~ R. Lutz,  KIT-CN **Grundlagen der Objektorientierung – Use-Cases** 40 = ~~)~~ 

**SWE 1** 

Was noch zu beachten ist beim Erstellen von Use-Case-Diagrammen 

R. Lutz,  KIT-CN 

**Grundlagen der Objektorientierung – Use-Cases** 

41 

**SWE 1** 

## **Zu beachten!** 

- Erstellen Sie Use-Cases aus der Sicht des Anwenders und nicht aus der Sicht des Entwicklers 

- Verwenden Sie Use-Cases nicht zur detaillierten Beschreibung von Operationen und Funktionen 

- Modellieren Sie nicht zu viele Use-Cases (Empfehlung: max. 10 Use-Cases pro Diagramm) 

- Verfeinern Sie die Use-Cases durch eine geeignete Technik. 

- Benennen Sie den Akteur immer eindeutig 

R. Lutz,  KIT-CN 

**Grundlagen der Objektorientierung – Use-Cases** 

42 

**SWE 1** 

## **Wozu dienen Use-Cases nicht?** 

- Use-Cases beschreiben **nicht** die innere Struktur eines Software-Systems. 

- Mit Use-Cases ist es **nicht** möglich, eine (vollständige) Beschreibung eines GUI-Designs zu erstellen (die funktionalen Anforderungen sind größtenteils unabhängig von der GUI). 

- Use-Cases beschreiben **keine** Programmabläufe  Aktivitäts- und Sequenzdiagramme 

- Use-Cases beschreiben **keine** generellen nichtfunktionalen Anforderungen (gesetzliche Regelungen, Qualitätsanforderungen, HW-Anforderungen, Standards etc. ) 

R. Lutz,  KIT-CN **Grundlagen der Objektorientierung – Use-Cases** 

43 

**SWE 1** 

## **Use-Case-Diagramm: 2 Ansätze** 

- Funktionsorientierter Ansatz 

   - Die reine Funktionalität steht im Vordergrund der Modellierung 

      - ==> höherer Dokumentationsaufwand ==> i.d.R. höherer Verfeinerungsgrad 

- Elementorientierter Ansatz 

   - Die Verwaltung der Elemente steht im Vordergrund 

==> Verfeinerungen sind sehr ähnlich (=> copy/paste) ==> geringerer Dokumentationsaufwand 

R. Lutz,  KIT-CN 

**Grundlagen der Objektorientierung – Use-Cases** 

44 

**SWE 1** 

## **Funktionsorientierter Ansatz** 

**==> picture [648 x 325] intentionally omitted <==**

**----- Start of picture text -----**<br>
Filmverwaltung<br>Daten<br>ansehen<br>Daten<br>anlegen<br>/<br>Co) .<br>_ na<br>Akteur1 <<include>><br>SN 4<br>SN /<br><<include>><br>Daten<br>suchen<br>77 <<include>> \<br>Daten \<br>ändern 11) <<include>> Akteur2<br>|<br>\<br>=> | \<br>Daten<br>löschen<br>**----- End of picture text -----**<br>


R. Lutz,  KIT-CN 

**Grundlagen der Objektorientierung – Use-Cases** 

45 

**SWE 1** 

## **Elementorientierter Ansatz** 

**==> picture [638 x 384] intentionally omitted <==**

**----- Start of picture text -----**<br>
Filmverwaltung<br>Regisseure<br>verwalten<br>Darsteller<br>verwalten<br>gt SG<br><<include>><br>Akteur1 <<include>><br>Filme<br>Akteur2<br>verwalten<br><<include>><br>Hat nur<br><<include>><br>Musikstücke lesenden<br>verwalten<br>Zugriff<br>Datenträger<br>verwalten<br>~ eo 4-<br><<include>>:<br>es werden jeweils die<br>„suchen“-Use-Cases verwendet.<br>**----- End of picture text -----**<br>


R. Lutz,  KIT-CN 

**Grundlagen der Objektorientierung – Use-Cases** 

46 

**SWE 1** 

R. Lutz,  KIT-CN 

**Grundlagen der Objektorientierung – Use-Cases** 

47 

