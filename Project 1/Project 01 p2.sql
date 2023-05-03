# Select only the names of the bands that were added

SELECT name AS "Band Names" FROM bands
WHERE id > 7;

# Get the amount of Albums of each Band

SELECT 
	bands.name AS "Bands", 
    COUNT(albums.id) AS "Amount of Albums"
FROM bands
INNER JOIN albums ON bands.id = albums.band_id
GROUP BY albums.band_id;

#Get the Bands that only have one Album 

SELECT 
	bands.name AS "Bands", 
    COUNT(albums.id) AS "Amount of Albums"
FROM bands
INNER JOIN albums ON bands.id = albums.band_id
GROUP BY albums.band_id
HAVING COUNT(albums.id) = 1;

#Get the Band with more Songs

SELECT 
	bands.name AS "Band",
    COUNT(songs.id) AS "Number of Songs"
FROM bands
INNER JOIN albums ON bands.id = albums.band_id
INNER JOIN songs ON albums.id= songs.album_id
GROUP BY albums.band_id
ORDER BY COUNT(songs.id) DESC
LIMIT 1
;

#Get the amount of Songs of each Album 

SELECT 
	albums.name AS "Album",
    COUNT(songs.id) AS "Number of Songs"
FROM albums
INNER JOIN songs ON albums.id = songs.album_id
GROUP BY albums.id;

#Get the first three Albums with less Songs

SELECT 
	albums.name AS "Album",
    COUNT(songs.id) AS "Number of Songs"
FROM albums
INNER JOIN songs ON albums.id = songs.album_id
GROUP BY albums.id
ORDER BY COUNT(songs.id)
LIMIT 3;

