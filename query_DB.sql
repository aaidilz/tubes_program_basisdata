--CREATE DATABASE sistem_aka_universitas;--
--USE sistem_aka_universitas;--
-- CREATE TABLES

-- Tabel mahasiswa
CREATE TABLE mahasiswa (
    id BIGINT NOT NULL IDENTITY(1,1) PRIMARY KEY,
    nim VARCHAR(20) NOT NULL UNIQUE,
    nama VARCHAR(100) NOT NULL,
    jurusan VARCHAR(100) NOT NULL,
    angkatan INT NOT NULL
);

-- Tabel profil_mahasiswa
CREATE TABLE profil_mahasiswa (
    id BIGINT NOT NULL IDENTITY(1,1) PRIMARY KEY,
    mahasiswa_id BIGINT NOT NULL,
    alamat VARCHAR(255) NOT NULL,
    no_tlp VARCHAR(15) NOT NULL,
    tanggal_lahir DATE NOT NULL,
    email VARCHAR(100) NOT NULL,
    status VARCHAR(20) NOT NULL,
	FOREIGN KEY (mahasiswa_id) REFERENCES mahasiswa(id)
    ON DELETE CASCADE 
    ON UPDATE CASCADE
);

-- Tabel transkrip
CREATE TABLE transkrip (
    id BIGINT NOT NULL IDENTITY(1,1) PRIMARY KEY,
    mahasiswa_id BIGINT NOT NULL,
    ipk DECIMAL(4, 2) NOT NULL,
    tanggal_cetak DATETIME NOT NULL,
    FOREIGN KEY (mahasiswa_id) REFERENCES mahasiswa(id)
	ON DELETE CASCADE 
    ON UPDATE CASCADE
);

-- Tabel krs
CREATE TABLE krs (
    id BIGINT NOT NULL IDENTITY(1,1) PRIMARY KEY,
    mahasiswa_id BIGINT NOT NULL,
    semester INT NOT NULL,
    tahun_ajaran DATETIME NOT NULL,
    status_krs VARCHAR(20) NOT NULL,
    tanggal_pengajuan DATE NOT NULL,
    FOREIGN KEY (mahasiswa_id) REFERENCES mahasiswa(id)
	ON DELETE CASCADE 
    ON UPDATE CASCADE
);

-- Tabel dosen
CREATE TABLE dosen (
    id BIGINT NOT NULL IDENTITY(1,1) PRIMARY KEY,
    nip VARCHAR(20) NOT NULL UNIQUE,
    nama VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL,
    status VARCHAR(20) NOT NULL
);

-- Tabel kelas
CREATE TABLE kelas (
    id BIGINT NOT NULL IDENTITY(1,1) PRIMARY KEY,
    dosen_id BIGINT NOT NULL,
    jadwal_id BIGINT NOT NULL,
    kode_kelas VARCHAR(20) NOT NULL,
    FOREIGN KEY (dosen_id) REFERENCES dosen(id)
	ON DELETE CASCADE 
    ON UPDATE CASCADE
);

-- Tabel mata_kuliah
CREATE TABLE mata_kuliah (
    id BIGINT NOT NULL IDENTITY(1,1) PRIMARY KEY,
    kelas_id BIGINT NOT NULL,
    kode_mata_kuliah VARCHAR(20) NOT NULL,
    nama_mata_kuliah VARCHAR(100) NOT NULL,
    sks INT NOT NULL,
    semester INT NOT NULL,
    FOREIGN KEY (kelas_id) REFERENCES kelas(id)
	ON DELETE CASCADE 
    ON UPDATE CASCADE
);

-- Tabel krs_has_matkul
CREATE TABLE krs_has_matkul (
    id BIGINT NOT NULL IDENTITY(1,1) PRIMARY KEY,
    krs_id BIGINT NOT NULL,
    mata_kuliah_id BIGINT NOT NULL,
    FOREIGN KEY (krs_id) REFERENCES krs(id)
	ON DELETE CASCADE 
    ON UPDATE CASCADE,
    FOREIGN KEY (mata_kuliah_id) REFERENCES mata_kuliah(id)
	ON DELETE CASCADE 
    ON UPDATE CASCADE
);

-- Tabel matkul_has_mahasiswa
CREATE TABLE matkul_has_mahasiswa (
    id BIGINT NOT NULL IDENTITY(1,1) PRIMARY KEY,
    mahasiswa_id BIGINT NOT NULL,
    mata_kuliah_id BIGINT NOT NULL,
    pertemuan INT NOT NULL,
    kehadiran VARCHAR(20) NOT NULL,
    FOREIGN KEY (mahasiswa_id) REFERENCES mahasiswa(id)
	ON DELETE CASCADE 
    ON UPDATE CASCADE,
    FOREIGN KEY (mata_kuliah_id) REFERENCES mata_kuliah(id)
	ON DELETE CASCADE 
    ON UPDATE CASCADE
);

CREATE TABLE jadwal (
	id BIGINT NOT NULL IDENTITY(1,1) PRIMARY KEY,
	hari VARCHAR(20) NOT NULL,
	waktu_mulai DATETIME NOT NULL,
	waktu_selesai DATETIME NOT NULL,
	status VARCHAR(20) NOT NULL
);

-- INSERT DATA

