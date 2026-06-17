# Allgemeine Projektbeschreibung

Diese Datei ist keine Sprecheranweisung mehr. Sie beschreibt das Projekt allgemein, damit Inhalte bei Bedarf in Handout, Vortrag oder Nachfragen uebernommen werden koennen.

## Projektidee

Im Projekt wurde eine relationale Datenbank fuer eine kleine Auswahl von Pokemonkarten aufgebaut. Ziel war nicht eine moeglichst grosse Sammlung, sondern ein nachvollziehbares Datenmodell, an dem zentrale Datenbankkonzepte gezeigt werden koennen: Entitaeten, Kardinalitaeten, Normalisierung, Schluessel, Datenqualitaet und SQL-Abfragen.

Die Datenbank basiert auf 21 Karten. Die wichtigsten Pflichtinformationen sind Name, Kartennummer, Typ, HP und Attacken. Als sinnvolle Zusatzinformationen wurden Illustrator, Raritaet und Evolution aufgenommen. Weitere optionale Daten wie Preis, Resistenz oder Rueckzugskosten wurden teilweise nicht vollstaendig umgesetzt und deshalb in der Reflexion als Datenluecken genannt.

## Projektplanung

Die Planung wurde ueber MUSS/SOLL/KANN priorisiert.

MUSS:
- Name
- Kartennummer
- Typ
- HP
- Attacken

SOLL:
- Illustrator
- Raritaet
- Evolution

KANN:
- Preis
- Schwaeche
- Resistenz
- Rueckzugskosten

Die wichtigste Projektentscheidung war, zuerst die Pflichtdaten und die Grundstruktur stabil zu machen. Dadurch war die Datenbank frueh abfragbar. Zusatzdaten konnten spaeter ergaenzt oder bewusst als Luecke dokumentiert werden.

## Datenmodell

Die wichtigsten Entitaeten sind:

- `card`: zentrale Tabelle fuer Karten
- `type`: Typen wie Feuer, Wasser, Kampf oder Pflanze
- `rarity`: Seltenheitsstufen wie Common, Uncommon, Rare oder Secret Rare
- `illustrator`: Illustratornamen
- `attack`: Attacken mit Schaden und Beschreibung
- `card_attack`: Zwischentabelle zwischen Karten und Attacken

Diese Aufteilung verhindert Redundanz. Typ, Raritaet und Illustrator werden nicht mehrfach als Text in jeder Kartenzeile gespeichert, sondern ueber IDs referenziert. Attacken werden nicht in festen Spalten wie `attack1` und `attack2` gespeichert, sondern ueber eine eigene Verknuepfungstabelle.

## Kardinalitaeten

Beispiele:

- `type` zu `card`: 1:n, weil ein Typ bei mehreren Karten vorkommen kann.
- `rarity` zu `card`: 1:n, weil viele Karten dieselbe Seltenheit haben koennen.
- `card` zu `attack`: n:m-artig ueber `card_attack`, weil eine Karte mehrere Attacken haben kann.
- `card` zu `card`: Selbstbezug fuer Evolutionen.

## Schluessel und Constraints

Die Tabellen besitzen `id`-Spalten als Primaerschluessel. Die Beziehungen werden logisch ueber Felder wie `type_id`, `rarity_id`, `illustrator_id`, `card_id`, `attack_id` und `evolves_from_card_id` hergestellt.

Wichtig fuer die Reflexion: Die aktuelle Datenbank enthaelt die Beziehungen logisch, erzwingt sie aber nicht konsequent mit echten `FOREIGN KEY`-Constraints. Auch `NOT NULL`, `UNIQUE` und `CHECK` sollten in einer zweiten Version konsequenter eingesetzt werden.

## Datenqualitaet

Die Pflichtdaten sind vollstaendig. Bekannte Luecken:

- Preis fehlt komplett.
- Resistenz ist nur bei 1 von 21 Karten belegt.
- Evolutionen sind nur teilweise als echte Verknuepfung vorhanden, weil einige Vorstufen in der Kartenauswahl fehlen.
- Die Tabelle `card_new` wirkt wie eine ungenutzte Dublette und sollte bereinigt oder klar integriert werden.

## SQL-Abfragen

Die Praesentation zeigt drei zentrale Arten von Abfragen:

- JOIN-Abfrage fuer Kartendetails mit Typ, Illustrator und Raritaet
- GROUP-BY-Abfrage fuer Typverteilung und durchschnittliche HP
- HAVING-Abfrage fuer Karten mit genau zwei Attacken

Die JOIN-Abfrage zeigt, dass die ausgelagerten Tabellen wieder zu einer lesbaren Kartenansicht zusammengefuehrt werden koennen. Die Statistikabfrage zeigt, dass Feuer und Wasser die haeufigsten Typen sind und Feuer den hoechsten durchschnittlichen HP-Wert hat. Die HAVING-Abfrage zeigt, dass 8 von 21 Karten genau zwei Attacken besitzen.

## Testen und Debugging

Zur Pruefung wurden Smoke Tests verwendet:

- Anzahl der Karten pruefen
- Anzahl der Attacken-Verknuepfungen pruefen
- fehlende Pflichtfelder suchen
- doppelte Kartennummern suchen
- logische Fremdschluesselbeziehungen pruefen
- `PRAGMA foreign_key_list` verwenden, um echte Constraints zu kontrollieren

Ergebnis: Die Daten sind inhaltlich konsistent, aber die technische Absicherung im Schema ist noch ausbaufaehig.

## Reflexion

Beim naechsten Durchlauf waeren die wichtigsten Verbesserungen:

- echte Foreign Keys im Schema
- konsequente `NOT NULL`-, `UNIQUE`- und `CHECK`-Constraints
- Importskript statt manueller Einpflege
- Set-Tabelle fuer Setname und Setnummer
- Preis als eigenes Attribut oder Verlaufstabelle
- vollstaendige Evolutionsketten
- einfache Such- oder Filteroberflaeche
