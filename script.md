# Script zur Präsentation

## Titelfolie: Pokemon-Datenbankprojekt

Wir stellen heute unser Pokemon-Datenbankprojekt vor. Es geht nicht darum, einfach nur ein paar Pokemonkarten irgendwo zu speichern, sondern darum, daraus ein sinnvolles relationales Datenmodell zu bauen. Der Schwerpunkt liegt also auf Planung, Tabellenstruktur, Beziehungen zwischen Tabellen und SQL-Abfragen. Joel hat sehr viel an der technischen Umsetzung gemacht, ist heute aber nicht dabei. Wir zeigen trotzdem gemeinsam, wie das Projekt aufgebaut ist und was man daraus lernen kann.

## Agenda

Die Präsentation ist in vier Teile gegliedert. Zuerst geht es kurz um die Projektplanung: Was musste unbedingt rein, was wäre schön gewesen und was war eher optional. Danach erklären wir das Datenmodell, also welche Tabellen es gibt und warum wir die Daten nicht einfach in eine große Tabelle gepackt haben. Im dritten Teil zeigen wir konkrete SQL-Abfragen. Am Ende geht es um Datenqualität, Tests und darum, was wir beim nächsten Mal besser machen würden.

## Projektplanung: MUSS, SOLL, KANN

Am Anfang mussten wir priorisieren, weil man bei so einem Projekt schnell viel mehr Daten sammeln könnte, als man realistisch sauber modellieren kann. Unsere MUSS-Daten waren Name, Kartennummer, Typ, HP und Attacken. Ohne diese Informationen wäre die Datenbank fachlich kaum sinnvoll. Als SOLL-Daten kamen Illustrator, Rarität und Evolution dazu, weil diese Informationen das Modell interessanter machen. Preis, Schwäche, Resistenz und Rückzugskosten waren KANN-Daten. Die sind nützlich, aber für den ersten funktionierenden Prototyp nicht entscheidend.

## Projektplanung: wichtigste Entscheidung

Die wichtigste Entscheidung war: Erst die Pflichtdaten stabil bekommen, dann Erweiterungen. Das hat uns im Zeitrahmen sehr geholfen. Dadurch war die Datenbank früh abfragbar und wir konnten früh testen, ob die Tabellenstruktur überhaupt funktioniert. Zusatzinformationen konnten wir später ergänzen oder bewusst weglassen, ohne dass das Kernprojekt kaputtgeht. Genau deshalb sind manche Datenlücken auch kein Zufall, sondern eher eine bewusste Priorisierung.

## Datenmodellierung: Entitäten

Bei der Modellierung haben wir überlegt, welche Dinge im Projekt eigene Entitäten sind. Die zentrale Tabelle ist `card`, weil dort jede Karte steht. Typ, Rarität und Illustrator haben eigene Tabellen, weil sich diese Werte wiederholen. Attacken sind ebenfalls ausgelagert, weil sie mehr als nur ein kurzer Text sind und mehrere Karten unterschiedlich viele Attacken haben können. Die Tabelle `card_attack` verbindet Karten und Attacken miteinander. Dadurch bleibt das Modell flexibler.

## Datenmodellierung: Tabellenübersicht statt Diagramm

Hier sieht man die Tabellen nochmal kompakt. Die Kerntabellen sind `card`, `attack` und `card_attack`. `card` enthält die Karte selbst, `attack` enthält die Attackeninformationen und `card_attack` verbindet beides. Daneben gibt es Nachschlagetabellen wie `type`, `rarity` und `illustrator`. Diese Tabellen verhindern, dass dieselben Texte immer wieder in jeder Kartenzeile gespeichert werden.

## Kardinalitäten: Beziehungen im Modell

Ein wichtiger Punkt sind Kardinalitäten. Ein Typ kann zu vielen Karten gehören, aber eine Karte hat in unserem Modell genau einen Typ. Das ist also 1:n. Bei Rarität ist es genauso. Bei Karten und Attacken ist es anders: Eine Karte kann mehrere Attacken haben, und technisch könnten Attacken auch wiederverwendet werden. Deshalb benutzen wir hier eine Zwischentabelle. Evolutionen sind ein Selbstbezug, weil eine Karte auf eine andere Karte in derselben Tabelle zeigen kann.

## Normalisierung: Redundanz vermeiden

