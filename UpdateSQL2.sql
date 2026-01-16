create database if not exists UAS;

use UAS; 

create table barang(
idBarang int primary key,
unitBarang char (100),
satuan char (10),
harga int
);

ALTER TABLE barang 
ADD COLUMN idjenisBarang INT;

ALTER TABLE barang
ADD FOREIGN KEY (idjenisBarang) REFERENCES jenisBarang(idjenisBarang);

UPDATE barang 
SET idjenisBarang = 1 
WHERE idBarang IN (149, 150, 154);

UPDATE barang 
SET idjenisBarang = 2 
WHERE idBarang IN (134, 146, 147,148,151);

UPDATE barang 
SET idjenisBarang = 3 
WHERE idBarang IN (152,153);


create table kasir(
idKasir int primary key,
namaKasir char (20),
noHp char (20) 
);

create table sales(
idSales int primary key,
nama char (50),
jabatan char (20)
);

create table pelanggan(
idPelanggan char (10) primary key,
jenisPelanggan char (20) ,
noHP char (20) 
);

create table vendor(
idVendor int primary key,
namaVendor char (20),
alamatVendor char (20),
jenisBarang char (20),
idBarang int,
foreign key (idBarang) references barang(idBarang)
);

ALTER TABLE vendor 
DROP COLUMN idjenisBarang;

ALTER TABLE vendor 
ADD COLUMN idjenisBarang INT;

ALTER TABLE vendor
ADD FOREIGN KEY (idjenisBarang) REFERENCES jenisBarang(idjenisBarang);

UPDATE vendor 
SET idJenisBarang = 2
WHERE idBarang = '134';

ALTER TABLE vendor DROP PRIMARY KEY;
ALTER TABLE vendor ADD id INT AUTO_INCREMENT PRIMARY KEY FIRST;

INSERT INTO vendor (idVendor, namaVendor, alamatVendor, idBarang, idjenisBarang) VALUES 
(101, 'ADAFI VENDORS', 'Jakarta', 146, 2),
(101, 'ADAFI VENDORS', 'Jakarta', 147, 2),
(102, 'CV. JAYA PLASTIK', 'Bandung', 148, 2),
(102, 'CV. JAYA PLASTIK', 'Bandung', 149, 1),
(102, 'CV. JAYA PLASTIK', 'Bandung', 150, 1),
(102, 'CV. JAYA PLASTIK', 'Bandung', 151, 2),
(103, 'TOKO ANEKA WADAH', 'Surabaya', 152, 3),
(103, 'TOKO ANEKA WADAH', 'Surabaya', 153, 3),
(103, 'TOKO ANEKA WADAH', 'Surabaya', 154, 1);

INSERT INTO vendor (idVendor, namaVendor, alamatVendor, idBarang, idjenisBarang) VALUES 
(101, 'ADAFI VENDORS', 'Jakarta', 146, 2), 
(101, 'ADAFI VENDORS', 'Jakarta', 147, 2), 
(102, 'CV. JAYA PLASTIK', 'Bandung', 148, 2),
(102, 'CV. JAYA PLASTIK', 'Bandung', 149, 1),
(102, 'CV. JAYA PLASTIK', 'Bandung', 150, 1),
(102, 'CV. JAYA PLASTIK', 'Bandung', 151, 2),
(103, 'TOKO ANEKA WADAH', 'Surabaya', 152, 3),
(103, 'TOKO ANEKA WADAH', 'Surabaya', 153, 3),
(103, 'TOKO ANEKA WADAH', 'Surabaya', 154, 1);

SET SQL_SAFE_UPDATES = 0;

UPDATE vendor
SET idVendor = 123000, 
    namaVendor = 'ADAFIVENDORS'
WHERE idVendor = 101;

UPDATE vendor
SET idVendor = 223000
WHERE idVendor = 102;

UPDATE vendor
SET idVendor = 323000
WHERE idVendor = 103;

SET SQL_SAFE_UPDATES = 1;


create table transaksi (
noTransaksi char (50) primary key,
tanggal char (10),
total int,
kas int,
kembalian int,
kuantitas char (10),
noNota int,
subtotal int,
idKasir int,
idSales int,
idPelanggan char (10),
foreign key(idKasir) references kasir(idKasir),
foreign key(idSales)references sales(idSales),
foreign key(idPelanggan) references pelanggan(idPelanggan) 
);

CREATE TABLE jenisBarang (
    idjenisBarang INT PRIMARY KEY,
    namaJenisBarang VARCHAR(50)
);