-- INSERT DATA INTO mahasiswa
INSERT INTO mahasiswa (nim, nama, jurusan, angkatan)
VALUES ('213040111', 'Ahmad Dzaki', 'Teknik Informatika', 2021),
	   ('213040110', 'Aidil Fikri', 'Teknik Informatika', 2021),
	   ('213040109', 'Fabregas Samudra', 'Teknik Informatika', 2021),
	   ('213040108', 'Arinal Haq', 'Teknik Informatika', 2021),
	   ('223040107', 'Sigit Maulana', 'Teknik Informatika', 2022),
	   ('223040106', 'Maelani', 'Teknik Informatika', 2022),
	   ('233040105', 'Hikmal', 'Teknik Informatika', 2023),
	   ('233040104', 'Iqbal Ramadhan', 'Teknik Informatika', 2023),
	   ('233040103', 'Ica Marica', 'Teknik Informatika', 2023),
	   ('233040102', 'Nurfatimah', 'Teknik Informatika', 2023),
	   --
	   ('213020300', 'Raden Jawa', 'Teknik Industri', 2021),
	   ('213020100', 'Sulthan', 'Teknik Industri', 2021),
	   ('213020099', 'Via Vallen', 'Teknik Industri', 2021),
	   ('213020098', 'Syarif Hidayat', 'Teknik Industri', 2021),
	   ('223020097', 'Hasan Toys', 'Teknik Industri', 2022),
	   ('223020096', 'Denny Caknan', 'Teknik Industri', 2022),
	   ('233020095', 'Karina', 'Teknik Industri', 2023),
	   ('233020094', 'Selena Gomes', 'Teknik Industri', 2023),
	   ('233020093', 'Harry Styles', 'Teknik Industri', 2023),
	   ('233020092', 'Asep Rica', 'Teknik Industri', 2023),
	   --
	   ('213030091', 'Muzzammil', 'Teknik Mesin', 2021),
	   ('213030090', 'Epictetus', 'Teknik Mesin', 2021),
	   ('213030089', 'Mahmud Arya', 'Teknik Mesin', 2021),
	   ('213030087', 'Yoshita', 'Teknik Mesin', 2021),
	   ('223030086', 'Ali', 'Teknik Mesin', 2022),
	   ('223030085', 'Justin Kochleck', 'Teknik Mesin', 2022),
	   ('233030084', 'Ridjaal Ahmed', 'Teknik Mesin', 2023),
	   ('233030083', 'Christian Fargud', 'Teknik Mesin', 2023),
	   ('233030082', 'Heino', 'Teknik Mesin', 2023),
       ('233030081', 'Siti Aminah', 'Teknik Mesin', 2023);

-- INSERT DATA INTO profil_mahasiswa
INSERT INTO profil_mahasiswa (mahasiswa_id, alamat, no_tlp, tanggal_lahir, email, status)
VALUES (1, 'Jl. Panorama No. 87', '081214553321', '2003-05-17', 'ahmaddzakis@email.com', 'Aktif'),
	   (2, 'Jl. Melati No. 3', '081234567890', '2003-05-15', 'aidilfikri@email.com', 'Aktif'),
	   (3, 'Jl. Pirik No. 81', '081214558441', '2003-01-17', 'fabregasigas@email.com', 'Aktif'),
	   (4, 'Jl. Pasu No. 82', '081214558541', '2003-05-12', 'arinall@email.com', 'Aktif'),
	   (5, 'Jl. Panjut No. 84', '081214545521', '2004-12-17', 'sigit123@email.com', 'Aktif'),
	   (6, 'Jl. Panjunan No. 86', '081214558521', '2004-02-09', 'maelani123@email.com', 'Aktif'),
	   (7, 'Jl. Plered No. 84', '081214556521', '2005-10-10', 'malmalmal@email.com', 'Aktif'),
	   (8, 'Jl. Gunung Jati No. 80', '084514558521', '2005-01-01', 'iqbalgaming@email.com', 'Aktif'),
	   (9, 'Jl. Kapetakan No. 99', '081266558521', '2005-02-02', 'icaacha12@email.com', 'Aktif'),
	   (10, 'Jl. Cilancang No. 7', '081202558521', '2004-01-29', 'nurf01@email.com', 'Tidak Aktif'),
	   --
	   (11, 'Jl. Losarang No. 81', '081214553322', '2003-05-18', 'radenjavva1@email.com', 'Tidak Aktif'),
	   (12, 'Jl. Hegarmanah No. 93', '081234567320', '2003-09-13', 'sulthanfir@email.com', 'Aktif'),
	   (13, 'Jl. Gebang No. 11', '081214348441', '2003-12-30', 'viaavallenn@email.com', 'Aktif'),
	   (14, 'Jl. Kedawung No. 62', '081265558541', '2002-05-22', 'arinall@email.com', 'Aktif'),
	   (15, 'Jl. Bedulan No. 34', '081215645521', '2003-12-27', 'syariff88@email.com', 'Aktif'),
	   (16, 'Jl. Sumber No. 76', '081214788521', '2004-02-22', 'hasanaftershine@email.com', 'Aktif'),
	   (17, 'Jl. Palimanan No. 89', '081784556521', '2005-11-10', 'caknan@email.com', 'Aktif'),
	   (18, 'Jl. Gunung Jati No. 81', '084774558521', '2005-11-01', 'karina_qwerty@email.com', 'Aktif'),
	   (19, 'Jl. Tangkil No. 19', '081266592521', '2005-02-01', 'selena_gom@email.com', 'Aktif'),
	   (20, 'Jl. Adidharma No. 7', '081202498521', '2004-01-21', 'harry_oned@email.com', 'Tidak Aktif'),
	   --
	   (21, 'Jl. Cici No. 90', '081234562220', '2003-05-11', 'muzzammil@email.com', 'Tidak Aktif'),
	   (22, 'Jl. Pesisir No. 19', '081213448441', '2003-11-17', 'epic_tet@email.com', 'Aktif'),
	   (23, 'Jl. Kebon Baru No. 22', '081254558541', '2002-12-12', 'mahmuddddddd@email.com', 'Aktif'),
	   (24, 'Jl. Villaintan No. 33', '081218745521', '2002-12-01', 'yoshita@email.com', 'Aktif'),
	   (25, 'Jl. Kandang Haur No. 74', '081994788521', '2004-01-19', 'aliaftershine@email.com', 'Aktif'),
	   (26, 'Jl. Palimanan No. 29', '081784786521', '2003-08-14', 'kochleck111@email.com', 'Aktif'),
	   (27, 'Jl. Cicendo No. 21', '084774557821', '2005-01-12', 'ridjaal0909@email.com', 'Aktif'),
	   (28, 'Jl. Maria No. 29', '081266592587', '2005-02-23', 'christian669@email.com', 'Aktif'),
	   (29, 'Jl. Losari No. 51', '08121455342', '2005-01-27', 'heino_hok@email.com', 'Aktif'),
       (30, 'Jl. Mawar No. 5', '081298769003', '2003-01-21', 'siti.aminah@email.com', 'Tidak Aktif');

