#GIOVALDIRCH WORKBENCH
use sakila;
# 1 Tampilkan daftar 10 film komedi dengan durasi tersingkat. Urutkan data berdasarkan film dengan durasi terpendek. Kolom yang diwajibkan tampil adalah title, category dan length 
SELECT 
    film.title, 
    category.name AS category, 
    film.length 
FROM #DARI
    film,
    film_category,
    category
WHERE #DIMANA
	film.film_id = film_category.film_id
    AND film_category.category_id = category.category_id
    AND name = 'COMEDY'
ORDER BY length
LIMIT 10;

# 2 Tampilkan daftar lengkap kategori film beserta jumlah film tiap kategori & rata-rata harga sewa DVD film tiap kategori. Urutkan data dari kategori dengan jumlah film terbanyak. Kolom yang diwajibkan ada minimal adalah kategori, jumlah film dan rata-rata harga sewa.
SELECT 
    category.name AS kategori,
    COUNT(film.title) AS jumlahMovie,
    AVG(rental_rate) AS rataHargaSewa
FROM
    film,
    category,
    film_category
WHERE
    film.film_id = film_category.film_id
	AND category.category_id = film_category.category_id
GROUP BY category.name
ORDER BY COUNT(film.title) DESC;

# 3 Tampilkan daftar lengkap rating film beserta keterangan arti rating & jumlah film tiap rating. Kolom yang diwajibkan ada minimal adalah rating, keterangan rating dan jumlah film.
# Apakah harus/kudu/mesti pake SELECT aja?
#cara 1
DROP temporary table MPAA; # MPAA = Motion Picture Association of America
CREATE temporary table MPAA(rating varchar(50),keterangan varchar(50)); #karena tidak boleh mengubah isinya, jadinya pake temporary table 
DESCRIBE MPAA;
INSERT INTO MPAA values
("G","General Audience"),
("PG","Parental Guidance Suggested"),
("PG-13", "Parental Guidances for Under 13"),
("R", "Restricted"),
("NC-17", "No Children Under 17 Admitted");
SELECT
    film.rating AS rating,
    MPAA.keterangan AS keterangan,
    COUNT(film.title) AS jumlahMovie
FROM
    film,
    MPAA
WHERE
    film.rating = MPAA.rating
GROUP BY 1,2
ORDER BY 1,2;
#cara 2
SELECT 
    film.rating,
    CASE
        WHEN film.rating = 'G' THEN 'General Audiences'
        WHEN film.rating = 'PG' THEN 'Parental Guidance Suggested'
        WHEN film.rating = 'PG-13' THEN 'Parental Guidances for Under 13 '
        WHEN film.rating = 'R' THEN 'Restricted'
        WHEN film.rating = 'NC-17' THEN 'No Children Under 17 Admitted'
        ELSE 'NOT DEFINED'
    END AS keterangan,
    COUNT(film.title) AS jumlahMovie
FROM
    sakila.film
GROUP BY 1,2
ORDER BY 1,2;
# 4 Tampilkan daftar 10 aktor/aktris yang paling banyak membintangi film. Kolom yang ditampilkan minimal: id aktor, nama depan, nama belakang dan jumlah film yang dibintangi kemudian urutkan dari aktor/aktris yang membintangi film terbanyak.
SELECT 
    actor.actor_id, #actor_id
    actor.first_name, #nama depan
    actor.last_name, #nama belakang
    COUNT(film.title) AS jumlahMovie 
FROM
    actor,
    film,
    film_actor
WHERE
    actor.actor_id = film_actor.actor_id
	AND film.film_id = film_actor.film_id
GROUP BY actor_id
ORDER BY COUNT(film.title) DESC
LIMIT 10;

# 5 Dari soal sebelumnya diketahui Gina Degeneres merupakan aktris yang paling banyak membintangi film, dengan total 42 judul film. Kategori film apakah yang paling banyak dibintanginya? Untuk mengetahuinya, tampilkan daftar kategori film beserta jumlah film yang pernah dibintangi oleh Gina Degeneres. Kolom yang diwajibkan ada yaitu kategori film dan jumlah film yang dibintangi.
SELECT 
    category.name AS category, COUNT(film.title) AS jumlah_Movie
FROM
    actor,
    film,
    film_actor,
    film_category,
    category
WHERE
    actor.actor_id = film_actor.actor_id
	AND film.film_id = film_actor.film_id
	AND film.film_id = film_category.film_id
	AND category.category_id = film_category.category_id
	AND actor.first_name IN ('GINA')
	AND actor.last_name IN ('DEGENERES')
GROUP BY category.name;

#6 Dari soal sebelumnya diketahui Gina Degeneres paling banyak membintangi film bergenre science-fiction, dengan total 7 judul film. Tampilkan daftar judul film sci-fi yang pernah dibintangi oleh Gina Degeneres. Kolom yang diwajibkan ada yaitu judul film dan kategorinya
SELECT 
    film.title AS title, category.name AS category
FROM
    actor,
    film,
    film_actor,
    film_category,
    category
WHERE
    actor.actor_id = film_actor.actor_id
	AND film.film_id = film_actor.film_id
	AND film.film_id = film_category.film_id
	AND category.category_id = film_category.category_id
	AND actor.first_name IN ('GINA')
	AND actor.last_name IN ('DEGENERES')
	AND category.name IN ('Sci-Fi');

# 7 Tampilkan daftar 10 aktor/aktris yang paling banyak membintangi film horror. Kolom yang ditampilkan minimal: id aktor, nama depan, nama belakang dan jumlah film horror yang dibintangi kemudian urutkan dari aktor/aktris yang membintangi film horror terbanyak
SELECT 
    actor.actor_id,
    actor.first_name,
    actor.last_name,
    COUNT(film.title) AS jumlah_Movie
FROM
    actor,
    film,
    film_actor,
    film_category,
    category
WHERE
    actor.actor_id = film_actor.actor_id
	AND film.film_id = film_actor.film_id
	AND film.film_id = film_category.film_id
	AND category.category_id = film_category.category_id
	AND category.name IN ('Horror')
GROUP BY actor.actor_id
ORDER BY COUNT(film.title) DESC
LIMIT 10;

# 8 Dari soal sebelumnya diketahui Julia McQueen merupakan aktris yang paling banyak membintangi film horror, dengan total 7 judul film. Tampilkan daftar judul film horror yang pernah dibintangi oleh Julia McQueen. Kolom yang diwajibkan ada yaitu judul film dan kategorinya. 
SELECT 
    film.title AS title, category.name AS category
FROM
    actor,
    film,
    film_actor,
    film_category,
    category
WHERE
    actor.actor_id = film_actor.actor_id
	AND film.film_id = film_actor.film_id
	AND film.film_id = film_category.film_id
	AND category.category_id = film_category.category_id
	AND category.name IN ('Horror')
	AND actor.first_name IN ('JULIA')
	AND actor.last_name IN ('MCQUEEN');