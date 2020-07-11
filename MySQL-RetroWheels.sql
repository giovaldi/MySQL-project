use retrowheels;

# 1 Rumuskan single query untuk menampilkan jumlah total customer yang anda layani, beserta jumlah total kota & negara asal customer anda
SELECT
	count(distinct customerName) as Customers,
    count(distinct city) as Cities,
    count(distinct country) as Countries
FROM
	customers;

# 2 Rumuskan single query untuk menampilkan resources yang anda miliki, mulai dari jumlah karyawan, jumlah kantor & lokasi negaranya, jumlah barang yang dijual, total stok barang & jumlah vendor yang menjadi partner anda.
SELECT 
    COUNT(DISTINCT employees.employeeNumber) AS Employee,
    COUNT(DISTINCT employees.officeCode) AS Offices,
    COUNT(DISTINCT offices.country) AS Country,
    COUNT(DISTINCT products.productCode) AS Products,
    SUM(DISTINCT products.quantityInStock) AS StockProducts,
    COUNT(DISTINCT productVendor) AS Vendors
FROM
    employees,
    offices,
    products;

# 3 Dari soal sebelumnya tercatat anda memiliki 110 model die cast dengan total stok 555131 item. Jika dikategorikan, produk yang anda jual terbagi menjadi 7 productline die cast, yakni model mobil klasik,vintage,sepedamotor,pesawat terbang, kapal laut,kereta api, truk & bus. rumuskan query yang dapat menampilkan harga produk terendah dan tertinggi dari masing-masing kategori
SELECT
	productlines.productline as productLine,
    min(products.buyPrice) as minPrice,
    max(products.buyPrice) as maxPrice
FROM
	productLines,
    products
WHERE
	productlines.productLine = products.productLine
GROUP BY productline;

#4 Rumuskan single query yang dapat menampilkan daftar 10 customer paling royal(nominal transaksi tinggi). Data yang ditampilkan nama customer,kota,negara,total uang yang dihabiskan.
SELECT 
    customerName, city, country, SUM(amount) AS total
FROM
    customers,
    payments
WHERE
    customers.customerNumber = payments.customerNumber
GROUP BY customers.customerNumber
ORDER BY total DESC
LIMIT 10;

#5 Pada tahun 2003-06-05, terdapat pembayaran masuk sebesar US $ 14571,44. Tampilkan data seputar transaksi tersebut, mencakup nama customer yang melakukan pembayaran, nama produk yang dibeli, jumlah tiap produk yang dibeli dan harga satuannya. Pastikan total harga yang dibeli sesuai dengan data pembayaran masuk.
SELECT 
    customers.customerName,
    products.productName,
	orderdetails.quantityOrdered,
    orderdetails.priceEach
FROM
	customers,
    products,
    orderdetails,
    orders,
    payments
WHERE
	customers.customerNumber = payments.customerNumber AND
	customers.customerNumber = orders.customerNumber AND
    orders.orderNumber = orderdetails.orderNumber AND
    products.productCode = orderdetails.productCode AND
	payments.paymentDate = '2003-06-05' AND
    products.productName IN ('1965 Aston Martin DB5','1999 Indy 500 Monte Carlo SS','1948 Porsche Type 356 Roadster','1966 Shelby Cobra 427 S/C')
ORDER BY priceEach desc;

    
    
