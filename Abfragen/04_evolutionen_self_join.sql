-- Abfrage 4: Evolutionen ueber Self Join
SELECT
  c.name AS card,
  e.name AS evolves_from
FROM card c
LEFT JOIN card e ON e.id = c.evolves_from_card_id
WHERE c.evolves_from_card_id IS NOT NULL
ORDER BY c.id;
