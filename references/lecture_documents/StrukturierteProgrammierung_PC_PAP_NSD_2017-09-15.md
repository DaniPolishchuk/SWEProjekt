**SE 1** 

## **Strukturierte Programmierung** 

**Grundlegendes über strukturierte Programmierung sowie die Methoden: Pseudocode und , Programmablaufplan Struktogramme** 

Stand 15.09.2017 

R. Lutz,  KIT/IAI 

**Strukturierte Programmierung (Pseudocode, PAP, NSD)** 

1 

**SE 1** 

## **Was versteht man unter strukturierter Programmierung?** 

## 1. Funktionale Strukturierung des Problems ( Datenflussdiagramm, SADT, ... ) 

## 2. Strukturierung der Daten 

   - ( Data Dictionary, Syntaxdiagramm, ... )) 

3. Strukturierung des Programmablaufs 

R. Lutz,  KIT/IAI 

**Strukturierte Programmierung (Pseudocode, PAP, NSD)** 

2 

**SE 1** 

## **Regeln** 

## **1. Beschränkung auf wenige Kontrollstrukturen** 

- Sequenz 

- Selektion, Auswahl 

- Iteration, Wiederholung, Schleife 

- Aufruf anderer Algorithmen (Unterprogramme) 

## **2. Single Entry / Single Exit - Prinzip** 

- Jedes Konstrukt hat genau **ein** Eingang und genau **ein** Ausgang. 

- => eine Vereinfachung des Programmablaufs. 

- Sprünge (GOTO) werden dadurch vermieden. 

R. Lutz,  KIT/IAI 

**Strukturierte Programmierung (Pseudocode, PAP, NSD)** 

3 

**SE 1** 

## **Regeln** 

## **3. Programmentwicklung durch schrittweise Verfeinerung (top-down)** 

Bei komplexen Programmstrukturen ist es jederzeit möglich, Bereiche auf separate Diagrammseiten auszulagern. Dies entspricht der Bildung von Unterprogrammen bzw. . Unterprogrammaufrufen 

R. Lutz,  KIT/IAI 

**Strukturierte Programmierung (Pseudocode, PAP, NSD)** 

4 

**SE 1** 

## **Pseudo-Code** 

R. Lutz,  KIT/IAI 

**Strukturierte Programmierung (Pseudocode, PAP, NSD)** 

5 

**SE 1** 

## **Pseudocode** 

- an 

- textuelle, semiformale Darstellungsform in **Anlehnung** problemorientierte Programmiersprachen. 

- Pseudocodes sind **nicht normiert** . 

## **Kontrollstrukturen** 

Syntax und Wortsymbole von Programmiersprachen 

## **Anweisungen** 

entweder verbale Formulierungen 

oder mehr oder weniger programmiersprachliche Notationen 

R. Lutz,  KIT/IAI 

**Strukturierte Programmierung (Pseudocode, PAP, NSD)** 

6 

**SE 1** 

## **Pseudocode (Eigenschaften)** 

## **Vorteile:** 

- Präzise 

- Übersichtlich 

- 

   - Änderungsfreundlich 

- leicht in Quellcode übertragbar 

## **Bestandteile:** 

- Schlüsselworte (beschreiben den Ablauf) 

- natürliche Sprache (formuliert die Aktionen) 

- Einrückungen (verdeutlichen die Struktur) 

## **Ziel:** 

Pseudocode soll lesbar und verständlich sein für 

- Personen ohne (besondere) Programmierkenntnisse (Auftraggeber, Vertrieb, Projektmanager, …) 

- Entwickler und Programmierer 

R. Lutz,  KIT/IAI 

**Strukturierte Programmierung (Pseudocode, PAP, NSD)** 

7 

**SE 1** 

## **Pseudocode (Regeln)** 

## **Allgemein:** 

- Unbedingt einrücken! 

- Schlüsselworte auffällig scheiben 

   - ( **fett** oder _kursiv_ oder _**beides**_ oder mit GROßBUCHSTABEN) 

## **: WICHTIG für die Entwurfsphase:** 

- “ 

- • In der Entwurfsphase gibt es **kein** „ _**i = i + 1**_ 

- Nicht zu sehr an Programmiersprachen orientieren 

- Unnötige Klammerungen, Semikolons usw. vermeiden 

- Klare und saubere Sätze formulieren 

   - (Substantive, Verben, Adjektive:  => besser lesbar) 

**TIPP:** 

• Bei der Erstellung jede 2. Zeile frei lassen für einfachere Ergänzungen bzw. Änderungen 

R. Lutz,  KIT/IAI 

**Strukturierte Programmierung (Pseudocode, PAP, NSD)** 

8 

**SE 1** 

## **Pseudocode:  Schlüsselworte und Konstrukte** 

