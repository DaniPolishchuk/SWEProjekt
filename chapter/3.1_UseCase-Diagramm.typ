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
- *Rot*: //TODO


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

Dieser Anwendungsfall beschreibt die zentrale Verwaltung der im System vorhandenen Daten. Dazu zählen unter anderem:
- Buchung
- Arbeitsaufträge und Projekte  
- Geräte
- Personal  

Je nach Rolle bestehen unterschiedliche Berechtigungen hinsichtlich Lesen und Bearbeiten dieser Daten.


=== Projektdaten verwalten

Dieser Use-Case umfasst die Verwaltung aller projektspezifischen Informationen.

Dazu gehören:
- Anlegen und Bearbeiten von Projekten  
- Pflege von projektbezogenen Daten  
- Zuordnung von Ressourcen  

Der volle Zugriff auf diese Funktion ist insbesondere Bau- und Projektleitern vorbehalten.



=== Daten exportieren

Dieser Use-Case beschreibt den selektiven Export von Daten aus dem System.

Dabei ist zu beachten:
- Der Zugriff erfolgt abhängig von der jeweiligen Rolle  
- Verwaltungsmitarbeiter können ausgewählte Daten exportieren  
- Administratoren besitzen uneingeschränkten Zugriff  

=== Daten importieren

Der Import von Daten in das System ist ein sicherheitskritischer Vorgang und daher ausschließlich dem Administrator vorbehalten.

Dieser Anwendungsfall dient dazu:
- externe Daten in das System zu integrieren  
- bestehende Datenbestände zu erweitern  

=== Backup durchführen

Dieser Anwendungsfall stellt die Sicherung der Systemdaten sicher.

Er umfasst:
- regelmäßige Datensicherungen  
- Schutz vor Datenverlust  

Die Durchführung erfolgt ausschließlich durch den Administrator.

=== Personal verwalten

Ermöglicht dem Verwaltungsmitarbeiter das Anlegen, Bearbeiten und Löschen von Mitarbeiterstammdaten. Dies umfasst die Eingabe von Personalien (Vorname, Nachname, Geburtsdatum), Kontaktdaten (E-Mail, Telefonnummer, Adresse) und Vertragsdaten (Position, Beschäftigungsart, Vertragsbeginn/-ende). Jeder Mitarbeiter erhält eine eindeutige Mitarbeiternummer. Die Adresse wird als separate Entität modelliert und über eine Referenz zugeordnet.  Bei der Anlage eines neuen Mitarbeiters prüft das System automatisch auf mögliche Duplikate anhand von Vorname, Nachname und Geburtsdatum.

//FRAGE: Die Rolle des Mitarbeiters wird durch den Administrator zugewiesen. => kann das nicht die Verwaltung machen?

=== Gruppen verwalten

Umfasst das Anlegen, Bearbeiten und Löschen von Gruppen sowie die Zuordnung von Mitarbeitern zu Gruppen. Die Gruppentypen (Verwaltung, Planung, Projektleitung, Bauleitung, Baugruppen) sind fest vorgegeben, konkrete Instanzen können jedoch dynamisch erstellt werden. Jede Gruppe erhält eine eindeutige Gruppennummer, einen Namen und optional einen Gruppenleiter. Ein Mitarbeiter kann mehreren Gruppen angehören, eine Gruppe kann mehrere Mitarbeiter enthalten (n:m-Beziehung). Baugruppen enthalten Arbeitsgruppen für die Baustellen und benötigen mindestens einen Baugruppenleiter. Die Verwaltung erfolgt über eine übersichtliche GUI mit Auswahllisten, die durchsuchbar und filterbar sind (LF70). Der Verwaltungsmitarbeiter und der Administrator haben Vollzugriff auf die Gruppenverwaltung, während die Bauleitung Gruppen nur lesend einsehen und Projekten/Aufträgen zuordnen kann (LF20).
//FRAGE: gibt es gar nicht im Diagramm

=== Projekt anlegen

