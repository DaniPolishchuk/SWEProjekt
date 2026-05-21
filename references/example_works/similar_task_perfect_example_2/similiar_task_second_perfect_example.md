#### Karlsruhe

# Programmentwurf für eine

# Immobilienverwaltung

## 3./4. Semester(2016/2017)

```
imRahmenderPrüfungzum
BachelorofScience(B.Sc.)
```
## desStudiengangesAngewandteInformatik

```
anderDualenHo chschuleBaden-Württemb ergKarlsruhe
```
```
Abgab edatum: 27.August 2017
Vorlesung: Software-Engineering
Kurs: TINF15B
Matrikelnummern: 5236327, 9827804
Dozent: Dr.-Ing.RichardLutz
InstitutfürAngewandteInformatik
KarlsruherInstitutfürTechnologie
```

## Inhaltsverzeichnis



- 1 Aufgab enstellung
   - 1.1 Einleitung
   - 1.2 Lastenheft.
      - 1.2.1 Zielsetzung.
      - 1.2.2 Anwendungsb ereiche
      - 1.2.3 Zielgrupp en,BenutzerrollenundVerantwortlichkeiten.
      - 1.2.4 ZusammenspielmitanderenSystemen.
      - 1.2.5 Pro duktfunktionen
      - 1.2.6 Pro duktdaten
      - 1.2.7 Pro duktleistungen.
      - 1.2.8 Qualitätsanforderung
   - 1.3 Aufgab en
      - 1.3.1 Analyse
      - 1.3.2 SequenzdiagrammundAktivitätsdiagramm(Analyseo derEntwurf )
      - 1.3.3 Entwurf.
   - 1.4 VereinfachungenfürdenProgrammentwurf
- 2 Analyse
   - 2.1 Einleitung
   - 2.2 Lastenheft.
      - 2.2.1 Zielsetzung.
      - 2.2.2 Anwendungsb ereiche
      - 2.2.3 Zielgrupp en,BenutzerrollenundVerantwortlichkeiten.
      - 2.2.4 ZusammenspielmitanderenSystemen.
      - 2.2.5 Pro duktfunktionen
      - 2.2.6 Pro duktdaten
      - 2.2.7 Pro duktleistungen.
      - 2.2.8 Qualitätsanforderung
- 3 Analyseklassendiagramm
   - 3.1 AnalysederverschiedenenObjekte
   - 3.2 VerwendeteAnalysemuster
      - 3.2.1 Liste.
      - 3.2.2 Baugrupp e
      - 3.2.3 Ko ordinator
      - 3.2.4 Rolle.
      - 3.2.5 Grupp e
- 4 Use-Case-Diagramm
   - 4.1 RollenerläuterungderAnwendung
      - 4.1.1 Mitarb eiter(Pseudorolle).
      - 4.1.2 Sachb earb eiter.
      - 4.1.3 Grupp en-bzw.Bereichsleiter
      - 4.1.4 Verwaltungsangestellter
      - 4.1.5 Administrator
      - 4.1.6 Interessent
      - 4.1.7 Notar
      - 4.1.8 ExternerAnsprechpartner
   - 4.2 Use-Case-DiagrammKompaktansicht.
   - 4.3 Use-Case-Diagramm:Datenb earb eiten.
   - 4.4 Use-Case-Diagramm:Finanzierungsangeb oterstellen.
   - 4.5 Use-Case-Diagramm:Vermittlungabwickeln
- 5 Sequenzdiagramm
   - 5.1 Szenariob etrachtung:Verkaufsvermittlung
   - 5.2 Diagrammb etrachtung:Verkaufsvermittlung
   - 5.3 Pseudo co de:Verkaufsvermittlung
- 6 Aktivitätsdiagramm
   - 6.1 Szenariob etrachtung:Mietvermittlungdurchführen.
   - 6.2 Diagrammb etrachtung:Mietvermittlungdurchführen.
   - 6.3 Pseudo co de:Mietvermittlungdurchführen
- 7 Entwurfsklassendiagramm
   - 7.1 Pakete
      - 7.1.1 DataTyp es
      - 7.1.2 Mo del.
      - 7.1.3 Mitarb eiter.
      - 7.1.4 Immobilien
      - 7.1.5 Personen
      - 7.1.6 Vermittlung
      - 7.1.7 Immobiliennanzierung.
      - 7.1.8 Dokumente.
      - 7.1.9 GUI
      - 7.1.10 Event
   - 7.2 VerwendeteEntwurfsmuster
      - 7.2.1 Objektadapter
      - 7.2.2 Fabrikmetho de.
      - 7.2.3 Singleton.
      - 7.2.4 Komp ositum
      - 7.2.5 Beobachter.
- 8 GUI-Entwurf
   - 8.1 Hauptüb ersichteinesSachb earb eiters.
   - 8.2 DetailansichteinerImmobilie.
   - 8.3 KommunikationsschemaderGUI.
- 9 Besonderheiten
   - 9.1 VarianzundKundenorientierung
   - 9.2 Backups
   - 9.3 Üb ersichtlichkeit
   - 9.4 GlobalerServer
   - 9.5 Datenverfügbarkeit.
   - 9.6 MöglichkeitderexternenSchnittstelle.


Immobilienverwaltung Aufgabenstellung

## 1 Aufgab enstellung

### 1.1 Einleitung

Die ImmoManage GmbH vermittelt seit über 20 Jahren den Kauf und Verkauf sowie die Ver-
mietung von Immobilien im süddeutschen Raum. Für die Verwaltung der Immobilien und der
Vermittlungsabwicklungen benötigen wir eine neue Software, die es uns ermöglicht, den stei-
genden Bedarf an Vermittlungen und Beratungen noch effizienter durchzuführen. Das bisher
eingesetzte Softwarewerkzeug ist in die Jahre gekommen und soll durch neuere Technologien
ersetzt werden.

### 1.2 Lastenheft.

#### 1.2.1 Zielsetzung.

Ziel des Entwicklungsauftrags soll eine Software für die Verwaltung von Immobilien sein. Da-
zu gehören die Abwicklung von Vermittlungen (Vermietungen und Verkäufe) sowie die Be-
rechnung von Immobilienfinanzierungen. Dabei soll auf eine zentrale Datenbasis zugegriffen
werden können (Server), damit sämtliche Daten von mehreren PCs und Laptops aus verwaltet
werden können.

Ein Import und Export ausgewählter Daten über lesbare Dateien muss zur besseren Wieder-
verwendbarkeit, für Backups und zum Datenaustausch möglich sein.

Eine intuitive, leicht bedienbare Benutzeroberfläche setzen wir als selbstverständlich voraus.
Es sollen keine besonderen Computerkenntnisse zur Bedienung der Software erforderlich sein.
Eine Schnittstelle für den eingeschränkten Internet-Zugriff auf Immobilien soll Teil der Softwa-
re sein.

#### 1.2.2 Anwendungsb ereiche

Die Software soll ausschließlich für die Verwaltung von Immobilien und Vermittlungsvorgän-
gen eingesetzt werden. Sie soll ausschließlich unternehmensweit im Tagesgeschäft eingesetzt
werden.


Immobilienverwaltung Lastenheft

#### 1.2.3 Zielgrupp en,BenutzerrollenundVerantwortlichkeiten.

Es gibt vier Zielgruppen:

- Sachbearbeiter(in) (Immobilienkaufmann bzw. Immobilienkauffrau) zur Pflege der Da-
    ten zu Immobilien und den Vermiet- und Verkaufsvorgängen. Dabei können Immobilien
    und Vorgänge angelegt, geändert und gesucht werden. Das Löschen von Immobilien und
    Vorgängen soll nur für die eigenen Daten möglich sein.
- Gruppen- bzw. Bereichsleiter(innen) haben darüber hinaus Vollzugriff auf alle Daten der
    Gruppenmitglieder.
- Verwaltungsangestellte(r) zur Pflege der Mitarbeiterdaten.
- Administrator hat Vollzugriff auf sämtliche Daten, vor allem für deren Import und Export
    sowie deren Backup.

#### 1.2.4 ZusammenspielmitanderenSystemen.

Die finanztechnischen Daten über die Mitarbeiter, der Immobilien, den Vermittlungsvorgängen
(Courtagen, Gehälter bzw. Löhne, alle sonstigen Gebühren usw.) werden separat durch ein
vorhandenes Finanzbuchhaltungsprogramm verwaltet und müssen hier nicht berücksichtigt
werden.

Allerdings müssen die finanztechnischen Daten eines Vorgangs (Rechnungen bzw. Mahnun-
gen) vom Finanzbuchhaltungssystem gelesen werden und im neuen System dargestellt wer-
den können. Die Erstellung und Änderung dieser Finanzdaten erfolgt jedoch ausschließlich im
Finanzbuchhaltungssystem.

#### 1.2.5 Pro duktfunktionen

```
/LF10/ Eine Zugangsberechtigung soll mittels eines Loginvorgangs verifiziert werden. Der
Zugriff auf einzelne Daten soll je nach Berechtigung unterschiedlich erfolgen.
→siehe Abschnitt 2.3: „Zielgruppen, Benutzerrollen und Verantwortlichkeiten“
```
```
/LF20/ Der jeweilige Benutzer muss die Möglichkeit haben, über eine grafische Benutzero-
berfläche alle für ihn relevanten Daten einfach und übersichtlich verwalten zu kön-
nen.
```
```
/LF30/ Verwaltet werden sollen alle Arten von Immobilien: Privat- und Geschäftsgebäude,
Grundstücke, Wohnungen usw. Sie sollen die gemeinsame Datenbasis bilden.
Daneben sollen die Vermittlungsvorgänge gepflegt werden können. Es handelt sich
dabei um Verkaufs- oder Mietvermittlungen. Sie bestehen aus Beratungsgesprächen
```

Immobilienverwaltung Lastenheft

```
mit Verkäufern und Vermietern (Anbieter) sowie Käufern und Mietern (Interessen-
ten), aus Kauf- bzw. Mietabwicklungen sowie den Besichtigungen der Immobilien.
Dabei soll der (die) verantwortliche Angestellte zugeordnet werden.
Eine Kauf- bzw. Mietabwicklung beinhaltet die Abläufe nach der Kauf- bzw. Mie-
tentscheidung eines Interessenten. Dabei kommt es zu einem rechtsgültigen Kauf-
bzw. Mietvertrag. Bei einer Kaufabwicklung kommt ein Notarbesuch sowie evtl. ei-
ne Finanzierungsberechnung hinzu.
```
```
/LF40/ Die Immobilien sollen mit all den Eigenschaften abgebildet werden, wie sie in gän-
gigen Immobilienseiten des Internets zu finden sind.
```
```
/LF50/ Jeder Anbieter und Interessent wird in der Kundendatei verwaltet.
```
```
/LF60/ Jeder Immobilie sollen alle Interessenten sowie die Anbieter zugeordnet sein. Dies
soll über Auswahllisten erfolgen. Dabei ist es uns wichtig, Interessenten für be-
stimmte Immobilien automatisch zu finden.
```
```
/LF70/ Zur einfacheren Eingabe der Immobiliendaten soll es Auswahllisten für deren Ei-
genschaften geben. Die Auswahllisten sollen auf einfache Weise erweiterbar und für
sämtliche Mitarbeiter im System verfügbar sein.
```
```
/LF80/ Es soll ein einfach zu bedienender Finanzierungsrechner verfügbar sein, der Annui-
tätendarlehen für den Interessenten berechnen kann.
```
```
/LF90/ Schließlich sollen Rechnungen und Mahnungen für die einzelnen Vermittlungsvor-
gänge erstellt und verwaltet werden können.
```
```
/LF100/ Vor dem Hinzufügen von neuen Daten soll eine Überprüfung stattfinden, ob diese
schon vorhanden sind. Das gilt in besonderem Maße für Interessenten, Anbieter und
Immobilien.
```
#### 1.2.6 Pro duktdaten

```
/LD10/ Die Daten sollen zentral verwaltet und in einer Datenbank abgespeichert werden.
```
#### 1.2.7 Pro duktleistungen.

```
/LL10/ Das Laden gewünschter Daten soll für eine sinnvolle Benutzung im Sekundenbe-
reich erfolgen.
```
```
/LL20/ Die Anzahl der zu verwaltenden Elemente wird auf ca. 100000 geschätzt.
```

Immobilienverwaltung Aufgaben

```
/LL30/ Die Daten müssen bei unserer eigenen Verwendung aus rechtlichen Gründen 10 Jah-
re online verfügbar sein.
```
```
/LL40/ Um bei Anschaffungen und Neuerungen flexibel zu bleiben, ist auf Plattformunab-
hängigkeit besonders zu achten.
```
#### 1.2.8 Qualitätsanforderung

```
Produktqualität sehr gut gut normal nicht relevant
Funktionalität X
Zuverlässigkeit X
Effizienz X
Benutzbarkeit X
Änderbarkeit X
Übertragbarkeit X
Gestaltung X
```
### 1.3 Aufgab en

Einzelne Lastenheftpunkte sind bewusst offen gehalten. Denken Sie darüber nach, welche In-
formationen zusätzlich sinnvoll oder auch notwendig sind. Schauen Sie evtl. nach einzelnen
Zusammenhängen im Internet nach.

Die Anwendung soll als eine Java-Applikation mit JDBC realisiert werden, die von beliebi-
gen Rechnern aus gestartet wird. Dabei wird auf eine zentrale Datenbank zugegriffen, die auf
einem Server läuft.

#### 1.3.1 Analyse

Für die Analyse sind zu erstellen:

- Analyse des Lastenhefts (Fragen und Antworten).
    **neben LF30** : Auswahl von weiteren 4 Lastenheftfunktionen (oder 3 LF und 1 LD (oder
    LL)). Fragen sorgfältig formulieren und ausführlich beantworten (Bewertung erfolgt pro-
    portional zur Komplexität der gewählten LFs).
    Zu beachten: die restlichen Lastenheftfunktionen müssen für ein sinnvolles Ergebnis beim
    Entwurf trotzdem beantwortet werden. Dies können Sie jedoch in „Ihrer persönlichen
    Kurzform“ abhandeln.


Immobilienverwaltung Aufgaben

```
Kennzeichnen Sie die von Ihnen gewählten Lastenheftfunktionen (Z.B. dezent grau oder
farbig hinterlegen, LF-Nummer in Fettschrift etc.)
```
- Ein Use-Case-Diagramm der gesamten Anwendung incl. Beschreibung.
- Eine Verfeinerung des Use-Case-Diagramms incl. Beschreibung. ( **nach Absprache** )
- Ein Analyse-Klassendiagramm incl. Beschreibung (Untersuchen Sie dabei den Einsatz
    geeigneter Analysemuster)

#### 1.3.2 SequenzdiagrammundAktivitätsdiagramm(Analyseo derEntwurf )

Erstellen Sie ein Sequenzdiagramm und ein Aktivitätsdiagramm (incl. Beschreibung) für zwei
der folgenden Szenarios (ein AD für ein gewähltes Szenario, ein SD für ein anderes gewähltes
Szenario), welche das Anlegen jeweils einer Aktion beschreiben:

- Aktion „Verkaufsvermittlung“ durchführen.
- Aktion „Mietvermittlung durchführen“.
- Aktion „Immobilie anlegen und löschen“ (evtl. 2 Teildiagramme)

Für beide gewählten Diagramme ist das jeweilige Szenario ausführlich zu entwickeln (Pseu-
docode). Es sind sämtliche referenzierten Elemente zu berücksichtigen und es sollen jeweils
mehrere beteiligte Personen zugeordnet werden. In allen Fällen wird eine (noch) leere Daten-
bank angenommen. Denken Sie an geeignete Diagrammverfeinerungen.

#### 1.3.3 Entwurf.

Abzuliefern sind hier (alle Diagramme und GUIs jeweils mit Beschreibung):

- Entwurfsklassendiagramm (Untersuchen Sie dabei den Einsatz geeigneter Entwurfsmus-
    ter)
- Einfacher grafischer GUI-Entwurf („CorelDRAW-Level“), es müssen 1-2 aussagekräftige
    Oberflächen sein
- GUI-Modellierung:
    Es ist das Kommunikationsschema der gewählten GUI (s.o.) mit UML zu modellieren.
    Die Anwendung selbst soll dabei nach dem einfachen Model-View-Control-Muster auf-
    gebaut sein. Dazu sind mindestens ein Controller, die erforderlichen Modellklassen so-
    wie eine unabhängige GUI (View) erforderlich. Die Modellierung kann in einem separa-
    ten Diagramm mit den relevanten Modellklassen erfolgen, falls das Entwurfsklassendia-
    gramm sonst zu komplex werden würde.


Immobilienverwaltung Vereinfachungen für den Programmentwurf

### 1.4 VereinfachungenfürdenProgrammentwurf

```
a.) Es muss nicht dafür gesorgt werden, dass auf dieselben Daten der Datenbank nicht gleich-
zeitig zugegriffen werden kann, d.h. es ist kein Locking-Mechanismus erforderlich.
```
```
b.) Eine Protokollierfunktion ist für die Anwendung nicht erforderlich (in der Realität natür-
lich schon!).
```
```
c.) Ein Loginvorgang muss in den Klassendiagrammen nicht modelliert werden
```
**Hinweis:**
Kopieren Sie den Aufgabentext vollständig als erstes Kapitel „Aufgabenstellung“ an den An-
fang Ihrer PE-Dokumentation und verwenden Sie den Aufgabentext dann ohne Frontseite zu-
sätzlich (Word: in neuen Abschnitt einfügen!) als Rahmen für Ihre Lastenheftanalyse (→„aus-
füllen“ mit Fragen und Antworten)!


Immobilienverwaltung Analyse

## 2 Analyse

### 2.1 Einleitung

Die ImmoManage GmbH vermittelt seit über 20 Jahren den Kauf und Verkauf sowie die Ver-
mietung von Immobilien im süddeutschen Raum.
**Welche Daten sollen über ihre Firma im System gespeichert werden?**
Es reicht aus, folgende Daten zu beachten:

- Firma
- Geschäftsform
- Anschrift
- E-Mail
- Telefon
- Website

```
Welche Gebiete beinhaltet der „süddeutsche Raum“ und wo werden Grenzen gezo-
gen?
Zu Süddeutschland zählen die Bundesländer: Baden-Württemberg, Bayern, Hessen, Saar-
land und Rheinland-Pfalz. Die Grenzen werden anhand der offiziellen Bundesländergren-
zen gezogen. Jedoch gibt es keine strikten Grenzen, die einen Kauf oder Verkauf in Grenz-
gebieten verbietet.
Bieten unterschiedliche Gebiete verschiedene Bedürfnisse?
Jede Gegend besitzt ihre Eigenheiten, welche aber nicht von der Software abgebildet wer-
den sollen. Das geschulte Fachpersonal, welches die Software nutzen wird, berücksichtigt
Eigenheiten, wie Sprache und Kultur eigenständig.
Ist die Vermietung auf den süddeutschen Raum begrenzt oder sind weitere Expansio-
nen in andere Gebiete und/oder andere Länder gewünscht?
Derzeit gibt es Vermietungen außerhalb des süddeutschen Raumes, dies sind aber Ein-
zelfälle. Das Kerngeschäft wird im süddeutschen Raum durchgeführt. Dennoch sollen in
der Software keine Begrenzungen oder Hürden für Immobilien außerhalb dieser Grenzen
implementiert werden.
Haben Sie in den 20 Jahren Erfahrungen gesammelt (mit Kunden oder mit Software),
die Sie uns mitgeben wollen?
```

Immobilienverwaltung Einleitung

Kunden legen immer mehr Wert auf die Übersichtlichkeit eines Immobilienangebots. Für
eine Immobilie müssen deshalb alle wichtigen Daten auf einem Blick verfügbar sein, so-
dass ein Berater überzeugen kann. Kunden entscheiden meist in den ersten Sekunden, ob
Ihnen eine Immobilie gefällt oder nicht.
Für die Verwaltung der Immobilien und der Vermittlungsabwicklungen benötigen wir eine
neue Software, die es uns ermöglicht, den steigenden Bedarf an Vermittlungen und Beratungen
noch effizienter durchzuführen.
**In welchem Sinne steigt der Bedarf?**
Betrachtet man die Einwohnerzahlen Deutschlands, wird immer mehr Wohnfläche benö-
tigt, welche vor allem in Ballungsgebieten knapp wird. Immer mehr Menschen greifen
auf Vermittlungsgesellschaften zurück, um einen Überblick zu gewinnen. Auch wir, als
ImmoManage GmbH, verzeichnen ein stetiges Wachstum in der Anzahl der eingestellten
Immobilien, sowie der Immobiliensuchenden. Diesem Wachstum gilt es auch technisch
gewachsen zu sein.
Das bisher eingesetzte Softwarewerkzeug ist in die Jahre gekommen und soll durch neuere
Technologien ersetzt werden.
**Welches Softwarewerkzeug verwenden Sie aktuell?**
Derzeit benutzen wir eine Lösung der Softwaremeister GmbH. Diese stellen einzelne Mo-
dule zu Verfügung, welche verschiedene Bereiche unseres Arbeitsprozesses abdecken.
Jedoch ist diese Implementation sehr lückenhaft und wird durch diverse eigene Excel-
Anwendungen ergänzt. So muss die Finanzierung immer mit weiteren Hilfsmitteln er-
zeugt werden.
**Welche Komponenten der Software sind veraltet und inwiefern können sie überarbei-
tet werden?**
Als veraltet sehen wir zum einen das GUI an. Es wirkt sehr trist und spiegelt keine Serio-
sität wieder. Weiterhin ist das System sehr langsam, sodass man bis zu wenigen Minuten
auf eine Suchanfrage warten muss. Weiterhin muss man sich durch viele Transaktionen
graben, um alle Informationen zu finden. Daher soll eine einheitliche und übersichtliche
Startseite entstehen, von der man alle Informationen schnell finden und bearbeiten kann.
**Gibt es neue Technologien, auf die Sie besonderen Wert legen? Was gefällt Ihnen gut
an diesen neuen Technologien und was sollte gar nicht verwendet werden?**
Besonders für Mitarbeiter im Außendienst wünschen wir uns eine mobile Ansicht. Wir le-
gen großen Wert auf ein übersichtliches Design. Weiterhin ist uns wichtig, dass wir jedes
Endgerät benutzen können. Wir wünschen uns den Einsatz von Java, da es in unsere bis-
herige Systemlandschaft passt. Es sollte jedoch auf Java FX gesetzt werden. Es soll jedoch
davon abgesehen werden, dem Benutzer Kommandozeilen oder kryptische Fehlermel-
dungen anzuzeigen.


Immobilienverwaltung Lastenheft

### 2.2 Lastenheft.

#### 2.2.1 Zielsetzung.