-- INSERT DATA INTO transkrip
INSERT INTO transkrip (mahasiswa_id, ipk, tanggal_cetak)
VALUES (1, 3.75, '2023-12-01'),
	   (2, 3.85, '2023-12-11'),
	   (3, 3.75, '2023-12-02'),
	   (4, 3.52, '2023-12-02'),
	   (5, 3.42, '2023-12-02'),
	   (6, 3.34, '2023-12-01'),
	   (7, 3.95, '2023-12-01'),
	   (8, 3.84, '2023-12-03'),
	   (9, 3.88, '2023-12-04'),
	   (10, 3.91, '2023-12-09'),
	   --
	   (11, 4.00, '2023-12-01'),
	   (12, 3.41, '2023-12-01'),
	   (13, 3.81, '2023-12-01'),
	   (14, 3.42, '2023-12-02'),
	   (15, 3.23, '2023-12-02'),
	   (16, 3.16, '2023-12-01'),
	   (17, 3.18, '2023-12-14'),
	   (18, 3.00, '2023-12-11'),
	   (19, 2.76, '2023-12-11'),
	   (20, 3.77, '2023-12-11'),
	   --7
	   (21, 3.70, '2023-12-07'),
	   (22, 3.92, '2023-12-02'),
	   (23, 3.51, '2023-12-01'),
	   (24, 3.90, '2023-12-01'),
	   (25, 3.11, '2023-12-01'),
	   (26, 3.22, '2023-12-12'),
	   (27, 3.33, '2023-12-04'),
	   (28, 3.44, '2023-12-02'),
	   (29, 3.55, '2023-12-02'),
       (30, 3.66, '2023-12-02');

-- INSERT DATA INTO krs
INSERT INTO krs (mahasiswa_id, semester, tahun_ajaran, status_krs, tanggal_pengajuan)
VALUES (1, 7, '2023-08-01', 'Disetujui', '2023-07-29'),
	   (2, 7, '2023-08-01', 'Disetujui', '2023-07-30'),
	   (3, 7, '2023-08-01', 'Disetujui', '2023-07-28'),
	   (4, 7, '2023-08-01', 'Disetujui', '2023-07-30'),
	   (5, 5, '2023-08-01', 'Disetujui', '2023-07-25'),
	   (6, 5, '2023-08-01', 'Disetujui', '2023-07-30'),
	   (7, 3, '2023-08-01', 'Disetujui', '2023-07-30'),
	   (8, 3, '2023-08-01', 'Disetujui', '2023-07-30'),
	   (9, 3, '2023-08-01', 'Tidak Disetujui', '2023-07-30'),
	   (10, 3, '2023-08-01', 'Tidak Disetujui', '2023-07-30'),
	   --
	   (11, 7, '2023-08-01', 'Tidak Disetujui', '2023-07-26'),
	   (12, 7, '2023-08-01', 'Disetujui', '2023-07-26'),
	   (13, 7, '2023-08-01', 'Disetujui', '2023-07-26'),
	   (14, 7, '2023-08-01', 'Disetujui', '2023-07-26'),
	   (15, 5, '2023-08-01', 'Disetujui', '2023-07-26'),
	   (16, 5, '2023-08-01', 'Disetujui', '2023-07-25'),
	   (17, 3, '2023-08-01', 'Disetujui', '2023-07-25'),
	   (18, 3, '2023-08-01', 'Disetujui', '2023-07-25'),
	   (19, 3, '2023-08-01', 'Disetujui', '2023-07-25'),
	   (20, 3, '2023-08-01', 'Tidak Disetujui', '2023-07-25'),
	   --
	   (21, 7, '2023-08-01', 'Tidak Disetujui', '2023-07-28'),
	   (22, 7, '2023-08-01', 'Disetujui', '2023-07-28'),
	   (23, 7, '2023-08-01', 'Disetujui', '2023-07-28'),
	   (24, 7, '2023-08-01', 'Disetujui', '2023-07-28'),
	   (25, 5, '2023-08-01', 'Disetujui', '2023-07-26'),
	   (26, 5, '2023-08-01', 'Disetujui', '2023-07-26'),
	   (27, 3, '2023-08-01', 'Disetujui', '2023-07-26'),
	   (28, 3, '2023-08-01', 'Disetujui', '2023-07-26'),
	   (29, 3, '2023-08-01', 'Disetujui', '2023-07-30'),
       (30, 3, '2023-08-01', 'Tidak Disetujui', '2023-07-30');