DROP TABLE IF EXISTS jenisBarang;

create table detailBarang(
subtotal int,
idBarang int,
noTransaksi char (50),
foreign key (idBarang) references barang(idBarang),
foreign key (noTransaksi) references transaksi(noTransaksi)
);

INSERT INTO jenisBarang (idjenisBarang, namaJenisBarang) VALUES
(1, 'Alat Makan'),
(2, 'Tempat Minum'),
(3, 'Toples');

insert into barang (idBarang,unitBarang,satuan,harga)values
(134,'Taperware kecil 300ml','1 pcs',4800);

insert into kasir (idKasir,namaKasir,noHp)values
(321879,'MAJU KASTALAN','081225064867');

insert into sales (idSales,nama,jabatan)values
(8629026,'DHEA','Karyawan');

insert into pelanggan (idPelanggan,jenisPelanggan,noHp)values
('AFD34','Pelanggan Umum','087786549984');

insert into vendor (idVendor,namaVendor,alamatVendor,jenisBarang,idBarang)values
(123000,'ADAFIVENDORS','JAKARTA','Rak Sepatu',134);

insert into transaksi (noTransaksi,tanggal,total,kas,kembalian,kuantitas,noNota,subtotal,idKasir,idSales,idPelanggan)values
('JP/001/001/20251108/150535','08/11/2025',4800,20000,15000,'Tinggi',154,4800,321879,8629026,'AFD34');

select * from transaksi;
select * from barang;
select * from kasir;
select * from sales;
select * from pelanggan;
select * from vendor;
select * from jenisBarang;

select idPelanggan,jenisPelanggan
from pelanggan;

select idBarang,unitBarang,stock
from barang
order by harga desc;

select unitBarang,stock
from barang
order by stock,unitBarang;

select distinct unitBarang
from barang;

ALTER TABLE barang
CHANGE satuan stock INT;

UPDATE barang
SET stock = 50
WHERE idBarang = 134;

INSERT INTO barang (idBarang, unitBarang, stock, harga) VALUES
(146, 'Tupperware sedang 600ml', '20 pcs', 7500),
(147, 'Tupperware besar 1L', '19 pcs', 12000),
(148, 'Gelas plastik bening', '12 pcs', 15000),
(149, 'Piring plastik', '6 pcs', 20000),
(150, 'Sendok plastik', '12 pcs', 10000),
(151, 'Botol minum plastik 500ml', '1 pcs', 10000),
(152, 'Toples plastik kecil', '5 pcs', 9000),
(153, 'Toples plastik besar', '8 pcs', 15000),
(154, 'Wadah makanan sekat', '11 pcs', 13000);

SELECT unitBarang,harga
FROM barang
WHERE harga >= 10000;

select * from barang
where unitBarang like '%Tupperware%';
select * from products
where productName like '%Tupperware%';

select * from barang
where harga>=10000 and harga<=20000
order by harga;

SELECT idBarang, unitBarang, stock
FROM barang
WHERE stock BETWEEN 2 AND 10;


-- join
-- inner join
SELECT T.noTransaksi, T.tanggal, K.namaKasir, T.total
FROM transaksi T INNER JOIN kasir K
ON T.idKasir = K.idKasir;

-- equi join
SELECT T.noTransaksi, T.tanggal, S.nama, S.jabatan
FROM transaksi T, sales S
WHERE T.idSales = S.idSales;

-- left join
SELECT B.unitBarang, B.harga, V.namaVendor, V.alamatVendor
FROM barang B LEFT JOIN vendor V
ON B.idBarang = V.idBarang;

-- right join
SELECT V.namaVendor, V.idjenisBarang, B.unitBarang
FROM barang B RIGHT JOIN vendor V
ON B.idBarang = V.idBarang;

-- full join
SELECT B.idBarang, B.unitBarang, V.idVendor, V.namaVendor
FROM barang B full join vendor V
On B.idBarang = V.idBarang
WHERE unitBarang like '%a%';



SELECT B.idBarang, B.unitBarang, V.idVendor, V.namaVendor
FROM barang B 
LEFT JOIN vendor V ON B.idBarang = V.idBarang
WHERE B.unitBarang LIKE '%a%'

UNION

SELECT B.idBarang, B.unitBarang, V.idVendor, V.namaVendor
FROM barang B 
RIGHT JOIN vendor V ON B.idBarang = V.idBarang
WHERE B.unitBarang LIKE '%a%';