Ziel des Entwicklungsauftrags soll eine Software für die Verwaltung von Immobilien sein. Da-
zu gehören die Abwicklung von Vermittlungen (Vermietungen und Verkäufe) sowie die Be-
rechnung von Immobilienfinanzierungen.
**Gibt es Prozessschritte, die optional durchlaufen werden können?**
Es gibt mehrere optionale Schritte und Alternative. Verpflichtend ist nur der Kauf oder
die Miete einer Immobilie. Der Kunde muss keinen Beratungs-, Finanzierungs- oder Be-
sichtigungstermin wahrnehmen.
**Wird der Server extern oder intern gehostet?**
Der Server läuft intern, in einem eigenen Serverraum. Der Server soll dabei alle 24 Stun-
den mit einem physischen Backup schnell gesichert werden. Wir empfehlen dem Kunden
für eine schnellere und sichere Speicherung der Daten ein RAID-10-Verbund (welcher die
Vorteile von RAID-1 und RAID-0 verbindet).
**Welche Endgeräte sollen unterstützt werden und zählen dazu auch mobile Endgeräte?**
Generell sollten alle Endgeräte unterstützt werden, auf den Java läuft. Andere Endgeräte
werden vorerst außen vorgelassen. Der Server läuft unter Linux. Auf den Computer läuft
in der Firma Windows und die Handys der Außendienstmitarbeiter basieren auf Android.
**Was soll passieren, wenn der Server nicht erreichbar ist?**
Wenn der Server wegen Wartungsarbeiten oder aus anderen Gründen nicht erreichbar ist,
sollen keine neuen Daten mehr erstellt oder geändert werden können. Weiterhin sollen
alle Mitarbeiter rechtzeitig benachrichtigt werden.
**Gibt es Daten, welche offline auf dem Endgerät verfügbar sein sollen?**
Eine Funktion, zum temporären Speichern von Immobilien- und Kundeninformationen
ist wünschenswert. Diese Daten sollen dann nicht nur auf den mobilen Endgeräten, son-
dern auf jedem Endgerät speicherbar sein. Dabei ist anzumerken, dass keine Änderungen
durchgeführt werden dürfen. Ebenso sollte die Immobilienfinanzierung offline verfügbar
sein, wobei es ersichtlich seien muss, dass die Daten nicht aktuell sind.
Ein Import und Export ausgewählter Daten über lesbare Dateien muss zur besseren Wieder-
verwendbarkeit, für Backups und zum Datenaustausch möglich sein.
**In welchem Dateiformat soll eine lesbare Datei vorliegen und wie ist diese formatiert?**
Eine lesbare Datei, muss immer im Semikolon-separierten CSV-Format vorliegen. Dabei
beginnt jede Datei mit einer Kopfzeile. Darunter werden die Daten in neuen Zeilen auf-
geführt.
**Sollen die exportierten Daten verschlüsselt werden und wie stark müssen die Daten
geschützt werden (Intern: Welcher Verschlüsselungsalgorithmus wird benötigt)?**


Immobilienverwaltung Lastenheft

Nein, eine Verschlüsslung ist nicht notwendig.
**Welche weiteren Dateiformate muss der Import unterstützen?**
Der Import muss aus Gründen der Kompatibilität auch Textdateien einlesen müssen. Die-
se stellen Schlüssel-Wertpaare da, die durch „$“ getrennt sind.
**Welche weiteren Dateiformate muss der Export unterstützen?**
Andere Dateiformate oder Formatierungen außer der zuvor erwähnten CSV-Datei wer-
den nicht exportiert.
**Welche Mitarbeiter führen einen Import beziehungsweise Export durch?**
Ein Import beziehungsweise Export wird von einem Administrator durchgeführt..
Eine intuitive, leicht bedienbare Benutzeroberfläche setzen wir als selbstverständlich voraus.
Es sollen keine besonderen Computerkenntnisse zur Bedienung der Software erforderlich sein.
**Was macht eine Benutzeroberfläche leicht bedienbar?**
Eine Benutzeroberfläche ist leicht bedienbar, wenn alle Informationen auf einem Blick
ersichtlich sind und man ohne Anleitung versteht, wo ich weitere Informationen holen
kann. Weiterhin dürfen keine Kenntnisse in der Informationsverarbeitung oder tieferes
Verständnis von Computern vorausgesetzt werden. Also sind Kommandozeilenbefehle
definitiv unbrauchbar.
**Gibt es besondere Bedürfnisse (Blindengerecht)?**
Derzeit arbeiten keine Blinden in unserer Firma. Aus Grund der Inklusion finden wir
einen Modus für den Wechsel zur behindertengerechten Ansicht jedoch sehr wünschens-
wert.
**Wie kamen die Anwender mit dem vorherigen Programm zurecht und was ist Ihnen
besonders positiv beziehungsweise negativ daran aufgefallen?**
Das vorherige Programm setzte zu tiefes Verständnis voraus. Zuerst mussten die Mit-
arbeiter geschult werden und auch danach wurden sie mit technischen Fehlermeldun-
gen überfordert oder durch komplexe Oberflächen verwirrt. Besonders negativ war die
Durchlaufzeit eines Vermittlungsvorgangs. Das Anlegen eines Kunden, Durchführen ei-
nes Beratungstermins und das Abschließen einer Vermittlung konnte mehrere Stunden
dauern.
**Haben die Anwender weitere Vorschläge, was in der Benutzeroberfläche auf jeden Fall
eingebaut und welche Elemente nicht benutzt werden sollen?**
Zu diesem Zeitpunkt nicht.
**Bitte skizzieren Sie für uns den Aufbau einer prototypischen Hauptansicht nach ihren
aktuellen Vorstellungen.**
Eine prototypische Hauptansicht haben wir uns so vorgestellt, wie die Abbildung 2.1 dar-
stellt. Diese wurde von einem unserer Sachbearbeiter im Vorfeld schon grafisch umge-
setzt.


Immobilienverwaltung Lastenheft

```
Abbildung 2.1: Prototypische Hauptansicht für einen Sachbearbeiter
```
Eine Schnittstelle für den eingeschränkten Internet-Zugriff auf Immobilien soll Teil der Softwa-
re sein.
**Was beschränkt den Internet-Zugriff?**
Der Internet-Zugriff ist nicht durch das Datenvolumen oder ähnliches begrenzt, sondern
die Funktionalität soll beschnitten werden.
**Ist der Internet-Zugriff intern und/oder extern?**
Der Zugriff soll von internen Mitarbeitern im Außendienst und somit extern, außerhalb
des eigentlichen Systems, geschehen.
**Auf welche Teile der Software soll man zugreifen können?**
Es sollen nur Daten angezeigt werden können. In keinem Fall ist eine Änderung oder das
Einfügen der Daten gewollt. Sollen Daten geändert werden, muss dies über die internen
Schnittstellen passieren.
**Welche Daten sollen über diese Schnittstelle öffentlich zugänglich sein?**
Über den Internet-Zugriff sollen die Eckdaten der Immobilie aufgerufen werden. Diese
werden in 2.2 Anwendungsbereiche weiter beschrieben.

#### 2.2.2 Anwendungsb ereiche

Die Software soll ausschließlich für die Verwaltung von Immobilien und Vermittlungsvorgän-
gen eingesetzt werden.
**Wer ist an einem Vermittlungsvorgang beteiligt?**
An einem Vermittlungsvorgang sind ein oder mehrere Kunden, sowie ein oder mehrere
Mitarbeiter beteiligt. Wobei je nach Situation verschiedene Experten hinzugezogen wer-
den können. Auch dies soll im System vermerkt werden.


Immobilienverwaltung Lastenheft

```
Wer ist ein Kunde und welche Daten müssen über diese im System gespeichert wer-
den?
Ein Kunde ist jeder Interessent an einer Immobilie oder eine Person, die eine Immobilie
anbietet. Dabei sollen im System die Anbieter der Immobilie nur neben läufig Beachtung
finden, wohingegen die Interessenten eine zentrale Rolle spielen. Jeder Kunde hat folgen-
de Eigenschaften:
```
- Anschrift
- Telefonnummer
- E-Mail

```
Weiterhin unterscheidet man in Privat- und Geschäftskunde:
```
- Privatkunde: Name und Geburtsdatum
- Geschäftskunde: Firma, Unternehmensform, Geschäftsart, Website und Ansprech-
    partner

Außerdem können Kunden sich entweder für eine Immobilie interessieren (Interessent)
oder eine anbieten (Anbieter).
**Gibt es verschieden Immobilien und welche Unterschiede weisen diese auf?**
Immobilien unterscheiden sich grundsätzlich, in den Kategorien Kauf und Miete. Bei ei-
ner Kaufimmobilie wird der Kaufpreis angegeben, wobei bei einer Mietimmobilie ein
Mietpreis angegeben wird. Weiterhin gibt es noch verschiedene Immobilienarten, welche
später beschrieben werden.
Sie soll ausschließlich unternehmensweit im Tagesgeschäft eingesetzt werden.
**Wann findet das Tagesgeschäft statt und soll das System auch außerhalb dieser Uhrzeit
verfügbar sein?**
Das Tagesgeschäft findet zwischen 07:00 Uhr bis 20:00 Uhr statt. In diesem Zeitraum, muss
das System vollständig zu Verfügung stehen. Auch außerhalb dieser Zeiten sollten Daten
abrufbar sein, wobei eine geminderte Performance akzeptabel wäre.
**Welche Aufgaben müssen im Tagesgeschäft erledigt werden?**
Das Tagesgeschäft besteht aus folgenden Aufgaben: Vermittlungen, Beratungen, Immobi-
lienfinanzierungen und der Datenpflege (Kunden- und Immobiliendaten).
**Was bedeutet unternehmensweit und wie können Mitarbeiter auf das System mit ih-
ren eigenen Endgeräten zugreifen?**
Unternehmensweit bezeichnet hauptsächlich unsere verschiedenen Niederlassungen in-
nerhalb Deutschlands, wobei die Mitarbeiter über ein Intranet auf die Daten zugreifen


Immobilienverwaltung Lastenheft

```
können. Weiterhin muss ein eingeschränkter Zugang von mobilen Endgeräten über die
Internet-Schnittstelle möglich sein.
Wie greifen Mitarbeiter auf die Software auf das Softwarewerkzeug für Ihr Tagesge-
schäft zu?
Die Mitarbeiter greifen über stationäre Rechner oder mobile Endgeräte (Smartphones, Ta-
blets und Laptops) auf die Software zu. Dabei wird Windows oder Android benutzt. Bei
einem externen Zugriff über die Internetschnittstelle werden nur Daten eingesehen, aber
nicht geändert oder erstellt.
```
#### 2.2.3 Zielgrupp en,BenutzerrollenundVerantwortlichkeiten.

Es gibt vier Zielgruppen:

- Sachbearbeiter(in) (Immobilienkaufmann bzw. Immobilienkauffrau) zur Pflege der Da-
    ten zu Immobilien und den Vermiet- und Verkaufsvorgängen. Dabei können Immobilien
    und Vorgänge angelegt, geändert und gesucht werden. Das Löschen von Immobilien und
    Vorgängen soll nur für die eigenen Daten möglich sein.
       **Welche Daten von Immobilien und den Vermiet- und Verkaufsvorgängen müssen**
       **gepflegt werden?**
       Alle Daten einer Immobilie wie in /LF30/ beschrieben, müssen verwaltet werden.
       Weiterhin muss in einem Vermittlungsvorgang folgende Daten gepflegt werden:
          **-** Interessent
          **-** Anbieter
          **-** Berater
          **-** Interessante Immobilien
          **-** Beratungstermine (Grund, Datum, Dauer, Ergebnis)
          **-** Finanzierungstermine (Eigenkapital, Fremdkapital, Zinssatz, Angebote, Son-
             derzahlungen, Abschlagszahlungen)
          **-** Abschluss (Miet- oder Kaufvertrag beziehungsweise Abschluss ohne Verkauf)
       **Sollen Immobilien mit Bildern, Videos, 3D-Visualisierungen und anderen Medi-**
       **en dargestellt werden?**
       Für Kunden heutzutage ist besonders der audiovisuelle Eindruck wichtig. Daher ist
       insbesondere der Einsatz von Medien interessant. Wir wollen vor allem Bilder, Vi-
       deos und teilweise auch 3D-Visualisierungen benutzen. Besonderen Wert legen wir
       jedoch auf professionelle Bilder und Videos der Immobilie.


Immobilienverwaltung Lastenheft

```
Gibt es vertrauliche Informationen, die nur manchen Nutzern zugänglich sein
soll (Zugriffskontrollen)?
Jeder Mitarbeiter kann auf alle Immobilien- und Kundendaten zugreifen. Natürlich
sollen nur Verwaltungsmitarbeiter bzw. Gruppen-/Bereichsleiter Zugriff auf Mitar-
beiterdaten haben. Dieses soll über Rollen realisiert werden, sodass bei dem Zugriff
auf Daten, die benötigten Zugriffsrechte automatisiert geprüft werden.
Soll es für einzelne Aktionen (z.B. das Löschen von Immobilien) besondere Be-
rechtigungen geben?
Für bestimmte Aktionen werden keine Berechtigungen vergeben, sondern nur für
bestimmte Informationsbereiche. Man unterscheidet: Immobiliendaten, Kundenda-
ten und Mitarbeiterdaten. Wobei alle Mitarbeiter auf Kunden- und Immobiliendaten
zugreifen können, aber nur Verwaltungsangestellte bzw. Gruppen-/Bereichsleiter
auf Mitarbeiterdaten.
Sollen Berechtigungen auch Nutzergruppen zugewiesen werden oder nur verein-
zelt vergeben werden?
Ja, die Berechtigungen sind anhand von Nutzergruppen zu verwalten. Dabei gibt
es die Nutzergruppen: Gruppen- bzw. Bereichsleiter, Verwaltungsangestellte, Ad-
ministrator und Sachbearbeiter. Es sollen keine Berechtigungen für einzelne Nutzer
vergeben werden.
```
- Gruppen- bzw. Bereichsleiter(innen) haben darüber hinaus Vollzugriff auf alle Daten der
    Gruppenmitglieder.
       **Wie ist eine Gruppe aufgebaut?**
       Eine Gruppe besteht aus einem oder mehreren Mitarbeitern sowie einem Gruppen-
       leiter, die an einem Projekt beteiligt sind. Dieses Projekt kann eine Immobilie, ein
       Kunde oder ein Projekt sein. Ein Projekt umfasst einen Zweck, eine Beschreibung
       sowie mehrere Immobilien und Kunden. Die Gemeinsamkeit aller Mitarbeiter in ei-
       ner Gruppe besteht aus der gemeinsamen Tätigkeit, welche durch einen Zweck und
       eine Beschreibung gegeben ist.
       **Wie ist ein Bereich aufgebaut?**
       Ein Bereich unterteilt das Unternehmen in Fachbereiche (z.B. Controlling, Immobi-
       lien-Marketing). Hierbei werden Mitarbeiter in logische Gruppen gegliedert, sodass
       gemeinsame Aufgabenbereiche besser strukturiert sind. Dafür hat ein Bereich einen
       Zweck, eine Aufgabenstellung und eine Beschreibung.
       **Kann ein Mitarbeiter zu mehreren Gruppen bzw. Bereichen gehören?**
       Ja, ein Mitarbeiter kann in beliebig vielen Gruppen beschäftigt sein, wobei ein Mitar-
       beiter mindestens in einem Bereich arbeiten muss, aber in mehreren arbeiten kann.


Immobilienverwaltung Lastenheft

```
Welche Daten von Mitgliedern sind für den Gruppe- bzw. Bereichsleiter mit ei-
nem Vollzugriff einsehbar?
Der Bereichsleiter kann auf die wesentlichen Mitgliederdaten zugreifen. Zu diesen
zählen: Name, Anschrift, Aufgabenbereich, Erfahrung, Gehalt, Projekte, Arbeits-
stunden, Urlaub, Rolle. Jedoch hat er keinen Zugriff auf streng vertrauliche Daten
(Steueridentifikationsnummer, Versicherungsnummer).
Können mit dem Vollzugriff Gruppenmitgliederdaten geändert werden oder soll
dies dem Administrator vorbehalten werden?
Mit einem Vollzugriff können die oben beschrieben Mitgliederdaten angesehen, ge-
ändert, erstellt oder gelöscht werden. Dies kann der Administrator, Gruppen- bzw.
Bereichsleiter und Verwaltungsmitarbeiter.
Welche Daten werden von Gruppenmitglieder gespeichert?
Die Daten der Gruppenmitglieder ergänzen die Mitarbeiterdaten um die Zeit, Rolle
und Aufgaben, welche sie in der Gruppe- bzw. Bereich übernehmen.
```
- Verwaltungsangestellte(r) zur Pflege der Mitarbeiterdaten.
    **Was für Daten werden von einem Mitarbeiter gespeichert?**
    Ein Mitarbeiter wird grundlegend durch folgende Daten beschrieben:
       **-** Name (Vorname, Nachname)
       **-** Anschrift (Straße, Hausnummer, PLZ, Ort, Land)
       **-** Geburtsdatum
       **-** Geburtsort
       **-** Gehalt
       **-** Beschäftigungsstand (arbeitet, gekündigt)
       **-** Ausbildung
       **-** Steueridentifikationsnummer
       **-** Versicherungsnummer
       **-** Telefon
       **-** Mobiltelefon
       **-** E-Mail
       **-** Gruppen bzw. Bereiche
       **-** Benutzername
       **-** Passwort


Immobilienverwaltung Lastenheft

```
Weiterhin besteht eine Verbindung zu den Gruppen bzw. Bereichen in den der Mit-
arbeiter arbeitet, welche auch verwaltet werden müssen. Ein Administrator besitzt
noch ein zusätzliches Passwort, um bestimmte Aktionen durchzuführen. Ein Sach-
bearbeiter listet seine Kompetenzen und sein Expertengebiet in seinem Profil. Da-
hingegen hat ein Verwaltungsangestellter die Eigenschaften: Einsatz und zusätzli-
che textuelle Informationen
Welche Daten dürfen geändert werden und welche Berechtigungen werden be-
nötigt?
Grundlegend darf ein Verwaltungsmitarbeiter nicht das Gehalt ändern, dies ist dem
Bereichs- bzw. Gruppenleiter vorbehalten. Weiterhin darf er auch nicht das Pass-
wort oder den Benutzernamen ändern, dies darf nur ein Administrator.
Ohne weitere Dokumente dürfen Telefon, Mobiltelefon und E-Mail geändert wer-
den. Um die Daten: Name, Anschrift, Beschäftigungsstand, Ausbildung, Steueri-
dentifikationsnummer, Versicherungsnummer jedoch zu ändern, benötigt der Ver-
waltungsangestellte belegende Dokumente, welche dem Vorgang angehängt wer-
den müssen.
Jedes Dokument muss stets mit folgenden Attributen ausgestattet sein:
```
**-** Dokumentenname
**-** Erstellungsdatum
**-** Änderungsdatum
**-** Vertraulich
**-** Autor
**Sind Verwaltungsangestellte auch zum Löschen der Mitarbeiter oder einzelner
Daten bevollmächtigt?**
Ja, ein Verwaltungsangestellter kann auch Daten eines Mitarbeiters löschen, wobei
die oben beschriebenen Regeln gelten. Das Löschen eines ganzen Mitarbeiters ist
nicht erlaubt, dafür soll der Beschäftigungsstand verändert werden.
**Wie können erweiterte Berechtigungen erhalten werden und für welchen Zeit-
raum bleibt eine Berechtigung bei einem Mitarbeiter?**
Ein Mitarbeiter kann Berechtigungen nur über Berechtigungsgruppen erhalten. Da-
für muss der Mitarbeiter einer oder mehreren Berechtigungsgruppen zugewiesen
werden. Dann erbt er diese Berechtigungen für die vom Verwaltungsangestellten
angegebenen Berechtigungen für einen spezifizierten Zeitraum. Es ist nicht mög-
lich, eine Berechtigung für immer zu erhalten, nach spätestens einem Jahr läuft ei-
ne Berechtigung ab und muss erneuert werden. Eine Berechtigungsgruppe kann


Immobilienverwaltung Lastenheft

```
von einem Verwaltungsmitarbeiter vergeben werden oder von einem Mitarbeiter,
der dieser Gruppe angehört und das Weitervergaberecht erhält. Eine Berechtigung
erlaubt dann den kontrollierten Zugriff (Schreiben, Lesen, Erstellen) auf eine oder
mehrere Immobilien, Kunden oder Vermittlungen.
```
- Administrator hat Vollzugriff auf sämtliche Daten, vor allem für deren Import und Export
    sowie deren Backup.
       **Kann der Administrator wirklich alles einsehen, oder ist dieser Vollzugriff auch**
       **etwas eingeschränkt?**
       Ein Administrator hat vollen Zugriff auf alle Daten. Dabei gibt es keine Beschrän-
       kung bzw. Unterteilung in eingeschränkten Zugriff auf sensible Daten.
       **Welche Aktionen darf der Administrator auf den Daten durchführen?**
       Der Administrator darf Daten löschen, anlegen, ändern und exportieren bzw. im-
       portieren.
       **Welche Daten dürfen exportiert werden?**
       Es dürfen Mitarbeiter-, Immobilien-, Kunden-, sowie Finanzierungsdaten exportiert
       werden. Die syntaktischen Vorgaben für Exporte und Importe wurden schon be-
       schrieben.
       **Welche Daten dürfen importiert werden?**
       Es dürfen Immobiliendaten sowie Finanzierungsdaten importiert werden.
       **Wie wird der Datenschutz der einzelnen Mitarbeiter gewahrt, wenn der Admi-**
       **nistrator auch sensible Mitarbeiterdaten einsehen kann?**
       Ein Administrator ist verpflichtet, mit den eingesehen Daten vertraulich umzuge-
       hen und die Rechte der Mitarbeiter laut Deutschem Datenschutzgesetz zu berück-
       sichtigen. Außerdem darf der Administrator nur bei nachgewiesen Bedarf (anhand
       eines Belegs zum Ändern, siehe Verwaltungsangestellter) auf die Daten der Mitar-
       beiter zugreifen.

#### 2.2.4 ZusammenspielmitanderenSystemen.

Die finanztechnischen Daten über die Mitarbeiter, der Immobilien, den Vermittlungsvorgängen
(Courtagen, Gehälter bzw. Löhne, alle sonstigen Gebühren usw.) werden separat durch ein
vorhandenes Finanzbuchhaltungsprogramm verwaltet und müssen hier nicht berücksichtigt
werden.
**Welche Daten beinhalten die finanztechnischen Daten eines Mitarbeiters? Finanztech-
nische Daten eines Mitarbeiters beinhalten:**

- Gehalt


Immobilienverwaltung Lastenheft

- Courtagen
- Steueridentifikationsnummer
- Versicherungsnummer

```
Welche Daten beinhalten die finanztechnischen Daten einer Immobilie? Finanztechni-
sche Daten einer Immobilie beinhalten:
```
- Miete- oder Kaufpreis
- Notargebühren
- Grunderwerbssteuern

```
Wobei diese Daten auch dem Kunden zu Verfügung gestellt werden müssen
Welche Daten beinhalten die finanztechnischen Daten eines Vermittlungsvorgangs?
Finanztechnische Daten eines Vermittlungsvorgangs beinhalten:
```
- Vermittlungsgebühr
- Fahrtkosten
- Sonderkosten

**Soll es eine direkte Schnittstelle zum Verarbeiten der finanztechnischen Daten und
den Verwaltungsdaten geben, um beispielsweise einen Bonus zu berechnen?**
Nein, sollte ein Zusammenhang zwischen diesen Daten hergestellt werden, muss dies
über einen Export und Import der Daten geschehen.
Allerdings müssen die finanztechnischen Daten eines Vorgangs (Rechnungen bzw. Mahnun-
gen) vom Finanzbuchhaltungssystem gelesen werden und im neuen System dargestellt wer-
den können. Die Erstellung und Änderung dieser Finanzdaten erfolgt jedoch ausschließlich im
Finanzbuchhaltungssystem.
**Gibt es eine vorhandene Schnittstelle zum Import bzw. Export von Finanzierungsda-
ten?**
Ja, der Export bzw. Import kann über eine bereitgestellte Schnittstelle erfolgen.
**Welche Datenformate sollen über diese Schnittstelle ausgetauscht werden?**
Wie bei allen anderen lesbaren Dateien, soll es sich um eine Semikolon-separierte CSV-
Datei handeln, welche eine Kopfzeile besitzt.
**Welche Export-Möglichkeiten bietet das System und was muss beim Import beachtet
werden?**
Derzeit ist es nur möglich, jeweils ein Dokument aus dem Finanzbuchhaltungssystem
zu exportieren. Im neuen Immobilen-Verwaltungssystem soll es deshalb möglich sein,


Immobilienverwaltung Lastenheft