Der Projektleiter oder Bauleiter legt ein neues Projekt an. Dabei wird zunächst ein Projektname und eine Beschreibung eingegeben. Die Projektnummer wird automatisch vom System vergeben. Ein Projektleiter wird dem Projekt zugeordnet (Referenz auf Mitarbeiter). Der Einsatzort wird als Adresse der Baustelle eingegeben. Start- und Endtermine werden festgelegt und der Projektstatus wird auf "Geplant" gesetzt. Optional kann eine detaillierte Projektbeschreibung hinzugefügt werden. Nach erfolgreicher Anlage ist das Projekt im Terminplaner sichtbar und kann für die Erstellung von Arbeitsaufträgen verwendet werden. Das System prüft vor dem Speichern auf mögliche Duplikate (LF100). Ein Projekt kann zunächst ohne Aufträge existieren; Aufträge werden später hinzugefügt. Die Projektverwaltung ist mit der Auftragsverwaltung über eine 1:n-Beziehung verknüpft (ein Projekt kann mehrere Aufträge enthalten).
//FRAGE: wo ist die Verbindung zum Terminplaner

=== Arbeitsauftrag verwalten

Ermöglicht der Bauleitung das Anlegen, Bearbeiten und Löschen von Arbeitsaufträgen. Bei der Erstellung wird eine Auftragsbezeichnung und Beschreibung eingegeben. Die Auftragsnummer wird automatisch vergeben. Der Auftrag wird einem oder mehreren Projekten zugeordnet (n:m-Beziehung), da ein Auftrag über mehrere Projekte verteilt sein kann. Es werden Start-, End- und optional Zwischentermine festgelegt. Beteiligte Personen und Gruppen werden dem Auftrag zugeordnet. Der Einsatzort wird als Adresse eingegeben. Optional können Unteraufträge angelegt und Baupläne referenziert werden. Der Auftragsstatus wird festgelegt. Nach erfolgreicher Anlage ist der Auftrag im Terminplaner sichtbar.
//FRAGE: Der Kostenvoranschlag wird aus dem Finanzbuchhaltungssystem lesend übernommen.
//FRAGE: wo ist die Verbindung zum Terminplaner

=== Baumaschine/Werkzeug verwalten

Umfasst das Anlegen, Bearbeiten und Löschen von Baumaschinen und Bauwerkzeugen durch die Bauleitung oder den Administrator. Beide werden über eine gemeinsame Geräteklasse verwaltet und über ein Kategorieattribut unterschieden. Bei der Anlage wird eine Bezeichnung (z.B. "Bagger CAT 320"), eine Kategorie (Bagger, LKW, Kran, Rüttler, Bohrmaschine, Schalungsteil, Zaun, Bausicherung) und ein Typ (Baumaschine oder Bauwerkzeug) eingegeben. Die Gerätenummer wird automatisch vergeben. Eine Seriennummer (Herstellerseriennummer) wird erfasst. Das Gerät wird einem Lager zugeordnet (Referenz auf Lager). Optional wird ein aktueller Standort angegeben, falls das Gerät nicht im Lager ist. Der Status (Verfügbar, gebucht, in Wartung, defekt) wird festgelegt. Anschaffungsdatum, letzter Wartungstermin und nächster Wartungstermin werden erfasst. Ausrüstung (z.B. Baggerschaufel, Kranzubehör) kann dem Gerät zugeordnet werden. Bilder können hochgeladen werden (LF80). Der Standort kann manuell aktualisiert werden, wenn das Gerät transportiert wird. Verwaltungsmitarbeiter haben auf Baumaschinen und Werkzeuge nur Leserechte (LF50).

=== Baumaschine/Werkzeug buchen

