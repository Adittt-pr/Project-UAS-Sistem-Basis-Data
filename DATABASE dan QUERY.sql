-- BAGIAN QUERY
-- GUNAKAN DATABASE

USE UAS;
--- DML (SELECT DASAR-JOIN)
-- 1. SELECT DASAR

SELECT * FROM barang;
SELECT * FROM vendor;
SELECT * FROM transaksi;
select * from kasir;
select * from sales;
select * from pelanggan;
select * from jenisBarang;

-- 2. ORDER BY & BETWEEN

SELECT idBarang, unitBarang, stock
FROM barang
ORDER BY harga DESC;

SELECT idBarang, unitBarang, stock
FROM barang
WHERE stock BETWEEN 2 AND 10;

-- 3. DISTINCT

SELECT DISTINCT namaVendor
FROM vendor;

-- 4. OPERATOR LOGIKA

SELECT unitBarang, harga
FROM barang
WHERE harga >= 10000;

-- 5. LIKE QUERY

SELECT * FROM barang
WHERE unitBarang LIKE '%Tupperware%';

-- 6. AGREGASI

SELECT COUNT(*) AS jumlah_barang
FROM barang;

SELECT SUM(stock) AS total_stok
FROM barang;

SELECT AVG(harga) AS rata_rata_harga
FROM barang;

-- 7. GROUP BY

SELECT j.namaJenisBarang, COUNT(b.idBarang) AS jumlah_barang
FROM barang b
JOIN jenisBarang j ON b.idjenisBarang = j.idjenisBarang
GROUP BY j.namaJenisBarang;

-- 8. HAVING

SELECT j.namaJenisBarang, SUM(b.stock) AS total_stok
FROM barang b
JOIN jenisBarang j ON b.idjenisBarang = j.idjenisBarang
GROUP BY j.namaJenisBarang
HAVING SUM(b.stock) > 10;

-- 9. SUBQUERY

SELECT unitBarang, harga
FROM barang
WHERE harga > (
    SELECT AVG(harga) FROM barang
);

-- 10. JOIN

-- INNER JOIN
SELECT T.noTransaksi, T.tanggal, K.namaKasir, T.total
FROM transaksi T
JOIN kasir K ON T.idKasir = K.idKasir;

-- EQUI JOIN
SELECT T.noTransaksi, P.idPelanggan, S.nama AS namaSales, T.total
FROM transaksi T
JOIN pelanggan P ON T.idPelanggan = P.idPelanggan
JOIN sales S ON T.idSales = S.idSales;

-- LEFT JOIN
SELECT B.unitBarang, V.namaVendor
FROM barang B
LEFT JOIN vendor V ON B.idBarang = V.idBarang;

-- RIGHT JOIN
SELECT V.namaVendor, V.idjenisBarang, B.unitBarang
FROM barang B RIGHT JOIN vendor V
ON B.idBarang = V.idBarang;

-- FULL JOIN (MySQL pakai UNION)
SELECT B.idBarang,B.unitBarang,V.idVendor,V.namaVendor
FROM barang B
LEFT JOIN vendor V ON B.idBarang = V.idBarang

UNION

SELECT B.idBarang,B.unitBarang,V.idVendor,V.namaVendor
FROM barang B
RIGHT JOIN vendor V ON B.idBarang = V.idBarang;

-- 11. view

CREATE VIEW view_laporan_barang_vendor AS
SELECT B.unitBarang, B.harga, V.namaVendor
FROM barang B
JOIN vendor V ON B.idBarang = V.idBarang;

SELECT * FROM view_laporan_barang_vendor;

-- 11.SCENARIO TRANSAKSI

SELECT T.noTransaksi, T.tanggal,
       K.namaKasir, S.nama AS namaSales,
       P.idPelanggan, T.total
FROM transaksi T
JOIN kasir K ON T.idKasir = K.idKasir
JOIN sales S ON T.idSales = S.idSales
JOIN pelanggan P ON T.idPelanggan = P.idPelanggan;

--- TCL

START TRANSACTION;

UPDATE barang
SET stock = stock - 1
WHERE idBarang = 134;

ROLLBACK;
