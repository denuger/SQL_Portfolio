CREATE DATABASE record_company;
USE record_company;
CREATE TABLE bands(
	id INT NOT NULL auto_increment,
	name VARCHAR(255) NOT NULL,
    PRIMARY KEY (id)
);
CREATE TABLE albums(
	id INT NOT NULL AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    release_year INT,
    band_id INT NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (band_id) REFERENCES bands(id)
);

CREATE TABLE songs (
	id INT AUTO_INCREMENT NOT NULL,
    name VARCHAR(255) NOT NULL,
    lenght FLOAT NOT NULL,
    album_id INT NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (album_id) REFERENCES albums(id)
);








#Select only the Names of all the Bands
SELECT name AS "Band Names" FROM bands ; 

#Select the Oldest Album
SELECT * FROM albums
WHERE release_year IS NOT NULL
ORDER BY release_year 
LIMIT 1;

#Get all Bands that have Albums
SELECT DISTINCT bands.name AS "Band Name" FROM bands
INNER JOIN albums ON bands.id = albums.band_id
; 

#Get all Bands that have No Albums
SELECT DISTINCT bands.name AS "Band Name" FROM bands    
LEFT JOIN albums ON bands.id = albums.band_id
GROUP BY albums.band_id
HAVING COUNT(albums.id) = 0
; 


#Get the Longest Album
SELECT 
	albums.name AS "Name",
    albums.release_year AS "Release Year",
    SUM(songs.lenght) AS "Duration"    
FROM  albums
INNER JOIN songs ON albums.id = songs.album_id
GROUP BY songs.album_id 
ORDER BY Duration DESC 
LIMIT 1
;

#Update the Release Year of the Album with no Release Year
SELECT * FROM albums 
WHERE release_year IS NULL
;

UPDATE albums
	SET release_year = 1986 
    WHERE id = 4;

#Insert a record for a Band and one of their Albums
INSERT INTO bands (name)
VALUES ("Queen");

INSERT INTO albums(name,release_year,band_id)
VALUES ("The Game", 1980, 8);


#Delete the Band and Album that was added in #8
DELETE FROM albums WHERE id= 20;
DELETE FROM bands WHERE id=8;

#Get the Average Length of all Songs
SELECT AVG(lenght) AS "Average Song Duration" FROM songs;

#Select the longest Song off each Album
SELECT 
	albums.name AS "Album", 
    release_year AS "Release Year", 
    MAX(songs.lenght) AS "Duration" 
FROM albums
INNER JOIN songs ON albums.id = songs.album_id
GROUP BY Album;

#Get the number of Songs for each Band
SELECT 
	bands.name AS "Band",
    COUNT(songs.id) AS "Number of Songs"
FROM bands
INNER JOIN albums ON bands.id = albums.band_id
INNER JOIN songs ON albums.id= songs.album_id
GROUP BY albums.band_id 
;