Der Projektleiter oder Bauleiter bucht eine Baumaschine oder ein Werkzeug für einen Arbeitsauftrag. Dabei wird das gewünschte Gerät ausgewählt (über Suchfunktion oder Auswahlliste). Der Zeitraum wird durch Start- und Enddatum festgelegt. Der Auftrag wird zugeordnet (Referenz auf Arbeitsauftrag). Das System prüft automatisch die Verfügbarkeit des Geräts im angegebenen Zeitraum. Bei Verfügbarkeit wird die Buchung gespeichert und erhält eine eindeutige Buchungsnummer. Der buchende Mitarbeiter und das Buchungsdatum werden automatisch erfasst. Der Buchungsstatus wird auf "Aktiv" gesetzt. Bei Nichtverfügbarkeit wird eine Fehlermeldung angezeigt. Die Buchung kann direkt beim Anlegen eines Auftrags oder später bei Bedarf erfolgen. Bestehende Buchungen können bearbeitet oder storniert werden. Die Benutzungszeiträume werden automatisch über die Buchungen ermittelt. Die Buchungsverwaltung ermöglicht die Übersicht über alle aktuellen und zukünftigen Buchungen. Verwaltungsmitarbeiter können Buchungen nur lesend einsehen. Die Verfügbarkeitssuche ist Teil der Gerätesuche (LF50).



=== Anwesenheitszeiten verwalten

Der Administrator und der Verwaltungsmitarbeiter erfassen und verwalten Anwesenheitszeiten für alle Mitarbeiter. Die Erfassung erfolgt primär durch Import von Stempelkarten-Daten (CSV-Format, automatisch täglich). Manuelle Eingabe ist ebenfalls möglich. Jeder Eintrag umfasst den Mitarbeiter (Referenz), das Datum, Startzeit, Endzeit und den Typ (Anwesend, Urlaub, Krankheit, sonstige Abwesenheit). Optional kann eine Bemerkung hinzugefügt werden. Die Anwesenheitszeiten werden als Tabelle dargestellt, filterbar nach Tag, Woche oder Monat. Die Gesamtstunden werden automatisch berechnet. Der Export für die Lohnabrechnung erfolgt im CSV-Format. Alle Mitarbeiter können ihre eigenen Anwesenheitszeiten einsehen (Leserecht), aber nicht bearbeiten. Vorgesetzte können die Zeiten ihrer direkten Mitarbeiter einsehen. Anwesenheitsdaten unterliegen der DSGVO und dürfen nur von berechtigten Personen eingesehen werden (LF90).

=== Daten importieren/exportieren

Ermöglicht dem Administrator den Import und Export von Daten. Der Import erfolgt aus dem Altsystem oder anderen Quellen im CSV-Format (Semikolon-separiert, UTF-8-kodiert). Alle relevanten Daten können importiert werden: Mitarbeiterdaten, Auftragsdaten, Baumaschinen- und Werkzeugdaten, Gruppenzuordnungen. Das System prüft beim Import automatisch auf Duplikate (LF100) und zeigt Warnungen an. Der Administrator kann Duplikatswarnungen überschreiben. Der Export erfolgt ebenfalls im CSV-Format und dient der Erstellung von Berichten oder Backups. Einzelne Datensätze (z.B. Aufträge, Mitarbeiterlisten) können selektiv exportiert werden. Finanztechnische Daten (Gehälter, Löhne, Projektkosten) werden nicht exportiert, da sie im separaten Finanzbuchhaltungssystem verwaltet werden. Rechnungen, Mahnungen und Kostenvoranschläge werden aus dem Finanzsystem importiert (CSV-Export, unidirektional, nur lesen). Die Synchronisation erfolgt manuell durch den Administrator bei Bedarf (z.B. wöchentlich oder nach Rechnungsstellung). Eine Verschlüsselung der Exportdaten ist nicht erforderlich, da die Dateien nur intern verwendet werden.

== Verfeinerung "Baumaschine/Werkzeug verwalten"

Als Verfeinerung wurde "Baumaschine/Werkzeug verwalten" aus obigem Diagramm ausgewählt, da es sich um eine zentrale Funktionalität mit komplexen Abhängigkeiten handelt. Die Verwaltung umfasst nicht nur das Anlegen, Bearbeiten und Löschen von Geräten, sondern auch die Zuordnung zu Lagern, die Verwaltung von Ausrüstung, die Aktualisierung von Standorten und die Berücksichtigung von Wartungsterminen. Diese Funktionalität ist eng mit dem Buchungssystem und der Verfügbarkeitssuche verknüpft.

