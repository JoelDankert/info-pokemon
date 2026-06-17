-- Abfrage 2: Typverteilung und durchschnittliche HP
SELECT
  t.name AS type,
  COUNT(*) AS cards,
  ROUND(AVG(c.hp), 0) AS avg_hp
FROM card c
JOIN type t ON t.id = c.type_id
GROUP BY t.name
ORDER BY cards DESC, t.name;
