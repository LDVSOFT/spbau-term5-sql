-- Для каждой планеты вывести список дат полётов, на которые есть 
-- свободные места и на которых достигается минимальная цена
-- Вывести, упорядочив по имени планет

WITH Free AS (
    SELECT F.id id, (S.capacity - COUNT(*)) free, P.price
        FROM Flight F 
            JOIN Booking B ON F.id = B.flight_id
            JOIN Spacecraft S ON S.id = F.spacecraft_id
            JOIN Price P ON P.planet_id = F.planet_id AND S.class = P.spacecraft_class
    GROUP BY F.id, S.capacity, P.price
), 
MinPrice AS (
    SELECT Planet.id planet_id, MIN(Free.price) price
        FROM Free 
            JOIN Flight ON Free.id = Flight.id
            JOIN Planet ON Flight.planet_id = Planet.id        
    WHERE free > 0
    GROUP BY Planet.id
)
SELECT P.name planet, F.date, M.price
    FROM MinPrice M JOIN Planet P ON M.planet_id = P.id
        JOIN Flight F ON F.planet_id = P.id
    ORDER BY planet ASC;
