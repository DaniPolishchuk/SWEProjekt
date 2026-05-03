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
Normale Mitarbeiter (z.B. Bauarbeiter) führen die ihnen zugewiesenen Aufgaben auf den Baustellen aus. Sie haben Zugriff auf die für ihre Arbeit relevanten Informationen. Dazu gehört das Lesen von Arbeitszeiten und den Terminplaner mit den für ihn relevanten Daten. Des Weiteren hat ein Mitarbeiter die Funktionalität, für ihn relevante Daten - wie Geräte - im System zu suchen und zu filtern. 

Der Mitarbeiter stellt dabei die grundlegende Basisrolle innerhalb der Anwendung dar. Diese Rolle fasst allgemeine Funktionen zusammen, die von mehreren spezifischen Rollen genutzt werden.
//TODO: Mitarbeiter kann Geräte lesen, weil er im Use-Case "Geräte verwalten" nach Geräte suchen kann
//  => ist dann der Use-Case "Geräte lesen" beim Vorarbeiter überhaupt nötig?

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
#v(1em)
#figure(
  image("../assets/UseCase-Diagramm/UseCase-Bauunternehmen-Kompaktansicht.svg", width: 100%),
  caption: [Use-Case-Diagramm der gesamten Anwendung -- Kompaktansicht der Bauunternehmens-Verwaltungssoftware]
) <uc_kompakt>
#v(1em)

Das in @uc_kompakt dargestellte Use-Case-Diagramm visualisiert die Gesamtübersicht der Verwaltungssoftware in einer sehr kompakten Form. Hierbei sind die wichtigsten Use-Cases im Allgemeinen dargestellt. Diese trennen sich in weitere Diagramme zu detaillierteren Anwendungsfällen auf.

=== Erläuterung der Darstellung und Farbcodierung
Das Use-Case-Diagramm verwendet eine Farbcodierung zur besseren Übersichtlichkeit und Gruppierung der Funktionalitäten nach Zuständigkeitsbereichen:

- *Hellblau (Administrator-Funktionen):* Die in hellblau dargestellten Use-Cases sind ausschließlich dem Administrator vorbehalten. Diese Funktionen umfassen systemkritische Operationen wie Datenmigration aus dem Altsystem, Import/Export, manuelle und automatische Backups.
- *Grün (Verwaltungsbezogene Funktionen):* Die grün eingefärbten Use-Cases repräsentieren die Kernfunktionalitäten der Verwaltung. Diese Verwaltungsfunktionen betreffen sowohl Verwaltungsmitarbeiter als auch Bau- und Projektleitung. Dabei hat die Verwaltung teilweise nur lesenden Zugriff und die Bau- und Projektleitung keinen Zugriff auf Personaldaten.
- *Orange (Vorarbeiter-Funktionen):* Die orange markierten Use-Cases zeigen die lesenden Zugriffe des Vorarbeiters. Diese Rolle hat ausschließlich Lesezugriff auf die für ihre Arbeit relevanten Informationen. Der Vorarbeiter kann eigene Arbeitsaufträge einsehen, den Terminplaner konsultieren und Informationen zu benötigten Geräte abrufen, jedoch keine Daten bearbeiten.
- *Hellgrün (Mitarbeiter-Grundfunktionen):* Die hellgrün eingefärbten Use-Cases am oberen Rand des Diagramms sind dem Mitarbeiter zugeordnet. Diese Basisrolle hat minimale Systemrechte und kann primär eigene Daten einsehen.
- *Gelb (Externe Systemschnittstelle):* Der gelb markierte Use-Case repräsentiert die Integration mit dem Finanzbuchhaltungssystem.
- *Rot (Vertiefung)*: Die rot markierten Use-Cases werden im Verlauf noch weiter vertieft.


=== Daten suchen und filtern <use-case_Daten-suchen-und-filtern>
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
Während der Use-Case "Arbeitsaufträge lesen" sich auf die reine Einsicht der Arbeitsaufträge bezieht, ist bei diesem Use-Case eine zusätzliche Einsicht auf die verschiedenen Projekte der Arbeitsaufträge möglich. Diese vollständige Einsicht ist für die Pflege und Organisation der zentralen Datenbestände - was eine zentrale Aufgabe der Verwaltung ist - nötig. Projekte sind dabei die übergeordnete Einheit der Arbeitsaufträge.

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
Siehe @chapter-Verfeinerung_Geräte-verwalten.

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
Dieser Use-Case wird vom Administrator ausgeführt und umfasst die zentrale Verwaltung des Systems. Dazu zählen systemweite Einstellungen, wie beispielsweise Konfigurationen von Standardwerten, Systemeigenschaften oder Benutzerpräferenzen zur Darstellung.

