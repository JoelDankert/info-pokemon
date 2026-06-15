# Teaminfo zur Praesentation

Diese Datei ist bewusst ausfuehrlich geschrieben. Die Folien selbst bleiben knapp. Hier steht, was jede Person sagen kann, in welcher Reihenfolge und mit welchen Uebergaengen.

## Reihenfolge der Sprecher

1. Robert: Einstieg, Ziel des Projekts, Projektplanung, MUSS/SOLL/KANN
2. Berkay: Datenbasis, Tabellenstruktur, Normalisierung, Datenluecken
3. Felix: Abfrage 1 und Abfrage 2
4. David: Abfrage 3, Abfrage 4, Verbesserungen, Schluss

Joel wird auf der Titelfolie und bei der Rollenfolie erwaehnt:
- Er hat den groessten Teil der technischen Umsetzung gemacht.
- Er ist am Praesentationstag nicht dabei.
- Das erklaert, warum die restlichen Teammitglieder heute die Kapitel uebernehmen.

## Allgemeine Praesentationsregeln

- Nicht die Folie vorlesen. Die Folie zeigt nur die Struktur und die Schluesselbegriffe.
- Pro Folie lieber ein klarer Gedanke als zehn kleine Details.
- SQL-Code immer erst in einem Satz einordnen: "Was ist die Frage?" und dann erst erklaeren, wie die Abfrage das loest.
- Bei Nachfragen immer zuerst fachlich antworten und erst dann technisch.

## Folie 1: Titelfolie

Sprecher: Robert

Ziel:
Das Thema aufmachen, die Gruppe nennen und direkt den Fokus auf Datenbankmodell plus SQL legen.

Sprechtext:
"Wir stellen heute unser Pokemon-Datenbankprojekt vor. Die Datenbank basiert auf einer Auswahl von Pokemonkarten und war als relationales Datenbankprojekt aufgebaut. Unser Fokus liegt heute auf vier Punkten: erstens die Projektplanung, zweitens die Struktur der Datenbank, drittens mehrere SQL-Abfragen und viertens die Frage, was wir beim naechsten Mal verbessern wuerden. Joel hat den groessten Teil der technischen Umsetzung betreut, ist heute aber leider nicht dabei, deshalb uebernehmen wir die Vorstellung der einzelnen Kapitel."

Uebergang:
"Ich beginne kurz mit dem Aufbau der Praesentation."

## Folie 2: Agenda

Sprecher: Robert

Ziel:
Dem Publikum Orientierung geben.

Sprechtext:
"Die Praesentation ist in vier Kapitel gegliedert. Zuerst geht es um Projektplanung und Rollenverteilung. Danach zeigen wir, wie die Datenbank strukturiert ist und warum wir die Tabellen so aufgeteilt haben. Im dritten Teil stellen wir mehrere SQL-Abfragen vor, nicht nur eine Beispielabfrage. Am Ende reflektieren wir ehrlich, was schon gut funktioniert und was wir in einer zweiten Version verbessern wuerden."

Uebergang:
"Bevor wir in die Details gehen, hier das Projekt einmal in sehr kurzer Form."

## Folie 3: Das Projekt in 30 Sekunden

Sprecher: Robert

Ziel:
Die wichtigsten Kennzahlen nennen und klar machen, dass die DB zwar klein, aber sinnvoll aufgebaut ist.

Sprechtext:
"Unsere Haupttabelle enthaelt 21 Karten. Dazu kommen 29 Attacken-Verknuepfungen, weil einige Karten mehrere Attacken besitzen. Insgesamt haben wir 8 Typen und 6 Seltenheitsstufen in der Datenbank. Das Ziel war keine riesige Sammlung, sondern ein uebersichtlicher und gut auswertbarer Prototyp, an dem man relationale Strukturen, Joins und Auswertungen sauber zeigen kann."

Zusatz bei Bedarf:
"Gerade fuer ein Schulprojekt ist eine kleinere, kontrollierbare Datenbasis oft besser, weil man das Modell und die SQL-Abfragen dadurch wirklich versteht."

Uebergang:
"Damit das im Zeitrahmen funktioniert, war die Planung entscheidend."

## Folie 4: Projektplanung und Rollen

Sprecher: Robert