```
auch mehrere Dateien zu importieren, um das Vorgehen zu beschleunigen. Beim Import
soll automatisch eine Verbindung zu den betreffenden Objekten (Mitarbeiter, Immobilie,
Vermittlungsvorgang) erstellt werden.
```
#### 2.2.5 Pro duktfunktionen

```
/LF10/ Eine Zugangsberechtigung soll mittels eines Loginvorgangs verifiziert werden. Der
Zugriff auf einzelne Daten soll je nach Berechtigung unterschiedlich erfolgen.
→siehe Abschnitt 2.3: „Zielgruppen, Benutzerrollen und Verantwortlichkeiten“
Welche Daten werden für ein Login benötigt?
Für einen Login werden Benutzername und Passwort benötigt. Der Benutzername wird
von einem Administrator vergeben. Das Passwort muss mindestens 8 Zeichen lang sein
und Zahlen sowie Sonderzeichen beinhalten.
Wie erfolgt die erste Anmeldung im System?
Ein Mitarbeiter bekommt seinen Benutzernamen und ein Initialpasswort vom Adminis-
trator. Nach dem ersten Login muss das Passwort geändert werden.
Was passiert bei einfacher und mehrfacher fehlerhafter Eingabe der Daten?
Meldet sich ein Nutzer mit fehlerhaften Daten ein, so soll eine Nachricht über die feh-
lerhafte Eingabe erfolgen. Bei mehrfach fehlerhafter Eingabe gibt es keine weiteren Be-
schränkungen.
Soll es weitere Login-Möglichkeiten (Iriserkennung, SSO) geben?
Ja, die Möglichkeit des Single-Sign-On (SSO) soll implementiert werden, sodass ein Nut-
zer sich nur einmal pro Session anmelden muss. Eine Session bleibt solange erhalten bis
sich ein Nutzer abmeldet oder er für 30 Minuten nicht aktiv ist, danach wird man auto-
matisch abgemeldet.
Was soll bei einem Zugriff auf eine Datei ohne Berechtigung passieren?
Der Zugriff muss verweigert werden und der Nutzer über die fehlenden Berechtigungen
informiert werden. Darauf muss sich der Mitarbeiter an einen Verwaltungsmitarbeiter
oder Administrator wenden, um die entsprechenden Berechtigungen zu erhalten.
Darf man auf mehreren Geräten gleichzeitig angemeldet sein?
Eine Anmeldung kann auf mehreren Geräten erfolgen. Wobei für jedes Gerät einzeln gilt,
dass es nach 30 Minuten der Abwesenheit automatisch abgemeldet wird.
Wie kann ein Passwort zurückgesetzt werden?
Ein Passwort kann nur von dem Administrator zurückgesetzt werden.
Läuft die Gültigkeit von Passwörtern nach einer gewissen Zeit ab?
Nein, ein Passwort hat keine Gültigkeitsdauer.
Wie können Login-Daten geändert werden?
Das Passwort kann von dem Mitarbeiter selbst geändert werden, indem er sein altes und
```

Immobilienverwaltung Lastenheft

```
neues Passwort eingibt. Der Benutzername darf nur von einem Administrator geändert
werden.
```
```
/LF20/ Der jeweilige Benutzer muss die Möglichkeit haben, über eine grafische Benutzero-
berfläche alle für ihn relevanten Daten einfach und übersichtlich verwalten zu kön-
nen.
```
```
Was macht eine Benutzeroberfläche leicht bedienbar?
Eine Benutzeroberfläche ist leicht bedienbar, wenn alle Informationen auf einem Blick
ersichtlich sind und man ohne Anleitung versteht, wo ich weitere Informationen holen
kann. Weiterhin dürfen keine Kenntnisse in der Informationsverarbeitung oder tieferes
Verständnis von Computern vorausgesetzt werden. Also sind Kommandozeilenbefehle
definitiv unbrauchbar.
Gibt es besondere Bedürfnisse (Blindengerecht)?
Derzeit arbeiten keine Blinden in unserer Firma. Aus Grund der Inklusion finden wir
einen Modus für den Wechsel zur behindertengerechten Ansicht jedoch sehr wünschens-
wert.
Wie kamen die Anwender mit dem vorherigen Programm zurecht und was ist Ihnen
besonders positiv beziehungsweise negativ daran aufgefallen?
Das vorherige Programm setzte zu tiefes Verständnis voraus. Zuerst mussten die Mit-
arbeiter geschult werden und auch danach wurden sie mit technischen Fehlermeldun-
gen überfordert oder durch komplexe Oberflächen verwirrt. Besonders negativ war die
Durchlaufzeit eines Vermittlungsvorgangs. Das Anlegen eines Kunden, Durchführen ei-
nes Beratungstermins und das Abschließen einer Vermittlung konnte mehrere Stunden
dauern.
Welche Daten sind für welche Nutzergruppen interessant?
```
```
Sachb earb eiter
Für einen Sachbearbeiter stehen seine aktiven Vermittlungsvorgänge im Vorder-
grund. Weiterhin soll er Übersicht über seine Kunden und Immobilien haben, für
die er die Datenpflege im System übernimmt. Besonders wichtig für einen Sachbe-
arbeiter sind auch seine anstehenden Termine.
```
```
Grupp enbzw.Bereichsleiter
Ein Gruppen bzw. Bereichsleiter beobachtet vor allem das Vorgehen seiner Mitar-
beiter. Dafür ist es wichtig, dass er die Termine und Vermittlungsvorgänge seiner
Mitarbeiter einsehen kann. Außerdem ist es essentiell anfallende Rechnungen und
Mahnungen zu prüfen und zu kontrollieren.
```

Immobilienverwaltung Lastenheft

```
Verwaltungsangestellter
Ein Verwaltungsangestellter übersieht im allgemeinen Mitarbeiterdaten und pflegt
diese im System. Daher ist eine Mitarbeiterübersicht mit einfacher Suche sinnvoll.
```
```
Administrator
Der Administrator übersieht das ganze System. Für ihn sind Vitaldaten des Systems
interessant und Auftreten von Anomalien.
```
```
Haben die Anwender weitere Vorschläge, was in der Benutzeroberfläche auf jeden Fall
eingebaut und welche Elemente nicht benutzt werden sollen?
Zu diesem Zeitpunkt nicht.
Soll die Oberfläche dynamisch für jeden Nutzer, Nutzergruppe oder für alle Nutzer er-
zeugt werden?
Standardmäßig wird jede Ansicht für eine Nutzergruppe erstellt. Es wäre weiterhin sinn-
voll, eine Möglichkeit der Individualisierung zu bieten. Dabei kann es auch sinnvoll sein,
Modi für Behinderte Personen (Seh- oder Hörbehinderte) einzubauen.
Soll es Begrenzungen für einzelne Nutzer oder Nutzergruppen geben?
Ja, obwohl die Oberfläche dynamisch anpassbar sein soll, sind Nutzergruppen in den Ge-
staltungsmöglichkeiten begrenzt. Dies geht aus den Rechten der Nutzergruppen hervor,
so darf ein Sachbearbeiter keine Mitarbeiterdaten pflegen und auch nicht einsehen. Daher
soll es ihm auch nicht ermöglicht werden, diese Daten in seine Oberfläche einzupflegen.
Wie sieht eine gute grafische Fehlerbehandlung aus?
Wenn ein Fehler auftritt, soll dies über ein neu aufkommendes Fenster signalisiert wer-
den. In diesem Fenster muss beschrieben werden, warum der Fehler aufgetreten ist und
wie man ihn beheben kann. Verlässt der Nutzer dieses Fenster, sollen die vorher ausge-
führten Aktionen (z.B. das Ausfüllen eines Formulars) nicht verloren gehen. Stattdessen
sollen die Daten vorhanden bleiben und falls möglich die Fehlerquelle markiert werden
(z.B. Fehlerhafte Eingabefelder rot markieren).
Was macht eine übersichtliche Oberfläche aus?
Für uns besteht eine übersichtliche Oberfläche besonders aus Simplizität. Dabei legen wir
Wert darauf, dass eher wenige Daten dargestellt werden und es ersichtlich ist, wie man
nähere Informationen für Objekte erhalten kann.
Wie kann man Daten einfach und übersichtlich verwalten?
In der Vergangenheit haben wir gute Erfahrungen mit Tabellen und Listen gemacht. Da-
durch können mehrere Daten sehr übersichtlich dargestellt, gesucht und sortiert werden.
Für das Verwalten der Daten, sollten einfache Daten direkt in der Tabelle oder Liste ver-
ändert werden können. Falls ein komplexeres Vorgehen notwendig ist, dann sollte über
ein neues Eingabefenster eine Hilfe geboten werden.
```

Immobilienverwaltung Lastenheft

```
/LF30/ Verwaltet werden sollen alle Arten von Immobilien: Privat- und Geschäftsgebäude,
Grundstücke, Wohnungen usw. Sie sollen die gemeinsame Datenbasis bilden.
```
```
Welche Aspekte werden an den Immobilien verwaltet und wie sollen diese im System
geführt und gepflegt werden?
Eine Immobilie wird im System in einer zentralen Datenbank abgespeichert und verwal-
tet. Die Mitarbeiter unseres Unternehmens sollen jedoch über eine grafische Oberfläche
Zugriff auf die Daten bekommen. Eine Immobilie soll dem Kunden im besten Licht dar-
gestellt werden. Für einen Mitarbeiter ist es wichtig, alle Informationen auf einmal zu
erhalten.
Welche Eigenschaften müssen an Immobilien verwaltet werden?
Eine Immobilie kann mit folgenden Attributen beschrieben werden:
```
- Medien: Bilder, Videos, 360° Begehung
- Lage (Land, Ort, PLZ, Straße, Hausnummer)
- Lageinformationen
- Wohnungstyp
- Preis (Kaufpreis, Kaltmiete, Nebenkosten, Warmmiete, Preis/m^2 )
- Termin zum Bezug
- Wohnfläche, Nutzfläche und Garten inm^2
- Anzahl Zimmer, Schlafzimmer und Badezimmer, Abstellkeller
- Garagen und Stellplätze
- Ausstattungstyp (Gehoben, Modern, Schlicht)
- Etage, Etagenanzahl
- Baujahr, Objektzustand, Modernisierung/Sanierung
- Heizungsart, Wesentlicher Energieträger, Energieausweis
- Beschreibung in Freitext

```
Was ist mit „usw.“ zu verstehen? (Garagen,... )?
Insgesamt verwalten wir diese Immobilien:
```
- Privatimmobilie


Immobilienverwaltung Lastenheft

- Geschäftsimmobilie
- Grundstücke
- Wohnungen
- Gebäude
- Mietimmobilien
- Kaufimmobilien
- Garagen
- Stellplätze
- Garten
**Inwiefern sind Sie eine gemeinsame Datenbasis?**
Die gemeinsame Datenbasis ergibt sich aus allen gemeinsamen Eigenschaften, welche wie
folgt abstrahiert werden kann:
- Medien: Bilder, Videos, 360° Begehung
- Adresse (Land, Ort, PLZ, Straße, Hausnummer)
- Lageinformationen
- Verkaufstermin
- Kategorie (Privat- oder Geschäftsimmobilie)
- Preis
- Fläche inm^2
- Baujahr, Objektzustand, Modernisierung/Sanierung
- Beschreibung in Freitext
**Soll diese Datenbasis noch erweiterbar sein? (Wenn ja, mit welchen Daten?)**
Die grundlegende Datenbasis bleibt statisch. Es sollte jedoch möglich sein für einzelne
Immobilen oder Immobilienarten neue Attribute hinzuzufügen.
**Was verbindet und was unterscheidet die einzelnen Immobilienarten voneinander?**
Die einzelnen Immobilienarten werden generell über die gemeinsame Datenbasis ver-
bunden. Einzelne Immobilien können stets durch Zusatzinformationen erweitert werden,
wobei Immobilienarten besondere Attribute bieten. Zu den oben beschriebenen Arten von
Immobilen gibt es folgende Attribute:


Immobilienverwaltung Lastenheft

- Privatimmobilie: Darf nicht für geschäftliche Zwecke genutzt werden
- Geschäftsimmobilie: Darf nur von gewerblichen Kunden genutzt werden. Attribute:
    Geschäftsart
- Mietimmobilien: Kaltmiete, Warmmiete, Kaution, Nebenkosten
- Kaufimmobilien: Kaufpreis, Hausgeld
- Grundstücke: Erschließung, Nutzung
- Wohnungen: Etage, Etagenanzahl, Wohnungstyp, Ausstattungstyp, Heizungstyp,
    Wesentlicher Energieträger, Energieausweis
- Gebäude: Gebäudeart, Garten, Etagenanzahl, Ausstattungstyp, Heizungstyp, We-
    sentlicher Energieträger, Energieausweis
- Garten: Gartenart, Nutzart, Erschließung
- Garagen: Garagenart, Autoanzahl, Boden
- Stellplatz: Stellplatzart, Boden, Autoanzahl

Daneben sollen die Vermittlungsvorgänge gepflegt werden können. Es handelt sich dabei um
Verkaufs- oder Mietvermittlungen. Sie bestehen aus Beratungsgesprächen mit Verkäufern und
Vermietern (Anbieter) sowie Käufern und Mietern (Interessenten), aus Kauf- bzw. Mietabwick-
lungen sowie den Besichtigungen der Immobilien. Dabei soll der (die) verantwortliche Ange-
stellte zugeordnet werden.
**Welche beteiligten Personen können an einer Verkaufs- oder Mietvermittlungen mit-
wirken?**
An einer Verkaufs- oder Mietvermittlung sind folgende Personen beteiligt:

- Mitarbeiter (Verkäufer, Berater, Fachpersonal)
- Anbieter (Vermieter)
- Interessenten (Mieter, Käufer)
- Notar
- Finanzierungsgesellschaften

```
Welche Personen müssen an einer Verkaufs- oder Mietvermittlungen mitwirken?
An einer Vermittlung müssen mindestens ein Mitarbeiter, ein Anbieter und ein Interessent
beteiligt sein. Wenn ein Kaufvertrag zustande kommt, wird auch ein Notar notwendig. Bei
```

Immobilienverwaltung Lastenheft

```
einer Finanzierung muss eine Finanzierungsgesellschaft eingebunden werden. Weitere
Mitarbeiter und Interessenten können jederzeit hinzukommen, sind jedoch optional.
Können mehrere Verkäufer einem Verkauf oder einer Vermietung zugeteilt werden?
Natürlich, wobei ein Verkäufer führend für den Vermittlungsprozess ist.
Welche Daten sollen über eine Finanzierungsgesellschaft gepflegt werden?
Über eine Finanzierungsgesellschaft sind folgende Daten benkannt:
```
- Firma
- Unternehmensform
- Anschrift
- Telefon
- EMail
- Website
- Ansprechparnter

```
Beschreiben sie den Verlauf einer Beratung. Gibt es Bedarf dies auch im System abzu-
bilden und gibt es Verbesserungspotential?
Die Beratung soll auch im System abgebildet werden. Der bisherige Ablauf einer Beratung
kann wie folgt skizziert werden und dauert zwischen 10 und 120 Minuten:
```
1. Ein Kunde interessiert sich für eine Immobilie und kontaktiert uns über ein Kon-
    taktformular.
2. Ein Mitarbeiter nimmt mit dem Kunden Kontakt auf und vereinbart einen telefo-
    nisch Beratungstermin oder direkt in einen unserer Beratungscenter.
3. Bei dem Beratungstermin besprechen der Mitarbeiter und der Kunde, die angefragte
    Immobilie. Dabei geht der Mitarbeiter individuell auf die Bedürfnisse des Kunden
    ein und zeigt gegebenenfalls auch Alternativen auf.
4. Wenn es zu einer Miete oder einem Kauf kommt, kann der Mitarbeiter einen Antrag
    an die Verwaltungsabteilung senden, den Vertrag an den Kunden zu schicken.
5. Falls der Kunde weitere Termine (z.B. eine Besichtigung oder einen folgenden Bera-
    tungstermin) erwünscht, wird dies auch in dem System erfasst.

```
Derzeit bietet das System Schwachstellen in einigen Bereichen:
Bei der Kontaktaufnahme kann der Kunde nur das Kontaktformular benutzen. Es gibt
```

Immobilienverwaltung Lastenheft

```
keine Möglichkeiten einen Kundenchat oder ein Telefonat aufzunehmen. Ein direkterer
und schnellerer Kontakt mit dem Kunden wäre jedoch wünschenswert, um somit den
Kunden zu binden. Die Kontaktaufnahme ist jedoch nicht Teil der angeforderten Softwa-
re.
Bei der Beratung des Kunden fehlt in der Software ein Finanzierungsrechner, welcher spä-
ter ausführlich beschrieben wird.
Falls der Kunde mehrere Termine oder sich für mehrere Immobilien interessiert, bietet
das derzeitige System, keine Möglichkeit diese Informationen gesammelt abzurufen. Man
muss sich stets von einem Kunden durch verschiedene Unterbildschirme bewegen. Eine
einzelne Stelle, an der alle Kundeninformationen ersichtlich sind, ist wünschenswert.
Bitte beschreiben Sie einen Vermittlungsprozess sowie die anfallenden Informationen
so genau wie möglich. Wie wurden diese Prozessschritte von der bisherigen Lösung
abgebildet und was wurde dabei nicht effizient durchgeführt und soll verbessert wer-
den?
Die bisherige Software bildet nur einen Teil des Vermittlungsprozesses ab. Der Vermitt-
lungsprozess besteht aus den Schritten Anwerbung, Beratung und Abnahme. Nachdem
ein Kunde, sich für eine Immobilie interessiert und er den ersten Beratungstermin abge-
schlossen hat, können die nächsten Schritte wie folgt beschrieben werden:
```
1. Besichtigungstermin: Der Kunde besucht eine Immobilie, wobei ihm ein Mitarbeiter
    zur Seite steht. Hierbei wird ein Dokument angelegt, was die Wünsche und Kom-
    mentare des Kunden dokumentiert.
2. Weitere Beratungstermine: Wie bei dem ersten Beratungstermin wird immer Proto-
    koll über jeden Termin geführt, wobei der Zweck, Bemerkungen und das Ergebnis
    dokumentiert werden. Es können andere Immobilien besprochen und verglichen
    werden, was auch dokumentiert wird.
3. Finanzierung: Der Kunde kann auch beraten werden, wie er eine Immobilie finan-
    zieren kann. Wir zeigen dem Kunden diverse Möglichkeiten auf und setzen ihn mit
    den Geldgebern in Kontakt. Auch dies muss protokolliert werden (Finanzierungs-
    dokument, Starttermin, Darlehensbetrag, Darlehensrate, Tilgung, Zinsen).
4. Kauf bzw. Miete: Entscheidet sich der Kunde an einem Termin für einen Erwerb
    oder Miete einer Immobilie wird dies mit einem Vertrag dokumentiert und im Sys-
    tem inklusive des Kaufpreises und der Provision beziehungsweise der Warmmiete,
    Nebenkosten und Kaltmiete erfasst.

```
In der bisherigen Software gibt es keine Möglichkeit der Finanzierungsrechnung. Der ge-
samte Vermittlungsprozess kann nicht als eine Einheit erfasst werden und somit auch
```

Immobilienverwaltung Lastenheft

nicht gesucht werden. Der Mitarbeiter muss über diverse Transaktionen alle Informatio-
nen zusammensuchen und hat keinen zentralen Punkt zur Informationsgewinnung und
Informationspflege.
Weiterhin ist es nicht möglich dem Kunden direkt einen Mietvertrag oder Kaufvertrag
unterzeichnen zu lassen. Durch den Umweg über die Verwaltung, benötigt dies immer
eine gewisse Bearbeitungszeit. Es wäre wünschenswert, wenn der Beratungsmitarbeiter
Zugriff auf den Miet- oder Kaufvertrag erlangen kann.
**Kann ein Beratungsgespräch auch online stattfinden?**
Nein, ein Beratungsgespräch findet entweder telefonisch oder in einem unserer Bera-
tungscenter statt. Online kann nur ein Beratungsgespräch angefragt werden. Dies muss
aber nicht modelliert werden, sondern ist schon implementiert.
**Soll ein Vermittlungsprozess der Punkt für die Referenz weiterer Dokumente sein (
„Single Point of Reference“)?**
Der Vermittlungsprozess ist die zentrale Informationsstelle. Jedes Dokument oder jeder
Termin soll von diesem erreichbar sein, sodass eine einfache Navigation möglich ist.
**Was muss bei einer Besichtigung beachtet werden?**
Bei einer Besichtigung müssen mindestens ein Mitarbeiter und ein Interessent sowie eine
zu besichtigende Immobilie vorhanden sein. Über eine Besichtigung muss auch ein Do-
kument im Vermittlungsvorgang gespeichert werden, was den Ablauf der Besichtigung
beschreibt.
**Können mehrere Personen an einer Besichtigung teilnehmen? (Wenn ja, wie sollen die-
se Daten gespeichert werden, wenn die Personen keine Beziehung zueinander haben?)**
Eine Besichtigung kann mit mehreren Interessenten durchgeführt. Dabei wird im System
für jeden Interessenten mit eigenem Vermittlungsvorgang auch ein eigener Besichtigungs-
termin gepflegt, um eine klare Trennung der Dokumente zu erreichen.
Eine Kauf- bzw. Mietabwicklung beinhaltet die Abläufe nach der Kauf- bzw. Mietentscheidung
eines Interessenten. Dabei kommt es zu einem rechtsgültigen Kauf- bzw. Mietvertrag. Bei einer
Kaufabwicklung kommt ein Notarbesuch sowie evtl. eine Finanzierungsberechnung hinzu.
**Wie wird der Notarbesuch dokumentiert?**
Der Notarbesuch wird als Dokument an den Vermittlungsvorgang angehängt. Dabei wer-
den folgende Attribute gespeichert:

- Notar (Name, Anschrift)
- Interessent (Käufer, Mieter)
- Notarkosten
- Immobilie


Immobilienverwaltung Lastenheft

- Datum
- Eingescanntes Dokument
**Welche Daten werden bei einem Kauf erfasst?**
Bei einem Kauf muss auf jeden Fall der Notarbesuch dokumentiert werden. Weiterhin
wird ein Kaufvertrag dokumentiert, welcher auch dem Vermittlungsvorgang angehängt
wird. Dieser enthält Informationen über den Kaufbetrag, die Finanzierungsart und zu-
sätzliche Informationen.
**Sollen Notare auch im System gepflegt werden? (Wenn ja, welche Daten sollen über
einen Notar erfasst werden?)**
Ja Notare, werden als Personen im System gepflegt. Für einen Notar müssen folgende
Daten erfasst werden:
- Name (Vorname, Nachname)
- Anschrift (Straße, Hausnummer, Postleitzahl, Ort, Land)
- Berechtigungen
- E-Mail
- Telefon
**Welche Daten werden bei einer Miete erfasst?**
Für die Miete ist vor allem der Mietvertrag wichtig. Dieser wird dem Vermittlungsvor-
gang angehängt.
**Gibt es auch eine Übergabe und wie sieht der Ablauf aus?**
Ja, bei der Miete oder dem Kauf einer Immobilie wird diese den Mieter bzw. Käufer
übergeben. Dabei besichtigen der Mieter bzw. Käufer und ein Mitarbeiter die Immobilie
und dokumentieren den Zustand der Immobilie. Weiterhin werden anfällige Reparatu-
ren auch dokumentiert. Am Schluss muss dieses Dokument von beiden unterschrieben
werden.
**Soll auch eine Übergabe der Immobilie im System gepflegt werden?**
Eine Übergabe soll nicht im System direkt dargestellt werden. Es reicht, das Datum, den
Mitarbeiter, den Mieter und das eingescannte Übergabeprotokoll zu speichern.

