USE [master]
GO
/****** Object:  Database [sistem_aka_universitas]    Script Date: 08/01/2025 08:00:01 ******/
CREATE DATABASE [sistem_aka_universitas]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'sistem_aka_universitas', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\sistem_aka_universitas.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'sistem_aka_universitas_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\sistem_aka_universitas_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [sistem_aka_universitas] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [sistem_aka_universitas].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [sistem_aka_universitas] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [sistem_aka_universitas] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [sistem_aka_universitas] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [sistem_aka_universitas] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [sistem_aka_universitas] SET ARITHABORT OFF 
GO
ALTER DATABASE [sistem_aka_universitas] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [sistem_aka_universitas] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [sistem_aka_universitas] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [sistem_aka_universitas] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [sistem_aka_universitas] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [sistem_aka_universitas] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [sistem_aka_universitas] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [sistem_aka_universitas] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [sistem_aka_universitas] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [sistem_aka_universitas] SET  ENABLE_BROKER 
GO
ALTER DATABASE [sistem_aka_universitas] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [sistem_aka_universitas] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [sistem_aka_universitas] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [sistem_aka_universitas] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [sistem_aka_universitas] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [sistem_aka_universitas] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [sistem_aka_universitas] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [sistem_aka_universitas] SET RECOVERY FULL 
GO
ALTER DATABASE [sistem_aka_universitas] SET  MULTI_USER 
GO
ALTER DATABASE [sistem_aka_universitas] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [sistem_aka_universitas] SET DB_CHAINING OFF 
GO
ALTER DATABASE [sistem_aka_universitas] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [sistem_aka_universitas] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [sistem_aka_universitas] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [sistem_aka_universitas] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'sistem_aka_universitas', N'ON'
GO
ALTER DATABASE [sistem_aka_universitas] SET QUERY_STORE = ON
GO
ALTER DATABASE [sistem_aka_universitas] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [sistem_aka_universitas]
GO
/****** Object:  Table [dbo].[mahasiswa]    Script Date: 08/01/2025 08:00:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[mahasiswa](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[nim] [varchar](20) NOT NULL,
	[nama] [varchar](100) NOT NULL,
	[jurusan] [varchar](100) NOT NULL,
	[angkatan] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[nim] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[mata_kuliah]    Script Date: 08/01/2025 08:00:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[mata_kuliah](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[kelas_id] [bigint] NOT NULL,
	[kode_mata_kuliah] [varchar](20) NOT NULL,
	[nama_mata_kuliah] [varchar](100) NOT NULL,
	[sks] [int] NOT NULL,
	[semester] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[matkul_has_mahasiswa]    Script Date: 08/01/2025 08:00:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[matkul_has_mahasiswa](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[mahasiswa_id] [bigint] NOT NULL,
	[mata_kuliah_id] [bigint] NOT NULL,
	[pertemuan] [int] NOT NULL,
	[kehadiran] [varchar](20) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[total_sks_mahasiswa]    Script Date: 08/01/2025 08:00:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- View 1: Total SKS yang diambil oleh setiap mahasiswa
CREATE VIEW [dbo].[total_sks_mahasiswa] AS
SELECT 
    m.nama AS nama_mahasiswa,
    SUM(mk.sks) AS total_sks					
FROM matkul_has_mahasiswa mhm
JOIN mahasiswa m ON mhm.mahasiswa_id = m.id
JOIN mata_kuliah mk ON mhm.mata_kuliah_id = mk.id
GROUP BY m.nama;
GO
/****** Object:  View [dbo].[jumlah_mahasiswa_jurusan]    Script Date: 08/01/2025 08:00:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- View 2: Jumlah mahasiswa dalam setiap jurusan
CREATE VIEW [dbo].[jumlah_mahasiswa_jurusan] AS
SELECT 
    jurusan,							
    COUNT(*) AS total_mahasiswa
FROM mahasiswa
GROUP BY jurusan;
GO
/****** Object:  Table [dbo].[transkrip]    Script Date: 08/01/2025 08:00:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[transkrip](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[mahasiswa_id] [bigint] NOT NULL,
	[ipk] [decimal](4, 2) NOT NULL,
	[tanggal_cetak] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[rata_rata_ipk]    Script Date: 08/01/2025 08:00:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- View 3: Rata-rata IPK mahasiswa
CREATE VIEW [dbo].[rata_rata_ipk] AS
SELECT 								
    AVG(ipk) AS rata_rata_ipk
FROM transkrip;
GO
/****** Object:  Table [dbo].[dosen]    Script Date: 08/01/2025 08:00:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dosen](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[nip] [varchar](20) NOT NULL,
	[nama] [varchar](100) NOT NULL,
	[email] [varchar](100) NOT NULL,
	[status] [varchar](20) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[nip] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[kelas]    Script Date: 08/01/2025 08:00:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[kelas](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[dosen_id] [bigint] NOT NULL,
	[jadwal_id] [bigint] NOT NULL,
	[kode_kelas] [varchar](20) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[total_kelas_per_dosen]    Script Date: 08/01/2025 08:00:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- View 4: Total kelas yang diampu oleh setiap dosen
CREATE VIEW [dbo].[total_kelas_per_dosen] AS
SELECT 
    d.nama AS nama_dosen,
    COUNT(k.id) AS total_kelas					
FROM kelas k
JOIN dosen d ON k.dosen_id = d.id
GROUP BY d.nama;
GO
/****** Object:  View [dbo].[jumlah_matkul_per_semester]    Script Date: 08/01/2025 08:00:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- View 5: Jumlah mata kuliah per semester
CREATE VIEW [dbo].[jumlah_matkul_per_semester] AS
SELECT 
    semester,
    COUNT(*) AS total_mata_kuliah				
FROM mata_kuliah
GROUP BY semester;
GO
/****** Object:  Table [dbo].[profil_mahasiswa]    Script Date: 08/01/2025 08:00:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[profil_mahasiswa](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[mahasiswa_id] [bigint] NOT NULL,
	[alamat] [varchar](255) NOT NULL,
	[no_tlp] [varchar](15) NOT NULL,
	[tanggal_lahir] [date] NOT NULL,
	[email] [varchar](100) NOT NULL,
	[status] [varchar](20) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[data_mahasiswa_profil]    Script Date: 08/01/2025 08:00:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- View 6: Data mahasiswa beserta alamat dan nomor telepon
CREATE VIEW [dbo].[data_mahasiswa_profil] AS
SELECT 
    m.nim,
    m.nama,
    pm.alamat,							
    pm.no_tlp
FROM mahasiswa m
JOIN profil_mahasiswa pm ON m.id = pm.mahasiswa_id;
GO
/****** Object:  Table [dbo].[krs]    Script Date: 08/01/2025 08:00:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[krs](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[mahasiswa_id] [bigint] NOT NULL,
	[semester] [int] NOT NULL,
	[tahun_ajaran] [datetime] NOT NULL,
	[status_krs] [varchar](20) NOT NULL,
	[tanggal_pengajuan] [date] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[data_krs_mahasiswa]    Script Date: 08/01/2025 08:00:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- View 7: Data KRS mahasiswa dengan status KRS dan tahun ajaran
CREATE VIEW [dbo].[data_krs_mahasiswa] AS
SELECT 
    m.nim,
    m.nama,
    k.semester,							
    k.tahun_ajaran,
    k.status_krs
FROM krs k
JOIN mahasiswa m ON k.mahasiswa_id = m.id;
GO
/****** Object:  View [dbo].[data_kelas_dosen]    Script Date: 08/01/2025 08:00:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- View 8: Data kelas beserta nama dosen pengajar
CREATE VIEW [dbo].[data_kelas_dosen] AS
SELECT 
    k.kode_kelas,
    d.nama AS nama_dosen					
FROM kelas k
JOIN dosen d ON k.dosen_id = d.id;
GO
/****** Object:  View [dbo].[mahasiswa_dan_ipk]    Script Date: 08/01/2025 08:00:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[mahasiswa_dan_ipk] AS
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
GO
/****** Object:  View [dbo].[dosen_dan_mata_kuliah]    Script Date: 08/01/2025 08:00:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--View 10: menampilkan data nama dosen beserta mata kuliahnya--
CREATE VIEW [dbo].[dosen_dan_mata_kuliah] AS
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
GO
/****** Object:  View [dbo].[absen]    Script Date: 08/01/2025 08:00:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[absen] AS
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
GO
/****** Object:  View [dbo].[mahasiswa_dan_mata_kuliah]    Script Date: 08/01/2025 08:00:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[mahasiswa_dan_mata_kuliah] AS
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
GO
/****** Object:  View [dbo].[jumlah_mahasiswa_dalam_jurusan]    Script Date: 08/01/2025 08:00:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[jumlah_mahasiswa_dalam_jurusan] AS
SELECT 
    m.jurusan AS Jurusan,
    COUNT(m.id) AS Jumlah_Mahasiswa
FROM mahasiswa m
GROUP BY m.jurusan;
GO
/****** Object:  Table [dbo].[jadwal]    Script Date: 08/01/2025 08:00:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[jadwal](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[hari] [varchar](20) NOT NULL,
	[waktu_mulai] [datetime] NOT NULL,
	[waktu_selesai] [datetime] NOT NULL,
	[status] [varchar](20) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[jadwal_mata_kuliah]    Script Date: 08/01/2025 08:00:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[jadwal_mata_kuliah] AS
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
GO
/****** Object:  View [dbo].[statistik_mahasiswa_per_angkatan]    Script Date: 08/01/2025 08:00:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--View 15: Statistik Mahasiswa per Angkatan--
CREATE VIEW [dbo].[statistik_mahasiswa_per_angkatan] AS
SELECT 
    angkatan AS Tahun_Angkatan,
    COUNT(*) AS Jumlah_Mahasiswa
FROM 
    mahasiswa
GROUP BY 
    angkatan
GO
/****** Object:  Table [dbo].[krs_has_matkul]    Script Date: 08/01/2025 08:00:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[krs_has_matkul](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[krs_id] [bigint] NOT NULL,
	[mata_kuliah_id] [bigint] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[kelas]  WITH CHECK ADD FOREIGN KEY([dosen_id])
REFERENCES [dbo].[dosen] ([id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[krs]  WITH CHECK ADD FOREIGN KEY([mahasiswa_id])
REFERENCES [dbo].[mahasiswa] ([id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[krs_has_matkul]  WITH CHECK ADD FOREIGN KEY([krs_id])
REFERENCES [dbo].[krs] ([id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[krs_has_matkul]  WITH CHECK ADD FOREIGN KEY([mata_kuliah_id])
REFERENCES [dbo].[mata_kuliah] ([id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[mata_kuliah]  WITH CHECK ADD FOREIGN KEY([kelas_id])
REFERENCES [dbo].[kelas] ([id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[matkul_has_mahasiswa]  WITH CHECK ADD FOREIGN KEY([mahasiswa_id])
REFERENCES [dbo].[mahasiswa] ([id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[matkul_has_mahasiswa]  WITH CHECK ADD FOREIGN KEY([mata_kuliah_id])
REFERENCES [dbo].[mata_kuliah] ([id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[profil_mahasiswa]  WITH CHECK ADD FOREIGN KEY([mahasiswa_id])
REFERENCES [dbo].[mahasiswa] ([id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[transkrip]  WITH CHECK ADD FOREIGN KEY([mahasiswa_id])
REFERENCES [dbo].[mahasiswa] ([id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
/****** Object:  StoredProcedure [dbo].[cari_mahasiswa]    Script Date: 08/01/2025 08:00:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--MENCARI MAHASISWA 
CREATE PROCEDURE [dbo].[cari_mahasiswa] @m_id BIGINT
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
GO
/****** Object:  StoredProcedure [dbo].[cetak_ipk]    Script Date: 08/01/2025 08:00:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[cetak_ipk]
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
GO
/****** Object:  StoredProcedure [dbo].[hapus_mahasiswa]    Script Date: 08/01/2025 08:00:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[hapus_mahasiswa]
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
GO
/****** Object:  StoredProcedure [dbo].[tambah_mahasiswa]    Script Date: 08/01/2025 08:00:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[tambah_mahasiswa] 
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
GO
/****** Object:  StoredProcedure [dbo].[update_jadwal]    Script Date: 08/01/2025 08:00:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[update_jadwal]
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
GO
/****** Object:  StoredProcedure [dbo].[UpdateProfilMahasiswa]    Script Date: 08/01/2025 08:00:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdateProfilMahasiswa]
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
GO
USE [master]
GO
ALTER DATABASE [sistem_aka_universitas] SET  READ_WRITE 
GO
