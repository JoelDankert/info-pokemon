-- Smoke Test 1: Anzahl Karten
SELECT COUNT(*) AS cards FROM card;

-- Smoke Test 2: Anzahl Attacken-Verknuepfungen
SELECT COUNT(*) AS card_attack_links FROM card_attack;

-- Smoke Test 3: fehlende Pflichtfelder
SELECT
  SUM(CASE WHEN card_number IS NULL OR TRIM(card_number) = '' THEN 1 ELSE 0 END) AS missing_number,
  SUM(CASE WHEN name IS NULL OR TRIM(name) = '' THEN 1 ELSE 0 END) AS missing_name,
  SUM(CASE WHEN type_id IS NULL THEN 1 ELSE 0 END) AS missing_type,
  SUM(CASE WHEN hp IS NULL THEN 1 ELSE 0 END) AS missing_hp
FROM card;

-- Smoke Test 4: doppelte Kartennummern
SELECT card_number, COUNT(*) AS amount
FROM card
GROUP BY card_number
HAVING COUNT(*) > 1;

-- Smoke Test 5: technisch angelegte Foreign Keys pruefen
PRAGMA foreign_key_list(card);
PRAGMA foreign_key_list(card_attack);