```
/LF40/ Die Immobilien sollen mit all den Eigenschaften abgebildet werden, wie sie in gän-
gigen Immobilienseiten des Internets zu finden sind.
```
```
Von welchen Immobilienseiten im Internet ist hier die Rede?
Besonders gut gefällt uns Immobilienscout24. Andere zu bedenkende Internetseiten sind:
Immowelt, Immobilien.de und Immonet.
```

Immobilienverwaltung Lastenheft

```
Brauchen Sie keine speziellen Eigenschaften?
Alle oben genannten Eigenschaften sind standardmäßig für jede Immobilie gegeben. Be-
nötigt eine Immobilie weitere Eigenschaften, so können diese als Textform angegeben
werden.
```
```
/LF50/ Jeder Anbieter und Interessent wird in der Kundendatei verwaltet.
```
```
Ab welchem Zeitpunkt ist man ein Interessent? (Wenn man auf die Seite geklickt hat?
Sich anmeldet?)
Man wird als Interessent in dem System aufgenommen, wenn man eine Anfrage stellt.
Dies kann entweder über ein Kontaktformular oder ein persönliches bzw. telefonisches
Gespräch erfolgen.
Welche Daten sollen über einen Anbieter gespeichert werden?
Über einen Anbieter sind folgende Daten zu speichern:
```
- Name/Firma
- Anschrift (Straße, Hausnummer, PLZ, Ort)
- Privat (Geburtsdatum) oder Geschäftlich (Ansprechpartner)
- E-Mail
- Telefonnummer

```
Welche Daten sollen über einen Interessenten gespeichert werden?
```
- Name/Firma
- Anschrift (Straße, Hausnummer, PLZ, Ort)
- Privat (Geburtsdatum) oder Geschäftlich (Ansprechpartner)
- E-Mail
- Telefonnummer

```
/LF60/ Jeder Immobilie sollen alle Interessenten sowie die Anbieter zugeordnet sein. Dies
soll über Auswahllisten erfolgen. Dabei ist es uns wichtig, Interessenten für be-
stimmte Immobilien automatisch zu finden.
```
```
Was soll in dieser Aktion abgespeichert werden (gewünschtes Einzugs- /Kaufdatum,
Angebot)?
Wie schon zuvor erwähnt, soll es vor allem möglich sein, von einem Vermittlungsprozess
```

Immobilienverwaltung Lastenheft

```
auf alle notwendigen Daten zuzugreifen. Weiterhin sollen aber auch jeder Immobilie alle
Interessenten sowie die Anbieter zugeordnet werden. Dabei soll von der Immobilie auf
den zugehörigen Vermittlungsprozess zugegriffen werden.
Wie sollen Interessenten automatisch gefunden werden? Sollen aufgrund von Nutzer-
daten, Nutzer benachrichtigt werden, dass eine infrage kommende Immobilie zu Ver-
fügung steht?
Nein, dies ist nicht angedacht. Es soll möglich sein von einer Immobile alle Interessenten
zu bekommen. Dies ist mit automatisch finden gemeint.
```
```
/LF70/ Zur einfacheren Eingabe der Immobiliendaten soll es Auswahllisten für deren Ei-
genschaften geben. Die Auswahllisten sollen auf einfache Weise erweiterbar und für
sämtliche Mitarbeiter im System verfügbar sein.
```
```
Wie ist eine Auswahlliste aufgebaut und was soll vorgeschlagen?
Eine Auswahlliste bietet dem Mitarbeiter alle verfügbaren Vorschläge für den gegebenen
Kontext. Dabei kann der Mitarbeiter aus den Vorschlägen auswählen.
Wie werden Daten in einer Auswahlliste angezeigt?
Die einzelnen Werte in einer Auswahlliste sollten alphabetisch beziehungsweise nume-
risch sortiert angezeigt werden. Eine eigene Eingabe ist nicht erlaubt, sondern nur die
Auswahl aus der Liste.
Wer pflegt die Daten für die Auswahllisten?
Die Daten für die Auswahllisten werden durch einen Verwaltungsangestellten oder einem
Administrator gepflegt.
Wie sollen die Daten für die Auswahllisten gepflegt werden?
Die Daten für die Auswahllisten sollen in einer zusätzlichen Oberfläche gepflegt werden
können. In der alle Auswahllisten und ihre Daten präsentiert werden. Jeder Datensatz soll
geändert, gelöscht oder ein neuer hinzugefügt werden können.
Welche Eigenschaften brauchen Auswahllisten und welche nicht?
In einer Auswahlliste dürfen keine Duplikate vorkommen. Weiterhin darf aus einer Aus-
wahlliste immer nur ein einziger Eintrag ausgewählt werden.
Wie ist eine Auswahlliste einfach zu erweitern und was passiert, wenn ein Wert fehlt?
Eine Auswahlliste soll über ein separates Fenster erweitert werden können. Wenn es einen
Wert nicht gibt, der aber so speziell ist, dass es sich nicht lohnt, diesen in die Auswahlliste
mit aufzunehmen, dann soll einem Mitarbeiter die Option geboten werden, einen Freitext
einzugeben. Dieser Freitext wird jedoch nicht dauerhaft gespeichert und ist somit auch
nicht als weitere Option in der Auswahlliste verfügbar.
Sollen die Auswahlmöglichkeiten zuvor auf Konsistenz im Sinn des Datenbanksche-
mas geprüft werden?
```

Immobilienverwaltung Lastenheft

```
Ja, wenn ein Verwaltungsangestellter oder ein Administrator ein neuen Wert für eine Aus-
wahlliste einpflegt, dann soll dieser Wert zuerst geprüft werden, ob er überhaupt in den
anzuwendenden Datenbankfeld erlaubt ist. Ist dies nicht der Fall, soll eine Fehlermeldung
erscheinen und der Eintrag nicht hinzugefügt werden.
Sollen die freien Eingaben der Nutzer geprüft werden?
Hierbei gilt das gleiche, wie bei dem Einfügen eines neuen Wertes in die Auswahlliste. Es
wird auf Syntax, aber nicht auf Semantik geprüft.
/LF80/ Es soll ein einfach zu bedienender Finanzierungsrechner verfügbar sein, der Annui-
tätendarlehen für den Interessenten berechnen kann.
Wird die Immobilienfinanzierung mit Partner durchgeführt? (Wenn ja, welche Partner
sind dies?)
Bei der Immobilienfinanzierung greifen wir auf öffentlich zugängliche Daten von Banken
und Geldgebern über eine Schnittstelle der Banken zu. Wir bieten dem Kunden verschie-
dene Möglichkeiten und haben auch Ansprechpartner bei den Geldgebern, wobei diese
keine Partner von uns sind. Diese Ansprechpartner müssen nicht im System gepflegt wer-
den.
Gibt es verschiedene Angebote, die verglichen werden sollen?
Ja es gibt Angebote, welche verglichen werden sollen. Um dies umzusetzen greifen wir
aktuell auf einen externen Service zu, welcher die Daten in unser System importiert. Diese
Schnittstelle soll auch weiterhin genutzt werden. Darunter sind Angebote der Sparkasse,
ING-DiBa, Volksbank, BB-Bank eG und der Commerzbank. Alle diese Angeboten müssen
intern verglichen und gefiltert werden.
Wann werden die Finanzierungsdaten der Anbieter aktualisiert?
Eine Aktualisierung der Finanzierungsdaten findet automatisch alle zwei Stunden statt.
Außerhalb davon sollen die Daten in dem lokalen System gespeichert und zu Verfügung
gestellt werden.
Was für Immobilienfinanzierungsarten sollen berücksichtigt werden?
Wir bieten unseren Kunden Annuitätendarlehen, Festdarlehen, Ratenkredite als Nach-
rangdarlehen und KfW Fördermittel. Weiterhin beraten wir unsere Kunden auch beim
Eigenkapital, insbesondere bei Bausparguthaben und Fördermitteln.
Welche Daten werden für eine Finanzierung benötigt und was wird ausgegeben?
Jede Finanzierungsrechnung startet mit der Eingabe der Eckdaten (Kaufpreis, Laufzeit
und Starttermin). Als Ausgabe werden die einzelnen Angebote (Zinsen, Tilgung, Rest-
schuld, getilgter Betrag) präsentiert.
Was unterscheidet die Immobilienfinanzierungsarten?
Die gegebenen Immobilienfinanzierungsarten werden mit folgenden unterschiedlichen
Daten ausgestattet:
```

Immobilienverwaltung Lastenheft

- Eigenkapitalfinanzierung: Förderbeitrag, Sonderzahlung, Guthabenzins und Regel-
    sparbeitrag
- Bausparguthaben
- Fördermittel: Tilgungszuschuss
- Fremdkapitalfinanzierung: Kreditsumme, Zinssatz und Laufzeit
- Festdarlehensfinanzierung: Festdarlehensbetrag
- Annuitätendarlehen: Jährliche Annuität
- Nachrangdarlehen: Jährliche Annuität
- KfW Fördermittel: Jährliche Annuität und Tilgungszuschuss

```
Werden die Berechnungen von Immobilienfinanzierungen von einem externen Dienst-
leister durchgeführt oder muss diese Funktion in der Software realisiert werden?
Die Eckdaten der Immobilienfinanzierungen werden über eine Schnittstelle in das System
importiert und regelmäßig im Zeitintervall von 2 Stunden aktualisiert. Diese Schnittstelle
muss angebunden werden. Das berechnen, vergleichen und filtern von Angeboten muss
vom System erfolgen. Dies ist Hauptbestandteil der angeforderten Lösung. Dabei soll auf
eine zentrale Datenbasis zugegriffen werden können (Server), damit sämtliche Daten von
mehreren PCs und Laptops aus verwaltet werden können.
Wie soll der Finanzierungsrechner aussehen? Soll er sich von der anderen Website ab-
grenzen oder eingebunden sein? Gibt es verschiedene Finanzierungsarten oder diverse
Anbieter, die verglichen werden sollen?
Der Finanzierungsrechner soll auf einer eigenen Oberfläche präsentiert werden. Dazu
werden die Daten von der Schnittstelle geladen und sollen dann in einer Übersicht darge-
stellt werden, wobei sie nach Gesamtkosten sortiert werden sollen, damit man sie schnell
vergleichen kann. Der Finanzierungsrechner soll sich in das gesamte System einfügen.
Gibt es noch weitere Kriterien, um Finanzierungsangebote zu vergleichen?
Standardmäßig werden die Finanzierungsangebote über die Gesamtkosten verglichen. Es
ist aber auch möglich das Finanzierungsangebot über die Restschuld, den getilgte Betrag
oder der monatlichen Darlehensrate zu bewerten. Dies muss in der Software aber nicht
abgebildet werden
Welche Kenntnisse bringen ihre Mitarbeiter bei Immobilienfinanzierung mit?
Unsere Mitarbeiter bringen fundierte und geschulte Kenntnisse mit. Die Software muss
ihnen nicht erklären, wie eine bestimmte Finanzierungsrechnung funktioniert. Es soll le-
diglich das Ergebnis und die Eingaben angezeigt werden.
```

Immobilienverwaltung Lastenheft

```
/LF90/ Schließlich sollen Rechnungen und Mahnungen für die einzelnen Vermittlungsvor-
gänge erstellt und verwaltet werden können.
```
```
Wann wird eine Rechnung und eine Mahnung erstellt?
Eine Rechnung wird erstellt, wenn Kosten anfallen, dies ist nur nach einer erfolgreichen
Vermittlung (Miete oder Verkauf) gegeben. Eine Mahnung wird bei Überschreiten der in
der Rechnung angegeben Frist verschickt oder wenn die Frist einer Mahnung überschrit-
ten wurde.
Welche Daten werden bei einer Rechnung übergeben?
Eine Rechnung besteht aus nachfolgenden Daten:
```
- Rechnungssteller (Name, Anschrift)
- Rechnungsempfänger (Name, Anschrift)
- Rechnungsnummer
- Rechnungsbetrag
- Skonto
- Bezahlungstermin
- Rechnungsstellen
- Referenzobjekte (Mitarbeiter, Immobilie, Vermittlungsvorgang)
- Additive Informationen in Textform

```
Welche Daten werden bei einer Mahnung übergeben?
Eine Mahnung gehört genau zu einer Rechnung, wobei auf eine Rechnung bis zu 3 Mah-
nungen folgen können. Eine Mahnung besteht aus den nachfolgenden Daten:
```
- Mahnungssteller (Name, Anschrift)
- Mahnungsempfänger (Name, Anschrift)
- Mahnungsnummer
- Betreffende Rechnungsnummer
- Vorgehende Mahnungsnummer
- Bezahlungstermin
- Mahnungsbetrag


Immobilienverwaltung Lastenheft

- Bezahlungstermin
- Additive Informationen in Textform

```
/LF100/ Vor dem Hinzufügen von neuen Daten soll eine Überprüfung stattfinden, ob diese
schon vorhanden sind. Das gilt in besonderem Maße für Interessenten, Anbieter und
Immobilien.
```
```
Wann ist ein Interessent schon vorhanden?
Zwei Einträge von Interessenten sind gleich, wenn sowohl der Name, die Anschrift und
das Geburtsdatum identisch sind.
Wann ist ein Anbieter schon vorhanden?
Zwei Einträge von Anbietern sind gleich, wenn sowohl der Name und die Anschrift des
Anbieters gleich sind.
Wann ist eine Immobilie schon vorhanden?
Zwei Einträge von Immobilien sind gleich, wenn sowohl die Anschrift der Immobilie und
bei Wohnungen noch die Wohnungsnummer gleich sind.
Für welche Gruppen gilt diese Überprüfung noch?
Eine weitere Überprüfung soll bei allen eingegebenen Daten erfolgen. Aber hier gilt: Zwei
Einträge sind gleich, wenn sie sich in allen Attributen gleichen.
Was soll passieren, wenn ein Eintrag schon vorhanden ist?
Wenn ein Eintrag vorhanden ist, soll dieser nicht persistiert werden. Dem Mitarbeiter soll
eine Meldung angezeigt werden und der gegebene Eintrag angezeigt werden, sodass er
ihn gegebenenfalls bearbeiten kann.
```
#### 2.2.6 Pro duktdaten

```
/LD10/ Die Daten sollen zentral verwaltet und in einer Datenbank abgespeichert werden.
```
```
Gibt es Einschränkungen in der Art der Speicherung (Datenbanktyp, Server, Betriebs-
system) und in den verfügbaren Ressourcen?
Wir besitzen einen Server mit eingeschränkter Rechenleistung. Dies sollte aber bei der
kleinen Anzahl an zu verarbeiteten Daten kein Problem darstellen. Beim Datenbanktyp
haben wir keine Vorgaben. Sie müssen nur mit Java und Linux kompatibel sein.
Was bedeutet zentral?
Die Daten sollen an einem Ort auf einem Server abgespeichert werden, sodass sie von
überall abrufbar sind. Dieser Zugriff kann sowohl über Schnittstellen als auch direkt
durchgeführt werden.
```

Immobilienverwaltung Lastenheft

#### 2.2.7 Pro duktleistungen.

```
/LL10/ Das Laden gewünschter Daten soll für eine sinnvolle Benutzung im Sekundenbe-
reich erfolgen.
```
```
Was ist im Sekundenbereich (0 bis 60 Sekunden)? Sollen ggf. nur ein Teil der Daten
geladen und später nachgeladen werden (lazy loading)?
Die bevorzugte Ladedauer sollte unter 10 Sekunden liegen. Sollte es doch öfters dazu
kommen, dass das Laden der Daten länger dauert, wäre es sinnvoll die Daten in Teilen zu
laden.
```
```
/LL20/ Die Anzahl der zu verwaltenden Elemente wird auf ca. 100000 geschätzt.
```
```
Soll es möglich sein, diese Zahl in der Zukunft auch zu erweitern?
Die Anzahl der aktiven Daten bleibt relativ konstant. Die passiven Daten, also Daten die
nicht mehr verändert werden, steigt mit Dauer des Betriebes. Jedes Jahr werden nicht
mehr gebrauchte Einträge, welche minimal 10 Jahre alt sind, aus der Datenbank genom-
men und in einem Backup gespeichert.
```
```
/LL30/ Die Daten müssen bei unserer eigenen Verwendung aus rechtlichen Gründen 10 Jah-
re online verfügbar sein.
```
```
Sollen sie online, extern verfügbar sein oder nur intern?
Die sollen nur intern für Mitarbeiter zu Verfügung stehen. Es gelten die gleichen Regeln,
wie beim generellen Online-Zugriff, die Mitarbeiter die extern zugreifen können diese nur
einsehen. Eine Änderung über die externe Schnittstelle ist wie schon beschrieben nicht
erlaubt.
Welche Daten müssen 10 Jahre verfügbar sein?
Es sollen alle im System gespeichert Daten 10 Jahre verfügbar sein.
Soll das über eine zusätzliche Oberfläche erfolgen?
Nein alle Daten sollen über die gleiche Oberfläche gesucht werden.
```
```
/LL40/ Um bei Anschaffungen und Neuerungen flexibel zu bleiben, ist auf Plattformunab-
hängigkeit besonders zu achten.
```
```
Für was gilt die Plattformunabhängigkeit? Nur für die interne Software? Auch für den
Server oder die Internetanwendung?
Der Server und die Datenbank müssen auf einen Linux-Server laufen und kompatibel mit
Java sein. Die interne Software soll in Java programmiert werden und damit auf allen
Java-kompatibel Geräten laufen, genauso wie die Internetanwendung.
```

Immobilienverwaltung Lastenheft

```
Produktqualität sehr gut gut normal nicht relevant
Funktionalität X
Zuverlässigkeit X
Effizienz X
Benutzbarkeit X
Änderbarkeit X
Übertragbarkeit X
Gestaltung X
```
#### 2.2.8 Qualitätsanforderung

```
Inwiefern ist die Effizienz nicht wichtig?
Die Wartezeit kann im Sekundenbereich liegen. Die Mitarbeiter sollen aber dennoch nicht
in ihrem Arbeitsprozess eingeschränkt werden, sodass ein zügiger Ablauf des Tagesge-
schäfts gewährleistet ist.
Was bedeutet eine normale Änderbarkeit? Soll die Oberfläche gleich bleiben oder die
Basisfunktionen und Datenstruktur?
Es sollen Feinheiten verändert werden können. Dazu zählt hauptsächlich die Oberfläche,
die Datenbasis und grundlegende Funktionen bleiben unverändert. Es könnten jedoch
neue Funktionen hinzukommen, welche aktuell nicht geplant sind.
Warum ist die Zuverlässigkeit nur gut? Kann das System manchmal zur Wartung nicht
zur Verfügung sein? Dürfen Daten verloren gehen?
Während den Arbeitszeiten (7 bis 20 Uhr) muss den Mitarbeitern ein zuverlässiges Sys-
tem bei ihrem Tagesgeschäft helfen. Nach dieser Zeit, kann das System auch langsamer
reagieren, falls z.B. die Datenbank aufgeräumt oder Backups gemacht werden müssen.
Die Daten müssen 10 Jahre verfügbar bleiben. Bei der Speicherung und Sicherung der
Daten darf kein Fehler passieren.
Was ist bei einer normalen Übertragbarkeit gemeint?
Es soll möglich sein, angelegte Rollen von einer Gruppe an eine andere zu übertragen, da
diese aber auch von Hand angelegt werden können ist dieser Punkt in der Priorität etwas
untergeordnet.
```

Immobilienverwaltung Analyseklassendiagramm

## 3 Analyseklassendiagramm

Das Analyseklassendiagramm umfasst sämtliche im Analyseheft festgehaltenen Entitäten. Es
stellt die Beziehungen der verschiedenen Objekte in der Immobilienverwaltungssoftware über-
sichtlich dar. Die Objekte ergeben sich aus der vorherigen Analyse des Lastenheftes und der
Betrachtung der verschiedenen Anwendungsfälle.

### 3.1 AnalysederverschiedenenObjekte

```
Abbildung 3.1: Analyseklassendiagramm der Immobilienverwaltungssoftware
```
Die verschiedenen beteiligten Objekte im Analyseklassendiagramm werden im nachfolgenden
noch einmal detailliert aufgeführt, dabei wird auch auf deren Beziehungen zu anderen Objek-
ten näher eingegangen. Bei der Darstellung wurde versucht einige Objekte, aus Gründen der
Übersichtlichkeit, zu gruppieren. In der Abbildung 3.1 wurde durch farbliche Visualisierung
versucht, diese Gruppierungen deutlich hervorzuheben.


Immobilienverwaltung Analyse der verschiedenen Objekte

Immobilienverwaltung
Das Objekt der Immobilienverwaltung ist der zentrale Hauptpunkt der Komponente, von
diesem Punkt wird ein Zugriff auf viele Objekte ermöglicht. Aus Gründen der Übersicht-
lichkeit wurden die Beziehungen zum Kunden, Mitarbeiter und einer Finanzierungsge-
sellschaft jedoch nicht abgebildet. Die Immobilienverwaltung speichert darüber hinaus
Eigenschaften über das Unternehmen, darunter fällt: Firma, Unternehmensform, An-
schrift, E-Mail, Telefon und die Adresse der Webseite.

Immobilie
Eine Immobilie enthält alle grundlegenden Informationen. Zu diesen essentiellen Infor-
mationen gehören laut der Lastenheftanalyse: Medien, Adresse, Lageinformationen, Ver-
kaufstermin, Kategorie, Preis, Fläche, Baujahr, Objektzustand, Modernisierung/Sanie-
rung und eine Beschreibung als Freitext. Eine Immobilie kann weitergehend speziali-
siert werden, indem man diese als Kauf- oder Mietimmobilie, sowie als Privat- oder
Geschäftsimmobilie in der Software anlegt. Grundsätzlich sind alle Immobilien in der
Immobilienverwaltung verfügbar, dabei können einzelne schon mit einer Vermittlung
verknüpft sein. Des Weiteren ist es auch möglich, dass Immobilien einem oder mehrere
Projekte zugewiesen sind.

Kaummobilie
Eine Immobilie kann zu einer Kaufimmobilie spezialisiert werden. Dabei wird als zu-
sätzliches Attribut der Kaufpreis und das Hausgeld der Immobilie mit gespeichert. Von
dieser Kaufimmobilie erben wiederum die einzelnen Immobilienarten. Somit ist eindeu-
tig sichergestellt, dass es sich bei der Immobilie um einen Immobilienkauf handelt.

Mietimmobilie
Des Weiteren kann eine Immobilie auch zu einer Mietimmobilie spezialisiert werden.
Sollte dies durchgeführt werden, wird im System zusätzlich: Kaltmiete, Nebenkosten,
Warmmiete und Kaution gespeichert. Somit kann man eindeutig feststellen, dass es sich
um die Vermietung einer Immobilie handelt.

Privat-undGeschäftsimmobilie
Bei der Privat- und Geschäftsimmobilie werden Notizen spezifiziert, welche die Nutzung
der Immobilie entweder für den privaten oder gewerblichen Zweck freigeben. Diese wer-
den an die Kauf- und Mietimmobilie vererbt. Bei der Geschäftsimmobilie kann auch die
Geschäftsart angegeben werden.

Immobilienarten
Alle nachfolgenden Arten einer Immobilie erben entweder von der Kauf- oder der Mie-
timmobilie (welche wiederum von Privat- oder Geschäftsimmobilie erben), somit besit-


Immobilienverwaltung Analyse der verschiedenen Objekte

```
zen sie unterschiedliche Attribute. Essentielle Attribute von der Immobilie besitzen sie
jedoch alle.
```
- **Grundstück** - Bei einem Grundstück wird die Erschließung und die Nutzung in den
    Eigenschaften festgehalten.
- **Garage** - Eine Garage kann zusätzlich die Garagenart, Eigenschaften zum Garagen-
    boden sowie die Anzahl der Autostellplätze enthalten. Somit können Kunden mit
    besonderen Wünschen zur Garage diese direkt mithilfe eines Sachbearbeiters filtern
    lassen.
