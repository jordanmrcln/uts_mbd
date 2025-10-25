-- Create database schema
CREATE SCHEMA SALAM;

-- Create table
CREATE TABLE SALAM.mahasiswas (
    nim VARCHAR(10) PRIMARY KEY,
    nama VARCHAR(100) NOT NULL,
    jurusan VARCHAR(100),
    angkatan INT CHECK (angkatan BETWEEN 2000 AND 2030)
);

-- Insert sample data
INSERT INTO SALAM.mahasiswas (nim, nama, jurusan, angkatan)
VALUES ('1237050102', 'Jordan Marcellino', 'Manajemen Basis Data', 2023);

-- Create roles
CREATE ROLE backend_dev LOGIN PASSWORD 'backend123';
CREATE ROLE bi_dev LOGIN PASSWORD 'bidev123';
CREATE ROLE data_engineer LOGIN PASSWORD 'dataeng123';

-- GRANT privileges

-- backend_dev: full CRUD
GRANT CONNECT ON DATABASE uts_mbd TO backend_dev;
GRANT USAGE, CREATE ON SCHEMA SALAM TO backend_dev;
GRANT SELECT, INSERT, UPDATE, DELETE ON ALL TABLES IN SCHEMA SALAM TO backend_dev;
ALTER DEFAULT PRIVILEGES IN SCHEMA SALAM
GRANT SELECT, INSERT, UPDATE, DELETE ON TABLES TO backend_dev;

-- bi_dev: read-only
GRANT CONNECT ON DATABASE uts_mbd TO bi_dev;
GRANT USAGE ON SCHEMA SALAM TO bi_dev;
GRANT SELECT ON ALL TABLES IN SCHEMA SALAM TO bi_dev;
ALTER DEFAULT PRIVILEGES IN SCHEMA SALAM
GRANT SELECT ON TABLES TO bi_dev;

-- data_engineer: CREATE, MODIFY semua objek, CRUD semua tabel
GRANT CONNECT ON DATABASE uts_mbd TO data_engineer;
GRANT USAGE, CREATE ON SCHEMA SALAM TO data_engineer;
GRANT SELECT, INSERT, UPDATE, DELETE ON ALL TABLES IN SCHEMA SALAM TO data_engineer;
ALTER DEFAULT PRIVILEGES IN SCHEMA SALAM
GRANT SELECT, INSERT, UPDATE, DELETE ON TABLES TO data_engineer;
ALTER SCHEMA SALAM OWNER TO data_engineer;
