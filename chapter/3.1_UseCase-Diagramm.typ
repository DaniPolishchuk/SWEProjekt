//reference goal
#let referenceG(labelName) = {
 [(siehe #link(label(labelName), labelName))]
}

//reference question
#let referenceQ(labelName) = {
 [(siehe #ref(label(labelName)))]
}

= Use-Case-Diagramm
Im Rahmen der in diesem Abschnitt folgenden Use-Case-Analyse wird die Funktionalität der gesamten Verwaltungsanwendung für das Bauunternehmen untersucht und verdeutlicht. Zunächst wird ein allgemeines Use-Case-Diagramm erstellt, welches die Hauptfunktionalitäten der Anwendung abbildet. Hierbei wird ein funktionsorientierter Ansatz verfolgt, sodass differenziert auf die einzelnen Funktionalitäten eingegangen werden kann. Beispielhaft wird für ausgewählte Use-Cases eine Verfeinerung vorgenommen, um die Funktionalität des Verwaltens komplexerer Entitäten und des Verwaltens der Geräte näher darzustellen.

== Rollen-Erläuterung der Anwendung
Das Diagramm wird aus sechs Akteuren zusammengesetzt, von denen die meisten den Rollen in der Anwendung entsprechen, wie sie im Lastenheft @chapter-Zielgruppen-Rollen und @Rolle-Berechtigungen definiert wurden. Lediglich das Finanzbuchhaltungssystem ist keine klassische Benutzerrolle, sondern ein externes System, welches über eine Schnittstelle mit der Verwaltungssoftware verbunden ist.
Durch die Verwendung von Vererbungsbeziehungen zwischen den Akteuren werden gemeinsame Funktionalitäten auf Basisakteuren wie dem Mitarbeiter definiert. Spezialisierte Rollen erben diese Funktionen und werden um weitere Fähigkeiten erweitert.

=== Mitarbeiter
Normale Mitarbeiter (z.B. Bauarbeiter) führen die ihnen zugewiesenen Aufgaben auf den Baustellen aus. Sie haben Zugriff auf die für ihre Arbeit relevanten Informationen. Dazu gehört das Lesen von Anwesenheitszeiten und das Einsehen des Terminplaners mit den für ihn relevanten Daten. Des Weiteren hat ein Mitarbeiter die Funktionalität, für ihn relevante Daten im System zu suchen und zu filtern. 

Der Mitarbeiter stellt dabei die grundlegende Basisrolle innerhalb der Anwendung dar. Damit fasst diese Rolle allgemeine Funktionen zusammen, die von mehreren spezifischen Rollen genutzt werden.

=== Vorarbeiter
Vorarbeiter erweitern die Funktionalitäten eines Mitarbeiters um lesenden Zugriff auf vergangene, aktuelle und zukünftige Arbeitsaufträge #referenceQ("q_Vorarbeiter-zukünftige-Arbeitsaufträge"). Des Weiteren erhalten sie detaillierte Informationen durch Einsehen des Terminplaners und lesenden Zugriff auf Geräte. Sie sind das Bindeglied zwischen Bau-/Projektleitung und Bauarbeitern. Sie koordinieren die Ausführung der Arbeitsaufträge auf der Baustelle, überwachen die Einhaltung von Terminen und sorgen für die Umsetzung der zugewiesenen Aufgaben.

=== Verwaltungsmitarbeiter
Verwaltungsmitarbeiter besitzen alle Funktionen der Basisrolle "Mitarbeiter". Sie arbeiten überwiegend im Büro und sind primär für die Pflege und Organisation der zentralen Datenbestände zuständig #referenceQ("q_Aufgabe-Verwaltung-Admin"). Dabei verwalten sie Mitarbeiterstammdaten und Gruppenzuordnungen und haben auf projektbezogene Daten (Buchungen, Projekte, Arbeitsaufträge) Leserechte #referenceQ("q_Verwaltungsmitarbeiter-Leserecht-Projektdaten"). Zusätzlich unterstützen sie die Bau-/Projektleiter beim Verwalten der Geräte. Auch sie erhalten eine detaillierte Einsicht in den Terminplaner mit für ihre Arbeit relevanten Informationen. 

=== Bau- und Projektleiter
Bau-/Projektleiter erben ebenfalls die Funktionen der Basisrolle "Mitarbeiter". Sie sind für die operative Steuerung und Umsetzung von Projekten verantwortlich, wobei sie die Planung, Zuweisung von Ressourcen (Mitarbeiter, Geräte) und die Überwachung des Projektfortschritts koordinieren. Dazu haben sie zum Verwalten Vollzugriff auf projektspezifische Daten (Buchungen, Projekte, Arbeitsaufträge, Unteraufträge) und eingeschränkten Zugriff auf Geräte. Im Terminplaner können sie alle Informationen einsehen.

=== Administrator
Der Administrator verfügt über die Rechte aller Benutzerrollen und ist als Verwaltungsmitarbeiter mit erweiterten Rechten zu verstehen. Er übernimmt die Verwaltung der Benutzerkonten, indem er ihnen Rollen zuweist. Darüber hinaus ist er für systemkritische Aufgaben wie Datenmigration durch Import/Export, Backups und die Archivierung von Daten verantwortlich. Er ist hierbei ein Teil des regulären Teams, da eine dedizierte IT-Person nicht vorgesehen ist #referenceQ("q_dedizierte-IT-Person").

== Use-Case-Diagramm der gesamten Anwendung
#v(1em)
#figure(
  image("../assets/UseCase-Diagramm/UseCase-Bauunternehmen-Kompaktansicht.pdf", width: 100%),
  caption: [Use-Case-Diagramm der gesamten Anwendung]
) <uc_kompakt>
#v(1em)

Das in @uc_kompakt dargestellte Use-Case-Diagramm visualisiert die Gesamtübersicht der Verwaltungssoftware in einer kompakten Form. Hierbei sind die wichtigsten Use-Cases im Allgemeinen dargestellt. Diese trennen sich in weitere Diagramme zu detaillierteren Anwendungsfällen auf.

=== Erläuterung der Darstellung und Farbcodierung
Das Use-Case-Diagramm verwendet eine Farbcodierung zur besseren Übersichtlichkeit und Gruppierung der Funktionalitäten nach Zuständigkeitsbereichen:

- *Hellblau (Administrator-Funktionen):* Die in hellblau dargestellten Use-Cases sind ausschließlich dem Administrator vorbehalten. Diese Funktionen umfassen systemkritische Operationen wie Datenmigrationen, Import/Export und Backups.
- *Grün (Verwaltungsbezogene Funktionen):* Die grün eingefärbten Use-Cases repräsentieren die Kernfunktionalitäten der Verwaltung. Diese Verwaltungsfunktionen betreffen sowohl Verwaltungsmitarbeiter als auch Bau- und Projektleitung. Dabei hat die Verwaltung teilweise nur lesenden Zugriff und die Bau- und Projektleitung keinen Zugriff auf Personaldaten.
- *Orange (Vorarbeiter-Funktionen):* Die orange markierten Use-Cases zeigen die lesenden Zugriffe des Vorarbeiters. Diese Rolle hat ausschließlich Lesezugriff auf die für ihre Arbeit relevanten Informationen. Der Vorarbeiter kann eigene Arbeitsaufträge einsehen, den Terminplaner konsultieren und Informationen zu benötigten Geräte abrufen, jedoch keine Daten bearbeiten.
- *Hellgrün (Mitarbeiter-Grundfunktionen):* Die hellgrün eingefärbten Use-Cases sind dem Mitarbeiter zugeordnet. Diese Basisrolle hat minimale Systemrechte und kann primär eigene Daten einsehen.
- *Gelb (Externe Systemschnittstelle):* Der gelb markierte Use-Case repräsentiert die Integration mit dem Finanzbuchhaltungssystem.
- *Rot (Vertiefung)*: Die rot markierten Use-Cases werden im Verlauf noch weiter vertieft.


=== Daten suchen und filtern <use-case_Daten-suchen-und-filtern>
Dieser User-Case ermöglicht allen Akteuren, die von der Rolle "Mitarbeiter" erben, das Suchen und Filtern nach Daten im System. Die Suchergebnisse sind rollenbasiert eingeschränkt, sodass jeder Benutzer nur auf die für ihn zugänglichen Daten zugreifen kann. Die Suche erfolgt über eine Kombination aus Textsuche (Name, Bezeichnung) und Filterung nach Kategorien/Attributen #referenceQ("q_Beschreibung-der-Suche"). Separate Suchmasken existieren für Mitarbeiter, Gruppen, Arbeitsaufträge, Projekte, Geräte und Lager #referenceQ("q_Suchmasken"). Die Suchergebnisse werden als Tabelle mit den wichtigsten Attributen angezeigt, wobei ein Klick auf einen Eintrag die Detailansicht öffnet #referenceQ("q_Anzeige-Suchergebnisse"). Die Ergebnisse können nach verschiedenen Spalten sortiert werden #referenceQ("q_Sortierung-Suchergebnisse").

=== Anwesenheitszeiten lesen
Der Zugriff auf die Anwesenheitszeiten hängt von der Rolle ab. In erster Linie kann jeder seine eigenen Anwesenheitszeiten einsehen. Darüber hinaus hat der Vorgesetzte zusätzlich Einsicht auf die Anwesenheitszeiten seiner untergeordneten Mitarbeiter. Schlussendlich hat der Administrator Vollzugriff auf die Anwesenheitszeiten, um beispielsweise fehlerhafte Daten zu korrigieren #referenceQ("q_Rechte-auf-Anwesenheitszeiten").

=== Terminplaner lesen
Auch dieser Use-Case ist rollenbasiert eingeschränkt. Jeder sieht nur so viele Daten wie nötig #referenceQ("q_Rechte-Terminplaner"). Die Vorarbeiter und Mitarbeiter sehen nur die für sie relevanten Daten, wie Start und Ende von Projekten oder Verfügbarkeit von Geräten (nur Vorarbeiter). Die Verwaltungsmitarbeiten haben volle Leserechte und sehen daher alle Arbeitsaufträge mit ihren Unteraufträgen sowie Projekte mit den zugeordneten Mitarbeitern und Geräten. Die Bau-/Projektleiter haben ebenfalls volle Leserechte und zusätzlich Schreibrechte, sodass sie Termine eintragen, verschieben und löschen können.
Die Darstellung erfolgt als Kalenderansicht mit Monats- und Wochenansicht, wobei passend (je nach Start- und Enddatum) Arbeitsaufträge und Projekte angezeigt werden, deren Detailansicht per Klick sichtbar ist #referenceQ("q_Form-Terminplaner").

=== Arbeitsaufträge lesen
Dieser Use-Case ermöglicht es Vorarbeitern, ihre Arbeitsaufträge einzusehen. Darüber hinaus können sie auch verschiedene Unteraufträge ansehen, falls vorhanden.

=== Geräte lesen
Dieser Use-Case ermöglicht es Vorarbeitern, Geräte einzusehen. Hierbei wird ersichtlich, welche Geräte gerade verfügbar sind und auf der Baustelle bei ihren Arbeitsaufträgen eingesetzt werden können.

=== Arbeitsaufträge und Projekte lesen
Während der Use-Case "Arbeitsaufträge lesen" sich auf die reine Einsicht der Arbeitsaufträge bezieht, ist bei diesem Use-Case eine zusätzliche Einsicht auf die verschiedenen Projekte der Arbeitsaufträge möglich. Diese vollständige Einsicht ist für die Pflege und Organisation der zentralen Datenbestände - was eine zentrale Aufgabe der Verwaltung ist - nötig. Projekte sind dabei die übergeordnete Einheit der Arbeitsaufträge.

=== Verwaltungsdaten integrieren
Dieser Anwendungsfall stellt die grundlegende Basisfunktionalität für den lesenden und schreibenden Zugriff auf die zentrale Datenbasis der Anwendung dar. Er kapselt die gemeinsame Logik aller Datenzugriffe - d.h. sowohl das Einsehen von Datensätzen als auch das Anlegen, Bearbeiten und Löschen - und bildet damit den zentralen Einstiegspunkt in die Datenhaltungsschicht. Die konkreten Datenbereiche werden als Erweiterungen modelliert und über die folgenden sechs Extension-Points eingebunden:

- *Bilder verwalten:* Verwaltung des zentralen Bildkatalogs, aus dem Elemente aller Entitäten mit Bildern versehen werden können.
- *Buchung verwalten:* Buchung und Stornierung von Geräten für Arbeitsaufträge.
- *Geräte verwalten:* Verwaltung von Baumaschinen, Werkzeugen, Lagern und Ausrüstung.
- *Arbeitsaufträge und Projekte verwalten:* Anlegen und Pflege von Projekten, Arbeitsaufträgen und Unteraufträgen.
- *Arbeitsaufträge und Projekte lesen:* Lesender Zugriff auf Projekte und Arbeitsaufträge für Rollen ohne Schreibberechtigung.
- *Personal verwalten:* Verwaltung von Mitarbeiterstammdaten und Gruppenzuordnungen.

=== Bilder verwalten
Dieser Use-Case ermöglicht die Verwaltung des systemweiten Bildkatalogs #referenceG("LF 80"). Der Verwaltungsmitarbeiter verwaltet den zentralen Bildbestand, indem er Bilder dem Katalog hinzufügen, vorhandene Bildinformationen (Titel, Dateipfad) bearbeiten sowie Bilder aus dem Katalog entfernen kann. Bilder werden dabei zentral in einem gemeinsamen Verzeichnis abgelegt und über ihren Dateipfad referenziert. \
Die übrigen Akteure -- Bau-/Projektleiter, Vorarbeiter und Mitarbeiter -- haben über den Use-Case "Bild hinzufügen" @uc_bild-hinzufuegen lesenden Zugriff auf den Bildkatalog, um Bilder zu Elementen wie Geräten, Aufträgen oder Mitarbeitern zuzuordnen. Sie besitzen jedoch keine Berechtigung, Bilddaten im Katalog selbst zu ändern oder zu löschen. Dieser Use-Case erweitert "Verwaltungsdaten integrieren" als erster Extension-Point.

=== Personal verwalten
Durch diesen Use-Case können Verwaltungsmitarbeiter Mitarbeiterstammdaten anlegen, bearbeiten und löschen. Dies umfasst die Eingabe von Personalien (Vorname, Nachname, Geburtsdatum), Kontaktdaten (E-Mail, Telefonnummer, Adresse) und Vertragsdaten (Position, Beschäftigungsart, Vertragsbeginn/-ende) mit einer eindeutigen Mitarbeiternummer. Die Adresse wird über eine Referenz zugeordnet. Das System prüft dabei automatisch auf mögliche Duplikate anhand von den Attributen. 
Des Weiteren umfasst dieser Use-Case auch das Anlegen und Zuordnen von Gruppen. Die Gruppentypen (Verwaltung, Planung, Projektleitung, Bauleitung, Baugruppen) sind fest vorgegeben. Jede Gruppe erhält eine eindeutige Gruppennummer, einen Namen, eine Beschreibung und optional einen Gruppenleiter. Ein Mitarbeiter kann mehreren Gruppen angehören und eine Gruppe kann mehrere Mitarbeiter enthalten #referenceQ("q_Gruppenerstellung").

=== Geräte verwalten
Wird im folgenden vertieft @chapter-Verfeinerung_Geräte-verwalten.

=== Arbeitsaufträge und Projekte verwalten
Dieser Use-Case erweitert den Use-Case "Arbeitsaufträge und Projekte lesen" um Schreibrechte, wodurch Arbeitsaufträge und Projekte angelegt, bearbeitet und gelöscht werden können. Hierzu werden Attribute wie Auftragsbezeichnung, Start-/Endtermin, Einsatzort, beteiligte Personen und Status festgelegt sowie Projekte über eine Referenz zugeordnet. Der Kostenvoranschlag wird aus dem Finanzbuchhaltungssystem lesend übernommen. \
Um ein Projekt zu referenzieren muss dieses zuerst mit Attributen wie Projektname, Projektleiter und Einsatzort angelegt werden. Der Einsatzort eines Arbeitsauftrags ist dabei detaillierter als der eines Projektes. Ein Projekt kann zunächst ohne Aufträge existieren. \
Darüber hinaus umfasst dieser Use-Case auch das Anlegen, Bearbeiten, Löschen und Zuordnen von Unteraufträgen. Dies geschieht in der Detailansicht des jeweiligen Arbeitsauftrags #referenceQ("q_Ansicht-Unteraufträge"). Ein Unterauftrag ist dabei ein Auftrag der von einem Unterauftragnehmer ausgeführt wird. Der Unterauftragnehmer wird per Referenz zugeordnet und von der Verwaltung angelegt. 

Während des ganzen Prozesses prüft das System auf Duplikate #referenceG("LF 100"). Nach erfolgreicher Anlage ist das Projekt, die Arbeitsaufträge und die enthaltenen Unteraufträge im Terminplaner sichtbar. 

=== Buchungen verwalten
In diesem Use-Case können Bau-/Projektleiter Geräte buchen, worunter die für einen Arbeitsauftrag benötigten Geräte fallen. Dabei wird das gewünschte Gerät über eine Auswahlliste ausgewählt. Durch Angabe des Zeitraums und des Arbeitsauftrags bindet dieser Use-Case mittels _\<\<include\>\>_ stets den Use-Case "Verfügbarkeit prüfen" ein: Jede Buchungsanfrage erfordert zwingend eine Prüfung, ob das gewünschte Gerät im angegebenen Zeitraum verfügbar ist. Bei Verfügbarkeit wird die Buchung angelegt und erhält eine eindeutige Buchungsnummer. Bei Nichtverfügbarkeit wird eine Fehlermeldung angezeigt.
Ebenfalls können bestehende Buchungen bearbeitet oder storniert werden. Die Buchungsverwaltung ermöglicht die Übersicht über alle aktuellen und zukünftigen Buchungen anhand des Status (aktiv, abgeschlossen, storniert).

=== Finanzdaten lesen
Finanzdaten werden aus dem Finanzbuchhaltungssystem ausgelesen und dem Verwaltungsmitarbeiter zur Verfügung gestellt. Die Finanzdaten werden beispielsweise für den Kostenvoranschlag eines Arbeitsauftrags benötigt. Die tatsächliche Verwaltung und Berechnung der Finanzen findet jedoch allein im Finanzbuchhaltungssystem statt, wodurch dieses System nur Leserechte auf die Finanzdaten hat.

=== Daten archivieren
Gemäß der gesetzlichen Aufbewahrungspflicht müssen relevante Geschäftsdaten für einen Zeitraum von mindestens 10 Jahren archiviert werden. Bei diesem Use-Case können alle Daten, die aktuell nicht mehr aktiv verwendet werden, jedoch aus rechtlichen Gründen noch zugänglich bleiben müssen, archiviert werden. Archivierte Daten sind weiterhin lesbar, belasten jedoch nicht den aktiven Datenbestand der Anwendung. Sofern keine anderen rechtlichen oder geschäftlichen Gründe dagegen sprechen, werden die Daten nach Ablauf der 10-Jahres-Frist endgültig gelöscht #referenceQ("q_10-Jahres-Frist-Ablauf").

=== Benutzerrollen verwalten
Dieser Use-Case wird vom Administrator ausgeführt und passiert, nachdem die Verwaltung einen neuen Benutzer im System angelegt hat. Durch die Vergabe der Rolle hat der Benutzer bestimmte Rechte auf das System.

=== Daten übertragen
Das Übertragen von Daten ist ein sicherheitskritischer Vorgang und wird daher ausschließlich dem Administrator vorbehalten. Das beinhaltet den Import und Export von Daten, die als eigener Use-Case inkludiert werden. Dies hat den Grund, dass der Import und Export von Daten systemweit möglich ist und so auch von anderen Use-Cases genutzt werden kann.

=== Daten importieren
Der Import kann beispielsweise aus dem Altsystem oder anderen Quellen im CSV-Format erfolgen #referenceQ("q_Import-Format"). Alle relevanten Daten können importiert werden: Mitarbeiterdaten, Auftragsdaten, Baumaschinen- und Werkzeugdaten, Gruppenzuordnungen #referenceQ("q_Import-Export-Daten"). Das System prüft beim Import automatisch auf Duplikate und zeigt Warnungen an.

=== Daten exportieren
Der Export erfolgt ebenfalls im CSV-Format und dient der Erstellung von Berichten oder Backups #referenceQ("q_Export-Format"). Einzelne Datensätze (z.B. Aufträge, Mitarbeiterlisten) können selektiv exportiert werden. Eine Verschlüsselung der Exportdaten ist nicht erforderlich, da die Dateien nur intern verwendet werden #referenceQ("q_Export-Verschlüsselung").

=== System verwalten
Dieser Use-Case wird vom Administrator ausgeführt und umfasst die zentrale Verwaltung des Systems. Dazu zählen systemweite Einstellungen, wie beispielsweise Konfigurationen von Standardwerten, Systemeigenschaften oder Benutzerpräferenzen zur Darstellung.

Ein weiterer Bestandteil dieses Use-Cases ist die Pflege und Korrektur von Anwesenheitszeiten. Die Erfassung der Anwesenheitszeiten erfolgt primär durch Nutzung einer Stempelkarte, deren Daten täglich in das System importiert werden #referenceQ("q_Erfassung-Anwesenheitszeiten"). Für den Fall, dass es Fehler beim Import gab oder beispielsweise Mitarbeiter das Stempeln vergessen haben, kann der Administrator in diesem Use-Case den Eintrag korrigieren. Die Anwesenheitszeiten werden als Tabelle dargestellt, filterbar nach Tag, Woche oder Monat. Die Gesamtstunden werden automatisch berechnet.

Darüber hinaus umfasst der Use-Case unterstützende Tätigkeiten im laufenden Betrieb, wie Support, die Überwachung des Systems, das Erkennen und Beheben von Problemen sowie die Durchführung einfacher Wartungsmaßnahmen.

=== Backup erstellen
Dieser Use-Case dient der Sicherung aller systemrelevanten Daten, um Datenverlust vorzubeugen und eine Wiederherstellung im Fehlerfall zu ermöglichen.
Backups werden automatisch täglich (inkrementell) und wöchentlich (vollständig) vom System erstellt. Zusätzlich hat der Administrator die Möglichkeit, manuelle Backups bei Bedarf anzustoßen, beispielsweise vor größeren Änderungen oder Updates #referenceQ("q_automatische-Datensicherung").
Ergänzend kann der Administrator selektive Exporte einzelner Datensätze durchführen. Die Backups erfolgen im CSV-Format #referenceQ("q_Import-Export-Daten").

#pagebreak()

== Verfeinerung "Geräte verwalten" <chapter-Verfeinerung_Geräte-verwalten>
Als Verfeinerung wurde "Geräte verwalten" aus obigem Diagramm ausgewählt, da es sich um eine zentrale Funktionalität mit komplexen Abhängigkeiten handelt. Die Verwaltung umfasst nicht nur das Anlegen, Bearbeiten und Löschen von Geräten, sondern auch die Zuordnung zu Lagern und die Verwaltung von Ausrüstung.

#v(1em)
#figure(image("../assets/UseCase-Diagramm/UseCase-Bauunternehmen-Vertiefung_Geraete verwalten.pdf"), caption: [Use-Case-Verfeinerung: Geräte verwalten]) <uc_geraete-verwalten>
#v(1em)

=== Gerät anlegen
Wird im folgenden vertieft @chapter-Verfeinerung_Geräte-anlegen.

=== Gerät bearbeiten
Die Bearbeitung nach dem Anlegen eines Geräts wird in diesem Use-Case behandelt und kann sowohl von Verwaltungsmitarbeitern als auch von Bau-/Projektleiter durchgeführt werden. Zunächst wird das Gerät über die Suchfunktion oder Auswahlliste ausgewählt. Die bestehenden Attribute werden angezeigt und können geändert werden. Dies umfasst die Bezeichnung, Kategorie, den Status, die Lager-, Standortzuordnung und Wartungstermine. Änderungen an der Lagerzuordnung oder am Status werden gespeichert und wirken sich auf die Verfügbarkeit aus. Für die Anpassung der Ausrüstungszuordnung bindet dieser Use-Case mittels _\<\<include\>\>_ den Use-Case "Ausrüstung zuordnen" @uc_ausruestung-zuordnen ein.

=== Ausrüstung zuordnen <uc_ausruestung-zuordnen>
Dieser Use-Case ermöglicht das optionale Zuordnen von Ausrüstung beim Anlegen oder Bearbeiten eines Geräts. Dabei wird die Ausrüstung als separate Entität verwaltet und über eine Referenz mit dem Gerät verknüpft. Beim Hinzufügen einer Ausrüstung werden nur die Ausrüstungen, die mit dem Gerätetyp kompatibel sind angezeigt. Die Kompatibilität wird über das Attribut "Kompatibel mit" festgelegt.

=== Lager verwalten
Die Verwaltung der Lager für Geräte übernehmen die Verwaltungsmitarbeiter und Bau-/Projektleiter. Dies umfasst das Anlegen, Bearbeiten und Löschen von Lagern. Jedes Lager erhält eine eindeutige Lagernummer, eine Bezeichnung, einen Typ (Platz für Außengelände oder Gebäude für Lagerhalle) und eine Adresse. Optional kann eine Grundstücksbezeichnung und eine Kapazität (maximale Anzahl Geräte) angegeben werden.

=== Ausrüstung verwalten
Die Verwaltung des Ausrüstungskatalogs obliegt sowohl den Verwaltungsmitarbeitern als auch den Bau-/Projektleitern. Dieser Use-Case umfasst das Anlegen, Bearbeiten und Löschen von Ausrüstungsgegenständen und weiteren Anbaugeräten #referenceG("LF 50"). Jede Ausrüstung erhält dabei eine eindeutige Ausrüstungsnummer, eine Bezeichnung sowie das Attribut "Kompatibel mit", das die Gerätetypen auflistet, denen diese Ausrüstung zugeordnet werden darf. Dieses Attribut bildet die Grundlage für die Filterung in "Ausrüstung zuordnen": Nur Ausrüstungsgegenstände, die mit dem jeweiligen Gerätetyp kompatibel sind, werden dort zur Auswahl angeboten. Vor dem Löschen einer Ausrüstung prüft das System, ob diese noch einem Gerät zugeordnet ist, und gibt gegebenenfalls eine Warnung aus #referenceG("LF 100").

=== Gerät löschen
Um Fehler und Missverständnisse auf der Baustelle zu vermeiden, erfolgt das Löschen von Geräten im Büro von Verwaltungsmitarbeiter. Zunächst wird das Gerät ausgewählt. Das System prüft, ob aktive Buchungen für dieses Gerät existieren. Wenn ja, wird das Löschen durch eine Warnung sowie Konfliktauflösung verhindert. Wenn keine aktiven Buchungen vorliegen, wird das Gerät gelöscht. Referenzen zu Lagern, Ausrüstung und Bildern werden aufgelöst.

=== Buchung stornieren
Bei diesem Use-Case handelt es sich um eine Erweiterung des Use-Case "Gerät löschen". Eine Stornierung einer Buchung kommt beispielsweise dann zum Tragen, wenn das Gerät, das in der Buchung enthalten ist, gelöscht werden soll. Durch das Löschen werden die Referenzen zu Geräten und Arbeitsaufträgen aufgelöst. Des Weiteren wird das entsprechende Gerät im Terminplaner am entsprechenden Datum wieder als verfügbar angezeigt.

#pagebreak()

== Verfeinerung "Gerät anlegen" <chapter-Verfeinerung_Geräte-anlegen>
Als weitere Verfeinerung wurde "Gerät anlegen" aus obiger Vertiefung ausgewählt, da dieser Prozess mehrere klar voneinander abgegrenzte Teilschritte umfasst, die es näher zu beleuchten gilt. Die Verfeinerung zeigt, in welchen Schritten ein neues Gerät im System angelegt wird und welche Pflichtattribute dabei zu erfassen sind.

#v(1em)
#figure(image("../assets/UseCase-Diagramm/UseCase-Bauunternehmen-Vertiefung_Geraet anlegen.pdf"), caption: [Use-Case-Verfeinerung: Gerät anlegen]) <uc_geraet-anlegen>
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
Dieser Use-Case ist mit dem gleichnamigen Use-Case aus der Vertiefung "Geräte verwalten" identisch und tritt hier als dessen Referenz auf @uc_ausruestung-zuordnen. Er wird sowohl von "Gerät anlegen" als auch von "Gerät bearbeiten" mittels _\<\<include\>\>_ eingebunden. Die vollständige Beschreibung der Funktionalität ist dort dokumentiert.

=== Bild hinzufügen <uc_bild-hinzufuegen>
Gemäß LF 80 können allen Elementen des Systems beliebig viele Bilder mit Titel zugeordnet werden #referenceG("LF 80"). Beim Anlegen eines Geräts besteht die Möglichkeit, dem Gerät Bilder (z.B. Fotos des Geräts) hinzuzufügen. Dazu bindet dieser Use-Case mittels _\<\<include\>\>_ den Use-Case "Bild suchen" ein, über den der Benutzer im zentralen Bildkatalog nach geeigneten Bildern sucht und diese dem Gerät zuordnet. Das Hinzufügen von Bildern ist optional; Bilder können auch über "Gerät bearbeiten" zu einem späteren Zeitpunkt ergänzt oder entfernt werden.

=== Bild suchen
Dieser Use-Case wird mittels _\<\<include\>\>_ durch "Bild hinzufügen" eingebunden und stellt den Zugriff auf den zentralen Bildkatalog bereit. Er referenziert den Use-Case "Bilder verwalten" aus der Kompaktansicht (vgl. @uc_kompakt): Der gesamte Bildbestand, der von Verwaltungsmitarbeitern über "Bilder verwalten" gepflegt wird, steht an dieser Stelle zur Auswahl bereit. Der Benutzer kann im Katalog nach Bildern suchen -- beispielsweise nach Titel oder Dateipfad -- und ein oder mehrere Bilder dem Gerät zuordnen. Auf diese Weise wird die Bildsuche und -zuordnung an konkreten Elementen von der zentralen Verwaltung des Bildbestands konzeptuell getrennt.

=== Auf Duplikate prüfen
Bevor das neue Gerät endgültig im System gespeichert wird, prüft das System automatisch auf mögliche Duplikate #referenceG("LF 100"). Die Prüfung erfolgt anhand charakteristischer Attribute wie Bezeichnung und Seriennummer. Wird ein potenzielles Duplikat erkannt, wird dem Verwaltungsmitarbeiter eine Warnmeldung mit den gefundenen Einträgen angezeigt, sodass er den Vorgang abbrechen oder Änderungen vornehmen kann.