- **Stellplatz** - Für einen Stellplatz ist die Art ein entscheidendes Kriterium. Dieser
    Stellplatz kann sowohl klassisch für ein Automobil, Motorrad oder Fahrrad angelegt
    werden. Des Weiteren sind aber auch Stellplätze für ein Boot oder Flugzeug möglich.
    Die Immobilienverwaltungssoftware kann viele unterschiedliche Arten darstellen,
    deshalb wird hier auch der Boden angegeben. Sollte es sich hierbei um einen Boot-
    stellplatz handeln, wird dort kein Wert eingetragen.
- **Garten** - Ein Garten bekommt alle relevanten Attribute direkt von der Immobilie
    selbst vererbt, deswegen wird hier nur die Art des Garten, die Erschließung und die
    Nutzungsart zusätzlich angegeben.
- **Wohnung** - Bei der Wohnung werden weitere Eigenschaften wie beispielsweise: Eta-
    ge, Etagenanzahl, Ausstattungstyp, Heizungstyp gespeichert. Darüber hinaus ist die
    Anzahl der Zimmer, Schlafzimmer, Badezimmer und Abstellkeller angegeben. Wei-
    tere Angaben wie der Energieträger und der Energieausweis (welcher seit 01. Januar
    2009 vorgeschrieben ist) sind auch hier zu finden.
- **Gebäude** Bei einem Gebäude müssen die Anzahl der Etage, Zimmer, Schlafzimmer,
    Badezimmer und Abstellkeller angegeben werden. Ein Energieträger und der Ener-
    gieausweis sind natürlich auch hier als Attribute verfügbar. Neben diesen Eigen-
    schaften wird auch die Art des Gebäudes spezifiziert, sowie die den Ausstattungs-
    und Heizungstyp. Daneben kann ein Gebäude auch über einen Garten verfügen.
    Sollte dies der Fall sein, kann hier die Fläche des Gartens angegeben werden.

Vermittlung
Die Vermittlung ist ein zentraler Punkt in der Software und beinhaltet Informationen
rund um die Vermittlung einer Immobilie. Die Vermittlung hat Beziehungen zu der Im-
mobilienverwaltung, zu einzelnen Immobilien, dem Interessenten, Sachbearbeiter(n), Im-
mobilienfinanzierung(en), der Übergabe, Besichtigung(en) und dem Abschluss.

Abschluss
Bei einem Vermittlungsabschluss wird nur das Datum der Vermittlung gespeichert. Die-


Immobilienverwaltung Analyse der verschiedenen Objekte

```
ses Objekt wird auch zur Vererbung verwendet, um doppelte Attribute in dem Verkauf
und der Miete zu vermeiden.
```
Verkauf
Der Verkauf erbt vom Abschluss und beinhaltet sowohl den Kaufpreis als auch die Pro-
vision eines Verkaufs. Zwischen dem Verkauf und dem Kaufvertrag besteht eine Bezie-
hung, da zu jedem Verkauf auch ein Dokument existieren muss, dass den Kauf bestätigt.

Miete
Bei dem Objekt Miete werden die Warmmiete, Nebenkosten und auch Kaltmiete festge-
halten. Das Datum wird wie auch beim Verkauf direkt vom Abschluss vererbt. Die Miete
wird anhand eines Mietvertrags festgehalten.

Beratung
Die Beratung kann optional durchgeführt werden und speichert das Beratungsdatum,
den Zweck, das Ergebnis und weitere wichtige Bemerkungen für eine Vermittlung. Alle
Merkmale werden in einem Beratungsdokument festgehalten, welches zu einer Beratung
gehört.

Besichtigung
Besichtigungen können von einem Interessenten beliebig oft oder auch gar nicht durchge-
führt werden. Dabei wird das Besichtigungsdatum, der Kundenwunsch sowie Kommen-
tare festgehalten. Um eine Besichtigung später auch in der Rechnung geltend zu machen,
wird diese in einem Besichtigungsprotokoll vermerkt.

Üb ergab e
Bei einer Immobilienübergabe wird das Datum der Übergabe als auch mögliche Mängel
der Immobilie festgehalten. Dies passiert mithilfe eines Übergabeprotokolls.

Notarb esuch
Bei einem Verkauf ist ein Notarbesuch Pflicht. Somit besitzt dieser Besuch sowohl eine
Verbindung zum Verkauf, als auch zu einem Notar, welcher diesen Termin durchführt.
Dabei werden die Notarkosten und das Datum des Termins festgehalten. Alle Angaben
finden sich in einem Notarprotokoll wieder.

Immobiliennanzierung
Bei der Vermittlung können verschiedene Immobilienfinanzierungen durchgeführt wer-
den. Dabei wird der Kaufpreis, die Laufzeit und der Starttermin festgelegt. Daneben ist
wichtig die Höhe der Zinsen, Tilgung, Restschuld als auch den schon getilgten Betrag
festzuhalten. Somit kann ein Interessent direkt sehen, welches Angebot für ihn am besten


Immobilienverwaltung Analyse der verschiedenen Objekte

```
geeignet ist. Darüber hinaus können auch externe Finanzierungsgesellschaften beauftragt
werden.
```
Eigenkapitalnanzierung
Eine Finanzierung durch Eigenkapital erbt alle essenziellen Attribute direkt von der Im-
mobilienfinanzierung. Darüber hinaus werden folgende Eigenschaften: Regelsparbetrag,
Sonderzahlung, Guthabenzins und der Förderbeitrag vermerkt. Diese Art der Finanzie-
rung kann wiederum in die zwei nachfolgenden Arten untergliedert werden:

- **Bausparguthaben** - Beinhaltet selbst keine zusätzlichen Eigenschaften. Aus diesem
    Grund wird bei diesem Objekt nur die Finanzierung berechnet.
- **Fördermittel** - Für die Fördermittel muss ein Tilgungszuschuss festgelegt werden,
    welcher auch in die Berechnung der Finanzierung mit einfließt.

Fremdkapitalnanzierung
Bei einer Fremdkapitalfinanzierung muss die Höhe der Kreditsumme, als auch der Zins-
satz sowie die Laufzeit bekannt sein. Eine Fremdfinanzierung ist jedoch laut Lastenheft-
analyse nicht detailliert genug. Aus diesem Grund gibt es vier Verfeinerungen, welche
alle von der Fremdkapitalfinanzierung erben:

- **Festdarlehensfinanzierung** - Bei dieser Finanzierungsmethode muss der Festdar-
    lehnsbetrag angegeben werden. Zudem ist der gesamte Darlehnsbetrag erst am En-
    de der Darlehnslaufzeit fällig.
- **Annuitätendarlehen** - Bei dieser Finanzierung gibt es konstante Rückzahlungsbei-
    träge, welche in der Annuität festgehalten werden. Um zu beschreiben, dass die An-
    nuität jährlich verrichtet werden muss, wurde die Eigenschaft um das Wort „jähr-
    lich“ ergänzt.
- **KfW Fördermittel** - Bei einer Immobilie können auch KfW Fördermittel beantragt
    werden. Diese Förderprogramme sind für Teilfinanzierungen von Wohnimmobilien
    vorgesehen und speichern sowohl die Annuität als auch den Tilgungszuschuss.
- **Nachrangdarlehen** - Ist ein Finanzierungsinstrument, das im Falle einer Liquidation
    oder Insolvenz im Rang hinter anderen Forderungen gegen das schuldende Unter-
    nehmen zurücktreten. Dabei wird nur die Annuität gespeichert.

Mitarb eiter
Über jeden Mitarbeiter werden im System folgende Eigenschaften gespeichert: Name,
Anschrift, Geburtsdatum, Geburtsort, Beschäftigungsgrad, Ausbildung, Telefon, Mobil-
telefon, E-Mail, Benutzername und das Passwort. Darüber hinaus kann ein Mitarbeiter
einer Gruppe zugeordnet werden. Neben dieser Gruppe ist jeder Mitarbeiter mindestens


Immobilienverwaltung Analyse der verschiedenen Objekte

```
einem Bereich zugeordnet und kann weiteren Berechtigungsgruppen zugewiesen wer-
den, welche nach einem Jahr ablaufen.
```
- **Sachbearbeiter** - Ein Sachbearbeiter kann als Berater eine Vermittlung durchführen.
    Deshalb werden für jeden Sachbearbeiter auch Expertengebiete und Kompetenzen
    gespeichert. Somit kann der Erfahrungsgrad jedes Sachbearbeiters indirekt festge-
    halten werden.
- **Gruppenleiter** - Ein Gruppenleiter ist verantwortlich für alle Mitglieder einer be-
    stimmten Gruppe. Dabei kann es auch sein, dass ein Gruppenleiter aktuell keiner
    Gruppe zugewiesen ist.
- **Bereichsleiter** - Ein Bereichsleiter leitet genau einen Bereich und ist verantwortlich
    für alle Bereichsmitglieder.
- **Verwaltungsangestellter** - Ein Verwaltungsangestellter erbt alle Eigenschaften von
    Mitarbeiter und speichert darüber hinaus auch noch Informationen und den aktuel-
    len Einsatz, wo der Verwaltungsangestellter eingesetzt wird.
- **Administrator** - Der Administrator hat neben den Eigenschaften eines Mitarbeiters
    auch ein Attribut mit dem Masterkey oder auch Superpasswort genannt.

Notar
Bei einem Notar wird der Name, Anschrift, Kontaktdaten (E-Mail und Telefon) und Be-
rechtigungen gespeichert. Dabei kann ein Notar bei keinem oder mehreren Notarbesu-
chen beteiligt gewesen sein.

Finanzierungsgesellschaft
Die Finanzierungsgesellschaft beinhaltet alle Informationen rund um diesen externen
Anbieter. In der Software werden über das andere Unternehmen folgende Daten gespei-
chert: Firma, Unternehmensform, Anschrift, Telefon, E-Mail, Webseite und der Ansprech-
partner im konkreten Finanzierungsfall.

Kunde
Ein Kunde kann sowohl als Interessent als auch Anbieter im System gepflegt sein und hat
somit eine Beziehung zu Vermittlungen, Immobilien als auch Projekten. Dabei wird sei-
ne Anschrift, E-Mail sowie die Telefonnummer gespeichert. Diese Eigenschaften werden
auch an den Privat- und Geschäftskunden weiter vererbt.

- **Privatkunde** - Bei einem Privatkunden sollen zusätzlich der Name und Geburtsda-
    tum gespeichert werden.
- **Geschäftskunde** - Bei einem Geschäftskunden sollen die Firma, Webseite, Unter-
    nehmensform, Geschäftsart als auch ein Ansprechpartner vermerkt werden.


Immobilienverwaltung Analyse der verschiedenen Objekte

Berechtigungsgrupp e
Diese Berechtigungsgruppe ist die Verbindung zwischen einem Mitarbeiter und einer
Berechtigung. Diese Berechtigungsgruppe muss den Zweck als auch eine Beschreibung
der Funktionen beinhalten.

Zuweisung
Die Berechtigung kann maximal nur ein Jahr vergeben werden. Danach verliert der Mit-
arbeiter diese Zuweisung der Berechtigung und muss diese neu beantragen. Das Ablauf-
datum sowie das Weitervergaberecht wird über die Zuweisung geregelt.

Berechtigung
Eine Berechtigung hat drei unterschiedliche Ausprägungen, dabei kann es sich um einen
Lesezugriff, Schreibzugriff als auch um einen Erstellungszugriff handeln. Die Berechti-
gung hat deshalb auch Beziehungen zu Berechtigungsgruppen, Immobilien, Kunden und
Vermittlungen. Aus Gründen der Übersichtlichkeit ist im Analyseklassendiagramm nur
die Beziehung zu den Berechtigungsgruppen dargestellt.

Grupp e
Eine Gruppe kann aus mehreren Mitarbeitern bestehen, wobei ein Gruppenmitglied der
Gruppenleiter ist. Gruppen können verschiedenen Projekten zugeordnet werden, des-
halb ist der Zweck und eine Beschreibung der Gruppe wichtig zur klaren Unterscheidung
von anderen Gruppen.

Bereich
Um die Firma besser organisieren zu können sind die Mitarbeiter gewissen Bereichen
zugeordnet. Dabei ist immer ein Bereichsmitglied auch ein Bereichsleiter, welcher die
Verantwortung für den Bereich übernimmt. Ein Bereich speichert zusätzlich den Zweck,
den Fachbereich, die Aufgabenbeschreibung und die Beschreibung des Bereichs.

Projekt
Ein Projekt muss zumindest aus einem Kunden oder einer Immobilie bestehen. Dabei
muss bei einem Projekt der Zweck und die Beschreibung angegeben werden. Ein Projekt
ist zur besseren Übersicht, wenn mehrere Gruppen an einem Thema arbeiten müssen.

Dokument
In der Immobilienverwaltungssoftware muss alles dokumentiert werden. Um das zu er-
möglichen wird das Dokument mit seinen Attributen: Dokumentenname, Erstellungsda-
tum, Änderungsdatum, Autor und Informationen zur Vererbung für Verträge und Pro-
tokolle verwendet. Die nachfolgenden Objekte erweitern das Dokument um weitere Ei-
genschaften.


Immobilienverwaltung Analyse der verschiedenen Objekte

- **Kaufvertrag** - Im Kaufvertrag wird das Dokument als auch wichtige Kaufinforma-
    tionen gespeichert. Dabei besteht zu genau einem Kaufvertrag auch genau ein Ver-
    kauf einer Immobilie.
- **Mietvertrag** - Der Mietvertrag beinhaltet das Dokument sowie weitere Mietinfor-
    mationen. Für einen Mietvertrag gibt es genau eine Vermietung.
- **Übergabeprotokoll** - Das Übergabeprotokoll beinhaltet das Übergabedokument, in
    diesem befinden sich Informationen rund um die Übergabe. Für jede Übergabe wird
    ein solches Protokoll angelegt.
- **Notarprotokoll** - Ein Notarbesuch muss auch in einem Notarprotokoll festgehalten
    werden. Dabei wird das Notardokument als zusätzliches Attribut gespeichert.
- **Beratungsprotokoll** - Für das Ergebnis, als auch den Zweck und die Bemerkungen
    bei einer Beratung, wird das Beratungsprotokoll benötigt. Für die Beratung eines
    Interessenten wird diese Dokument angelegt um wertvolle Ergebnisse festzuhalten.
- **Besichtigungsprotokoll** - Für alle Besichtigungen die ein Interessent durchführt
    müssen Kundenwünsche und Kommentare festgehalten werden, sodass ein Sachbe-
    arbeiter passende Immobilien finden kann. Um dies zu dokumentieren wird hierfür
    ein Besichtigungsprotokoll im System angelegt.
- **Finanzierungsprotokoll** - Sollte eine Finanzierung in Anspruch genommen werden,
    müssen das Finanzierungsdokument, der Starttermin, der Darlehnsbetrag, die Dar-
    lehnsrate als auch die Tilgung und die Zinsen schriftlich in einem Finanzierungs-
    protokoll erfasst werden.
- **Rechnung** - Um eine Vermittlung auch dem Kunden in Rechnung stellen zu können
    werden weitere Eigenschaften in dem Rechnungsobjekt zusammengefasst. Dazu
    zählen: Rechnungssteller, Rechnungsempfänger, Rechnungsnummer, Rechnungsbe-
    trag, Skonto sowie der Bezahlungstermin. Jede Rechnung besitzt darüber hinaus
    eine Beziehung zu einer oder mehreren Rechnungsstelle(n) als auch zu einer Ver-
    mittlung.
- **Mahnung** - Sollte eine Rechnung nicht bezahlt werden, wird eine Mahnung dem In-
    teressenten zugestellt. Diese beinhaltet Informationen über: Mahnungssteller, Mah-
    nungsempfänger, Mahnungsbetrag, Mahnungsnummer, Bezahlungstermin und be-
    sitzt eine Beziehung zu der Originalrechnung, sowie zu potentiell vorher versende-
    ten Mahnungen.

Rechnungsstelle
Eine Rechnungsstelle wird im System mit ihrer Nummer, Betrag und der Anzahl erfasst.
Des Weiteren besitzt sie eine Beziehung zur Rechnung und zu dem Rechnungsobjekt.


Immobilienverwaltung Verwendete Analysemuster

Rechnungsobjekt
Ein Rechnungsobjekt wird mit Bezeichnung und Preis im System eingepflegt. Dabei kann
eine Beziehung zu einer Rechnungsstelle bestehen. Jedoch kann ein Rechnungsobjekt nur
einer Rechnungsstelle zugeordnet werden.

### 3.2 VerwendeteAnalysemuster

Im Analyseklassendiagramm wurden unterschiedliche Analysemuster verwendet um die Ob-
jekte der Lastenheftanalyse zu klassifizieren und zu modellieren. Analysemuster sind bewähr-
te, schematische Lösungen für eine Menge verwandter Probleme und bieten sich bei der Mo-
dellierung an, um die Übersichtlichkeit des Diagramms zu fördern und die Semantik zu unter-
stützen. Wir haben die nachfolgenden fünf Analysemuster im Analyseklassendiagramm ein-
gearbeitet.

#### 3.2.1 Liste.

Bei der Rechnungserstellung wurde das Analysemuster der Liste eingeführt. Mehrere Rech-
nungsobjekte sind in einer Komposition als Listenelemente zusammengefasst. Im konkreten
Beispiel sind mehrere Rechnungsobjekte zu einer Rechnungsstelle zusammengefasst. Die Rech-
nung selbst kann dabei wieder aus mehreren Rechnungsstellen zusammengefasst sein.

#### 3.2.2 Baugrupp e

Es wurde eine abgeschwächte Version einer Baugruppe bei dem Objekt der Vermittlung imple-
mentiert. Die Vermittlung selbst kann wieder in unterschiedliche Teile untergliedert werden,
wobei einzelne Teile von der Vermittlung als Ganzes abhängig sind. Dabei sind einige Teile der
Vermittlung eines anderen Typs, was die Baugruppe auch zulässt. Eine Vermittlung (hier mit
Blick auf die Baugruppe) kann laut unserem Analyseklassendiagramm somit aus folgenden
Bestandteilen bestehen: Abschluss, Beratung, Besichtigung, Übergabe und Immobilienfinan-
zierung.

#### 3.2.3 Ko ordinator

Das Analysemuster des Koordinators wurde bei der Zuweisung implementiert. Sodass die Be-
rechtigung nur für einen gewissen Zeitraum gültig ist, musste zwischen der Berechtigungs-
gruppe und dem Mitarbeiter ein Koordinator eingepflegt werden. Die Zuweisung beinhaltet
zusätzliche Attribute, welche für die Assoziation zu speichern sind, aber zu keiner der beiden
beteiligten Klassen gehören. Für die Zuweisung sind Beziehungen wichtig, deshalb verweist
sie auf genau zwei Objekte, welche sie miteinander verbindet.


Immobilienverwaltung Verwendete Analysemuster

#### 3.2.4 Rolle.

Rollen wurden an mehreren Stellen im Analyseklassendiagramm verwendet, deshalb werden
hier zwei Stellen differenziert betrachtet:

1. Eine Verwendung von Rollen ist zum Beispiel beim Kunden sehr deutlich zu erkennen.
    Dort differenziert sie den Kunden entweder in einen Anbieter von Immobilien oder in
    einen Interessent von Immobilien. Der Anbieter, welcher Immobilien anbietet ist aus Sicht
    der Software genau so ein Kunde, wie der Interessent, welcher sich für eine neue Immo-
    bilie interessiert.
2. Auch den unterschiedlichen Mitarbeitern wurden Rollen in einem Bereich oder in einer
    Gruppe zugeordnet. So übernimmt immer ein Mitglieder einer Gruppe die Funktion des
    Gruppenleiters während die anderen Gruppenmitglieder sind. Das gleiche gilt auch für
    den Bereich. Darüber hinaus besitzt der Sacharbeiter auch die Rolle Berater, da in der
    Vermittlung immer die Rede von einem Immobilienberater ist.

#### 3.2.5 Grupp e

Das Analysemuster der Gruppe wurde auch mehrmals in unserem Analyseklassendiagramm
eingebaut, deshalb wird hier wieder eine Unterscheidung der beiden Gruppen gemacht, ob-
wohl sie direkt nebeneinander im Diagramm zu sehen sind.

1. Mehrere Mitarbeiter gehören zu einer Gruppe. Dabei kann es aber auch sein, dass ein
    Mitarbeiter zu keiner Gruppe zugeordnet ist. In diesem konkreten Fall muss eine Gruppe
    immer einen Mitarbeiter beinhalten, es kann nicht möglich sein, dass in einer Gruppe
    kein Mitarbeiter vorhanden ist.
2. Bereiche sind in der Software auch vorhanden. Zu einem Bereich können mehrere Mitar-
    beiter gehören. Jedoch kann ein Mitarbeiter auch keinem Bereich zugeordnet sein. Auch
    hier ist ein Bereich nur vorhanden wenn mindestens ein Mitarbeiter diesem zugeordnet
    ist. Sollte ein Bereich keine Mitarbeiter beinhalten, so existiert dieser nicht.

Ein Mitarbeiter kann somit sowohl einem Bereich, als auch einer Gruppe angehören, da diese
beiden Gruppen unabhängig von einander bestehen.


Immobilienverwaltung Use-Case-Diagramm

## 4 Use-Case-Diagramm

Die nachfolgende Use-Case-Analyse visualisiert den kompletten Funktionsumfang der Immo-
bilienverwaltungssoftware. Bei dieser Analyse werden Anwendungsfälle der Software und de-
ren Zusammenhänge in unterschiedlichen Diagrammen übersichtlich dargestellt und mit allen
Akteuren der Immobiliensoftware in Beziehung gesetzt. Des Weiteren werden die Besonder-
heiten aller Anwendungsfälle näher erläutert.

### 4.1 RollenerläuterungderAnwendung

Die Immobilienverwaltungssoftware besitzt insgesamt acht unterschiedliche Akteure. Diese
werden im Folgenden genannt und näher beschrieben, dabei wird jedoch immer nur die männ-
liche Formulierung für beide Geschlechter verwendet.

#### 4.1.1 Mitarb eiter(Pseudorolle).

Die Immobilienverwaltungssoftware besitzt einen Mitarbeiter, welcher den Basisakteur vie-
ler nachfolgender Akteure darstellt. Dieser umfasst Funktionen, welche durch andere Akteure
ebenfalls durchgeführt werden können. Dazu zählen beispielsweise, die Daten zu bearbeiten,
zu archivieren, extern abzurufen und sich am System anzumelden. In der Regel wird einem
Endnutzer jedoch nie diese Rolle zugewiesen, deswegen wird dieser Akteur auch als Pseudo-
rolle bezeichnet.

#### 4.1.2 Sachb earb eiter.

Einem Sachbearbeiter wurden alle Funktionen der Pseudorolle vererbt, somit kann er Immobi-
liendaten erstellen, bearbeiten, ändern und löschen (das Löschen bezieht sich nur auf die selbst
erstellten Daten, wie bei der Zielgruppe schon beschrieben wurde). Des Weiteren ist es ihm
gestattet Vermittlungen abzuwickeln und Finanzierungsangebote zu erstellen.

Zu beachten ist, dass wenn sich während eines Vermittlungsauftrags einige Angaben des Kun-
den ändern, dann muss der zuständige Sachbearbeiter dies einem Verwaltungsangestellten
mitteilen, da er laut vorgelegter Analyse keine Kundendatei pflegen darf.

#### 4.1.3 Grupp en-bzw.Bereichsleiter

Ein Gruppen- bzw. Bereichsleiter der Immobilienverwaltungssoftware kann alle Funktionen ei-
nes Mitarbeiters ausführen. Aus Gründen der Übersichtlichkeit ist in dieser Use-Case-Analyse


Immobilienverwaltung Rollenerläuterung der Anwendung

