-- Abfrage 1: Kartenansicht mit JOINs
SELECT
  c.card_number,
  c.name,
  t.name AS type,
  c.hp,
  i.name AS illustrator,
  r.name AS rarity
FROM card c
JOIN type t ON t.id = c.type_id
JOIN illustrator i ON i.id = c.illustrator_id
JOIN rarity r ON r.id = c.rarity_id
ORDER BY c.id;

-- Abfrage 2: Typverteilung und durchschnittliche HP
SELECT
  t.name AS type,
  COUNT(*) AS cards,
  ROUND(AVG(c.hp), 0) AS avg_hp
FROM card c
JOIN type t ON t.id = c.type_id
GROUP BY t.name
ORDER BY cards DESC, t.name;

-- Abfrage 3: Karten mit genau zwei Attacken
SELECT
  c.name,
  COUNT(*) AS attacks,
  c.hp
FROM card c
JOIN card_attack ca ON ca.card_id = c.id
GROUP BY c.id
HAVING COUNT(*) = 2
ORDER BY c.hp DESC, c.name;

-- Abfrage 4: Evolutionen ueber Self Join
SELECT
  c.name AS card,
  e.name AS evolves_from
FROM card c
LEFT JOIN card e ON e.id = c.evolves_from_card_id
WHERE c.evolves_from_card_id IS NOT NULL
ORDER BY c.id;

-- Smoke Test 1: Anzahl Karten
SELECT COUNT(*) AS cards FROM card;

-- Smoke Test 2: fehlende Pflichtfelder
SELECT
  SUM(CASE WHEN card_number IS NULL OR TRIM(card_number) = '' THEN 1 ELSE 0 END) AS missing_number,
  SUM(CASE WHEN name IS NULL OR TRIM(name) = '' THEN 1 ELSE 0 END) AS missing_name,
  SUM(CASE WHEN type_id IS NULL THEN 1 ELSE 0 END) AS missing_type,
  SUM(CASE WHEN hp IS NULL THEN 1 ELSE 0 END) AS missing_hp
FROM card;

-- Smoke Test 3: doppelte Kartennummern
SELECT card_number, COUNT(*) AS amount
FROM card
GROUP BY card_number
HAVING COUNT(*) > 1;

-- Smoke Test 4: technisch angelegte Foreign Keys pruefen
PRAGMA foreign_key_list(card);
PRAGMA foreign_key_list(card_attack);