-- INSERT DATA INTO dosen
INSERT INTO dosen (nip, nama, email, status)
VALUES (123456, 'Dr. Andi Wijaya', 'andi.wijaya@email.com', 'Aktif'),
	   (123455, 'Zayn Malik S.Kom., M.Kom.', 'malik@email.com', 'Aktif'),
	   (123454, 'Sandhika S.Kom., M.T.', 'sandhika@email.com', 'Aktif'),
	   (123453, 'Ali Guntur S.Kom., M.Kom.', 'ali_gntr@email.com', 'Aktif'),
	   (123452, 'Nursinta S.Kom., M.Kom.', 'nursinta@email.com', 'Aktif'),
	   (123451, 'Fajri Kusuma S.Kom., M.T.', 'fajri@email.com', 'Aktif'),
	   (123450, 'Reggie Parto Ph.D', 'r.eggie@email.com', 'Aktif'),
	   (123449, 'Dr. Liam James', 'liamm@email.com', 'Aktif'),
	   (123448, 'Dr. Bill Grain', 'grain11@email.com', 'Aktif'),
	   (123447, 'Karina S.E., M.Ag.', 'qarina22@email.com', 'Aktif'),
	   --
	   (123446, 'Meta Xavier Ph.D', 'm.xavier1@email.com', 'Aktif'),
	   (123445, 'Agus Sulaiman Ph.D', 'agus.agus@email.com', 'Aktif'),
	   (123444, 'Sutami S.T., M.Sc.Eng.', 'suta_m_i@email.com', 'Aktif'),
	   (123443, 'Jason Paul S.T., M.Sc.Eng.', 'yeahitsjason@email.com', 'Aktif'),
	   (123442, 'Dr. Fabio Wibmer', 'wibmerfabio@email.com', 'Aktif'),
	   (123441, 'Liang Yu Ph.D', 'yuliang00@email.com', 'Aktif'),
	   (123440, 'Sutrisna Mulyadi S.T., M.T.', 'mulmulyad@email.com', 'Aktif'),
	   (123439, 'Ilham Basudara S.Kom., M.T.', 'basudailha@email.com', 'Aktif'),
	   (123438, 'Arshaka Malik S.T., M.Kom.', 'arshakmal@email.com', 'Aktif'),
	   (123437, 'Ntan Intan S.T., M.T.', 'ntan12121212@email.com', 'Aktif'),
	   --
	   (123436, 'Hafidz Nur Jaya S.T., M.T.',  'nurjayahafidz@email.com', 'Aktif'),
	   (123435, 'Satori S.M, M.M.', 'go.satori@email.com', 'Aktif'),
	   (123434, 'Usman Syarifudin S.Pd., M.M.', 'usman1933@email.com', 'Aktif'),
	   (123433, 'Sigit Qamariel Nayara Hafiz S.I.Kom., M.T.', 'sigit1945@email.com', 'Aktif'),
	   (123432, 'Hafish Rayhan S.T., M.T.', 'hafish0909@email.com', 'Aktif'),
	   (123431, 'Li Yu Fang S.T., M.T.', 'li9yu9@email.com', 'Aktif'),
	   (123430, 'Sandhika Gayah S.T., M.Kom.', 'wh1o1isthis@email.com', 'Aktif'),
	   (123429, 'Ade Sulaiman S.T., M.T.', 'adesui8@email.com', 'Aktif'),
	   (123428, 'Dr. Ayu Purba S.T., M.T.', 'ayupiurba@email.com', 'Aktif'),
       (123427, 'Dr. Ratna Dewi', 'ratna.dewi@email.com', 'Aktif');

-- INSERT DATA INTO kelas
INSERT INTO kelas (dosen_id, jadwal_id, kode_kelas)
VALUES (1, 1, 'TIF2010-01'),
	   (2, 2, 'TIF2111-02'),
	   (3, 3, 'TIF2211-03'),
	   (4, 4, 'TIF2311-04'),
	   (5, 5, 'TIF2411-05'),
	   (6, 6, 'TIF2511-06'),
	   (7, 7, 'TIF2612-07'),
	   (8, 8, 'TIF2712-08'),
	   (9, 9, 'TIF2814-09'),
	   (10, 10, 'TIF9021-10'),
	   --
	   (11, 11, 'TI2021-01'),
	   (12, 12, 'TI2121-02'),
	   (13, 13, 'TI2221-03'),
	   (14, 14, 'TI2321-04'),
	   (15, 15, 'TI2421-05'),
	   (16, 16, 'TI2521-06'),
	   (17, 17, 'TI2621-07'),
	   (18, 18, 'TI2721-08'),
	   (19, 19, 'TI2821-09'),
	   (20, 20, 'TI2921-10'),
	   --
	   (21, 21, 'TM2022-01'),
	   (22, 22, 'TM2122-02'),
	   (23, 23, 'TM2222-03'),
	   (24, 24, 'TM2322-04'),
	   (25, 25, 'TM2422-05'),
	   (26, 26, 'TM2522-16'),
	   (27, 27, 'TM2622-17'),
	   (28, 28, 'TM2722-08'),
	   (29, 29, 'TM2822-09'),
       (30, 30, 'TM2922-10');

-- INSERT DATA INTO mata_kuliah
INSERT INTO mata_kuliah (kelas_id, kode_mata_kuliah, nama_mata_kuliah, sks, semester)
VALUES (1, 'TIF300', 'Bahasa Inggris', 2, 7),
	   (2, 'TIF301', 'Kerja Praktek', 2, 7),
	   (3, 'TIF302', 'Technopreneurship', 2, 7),
	   (4, 'TIF303', 'Kualifikasi Penelitian', 2, 7),
	   (5, 'TIF304', 'Internet of Things', 3, 5),
	   (6, 'TIF305', 'Perancangan Sistem', 2, 5),
	   (7, 'TIF306', 'Praktikum Basis Data', 2, 3),
	   (8, 'TIF307', 'Kewarganegaraan', 2, 3),
	   (9, 'TIF308', 'Infastruktur Pendukung Aplikasi', 2, 3),
	   (10, 'TIF309', 'Praktikum Infrastruktur', 1, 3),
	   --
	   (11, 'TI400', 'Bahasa Indonesia', 2, 7),
	   (12, 'TI401', 'Perancangan Percobaan', 3, 7),
	   (13, 'TI402', 'Perencanaan Pengembangan Industri', 3, 7),
	   (14, 'TI403', 'Metode Penelitian dan Komunikasi Ilmiah', 2, 7),
	   (15, 'TI404', 'Manajemen SDM', 2, 5),
	   (16, 'TI405', 'Pengendalian Kualitas Statik', 3, 5),
	   (17, 'TI406', 'Teori Peluang', 3, 3),
	   (18, 'TI407', 'Proses Manufaktur', 2, 3),
	   (19, 'TI408', 'Elemen Mesin', 2, 3),
	   (20, 'TI409', 'Pemrograman Komputer', 2, 3),
	   --
	   (21, 'TM501', 'Mesin Konversi Energi II', 3, 7),
	   (22, 'TM502', 'Kuliah Kerja', 1, 7),
	   (23, 'TM503', 'Manajemen Perawatan', 2, 7),
	   (24, 'TM504', 'Metodologi Penelitian', 2, 7),
	   (25, 'TM505', 'Mekatronika', 2, 5),
	   (26, 'TM506', 'Kinematika', 3, 5),
	   (27, 'TM507', 'Praktikum Fisika', 1, 3),
	   (28, 'TM508', 'Mekanika Fluida', 3, 3),
	   (29, 'TM509', 'Metrologi Industri', 2, 3),
       (30, 'TM510', 'Praktikum Etika', 3, 3);