Ein weiterer Bestandteil dieses Use-Cases ist die Pflege und Korrektur von Anwesenheitszeiten. Die Erfassung der Anwesenheitszeiten erfolgt primär durch Nutzung einer Stempelkarte, die täglich in das System importiert werden #referenceQ("q_Erfassung-Anwesenheitszeiten"). Für den Fall, dass es Fehler beim Import gab oder beispielsweise Mitarbeiter das Stempeln vergessen haben, kann der Administrator in diesem Use-Case den Eintrag korrigieren. Die Anwesenheitszeiten werden als Tabelle dargestellt, filterbar nach Tag, Woche oder Monat. Die Gesamtstunden werden automatisch berechnet.

Darüber hinaus umfasst der Use-Case unterstützende Tätigkeiten im laufenden Betrieb, wie Support, die Überwachung des Systems, das Erkennen und Beheben von Problemen sowie die Durchführung einfacher Wartungsmaßnahmen.

=== Backup erstellen
Dieser Use-Case dient der Sicherung aller systemrelevanten Daten, um Datenverlust vorzubeugen und eine Wiederherstellung im Fehlerfall zu ermöglichen.
Backups werden automatisch tägliche (nachts) und wöchentlich (vollständig) vom System erstellt. Zusätzlich hat der Administrator die Möglichkeit, manuelle Backups bei Bedarf anzustoßen, beispielsweise vor größeren Änderungen oder Updates #referenceQ("q_automatische-Datensicherung").
Ergänzend kann der Administrator selektive Exporte einzelner Datensätze durchführen. Die Backups erfolgen im CSV-Format #referenceQ("q_Import-Export-Daten").

#pagebreak()

== Verfeinerung "Geräte verwalten" <chapter-Verfeinerung_Geräte-verwalten>
Als Verfeinerung wurde "Geräte verwalten" aus obigem Diagramm ausgewählt, da es sich um eine zentrale Funktionalität mit komplexen Abhängigkeiten handelt. Die Verwaltung umfasst nicht nur das Anlegen, Bearbeiten und Löschen von Geräten, sondern auch die Zuordnung zu Lagern und die Verwaltung von Ausrüstung.

#v(1em)
#figure(image("../assets/UseCase-Diagramm/UseCase-Bauunternehmen-Vertiefung_Geraete verwalten.svg"), caption: [Use-Case-Verfeinerung: Geräte verwalten]) <uc_geraete-verwalten>
#v(1em)

=== Gerät suchen
Dieser Use-Case ermöglicht es nach bestimmten Geräten zu suchen, wodurch die Einsicht von wichtigen Geräteinformationen möglich ist. Diese Funktionalität steht allen Akteuren, die von Mitarbeiter erben zu Verfügung. Die Grundfunktionalität Daten zu suchen besitzt ebenfalls jeder von Mitarbeiter erbender Akteur und ist in der Kompaktansicht (@use-case_Daten-suchen-und-filtern) eingebaut.

=== Gerät anlegen
Siehe @chapter-Verfeinerung_Geräte-anlegen.

=== Gerät bearbeiten
Die Bearbeitung nach dem Anlegen eines Geräts wird in diesem Use-Case behandelt und kann sowohl von Verwaltungsmitarbeitern als auch von Bau-/Projektleiter durchgeführt werden. Zunächst wird das Gerät über die Suchfunktion oder Auswahlliste ausgewählt. Die bestehenden Attribute werden angezeigt und können geändert werden. Dies umfasst die Bezeichnung, Kategorie, den Status, die Lager-, Ausrüstung-, Standortzuordnung und Wartungstermine. Änderungen an der Lagerzuordnung oder am Status werden gespeichert und wirken sich auf die Verfügbarkeit aus.
//TODO: Einbringe, dass "Ausrüstung zuordnen" INKLUDIERT wird => Problem, warum wird Lager zuordnen nicht inkludiert?
//TODO: Bilder hinzufügen als Use-Case hinzufügen
//  Auch Bilder können hinzugefügt oder entfernt werden.

