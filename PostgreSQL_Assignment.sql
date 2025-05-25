
CREATE TABLE rangers (
  ranger_id SERIAL PRIMARY KEY,
  name VARCHAR(100) NOT NULL,
  region VARCHAR(100) NOT NULL
);

INSERT INTO rangers (name, region) VALUES
('Alice Green', 'Northern Hills'),
('Bob White', 'River Delta'),
('Carol King', 'Mountain Range'),
('David Smith', 'Forest Edge'),
('Eve Johnson', 'Coastal Area'),
('Frank Black', 'Desert Plains')


SELECT *FROM rangers;


CREATE TABLE species (
  species_id SERIAL PRIMARY KEY,
  common_name VARCHAR(100) NOT NULL,
  scientific_name VARCHAR(150) NOT NULL,
  discovery_date DATE NOT NULL,
  conservation_status   VARCHAR(50) DEFAULT 'Unknown'
);


SELECT * FROM species;

INSERT INTO species(common_name, scientific_name, discovery_date, conservation_status) VALUES
('Snow Leopard', 'Panthera uncia ', '1775-01-01', 'Endangered'),
('Bengal Tiger', 'Panthera tigris', '1758-01-01', 'Endangered'),
('Red Panda','Ailurus fulgens','1825-01-01','Vulnerable'),
('Asiatic Elephant', 'Elephas maximus indicus','1758-01-01','Endangered'),
('Indian Rhino', 'Rhinoceros unicornis', '1815-01-01', 'Vulnerable'),
('Snowy Owl', 'Bubo scandiacus', '1758-01-01', 'Least Concern'),
('Giant Panda', 'Ailuropoda melanoleuca', '1869-01-01', 'Vulnerable'),
('African Lion', 'Panthera leo', '1758-01-01', 'Vulnerable'),
('Gray Wolf', 'Canis lupus', '1758-01-01', 'Least Concern'),
('American Bison', 'Bison bison', '1758-01-01', 'Near Threatened');



CREATE TABLE sightings (
  sighting_id SERIAL PRIMARY KEY,
  species_id INT REFERENCES species(species_id),
  ranger_id INT REFERENCES rangers(ranger_id),
  location VARCHAR(150) NOT NULL,
  sighting_time TIMESTAMP NOT NULL,
  notes TEXT
);


INSERT INTO sightings (species_id, ranger_id, location, sighting_time, notes) VALUES
(1, 1, 'Peak Ridge', '2024-05-10 07:45:00', 'Camera trap image captured'),
(2, 2, 'Bankwood Area', '2024-05-12 16:20:00', 'Juvenile seen'),
(3, 3, 'Bamboo Grove East', '2024-05-15 09:10:00', 'Feeding observed'),
(1, 2, 'Snowfall Pass', '2024-05-18 18:30:00', NULL);

sELECT * FROM sightings;

-- Register a new ranger with provided data with name = 'Derek Fox' and region = 'Coastal Plains'


INSERT INTO rangers (name, region)
VALUES ('Derek Fox', 'Coastal Plains');


-- Count unique species ever sighted.


SELECT COUNT(DISTINCT species_id) AS unique_species_count
FROM sightings;

-- Find all sightings where the location includes "Pass".

SELECT *
FROM sightings
WHERE location ILIKE '%Pass%';

-- List each ranger's name and their total number of sightings.

SELECT rangers.name, COUNT(sightings.sighting_id) AS total_sightings
FROM rangers
JOIN sightings ON rangers.ranger_id = sightings.ranger_id
GROUP BY rangers.name;

-- List species that have never been sighted.

SELECT common_name
FROM species
WHERE species_id NOT IN (
  SELECT DISTINCT species_id FROM sightings
);


-- Show the most recent 2 sightings.

SELECT sp.common_name, s.sighting_time, r.name
FROM sightings s
JOIN species sp ON s.species_id = sp.species_id
JOIN rangers r ON s.ranger_id = r.ranger_id
ORDER BY s.sighting_time DESC
LIMIT 2;


-- Update all species discovered before year 1800 to have status 'Historic'.

UPDATE species
SET conservation_status = 'Historic'
WHERE discovery_date < '1800-01-01';


-- Label each sighting's time of day as 'Morning', 'Afternoon', or 'Evening'.

SELECT sighting_id,
  CASE
    WHEN EXTRACT(HOUR FROM sighting_time) < 12 THEN 'Morning'
    WHEN EXTRACT(HOUR FROM sighting_time) BETWEEN 12 AND 17 THEN 'Afternoon'
    ELSE 'Evening'
  END AS time_of_day
FROM sightings;


-- Delete rangers who have never sighted any species

DELETE FROM rangers
WHERE ranger_id NOT IN (
  SELECT DISTINCT ranger_id FROM sightings
);
