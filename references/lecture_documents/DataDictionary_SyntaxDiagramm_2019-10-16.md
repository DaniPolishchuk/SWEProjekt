**SWE 1** 

## **Modellierung von Datenstrukturen und Datei-Inhalten** 

## **Data Dictionary und Syntaxdiagramm** 

Stand 16.10.2019 

R. Lutz,  KIT/IAI 

**Data Dictionary und Syntaxdiagramm** 

1 

**SWE 1** 

## **Data Dictionary** 

- Verzeichnis, das Informationen über Daten bzw. Dateiinhalte enthält: 

   - Struktur, 

   - Eigenschaften 

   - Verwendung 

- Einsatz: 

- zur Konsistenzüberwachung eines Datenbestandes 

- Übersichten über die Datenstrukturen 

- Überprüfung auf Redundanz- und Widerspruchsfreiheit 

R. Lutz,  KIT/IAI 

**Data Dictionary und Syntaxdiagramm** 

2 

**SWE 1** 

## **Data Dictionary** 

- Zeitpunkte: 

   - Definitionsphase und Analyse 

      - entsteht meist in der Definitionsphase 

      - Analyse einer **vorhandenen** Datei bzw. Struktur 

      - wird in der Entwurfs- und Implementierungsphase weiter verwendet, ergänzt und verfeinert 

   - Entwurf 

      - Definition einer **noch nicht vorhandenen** Datei bzw. Struktur 

R. Lutz,  KIT/IAI 

**Data Dictionary und Syntaxdiagramm** 

3 

**SWE 1** 

**Data Dictionary Symbole Symbol Beschreibung Beispiel** ~~ee~~ **„=“** „ist äquivalent zu“ A = B Sequenz, Verknüpfungen von **„+“** A = B + C Datenflüssen bzw. Datenelementen ~~a~~ **[  |  ]** Alternativen, Auswahl (entweder ... oder) A = [ B | C ] ~~a~~ **{  }** Wiederholungen A = { B } ~~ee eee~~ **M{  }N** Wiederholung von M bis N A = 1{ B }10 ~~a ee~~ **( )** optionale Eingaben A = B + (C) ~~ee eee~~ **„** _**text**_ **“** fest vorgegebener Text A = "abc" ~~a ee~~ **/* … */** Kommentar A = X + Y  /*Kommentar*/ ~~ee~~ 

R. Lutz,  KIT/IAI 

**Data Dictionary und Syntaxdiagramm** 

4 

**SWE 1** 

## **Data Dictionary** 

## • Wie wird am besten modelliert? 

- Top-Down vorgehen! 

• **Modularisierung** zur Wiederverwendung, d.h. kleinere oder größere Einheiten bilden und diese dann zusammensetzen 

R. Lutz,  KIT/IAI 

**Data Dictionary und Syntaxdiagramm** 

5 

T— **SWE 1** a **Data Dictionary** 

## **Beispiel:  Kundendaten** 

|**Symbol**<br>**Beschreibung**<br>**Beispiel**<br>**„=“**<br>„ist äquivalent zu“<br>A = B<br>~~eee~~|**Symbol**<br>**Beschreibung**<br>**Beispiel**<br>**„=“**<br>„ist äquivalent zu“<br>A = B<br>~~eee~~|**Symbol**<br>**Beschreibung**<br>**Beispiel**<br>**„=“**<br>„ist äquivalent zu“<br>A = B<br>~~eee~~|**Symbol**<br>**Beschreibung**<br>**Beispiel**<br>**„=“**<br>„ist äquivalent zu“<br>A = B<br>~~eee~~|**Symbol**<br>**Beschreibung**<br>**Beispiel**<br>**„=“**<br>„ist äquivalent zu“<br>A = B<br>~~eee~~|**Symbol**<br>**Beschreibung**<br>**Beispiel**<br>**„=“**<br>„ist äquivalent zu“<br>A = B<br>~~eee~~|**Symbol**<br>**Beschreibung**<br>**Beispiel**<br>**„=“**<br>„ist äquivalent zu“<br>A = B<br>~~eee~~|**Symbol**<br>**Beschreibung**<br>**Beispiel**<br>**„=“**<br>„ist äquivalent zu“<br>A = B<br>~~eee~~||||**Symbol**<br>**M{  }N**<br>~~ee ~~||**Beschreibung**<br>Wiederholung von M bis N<br> ~~ee~~|**Beispiel**<br>A = 1{ B }10<br>~~eee~~|**Beispiel**<br>A = 1{ B }10<br>~~eee~~|**Beispiel**<br>A = 1{ B }10<br>~~eee~~|
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
||**„+“**||Sequenz, Verknüpfungen||A = B + C||||||**( )**||optionale Eingaben||A = B + (C)||
||**[  |  ]**||Alternativen, Auswahl||A = [ B | C ]||||||**„****_text_“**||fest vorgegebener Text||A = "abc"||
||**{  }**||Wiederholungen||A = { B }||||||**/* … */**||Kommentar||A = X + Y  /*Kom.*/||