dies indirekt mit grünen Köpfen des Akteurs dargestellt. Darüber hinaus kann der Gruppen-
bzw. Bereichsleiter auch noch das Gehalt eines Mitarbeiters anpassen.

#### 4.1.4 Verwaltungsangestellter

Jeder Verwaltungsangestellte kann neben den Funktionen eines Mitarbeiters auch noch weitere
Aktionen in der Software durchführen. Dazu gehören, dass der Verwaltungsangestellte die
Daten eines Kunden erstellen, ändern und löschen kann. Gleiche Änderungen darf er auch
bei allen Mitarbeitern durchführen, zum Ändern dieser Angaben braucht er jedoch nachweise,
welche dokumentiert werden müssen.

Daneben kann ein Verwaltungsangestellter auch die Nutzergruppenzugehörigkeit jederzeit be-
arbeiten, da die Gruppen nicht konstant aus den gleichen Mitarbeitern bestehen.

#### 4.1.5 Administrator

Dem Administrator sind alle Funktionen eines Mitarbeiters übertragen, dabei hat er keine wei-
teren Zugriffsbeschränkungen. Zudem ist dieser Akteur der einzige, welcher den Nutzer mit
einem neuen Nutzernamen im System anlegen darf. Aus diesem Grund ist es ihm auch gestat-
tet das Passwort eines Mitarbeiters im System auf Anweisung eines Mitarbeiters zu ändern.

Er ist zudem der einzige Akteur, welcher Daten aus dem System heraus und in das System
hinein transportieren darf.

#### 4.1.6 Interessent

Der Interessent ist an einem Immobilie zum kaufen oder mieten interessiert, somit kann er eine
Immobilie mit einem Sachbearbeiter besichtigen. Auch bei einem Besuch beim Notar muss er
als späterer Inhaber beim Termin anwesend sein.
Beim Erstellen eines Finanzierungsangebots wird dies mit dem Interessenten abgesprochen
und ggf. ein externer Ansprechpartner vermittelt, welcher eine Immobilienfinanzierung mit
ihm weiter besprechen wird.

#### 4.1.7 Notar

Ein Notar wird nur am Ende eines Vermittlungsprozesses beim Kauf einer Immobilie mit in
den Prozess eingebunden, sodass der auf notariell auch bestätigt werden kann. Dabei wird ein
Termin beim Notar mit dem Interessent vereinbart und durchgeführt.


Immobilienverwaltung Use-Case-Diagramm Kompaktansicht

#### 4.1.8 ExternerAnsprechpartner

Aus Gründen der Vollständigkeit wird hier auch der externe Ansprechpartner genannt, wel-
cher einem Interessenten eine Immobilienfinanzierung vermitteln kann. Da dieser Akteur nicht
Kernbestandteil der Immobilienverwaltungssoftware ist, wird er hier nur erwähnt, sodass man
erkennt, das er Bestandteil der Use-Case-Analyse ist.

### 4.2 Use-Case-DiagrammKompaktansicht.

```
Abbildung 4.1: Use-Case-Diagramm Kompaktansicht der Immobilienverwaltungssoftware
```
Das in Abbildung 4.1 dargestellte Use-Case-Diagramm visualisiert die Gesamtübersicht der
Immobilienverwaltungssoftware in einer sehr kompakten Form. Hierbei sind die wichtigsten
Use-Cases im Allgemeinen dargestellt. Diese trennen sich in weitere Diagramme zu detaillier-
teren Anwendungsfällen auf.

Datentransp ortieren
Dieser Use-Case beschäftigt sich mit dem importieren und exportieren von Daten aus


Immobilienverwaltung Use-Case-Diagramm: Daten bearbeiten

```
dem Immobilienverwaltungssystem. Welche Daten im- und exportiert werden dürfen,
kann der Analyse entnommen werden. Wichtig ist, dass die Daten in einem CSV- oder
Textformat vorliegen müssen. Genauere Details dazu werden in der Analyse dieses Pro-
grammentwurfs spezifiziert.
```
Datenexternabrufen
Bei diesem Anwendungsfall wird über die externe Schnittstelle im System die Daten ab-
gerufen. Bei diesem externen Datenzugriff können die Daten jedoch nur gelesen werden.
Sollte eine Schreiboperation durchgeführt werden wollen, kann dies nur intern passieren.

Datenoineabrufen
Sollte es dazu kommen, dass keine Verbindung zu der Immobilienverwaltungssoftware
besteht, sollen die Daten dennoch angezeigt werden können. Dabei wird auf dem Bild-
schirm darauf hingewiesen, dass die Daten evtl. nicht mehr aktuell sind und das versucht
wird eine Verbindung aufzubauen.

Datenfür 10 Jahrearchivieren
Bei diesem Use-Case sollen alle Daten die noch nicht 10 Jahre alt sind archiviert werden.
Darunter fallen alle Daten die aktuell nicht mehr verwendet werden, jedoch aus rechtli-
chen Gründen noch bis zu 10 Jahre zugänglich sein müssen.

Anmelden
Der Anwendungsfall wurde aus mehreren Anwendungsfällen aufgebaut. Bei einer An-
meldung müssen sowohl die Anmeldedaten eingegeben, als auch geprüft werden. Dabei
sollen dem Mitarbeiter auch fehlerhafte Eingaben signalisiert werden.

Datenb earb eiten(1)
Siehe detaillierteres Use-Case-Diagramm zu Daten bearbeiten.

Finanzierungsangeb oterstellen(2)
Siehe detaillierteres Use-Case-Diagramm zu Finanzierungsangebot erstellen.

Vermittlungabwickeln(3)
Siehe detaillierteres Use-Case-Diagramm zu Vermittlung abwickeln.

### 4.3 Use-Case-Diagramm:Datenb earb eiten.

In der Software werden viele verschiedene Daten gespeichert und natürlich auch während ver-
schiedener Geschäftsprozesse immer wieder angepasst. Um die unterschiedlichsten Arten von
Daten etwas genauer zu betrachten, wurden die Daten im Use-Case-Diagramm in Abbildung
4.2 versucht deutlicher zu trennen und aufzuschlüsseln.


Immobilienverwaltung Use-Case-Diagramm: Daten bearbeiten

```
Abbildung 4.2: Use-Case-Diagramm um Daten zu bearbeiten
```
Passwordändern
Jeder Mitarbeiter kann sein Passwort für sich selbst ändern. Bei diesem Anwendungsfall
wurde jedoch auch berücksichtigt, dass ein Mitarbeiter vielleicht sein letztes Passwort
nicht mehr weiß und somit der Administrator dieses neu vergeben muss.

Datenhinzufügen
Verschiedene Mitarbeiter müssen Daten im System pflegen, mit diesem Anwendungsfall


Immobilienverwaltung Use-Case-Diagramm: Daten bearbeiten

```
soll nur deutlich gemacht werden, dass alle Daten, die ins System hinzugefügt werden
einer Prüfung auf Einzigartigkeit unterzogen werden. Unterschiedliche Datenarten wer-
den auf verschiedene Merkmale für ihre Redundanz geprüft, genauere Details hierzu
finden sich in der Analyse wieder.
```
Nutzernamenändern
Beim Initialen anlegen eines Benutzers als auch bei einer Namensänderung eines Mitar-
beiters durch eine Ehe, muss es möglich sein, dessen Nutzernamen im System ändern zu
können. Diese Änderung kann durch den Administrator vorgenommen werden und wir
im System sofort wirksam. Sollte der Nutzer noch mit seinem alten Namen angemeldet
sein, wird er automatisch aus Sicherheitsgründen ausgeloggt.

Immobiliendatenb earb eiten
Dieser Anwendungsfall wurde in mehrere untergliedert. Ein Mitarbeiter kann im System
sowohl Immobiliendaten eingeben, ändern als auch löschen. Dabei wird bei neu eingege-
benen Daten nach Bestätigen geprüft, ob es schon so eine Immobilie im System gibt. Die
zu überprüfenden Eigenschaften einer Immobilie wurden zuvor in der Analyse spezifi-
ziert.

EinzigartigkeitderDatenprüfen
Die Prüfung der Daten auf Redundanz hat eine enorme Priorität, da so viele Fehler di-
rekt ausgeschlossen werden können. Bei diesem Punkt ist das **Prinzip der konstruktiven
Qualitätssicherung** , im Übertragegen Sinne auf die Geschäftsprozesse, sehr stark mit ein-
geflossen, denn Fehler die nicht gemacht werden müssen auch nicht korrigiert werden
und sparen jedem Mitarbeiter so viel Zeit.

Auswahllistepegen
Bei diesem Anwendungsfall sollen die Vorschläge, welche einem Mitarbeiter bei der Su-
che zur Verfügung stehen gepflegt werden. Völlig unabhängig davon soll es den Mitar-
beitern möglich sein eine eigene Suche durchzuführen, bei dem die Werte jedoch nicht
dauerhaft in der Auswahlliste vorhanden sind.

Kundendateib earb eiten
Bei diesem Anwendungsfall wurde das Bearbeiten eines Kunden auch wieder unterteilt
in die Schritte Hinzufügen, Ändern und Löschen, wobei beim Hinzufügen eines neuen
Kunden wieder eine Prüfung stattfindet.

Mitarb eiterdatenb earb eiten
Bei Änderungen eines Mitarbeiters müssen die Veränderungen dokumentiert werden.
Diese Datenänderungen, sei es das Hinzufügen, Ändern oder Löschen müssen im Sys-


Immobilienverwaltung Use-Case-Diagramm: Finanzierungsangebot erstellen

```
tem persistent festgehalten werden. Daneben wird eine Prüfung, wie in der Analyse be-
schrieben durchgeführt.
```
Nutzergrupp enzugehörigkeitb earb eiten
Ein Verwaltungsangestellter wird die Nutzerzugehörigkeit anpassen, sobald eine neue
Gruppe gebildet oder aufgelöst wird. Dabei wurde dieser Anwendungsfall auch in meh-
rere unterteilt, da man entweder Berechtigungen hinzufügen oder entziehen muss.

GehalteinesMitarb eitersändern
Die Änderung des Gehalts ist dem Gruppen- bzw. Bereichsleiter vorbehalten und soll
auch nur durch ihn durchgeführt werden. Dies wurde besonders visuell hervorgehoben
in dem es extra neben dem Ändern der Mitarbeiterdaten aufgeführt wurde.

### 4.4 Use-Case-Diagramm:Finanzierungsangeb oterstellen.

Die Erstellung eines Finanzierungsangebots ist eines der komplexeren Themen, welche die Im-
mobilienverwaltungssoftware abdeckt. Deshalb wird nachfolgend in Abbildung 4.3 der Use-
Case visualisiert, um die Funktionalität übersichtlich darzustellen.
Der Hauptfokus liegt hierbei deutlich auf den Funktionen, welche auch durch die Software
bereitgestellt werden. Nur aus Gründen der Vollständigkeit wird in dem Use-Case-Diagramm
ein externer Ansprechpartner erwähnt.

```
Abbildung 4.3: Use-Case-Diagramm um ein Finanzierungsangebot zu erstellen
```
ExternerAnsprechpartnerfürImmobiliennanzierungvermitteln
Bei diesem Anwendungsfall wird dem Interessent ein externer Ansprechpartner vermit-


Immobilienverwaltung Use-Case-Diagramm: Finanzierungsangebot erstellen

```
telt, mit dem er eine Immobilienfinanzierung in Anspruch nehmen kann. Diese Finanzie-
rung läuft dann unabhängig von der ImmoManage GmbH.
```
Finanzierungsangeb oterstellen
Um ein Finanzierungsangebot zu erstellen müssen die neusten Finanzierungsdaten im
System vorhanden sein. Dies passiert durch einen weiteren Anwendungsfall. Somit wird
gewährleistet, dass die Finanzierungsangebote aktuell (im 2 Stunden Takt) im System
gefiltert werden können. Daneben gibt es sowohl die Fremd- als auch Eigenkapitalfinan-
zierung.

Fremdkapitalnanzierungerstellen
Dieser Anwendungsfall ist wieder in Spezialanwendungsfälle untergliedert. Der Inter-
essent hat schließlich mehrere Möglichkeiten eine Fremdkapitalfinanzierung zu bekom-
men. Dabei stehen für ihn Fest-, Annuitäten, Nachrangdarlehen als auch Fördermittel zur
Auswahl.

Eigenkapitalnanzierungerstellen
Eine Eigenkapitalfinanzierung muss natürlich auch berechnet werden. Deshalb wird die-
ser Anwendungsfall auch genauer differenziert in die Berechnung von Bausparguthaben
und Fördermittel.

Finanzierungsangeb otevergleichen
Dieser Use-Case wird benötigt um verschiedene Vergleichsmethoden bei der Erstellung
zur Verfügung zu stellen. Dabei kann sowohl nach Gesamtkosten, Restschulden, getilg-
ten Beträgen auch auch monatlichen Darlehnsraten verglichen werden. Dies ermöglicht
dem Sachbearbeiter, schon bei der Erstellung eines Finanzierungsangebots, die unter-
schiedlichen Angebote zu vergleichen.

Finanzierungsangeb otb erechnen
Das endgültige Finanzierungsangebot für einen Interessenten wird in diesem Anwen-
dungsfall berechnet. Dabei wird auch wieder differenziert zwischen den Eckdaten (Dar-
lehnsbetrag, Kaufpreis, Sollzinsbindung in Jahren, Sollzins pro Jahr, Starttermin) und den
Finanzierungsdaten (monatliche Darlehnsrate, Zinsen, Tilgung, Restschuld, getilgter Be-
trag). Diese Unterscheidung wurde anhand von Notizen im Use-Case-Diagramm selbst
versucht deutlich darzustellen.


Immobilienverwaltung Use-Case-Diagramm: Vermittlung abwickeln

### 4.5 Use-Case-Diagramm:Vermittlungabwickeln

Das Kerngeschäft einer Immobilienverwaltungssoftware besteht daraus Immobilien an Inter-
essenten zu Vermitteln, deswegen wird in der Abbildung 4.4 auch der wichtigste Use-Case
visualisiert. Dabei wird der Vermittlungsprozess sowohl für Kauf- als auch Mietimmobilien
dargestellt.

```
Abbildung 4.4: Use-Case-Diagramm um eine Vermittlung abzuwickeln
```
Beratungsgesprächführen
Bei diesem Anwendungsfall gibt es zwei detailliertere Anwendungsfälle, zum einen kann
das Beratungsgespräch nämlich am Telefon oder vor Ort durchgeführt werden. Teil die-
ses Anwendungsfalls ist, dass ein Kundentermin vereinbart, Kundenbedürfnisse ermit-
telt und Immobilien besprochen werden.

Vermittlungabwickeln
Bei einer Vermittlung wird erst etwas dokumentiert, sobald eine Aktion ausgeführt wur-


Immobilienverwaltung Use-Case-Diagramm: Vermittlung abwickeln

```
de. Dieser Anwendungsfall ist der Zentrale Anwendungsfall in diesem Use-Case-Dia-
gramm, da dieser von vielen anderen Anwendungsfällen Funktionalitäten beinhaltet.
Von diesem Anwendungsfall kann sowohl ein Kauf als auch eine Vermietung abgewi-
ckelt werden.
```
Rechnungerstellen
Bei diesem Use-Case wird für die Vermittlung eine Rechnung dem Interessenten gestellt.
Sollte auf die Rechnung keine Zahlung erfolgen, werden aus der Rechnung Mahnungen
erstellt. Diese werden dann versendet, nachdem die gesetzliche Frist abgelaufen ist.

Immobilieb esuchen
Dieser Anwendungsfall muss nicht durchlaufen werden, ist aber für den Interessenten
die einzige Möglichkeit die Immobilie direkt vor Ort anzusehen. Bei einem Besichti-
gungstermin wird ein Interessent stets von einem Sachbearbeiter begleitet.

Kaufdurchführen
Wenn ein Kauf durchgeführt werden soll, muss eine Finanzierung mit dem Interessen-
ten vereinbart werden. Weitere Details finden sich im Use-Case „Finanzierungsangebot
erstellen“. Neben dem Finanzierungsangebot gehört zu einem Kauf auch der Besuch bei
einem Notar, welcher den Kauf notariell beglaubigt.

Immobilieüb ergeb en
Bei diesem Anwendungsfall wird die Immobilie dem Interessenten von einem Sachbe-
arbeiter übergeben. Dabei kann es sich sowohl um eine Kauf- als auch Mietimmobilie
handeln. Bei der Übergabe wird zusätzlich ein Protokoll geschrieben, welches Details der
Übergabe beinhaltet. Eine indirekte Verbindung zum Sachbearbeiter besteht über den
Anwendungsfall „Vermittlung abwickeln“.


Immobilienverwaltung Sequenzdiagramm

## 5 Sequenzdiagramm

Im folgenden Abschnitt wird das Szenario „Verkaufsvermittlung durchführen“ visualisiert
und anschließend erläutert. Die Beschreibung dient hauptsächlich zu der Bezugsherstellung.

Bei der Darstellung des Sequenzdiagramms wurde auf die exakte Angabe von Parameterwer-
ten nicht verzichtet, um mögliche Antworten schon spezifischer darzustellen. Aus Gründen
der Übersichtlichkeit wurden die Lebenslinien von Objekten jedoch gekürzt. Der Verlauf der
Nachrichten, sowie deren beteiligten Objekte stehen grundsätzlich im Vordergrund der Szena-
riobetrachtung. Dieses dient als Grundlage zum weiteren Entwurf.

### 5.1 Szenariob etrachtung:Verkaufsvermittlung

In diesem Szenario wird eine Verkaufsvermittlung durchgeführt. Dabei müssen die beteiligten
Objekte jedoch zuerst im System erstellt werden. Die initiale und erste Erstellung der Objekte
wird vom Administrator im System durchgeführt. Davor wurde auch exemplarisch der An-
meldeprozess mit dem Verlauf der Nachrichten dargestellt. Zu dieser ersten Erstellung zählen
für dieses Szenario nur die Erstellung von einem Sachbearbeiter. Sobald dieser erstellt ist, pflegt
er alle weiteren benötigten Objekte in die Immobilienverwaltungssoftware ein. Zu den weiter
benötigten Objekten zählen: Anbieter, Immobilie, Kunde, Vermittlung, Beratung, Beratungs-
protokoll und Notar.

Das Szenario betrachtet nach der Erstellung die einzelnen Schritte, welche im Gesamten dann
zur Durchführung einer Vermittlung sich ergeben. Zu diesen Einzelschritten zählt eine optio-
nale Beratung durch einen Sachbearbeiter, als auch eine oder mehrere optionale Besichtigungen
der Immobilie. Des Weiteren steht dem Kunden die Möglichkeit einer Immobilienfinanzierung
durch unterschiedliche Möglichkeiten offen.

Zum Abschluss wird der Verkauf der Immobilie durchgeführt, welcher auch einen Besuch bei
einem Notar beinhaltet. Um diese Vermittlung dann im System abzuschließen wird eine Rech-
nung erstellt und dem Kunden zugeschickt. Sollte dieser die Rechnung nicht begleichen wur-
den in dem Sequenzdiagramm auch die Mahnungen mit berücksichtigt.

Aus Gründen der Übersichtlichkeit wurden Untersequenzen in diesem Diagramm mit einem
Kasten gekennzeichnet. Dabei ist jeder farblich blau gekennzeichnete Kasten eine prüfende
Sequenz. Das Erstellen von Objekten im System wurde visuell durch einen grünen Kasten dar-
gestellt und jede Untersequenz die durchgeführt werden muss, ist in roter Farbe dargestellt.


Immobilienverwaltung Diagrammbetrachtung: Verkaufsvermittlung

```
Abbildung 5.1: Sequenzdiagramm der Verkaufsvermittlung
```
### 5.2 Diagrammb etrachtung:Verkaufsvermittlung

Das beschriebene Szenario wird durch das Sequenzdiagramm in Abbildung 5.1, nach UML
Standard visuell dargestellt. Hierbei wurde auf die explizite Darstellung von jedem Anmel-
devorgang als auch Fehlerbenachrichtigungen, wie zum Beispiel Datenbankfehler, fehlende
Berechtigungen oder falsche Nutzereingaben, im Sinne der Übersichtlichkeit verzichtet. Exem-
plarisch wurde ein Anmeldevorgang für den Administrator zu Beginn des Diagramms einge-
fügt.


Immobilienverwaltung Diagrammbetrachtung: Verkaufsvermittlung

Bei diesem Anmeldevorgang versucht sich der Administrator am System zwischen 07:00 Uhr
und 20:00 Uhr anzumelden. Dabei werden sein Benutzername und Passwort überprüft. Im Se-
quenzdiagramm ist deutlich die Alternative zu erkennen, in dem einen Fall sind die Daten
inkorrekt und der Nutzer bekommt eine Fehlermeldung präsentiert. Im Fall, dass die Anmel-
dedaten korrekt sind, bekommt man Zugriff auf das System. Bei diesem Ablauf wurde das Prü-
fen der Nutzerdaten als Referenz eingebaut, da in diesem Block selbst die Prüfung detaillierter
dargestellt werden kann. In dieser Untersequenz sind natürlich rekursive Aufrufe möglich.

Als nächsten Schritt wird im Diagramm ein Sachmitarbeiter erstellt. Dies passiert in einer
Schleife, da es sein kann, dass nicht nur ein Sachbearbeiter, sondern gleich mehrere im Sys-
tem angelegt werden können. Dieser Prozess berücksichtigt aus Gründen der Übersichtlichkeit
evtl. auftretende Fehler der Datenbank nicht und ist auch für das Erstellen andere Objekte wie
Beispielsweise ein Verwaltungsangestellter analog. Hier ist wieder die Besonderheit der Prü-
fung auf Einzigartigkeit zu erwähnen, welche rekursiv aufgerufen wird zu erwähnen. Wäh-
rend dieser Prüfung wird ein Objekt entweder neu angelegt oder dem Objektersteller mithilfe
einer Fehlermeldung klar verdeutlicht, dass dieser Nutzer bereits im System existiert.

Um eine Vermittlung durchzuführen muss der Sachbearbeiter, nach der Anmeldung im Sys-
tem, erst einen neuen Anbieter anlegen. Bei den nachfolgenden Aktionen wurde darauf geach-
tet, dass Sequenzdiagramm klar trennt, zwischen Kommunikationsabschnitten und Wieder-
verwendungen. Somit wird das Abschicken der synchronen Nachricht noch dargestellt aber
die Erstellung komplett nur referenziert. In unserem Ablauf sind nun die Fehlerfälle weitest-
gehend nicht berücksichtigt worden, um die Vermittlung erfolgreich in einem kompakten Se-
quenzdiagramm abschließen zu können.

Sobald der Anbieter erfolgreich erstellt wurde, legt der Sachbearbeiter die Immobilie des An-
bieters an, bei dieser handelt es sich im konkreten Fall um eine Wohnung. Neben der Immobilie
wird auch noch ein Kunde/Interessent erstellt (beide Bezeichner werden hier synonym ver-
wendet). Aus Gründen der Wiederverwendbarkeit wurde das Erstellen wieder referenziert.
Sollte bis zu diesem Punkt keine Vermittlung für den Interessenten angelegt worden sein, wird
diese durch das Anfordern eines Beratungsgesprächs von Seiten des Interessenten erzeugt.
Diese neue Vermittlung kann auch durch ein anderes Objekt angelegt werden, da die Beratung
als auch andere Komponenten der Vermittlung optional sind. In diesem Ablauf des Sequenz-
diagramms in Abbildung 5.1 wird die Vermittlung jedoch mithilfe eines Beratungstermins er-
stellt.

Die Vermittlung wird solange als Schleife durchlaufen, bis sie vollständig abgeschlossen ist.
Dabei können mehrere Vermittlungsvorgänge parallel stattfinden. Bei diesen Vorgängen kön-
nen Beratungen, Besichtigungen und Immobilienfinanzierungen durchgeführt werden. Beson-
ders hervorgehoben werden, können hier die asynchronen Nachrichten, welche beispielsweise