// Hier wird das Verfeinerungsdiagramm eingefügt
// #figure(image("../assets/usecase_baumaschine_verfeinerung.png"), caption: [Use-Case-Verfeinerung: Baumaschine/Werkzeug verwalten]) <uc_baumaschine_verfeinerung>

=== Baumaschine/Werkzeug anlegen

Der Projektleiter, Bauleiter oder Administrator legt ein neues Gerät an. Die Gerätenummer wird automatisch vergeben. Eine Bezeichnung (z.B. "Bagger CAT 320") und eine Kategorie (Bagger, LKW, Kran, Rüttler, Bohrmaschine, Schalungsteil, Zaun, Bausicherung) werden eingegeben. Der Typ (Baumaschine oder Bauwerkzeug) wird festgelegt. Die Seriennummer wird erfasst. Das Gerät wird einem Lager zugeordnet (Referenz auf Lager). Der Status wird auf "Verfügbar" gesetzt. Das Anschaffungsdatum wird eingegeben. Optional können der letzte Wartungstermin und der nächste Wartungstermin erfasst werden. Dieser Use-Case inkludiert die Zuordnung zu einem Lager, die Eingabe von Attributen und optional die Zuordnung von Ausrüstung sowie das Hochladen von Bildern.

=== Lager zuordnen

Wird beim Anlegen oder Bearbeiten eines Geräts automatisch inkludiert. Der Benutzer wählt ein Lager aus einer Auswahlliste aus. Die Liste zeigt alle verfügbaren Lager mit Name, Typ (Platz oder Gebäude) und Adresse an. Die Auswahlliste ist durchsuchbar und filterbar. Wenn kein passendes Lager existiert, kann direkt ein neues Lager angelegt werden. Die Lagerzuordnung ist zwingend erforderlich, da jedes Gerät einem Lager zugeordnet sein muss. Der aktuelle Standort kann zusätzlich angegeben werden, falls das Gerät vorübergehend nicht im Lager ist (z.B. auf einer Baustelle).

=== Ausrüstung zuordnen

Erweitert optional das Anlegen oder Bearbeiten eines Geräts. Ausrüstung (z.B. Baggerschaufel, Kranzubehör wie Behälter, Gewichte, Haken, Anbaugeräte) kann einem Gerät zugeordnet werden. Die Ausrüstung wird als separate Entität verwaltet und über eine Referenz mit dem Gerät verknüpft. Jede Ausrüstung hat eine eindeutige Ausrüstungsnummer, eine Bezeichnung, einen Typ, eine Angabe zur Kompatibilität (mit welchen Gerätetypen sie verwendet werden kann), ein Gewicht und einen Status (Verfügbar, zugeordnet, in Wartung, defekt). Ein Gerät kann mehrere Ausrüstungsteile haben. Die Ausrüstung kann auch unabhängig von einem Gerät existieren und bei Bedarf zugeordnet werden. Die Suche nach Baumaschinen kann nach vorhandener Ausrüstung gefiltert werden (z.B. "Bagger mit 1,5m-Schaufel").

=== Bilder hochladen

Erweitert optional das Anlegen oder Bearbeiten eines Geräts. Der Benutzer kann ein oder mehrere Bilder (JPG, PNG, GIF, optional PDF) hochladen. Jedes Bild erhält einen vom Benutzer vergebenen Titel. Die Bilder werden zentral in einem Verzeichnis gespeichert, und der Dateipfad wird in der Datenbank referenziert. Metadaten wie Hochladedatum, Hochlader (Referenz auf Mitarbeiter), Dateigröße und Format werden automatisch erfasst. Die Bilder werden in der Detailansicht als Galerie mit Thumbnails angezeigt. Ein Klick auf ein Thumbnail öffnet das Bild in voller Größe. Mehrere Objekte können auf dasselbe Bild referenzieren. Bilder können ersetzt oder gelöscht werden; eine Versionierung ist nicht erforderlich (LF80).

=== Baumaschine/Werkzeug bearbeiten