Kundendatei   =  { Kundeneintrag } Kundeneintrag =  Kunden-Nr. + Name + Adresse + (Geburtsdatum) + (Funktion) + Umsatz Name =  Anrede + (Titel) + Vorname + Nachname Adresse =  [ Straße + Haus-Nr. | Postfach ] + ( Länderkennzeichen) + PLZ + Ort + (Telefon) + (Fax) + (e-Mail) Geburtsdatum =  . . . 

R. Lutz,  KIT/IAI 

**Data Dictionary und Syntaxdiagramm** 

6 

**SWE 1** 

## **Aufgabe 1 zu Data Dictionary** 

Durch ein Softwareprodukt sollen viele Grafikelemente importiert und exportiert werden. Dabei soll eine lesbare Textdatei erstellt bzw. gelesen werden. Für die Grafikelemente Punkt, Linie und Kreis sieht diese Datei folgendermaßen aus: 

**/START_DESC; /== Dies ist ein Kommentar ==!/ #1 = PUNKT( 1.0, 1.0 ); #2 = PUNKT( 2.0, 2.0 ); #3 = LINIE( #1, #2 ); #4 = PUNKT( 2.0, 2.0 ); #5 = KREIS( #1, #2, #4 ); /END_DESC;** 

- Die mit „#“ kombinierten Zahlen stellen Referenzen auf Elemente dar. 

- Die Datei beginnt mit einer Startkennung und endet mit einer Ende-Kennung. 

- Leerzeichen können beliebig zwischen den Elementen in der Datei stehen, sie müssen bei der Definition nicht berücksichtigt werden 

- Der Datentyp FLOAT muss nicht näher beschrieben werden 

- Die Geometrieelemente können mit Namen definiert werden ( z.B.: “PUNKT“ ) 

R. Lutz,  KIT/IAI 

**Data Dictionary und Syntaxdiagramm** 

7 

## **SWE 1** 

## **Lösungsvorschlag (Grafikelement-Datei als DD)** 

/* Data Dictionary zu Grafikelemente-Datei */ Grafikelemente-Datei = START + ( { [ Grafikelement | Kommentar ] } ) + ENDE START = "/START_DESC;„ ENDE = "/END_DESC;" 

Kommentar = "/==" + Text + "==!/" 

Grafikelement = Adresse + "=" + Element-Definition + Zeilenende Element-Definition = [ Punkt | Linie | Kreis ] 

Punkt = "PUNKT" + "(" + FLOAT + "," + FLOAT + ")" Linie = "LINIE" + "(" + Adresse + "," + Adresse + ")" Kreis = "KREIS" + "(" + Adresse + "," + Adresse + "," + Adresse + ")" Adresse = "#" + Nummer 

Nummer = { Ziffer } 

Text = ( { [ Buchstabe | Ziffer | Sonderzeichen ] } ) 

Buchstabe = [ "a" | "b" | ... | "Y" | "Z" ] 

Ziffer = [ 0 | 1 | ... | 8 | 9 ] Sonderzeichen = [ "_" | " " | "!" | ... ] Zeilenende = ";" 

R. Lutz,  KIT/IAI 

**Data Dictionary und Syntaxdiagramm** 

8 

**SWE 1** 

## **Aufgabe 2 zu Data Dictionary** 

Beschreiben Sie die Struktur folgender gegebenen XML-Datei mit Hilfe von **Data Dictionary** oder **Syntaxdiagramm.** 

<?xml version="1.0" encoding="UTF-8" standalone="yes"?> 

<verzeichnis> 

<titel>Wikipedia Staedteverzeichnis</titel> 

<eintrag> 

<stichwort>Genf  Att1=XXX  Att2=YYY</stichwort> <eintragstext>Genf ist der Sitz von ...</eintragstext> 

</eintrag> 

<!-- Kommentar-Text --> 

<eintrag> 

<stichwort>Bonn</stichwort> 

<eintragstext>Bonn ist eine Stadt, die ...</eintragstext> 

</eintrag> 

</verzeichnis> 

R. Lutz,  KIT/IAI 

**Data Dictionary und Syntaxdiagramm** 

9 

**SWE 1** 

## **Lösungsvorschlag (XML-Datei als Data Dictionary)** 

/* Data Dictionary einer XML-Datei (vereinfacht) */ 

/* XML-Kommentare können mehrfach hintereinander auftreten => ({ XML_Kommentar }) */ XML_Datei = XML_Deklaration + XML_Root_Element 

**‘** XML_Deklaration = _"<?xml version="1.0" encoding="UTF-8" standalone="yes"?>_ **‘** XML_Kommentar = "<!--" + Text + "-->„ 