Ziel:
Zeigen, dass das Projekt nicht nur technisch, sondern auch organisatorisch strukturiert war.

Sprechtext:
"Wir haben die Arbeit klar aufgeteilt. Joel war vor allem fuer die technische Hauptumsetzung zustaendig, also Datenimport und Aufbau der SQLverine-Datenbank. Ich selbst uebernehme die Projektplanung und Einordnung. Berkay erklaert gleich das Datenmodell, Felix die ersten SQL-Abfragen und David danach die weiteren Abfragen und die Reflexion. Wichtig war fuer uns vor allem, dass wir nicht sofort blind mit Tabellen anfangen, sondern erst festlegen, welche Daten wirklich noetig sind."

Dann auf die rechte Seite eingehen:
"Unser Ablauf war im Grunde vierstufig: zuerst haben wir die Rohdaten und Pflichtfelder geklaert, dann das Modell gebaut, danach mit echten SQL-Abfragen getestet und am Schluss Fehler geprueft und die Praesentation vorbereitet. Am meisten geholfen hat uns die Priorisierung: erst Daten reduzieren, dann Struktur bauen, und frueh mit echten Abfragen testen."

Moegliche Nachfrage:
"Warum war fruehes Testen wichtig?"
Antwort:
"Weil man sonst erst sehr spaet merkt, dass Beziehungen oder Attribute fuer bestimmte Abfragen fehlen."

Uebergang:
"Die Priorisierung sieht man besonders gut bei MUSS, SOLL und KANN."

## Folie 5: MUSS, SOLL, KANN

Sprecher: Robert

Ziel:
Die fachlichen Anforderungen erklaeren.

Sprechtext:
"Unser MUSS waren die Kerndaten jeder Karte: Name, Kartennummer, Typ, HP und Attacken. Diese Informationen mussten fuer jede Karte vorhanden und direkt abfragbar sein. Beim SOLL haben wir Illustrator, Seltenheit und Evolution eingeordnet. Das sind Informationen, die das Modell deutlich besser machen, aber nicht so absolut zentral sind wie die Pflichtdaten. Beim KANN ging es um Preis, Schwaeche, Resistenz und Rueckzugskosten. Da mussten wir priorisieren, weil wir innerhalb des Zeitrahmens lieber erst eine funktionierende Grundstruktur haben wollten, bevor wir alle optionalen Details perfekt abdecken."

Wichtiger Satz:
"Im Rueckblick war diese Priorisierung wahrscheinlich die wichtigste Projektentscheidung, weil dadurch die Datenbank am Ende fertig und praesentierbar war."

Uebergang zu Berkay:
"Damit gebe ich an Berkay weiter. Er zeigt jetzt, wie aus diesen Anforderungen die eigentliche Datenbankstruktur entstanden ist."

## Folie 6: Datenbasis und Importpfad

Sprecher: Berkay

Ziel:
Vom Rohdatensatz zur strukturierten DB ueberleiten.

Sprechtext:
"Ausgangspunkt war ein CSV-Rohdatensatz mit Karteninformationen in eher textlastiger Form. Daraus mussten wir wiederkehrende Informationen herausloesen. Typ, Illustrator, Seltenheit und Attacken sollten nicht als ein grosser Textblock bleiben, sondern in eine relationale Struktur ueberfuehrt werden. Deshalb sieht man hier den Weg vom Rohdatensatz ueber die Zerlegung der Daten bis zur finalen SQLite-Datenbank in SQLverine."

Dann auf die Kennzahlen eingehen:
"In der finalen Datenbank haben wir 21 Karten in der Haupttabelle, 29 Verknuepfungen fuer Attacken und 5 echte Evolutions-Links. Gerade diese Trennung zeigt, dass wir nicht nur Daten gesammelt, sondern bewusst modelliert haben."

Uebergang:
"Wie diese relationale Struktur konkret aussieht, sieht man auf der naechsten Folie."

## Folie 7: Relationale Struktur der Datenbank

Sprecher: Berkay

Ziel:
Die Tabellen und Kardinalitaeten erklaeren.