-- INSERT DATA INTO krs_has_matkul
INSERT INTO krs_has_matkul (krs_id, mata_kuliah_id)
VALUES (1,1),
	(2,2),
	(3,3),
	(4,4),
	(5,5),
	(6,6),
	(7,7),
	(8,8),
	(9,9),
	(10,10),
	(11,11),
	(12,12),
	(13,13),
	(14,14),
	(15,15),
	(16,16),
	(17,17),
	(18,18),
	(19,19),
	(20,20),
	(21,21),
	(22,22),
	(23,23),
	(24,24),
	(25,25),
	(26,26),
	(27,27),
	(28,28),
	(29,29),
	(30,30);

-- INSERT DATA INTO matkul_has_mahasiswa
INSERT INTO matkul_has_mahasiswa (mahasiswa_id, mata_kuliah_id, pertemuan, kehadiran)
VALUES 
    (1, 1, 10, 'Hadir'),
    (2, 2, 10, 'Hadir'),
    (3, 3, 10, 'Hadir'),
    (4, 4, 10, 'Hadir'),
    (5, 5, 10, 'Hadir'),
    (6, 6, 10, 'Hadir'),
    (7, 7, 10, 'Hadir'),
    (8, 8, 10, 'Tidak Hadir'),
    (9, 9, 10, 'Tidak Hadir'),
	--
    (10, 10, 10, 'Tidak Hadir'),
    (11, 11, 10, 'Hadir'),
    (12, 12, 10, 'Hadir'),
    (13, 13, 10, 'Hadir'),
    (14, 14, 10, 'Hadir'),
    (15, 15, 10, 'Hadir'),
    (16, 16, 10, 'Hadir'),
    (17, 17, 10, 'Hadir'),
    (18, 18, 10, 'Hadir'),
    (19, 19, 10, 'Hadir'),
    (20, 20, 10, 'Tidak Hadir'),
	--
    (21, 21, 10, 'Tidak Hadir'),
    (22, 22, 10, 'Hadir'),
    (23, 23, 10, 'Hadir'),
    (24, 24, 10, 'Hadir'),
    (25, 25, 10, 'Hadir'),
    (26, 26, 10, 'Hadir'),
    (27, 27, 10, 'Hadir'),
    (28, 28, 10, 'Hadir'),
    (29, 29, 10, 'Hadir'),
    (30, 30, 10, 'Tidak Hadir');

-- INSERT DATA INTO jadwal
INSERT INTO jadwal (hari, waktu_mulai, waktu_selesai, status)
VALUES
('Senin', '2025-01-08 08:00:00', '2025-01-08 10:00:00', 'Aktif'),
('Selasa', '2025-01-09 09:00:00', '2025-01-09 11:00:00', 'Aktif'),
('Rabu', '2025-01-10 13:00:00', '2025-01-10 15:00:00', 'Tidak Aktif'),
('Kamis', '2025-01-11 10:00:00', '2025-01-11 12:00:00', 'Aktif'),
('Jumat', '2025-01-12 14:00:00', '2025-01-12 16:00:00', 'Aktif'),
('Sabtu', '2025-01-13 11:00:00', '2025-01-13 13:00:00', 'Tidak Aktif'),
('Sabtu', '2025-01-14 15:00:00', '2025-01-14 17:00:00', 'Aktif'),
('Senin', '2025-01-15 09:00:00', '2025-01-15 11:00:00', 'Aktif'),
('Selasa', '2025-01-16 10:00:00', '2025-01-16 12:00:00', 'Tidak Aktif'),
('Rabu', '2025-01-17 08:30:00', '2025-01-17 10:30:00', 'Aktif'),
--
('Kamis', '2025-01-18 13:30:00', '2025-01-18 15:30:00', 'Aktif'),
('Jumat', '2025-01-19 14:30:00', '2025-01-19 16:30:00', 'Tidak Aktif'),
('Sabtu', '2025-01-20 10:00:00', '2025-01-20 12:00:00', 'Aktif'),
('Sabtu', '2025-01-21 11:00:00', '2025-01-21 13:00:00', 'Aktif'),
('Senin', '2025-01-22 12:00:00', '2025-01-22 14:00:00', 'Tidak Aktif'),
('Selasa', '2025-01-23 15:00:00', '2025-01-23 17:00:00', 'Aktif'),
('Rabu', '2025-01-24 16:00:00', '2025-01-24 18:00:00', 'Aktif'),
('Kamis', '2025-01-25 08:00:00', '2025-01-25 10:00:00', 'Tidak Aktif'),
('Jumat', '2025-01-26 13:00:00', '2025-01-26 15:00:00', 'Aktif'),
('Sabtu', '2025-01-27 09:00:00', '2025-01-27 11:00:00', 'Aktif'),
--
('Sabtu', '2025-01-28 10:30:00', '2025-01-28 12:30:00', 'Tidak Aktif'),
('Senin', '2025-01-29 14:30:00', '2025-01-29 16:30:00', 'Aktif'),
('Selasa', '2025-01-30 15:30:00', '2025-01-30 17:30:00', 'Aktif'),
('Rabu', '2025-01-31 11:00:00', '2025-01-31 13:00:00', 'Tidak Aktif'),
('Kamis', '2025-02-01 12:30:00', '2025-02-01 14:30:00', 'Aktif'),
('Jumat', '2025-02-02 09:30:00', '2025-02-02 11:30:00', 'Aktif'),
('Sabtu', '2025-02-03 08:30:00', '2025-02-03 10:30:00', 'Tidak Aktif'),
('Sabtu', '2025-02-04 13:30:00', '2025-02-04 15:30:00', 'Aktif'),
('Senin', '2025-02-05 14:00:00', '2025-02-05 16:00:00', 'Aktif'),
('Selasa', '2025-02-06 15:00:00', '2025-02-06 17:00:00', 'Tidak Aktif');


-- Views dengan fungsi agregate