|**(Funktions-)**<br>**Block**|**BEGIN**_Name_<br>**END**_Name_|**BEGINN**_Name_<br>**ENDE**_Name_|**BEGINN**_Datenkonvertierung_<br>**_…_**<br>**ENDE**_Datenkonvertierung_|
|---|---|---|---|
|**Sequenz:**|Anweisung 1<br>Anweisung 2<br>Anweisung 3|Anweisung 1<br>Anweisung 2<br>Anweisung 3|**…**<br>Lies Eingabedaten ein<br>Konvertiere Eingabedaten<br>Schreibe Daten in Datei<br>**…**|
|**Auswahl:**|**IF** _Bedingung_<br>**THEN**<br>Anweisung<br>**ELSEIF**_Bedingung_<br>Anweisung<br>**ELSE**<br>Anweisung<br>**ENDIF**|**WENN** _Bedingung_<br>Anweisung<br>**ODER WENN**_Bedingung_<br>Anweisung<br>**SONST**<br>Anweisung<br>**ENDE WENN**|**WENN** _Element LINIE ist_<br>Lies Anfangspunkt<br>Lies Endpunkt<br>**ODER WENN**_El. PUNKT ist_<br>Lies Mittelpunkt<br>**SONST**<br>Lies Mittelpunkt<br>**ENDE WENN**|



R. Lutz,  KIT/IAI 

**Strukturierte Programmierung (Pseudocode, PAP, NSD)** 

9 

**SE 1** 

## **Pseudocode:  Schlüsselworte u. Konstrukte (2)** 

|**Mehrfach-**<br>**auswahl**|**CASE**_Variable_**OF**<br>Konst 1 : Anweisung<br>Konst 2 : Anweisung<br>. . .<br>Konst n : Anweisung<br>**ELSE**<br>Anweisung<br>**ENDCASE**|**FALLS** _Variable_ **IST**<br>**Wert 1:**Anweisung<br>**Wert 2:**Anweisung<br>. . .<br>**Wert N:**Anweisung<br>**SONST**<br>Ausnahme-Anweisung<br>**ENDE-FALLS**|**FALLS** _Wichtigkeit_ **IST**<br>**error:**Meldung ist Fehler<br>Fehler ausgeben<br>**info:**Meldung ist Info<br>**…**<br>**SONST**<br>Ausgabe „unbekannte W.“<br>**ENDE-FALLS**|
|---|---|---|---|
|**Aufruf von**<br>**Routinen:**|**CALL**_UP_(argList)|**FÜHRE**_UP-Name_(argL)<br>**AUS**|**FÜHRE**_create_( a,b, c)**AUS**|
|**Schleifen**<br>**(fest):**|**FOR**_Zähler_in_Bereich_<br>Anweisungen<br>**ENDFOR**|**WIEDERHOLE**von_N_bis_M_<br>Anweisungen<br>**ENDE-WIEDERHOLE**|**WIEDERHOLE**von_N_bis_M_<br>**FÜHRE**calc( x )**AUS**<br>prüfe Ergebnis<br>**ENDE-WIEDERHOLE**|



R. Lutz,  KIT/IAI 

**Strukturierte Programmierung (Pseudocode, PAP, NSD)** 

10 

**SE 1** 

## **Pseudocode:  Schlüsselworte u. Konstrukte (3)** 

|**Schleifen:**<br>(„Kopfgesteuert“)|**WHILE**_Bedingung_<br>Anweisungen<br>**ENDWHILE**|**SOLANGE**_Bedingung_<br>Anweisungen<br>**ENDE-SOLANGE**|**SOLANGE**_A kleiner als B ist_<br>gib den Wert von B aus<br>berechne neuen Wert von B<br>**ENDE-SOLANGE**|
|---|---|---|---|
|**Schleifen:**<br>(„Fußgesteuert“)|**REPEAT**<br>Anweisungen<br>**UNTIL**_Bedingung_|**WIEDERHOLE**<br>Anweisungen<br>**BIS** _Bedingung_|**WIEDERHOLE**<br>berechne neuen Wert von B<br>gib den Wert von B aus<br>**BIS** _A gleich groß ist wie B_|
|**Spezialfall**<br>"Endlosschleife":|**FOREVER**<br>Anweisung 1<br>Anweisung 2<br>**BREAK**<br>**END**|||



R. Lutz,  KIT/IAI 

**Strukturierte Programmierung (Pseudocode, PAP, NSD)** 

11 

**SE 1** 

## **Pseudocode:  Beispiel** 

## **Aufgabe: Erstellung eines Unterprogramms zur Erfassung von Firmenadressen** 

## Setzen Sie folgende Anforderungen aus einem Lastenheft in Pseudocode um: 

1. Ein Programm zur Verwaltung von Firmenadressen basiert zur Vereinfachung für das vorliegende Problem auf den Daten _Firmeneintrag_ und _Firmenkurznamen_ . 

2. Bei der Ersterfassung einer Adresse muss geprüft werden, ob diese bereits in der Firmendatei vorhanden ist. Wenn nicht, so soll ein Firmenkurznamen vergeben werden und ein neuer Firmeneintrag in der Firmendatei vorgenommen werden. 

3. Sollte bereits ein Firmeneintrag vorhanden sein, so kann man diesen ändern und dann neu eintragen. 

