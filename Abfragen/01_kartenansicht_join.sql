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