-- View 1: Total SKS yang diambil oleh setiap mahasiswa
CREATE VIEW total_sks_mahasiswa AS
SELECT 
    m.nama AS nama_mahasiswa,
    SUM(mk.sks) AS total_sks					
FROM matkul_has_mahasiswa mhm
JOIN mahasiswa m ON mhm.mahasiswa_id = m.id
JOIN mata_kuliah mk ON mhm.mata_kuliah_id = mk.id
GROUP BY m.nama;

-- View 2: Jumlah mahasiswa dalam setiap jurusan
CREATE VIEW jumlah_mahasiswa_jurusan AS
SELECT 
    jurusan,							
    COUNT(*) AS total_mahasiswa
FROM mahasiswa
GROUP BY jurusan;

-- View 3: Rata-rata IPK mahasiswa
CREATE VIEW rata_rata_ipk AS
SELECT 								
    AVG(ipk) AS rata_rata_ipk
FROM transkrip;

-- View 4: Total kelas yang diampu oleh setiap dosen
CREATE VIEW total_kelas_per_dosen AS
SELECT 
    d.nama AS nama_dosen,
    COUNT(k.id) AS total_kelas					
FROM kelas k
JOIN dosen d ON k.dosen_id = d.id
GROUP BY d.nama;

-- View 5: Jumlah mata kuliah per semester
CREATE VIEW jumlah_matkul_per_semester AS
SELECT 
    semester,
    COUNT(*) AS total_mata_kuliah				
FROM mata_kuliah
GROUP BY semester;

-- Views dengan fungsi join

-- View 6: Data mahasiswa beserta alamat dan nomor telepon
CREATE VIEW data_mahasiswa_profil AS
SELECT 
    m.nim,
    m.nama,
    pm.alamat,							
    pm.no_tlp
FROM mahasiswa m
JOIN profil_mahasiswa pm ON m.id = pm.mahasiswa_id;

-- View 7: Data KRS mahasiswa dengan status KRS dan tahun ajaran
CREATE VIEW data_krs_mahasiswa AS
SELECT 
    m.nim,
    m.nama,
    k.semester,							
    k.tahun_ajaran,
    k.status_krs
FROM krs k
JOIN mahasiswa m ON k.mahasiswa_id = m.id;

-- View 8: Data kelas beserta nama dosen pengajar
CREATE VIEW data_kelas_dosen AS
SELECT 
    k.kode_kelas,
    d.nama AS nama_dosen					
FROM kelas k
JOIN dosen d ON k.dosen_id = d.id;

--2 JOIN --
-- View 9: menampilkan data view nama mahasiswa beserta ipk--
CREATE VIEW mahasiswa_dan_ipk AS
SELECT 
    m.nama AS NamaMahasiswa,
	m.angkatan AS Angkatan,
	m.jurusan AS jurusan,
    t.ipk AS IPK,
    CASE 
        WHEN ipk >= 3.8 THEN 'A'
        WHEN ipk >= 3.6 THEN 'AB'
        WHEN ipk >= 3.4 THEN 'B'
        WHEN ipk >= 3.2 THEN 'BC'
        WHEN ipk >= 3.0 THEN 'C'
        ELSE 'E'
    END AS Kategori_Nilai
FROM 
    mahasiswa m
JOIN 
    transkrip t
ON 
    m.id = t.mahasiswa_id
JOIN
	profil_mahasiswa p
ON 
	m.id = p.mahasiswa_id;



--View 10: menampilkan data nama dosen beserta mata kuliahnya--
CREATE VIEW dosen_dan_mata_kuliah AS
SELECT 
	d.nama AS Nama_Dosen,
	mk.nama_mata_kuliah AS Mata_kuliah
FROM
	dosen d
JOIN
  kelas k
ON
 d.id = k.dosen_id
JOIN
  mata_kuliah mk
ON
  d.id = mk.kelas_id; 


-------------------------------------------------------------------------------------------------------------------------------------------------

  --5 perintah bebas--

--View 11: menampilkan mahasiwa yang hadir--
CREATE VIEW absen AS
SELECT 
	m.nim AS NRP,
	m.nama AS Nama_Mahasiswa,
	mh.pertemuan AS Pertemuan,
	mk.nama_mata_kuliah AS Mata_Kuliah,
	mh.Kehadiran AS kehadiran
FROM 
	mahasiswa m
JOIN 
	matkul_has_mahasiswa mh
ON 
	mh.mahasiswa_id = m.id
JOIN
	mata_kuliah mk
ON
	mh.mata_kuliah_id =mk.id;



--View 12: untuk Mata Kuliah dan Mahasiswa yang Mengambilnya--
CREATE VIEW mahasiswa_dan_mata_kuliah AS
SELECT 
    m.nim AS NIM,
    m.nama AS Nama_Mahasiswa,
    mk.nama_mata_kuliah AS Mata_Kuliah,
    mk.sks AS SKS,
    mk.semester AS Semester
FROM mahasiswa m
JOIN matkul_has_mahasiswa mhm
ON m.id = mhm.mahasiswa_id
JOIN mata_kuliah mk
ON mhm.mata_kuliah_id = mk.id;


--View 13: untuk Rekapitulasi Jumlah Mahasiswa per Jurusan--
CREATE VIEW jumlah_mahasiswa_dalam_jurusan AS
SELECT 
    m.jurusan AS Jurusan,
    COUNT(m.id) AS Jumlah_Mahasiswa
FROM mahasiswa m
GROUP BY m.jurusan;


--view 14: jadwal mata kuliah--
CREATE VIEW jadwal_mata_kuliah AS
SELECT 
    hari,
	mt.nama_mata_kuliah AS Mata_Kuliah,
	mt.sks AS Sks,
    CONVERT(TIME(0), waktu_mulai) AS waktu_mulai,
    CONVERT(TIME(0), waktu_selesai) AS waktu_selesai
FROM 
	jadwal j
JOIN
	kelas k
ON
  k.jadwal_id = j.id
JOIN
	mata_kuliah mt
ON 
	mt.kelas_id = k.id;


--View 15: Statistik Mahasiswa per Angkatan--
CREATE VIEW statistik_mahasiswa_per_angkatan AS
SELECT 
    angkatan AS Tahun_Angkatan,
    COUNT(*) AS Jumlah_Mahasiswa