=== Ausrüstung zuordnen
Dieser Use-Case erweitert optional das Anlegen oder Bearbeiten eines Geräts durch Zuordnen von Ausrüstung (z.B. Baggerschaufel, Kranzubehör wie Behälter, Gewichte, Haken, Anbaugeräte). Dabei wird die Ausrüstung wird als separate Entität verwaltet und über eine Referenz mit dem Gerät verknüpft. Beim Hinzufügen einer Ausrüstung werden nur die Ausrüstungen, die mit dem Gerätetyp kompatibel sind angezeigt. Die Kompatibilität wird über das Attribut "Kompatibel mit" festgelegt.

=== Lager verwalten
Die Verwaltung der Lager für Geräte übernehmen die Verwaltungsmitarbeiter und Bau-/Projektleiter. Dies umfasst das Anlegen, Bearbeiten und Löschen von Lagern. Jedes Lager erhält eine eindeutige Lagernummer, eine Bezeichnung, einen Typ (Platz für Außengelände oder Gebäude für Lagerhalle) und eine Adresse. Optional kann eine Grundstücksbezeichnung und eine Kapazität (maximale Anzahl Geräte) angegeben werden.

=== Gerät löschen
Um Fehler und Missverständnisse auf der Baustelle zu vermeiden, erfolgt das Löschen von Geräten im Büro von Verwaltungsmitarbeiter. Zunächst wird das Gerät ausgewählt. Das System prüft, ob aktive Buchungen für dieses Gerät existieren. Wenn ja, wird eine Warnung angezeigt, und das Löschen wird durch eine Warnung sowie Konfliktauflösung verhindert. Wenn keine aktiven Buchungen vorliegen, wird das Gerät gelöscht. Referenzen zu Lagern, Ausrüstung und Bildern werden aufgelöst.

=== Buchung stornieren
Bei diesem Use-Case handelt es sich um eine Erweiterung des Use-Case "Gerät löschen". Eine Stornierung einer Buchung kommt beispielsweise dann zum Tragen, wenn das Gerät, das in der Buchung enthalten ist, gelöscht werden soll. Durch das Löschen werden die Referenzen zu Geräten und Arbeitsaufträgen aufgelöst. Des Weiteren wird das entsprechende Kalender im Terminplaner am entsprechenden Datum wieder als verfügbar angezeigt.

#pagebreak()

== Verfeinerung "Gerät anlegen" <chapter-Verfeinerung_Geräte-anlegen>
Als weitere Verfeinerung wurde "Gerät anlegen" aus obiger Vertiefung ausgewählt, da dieser Prozess mehrere klar voneinander abgegrenzte Teilschritte umfasst, die es näher zu beleuchten gilt. Die Verfeinerung zeigt, in welchen Schritten ein neues Gerät im System angelegt wird und welche Pflichtattribute dabei zu erfassen sind.

#v(1em)
#figure(image("../assets/UseCase-Diagramm/UseCase-Bauunternehmen-Vertiefung_Geraet anlegen.svg"), caption: [Use-Case-Verfeinerung: Gerät anlegen]) <uc_geraet-anlegen>
#v(1em)

Das Diagramm @uc_geraet-anlegen verwendet eine zweistufige Farbcodierung: Die hellblau hinterlegten Use-Cases beschreiben die übergeordneten Prozessschritte, die der Verwaltungsmitarbeiter im Rahmen des Anlegevorgangs direkt ausführt. Die lila dargestellten Use-Cases werden durch den Use-Case "Geräteeigenschaften definieren" mittels _<\<include>>_ eingebunden und repräsentieren die einzelnen Pflichtattribute, die beim Anlegen eines neuen Geräts zu erfassen sind.

=== Gerätetyp auswählen
Zu Beginn des Anlegevorgangs wählt der Verwaltungsmitarbeiter den Gerätetyp aus einer vordefinierten, erweiterbaren Auswahlliste aus #referenceG("LF 70") #referenceQ("q_Oberbegriff-Gerät"). Die möglichen Gerätetypen umfassen gemäß Lastenheft unter anderem Bagger, LKW, Kräne, Rüttler sowie Bohrmaschinen als Baumaschinen, und Schalungsteile, Bausicherungen sowie Zäune als Bauwerkzeuge #referenceG("LF 50"). Die Auswahl des Gerätetyps hat eine steuernde Funktion für den weiteren Verlauf des Anlegevorgangs: Sie bestimmt, welche Ausrüstungsteile im Folgeschritt als kompatibel gelten und damit zur Zuordnung angeboten werden.