Sprechtext:
"Im Zentrum steht die Tabelle `card`. Dort liegen die eigentlichen Karten mit Name, Nummer und HP. Wiederkehrende Informationen wie Typ, Illustrator und Seltenheit liegen bewusst in eigenen Tabellen. Das sind klassische 1:n-Beziehungen: Ein Typ kann bei vielen Karten vorkommen, aber eine einzelne Karte hat genau einen Typ. Dasselbe gilt fuer Illustrator und Seltenheit."

Dann auf `card_attack` eingehen:
"Interessanter ist die Beziehung zu den Attacken. Eine Karte kann mehrere Attacken haben, und die Attackeninformationen sollen nicht direkt als feste Spalten in `card` stehen. Deshalb gibt es die Zwischentabelle `card_attack`. Sie loest die n:m-artige Verknuepfung sauber und speichert zusaetzlich Reihenfolge und Energiekosten."

Dann den Self Join erklaeren:
"Ausserdem hat `card` einen Selbstbezug fuer Evolutionen. Das bedeutet: Eine Karte kann auf eine andere Karte aus derselben Tabelle verweisen, aus der sie sich entwickelt."

Moegliche Nachfrage:
"Warum ist das besser als alles in eine Tabelle zu schreiben?"
Antwort:
"Weil sonst dieselben Begriffe wie Typ oder Illustrator in vielen Zeilen wiederholt werden und dadurch Redundanzen und spaetere Fehler entstehen."

Uebergang:
"Damit sind wir direkt beim Thema Normalisierung und bei den Stellen, an denen die Datenbank noch nicht perfekt ist."

## Folie 8: Normalisierung und bekannte Luecken

Sprecher: Berkay

Ziel:
Staerken und Schwaechen ehrlich darstellen.

Sprechtext:
"Diese Folie zeigt eigentlich zwei Dinge gleichzeitig. Erstens: Die Normalisierung hat funktioniert. Typen, Raritaeten und Illustratoren liegen in eigenen Tabellen, also nicht mehrfach als Textkopie in jeder Kartenzeile. Auch die Attackenstruktur mit `card_attack` ist sauberer als feste Spalten wie `attack1` und `attack2`. Und Evolutionen koennen ueber einen Selbstbezug modelliert werden."

Dann der kritische Teil:
"Zweitens sehen wir aber auch klare Luecken. Die Pflichtfelder sind komplett vorhanden, das ist die gute Nachricht. Bei optionalen Daten wird es schwacher: Resistenz ist fast nie befuellt, Preis fehlt ganz und bei Evolutionen haben wir nur 5 echte Fremdschluesselbeziehungen, obwohl im Rohdatensatz 9 Entwicklungskarten vorkommen. Der Grund ist, dass mehrere Vorstufen gar nicht in unserer Kartenauswahl enthalten waren."

Technische Reflexion:
"Zusaetzlich ist die DB fachlich stimmig, aber technisch noch nicht abgesichert. Aktuell gibt es keine echten Foreign-Key- oder Not-Null-Constraints. Das wuerde man in einer robusteren zweiten Version unbedingt nachziehen."

Uebergang zu Felix:
"Mit dieser Struktur koennen wir jetzt sinnvoll abfragen. Felix zeigt als Naechstes zwei SQL-Abfragen, die unterschiedliche Ziele haben."

## Folie 9: Abfrage 1 - Gesamtansicht einer Karte

Sprecher: Felix

Ziel:
Den klassischen Multi-Join erklaeren.

Sprechtext:
"Die erste Abfrage baut aus mehreren Tabellen wieder eine lesbare Kartenansicht zusammen. Wir starten in `card` und verbinden dann Typ, Illustrator und Seltenheit ueber Joins. Dazu kommen die Attacken ueber `card_attack` und `attack`. Weil eine Karte mehrere Attacken haben kann, verwenden wir `GROUP_CONCAT`, damit am Ende nicht zwei oder drei Zeilen pro Karte entstehen, sondern eine kompakte Ausgabe."

Dann das Beispiel aufgreifen:
"Am Beispiel von Camerupt sieht man gut, was die Abfrage leistet: Kartennummer, Typ, HP, Illustrator, Raritaet und beide Attacken werden in einer Ansicht zusammengefuehrt. Genau so eine Abfrage ist spaeter praktisch, wenn man eine Karte komplett darstellen will."