4. Bei der Löschung eines Firmeneintrags muss darauf geachtet werden, dass es Kundeneinträge in der Kundendatei geben kann, die den Firmenkurznamen enthalten. Dann muss der Benutzer darauf hingewiesen werden, dass erst alle entsprechenden Kundeneinträge geändert werden müssen. 

5. Das Programm soll benutzerfreundlich implementiert werden (hohe Interaktivität). 

R. Lutz,  KIT/IAI 

**Strukturierte Programmierung (Pseudocode, PAP, NSD)** 

12 

**SE 1** 

## **Pseudocode:  Beispiel (Lösung)** 

## „Hauptfunktion“ 

**Beginn** Adresserfassungsunterprogramm 

## **FALLS** Funktion **ist** 

**Ersterfassung** : _Erfassen und Prüfen der Firmendaten_ : **Änderung** _Firmeneintrag lesen, anzeigen und ändern (lassen)_ : **Löschung** _Firmeneintrag löschen_ 

**ENDE-FALLS** 

**Ende** Adresserfassungsunterprogramm 

Bemerkung: hier ist ebenso der Aufruf von Unterprogrammen möglich 

R. Lutz,  KIT/IAI 

**Strukturierte Programmierung (Pseudocode, PAP, NSD)** 

13 

**SE 1** 

## **Pseudocode:  Beispiel (Lösung(2))** 

## **BEGINN** „ _Erfassen und Prüfen der Firmendaten“_ 

Erfassen der Firmendaten. 

Prüfen, ob Firma bereits vorhanden durch Vergleich des neuen Firmennamens mit den vorhandenen Firmennamen in der Firmendatei **WENN** Firma neu ist Einen Firmenkurznamen vergeben; Neuen Firmeneintrag in der Firmendatei vornehmen; **SONST** 

Firmeneintrag anzeigen und überprüfen **WENN** Änderung vorgenommen wurden Geänderten Firmeneintrag in Firmendatei eintragen; **ENDE-WENN ENDE-WENN** 

**ENDE** „ _Erfassen und Prüfen der Firmendaten“_ 

R. Lutz,  KIT/IAI 

**Strukturierte Programmierung (Pseudocode, PAP, NSD)** 

14 

**SE 1** 

## **Pseudocode:  Beispiel (Lösung(2))** 

## **BEGINN** „ _Firmeneintrag lesen, anzeigen und ändern“_ 

Firmeneintrag anhand des Firmenkurznamens aus der Firmendatei lesen u. anzeigen **WENN** Änderung vorgenommen wurden 

Geänderten Firmeneintrag in Firmendatei eintragen **ENDE-WENN** 

## **ENDE** „ _Firmeneintrag lesen, anzeigen und ändern“_ 

## **BEGINN** „ _Firmeneintrag löschen_ “ 

Prüfen, ob es Kundeneinträge in der Kundendatei gibt, die den Firmenkurznamen enthalten. 

**WENN** _Kundeneinträge_ einen _Firmenkurznamen_ enthalten 

Hinweis ausgeben, dass erst alle entsprechenden Kundeneinträge geändert werden müssen. 

Firmeneintrag anhand des Firmenkurznamens aus der Firmendatei lesen, anzeigen und nach Bestätigung löschen. 

## **ENDE-WENN** 

## **ENDE** „ _Firmeneintrag löschen“_ 

R. Lutz,  KIT/IAI 

**Strukturierte Programmierung (Pseudocode, PAP, NSD)** 

15 

**SE 1** 

## **Pseudocode:  Beispiel (Lösung)** 

**begin** Adresserfassungsunterprogramm **case** Funktion **is** 

**when** Ersterfassung =>  /* Erfassen und Prüfen der Firmendaten */ 

Erfassen der Firmendaten. 

Prüfen, ob Firma bereits vorhanden durch Vergleich des neuen Firmennamens mit den vorhandenen Firmennamen in der Firmendatei 

**if** Firma ist neu **then** 

Vergabe eines Firmenkurznamens; Neuen Firmeneintrag in der Firmendatei vornehmen; 

## **else** 

Firmeneintrag anzeigen und überprüfen **if** Änderung vorgenommen **then** 

Geänderten Firmeneintrag in Firmendatei eintragen; 

**end if** 

**end if** 

**when** Änderung =>  /* Firmeneintrag lesen, anzeigen und ändern (lassen) */ 

Firmeneintrag anhand des Firmenkurznamens aus der Firmendatei lesen u. anzeigen **if** Änderung vorgenommen **then** 

Geänderten Firmeneintrag in Firmendatei eintragen 

**end if** 

**when** Löschung =>   /* Firmeneintrag löschen */ 

Prüfen, ob es Kundeneinträge in der Kundendatei gibt, die den Firmenkurznamen enthalten. **if** _Kundeneinträge_ einen _Firmenkurznamen_ enthalten **then** 

Hinweis ausgeben, dass erst alle entspr. Kundeneinträge geändert werden müssen. Firmeneintrag anhand des Firmenkurznamens aus der Firmendatei lesen, anzeigen und nach Bestätigung löschen. 

**end if;** 

**end case** 

