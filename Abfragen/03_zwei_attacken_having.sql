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
