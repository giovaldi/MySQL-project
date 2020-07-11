# GIOVALDIRCH - SOAL UJIAN DATA ANALYTICS & VISUALIZATION

# SOAL 1 MySQL World Database - 30 poin

use world;
# 1 Tampilkan daftar 10 kota terpadat di Indonesia. Urutkan data dari kota dengan populasi terbanyak. Kolom yang diwajibkan tampil adalah id kota, nama kota, kode negara, distrik, populasi
SELECT 
    * #untuk men-select seluruh kolom di tabel select
FROM
    city #dari tabel city
WHERE
    CountryCode = 'IDN' #mempermudah pencarian untuk kota di INDONESIA
ORDER BY population desc #untuk mengurutkan populasi dari terbesar ke terkecil
LIMIT 10; #untuk membatasi hasil pencarian menjadi hanya 10

# 2 Tampilkan daftar 10 kota terpadat di dunia beserta asal negaranya. Urutkan data dari kota dengan populasi terbanyak. Kolom yang diwajibkan id kota, nama kota, district, nama negara dan populasi.
SELECT 
    city.id, #memilih ID
    city.name AS nama_kota, #memilih nama kota, penggunaan alias untuk memberikan nama atau label dari kolom
    district AS district, #memilih district, penggunaan alias untuk memberikan nama atau label dari kolom
    country.name AS negara, #memilih nama negara, penggunaan alias untuk memberikan nama atau label dari kolom
    city.population #memilih populasi
FROM
    city,
    country #dari city dan country
WHERE
    city.countrycode = country.code #kolom yang ditemukan sama berdasarkan dua tabel tersebut
ORDER BY population DESC #mengurutkan populasi dari terbesar ke terkecil
LIMIT 10;

# 3 Tampilkan daftar 10 negara yang tercatat merdeka paling awal . Daftar negara yang tidak diketahui tahun kemerdekaanya, tidak perlu diikutsertakan. kolom yang diwajibkan ada minimal adalah kode negara, nama negara, benua, regional, dan tahun merdeka.
SELECT 
    code, 
    name, 
    continent, 
    region, 
    INDEPYEAR AS tahun_merdeka #men-select kebutuhan kolom dan menggunakan alias pada indepyear sesuai dengan kebutuhan soal
FROM
    country #dari country
WHERE
    IndepYear < 1279 #untuk mempersempit pencarian
ORDER BY IndepYear ASC; #untuk mengurutkan IndepYear dari terkecil ke terbesar

# 4 Tampilkan daftar benua yang memiliki lebih dari 10 negara di dalamnya. Kolom yang ditampilkan minimal:nama benua,jumlah negara di dalam benua, total populasi dan rata-rata angka harapan hidup kemudian diurutkan dari benua yang memiliki populasi terbanyak.
SELECT
	continent as Benua, #menggunakan alias Benua untuk menamai sesuai kebutuhan soal
    count(continent) as Jumlah_Negara, #menggunakan alias Jumlah_Negara untuk menamai sesuai kebutuhan soal
    sum(population) as Populasi, #menggunakan alias Populasi untuk menamai sesuai kebutuhan soal
    avg(LifeExpectancy) as Rata_AngkaHrpnHdp #menggunakan alias untuk menamai sesuai kebutuhan soal
FROM
	country #dari country
WHERE
	population > 0 #penggunaan > 0 dilakukan karena ditemukan benua antartica memiliki rata-rata angkaharapanhidup bernilai NULL atau tidak ada 
GROUP BY CONTINENT #di group berdasarkan benua
ORDER BY SUM(POPULATION)desc; # menggunakan sum untuk menjumlah populasi suatu benua dan mengurutkannya dengan DESC (dari besar ke kecil)

# 5 Tampilkan daftar negara-negara Asia yang memiliki angka harapan hidup lebih dari rata-rata angka harapan hidup negara-negara eropa. Kolom yang diwajibkan  nama negara, nama benua, angka harapan hidup dan GNP. urutkan data dari negraa asia dengan angka harapan hidup tertinggi
SELECT 
    name AS Nama, #memilih name, menggunakan alias untuk menamai sesuai kemauan soal
    continent AS Benua, #memilih continent, menggunakan alias untuk menamai sesuai kebutuhan soal
    LifeExpectancy AS AngkaHarapanHidup, #memilih lifeexpectancy, menggunakan alias untuk menamai sesuai kebutuhan soal
    GNP #memilih GNP
FROM 
	country
WHERE
	LifeExpectancy > 76 AND #berdasarkan soal disebutkan bahwa GNP dimulai dari 76.1 yg membuat saya mengetahui bahwa rata-rata dari angka harapan hidup negara eropa dibawah angka tersebut dan mempermudah pencarian
    continent = 'Asia' #untuk mempersempit pencarian dan memilih negara di benua Asia
ORDER BY LifeExpectancy desc; #untuk mengorder dari besar ke kecil

#6 Tampilkan daftar 10 negara yang bahasa resminya adalah bahasa inggris, dan memiliki persentase bahasa inggris tertinggi di dunia.
SELECT 
    country.code AS countrycode,
    country.name AS name,
    countrylanguage.language AS language,
    countrylanguage.IsOfficial,
    countrylanguage.percentage
FROM
	country,
    countrylanguage
WHERE
	country.code = countrylanguage.countrycode AND #kolom yang ditemukan sama dari kedua tabel
    countrylanguage.language = 'English' AND #language diatur 'english' untuk mempermudah pencarian negara dengan penggunaan bahasa inggris
    countrylanguage.IsOfficial = 'T' #isOfficial 'T' untuk mempersempit pencarian negara tsb
ORDER BY percentage desc #untuk mengurutkan dari percentage terbesar ke terkecil
Limit 10; #untuk membatasi negara yang akan dimunculkan

#7 Tampilkan daftar negara ASEAN beserta populasi negaranya, GNP, ibukota & populasi ibukota. urutkan berdasarkan abjad nama negara.
SELECT 
    country.name AS Negara_ASEAN,
    country.population AS Populasi_Negara,
    country.GNP AS GNP,
    city.name AS Ibukota,
    city.population AS Populasi_Ibukota
FROM
    country,
    city
WHERE
    country.code = city.countrycode
        AND city.name IN ('Bandar Seri Begawan' , 'Phnom Penh',
        'Dili',
        'Jakarta',
        'Vientiane',
        'Kuala Lumpur',
        'Rangoon (Yangon)',
        'Manila',
        'Singapore',
        'Bangkok',
        'Hanoi')
ORDER BY country.name;

# 8 Tampilkan daftar negara G20 beserta populasi negaranya, GNP,ibukota,populasi ibukota. Urutkan berdasarkan abjad nama negara.

SELECT 
    country.Name as Negara_G20,
    country.Population as Populasi_Negara,
    country.GNP,
    city.Name as Ibukota,
    city.Population AS Populasi_Ibukota
FROM
    country,
    city
WHERE
    country.Capital = city.ID
        AND country.Name IN ('Argentina' , 'Australia',
        'Brazil',
        'Canada',
        'China',
        'Germany',
        'France',
        'India',
        'Indonesia',
        'Japan',
        'Mexico',
        'Russian Federation',
        'Saudi Arabia',
        'South Africa',
        'South Korea',
        'Turkey',
        'United Kingdom',
        'United States')
ORDER BY country.name;