Normalisierung bedeutet hier vor allem: Wiederholte Daten auslagern. Zum Beispiel stehen Typen wie Feuer oder Wasser nicht als Freitext in jeder Karte, sondern in der Tabelle `type`. In `card` steht nur die passende ID. Ohne diese Aufteilung könnten Tippfehler entstehen, zum Beispiel `Uncommen` statt `Uncommon`. Dann würden Statistiken falsche Gruppen bilden. Außerdem müssten Änderungen an vielen Stellen korrigiert werden. Mit Normalisierung ist das sauberer.

## Schlüssel: Primärschlüssel und Fremdschlüssel

Die Tabellen haben jeweils IDs als Primärschlüssel. Damit kann jeder Datensatz eindeutig angesprochen werden. In `card` gibt es dann Felder wie `type_id`, `rarity_id` oder `illustrator_id`. Diese Felder zeigen logisch auf andere Tabellen. Bei `card_attack` gibt es `card_id` und `attack_id`, um Karten und Attacken zu verbinden. Wichtig ist aber: In unserer aktuellen Version sind viele Beziehungen logisch da, aber noch nicht konsequent als echte Foreign-Key-Constraints in der Datenbank erzwungen.

## Datenqualität: Constraints und Wirkung

Constraints sind Regeln, die verhindern sollen, dass falsche Daten gespeichert werden. Ein Primary Key verhindert zum Beispiel doppelte oder nicht eindeutig adressierbare Datensätze. Ein Foreign Key würde verhindern, dass eine Karte auf einen Typ zeigt, den es gar nicht gibt. NOT NULL würde verhindern, dass Pflichtfelder wie Name oder HP leer bleiben. UNIQUE wäre sinnvoll für Kartennummern oder Typnamen. CHECK könnte verhindern, dass zum Beispiel negative HP gespeichert werden.

## SQL-Abfragen: roter Faden

Im SQL-Teil zeigen wir nicht einfach zufällige Abfragen, sondern vier verschiedene Fähigkeiten des Modells. Die erste Abfrage setzt mit JOINs eine lesbare Kartenansicht zusammen. Die zweite Abfrage nutzt GROUP BY für eine Statistik. Die dritte nutzt HAVING, um Gruppen nach dem Zählen zu filtern. Die vierte zeigt einen Self Join für Evolutionen. So sieht man Schritt für Schritt, warum die Tabellenstruktur nützlich ist.

## Abfrage 1: Gesamtansicht einer Karte

Die erste Abfrage startet in `card` und verbindet dann Typ, Illustrator und Rarität dazu. Das ist wichtig, weil diese Informationen in eigenen Tabellen liegen. Das Ergebnis sind 21 lesbare Kartenzeilen. Man bekommt also nicht nur IDs, sondern wieder eine verständliche Ansicht mit Kartennummer, Name, Typ, HP, Illustrator und Rarität. Genau dafür sind JOINs da: verteilte Daten wieder sinnvoll zusammensetzen.

## Abfrage 1: Warum genau diese JOINs?

Die Join-Bedingungen laufen immer über IDs. Zum Beispiel wird `type.id` mit `card.type_id` verbunden. Das ist besser als über Textnamen zu joinen, weil Text fehleranfällig ist. Wenn irgendwo ein Leerzeichen oder eine andere Schreibweise steht, würde ein Textvergleich schnell kaputtgehen. IDs sind dafür stabiler. Die Abfrage zeigt also direkt, warum Primärschlüssel und Fremdschlüssel in relationalen Datenbanken so wichtig sind.

## Abfrage 2: Typverteilung mit GROUP BY

Die zweite Abfrage gruppiert Karten nach Typ. Dadurch können wir zählen, wie viele Karten pro Typ vorkommen, und gleichzeitig den durchschnittlichen HP-Wert berechnen. Das Ergebnis zeigt zum Beispiel, dass Feuer und Wasser am häufigsten vertreten sind. Außerdem hat Feuer in unserem Datensatz den höchsten durchschnittlichen HP-Wert. Diese Aussage wäre ohne saubere Typ-Tabelle deutlich unsicherer, weil Freitextwerte zu Fehlern führen könnten.

## Abfrage 2: Aussage der Statistik

Die Statistik zeigt, dass die Datenbank nicht nur einzelne Karten speichern kann, sondern auch Auswertungen ermöglicht. Das ist ein großer Vorteil eines relationalen Modells. Man kann fachliche Fragen stellen, zum Beispiel welcher Typ besonders oft vorkommt oder welcher Typ durchschnittlich hohe HP hat. Damit geht die Datenbank über eine reine Liste hinaus und wird zu einem Auswertungswerkzeug.

