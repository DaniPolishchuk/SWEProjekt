//reference goal
#let referenceG(labelName) = {
 [(siehe #link(label(labelName), labelName))]
}

//reference question
#let referenceQ(labelName) = {
 [(siehe #ref(label(labelName)))]
}

= Use-Case-Diagramm
Im Rahmen der in diesem Abschnitt folgenden Use-Case-Analyse wird die Funktionalität der gesamten Verwaltungsanwendung für das Bauunternehmen untersucht und verdeutlicht. Zunächst wird ein allgemeines Use-Case-Diagramm erstellt, welches die Hauptfunktionalitäten der Anwendung abbildet. Hierbei wird ein funktionsorientierter Ansatz verfolgt, sodass differenziert auf die einzelnen Funktionalitäten eingegangen werden kann. Beispielhaft wird für ausgewählte Use-Cases eine Verfeinerung vorgenommen, um die Funktionalität des Verwaltens komplexerer Entitäten näher darzustellen. Beispielhaft wurde für einen Use-Case eine Verfeinerung vorgenommen, um die Funktionalität des Verwaltens der Geräte näher darzustellen.

== Rollen-Erläuterung der Anwendung
Das Diagramm wird aus sechs Akteuren zusammengesetzt, von denen die meisten den Rollen in der Anwendung entsprechen, wie sie in @chapter-Zielgruppen-Rollen und @Rolle-Berechtigungen definiert wurden. Lediglich das Finanzbuchhaltungssystem ist keine klassische Benutzerrolle, sondern ein externes System, welches über eine unidirektionale Schnittstelle mit der Verwaltungssoftware verbunden ist.
Durch die Verwendung von Vererbungsbeziehungen zwischen den Akteuren werden gemeinsame Funktionalitäten auf Basisakteuren wie dem Mitarbeiter definiert. Spezialisierte Rollen erben diese Funktionen und werden um weitere Fähigkeiten erweitert.

=== Mitarbeiter
Normale Mitarbeiter (z.B. Bauarbeiter) führen die ihnen zugewiesenen Aufgaben auf den Baustellen aus. Sie haben Zugriff auf die für ihre Arbeit relevanten Informationen. Dazu gehört das Lesen von Arbeitszeiten und den Terminplaner mit den für ihn relevanten Daten. Des Weiteren hat ein Mitarbeiter die Funktionalität für Daten im System zu suchen und zu filtern. 

Der Mitarbeiter stellt dabei die grundlegende Basisrolle innerhalb der Anwendung dar. Diese Rolle fasst allgemeine Funktionen zusammen, die von mehreren spezifischen Rollen genutzt werden.

=== Vorarbeiter
Vorarbeiter erweitert die Funktionalitäten eines Mitarbeiters um lesenden Zugriff auf vergangene, aktuelle und zukünftige Arbeitsaufträge #referenceQ("q_Vorarbeiter-zukünftige-Arbeitsaufträge") sowie auf Geräte. Des Weiteren erhalten sie detaillierte Informationen durch Einsehen des Terminplaners und lesenden Zugriff auf Geräte. Sie sind das Bindeglied zwischen Bauleitung und Bauarbeitern. Sie koordinieren die Ausführung der Arbeitsaufträge auf der Baustelle, überwachen die Einhaltung von Terminen und sorgen für die Umsetzung der zugewiesenen Aufgaben.

=== Verwaltungsmitarbeiter
Verwaltungsmitarbeiter besitzen alle Funktionen der Basisrolle "Mitarbeiter". Sie arbeiten überwiegend im Büro und sind primär für die Pflege und Organisation der zentralen Datenbestände zuständig #referenceQ("q_Aufgabe-Verwaltung-Admin"). Dabei verwalten sie Mitarbeiterstammdaten und Gruppenzuordnungen und haben auf projektbezogene Daten (Buchungen, Projekte, Arbeitsaufträge) Leserechte #referenceQ("q_Verwaltungsmitarbeiter-Leserecht-Projektdaten"). Zusätzlich unterstützen sie die Bau-/Projektleiter beim Verwalten der Geräte. Auch sie erhalten eine detaillierte Einsicht in den Terminplaner mit für ihre Arbeit relevanten Informationen. 
//TODO: der Verwaltungsmitarbeiter legt Gruppen an => in Lastenheft korrigieren: es steht nur dass der Benutzer sie verwalten kann???
//TODO: Zugriff lesend auf Finanzdaten miteinbringen?

=== Bau- und Projektleiter
Projektleiter und Bauleiter erben ebenfalls die Funktionen der Basisrolle "Mitarbeiter". Sie sind für die operative Steuerung und Umsetzung von Projekten verantwortlich, wobei sie die Planung, Zuweisung von Ressourcen (Mitarbeiter, Geräte) und die Überwachung des Projektfortschritts koordinieren. Dazu haben sie zum Verwalten Vollzugriff auf projektspezifische Daten (Buchungen, Projekte, Arbeitsaufträge, Unteraufträge) und Geräte und können alle Informationen im Terminplaner einsehen.
//TODO: Vollzugriff auf Terminplaner ok?

=== Administrator
Der Administrator verfügt über die Rechte aller Benutzerrollen und ist als Verwaltungsmitarbeiter mit erweiterten Rechten zu verstehen. Er übernimmt die Verwaltung der Benutzerkonten, indem er ihnen Rollen zu weist. Darüber hinaus ist er für systemkritische Aufgaben wie Datenmigration durch Import/Export, Backups und die Archivierung von Daten verantwortlich. Er ist hierbei ein Teil des regulären Teams, da eine dedizierte IT-Person nicht vorgesehen ist #referenceQ("q_dedizierte-IT-Person").

== Use-Case-Diagramm der gesamten Anwendung
#figure(
  image("../assets/UseCase-Bauunternehmen-Kompaktansicht.svg", width: 100%),
  caption: [Use-Case-Diagramm der gesamten Anwendung -- Kompaktansicht der Bauunternehmens-Verwaltungssoftware]
) <uc_kompakt>

Das in @uc_kompakt dargestellte Use-Case-Diagramm visualisiert die Gesamtübersicht der Verwaltungssoftware in einer sehr kompakten Form. Hierbei sind die wichtigsten Use-Cases im Allgemeinen dargestellt. Diese trennen sich in weitere Diagramme zu detaillierteren Anwendungsfällen auf.

=== Erläuterung der Darstellung und Farbcodierung
Das Use-Case-Diagramm verwendet eine Farbcodierung zur besseren Übersichtlichkeit und Gruppierung der Funktionalitäten nach Zuständigkeitsbereichen:

- *Hellblau (Administrator-Funktionen):* Die in hellblau dargestellten Use-Cases sind ausschließlich dem Administrator vorbehalten. Diese Funktionen umfassen systemkritische Operationen wie Datenmigration aus dem Altsystem, Import/Export, manuelle und automatische Backups.
- *Grün (Verwaltungsbezogene Funktionen):* Die grün eingefärbten Use-Cases repräsentieren die Kernfunktionalitäten der Verwaltung. Diese Verwaltungsfunktionen betreffen sowohl Verwaltungsmitarbeiter als auch Bau- und Projektleitung. Dabei hat die Verwaltung teilweise nur lesenden Zugriff und die Bau- und Projektleitung keinen Zugriff auf Personaldaten.
- *Orange (Vorarbeiter-Funktionen):* Die orange markierten Use-Cases zeigen die lesenden Zugriffe des Vorarbeiters. Diese Rolle hat ausschließlich Lesezugriff auf die für ihre Arbeit relevanten Informationen. Der Vorarbeiter kann eigene Arbeitsaufträge einsehen, den Terminplaner konsultieren und Informationen zu benötigten Geräte abrufen, jedoch keine Daten bearbeiten.
- *Hellgrün (Mitarbeiter-Grundfunktionen):* Die hellgrün eingefärbten Use-Cases am oberen Rand des Diagramms sind dem Mitarbeiter zugeordnet. Diese Basisrolle hat minimale Systemrechte und kann primär eigene Daten einsehen.
- *Gelb (Externe Systemschnittstelle):* Der gelb markierte Use-Case repräsentiert die Integration mit dem Finanzbuchhaltungssystem.
- *Rot (Vertiefung)*: Die rot markierten Use-Cases werden im Verlauf noch weiter vertieft.


=== Daten suchen und filtern
Dieser User-Case ermöglicht allen Akteuren, die von der Rolle "Mitarbeiter" erben, das Suchen und Filtern nach Daten im System. Die Suchergebnisse sind rollenbasiert eingeschränkt, sodass jeder Benutzer nur auf die für ihn zugänglichen Daten zugreifen kann. Die Suche erfolgt über eine Kombination aus Textsuche (Name, Bezeichnung) und Filterung nach Kategorien/Attributen #referenceQ("q_Beschreibung-der-Suche"). Separate Suchmasken existieren für Mitarbeiter, Gruppen, Arbeitsaufträge, Projekte, Geräte und Lager #referenceQ("q_Suchmasken"). Die Suchergebnisse werden als Tabelle mit den wichtigsten Attributen angezeigt, wobei ein Klick auf einen Eintrag die Detailansicht öffnet #referenceQ("q_Anzeige-Suchergebnisse"). Die Ergebnisse können nach verschiedenen Spalten sortiert werden #referenceQ("q_Sortierung-Suchergebnisse").
//TODO: auf Auswahlisten (LF70) würde ich hier nicht eingehen
//TODO: "Alternativ kann eine zentrale Suche mit Kategorie-Auswahl verwendet werden." => stammt aus F22 -> kann man wegen mir entfernen (unnötig)

=== Arbeitszeiten lesen
Der Zugriff auf die Anwesenheitszeiten hängt von der Rolle ab. In erster Linie kann jeder seine eigenen Anwesenheitszeiten einsehen. Darüber hinaus hat der Vorgesetzte zusätzlich Einsicht auf die Anwesenheitszeiten seiner untergeordneten Mitarbeiter. Schlussendlich hat der Administrator Vollzugriff auf die Anwesenheitszeiten, um beispielsweise fehlerhafte Daten zu korrigieren #referenceQ("q_Rechte-auf-Anwesenheitszeiten").

=== Terminplaner lesen
Auch dieser Use-Case ist rollenbasiert eingeschränkt. Jeder sieht nur so viele Daten wie nötig #referenceQ("q_Rechte-Terminplaner"). Die Vorarbeiter und Mitarbeiter sehen nur die für sie relevante Daten, wie Start und Ende von Projekten oder Verfügbarkeit von Geräten (nur Vorarbeiter). Die Verwaltungsmitarbeiten haben volle Leserechte und sehen daher alle Arbeitsaufträge mit ihren Unteraufträgen sowie Projekte mit den zugeordnete Mitarbeiter und Geräten. Die Bau-/Projektleiter haben ebenfalls volle Lesezugriffe und zusätzlich Schreibrechte, sodass sie Termine eintragen, verschieben und löschen können.
Die Darstellung erfolgt als Kalenderansicht mit Monats- und Wochenansicht, wobei passend (je nach Start- und Enddatum) Arbeitsaufträge und Projekte angezeigt werden, deren Detailansicht per Klick sichtbar ist #referenceQ("q_Form-Terminplaner").

=== Arbeitsaufträge lesen
Dieser Anwendungsfall ermöglicht es Vorarbeitern, ihre Arbeitsaufträge einzusehen. Darüber hinaus können sie auch verschiedene Unteraufträge ansehen, falls vorhanden.  
//TODO: kann man das ausführen?

=== Geräte lesen
Dieser Anwendungsfall ermöglicht es Vorarbeitern, Geräte einzusehen. Hierbei wird ersichtlich, welche Geräte gerade verfügbar sind und auf der Baustelle bei ihren Arbeitsaufträgen eingesetzt werden können.
//TODO: soll man hinzufügen, dass sie als Bindeglied/Unterstützung den Bau-/Projekleitern dann einen Buchungsvorschlag für Geräte machen?

=== Arbeitsaufträge und Projekte lesen
Während der Use-Case "Arbeitsaufträge lesen" sich auf die reine Einsicht der Arbeitsaufträge bezieht, ist bei diesem Use-Case eine zusätzliche Einsicht auf die verschiedenen Projekte der Arbeitsaufträge möglich. Diese vollständige Einsicht ist für die Pflege und Organisation der zentralen Datenbestände - was eine zentrale Aufgabe der Verwaltung ist - nötig.

=== Verwaltungsdaten bearbeiten
Dieser Anwendungsfall beschreibt die zentrale Verwaltungsfunktion der im System vorhandenen Daten. Dazu hat der Anwendungsfall 5 verschiedene extension-points:
- Buchung verwalten  
- Geräte verwalten verwalten 
- Arbeitsaufträge und Projekte verwalten
- Personal verwalten
//TODO: Arbeitsaufträge und Projekte lesen zählt doch nicht zu bearbeiten oder?

=== Personal verwalten
Durch diesen Use-Case können Verwaltungsmitarbeiter Mitarbeiterstammdaten anlegen, bearbeiten und löschen. Dies umfasst die Eingabe von Personalien (Vorname, Nachname, Geburtsdatum), Kontaktdaten (E-Mail, Telefonnummer, Adresse) und Vertragsdaten (Position, Beschäftigungsart, Vertragsbeginn/-ende) mit einer eindeutigen Mitarbeiternummer. Die Adresse wird dabei als separate Entität modelliert und über eine Referenz zugeordnet. Das System prüft dabei automatisch auf mögliche Duplikate anhand von den Attributen. 
Des Weiteren umfasst dieser Use-Case auch das Anlegen und Zuordnen von Gruppen. Die Gruppentypen (Verwaltung, Planung, Projektleitung, Bauleitung, Baugruppen) sind fest vorgegeben. Jede Gruppe erhält eine eindeutige Gruppennummer, einen Namen, eine Beschreibung und optional einen Gruppenleiter. Ein Mitarbeiter kann mehreren Gruppen angehören, eine Gruppe kann mehrere Mitarbeiter enthalten #referenceQ("q_Gruppenerstellung").

=== Geräte verwalten
siehe Vertiefung

=== Arbeitsaufträge und Projekte verwalten
Dieser Use-Case erweitert den Use-Case "Arbeitsaufträge und Projekte lesen" um Schreibrechte, wodurch Arbeitsaufträge und Projekte angelegt, bearbeitet und gelöscht werden können. Hierzu werden Attribute wie Auftragsbezeichnung, Start-/Endtermin, Einsatzort, beteiligte Personen und Status festgelegt sowie Projekte über eine Referenz zugeordnet. Der Kostenvoranschlag wird aus dem Finanzbuchhaltungssystem lesend übernommen. \
Um ein Projekt zu referenzieren muss dieses zuerst mit Attributen wie Projektname, Projektleiter und Einsatzort angelegt werden. Der Einsatzort eines Projektes ist dabei detaillierter als der eines Arbeitsauftrag. Ein Projekt kann zunächst ohne Aufträge existieren. \
Darüber hinaus umfasst dieser Use-Case auch das Anlegen, Bearbeiten, Löschen und Zuordnen von Unteraufträgen. Dies geschieht in der Detailansicht des jeweiligen Arbeitsauftrags #referenceQ("q_Ansicht-Unteraufträge"). Ein Unterauftrag ist dabei ein Auftrag der von einem Unterauftragnehmer ausgeführt wird. Der Unterauftragnehmer wird per Referenz zugeordnet und von der Verwaltung angelegt. 

Während des ganzen Prozesses prüft das System auf Duplikate #referenceG("LF 100"). Nach erfolgreicher Anlage ist der Arbeitsauftrag und die enthaltenen Unteraufträge und Projekte im Terminplaner sichtbar. 

=== Buchungen verwalten
In diesem Use-Case können Bau-/Projektleiter Geräte buchen, worunter für einen Arbeitsauftrag benötigte Baumaschinen und Bauwerkzeuge fallen. Dabei wird das gewünschte Gerät über eine Auswahlliste ausgewählt. Durch Angabe des Zeitraum und des Arbeitsauftrag prüft das System automatisch die Verfügbarkeit des Geräts im angegebenen Zeitraum. Bei Verfügbarkeit wird die Buchung angelegt und erhält eine eindeutige Buchungsnummer. Bei Nichtverfügbarkeit wird wiederum eine Fehlermeldung angezeigt. 
Ebenfalls können bestehende Buchungen bearbeitet oder storniert werden. Die Buchungsverwaltung ermöglicht die Übersicht über alle aktuellen und zukünftigen Buchungen anhand des Status (aktiv, abgeschlossen, storniert).
//TODO Verfügbarkeit prüfen

=== Finanzdaten lesen
Finanzdaten werden aus dem Finanzbuchhaltungssystem ausgelesen und dem Verwaltungsmitarbeiter zur Verfügung gestellt. Die Finanzdaten werden beispielsweise für dne Kostenvoranschlag beim einem Arbeitsauftrag benötigt. Die tatsächliche Verwaltung und Berechnung der Finanzen findet jedoch allein im Finanzbuchhaltungssystem hat, wodurch dieses System nur Leserechte auf die Finanzdaten hat.

=== Daten Daten archivieren (10 Jahres Frist)
Bei diesem Use-Case sollen alle Daten die noch nicht 10 Jahre alt sind archiviert werden. Darunter fallen alle Daten die aktuell nicht mehr verwendet werden, jedoch aus rechtlichen Gründen noch bis zu 10 Jahre zugänglich sein müssen. Sofern keine anderen rechtlichen oder geschäftlichen Gründe dagegen sprechen, werden die Daten nach 10 Jahren endgültig gelöscht #referenceQ("q_10-Jahres-Frist-Ablauf").

=== Benutzerrollen verwalten
Dieser Use-Case wird vom Administrator ausgeführt und passiert, nachdem die Verwaltung einen neuen Benutzter im System angelegt hat. Durch die Vergabe der Rolle hat der Benutzter bestimmte Rechte auf das System.


=== Daten übertragen
Das Übertragen von Daten ist ein sicherheitskritischer Vorgang und wird daher ausschließlich dem Administrator vorbehalten. Das beinhaltet den Import und Export von Daten, die als eigener Use-Case inkludiert werden. Dies hat den Grund, dass der Import und Export von Daten systemweit möglich ist und so auch von anderen Use-Cases genutzt werden kann.

=== Daten importieren
Der Import kann beispielsweise aus dem Altsystem oder anderen Quellen im CSV-Format erfolgen #referenceQ("q_Import-Format"). Alle relevanten Daten können importiert werden: Mitarbeiterdaten, Auftragsdaten, Baumaschinen- und Werkzeugdaten, Gruppenzuordnungen #referenceQ("q_Import-Export-Daten"). Das System prüft beim Import automatisch auf Duplikate und zeigt Warnungen an. Duplikatswarnungen können überschrieben werden.

=== Daten exportieren
Der Export erfolgt ebenfalls im CSV-Format und dient der Erstellung von Berichten oder Backups #referenceQ("q_Export-Format"). Einzelne Datensätze (z.B. Aufträge, Mitarbeiterlisten) können selektiv exportiert werden. Eine Verschlüsselung der Exportdaten ist nicht erforderlich, da die Dateien nur intern verwendet werden #referenceQ("q_Export-Verschlüsselung").

=== System verwalten
//TODO: was beinhaltet dieser Use-Case

=== Backup erstellen
//TODO: je nach "System verwalten" beschreiben


=== Anwesenheitszeiten verwalten
//TODO: evtl. im Use-Case ergänzen
Der Administrator kann die Anwesenheitszeiten für alle Mitarbeiter bearbeiten. Die Erfassung erfolgt primär durch Nutzung einer Stempelkarte, die täglich in das System importiert werden #referenceQ("q_Erfassung-Anwesenheitszeiten"). Für den Fall, dass es Fehler beim Import gab oder beispielsweise Mitarbeiter das Stempeln vergessen haben, kann der Administrator in diesem Use-Case den Eintrag korrigieren.
Die Anwesenheitszeiten werden als Tabelle dargestellt, filterbar nach Tag, Woche oder Monat. Die Gesamtstunden werden automatisch berechnet.
//TODO includet Import von Daten



== Verfeinerung "Geräte verwalten"
Als Verfeinerung wurde "Geräte verwalten" aus obigem Diagramm ausgewählt, da es sich um eine zentrale Funktionalität mit komplexen Abhängigkeiten handelt. Die Verwaltung umfasst nicht nur das Anlegen, Bearbeiten und Löschen von Geräten, sondern auch die Zuordnung zu Lagern und die Verwaltung von Ausrüstung.

#figure(image("../assets/UseCase-Digramm/UseCase-Bauunternehmen-Vertiefung_Geraete verwalten.svg"), caption: [Use-Case-Verfeinerung: Geräte verwalten]) <uc_geraete-verwalten>

=== Gerät suchen

=== Gerät anlegen
Geräte können sowohl von Bau-/Projekleitern als auch zur Unterstützung von Verwaltungsmitarbeiter verwaltet werden. Dies umfasst das Anlegen, Bearbeiten und Löschen von Geräte, welche je nach Typisierung unter Baumaschinen oder Bauwerkzeuge fallen. Bei der Anlage wird eine Bezeichnung, Kategorie, Status und der Typ eingegeben. Die Gerätenummer wird automatisch vergeben und die Seriennummer (Herstellerseriennummer) mit erfasst. Das Gerät wird einem Lager zugeordnet und der aktuelle Standort wird zusätzlich angegeben. Anschaffungsdatum, letzter Wartungstermin und nächster Wartungstermin werden erfasst. 
Ausrüstung kann dem Gerät zugeordnet werden. Bilder können hochgeladen werden (LF80). Der Standort kann manuell aktualisiert werden, wenn das Gerät transportiert wird. Verwaltungsmitarbeiter haben auf Baumaschinen und Werkzeuge nur Leserechte (LF50).
//TODO: KI generiert => Überprüfung notwendig

=== Ausrüstung zuordnen
Erweitert optional das Anlegen oder Bearbeiten eines Geräts. Ausrüstung (z.B. Baggerschaufel, Kranzubehör wie Behälter, Gewichte, Haken, Anbaugeräte) kann einem Gerät zugeordnet werden. Die Ausrüstung wird als separate Entität verwaltet und über eine Referenz mit dem Gerät verknüpft. Jede Ausrüstung hat eine eindeutige Ausrüstungsnummer, eine Bezeichnung, einen Typ, eine Angabe zur Kompatibilität (mit welchen Gerätetypen sie verwendet werden kann), ein Gewicht und einen Status (Verfügbar, zugeordnet, in Wartung, defekt). Ein Gerät kann mehrere Ausrüstungsteile haben. Die Ausrüstung kann auch unabhängig von einem Gerät existieren und bei Bedarf zugeordnet werden. Die Suche nach Baumaschinen kann nach vorhandener Ausrüstung gefiltert werden (z.B. "Bagger mit 1,5m-Schaufel").
//TODO: KI generiert => Überprüfung notwendig

=== Lager verwalten
Der Administrator verwaltet die Lager für Baumaschinen und Werkzeuge. Dies umfasst das Anlegen, Bearbeiten und Löschen von Lagern. Jedes Lager erhält eine eindeutige Lagernummer, eine Bezeichnung (z.B. "Lager Nord", "Hauptlager"), einen Typ (Platz für Außengelände oder Gebäude für Lagerhalle) und eine Adresse (Referenz auf Adresse-Entität). Optional kann eine Grundstücksbezeichnung und eine Kapazität (maximale Anzahl Geräte) angegeben werden. Lager können über die Suchfunktion gefunden und nach Typ oder Adresse gefiltert werden. Bei der Geräteverwaltung werden die verfügbaren Lager in Auswahllisten angezeigt. Ein Lager kann nur gelöscht werden, wenn keine Geräte mehr zugeordnet sind.

Wird beim Anlegen oder Bearbeiten eines Geräts automatisch inkludiert. Der Benutzer wählt ein Lager aus einer Auswahlliste aus. Die Liste zeigt alle verfügbaren Lager mit Name, Typ (Platz oder Gebäude) und Adresse an. Die Auswahlliste ist durchsuchbar und filterbar. Wenn kein passendes Lager existiert, kann direkt ein neues Lager angelegt werden. Die Lagerzuordnung ist zwingend erforderlich, da jedes Gerät einem Lager zugeordnet sein muss. Der aktuelle Standort kann zusätzlich angegeben werden, falls das Gerät vorübergehend nicht im Lager ist (z.B. auf einer Baustelle).
//TODO: KI generiert => Überprüfung notwendig

=== Gerät bearbeiten
Der Projektleiter, Bauleiter oder Administrator bearbeitet ein bestehendes Gerät. Zunächst wird das Gerät über die Suchfunktion oder Auswahlliste ausgewählt. Die bestehenden Attribute werden angezeigt und können geändert werden. Dies umfasst die Bezeichnung, Kategorie, den Status, die Lager- und Standortzuordnung, Wartungstermine und die Ausrüstung. Auch Bilder können hinzugefügt oder entfernt werden. Das System prüft vor dem Speichern auf mögliche Duplikate (z.B. anhand der Seriennummer). Änderungen an der Lagerzuordnung oder am Status werden gespeichert und wirken sich auf die Verfügbarkeitssuche aus. Dieser Use-Case inkludiert das Lesen der bestehenden Daten, die Aktualisierung von Attributen und optional die Standortaktualisierung.
//TODO: KI generiert => Überprüfung notwendig

=== Gerät löschen
Der Projektleiter, Bauleiter oder Administrator löscht ein Gerät aus dem System. Zunächst wird das Gerät ausgewählt. Das System prüft, ob aktive Buchungen für dieses Gerät existieren. Wenn ja, wird eine Warnung angezeigt, und das Löschen wird verhindert oder der Benutzer muss die Buchungen zuerst stornieren. Wenn keine aktiven Buchungen vorliegen, wird das Gerät gelöscht. Referenzen zu Lagern, Ausrüstung und Bildern werden aufgelöst. Bilder werden nicht automatisch aus dem Dateisystem gelöscht, falls sie von anderen Objekten referenziert werden. Abgeschlossene Buchungen (mit Status "abgeschlossen") bleiben aus Dokumentationsgründen erhalten, auch wenn das Gerät gelöscht wurde.
//TODO: KI generiert => Überprüfung notwendig


== Verfeinerung "Gerät anlegen"
Als weitere Verfeinerung wurde "Gerät anlegen" aus obiger Vertiefung ausgewählt, 

#figure(image("../assets/UseCase-Digramm/UseCase-Bauunternehmen-Vertiefung_Geraete anlegen.svg"), caption: [Use-Case-Verfeinerung: Geräte anlegen]) <uc_geraete-verwalten>