Wichtiger Erklaersatz:
"Die Abfrage ist also kein reiner Technik-Trick, sondern sie zeigt, dass unsere Tabellenstruktur trotz Aufteilung wieder sauber zusammengesetzt werden kann."

Uebergang:
"Die zweite Abfrage schaut nicht auf Einzelkarten, sondern auf die Datenbasis als Ganzes."

## Folie 10: Abfrage 2 - Typenverteilung

Sprecher: Felix

Ziel:
GROUP BY und statistische Aussage erklaeren.

Sprechtext:
"Hier verwenden wir `GROUP BY`, um nicht einzelne Karten, sondern Typgruppen auszuwerten. Die Abfrage zaehlt, wie viele Karten es pro Typ gibt, und berechnet gleichzeitig die durchschnittlichen HP. Das Diagramm daneben zeigt die Verteilung visuell: Feuer und Wasser kommen am haeufigsten vor, jeweils mit vier Karten."

Dann die Interpretation:
"Interessant ist ausserdem, dass Feuer den hoechsten durchschnittlichen HP-Wert hat. Das liegt vor allem daran, dass mit Camerupt und vor allem Mega Glurak Y ex zwei sehr starke Feuerkarten in der Auswahl liegen. Solche Auswertungen sind mit einer sauber strukturierten Datenbank schnell moeglich."

Moegliche Nachfrage:
"Warum berechnet ihr auch den Durchschnitt der HP?"
Antwort:
"Weil wir dadurch nicht nur die Menge, sondern auch die Staerkeverteilung pro Typ vergleichen koennen."

Uebergang zu David:
"Damit gebe ich weiter an David. Er zeigt jetzt noch zwei weitere Abfragetypen, die andere Beziehungen in der Datenbank sichtbar machen."

## Folie 11: Abfrage 3 - Evolutionen per Self Join

Sprecher: David

Ziel:
Self Join fachlich und technisch erklaeren.

Sprechtext:
"Diese Abfrage ist interessant, weil sie keine verschiedenen Tabellen verbindet, sondern die Tabelle `card` mit sich selbst. Das nennt man Self Join. Wir wollen fuer jede Entwicklungskarte wissen, aus welcher Karte sie hervorgeht. Deshalb wird die gleiche Tabelle einmal als aktuelle Karte und einmal als Vorstufe gelesen."

Dann auf das Ergebnis eingehen:
"In unserer Datenbank gibt es 5 echte Evolutionsbeziehungen, zum Beispiel Digda zu Digdri oder die Gelatini-Kette bis Gelatwino. Gleichzeitig erkennt man hier aber auch eine Luecke: Im Rohdatensatz gibt es insgesamt 9 Entwicklungskarten. Nicht alle Vorstufen waren in unserer Auswahl vorhanden. Das bedeutet, dass die Idee im Modell richtig ist, aber die Datenbasis noch nicht vollstaendig."

Wichtiger Satz:
"Gerade solche Abfragen sind hilfreich, weil sie nicht nur Daten zeigen, sondern auch Modellgrenzen sichtbar machen."

Uebergang:
"Die letzte Abfrage zeigt jetzt noch, warum die Zwischentabelle fuer Attacken wirklich sinnvoll ist."

## Folie 12: Abfrage 4 - Karten mit genau zwei Attacken

Sprecher: David

Ziel:
HAVING erklaeren und die Bedeutung der Zwischentabelle betonen.

Sprechtext:
"Hier gruppieren wir wieder nach Karte, aber diesmal filtern wir anschliessend mit `HAVING`. Das ist wichtig, weil `HAVING` auf bereits gruppierte Ergebnisse wirkt. Wir fragen also: Welche Karten haben genau zwei Attacken? Das Ergebnis sind 8 Karten."

Dann die Interpretation:
"Auffaellig ist, dass darunter mehrere weiterentwickelte oder spielmechanisch interessantere Karten sind, etwa Camerupt, Gelatwino oder Team Rockets Kokowei. Vor allem zeigt die Abfrage, warum `card_attack` als eigene Tabelle sinnvoll ist. Wenn wir stattdessen starre Spalten wie `attack1` und `attack2` haetten, waere das Modell viel unflexibler und spaetere Erweiterungen waeren unpraktischer."