**end** Adresserfassungsunterprogramm 

R. Lutz,  KIT/IAI 

**Strukturierte Programmierung (Pseudocode, PAP, NSD)** 

16 

**SE 1** 

## **Pseudocode:  Beispiel (Lösung)** 

**Beginn** _Adresserfassungsunterprogramm_ **FALLS** Funktion ist 

**Ersterfassung** :   /* Erfassen und Prüfen der Firmendaten */ 

Erfassen der Firmendaten. 

Prüfen, ob Firma bereits vorhanden durch Vergleich des neuen Firmennamens mit den vorhandenen Firmennamen in der Firmendatei 

**WENN** Firma neu ist 

Einen Firmenkurznamen vergeben; Neuen Firmeneintrag in der Firmendatei vornehmen; 

## **SONST** 

Firmeneintrag anzeigen und überprüfen **WENN** Änderung vorgenommen wurden 

Geänderten Firmeneintrag in Firmendatei eintragen; 

**ENDE-WENN** 

## **ENDE-WENN** 

**Änderung** :   /* Firmeneintrag lesen, anzeigen und ändern (lassen) */ 

Firmeneintrag anhand des Firmenkurznamens aus der Firmendatei lesen u. anzeigen **WENN** Änderung vorgenommen wurden 

Geänderten Firmeneintrag in Firmendatei eintragen 

## **ENDE-WENN** 

- **Löschung** :   /* Firmeneintrag löschen */ 

Prüfen, ob es Kundeneinträge in der Kundendatei gibt, die den Firmenkurznamen enthalten. **WENN** Kundeneinträge einen Firmenkurznamen enthalten 

Hinweis ausgeben, dass erst alle entsprechenden Kundeneinträge geändert werden 

müssen. 

Firmeneintrag anhand des Firmenkurznamens aus der Firmendatei lesen, anzeigen und nach Bestätigung löschen. 

## **ENDE-WENN** 

**ENDE-FALLS** 

**Ende** _Adresserfassungsunterprogramm_ 

R. Lutz,  KIT/IAI 

**Strukturierte Programmierung (Pseudocode, PAP, NSD)** 

17 

**SE 1** 

## **Pseudocode: Beispiel zur Integration** 

## Integration eines Pseudocodes in Quellcode 

## **Beginn Ratensparen** 

Daten einlesen (Monatsbetrag, Laufzeit, Zins_pro_Jahr, Boni) unter Beruecksichtigung der Grenzwerte Zinsdauer aus Laufzeit in Monaten berechnen **solange** Monat < Zinsdauer 

Zins fuer vergangenen Monat berechnen Guthaben um berechneten Zins erhoehen **wenn** zwoelf Monate um sind aktuellen Bonus berechnen Guthaben um berechneten Bonus erhoehen aktuelle Daten ausgeben **ende-wenn** Guthaben um eingezahlten neuen Betrag erhoehen **ende-solange ende** Ratensparen 

R. Lutz,  KIT/IAI 

**Strukturierte Programmierung (Pseudocode, PAP, NSD)** 

18 

**SE 1** 

## **Pseudocode:  Beispiel zur Integration in Quellcode** 

## **/* Ratensparen */** 

**#include** <stdio.h> 

main() 

{ **double** Zins_pro_Jahr, Zins_pro_Monat, Monatsbetrag, Bonus[25]; **double** Guthaben = 0.0, Zinsguthaben_Gesamt = 0.0, Zinsguthaben_M = 0.0, Gesamtbonus = 0.0, Bonusguthaben = 0.0, Zinsdauer = 0.0; **int** i, Laufzeit, Monat, Jahr = 0; 

**/* Daten einlesen (Monatsbetrag, Laufzeit, Zins_pro_Jahr, Boni) unter Beruecksichtigung der Grenzwerte */ printf** ("******************* Ratensparen ********************"); **printf** ("\ngeben Sie folgendes ein: \n\nMonatsbetrag [DM]: "); **scanf** ("%lf", &Monatsbetrag); do{ **printf** ("\nLaufzeit [5 bis 25 Jahre]: "); **scanf** ("%d", &Laufzeit); } **while** ( Laufzeit < 5 || Laufzeit > 25 ); 

**printf** ("\nZins_pro_Jahr: "); **scanf** ("%lf", &Zins_pro_Jahr); Zins_pro_Monat = Zins_pro_Jahr / 1200; 

**for** ( i=0 ; i<Laufzeit ; i++ ){ **printf** ("\nJahres-Bonus(Jahr %d): ",i+1); **scanf** ("%lf", &Bonus[i]); Bonus[i] *= .01; 

} 

R. Lutz,  KIT/IAI 

**Strukturierte Programmierung (Pseudocode, PAP, NSD)** 

19 

**SE 1** 

## **Pseudocode:  Beispiel zur Integration in Quellcode (2)** 

**/* Zinsdauer aus Laufzeit in Monaten berechnen  */** Zinsdauer = Laufzeit * 12 ; Guthaben = Monatsbetrag; 

**for** ( Monat = 1 ; Monat <= Zinsdauer ; Monat++ ) **/* solange Monat < Zinsdauer */** { 

**/* Zins fuer vergangenen Monat berechnen */** Zinsguthaben_M = Guthaben * Zins_pro_Monat; **printf** ("\nMonat(%d):\tGH=%8.2f,\tZGH=%8.2f", Monat, Guthaben, Zinsguthaben_M); 

/* Zinsguthaben akkumuliert ... */ Zinsguthaben_Gesamt += Zinsguthaben_M; 

**/* Guthaben um berechneten Zins erhoehen */** Guthaben += Zinsguthaben_M; 

**/* wenn zwoelf Monate um sind */** 

**if** ( Monat  && ( ! ( Monat % 12 ) ) ) { 

**/* aktuellen Bonus berechnen und Guthaben um ber. Bonus erhoehen */** 

**if** ( Bonus[Jahr] > 0.0 )  Bonusguthaben = Monatsbetrag * 12 * Bonus[Jahr]; Guthaben = Guthaben + Bonusguthaben; Gesamtbonus += Bonusguthaben; Jahr++; **/*  aktuelle Daten ausgeben  */ printf** ("\nJahr(%d):\t%8.2f\t%8.2f\t%8.2f\t%8.2f\n", Jahr, Guthaben, Bonusguthaben, Zinsguthaben_Gesamt, Gesamtbonus ); 

} 

**/* Guthaben um eingezahlten neuen Betrag erhoehen */** 

Guthaben = Guthaben + Monatsbetrag; 

} 

**printf** ("\n%8.2f\t%8.2f\t%8.2f\t%8.2f\n", Guthaben, Bonusguthaben, Zinsguthaben_Gesamt, Gesamtbonus ); } **/* ende Ratensparen */** 