## Abfrage 3: Karten mit genau zwei Attacken

Die dritte Abfrage nutzt `GROUP BY` und `HAVING`. Erst werden die Attacken pro Karte gezählt, und danach filtert `HAVING` nur die Karten heraus, bei denen die Anzahl genau zwei ist. Das Ergebnis sind 8 Karten. Wichtig ist hier: `WHERE` filtert einzelne Zeilen vor dem Gruppieren, aber `HAVING` filtert Gruppen nach einer Berechnung. Deshalb passt `HAVING` genau für diese Fragestellung.

## Abfrage 3: Warum das Modell hier hilft

Diese Abfrage zeigt gut, warum `card_attack` als Zwischentabelle sinnvoll ist. Wenn wir feste Spalten wie `attack1` und `attack2` hätten, wäre das Modell unflexibel. Was passiert dann bei drei Attacken? Oder bei einer Karte ohne Attacke? Mit einer Zwischentabelle ist jede Attacke eine eigene Verbindung. Dadurch kann SQL einfach zählen, gruppieren und filtern. Das ist sauberer und besser auswertbar.

## Abfrage 4: Evolutionen per Self Join

Die vierte Abfrage verbindet die Tabelle `card` mit sich selbst. Das nennt man Self Join. Eine Karte kann über `evolves_from_card_id` auf eine andere Karte zeigen. Dadurch kann man zum Beispiel anzeigen, dass Digdri sich aus Digda entwickelt oder Camerupt aus Camaub. Für einfache Evolutionsketten reicht dieser Selbstbezug aus und man braucht keine komplett eigene Evolutionstabelle.

## Abfrage 4: Aussage und Überleitung

Gleichzeitig sieht man hier eine Grenze der Daten. Im Rohdatensatz gibt es mehr Entwicklungskarten, aber nur ein Teil konnte wirklich sauber als Link auf vorhandene Karten abgebildet werden. Das liegt daran, dass manche Vorentwicklungen in der kleinen Auswahl nicht enthalten sind. Diese Folie leitet deshalb gut zu Datenqualität über: Das Modell kann Beziehungen darstellen, aber die Daten müssen dafür vollständig genug sein.

## Testen und Debugging

Zum Testen haben wir einfache Smoke Tests genutzt. Also keine riesige Testumgebung, sondern kurze Prüfabfragen: Wie viele Karten gibt es? Wie viele Attacken-Verknüpfungen? Gibt es leere Pflichtfelder? Gibt es doppelte Kartennummern? Außerdem kann man mit `PRAGMA foreign_key_list` prüfen, ob echte Foreign Keys angelegt sind. Das Ergebnis ist: Die Daten passen logisch zusammen, aber die technische Absicherung im Schema ist noch nicht vollständig.

## Datenlücken: Was fehlt für eine bessere DB?

Die Pflichtfelder sind vollständig, aber bei Zusatzdaten gibt es klare Lücken. Resistenz ist fast leer, Preis ist gar nicht umgesetzt und bei Evolutionen fehlen einige vollständige Ketten. Das ist für die Präsentation wichtig, weil wir nicht so tun wollen, als wäre die Datenbank perfekt. Für ein Schulprojekt ist die Grundstruktur brauchbar, aber eine professionelle Version müsste Datenlücken und Constraints deutlich sauberer behandeln.

## Softwareentwicklung und Reflexion

Wenn wir das Projekt nochmal machen würden, würden wir zuerst echte Foreign Keys, NOT NULL, UNIQUE und CHECK sauber im Schema festlegen. Außerdem wäre ein Importskript sinnvoll, damit Daten nicht manuell und fehleranfällig eingepflegt werden. `card_new` würden wir entweder entfernen oder klar integrieren. Als nächster Schritt wären auch eine Set-Tabelle, bessere Preisdaten, vollständige Evolutionsketten oder eine kleine Suchoberfläche sinnvoll.

## Fazit

Zusammengefasst funktioniert die Grundstruktur. Die Pflichtdaten sind vollständig, die wichtigsten Beziehungen sind nachvollziehbar modelliert und die SQL-Abfragen zeigen, dass die Aufteilung Sinn ergibt. Gleichzeitig sieht man klar, was in einer zweiten Version besser werden müsste: mehr technische Absicherung, automatischer Import und vollständigere Zusatzdaten. Für unser Projekt war aber das Ziel, ein kleines, verständliches und auswertbares relationales Modell zu bauen.