Der Projektleiter, Bauleiter oder Administrator bearbeitet ein bestehendes Gerät. Zunächst wird das Gerät über die Suchfunktion oder Auswahlliste ausgewählt. Die bestehenden Attribute werden angezeigt und können geändert werden. Dies umfasst die Bezeichnung, Kategorie, den Status, die Lager- und Standortzuordnung, Wartungstermine und die Ausrüstung. Auch Bilder können hinzugefügt oder entfernt werden. Das System prüft vor dem Speichern auf mögliche Duplikate (z.B. anhand der Seriennummer). Änderungen an der Lagerzuordnung oder am Status werden gespeichert und wirken sich auf die Verfügbarkeitssuche aus. Dieser Use-Case inkludiert das Lesen der bestehenden Daten, die Aktualisierung von Attributen und optional die Standortaktualisierung.

=== Standort aktualisieren

Erweitert optional das Bearbeiten eines Geräts. Der aktuelle Standort wird manuell aktualisiert, wenn das Gerät transportiert wird (z.B. von einem Lager zu einer Baustelle oder zurück). Dies kann entweder durch Eingabe einer Adresse oder durch Auswahl eines Lagers erfolgen. Die Standortaktualisierung ist wichtig für die Optimierung der Projektabläufe, da so das nächstgelegene verfügbare Gerät gefunden werden kann. Die Aktualisierung erfolgt manuell durch den Benutzer; eine GPS-Ortung ist nicht erforderlich. Beim Zurücktransport zum Lager wird der Standort entsprechend aktualisiert.

=== Baumaschine/Werkzeug löschen

Der Projektleiter, Bauleiter oder Administrator löscht ein Gerät aus dem System. Zunächst wird das Gerät ausgewählt. Das System prüft, ob aktive Buchungen für dieses Gerät existieren. Wenn ja, wird eine Warnung angezeigt, und das Löschen wird verhindert oder der Benutzer muss die Buchungen zuerst stornieren. Wenn keine aktiven Buchungen vorliegen, wird das Gerät gelöscht. Referenzen zu Lagern, Ausrüstung und Bildern werden aufgelöst. Bilder werden nicht automatisch aus dem Dateisystem gelöscht, falls sie von anderen Objekten referenziert werden. Abgeschlossene Buchungen (mit Status "abgeschlossen") bleiben aus Dokumentationsgründen erhalten, auch wenn das Gerät gelöscht wurde.

=== Lager verwalten

Der Administrator verwaltet die Lager für Baumaschinen und Werkzeuge. Dies umfasst das Anlegen, Bearbeiten und Löschen von Lagern. Jedes Lager erhält eine eindeutige Lagernummer, eine Bezeichnung (z.B. "Lager Nord", "Hauptlager"), einen Typ (Platz für Außengelände oder Gebäude für Lagerhalle) und eine Adresse (Referenz auf Adresse-Entität). Optional kann eine Grundstücksbezeichnung und eine Kapazität (maximale Anzahl Geräte) angegeben werden. Lager können über die Suchfunktion gefunden und nach Typ oder Adresse gefiltert werden. Bei der Geräteverwaltung werden die verfügbaren Lager in Auswahllisten angezeigt. Ein Lager kann nur gelöscht werden, wenn keine Geräte mehr zugeordnet sind.

=== Wartungstermin festlegen

Erweitert optional das Anlegen oder Bearbeiten eines Geräts. Der Benutzer gibt den letzten Wartungstermin (Datum der letzten Wartung) und den nächsten Wartungstermin (Datum der nächsten geplanten Wartung) ein. Diese Informationen dienen der Planung und Sicherstellung der Betriebsbereitschaft. Wenn ein Gerät gewartet werden muss, kann der Status auf "in Wartung" gesetzt werden, sodass es nicht für Buchungen verfügbar ist. Nach Abschluss der Wartung wird der Status wieder auf "Verfügbar" gesetzt, und die Wartungstermine werden aktualisiert. Eine automatische Erinnerung an anstehende Wartungstermine ist nicht Teil des ersten Entwicklungsauftrags, könnte aber als Erweiterung implementiert werden.