R. Lutz,  KIT/IAI 

**Strukturierte Programmierung (Pseudocode, PAP, NSD)** 

20 

**SE 1** 

## **Beispielaufgabe** _**Ampelschaltung**_ 

## Gegeben sei folgende vereinfachte Problembeschreibung einer Ampelschaltung: 

- Wenn die Ampel grün ist, dann darf man fahren. 

- Wenn die Ampel rot ist, dann muss man anhalten. 

- Wenn die Ampel gelb ist und der Bremsweg ausreicht, dann muss man anhalten, reicht er nicht aus, muss man fahren. 

Modellieren Sie diese Problembeschreibung mit Pseudocode 

R. Lutz,  KIT/IAI 

**Strukturierte Programmierung (Pseudocode, PAP, NSD)** 

21 

**SE 1** 

## **Lösungsvorschlag für Beispiel** _**Ampelschaltung**_ 

**BEGINN** Ampelschaltung **WENN** die Ampel grün ist: dann darf man fahren. **ODER-WENN** die Ampel rot ist: dann muss man anhalten. **ODER-WENN** die Ampel gelb ist: **WENN** der Bremsweg ausreicht: dann muss man anhalten, **ODER-WENN** der Bremsweg nicht ausreicht: dann muss man fahren. **ENDE-WENN ENDE-WENN** 

**ENDE** Ampelschaltung 

R. Lutz,  KIT/IAI 

**Strukturierte Programmierung (Pseudocode, PAP, NSD)** 

22 

**SE 1** 

## **Beispielaufgabe** _**Geldwechselautomat**_ 

- Ein alter, vereinfachter Geldwechselautomat gibt nach der Eingabe eines Geldbetrags Geldstücke aus nach dem Prinzip der _minimalen Anzahl bei maximaler_ . 

- _Diversifizierung_ 

- Die maximal wechselbare Geldmenge liegt bei 10 DM 

- die minimal wechselbare Geldmenge liegt bei 2 DM 

- ansonsten wird eine Meldung angezeigt. 

- Dabei können Münzen im Wert von jeweils 1 bis 5 DM ausgegeben werden. 

- Es wird vorausgesetzt, dass sich genügend Wechselgeld im Automaten befindet. 

R. Lutz,  KIT/IAI 

**Strukturierte Programmierung (Pseudocode, PAP, NSD)** 

23 

**SE 1** 

## **Lösungsvorschlag für Beispiel** _**Geldwechselautomat**_ 

**BEGINN** Geldwechselautomat **WENN** die eingeworfene Geldmenge 10 DM ist: 5 DM ausgeben **FÜHRE** „ _5 DM wechseln und ausgeben_ “ **aus ODER-WENN** die Geldmenge 5 DM ist: **FÜHRE** „ _5 DM wechseln und ausgeben_ “ **aus ODER-WENN** die Geldmenge 2 DM ist: 1 DM ausgeben 1 DM ausgeben **ENDE-WENN** 

**ENDE** Geldwechselautomat 

**BEGINN** „ _5 DM wechseln und ausgeben_ 2 DM ausgeben 2 DM ausgeben 1 DM ausgeben **ENDE** „ _5 DM wechseln und ausgeben_ “ 

R. Lutz,  KIT/IAI 

**Strukturierte Programmierung (Pseudocode, PAP, NSD)** 

24 

**SE 1** 