=== Geräteeigenschaften definieren
Dieser Use-Case bildet den zentralen Schritt des gesamten Anlegevorgangs und umfasst die Erfassung aller gerätebeschreibenden Pflichtattribute. Er bindet mittels _<\<include>>_ die folgenden sieben Use-Cases ein, von denen jeder ein konkretes Attribut des Geräts definiert:

- *Gerätenummer definieren:* Jedem Gerät wird eine eindeutige Gerätenummer zugewiesen, die automatisch vom System vergeben wird.
- *Bezeichnung definieren:* Es wird eine sprechende Bezeichnung des Geräts eingetragen (z.B. "Kettenbagger CAT 320" oder "20-t-Turmdrehkran").
- *Kategorie definieren:* Das Gerät wird einer Gerätekategorie aus einer vordefinierten, erweiterbaren Auswahlliste zugeordnet (z.B. Bagger, Kran, Schalungsteil) #referenceG("LF 70").
- *Seriennummer definieren:* Die vom Hersteller vergebene Seriennummer des konkreten Geräteexemplars wird erfasst.
- *Status definieren:* Beim Anlegen erhält das Gerät einen initialen Verfügbarkeitsstatus, z.B. "verfügbar", "in Wartung" oder "defekt".
- *Anschaffungsdatum definieren:* Das Datum der Anschaffung des Geräts wird hinterlegt.
- *Wartungstermine definieren:* Geplante Wartungstermine (letzter und nächster Wartungstermin) werden erfasst, um die Verfügbarkeit des Geräts langfristig planbar zu halten.

=== Lager und Standort zuordnen
Nach der Erfassung der grundlegenden Geräteeigenschaften wird dem Gerät ein Lager zugeordnet. Die Lagerauswahl erfolgt über eine Auswahlliste der vorhandenen Lager #referenceG("LF 50"). Ein Lager kann dabei einem Außengelände (Typ: Platz) oder einer Lagerhalle (Typ: Gebäude) entsprechen. Zusätzlich zur Lagerzuordnung wird der aktuelle Standort des Geräts festgehalten. Diese Information ist für die standortbasierte Verfügbarkeitssuche relevant, mit der nach dem nächstgelegenen verfügbaren Gerät für einen Einsatzort gesucht werden kann #referenceG("LF 50").

=== Ausrüstung zuordnen
Beim Anlegen eines Geräts kann diesem optional Ausrüstung zugeordnet werden. Diese Funktionalität entspricht dem gleichnamigen Use-Case aus der übergeordneten Vertiefung (siehe @chapter-Verfeinerung_Geräte-verwalten): Es werden ausschließlich Ausrüstungsteile angezeigt, die mit dem zuvor ausgewählten Gerätetyp kompatibel sind. Die Kompatibilität ist am Ausrüstungsobjekt über das Attribut "Kompatibel mit" hinterlegt. Die Zuordnung von Ausrüstung ist optional und kann zu einem späteren Zeitpunkt über "Gerät bearbeiten" vorgenommen werden.

=== Bild hinzufügen
Gemäß LF 80 können allen Elementen des Systems beliebig viele Bilder mit Titel zugeordnet werden #referenceG("LF 80"). Beim Anlegen eines Geräts besteht die Möglichkeit, dem Gerät Bilder (z.B. Fotos des Geräts) hinzuzufügen. Die Bilder liegen zentral in einem gemeinsamen Verzeichnis und werden über ihren Dateipfad referenziert. Das Hinzufügen von Bildern ist optional; Bilder können auch über "Gerät bearbeiten" zu einem späteren Zeitpunkt ergänzt oder entfernt werden.

=== Auf Duplikate prüfen
Bevor das neue Gerät endgültig im System gespeichert wird, prüft das System automatisch auf mögliche Duplikate #referenceG("LF 100"). Die Prüfung erfolgt anhand charakteristischer Attribute wie Bezeichnung und Seriennummer. Wird ein potenzielles Duplikat erkannt, wird dem Verwaltungsmitarbeiter eine Warnmeldung mit den gefundenen Einträgen angezeigt, sodass er den Vorgang abbrechen oder Änderungen vornehmen kann.