-- Для каждой расы найти планету, куда летит больше всего

WITH PlanetCounter AS (
    SELECT DISTINCT ON (race, count) Pax.race, Planet.name AS planet, Count(*) AS count
        FROM Pax JOIN Booking ON Pax.id = Booking.pax_id
             JOIN Flight ON Booking.flight_id = Flight.id
             JOIN Planet ON Planet.id = Flight.planet_id
        GROUP BY (Pax.race, Planet.name)
)
SELECT race, planet, count
    FROM PlanetCounter AS PC1
    WHERE count IN (
        SELECT count
            FROM PlanetCounter AS PC2
            WHERE PC1.race = PC2.race
            ORDER BY count DESC LIMIT 1
    );