Immobilienverwaltung Pseudocode: Verkaufsvermittlung

das Ergebnis der Beratung dokumentieren sollen. Des Weiteren ist eine Beratung auf ein Zeit-
intervall von 10 bis 120 Minuten begrenzt. Diese Zeitangabe ist mit einer zusätzlichen Beschrif-
tung an der Beratung deutlich dargestellt.

Bei der Immobilienfinanzierung ist die die chronologische Abfolge wichtig, dies wurde mit-
hilfe einer losen Ordnung „seq“ versucht deutlich zu kennzeichnen. Ansonsten ist auch hier
wieder eine Referenz auf eine Verfeinerung platziert, da viele Details hier aus Gründen der
Übersichtlichkeit nicht modelliert werden können.

Nachdem eine Vermittlung erfolgreich abgeschlossen wurde, wird der eigentliche Kauf der
Immobilie durchgeführt. Dabei werden viele Objekte erzeugt unter anderem auch ein Notar
welcher für den Notarbesuch auch rechtlich notwendig ist. Dabei wurde auch nach der Rech-
nungserstellung der Fall hinzugefügt, dass der Kunde seine Rechnung nicht bezahlt und dann
Mahnungen darauf folgen können. Erst mit der Bezahlung der Rechnung und ggf. Mahnungen
ist der Verkauf durchgeführt. Das Abmelden am System wurde auch exemplarisch am Ende
nach Verkaufsabschluss modelliert. Der Sachbearbeiter wie auch andere Mitarbeiter kann sich
natürlich auch zu anderen Zeiten am System abmelden.

Grundsätzlich wurde versucht die Attribute der einzelnen Botschaften, sowie Antworten so
genau wie möglich zu spezifizieren, dennoch sind diese leider teilweise sehr generisch mit
dem Wort „Daten“ gekennzeichnet.

### 5.3 Pseudo co de:Verkaufsvermittlung

Um eine klarere Struktur und auch Übergänge zwischen den verschieden Aktionen zu ver-
deutlichen wurde der Pseudocode in kleinere Codeabschnitte unterteilt. Diese sind nach dem
Hauptprogramm in der Reihenfolge angeordnet, in dem sie aus dem Hauptprogramm aufge-
rufen werden.
Beim Aufruf von diesen Unterprogrammen werden im Sinne der Übersichtlichkeit nicht alle
Parameter angegeben, deshalb findet sich die Abkürzung „usw.“ im Pseudocode an diesen
Stellen. Zusätzlich werden alle Schlüsselwörter im Code ohne Umlaute dargestellt.

```
1 ---------------------------------
2 - PSEUDOCODE SEQUENZDIAGRAMM -
3 - VERKAUFSVERMITTLUNG DURCHFÜHREN -
4 ---------------------------------
5 BEGINN VERKAUFSVERMITTLUNG
6
7 WENN die Uhrzeit ist zwischen 07:00 und 20:00 Uhrzeit;
8 DANN
```

Immobilienverwaltung Pseudocode: Verkaufsvermittlung

```
9 // Administrator interagiert mit dem System
10 FUEHRE mit den Benutzerdaten und Passwort des Admins ANMELDEN
AUS ;
11 FUEHRE SACHBEARBEITER-ERSTELLEN mit den persönlichen Daten
des Sachbearbeiters wie Name, Anschrift, usw. AUS ;
12
13 // Sachbearbeiter verwendet das System
14 FUEHRE mit den Benutzerdaten und Passwort des Sachbearbeiters
ANMELDEN AUS ;
15 FUEHRE ANBIETER-ERSTELLEN mit den Angaben zum Anbieter wie
Anschrift, E-Mail-Adresse, usw. AUS ;
16 FUEHRE IMMOBLIE-ERSTELLEN mit den Angaben zur Immobilie wie
Adresse, Preis, usw. AUS ;
17 FUEHRE INTERESSENT-ERSTELLEN mit den Angaben zum Anbieter wie
Anschrift, E-Mail-Adresse, usw. AUS ;
18 FUEHRE VERMITTLUNG-ERSTELLEN mit Informationen zur
Vermittlung und zum Interessenten AUS ;
19
20 WIEDERHOLE
21 /* Aufgeführte Ausführungsblöcke können parallel ausgeführt
werden */
22 FALLS Angefragte Dienstleistungen IST
23 Beratung: FUEHRE BERATUNGSTERMIN-DURCHFUEHREN mit dem
Datum, Zweck, usw. AUS ;
24 Besichtigung: FUEHRE BESICHTIGUNG-DURCHFUEHREN mit dem
Datum, Kundenwunsch, usw. AUS ;
25 Immobilienfinanzierung: FUEHRE
IMMOBILIENFINANZIERUNG-DURCHFUEHREN mit dem
Kaufpreis, Starttermin, usw. AUS ;
26 ENDE - FALLS
27 BIS Angefragte Dienstleistung der Abschluss ist;
28
29 FUEHRE VERKAUF-DURCHFÜHREN mit dem Datum, Kaufpreis usw. AUS ;
30 FUEHRE als Sachbearbeiter ABMELDEN AUS ;
31
32 // Interaktion des Administrator
33 FUEHRE als Administrators ABMELDEN AUS ;
```

Immobilienverwaltung Pseudocode: Verkaufsvermittlung

##### 34 SONST

```
35 UI: Zeige Fehlermeldung an, dass das System derzeit nicht
verfügbar ist und nur in der Zeit von 07:00 bis 20:00 Uhr
zur Verfügung steht;
36 ENDE WENN
37 ENDE VERKAUFSVERMITTLUNG
Listing 5.1: Verkaufsvermittlung anhand des Szenarios durchführen
```
Nachfolgend werden einzelne Unterprogramme in Form von Pseudocode modelliert, um ver-
schiedene Konzepte deutlich zu machen. Dabei wird mit der Anmeldung im System begonnen.

```
1 BEGINN ANMELDEN
2 EMPFANGE Benutzernamen und Passwort;
3 WENN der Benutzername und das Passwort korrekt sind;
4 DANN
5 GEBE zurück, dass der Anmeldevorgang erfolgreich war;
6 UI: Wechsle vom Anmeldebildschirm zum Hauptbildschirm;
7 SONST
8 GEBE Fehlermeldung mit dem Text: "Anmeldedaten sind falsch"
zurück;
9 Fordere den Nutzer auf Benutzernamen und Passwort erneut
einzugeben;
10 FUEHRE ANMELDEN erneut mit neuem Benutzernamen und Passwort
AUS ;
11 ENDE WENN
12 ENDE ANMELDEN
Listing 5.2: Anmeldung im System durchführen
```
Deutlich zu erkennen bei der Abfrage in der Anmeldung ist, dass die Datenbankabfrage für die
Überprüfung der Nutzerdaten nicht vorhanden ist. Wie im Sequenzdiagramm werden auch im
Pseudocode keine Datenbankzugriffe modelliert, um die Konsistenz von dem Diagramm zum
Pseudocode zu gewährleisten.

```
1 BEGINN SACHBEARBEITER-ERSTELLEN
2 EMPFANGE Persönliche Informationen wie den Name, Anschrift, usw.;
3
4 SOLANGE Sachbearbeiter noch nicht angelegt ist:
5 WENN die eingegebenen Daten eines Sachbearbeiters einzigartig
sind;
6 DANN
```

Immobilienverwaltung Pseudocode: Verkaufsvermittlung

```
7 Erstelle einen Datenbankeintrag für Sachbearbeiter mit den
eingegebenen Daten;
8 SONST
9 GEBE die Fehlermeldung: "Sachbearbeiter existiert bereits"
zurück und erstelle keinen neuen Eintrag;
10 Breche die Schleife ohne Erfolg ab;
11 ENDE WENN
12 ENDE SOLANGE
13 ENDE SACHBEARBEITER-ERSTELLEN
Listing 5.3: Anlegen eines Sachbearbeiters im System
```
Um den Verkauf einer Immobilie abzuschließen, werden wiederum weitere Unterprogramme
aufgerufen, davon wird nur das Unterprogramm zum Erstellen der Rechnung weiter model-
liert.

```
1 BEGINN VERKAUF-DURCHFÜHREN
2 FUEHRE NOTAR-ERSTELLEN mit den Angaben des Namens, der
Anschrift, usw. AUS ;
3 FUEHRE VERKAUF-ERSTELLEN mit dem Datum, Kaufpreis, usw. AUS ;
4 // Erstelle das Protokoll für den Notarbesuch:
5 FUEHRE NOTARBESUCH-ERSTELLEN mit dem Datum, den Kosten, usw.
AUS ;
6
7 FUEHRE KAUFVERTRAG-ERSTELLEN mit dem Dokument,
Kaufinformationen, usw. AUS ;
8 // Erstelle Übergabeprotokoll:
9 FUEHRE ÜBERGABE-ERSTELLEN mit dem Datum und den Mängeln AUS ;
10
11 FUEHRE RECHNUNG-ERSTELLEN mit der Angabe des
Rechnungsstellers, Rechnungsempfängers, usw. AUS ;
12 ENDE VERKAUF-DURCHFÜHREN
Listing 5.4: Einen Verkauf einer Immobilie durchführen
```
Bei Erstellen der Rechnung wurde das Versenden von Mahnungen mit berücksichtigt. Sollte
ein Kunde seine Rechnung nicht begleichen, wird das Event in diesem Unterprogramm für die
Erstellung der Mahnungen aufgerufen.

```
1 BEGINN RECHNUNG-ERSTELLEN
2 EMPFANGE Informationen zu dem Rechnungssteller,
Rechnungsempfänger, usw.;
```

Immobilienverwaltung Pseudocode: Verkaufsvermittlung

```
3 Erstelle eine Rechnung in der Datenbank für die aktuelle
Vermittlung;
4
5 EVENT "Rechnung innerhalb des Zeitrahmens wurde nicht
bezahlt" wurde ausgelöst:
6 WENN Erstellte Mahnungen weniger als 3 Dokumente auf der
Datenbank verfügbar sind;
7 DANN
8 FUEHRE MAHNUNG-ERSTELLEN mit den Angaben des
Mahnungsstellers, Mahnungsempfängers, usw. AUS ;
9 ENDE WENN
10 ENDE RECHNUNG-ERSTELLEN
Listing 5.5: Erstellung einer Rechnung für eine Vermittlung einer Immobilie
```
Der Vollständigkeit wird neben dem Anmelden auch das Abmelden am System hier im Pseu-
docode dargestellt.

```
1 BEGINN ABMELDEN
2 Schließe die Verbindung zur Datenbank;
3 UI: Wechsle aus dem Hauptbildschirm zum Abmeldebildschirm;
4 UI: Zeige dem Nutzer folgende Meldung: "Abmeldung erfolgreich
durchgeführt.";
5 ENDE ABMELDEN
Listing 5.6: Abmeldung im System durchführen
```

Immobilienverwaltung Aktivitätsdiagramm

## 6 Aktivitätsdiagramm

Das vorliegende Aktivitätsdiagramm visualisiert das Szenario „Mitvermittlung durchführen“
und stellt sämtliche Relationen UML konform dar. Das Aktivitätsdiagramm basiert auf der
Analyse aller zur Verfügung stehenden Datenklassen, spätere Entwurfsentscheidungen im Ent-
wurfsklassendiagramm, können vom analysebasierten Aktivitätsdiagramm abweichen. Im Fo-
kus stehen das allgemeine Verhalten zwischen einzelnen Objekten, sowie deren Kontrollflüsse
und das generelle Systemverhalten bei diesem konkreten Szenario.

### 6.1 Szenariob etrachtung:Mietvermittlungdurchführen.

Innerhalb der Immobilienverwaltungssoftware können sowohl Verkaufs- als auch Mieterver-
mittlungen durchgeführt werden. Um eine Mietvermittlung durchzuführen benötigt es im
konkreten Szenario einen Administrator, Sachbearbeiter, Anbieter sowie Interessenten.

Nachdem sich der Administrator am System angemeldet hat, erstellt dieser einen Sachbearbei-
ter, da wir von dem Stand ausgehen müssen, dass das vorliegende System nur den Adminis-
trator bei der Auslieferung als Benutzer beinhaltet. Der Sachbearbeiter meldet sich nach seiner
Erstellung am System selbst an, um eine neue Immobilie eines Anbieters im System zu erstel-
len. Bei diesem Prozess muss zuerst der Anbieter angelegt werden. Das Anlegen der Immobilie
und des Interessenten kann darauf parallel stattfinden.

Sobald der Interessent als auch die Immobilie im System vorhanden sind, kann eine Vermitt-
lung durchgeführt werden. Dabei stehen dem Interessenten sowohl mehrere Beratungstermi-
ne, als auch Besichtigungstermine zu. Diese kann er für sich in Anspruch nehmen, jedoch sind
diese nicht verpflichtend für die Miete einer Immobilie.

Hat sich der Interessent nun für einen Immobilie zur Miete entschieden wird ein Mietvertrag
angelegt und die Übergabe durchgeführt. Parallel zu der Übergabe erfolgt die Rechnungser-
stellung, welche auch die Erstellung von möglichen Mahnungen beinhaltet. Um dieses Szena-
rio nun auch zu beenden, meldet sich sowohl der Sachbearbeiter, als auch der Administrator
vom System ab. Grundsätzlich sollte erwähnt sein, dass das Abmelden vom System auch zu
anderen Zeitpunkten durchgeführt werden kann.


Immobilienverwaltung Diagrammbetrachtung: Mietvermittlung durchführen

### 6.2 Diagrammb etrachtung:Mietvermittlungdurchführen.

Bei dem vorliegenden Szenario beginnt alles mit der Anmeldung des Administrators im Sys-
tem. Diese werden vom System geprüft, sollten diese nicht korrekt sein, kann er diese erneut
eingeben. Dies wurde zusätzlich mit einer Pin-Notation im Aktivitätsdiagramm verdeutlicht.
Sollte der Anmeldeprozess erfolgreich abgeschlossen worden sein, so befindet sich der Admi-
nistrator angemeldet im System.

Im System empfängt er nun das Ereignis, dass ein neuer Sachbearbeiter angelegt werden muss.
Bei dem anlegen des Sacharbeiters wird dessen Einzigartigkeit geprüft, sollte diese nicht ge-
währleistet sein, dann ist dieser Sachbearbeiter im System schon vorhanden. Erst nachdem
sichergestellt wurde, dass es sich um einen neuen Sacharbeiter handelt, springt man von die-
ser Aktion zur Erstellung. Nach dem Erstellen, kann sich dieser auch im System anmelden. Der
Prozess der Anmeldung wird hier nur wieder referenziert, da dieser schon beim Administrator
detailliert beschrieben wurde.

Sobald eine neue Immobilie eines Anbieters gemeldet wird, muss sowohl der Anbieter ange-
legt werden als auch die Immobilie. Beim Anlegen der Immobilie ist deutlich zu erkennen,
dass es einen Parallelisierungsknoten gibt, sodass sowohl der Interessent als auch die Immo-
bilie gleichzeitig im System angelegt werden können. Sobald beide im System angelegt wur-
den, werden beide wieder synchronisiert, da die Vermittlung sowohl eine Immobilie als auch
einen Interessenten benötigt. Die Durchführung der Vermittlung ist durch eine while-Schleife
implementiert worden. Dabei kann der Interessent mehrere Beratungen und Besichtigungen
durchführen. Sobald er sich für die Miete entschieden hat, wird diese Schleife verlassen und
der Mietvertrag aufgesetzt.

Sowohl bei der Vermittlung selber als auch kurz danach sind die Verzweigungsknoten deutlich
erkennbar, diese können mit Bedingungen (siehe Durchführung von Beratungen und Besichti-
gungen), als auch ohne Bedingungen (siehe nach der Schleife) aufgeführt werden. Zusätzlich
zu der Rechnung wurden auch hier wieder in einer Schleife, die Mahnungen berücksichtigt.
Weil es nur bis zu drei Mahnungen geben kann wurde hier eine for-Schleife eingebaut.

Erst wenn die Rechnung bzw. Mahnungen beglichen wurden und die Übergabe durchgeführt
wurde, meldet sich in diesem Szenario der Sachbearbeiter, sowie der Administrator vom Sys-
tem ab. Dies könnt jedoch wie schon beschrieben auch zu einem anderen Zeitpunkt im System
passieren.


Immobilienverwaltung Pseudocode: Mietvermittlung durchführen

### 6.3 Pseudo co de:Mietvermittlungdurchführen

Der Pseudocode von dem aktuellen Szenario „Mietvermittlung durchführen“ unterscheidet
sich nur geringfügig von der zuvor vorgestellten Verkaufsvermittlung. Deshalb wurden Un-
terprogramme im Pseudocode nicht erneut dargestellt, sondern auf die Unterprogramme im
Sequenzdiagramm verwiesen.

Zu diesem Unterprogramm gehören die Anmeldung (siehe Pseudocode 5.2) und Abmeldung
(siehe Pseudocode 5.6) am System, als auch die Erstellung des Sachbearbeiters (siehe Pseudo-
code 5.3), welcher analog auch für den Anbieter, Interessent, Vermittlung umgesetzt werden
kann.

```
1 ---------------------------------
2 - PSEUDOCODE AKTIVITÄTSDIAGRAMM -
3 - MIETVERMITTLUNG DURCHFÜHREN -
4 ---------------------------------
5 BEGINN MIETVERMITTLUNG
6 // Adminstrator agiert mit dem System
7 FUEHRE mit den Benutzerdaten und Passwort des Admins ANMELDEN
AUS ;
8 FUEHRE SACHBEARBEITER-ERSTELLEN mit den persönlichen Daten
des Sachbearbeiters wie Name, Anschrift, usw. AUS ;
9
10 // Sachbearbeiter verwendet das System
11 FUEHRE mit den Benutzerdaten und Passwort des Sachbearbeiters
ANMELDEN AUS ;
12 FUEHRE ANBIETER-ERSTELLEN mit den Angaben zum Anbieter wie
Anschrift, E-Mail-Adresse, usw. AUS ;
13 // Parallel kann folgendes ausgeführt werden
14 FUEHRE IMMOBLIE-ERSTELLEN mit den Angaben zur Immobilie wie
Adresse, Preis, usw. AUS ;
15 FUEHRE INTERESSENT-ERSTELLEN mit den Angaben zum Anbieter wie
Anschrift, E-Mail-Adresse, usw. AUS ;
16
17 FUEHRE VERMITTLUNG-ERSTELLEN mit Informationen zur
Vermittlung und zum Interessenten AUS ;
18
19 SOLANGE Angefragte Diensteleistung kein Abschluss ist:
20 // Parallelität möglich
```

Immobilienverwaltung Pseudocode: Mietvermittlung durchführen

```
21 WENN Beratung durch Interessent angefragt wird;
22 DANN
23 FUEHRE BERATUNGSTERMIN-DURCHFUEHREN mit dem Datum,
Zweck, usw. AUS ;
24 ENDE WENN
25
26 WENN Besichtigung durch Interessent angefragt wird;
27 DANN
28 FUEHRE BESICHTIGUNG-DURCHFUEHREN mit dem Datum,
Kundenwunsch, usw. AUS ;
29 ENDE WENN
30 ENDE SOLANGE
31
32 FUEHRE MIETE-DURCHFÜHREN mit dem Datum, Mietpreis usw. AUS ;
33 FUEHRE als Sachbearbeiter ABMELDEN AUS ;
34
35 // Interaktion des Administrator
36 FUEHRE als Administrators ABMELDEN AUS ;
37 ENDE Mietvertmittlung
Listing 6.1: Mietvermittlung anhand des Szenarios durchführen
```

Immobilienverwaltung Pseudocode: Mietvermittlung durchführen

```
Abbildung 6.1: Aktivitätsdiagramm der Durchführung einer Mietvermittlung
```

Immobilienverwaltung Entwurfsklassendiagramm

## 7 Entwurfsklassendiagramm

Im Folgenden wird das Entwurfsklassendiagramm erläutert. Es beschreibt das Datenmodell
der Immobilienverwaltungssoftware und ist ein wesentlicher Bestandteil der Konzeption. Die-
ses basiert grundsätzlich auf dem Analyseklassendiagramm und baut darauf auf. Neben den
im Analyseklassendiagramm eingeführten Klassen, werden noch weitere Klassen zur Hilfe
für die Umsetzung benötigt. Diese Klassen wurden im Entwurfsklassendiagramm identifiziert
und dargestellt. Die Beschreibung des Entwurfsklassendiagramms erfolgt Paketweise. Um den
Überblick zu behalten, haben die unterschiedlichen Pakete im Entwurfsklassendiagramm auch
unterschiedliche Farben zur besseren Kennzeichnung. Es wird bei der Beschreibung nicht auf
die Methoden und Attribute der einzelnen Klassen eingegangen, es sei den diese haben spezi-
elle Eigenschaften, welche nicht klar aus dem Diagramm in 7.1 hervorgehen.

### 7.1 Pakete

In diesem Abschnitt wird auf die einzelnen Pakete des Entwurfsklassendiagramms eingegan-
gen. Dabei werden zuerst die Pakete DataTypes und Model beschrieben, bevor die Pakete mit
weiteren Details zum Model folgen.

#### 7.1.1 DataTyp es

Um verschiedene Klassen an unterschiedlichen Stellen in der Software wieder zu verwenden,
werden diese alle im Paket DataTypes definiert. Somit kann an einer zentralen Stelle eine Me-
thode oder ein Attribut geändert werden und in der ganzen Software ist diese Änderung per-
sistent umgesetzt. Dieses Paket wurde auch im Sinne der Softwarewartung angelegt, da sofort
ersichtlich ist, aus welchen Attributen eine dieser Klassen besteht.
Aus Gründen der Übersichtlichkeit wurden hier keine Beziehungen zwischen den Entitäten
eingezeichnet, da das Entwurfsklassendiagramm sonst zu komplex und unübersichtlich ge-
worden wäre.

#### 7.1.2 Mo del.

Das Paket Model ist das Hauptpaket des Entwurfsklassendiagramms. Das Paket ist direkt aus
dem Analyseklassendiagramm entstanden. Dabei wurden weitere Klassen identifiziert und
hinzugefügt. Neben der Immobilienverwaltung wurden ein ImportAdapter sowohl für CSV-
Dateien als auch Textdateien hinzugefügt. Weil der Import von Textdateien nur eingebaut wur-


Immobilienverwaltung Pakete

de, dass die Software abwärtskompatibel ist, wurde nur ein CSVWriter implementiert, welcher
für den Export von Daten zuständig ist.

Des Weiteren wurde eine Klasse namens Datenbank eingeführt, sodass man mit dieser die
Schnittstelle zur Datenbank herstellen kann. Zusätzliche generelle Hilfsmethoden zum Erstel-
len von unterschiedlichen Typen, finden sich in der ImmobilienverwaltungsFactory wieder.

#### 7.1.3 Mitarb eiter.

Bei dem Paket Mitarbeiter wurde aus der Klasse des Mitarbeiters der Beschäftigungsgrad, so-
wie die Anmeldedaten herausgenommen, da es vorgegebene Beschäftigungsgrade gibt und die
Anmeldedaten aus Gründen der Datensicherheit nicht im Klartext gespeichert werden sollten.
Deshalb wurde bei den Anmeldedaten auch eine Hash-Funktion sowie eine Prüfungsfunktion
eingebaut, sodass die Sicherheit im System gewährleistet werden kann.

Weiterhin gibt es im Unternehmen nur eine begrenzte Anzahl an Kompetenzen, deshalb wur-
den auch diese aus der Klasse Sacharbeiter herausgenommen und in eine eigene Enumeration
mit dem Namen Kompetenz überführt.

