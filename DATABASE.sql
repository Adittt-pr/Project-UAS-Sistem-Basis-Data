-- DDL 
-- DATABASE

CREATE DATABASE IF NOT EXISTS UAS;
USE UAS;


-- MASTER TABLE


CREATE TABLE jenisBarang (
    idjenisBarang INT PRIMARY KEY,
    namaJenisBarang VARCHAR(50)
);

CREATE TABLE barang (
    idBarang INT PRIMARY KEY,
    unitBarang VARCHAR(100),
    stock INT,
    harga INT,
    idjenisBarang INT,
    FOREIGN KEY (idjenisBarang) REFERENCES jenisBarang(idjenisBarang)
);

CREATE TABLE kasir (
    idKasir INT PRIMARY KEY,
    namaKasir VARCHAR(50),
    noHp VARCHAR(20)
);

CREATE TABLE sales (
    idSales INT PRIMARY KEY,
    nama VARCHAR(50),
    jabatan VARCHAR(20)
);

CREATE TABLE pelanggan (
    idPelanggan VARCHAR(10) PRIMARY KEY,
    jenisPelanggan VARCHAR(20),
    noHp VARCHAR(20)
);

CREATE TABLE vendor (
    id INT AUTO_INCREMENT PRIMARY KEY,
    idVendor INT,
    namaVendor VARCHAR(50),
    alamatVendor VARCHAR(50),
    idBarang INT,
    idjenisBarang INT,
    FOREIGN KEY (idBarang) REFERENCES barang(idBarang),
    FOREIGN KEY (idjenisBarang) REFERENCES jenisBarang(idjenisBarang)
);


-- TRANSAKSI


CREATE TABLE transaksi (
    noTransaksi VARCHAR(50) PRIMARY KEY,
    tanggal DATE,
    total INT,
    kas INT,
    kembalian INT,
    kuantitas INT,
    noNota INT,
    subtotal INT,
    idKasir INT,
    idSales INT,
    idPelanggan VARCHAR(10),
    FOREIGN KEY (idKasir) REFERENCES kasir(idKasir),
    FOREIGN KEY (idSales) REFERENCES sales(idSales),
    FOREIGN KEY (idPelanggan) REFERENCES pelanggan(idPelanggan)
);

CREATE TABLE detailBarang (
    subtotal INT,
    idBarang INT,
    noTransaksi VARCHAR(50),
    FOREIGN KEY (idBarang) REFERENCES barang(idBarang),
    FOREIGN KEY (noTransaksi) REFERENCES transaksi(noTransaksi)
);


--- DML(INSERT)
-- INSERT DATA MASTER


INSERT INTO jenisBarang VALUES
(1,'Alat Makan'),
(2,'Tempat Minum'),
(3,'Toples');

INSERT INTO barang VALUES
(134,'Tupperware kecil 300ml',50,4800,2),
(146,'Tupperware sedang 600ml',20,7500,2),
(147,'Tupperware besar 1L',19,12000,2),
(148,'Gelas plastik bening',12,15000,2),
(149,'Piring plastik',6,20000,1),
(150,'Sendok plastik',12,10000,1),
(151,'Botol minum plastik 500ml',1,10000,2),
(152,'Toples plastik kecil',5,9000,3),
(153,'Toples plastik besar',8,15000,3),
(154,'Wadah makanan sekat',11,13000,1);

INSERT INTO kasir VALUES
(321879,'MAJU KASTALAN','081225064867');

INSERT INTO sales VALUES
(8629026,'DHEA','Karyawan');

INSERT INTO pelanggan VALUES
('AFD34','Pelanggan Umum','087786549984');

INSERT INTO vendor (idVendor,namaVendor,alamatVendor,idBarang,idjenisBarang) VALUES
(123000,'ADAFIVENDORS','Jakarta',146,2),
(123000,'ADAFIVENDORS','Jakarta',147,2),
(223000,'CV. JAYA PLASTIK','Bandung',148,2),
(223000,'CV. JAYA PLASTIK','Bandung',149,1),
(223000,'CV. JAYA PLASTIK','Bandung',150,1),
(223000,'CV. JAYA PLASTIK','Bandung',151,2),
(323000,'TOKO ANEKA WADAH','Surabaya',152,3),
(323000,'TOKO ANEKA WADAH','Surabaya',153,3),
(323000,'TOKO ANEKA WADAH','Surabaya',154,1);

INSERT INTO transaksi VALUES
('JP/001/001/20251108/150535','2025-11-08',4800,20000,15000,1,154,4800,321879,8629026,'AFD34');