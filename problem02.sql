-- для каждой планеты вывести суммарное число полётов, 
-- число полётов совершённых 3 самыми высокими уровнями капитанов
-- и долю полётов высокоуровневых капитанов в процентах (точность до целых).
-- вывести отсортированными по суммарному числу полётов, 
-- затем по процентному отношению

WITH Total AS (
    SELECT P.name, COUNT(*) count
        FROM Flight F JOIN Planet P ON F.planet_id = P.id
        GROUP BY P.name
),
HighLevel AS (
    SELECT P.name, COUNT(C.id) count
        FROM Flight F JOIN Planet P ON F.planet_id = P.id
            JOIN Commander C ON F.commander_id = C.id
        WHERE (C.rating = 'Elite' OR C.rating = 'Deadly' OR C.rating = 'Dangerous')
        GROUP BY P.name
)
SELECT T.name planet, T.count total, HL.count highLevel, (100 * HL.count / T.count) percent
    FROM Total T JOIN HighLevel HL ON T.name = HL.name
    ORDER BY total DESC, percent DESC;