FROM 
    mahasiswa
GROUP BY 
    angkatan


-- Triggers

-- Trigger 1: Trigger untuk Memastikan IPK Tidak Lebih dari 4.0
CREATE TRIGGER cek_ipk_valid
ON transkrip
INSTEAD OF INSERT
AS
BEGIN
    IF EXISTS (SELECT 1 FROM inserted WHERE ipk > 4.0)
    BEGIN
        RAISERROR ('IPK tidak bisa lebih dari 4.0', 16, 1);
        ROLLBACK TRANSACTION;
    END
    ELSE
    BEGIN
        INSERT INTO transkrip (mahasiswa_id, ipk, tanggal_cetak)
        SELECT mahasiswa_id, ipk, tanggal_cetak
        FROM inserted;
    END
END;


-- Trigger 2: Trigger untuk Validasi NIM
CREATE TRIGGER cek_nim_valid
ON mahasiswa
INSTEAD OF INSERT
AS
BEGIN
    -- Periksa apakah ada data yang memiliki NIM kosong
    IF EXISTS (
        SELECT 1
        FROM inserted
        WHERE nim IS NULL OR LTRIM(RTRIM(nim)) = ''
    )
    BEGIN
        -- Gagal jika ditemukan NIM kosong
        RAISERROR ('NIM tidak boleh kosong.', 16, 1);
        ROLLBACK TRANSACTION;
    END
    ELSE
    BEGIN
        -- Lanjutkan proses insert jika validasi lolos
        INSERT INTO mahasiswa (nim, nama, jurusan, angkatan)
        SELECT nim, nama, jurusan, angkatan
        FROM inserted;
    END
END;

--tambah data mahasiswa--


CREATE PROCEDURE tambah_mahasiswa 
    @nim VARCHAR(25),
    @nama VARCHAR(50),
    @jurusan VARCHAR(100),
    @angkatan INT
AS
BEGIN
    -- Cek apakah NIM sudah ada
    IF NOT EXISTS (SELECT 1 FROM mahasiswa WHERE nim = @nim)
    BEGIN
        -- Insert data mahasiswa
        INSERT INTO mahasiswa(nim, nama, jurusan, angkatan)
        VALUES (@nim, @nama, @jurusan, @angkatan);

        -- Log keberhasilan ke tabel log
        INSERT INTO log_tambah_mahasiswa (nim, nama, jurusan, angkatan, status,pesan_log)
        VALUES (@nim, @nama, @jurusan, @angkatan, 'Berhasil','DATA BERHASIL DI TAMBAHKAN');

        PRINT 'Data berhasil ditambahkan.';
    END
    ELSE
    BEGIN
        -- Log kegagalan ke tabel log
        INSERT INTO log_tambah_mahasiswa (nim, nama, jurusan, angkatan, status,pesan_log)
        VALUES (@nim, @nama, @jurusan, @angkatan, 'Gagal: NIM sudah ada atau nama kosong','DATA TIDAK DI TAMBAHKAN');

        PRINT 'NRP yang digunakan sudah ada.';
    END
END;


CREATE TRIGGER trig_validasi_tambah_mahasiswa
ON mahasiswa
AFTER INSERT
AS
BEGIN
    -- Validasi jika NIM atau Nama kosong (data salah masuk)
    IF EXISTS (
        SELECT 1 
        FROM inserted 
        WHERE nim IS NULL OR LEN(nim) = 0 OR nama IS NULL OR LEN(nama) = 0
    )
    BEGIN
        -- Hapus data dari tabel mahasiswa
        DELETE FROM mahasiswa
        WHERE id IN (SELECT id FROM inserted);

        -- Log kesalahan validasi
        INSERT INTO log_tambah_mahasiswa (nim, nama, jurusan, angkatan, status,pesan_log)
        SELECT nim, nama, jurusan, angkatan, 'Gagal: NIM atau Nama kosong','DATA TIDAK DI TAMBAHKAN'
        FROM inserted;

        PRINT 'Data tidak valid: NIM atau Nama kosong.';
    END
END;






--MENCARI MAHASISWA 
CREATE PROCEDURE cari_mahasiswa @m_id BIGINT
AS
BEGIN
	--CEK APAKAH ID ADA DALAM TABEL--
    IF EXISTS (SELECT 1 FROM mahasiswa WHERE id = @m_id)
	BEGIN
     SELECT * FROM mahasiswa WHERE id = @m_id;
END
ELSE
BEGIN
	PRINT 'DATA MAHASISWA TIDAK DI TEMUKAN';
 END
END;

EXEC cari_mahasiswa @m_id = 3;

EXEC tambah_mahasiswa
    @nim = '233040078',
    @nama =  'Alifbata',
    @jurusan = 'Teknik Informatika',
	@angkatan = 2025;


-----------------------------------------------------------------

CREATE PROCEDURE UpdateProfilMahasiswa
    @mahasiswa_id BIGINT,
    @alamat VARCHAR(255),
    @no_tlp VARCHAR(20),
    @tanggal_lahir DATE,
    @email VARCHAR(100),
    @status VARCHAR(20)
AS
BEGIN
-- Validasi input no_tlp
    IF @no_tlp IS NULL OR @no_tlp = ''
    BEGIN
        PRINT 'Nomor telepon tidak boleh koson.';
        RETURN;
    END
    -- Periksa apakah mahasiswa ada
    IF EXISTS (SELECT 1 FROM mahasiswa WHERE id = @mahasiswa_id)
	BEGIN
	--UPDATE PROFIL MAHASISWA--
	UPDATE profil_mahasiswa	
	SET alamat = @alamat,
		no_tlp = @no_tlp,
		tanggal_lahir = @tanggal_lahir,
		email = @email,
		status = @status
		WHERE mahasiswa_id = @mahasiswa_id
	PRINT 'PROFIL MAHASISWA BERHASIL DI PERBARUI';
END
ELSE
BEGIN
PRINT'GAGAL PERBARUI DATA'
END
END;


	-- Trigger untuk mencatat perubahan langsung di konsol