XML-Element_Body = ( { XML_Element | XML_Kommentar } ) 

= XML_Root_Element XML_Element /* Die Root-Hierarchie kann auch weggelassen werden */ XML_Element = Element_Start + XML_Element_Body + Element_Ende 

Element_Start = "<" + Element_Name + ( AttributListe ) + ">" Element_Ende = "</" + Element_Name + ">„ 

AttributListe = { Element_Attribut + " " }    /* Elementattribute durch Leerzeichen getrennt */ Element_Attribut = Name + ( Attributwert ) 

Attributwert = „ **‘** “ + Name + „ **‘** “ /* bzw. { [ Ziffer | Buchstabe ] } ; auch doppelte Anf.-zeichen */ 

Element_Name = Buchstabe + ( Name ) Name = { [ Ziffer | Buchstabe ] } 

Text = ( { [ Buchstabe | Ziffer | Sonderzeichen ] } ) Buchstabe = [ "a" | "b" | ... | "Y" | "Z" ] Ziffer = [ 0 | 1 | ... | 8 | 9 ] Sonderzeichen = [ "_" | " " | "!" | ... ] 

R. Lutz,  KIT/IAI 

**Data Dictionary und Syntaxdiagramm** 

11 

**SWE 1** 

## **Syntaxdiagramm** 

## • Grafische Darstellung von Datenstrukturen 

- Symbole: 

Element (wird noch detailliert) 

Element (wird nicht weiter spezifiziert) 

Verbindung („Fluss“) 

- Grundsätzliche Bedingungen: 

**==> picture [624 x 36] intentionally omitted <==**

**----- Start of picture text -----**<br>
Genau 1  Ein oder viele  Ein oder kein Keine oder viele<br>Element Elemente Element Elemente<br>**----- End of picture text -----**<br>


R. Lutz,  KIT/IAI 

**Data Dictionary und Syntaxdiagramm** 

12 

**==> picture [66 x 24] intentionally omitted <==**

**----- Start of picture text -----**<br>
SWE<br>1<br>**----- End of picture text -----**<br>


**==> picture [654 x 493] intentionally omitted <==**

**----- Start of picture text -----**<br>
Syntaxdiagramm<br>Beispiel:  Kundendaten<br>Kundendatei<br>Kundeneintrag<br>Kundeneintrag<br>[|<br>Kunden-Nr. Name Adresse Geb.-Datum Funktion<br>ig ED 5 en, | GD GD<br>Umsatz<br>>eee<br>Name<br>[|<br>Anrede Titel Vorname Nachname<br>S Oo Pp OrP><br>R. Lutz,  KIT/IAI<br>**----- End of picture text -----**<br>


**Data Dictionary und Syntaxdiagramm** 

13 

**SWE 1** 

## **Syntaxdiagramm** 

## **Beispiel:  Kundendaten (Forts.)** 

**==> picture [688 x 323] intentionally omitted <==**

**----- Start of picture text -----**<br>
Kundendatei<br>Kundeneintrag<br>Kundeneintrag<br>Kunden-Nr. Name Adresse Geb.-Datum Ga, Funktion ..qae, Umsatz<br>e n<br>——<br>Name<br>Anrede Titel Vorname Nachname<br>Adresse<br>Straße Haus-Nr. Länder-Kennz. PLZ Ort<br>Postfach<br>Telefon Fax E-Mail<br>**----- End of picture text -----**<br>


**==> picture [214 x 12] intentionally omitted <==**

**----- Start of picture text -----**<br>
Data Dictionary und Syntaxdiagramm<br>**----- End of picture text -----**<br>


R. Lutz,  KIT/IAI 

14 

**SWE 1** 

## **Aufgabe zu Syntaxdiagramm und Data Dictionary** 

In einem Eingabefenster einer grafischen Benutzeroberfläche sollen Telefonnummern in unterschiedlichen Formaten eingegeben werden können. 

Diese Eingaben sind auf syntaktische Richtigkeit zu überprüfen. Hierfür ist eine Beschreibung der Syntax aller zulässigen Nummernarten erforderlich. Hinweis: Das Zeichen "#" stellt ein Leerzeichen dar 

**07247#825743 ++49#7247#825743 ++49/7247/825743 0721/934567 ++44/34567334556** 

R. Lutz,  KIT/IAI 

**Data Dictionary und Syntaxdiagramm** 

15 

**SWE 1** 

## Duale Hochschule Baden-Warttemberg **Aktuelles Beispiel zu Syntax-Diagramm und Data Dictionary** 

## • SQL-Dokumentation zu Oracle 10g: 

http://docs.oracle.com/cd/B19306_01/server.102/b14200/statements_7002.htm 

R. Lutz,  KIT/IAI 

**Data Dictionary und Syntaxdiagramm** 

16 