Moegliche Nachfrage:
"Warum `HAVING` und nicht `WHERE`?"
Antwort:
"Weil `WHERE` vor dem Gruppieren filtert und `HAVING` nach dem Gruppieren auf die Anzahl der Attacken pro Karte angewendet werden kann."

Uebergang:
"Zum Schluss noch die ehrliche Frage: Was wuerden wir beim naechsten Mal besser machen?"

## Folie 13: Was wuerden wir beim naechsten Mal verbessern?

Sprecher: David

Ziel:
Reflexion und technische Reife zeigen.

Sprechtext:
"Beim Datenmodell wuerden wir zuerst eine echte Set-Tabelle ergaenzen, damit nicht nur die Kartennummer gespeichert ist, sondern auch das Set selbst sauber modelliert wird. Ausserdem wuerden wir Preis als weiteres Attribut oder sogar als eigene Verlaufstabelle aufnehmen, weil das fuer Sammlerkarten eigentlich sehr spannend ist. Auch die Evolutionsketten sollten vollstaendig importiert werden, damit alle Vorstufen wirklich verknuepft sind."

Dann die technische Seite:
"Auf technischer Ebene fehlen momentan noch wichtige Sicherungen: echte Foreign Keys, Not-Null-Bedingungen und idealerweise ein Importskript, damit die Daten nicht von Hand eingepflegt werden muessen. Zusaetzlich wuerden wir feste Testabfragen als Smoke Tests definieren, damit man nach jeder Aenderung schnell sieht, ob die DB noch konsistent ist."

Fazit-Satz:
"Unser Eindruck ist also: Die Grundidee und die Struktur sind gut, aber die zweite Version wuerde deutlich professioneller werden, wenn wir mehr Vollstaendigkeit, mehr technische Sicherheit und mehr Automatisierung einbauen."

Uebergang:
"Damit sind wir am Ende."

## Folie 14: Schlussfolie

Sprecher: David

Ziel:
Sauber abschliessen und Raum fuer Fragen oeffnen.

Sprechtext:
"Vielen Dank fuers Zuhoeren. Wir hoffen, man konnte sehen, dass hinter der Datenbank nicht nur ein paar Kartendaten stehen, sondern echte Ueberlegungen zu Modellierung, Normalisierung und SQL-Abfragen. Jetzt gerne Fragen."

## Erwartbare Fragen mit Kurzantworten

### Warum habt ihr keine Preisdaten?

Kurzantwort:
"Preis war bei uns als KANN-Anforderung eingeordnet. Wir haben uns im Zeitrahmen zuerst auf die Pflichtdaten und die relationale Struktur konzentriert."

### Warum ist Resistenz fast leer?

Kurzantwort:
"Die Datenbasis war begrenzt und bei vielen der ausgewaehlten Karten war im Rohdatensatz keine sinnvolle Resistenz vorhanden. Fuer eine groessere zweite Version wuerden wir das erweitern."

### Warum gibt es keine echten Foreign Keys in der Datenbank?

Kurzantwort:
"Die Beziehungen sind logisch richtig eingetragen, aber noch nicht technisch abgesichert. Das ist einer der wichtigsten Punkte, die wir im naechsten Durchlauf verbessern wuerden."

### Warum ist `card_attack` besser als feste Angriffsspalten?

Kurzantwort:
"Weil Karten unterschiedlich viele Attacken haben koennen. Eine Zwischentabelle ist flexibler, sauberer und besser abfragbar."

### Was war euer wichtigster Projektmanagement-Punkt?

Kurzantwort:
"Die Priorisierung ueber MUSS, SOLL und KANN. Dadurch hatten wir am Ende eine funktionierende Datenbank statt eine ueberladene halbfertige Loesung."

## Sehr kurze Notfallversion

Falls die Zeit knapp wird, kann jede Person ihren Teil auf den Kern reduzieren:

- Robert: Ziel des Projekts, Rollen, MUSS/SOLL/KANN
- Berkay: `card` als Zentrum, ausgelagerte Tabellen, keine Constraints, einige optionale Daten fehlen
- Felix: Abfrage 1 ist Multi-Join fuer Kartendetails, Abfrage 2 ist GROUP BY fuer Typstatistik
- David: Abfrage 3 ist Self Join fuer Evolutionen, Abfrage 4 nutzt HAVING fuer zwei Attacken, danach Verbesserungen nennen