CREATE TRIGGER trig_log_update_profil
ON profil_mahasiswa
AFTER UPDATE
AS
BEGIN
    -- Tampilkan log perubahan di konsol
    SELECT 
        d.mahasiswa_id AS mahasiswa_id,
        d.alamat AS alamat_lama,
        i.alamat AS alamat_baru,
        d.no_tlp AS no_tlp_lama,
        i.no_tlp AS no_tlp_baru,
        d.tanggal_lahir AS tanggal_lahir_lama,
        i.tanggal_lahir AS tanggal_lahir_baru,
        d.email AS email_lama,
        i.email AS email_baru,
        d.status AS status_lama,
        i.status AS status_baru,
        GETDATE() AS waktu_perubahan
    FROM inserted i
    INNER JOIN deleted d
        ON i.id = d.id;

    PRINT 'Perubahan data profil mahasiswa telah dicatat.';
END;

-- Jalankan prosedur untuk memperbarui profil mahasiswa
EXEC UpdateProfilMahasiswa
    @mahasiswa_id = 3,
    @alamat = 'Jl. Bru No. 20',
    @no_tlp = '081298765432',
    @tanggal_lahir = '1999-12-31',
    @email = 'contoh@example.com',
    @status = 'Tidak Aktif';


-------------------------------------------------------------

CREATE PROCEDURE hapus_mahasiswa
	@id BIGINT
AS
BEGIN
    -- Validasi apakah mahasiswa dengan NIM yang diberikan ada di tabel
    IF EXISTS (SELECT 1 FROM mahasiswa WHERE id = @id)
    BEGIN
        -- Hapus data mahasiswa berdasarkan NIM
        DELETE FROM mahasiswa
        WHERE id = @id;

        PRINT 'Data mahasiswa berhasil dihapus.';
    END
    ELSE
    BEGIN
        PRINT 'Data mahasiswa dengan NIM tersebut tidak ditemukan.';
    END
END;
SELECT * FROM mahasiswa;

EXEC hapus_mahasiswa
    @id = 11;



CREATE TRIGGER trig_log_hapus_mahasiswa
ON mahasiswa
AFTER DELETE
AS
BEGIN
    -- Tampilkan log penghapusan di konsol
    SELECT 
        d.id AS mahasiswa_id,
        d.nim AS nim,
        d.nama AS nama,
        d.jurusan AS jurusan,
        d.angkatan AS angkatan,
        GETDATE() AS waktu_penghapusan
    FROM deleted d;

    PRINT 'Penghapusan data mahasiswa telah dicatat.';
END;

----------------------------------
CREATE PROCEDURE cetak_ipk
	@mahasiswa_id BIGINT,
	@ipk DECIMAL(4,2),
	@tanggal_cetak DATETIME
AS
BEGIN
-- Periksa apakah mahasiswa dengan ID terkait ada
    IF EXISTS (SELECT 1 FROM mahasiswa WHERE id = @mahasiswa_id)
    BEGIN
        -- Tambahkan data IPK ke tabel transkrip
        INSERT INTO transkrip (mahasiswa_id, ipk, tanggal_cetak)
        VALUES (@mahasiswa_id, @ipk, @tanggal_cetak);

        PRINT 'Data IPK berhasil ditambahkan.';
    END
    ELSE
    BEGIN
        -- Tampilkan pesan jika mahasiswa tidak ditemukan
        PRINT 'Mahasiswa dengan ID tersebut tidak ditemukan.';
    END
END;


CREATE TRIGGER trig_log_cetak_ipk
ON transkrip
AFTER INSERT
AS
BEGIN
    -- Log informasi data IPK yang baru saja ditambahkan
    SELECT 
        i.mahasiswa_id AS mahasiswa_id,
        i.ipk AS ipk,
        i.tanggal_cetak AS tanggal_cetak,
        GETDATE() AS waktu_eksekusi
    FROM inserted i;

    PRINT 'Penambahan data IPK telah dicatat.';
END;
-- Jalankan prosedur untuk menambahkan data IPK
EXEC cetak_ipk 
    @mahasiswa_id = 5,
    @ipk = 3.75,
    @tanggal_cetak = '2025-01-06 12:00:00';


CREATE PROCEDURE update_jadwal
   @id BIGINT,
   @hari VARCHAR(20),
   @waktu_mulai DATETIME,
   @waktu_selesai DATETIME,
   @status VARCHAR(20)
AS
BEGIN
 --CEK APAKAH JADWAL ADA DI DALAM TABLE--
	    IF EXISTS (SELECT 1 FROM jadwal WHERE id = @id)
		BEGIN
			--UPDATE JADWAL --
			UPDATE jadwal
			SET
			  hari = @hari,
			  waktu_mulai = @waktu_mulai,
			  waktu_selesai = @waktu_selesai,
			  status = @status
			  WHERE id = @id;

			PRINT 'DATA JADWAL BERHASIL DI PERBARUI';
		END
		ELSE
		BEGIN
		--Tampilkan pesan jika jadwal tidak ditemukan--
        PRINT 'jadwal dengan ID tersebut tidak ditemukan.';
    END
END;

CREATE TRIGGER trig_log_update_jadwal
ON jadwal
AFTER UPDATE
AS
BEGIN
    -- Tampilkan log data sebelum dan sesudah perubahan
    SELECT 
        d.id AS jadwal_id_lama,
        d.hari AS hari_lama,
        d.waktu_mulai AS waktu_mulai_lama,
        d.waktu_selesai AS waktu_selesai_lama,
        d.status AS status_lama,
        i.hari AS hari_baru,
        i.waktu_mulai AS waktu_mulai_baru,
        i.waktu_selesai AS waktu_selesai_baru,
        i.status AS status_baru,
        GETDATE() AS waktu_perubahan
    FROM deleted d
    INNER JOIN inserted i ON d.id = i.id;

END;

EXEC update_jadwal
    @id = 1,
    @hari = 'Senin',
    @waktu_mulai = '2025-01-08 09:00:00',
    @waktu_selesai = '2025-01-08 11:00:00',
    @status = 'Aktif';