## Aufgaben zu Pseudocode 

## • Erweiterte Ampelschaltung 

- Fußballtipprunde 

R. Lutz,  KIT/IAI 

**Strukturierte Programmierung (Pseudocode, PAP, NSD)** 

25 

**SE 1** 

## **Programmablaufplan (PAP)** 

R. Lutz,  KIT/IAI 

**Strukturierte Programmierung (Pseudocode, PAP, NSD)** 

26 

**SE 1** 

## **Programmablaufplan** 

- betont das dynamische Ablaufverhalten eines Programms (SW) 

- besteht aus lediglich 6 Symbolen, die durch Linien bzw. Pfeile (Flüsse) miteinander verbunden werden 

Start / Ende / Fortsetzung 

**Tu Was!** 

Anweisung 

Abfrage 

**Suchen( Kriterien )** TT 

Aufruf (Unterprogramm, Algorithmus) 

Schleifenanfang Schleifenende 

R. Lutz,  KIT/IAI 

**Strukturierte Programmierung (Pseudocode, PAP, NSD)** 

27 

**SE 1** 

## **Programmablaufplan (Kontrollstrukturen)** 

## **Sequenz:** 

## **Selektion:** 

**==> picture [627 x 368] intentionally omitted <==**

**----- Start of picture text -----**<br>
Bed.<br>J N<br>Anweisung 1 Bedingung Wert 1<br>Anweisung 1<br>Anweisung 2 Wert 2<br>Anweisung 2<br>Anweisung 1 Anweisung 2<br>Anweisung 3 else Anweisung 3<br>Iteration, Schleife: Schleife 1<br>(Bedingung)<br>N Anweisung 1<br>Bed. Anweisung<br>J<br>J Anweisung N<br>Bed.<br>Anweisung<br>N<br>Ende<br>Schleife 1<br>/ =<br>**----- End of picture text -----**<br>


## **Iteration, Schleife:** 

R. Lutz,  KIT/IAI 

**Strukturierte Programmierung (Pseudocode, PAP, NSD)** 

28 

**SE 1** 

## **PAP (Grundregeln zum Zeichnen der Diagramme )** 

- **wesentliche** Flussrichtung von (links) oben nach (rechts) unten 

- Anzahl der Anweisungen (Rechtecke) möglichst minimieren 

• **Anweisungen (Rechtecke):** Eingang: **oben** / (links bei CASE-Konstrukt) Ausgang: **unten** / (rechts bei CASE-Konstrukt) 

• **Abfragen (Raute):** Eingang: immer oben Ausgang: links / rechts / unten 

• Linien: möglichst kreuzungsfrei 

R. Lutz,  KIT/IAI 

**Strukturierte Programmierung (Pseudocode, PAP, NSD)** 

29 

**SE 1** 

## **PAP (Grundregeln (2) zum Zeichnen der Diagramme )** 

## **Aufteilung bei komplexen Anwendungen** 

- Modularisieren (fast immer möglich), d.h. Unterprogrammaufrufe verwenden, diese möglichst auf ein separates Blatt Papier zeichnen 

- Aufteilung mit Fortsetzung (ausnahmsweise): 

**==> picture [395 x 290] intentionally omitted <==**

**----- Start of picture text -----**<br>
S 1 2<br>O a n m e<br>: a |<br>Ja<br>Nein<br>Ja<br>O Nein o e ! °<br>Nein<br>Ja<br>Nein<br>= | |<br>Ja<br>1 2 E<br>oa o e<br>**----- End of picture text -----**<br>


R. Lutz,  KIT/IAI 

**Strukturierte Programmierung (Pseudocode, PAP, NSD)** 

30 

**SE 1** 

## **PAP (Beispiel Ampelschaltung)** 

**==> picture [336 x 275] intentionally omitted <==**

**----- Start of picture text -----**<br>
S<br>rot?<br>ja nein<br>gelb?<br>ja nein<br>BW reicht?<br>ja nein<br>anhalten fahren<br>**----- End of picture text -----**<br>


R. Lutz,  KIT/IAI 

**Strukturierte Programmierung (Pseudocode, PAP, NSD)** 

31 

**SE 1** 

## **PAP (Beispiel Geldwechselautomat)** 

**==> picture [358 x 382] intentionally omitted <==**

**----- Start of picture text -----**<br>
S<br>Eingabe von<br>Geld<br>N J<br>DM 10,- ?<br>Ausgabe<br>N J DM 5,-<br>DM 5,- ?<br>Ausgabe<br>DM 2,-<br>N J<br>DM 2,- ?<br>Ausgabe<br>DM 2,-<br>Ausgabe<br>Ausgabe DM 1,-<br>Fehlermeldung<br>Ausgabe<br>DM 1,-<br>**----- End of picture text -----**<br>


R. Lutz,  KIT/IAI 

**Strukturierte Programmierung (Pseudocode, PAP, NSD)** 

32 

**SE 1** 

## **Aufgaben zu PAP** 

## • Erweiterte Ampelschaltung 

- Würfelspiel 

R. Lutz,  KIT/IAI 