#### 7.1.4 Immobilien

In der Analyse wurde gerade bei den Immobilien viel Wert darauf gelegt, dass wir diese mit-
hilfe von unterschiedlichen Medien darstellen. Durch verschiedene Blickwinkel kann sich der
Kunde auch schon vor einer Besichtigung ein Bild von der Immobilie machen. Deshalb wurden
die Klasse Medien hinzugefügt, welche wieder verfeinert werden konnte zu: Bild, Video und
3D-Visualisierung.

Auch die Lageinformationen wurden in eine eigene Klasse überführt, dies macht die Speiche-
rung von möglichen wichtigen Attributen zur Umgebung, als auch zur Immobilie selber mög-
lich. Somit kann ein Sachbearbeiter gleich weitere Details zur Umgebung liefern, falls das der
Kunde wünscht. Dazu zählen die Entfernungen zu dem nächsten Bahnhof, Arzt und Lebens-
mittelgeschäft. Weitere Attribute können dem Entwurfsklassendiagramm entnommen werden.

Bei der Immobilie wurde auch der Objektzustand auf eine begrenzte Anzahl reduziert, um die-
sen auch vergleichbar zu halten mit anderen Immobilien. Deshalb kann der Zustand mit einer
Beschreibung sowie Kriterien aus dem Enumeration Objektzustand herausgenommen werden.
Weitere Aufzählungen wurden für den Energietyp, Ausstattungstyp und die Gebäudeart ein-
gebaut.

Eine weitere Differenzierung kann auch bei einer Wohnimmobilie beobachtet werden. Die-
se kann wieder in verschiedene Zimmer spezifiziert werden wie beispielsweise: Schlafzim-


Immobilienverwaltung Pakete

mer, Badezimmer oder auch Abstellkammer. Diese Feinheiten erlauben es beim Filtern bessere
Suchtreffer zu erzielen.

#### 7.1.5 Personen

Bei dem Paket Personen, wurde die Klasse Person abstrakt umgesetzt, da diese nur zur Ver-
erbung verwendet werden soll. Im Programm muss sichergestellt sein, dass es sich um eine
Privat- oder Geschäftsperson handelt. Dies ist mit dieser Veränderung nun gewährleistet.

#### 7.1.6 Vermittlung

Die Vermittlung konnte fast vollständig aus dem Analyseklassendiagramm übernommen wer-
den. Es wurde nur eine Kleinigkeit geändert, sodass nun deutlich erkennbar ist, dass ein Notar
von der abstrakten Klasse Person erbt. Dies war im Analyseklassendiagramm nicht so direkt
ersichtlich.

#### 7.1.7 Immobiliennanzierung.

Beim Paket der Immobilienfinanzierung muss deutlich auf die Fabrik hingewiesen werden,
welche auch in den Paketen Vermittlung, Dokument und Immobilie zum Einsatz kommt. Die-
se ist für die Erstellung der unterschiedlichen Finanzierungsmöglichkeiten eingebaut worden,
sodass diese zentral von einem Ersteller erzeugt werden.

Des Weiteren wurde eine Geschäftsperson mit im Paket abgebildet um das externe Unterneh-
men, eine Finanzierungsgesellschaft, deutlich hervorzuheben. Die Immobilienfinanzierung,
Fremdkapitalfinanzierung, sowie Eigenkapitalfinanzierung wurden als abstrakte Klassen um-
gesetzt, da diese einschließlich zur Vererbung verwendet werden.

#### 7.1.8 Dokumente.

Analog zu der Fabrik im Paket Immobilienfinanzierung gibt es auch im Paket Dokumente eine
Fabrik, welche alle Dokumente erstellt. Aus Gründen der Übersichtlichkeit wurde diese Fabrik
sowohl bei der Vermittlung, Immobilien als auch bei den Dokumenten nicht im Entwurfsklas-
sendiagramm eingezeichnet. Diese befindet sich jedoch in der Software in diesen Paketen und
erben von der ImmobilienverwaltungsFactory vom zentralen Model Paket.

#### 7.1.9 GUI

Bei der Oberfläche erben alle Klassen von der zentralen GUI-Komponente, welche selbst wie-
der von JComponent erbt. Des Weiteren bestehen verschiedene Verbindungen von unterschied-
lichen GUI-Elementen zu anderen. Jedoch werden in diesem Entwurfsklassendiagramm auch


Immobilienverwaltung Verwendete Entwurfsmuster

nicht alle Klassen aufgezählt, da es sonst wieder unübersichtlich werden würde. Die Auswahl
ist auf die Klassen beschränkt, welche auch später im GUI-Entwurf verwendet werden.

#### 7.1.10 Event

Das Paket Event beinhaltet vor allem den GUI-Observer, welcher wieder zur Vererbung ver-
wendet wird. Neben spezifischeren Observern findet sich in diesem Paket aber auch ein Up-
dateEventListener und ein UpdateEventSender. Beide Interfaces sind für den GUIController
wichtig und müssen vorhanden sein, um auf unterschiedliche Interaktionen zu reagieren.

### 7.2 VerwendeteEntwurfsmuster

Entwurfsmuster sind Lösungsvorlagen für häufig auftretende Probleme beim Softwareent-
wurf, deshalb werden sie häufig in der Softwarearchitektur verwendet. Ein Entwurfsmuster
löst ein oder mehrere Probleme und bietet ein erprobtes Konzept. Für die Immobilienverwal-
tung finden einige solcher Muster Anwendung, welche nachfolgend aufgezeigt werden.

#### 7.2.1 Objektadapter

Ein Objektadapter wurde beim Import für die Wiederverwendbarkeit eingeführt. Dabei wird
beim ImportAdapter nur die Methode aufgerufen, anhand von der Aktion, welche man impor-
tieren will. Dieser ist selber jedoch nicht das endgültige Ziel sondern benutzt eines der beiden
Interfaces für den Text- oder CSV-Import. Durch diesen Objektadapter konnten mehrere Inter-
faces zusammengeführt werden.

#### 7.2.2 Fabrikmetho de.

Die Fabrikmethode wurde eingeführt um das Erzeugen von Objekten an einer zentralen Stelle
durchzuführen. Sowohl für die Immobilienfinanzierung, Vermittlung, Immobilien, als auch für
die Dokumente werden weitere Objekte erzeugt werden müssen. Deshalb kommt diese Fabrik
auch im Hauptpaket „Model“ als Interface zur Verwendung, da man zentral diese verwenden
kann. Bei der Immobilienfinanzierung wird dabei anhand von eines Parameters unterschieden,
welche Art von Finanzierung erzeugt werden soll.

#### 7.2.3 Singleton.

Im Entwurfsklassendiagramm sind gleich mehrere Einzelstücke eingebaut. Dazu zählt die Im-
mobilienverwaltung, der GUIController, die Datenbank, etc. Dabei soll sichergestellt werden,


Immobilienverwaltung Verwendete Entwurfsmuster

dass diese Klasse genau ein einzelnes Objekt erzeugt und verwaltet. Am Beispiel von der Da-
tenbank ist dies deutlich zu erkennen. Es können verschiedene Operationen auf die Datenbank
ausgeführt werden, jedoch würde es keinen Sinn ergeben, wenn man alle Daten an einer Stelle
persistent speichern möchte ein zweites Objekt Datenbank zu erzeugen.

Mithilfe von Singelton ist sichergestellt, dass nur ein Objekt erzeugt wird, gleichzeitig dient es
auch als Enititymanager. Zum Entwurfsklassendiagramm ist zu notieren, dass die eingesetzte
Software zum Erstellen des Diagramms (StarUML) nicht in der Lage ist Rückgabetypen von
Methoden anzuzeigen, deshalb fehlen diese im Diagramm.

#### 7.2.4 Komp ositum

Um mehrere Teile eines Ganzen darzustellen wurde auch ein Kompositum mit implementiert.
Bei der Vermittlung ist dies zu erkennen, diese besteht aus mehreren Klassen und bildet so eine
kleine Baumstruktur ab. Dies ermöglicht sowohl einzelne Schritte in der Vermittlung sich an-
zuschauen, als auch die komplette Vermittlung als ein Ganzen zu betrachten. Durch ein Kom-
positum kann dies korrekt im System nachgebildet werden. Zu diesem Kompositum gehören
die Klassen Vermittlung, Übergabe, Besichtigung, Abschluss, Beratung aus dem Paket Vermitt-
lung.

#### 7.2.5 Beobachter.

Die unterschiedlichen Beobachter wurden bei uns im Entwurfsklassendiagramm passiv im-
plementiert, d.h. der Observer reagiert nur, wenn dieser auch benachrichtigt wird. Diese Be-
nachrichtigung erfolgt durch die Verbindung zwischen der GUI-Komponente und dem GUI-
Observer.
Die Wahl fiel auf den Beobachter, da verschiedene GUI-Komponenten nur dargestellt werden,
wenn auch andere zu sehen sind. Somit besteht zwischen verschiedenen Komponenten eine
Abhängigkeit. Darüber hinaus schwankt die Anzahl der zu ändernden Komponenten. Aus
diesem Grund war die logische Schlussfolgerung einen Beobachter einzusetzen, welcher die
anderen Klassen beobachtet und bei einer Änderung reagiert.


Immobilienverwaltung Verwendete Entwurfsmuster

```
Abbildung 7.1: Entwurfsklassendiagramm der Immobilienverwaltungssoftware
```

Immobilienverwaltung GUI-Entwurf

## 8 GUI-Entwurf

Die nachfolgenden Mockups visualisieren Teilausschnitte des Softwareprodukts. Bei diesen
Mockups wurden insgesamt zwei unterschiedliche Gesamtansichten ausgewählt. Diese wer-
den im Folgenden näher beleuchtet.
Hierbei stehen in erster Linie die Navigation, das Design und das Zusammenspiel einzelner
Komponenten im Vordergrund. Die komplette Oberfläche ist mit einem eigenen Design aus-
gestattet worden. In den Qualitätsanforderungen wurde weiterhin ein hoher Wert auf Gestal-
tung, Funktionalität und Benutzbarkeit gelegt. Deshalb wurden sämtliche Elemente mit größ-
ter Sorgfalt, unter Einhaltung moderner Designrichtlinien entworfen. Hierbei stehen die einfa-
che Nutzbarkeit, die Übersichtlichkeit und der schnelle Zugriff auf alle wichtigen Funktionali-
täten im Fokus.
Beide der nachfolgenden Entwürfe wurden für eine Desktop-Ansicht erstellt. Bei dem mobilen
Design der Immobilienverwaltung werden einzelne Elemente an anderen Stellen positioniert,
da der Platz anders ausgenutzt werden muss als im Desktop Betrieb.

### 8.1 Hauptüb ersichteinesSachb earb eiters.

```
Abbildung 8.1: GUI Ansicht der Hauptübersicht nach dem Programmstart
```

Immobilienverwaltung Detailansicht einer Immobilie

Nach dem Programmstart der Immobiliensoftware, landet der Benutzer automatisch in seiner
Hauptübersicht. Diese wurde auch anhand des Kundenwunsches (siehe Analyse) weiterentwi-
ckelt. Dabei kann der Benutzer, über die Menüleiste am oberen Rand, direkt in andere Bereiche
der Software abspringen um beispielsweise Immobilien oder Kunden zu verwalten. Die Reiter
der Menüleiste sind in jeder Ansicht vorhanden, somit hat jeder Mitarbeiter durch die ganzen
Abläufe immer eine Konsistenz, welche für eine gute Zuverlässigkeit spricht.

Nach der Menüleiste findet jeder Mitarbeiter seine Termine in der ersten Liste am linken Rand.
Für einen besseren Überblick wurde hier nur die Uhrzeit des Termins und der Betreff angege-
ben. Neben den Terminen findet der Sachbearbeiter Hr. Müller seine aktuellen Vermittlungen,
welche aktuell offen sind. Dabei wird sowohl der Interessent genannt, als auch die Immobilie,
an der er Interesse zeigt. Ganz am rechten Rand findet sich die letzte Liste mit allen Daten, die
im System gespeichert sind. Darunter fallen alle Immobilien, sowie alle Kundendaten, als auch
Finanzierungsdaten einer Immobilie.

Der Entwurf in Listen wurde deshalb umgesetzt, da die mobile Ansicht dann die Listen un-
tereinander anzeigen kann und der Benutzer schnell einen guten Überblick über das Tagesge-
schäft bekommen kann. Um die Effizienz noch etwas zu erhöhen, werden Details unter den
Listen angezeigt, zu dem Listeneintrag, welchen der Benutzer gerade selektiert hat. Sollte er
weitere Informationen benötigen oder das Element bearbeiten, kann er dies über den Button
am rechten unteren Rand tun.

Wichtig bei der Umsetzung der Hauptseite ist die konstante Navigationsleiste über den Listen,
sowie die Listen selbst, welchen einen schnellen Überblick geben. Der Bereich mit den Details
rundet diese Schnellansicht ab. Sollte der Benutzer diese Anordnung der Listen nicht passend
finden, kann er diese auch in den Einstellungen, welche hinter dem Reiter mit den drei Punkten
in der Navigationsleiste verborgen ist, ändern.

### 8.2 DetailansichteinerImmobilie.

Die Detailansicht für Immobilien befindet sich hinter dem Menüreiter Immobilien. Dort steht
dem Benutzer eine Liste zur Verfügung, in der alle Immobilien gelistet sind. Natürlich werden
nicht alle Elemente dieser Liste direkt geladen. Mithilfe von Lazy-Loading wird immer nur
ein Teil der Liste geladen. Für das schnelle finden einer Immobilie kann über der Liste die
Suche verwendet werden, welche die Liste der Immobilie durchsucht. Durch einen Klick auf
ein Listenelement werden zu diesem Punkt alle wichtigen Details daneben angezeigt.

Im vorliegenden Mockup wurde eine Kaufimmobilie ausgewählt. Grundsätzliche Daten auf
dieser Detailansicht erkennbar. Darunter fallen die Adresse, sowie für die Kaufimmobilie der
Kaufpreis als auch Informationen zum Objektzustand. In der Beschreibung darunter sind wei-


Immobilienverwaltung Detailansicht einer Immobilie

tere Details zu der Immobilie als auch Informationen für den Sachbearbeiter hinterlegt. Für
einen schnellen Überblick, ist die Örtlichkeit auch auf der Karte dargestellt.

Ist der Eintrag nicht korrekt oder es werden weitere Details benötigt sind in der rechten Ecke
in dieser Detailansicht kleine Symbole. Mit einem Klick auf das erste bekommt man alle De-
tails angezeigt und kann diese auch noch weiter bearbeiten. Wünscht der Interessent einen
Ausdruck der Immobilienanzeige, so kann dieser mit dem Drucker-Symbol rechts daneben,
durchgeführt werden. Des Weiteren können die Informationen natürlich auch über einen Link
geteilt werden. Schlussendlich gibt es noch das Löschen-Symbol, welches den Eintrag löscht
und komplett aus dem System heraus nimmt. Sollte dieses Immobilienobjekt Bestandteil einer
Vermittlung sein, funktioniert das Löschen jedoch nicht.

Für den Sachbearbeiter ist es wichtig, dass er den Anbieter der Immobilie direkt aus diesem
Bildschirm kontaktieren heraus kann, deshalb hat er diese Option direkt unter der Karte dar-
gestellt. Mit dem Klick auf diesen Button öffnet sich ein Pop-Up Fenster, welches die Kon-
taktdaten darstellt, somit kann er den Anbieter entweder telefonisch oder auf einem anderen
Kommunikationsweg kontaktieren.

Direkt darunter befindet sich noch ein weiterer Button, sodass man diese Immobilie einer Ver-
mittlung hinzufügen kann. Weitere Details zu diesem Aufruf sind in dem nachfolgenden Kom-
munikationsschema aufgeführt worden.

```
Abbildung 8.2: GUI Ansicht der Unterseite zum Verwalten der Immobilien
```

Immobilienverwaltung Kommunikationsschema der GUI

### 8.3 KommunikationsschemaderGUI.

Grundsätzlich wurde diese Kommunikation in der Abbildung 8.3 deutlicher dargestellt, als im
Entwurfsklassendiagramm. Hierbei wurden aus Gründen der Übersichtlichkeit nur Elemente
visualisiert, welche auf dem Mockup der Immobilienansicht in Abbildung 8.2 zu erkennen
sind.

Sollte ein Sachbearbeiter nun die aktuelle Immobilie zu einer Vermittlung hinzufügen wollen,
löst er durch den Klick auf den Button ein ActionEvent aus, welches vom ActionListener im
Paket Events aufgefangen wird. Dies wird benötigt um einen kleinen Ladebalken auf dem
Bildschirm erzeugen zu können, sodass der Nutzer den Prozess wahrnehmen kann.
Zusätzlich dazu wird der GUIObserver informiert, dass dieses Event abgefeuert wurde, wel-
cher auch mit dem GUIController verbunden ist. Der GUIController weißt die GUI darauf hin
an, dass ein Eingabefenster erzeugt werden soll. In diesem Eingabefenster hat der Nutzer ein
Suchfeld, mit dem er nach dem Namen der Vermittlung oder der Vermittlungsnummer suchen
kann.

Bei der Eingabe werden ihm noch keine Vorschläge angezeigt. Erst nach Absenden der Anfra-
ge, wird der GUIController darüber informiert und kann anhand der eingegebenen Werte im
Model, die korrekten Daten entnehmen, welche dieser dann wieder zurück an die GUI sendet.
Dort werden diese Daten dann in Form einer Liste angezeigt. Der Benutzer kann darauf hin
einen Listeneintrag auswählen und die Verbindung der beiden Objekte bestätigen.
Erst nach der Bestätigung wird der GUIController über diese neue Verbindung, zwischen einer
Immobilie und einer Vermittlung informiert. Das heißt, bei einem Abbruch vor der Bestätigung
müssen keine Daten rückgängig gemacht werden.

Nach dieser Bestätigung weißt der GUIController das Model an, diese Beziehung persistent
zu speichern. Parallel zu diesem Speichervorgang weißt der GUIController die Oberfläche an,
wieder ein Ladebalken anzuzeigen, sodass der Nutzer diesen Prozess auch visuell wahrneh-
men kann.
Erst danach gibt der GUIController die Aufforderung, zur Weiterleitung auf die Vermittlungs-
übersicht, an die GUI weiter. Dabei wird von dem Controller ein Update an die Events ge-
schickt, sodass der VermittlungsObserver mitbekommt, dass sein GUI Objekt angezeigt wer-
den soll. Alle weiteren Elemente der entsprechenden Seite, werden analog natürlich auch dar-
über informiert.

Die Ladevorgänge in diesen Beispiel fallen im Millisekunden bis Sekundenbereich aus. Aus
diesem Grund wurde die Darstellung von Ladebalken mit in das Konzept aufgenommen. Die-
se sind jedoch, wie das Eingabefenster, nicht in der Abbildung 8.3 modelliert, da diese aus
Gründen der Übersichtlichkeit einfach gehalten wurde.


Immobilienverwaltung Kommunikationsschema der GUI

```
Abbildung 8.3: GUI-Kommunikation innerhalb der Immobilienverwaltungssoftware
```

Immobilienverwaltung Besonderheiten

## 9 Besonderheiten

Um unsere Immobilienverwaltungssoftware im Vergleich zu anderen Softwareprodukten am
Markt hervorzuheben, haben wir bei der Planung verschiedene zusätzliche Funktionen imple-
mentiert. Die implementierten Funktionen werden im Folgenden kurz aufgezählt und erläu-
tert.

### 9.1 VarianzundKundenorientierung

Grundsätzlich wurde die Software so entwickelt, sodass diese für jede Art von Immobilien
verwendet werden kann. Dies wurde auch im Bezug auf die Kundenorientierung eingebaut,
da die ImmoManage GmbH sehr viel Wert auf ihr Motto: „Der Kunde ist bei uns König“ legt.
Diese Varianz innerhalb der Software, ist in der heutigen Gesellschaft sehr wichtig, da es so
möglich ist auf unterschiedliche und neue Arten vom Immobilien sofort zu reagieren. Des-
halb werden auch verschiedene Arten von Medien eingesetzt um eine Immobilie am besten zu
vermitteln. Die Vielzahl der Medien findet sich im Entwurfsklassendiagramm wieder.

### 9.2 Backups

Der Administrator hat die Möglichkeit, direkt aus der Anwendung heraus ein Backup zu er-
stellen. Des Weiteren ist es ihm gestattet den Zeitplan für die Backups manuell anzupassen,
somit können die Zeitintervalle verkürzt werden und dadurch auch die Anzahl der Backups
erhöht werden. Grundsätzlich sind die Standardeinstellungen so eingerichtet, sodass alle 24
Stunden ein Backup von den Daten angefertigt wird.

### 9.3 Üb ersichtlichkeit

Um unseren Benutzern eine einfache und übersichtliche Möglichkeit bieten zu können, alle
Aktivitäten auf einen Blick zu sehen, wurde eine einfache und klare Übersicht implementiert,
die mithilfe von drei Listen arbeitet. Darüber hinaus werden auf der Hauptansicht die Details
zu einem Listenpunkt angezeigt, sobald ein Eintrag selektiert wurde.

Durch einen kurzen Blick auf die Listen, weiß der Benutzer sofort welche Termine er am heu-
tigen Tag im Kalender stehen hat. Des Weiteren sind die Daten zu Vermittlungen und Kunden
direkt einsehbar oder mithilfe der Suche schnell auffindbar.


Immobilienverwaltung Globaler Server

### 9.4 GlobalerServer

Bei der Planung der Immobilienverwaltung werden verschiedene Aktionen durchgeführt und
unterschiedliche Hilfsmittel benötigt. Um den Benutzern das Planen und Durchführen von
Vermittlungen zu erleichtert, gibt es den globalen Server. Auf diesem sind schon Hilfsmittel
und andere benötigte Daten angelegt und der Benutzer kann diese einfach verwenden.

Der globale Server ist grundsätzlich von 07:00 bis 20:00 Uhr durchgehend verfügbar, in der ver-
bleibenden Zeit, wird das Backup des Systems gemacht und Wartungsarbeiten durchgeführt.
Sollten diese Arbeiten weniger Zeit in Anspruch nehmen, ist das System natürlich auch außer-
halb der Kernzeit verfügbar. Jedoch möchte man gewährleisten, dass der zentrale und globale
Server dauerhaft in der Hauptarbeitszeit verfügbar ist.

### 9.5 Datenverfügbarkeit.

Um eine dauerhafte Verfügbarkeit der Daten zu gewährleisten, werden diese lokal auf dem
aktuellen Rechner in den Zwischenspeicher geschrieben. Sollte der Server aus technischen
Gründen aktuell nicht zur Verfügung stehen, wird in der Zwischenzeit mit den Daten im Zwi-
schenspeicher gearbeitet. Dabei ist nur der Lesezugriff auf die Daten gestattet, somit kann das
Tagesgeschäft mit Limitierungen weiter fortgesetzt werden.

Sobald die Software mit Daten aus dem Zwischenspeicher arbeitet, wird dies dem Nutzer deut-
lich signalisiert, sodass dieser sich darauf einstellen kann, dass er keine Daten von Kunden und
Immobilien bearbeiten kann.

### 9.6 MöglichkeitderexternenSchnittstelle.

Die externe Schnittstelle kann aktuell für die Berater im Außendienst verwendet werden, um
auf die Daten innerhalb der Software zuzugreifen. Dabei ist der Zugriff auf einen Lesezugriff
limitiert.

Diese Schnittstelle könnte in Zukunft weiter ausgebaut werden, sodass das System mit anderen
Systemen kommunizieren kann. Weil der Kunde jedoch keine Anbindung an andere Systeme
zum jetzigen Zeitpunkt gewünscht hat, wurde zwar eine Schnittstelle für die Berater eingebaut,
jedoch nicht an andere Systeme angebunden.