**Strukturierte Programmierung (Pseudocode, PAP, NSD)** 

33 

**SE 1** 

## **PAP (Beispiellösung Würfelspiel)** 

**==> picture [504 x 449] intentionally omitted <==**

**----- Start of picture text -----**<br>
Start Start<br>würfeln würfeln<br>Ja Nein<br>5er Pasch? 100 Punkte 3er Pasch?<br>Nein Ja<br>Ja Ja<br>4er Pasch? 50 Punkte Full House? 60 Punkte<br>Nein<br>Nein<br>Nein Nein<br>3er Pasch? 4er Pasch? 20 Punkte<br>Ja Ja<br>Nein Nein<br>Full House? 20 Punkte 5er Pasch? 50 Punkte<br>Ja Ja<br>60 Punkte 100 Punkte<br>bereits bereits<br>Ja Ja<br>gewürfelt u.  gewürfelt u.<br>eingetragen? eingetragen?<br>Punkte zählen Nein Punkte zählen Nein<br>eintragen eintragen<br>Nein alle 4  Nein alle 4<br>Hauptpositionen Hauptpositionen<br>eingetragen? eingetragen?<br>Nächster  Nächster<br>Spieler Ja Spieler Ja<br>Punkte zusammenzählen  Punkte zusammenzählen<br>und Spiel beenden und Spiel beenden<br>Ende Ende<br>**----- End of picture text -----**<br>


R. Lutz,  KIT/IAI 

**Strukturierte Programmierung (Pseudocode, PAP, NSD)** 

34 

**SE 1** 

**Struktogramm (Nassi-Shneiderman-Diagramm)** 

R. Lutz,  KIT/IAI 

**Strukturierte Programmierung (Pseudocode, PAP, NSD)** 

35 

**SE 1** 

## **Struktogramme** 

- betonen die Struktur eines Programms (SW) 

- lehnen sich sehr stark an die strukturierte Programmierung an. Sie werden auch Strukturdiagramme genannt 

- sind normiert (DIN 66261) 

- bestehen aus einzelnen Rechteck-Elementen unterschiedlicher Bedeutung, die zu einem Diagramm zusammengesetzt werden 

   - diese Rechtecke können intern weiter unterteilt werden 

   - Sie werden ausschließlich von oben „betreten“ und unten verlassen 

R. Lutz,  KIT/IAI 

**Strukturierte Programmierung (Pseudocode, PAP, NSD)** 

36 

**SE 1** 

## **Struktogramm (Anweisungen)** 

## **Tu was!** 

Anweisung 

leere Anweisung (als Platzhalter) 

**Tu was! Tu noch was!** ~~—~~ **Tu was! Tu noch was! Suchen( Kriterien )** ~~|~~ 

Folge von Anweisungen 

(Prozedur-)Blockbildung 

Aufruf eines Unterprogramms 

R. Lutz,  KIT/IAI 

**Strukturierte Programmierung (Pseudocode, PAP, NSD)** 

37 

**SE 1** 

## **Auswahlkonstrukte Struktogramm ( )** 

**==> picture [239 x 390] intentionally omitted <==**

**----- Start of picture text -----**<br>
Bedingung<br>J N<br>Variable =<br>Wert 1 Wert 2<br>W3<br>Tr<br>Variable =<br>W1 W2 ELSE<br>nae<br>**----- End of picture text -----**<br>


## Auswahl 

## Mehrfachauswahl 

## Mehrfachauswahl mit ELSE 

R. Lutz,  KIT/IAI 

**Strukturierte Programmierung (Pseudocode, PAP, NSD)** 

38 

**SE 1** 

## **Schleifen und BREAK Struktogramm ( )** 

**N** 

Abbruchanweisung für das Konstrukt _**N**_ 

Bedingung Anweisung(sblock) Anweisung(sblock) Bedingung 

kopfgesteuerte Schleife 

fußgesteuerte Schleife 

R. Lutz,  KIT/IAI 

**Strukturierte Programmierung (Pseudocode, PAP, NSD)** 

39 

**SE 1** 

## **Struktogramm (Schleifen (2))** 

**==> picture [279 x 372] intentionally omitted <==**

**----- Start of picture text -----**<br>
For  Zähler =  AW  to  EW<br>Anweisung(sblock)<br>—<br>Abbruch?<br>J N<br>Schleife<br><n<br>**----- End of picture text -----**<br>


Wiederholung mit fester Wiederholungszahl (keine DIN-Norm!) 

Wiederholung ohne Bedingungsprüfung 

- sog. FOREVER-Schleife 

- • Spezialfall der kopfgesteuerten Schleife 

R. Lutz,  KIT/IAI 

**Strukturierte Programmierung (Pseudocode, PAP, NSD)** 

40 

**SE 1** 

## **Struktogramm (Konstrukte, Gesamtübersicht)** 

**Tu was! Tu was! Tu was! Suchen( Kriterien ) Tu noch was! Tu noch was! (** _**leer**_ **)** ~~= Se~~ r Bedingung Variable = Variable = J N **N** Wert 1 Wert 2 W1 W2 ELSE W3 ~~SSSI EZ~~ **For** Zähler = **AW** to **EW** Abbruch? Bedingung J N Anweisung(sblock) Schleife Anweisung(sblock) Anweisung(sblock) 

Anweisung(sblock) Bedingung 

R. Lutz,  KIT/IAI 

**Strukturierte Programmierung (Pseudocode, PAP, NSD)** 

41 

**SE 1** 

## **Struktogramm (Vor- und Nachteile)** 

## **Vorteile:** 

- Zwang zur Strukturierung 

   - übersichtliche und damit verständliche Dokumentation 

   - Erleichterung der späteren Wartung 

   - lehnen sich sehr stark an die strukturierte Programmierung an 

## **Nachteile:** 

- Zur Strukturierung des Problems ist eine detaillierte Problemkenntnis nötig, was in der Analysephase selten der Fall ist 

Struktogramme sind eigentlich erst möglich, wenn das Problem bereits strukturiert ist 

- schlechte Änderbarkeit der Diagramme aufgrund ihrer graphischen Beschaffenheit. Einsatz eines CASE-Tools. 

R. Lutz,  KIT/IAI 

**Strukturierte Programmierung (Pseudocode, PAP, NSD)** 

42 

**SE 1** 

**==> picture [702 x 552] intentionally omitted <==**

**----- Start of picture text -----**<br>
Struktogramm (Beispiel)<br>Unterprogramm zur Verwaltung von Firmenadressen<br>Ersterfassung<br>Funktion<br>Erfassen der Firmendaten;<br>Änderung<br>Prüfen, ob Firma bereits vorhanden<br>durch Vergleich des neuen  Firmeneintrag anhand des<br>ee Firmennamens mit den  Firmenkurznamens aus der  Löschung<br>vorhandenen Firmennamen  Firmendatei lesen und<br>in der Firmendatei anzeigen Prüfen, ob es<br>Kundeneinträge in der<br>Kundendatei gibt, die den<br>Firmenkurznamen enthalten<br>Firma = neu ?<br>| —— =<br>Änderungen vorge-<br>ja nein nommen? Kundeneinträge enthalten<br>ja nein Firmenkurzname?<br>Vergabe eines  Firmeneintrag anzeigen<br>Firmen- und überprüfen ja nein<br>S kurznamens; Geänderten  e<br>ee eee<br>Firmeneintrag<br>Neuen  Änderungen vorge- in Firmendatei  Hinweis,  Firmeneintrag<br>nommen? daß erst alle  anhand des<br>Firmeneintrag eintragen entsprechenden  Firmenkurznamens<br>in der  ja nein<br>Kundeneinträge  aus der<br>Firmendatei<br>geändert werden  Firmendatei lesen,<br>vornehmen Geänderten  müssen anzeigen und nach<br>Firmeneintrag  Bestätigung<br>in Firmendatei  löschen<br>eintragen<br>The |<br>R. Lutz,  KIT/IAI Strukturierte Programmierung (Pseudocode, PAP, NSD)<br>**----- End of picture text -----**<br>


43 

**SE 1** 

## **Struktogramm (Lösungsvorschläge Ampelschaltung)** 

**==> picture [347 x 357] intentionally omitted <==**

**----- Start of picture text -----**<br>
Ampelschaltung<br>Ampel rot?<br>J N<br>Ampel grün?<br>N J<br>Bremsweg<br>reicht?<br>J N<br>halten fahren<br>**----- End of picture text -----**<br>


**==> picture [327 x 245] intentionally omitted <==**

**----- Start of picture text -----**<br>
Ampelschaltung<br>Ampel =<br>grün gelb<br>rot<br>Bremsweg<br>reicht?<br>N J<br>fahren halten<br>**----- End of picture text -----**<br>


R. Lutz,  KIT/IAI 

**Strukturierte Programmierung (Pseudocode, PAP, NSD)** 

44 

**SE 1** 

## **Struktogramm (Lösungsvorschläge Geldwechselautomat)** 

**==> picture [365 x 385] intentionally omitted <==**

**----- Start of picture text -----**<br>
Geldwechselautomat<br>Betrag = 10,- ?<br>J N<br>Betrag = 5,-?<br>Ausgabe<br>5,-<br>J N<br>Betrag = 2,-?<br>Ausgabe 2,-<br>Ausgabe 2,- J N<br>Ausgabe<br>Fehler-<br>1,-<br>Ausgabe<br>Ausgabe 1,-<br>**----- End of picture text -----**<br>


**==> picture [359 x 320] intentionally omitted <==**

**----- Start of picture text -----**<br>
Geldwechselautomat<br>Betrag =<br>10,- 5,- 2,- ELSE<br>Ausgabe<br>5,-<br>Ausgabe 2,-<br>Ausgabe<br>1,- Fehler-<br>Ausgabe 2,-<br>Ausgabe<br>Ausgabe 1,-<br>**----- End of picture text -----**<br>


R. Lutz,  KIT/IAI 

**Strukturierte Programmierung (Pseudocode, PAP, NSD)** 

45 

