CREATE DATABASE IF NOT EXISTS hotelmanagement;
USE hotelmanagement;
/*
-- Tạo bảng KhachHang để lưu thông tin khách hàng
CREATE TABLE IF NOT EXISTS KhachHang (
    KhachHangID INT AUTO_INCREMENT PRIMARY KEY,
    Ten VARCHAR(255) NOT NULL,
    DiaChi VARCHAR(255),
    SoDienThoai VARCHAR(255) NOT NULL,
    UNIQUE (SoDienThoai)
);

-- Tạo bảng NhanVien để lưu thông tin nhân viên
CREATE TABLE IF NOT EXISTS NhanVien (
    EmployeeID INT AUTO_INCREMENT PRIMARY KEY,
    TenNhanVien VARCHAR(255) NOT NULL,
    TaiKhoan VARCHAR(50) UNIQUE NOT NULL,
    MatKhau VARCHAR(255) NOT NULL
);

-- Tạo bảng QuanLy để lưu thông tin người quản lý
CREATE TABLE IF NOT EXISTS QuanLy (
    QuanLyID INT AUTO_INCREMENT PRIMARY KEY,
    TenQuanLy VARCHAR(255) NOT NULL,
    TaiKhoan VARCHAR(50) UNIQUE NOT NULL,
    MatKhau VARCHAR(255) NOT NULL
);

-- Tạo bảng CustomerRegistration để lưu thông tin đăng ký khách hàng
CREATE TABLE IF NOT EXISTS CustomerRegistration (
    RegistrationID INT AUTO_INCREMENT PRIMARY KEY,
    CustomerName VARCHAR(255) NOT NULL,
    PhoneNumber VARCHAR(255) NOT NULL,
    Gender ENUM('Male', 'Female', 'Other') NOT NULL,
    Nationality VARCHAR(255),
    DateOfBirth DATE,
    IDProof VARCHAR(255),
    Address VARCHAR(255),
    RoomType VARCHAR(50),
    CheckInDate DATE,
    TrangThai ENUM('DangO', 'DaCheckOut'),
    LoaiPhong VARCHAR(50),
    EmployeeID INT,
    FOREIGN KEY (EmployeeID) REFERENCES NhanVien(EmployeeID)
);

-- Tạo bảng Phong để lưu thông tin về các phòng khách sạn
CREATE TABLE IF NOT EXISTS Phong (
    PhongID INT AUTO_INCREMENT PRIMARY KEY,
    LoaiPhong VARCHAR(50) NOT NULL,
    Gia DECIMAL(10, 2) NOT NULL,
    TrangThai ENUM('Trong', 'DaDat', 'DangSuaChua') NOT NULL
);

-- Tạo bảng DatPhong để lưu thông tin đặt phòng
CREATE TABLE IF NOT EXISTS DatPhong (
    DatPhongID INT AUTO_INCREMENT PRIMARY KEY,
    KhachHangID INT,
    PhongID INT,
    NgayNhan DATE NOT NULL,
    NgayTra DATE NOT NULL,
    TinhTrang ENUM('DaXacNhan', 'ChoXacNhan', 'DaHuy') NOT NULL,
    FOREIGN KEY (KhachHangID) REFERENCES KhachHang(KhachHangID),
    FOREIGN KEY (PhongID) REFERENCES Phong(PhongID),
    CHECK (NgayNhan <= NgayTra)
);

-- Tạo bảng HoaDon để lưu thông tin hóa đơn
CREATE TABLE IF NOT EXISTS HoaDon (
    HoaDonID INT AUTO_INCREMENT PRIMARY KEY,
    DatPhongID INT,
    NgayThanhToan DATE NOT NULL,
    TongTien DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (DatPhongID) REFERENCES DatPhong(DatPhongID)
);
*/
-- Tạo bảng Account để lưu thông tin đăng nhập
CREATE TABLE IF NOT EXISTS Account (
    AccountID INT AUTO_INCREMENT PRIMARY KEY,
    Username VARCHAR(50) UNIQUE NOT NULL,
    Password VARCHAR(255) NOT NULL,
	UserType VARCHAR(50) NOT NULL
);

-- Tạo bảng Employees để lưu thông tin nhân viên
CREATE TABLE IF NOT EXISTS Employees (
    EmployeeID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(255) NOT NULL,
    PhoneNumber VARCHAR(255) NOT NULL,
    Email VARCHAR(255) NOT NULL,
    Gender ENUM('Male', 'Female', 'Other') NOT NULL,
    Address VARCHAR(255),
    Nationality VARCHAR(255),
    UserType VARCHAR(50) NOT NULL
);

CREATE TABLE IF NOT EXISTS Customers (
    CustomerID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(255) NOT NULL,
    PhoneNumber VARCHAR(255) NOT NULL,
    IDProof VARCHAR(255),
    Address VARCHAR(255),
    RoomType VARCHAR(50),
    Nationality VARCHAR(255),
    Gender ENUM('Male', 'Female', 'Other') NOT NULL,
    DateOfBirth DATE,
	CheckInDate DATE,
    EmployeeID INT,
	RoomNumber INT, -- Thêm cột số phòng
    Price DECIMAL(10, 2),
    FOREIGN KEY (EmployeeID) REFERENCES Employees(EmployeeID)
);

CREATE TABLE IF NOT EXISTS rooms (
    room_number INT AUTO_INCREMENT PRIMARY KEY,
    room_type VARCHAR(255) NOT NULL,
    price DECIMAL(10, 2) NOT NULL,
	Status VARCHAR(50) NOT NULL
);




-- Xóa các dòng dữ liệu của bảng KhachHang
 -- DELETE FROM rooms;
-- DROP DATABASE IF EXISTS HotelManagement;
select * from Employees;

INSERT INTO Employees (Name, PhoneNumber, Email, Gender, Address, Nationality, Position) VALUES
('John Doe', '0123456789', 'johndoe@gmail.com', 'Male', '123 Main St', 'USA', 'Employee'),
('Jane Smith', '0987654321', 'janesmith@gmail.com', 'Female', '456 Elm St', 'Canada', 'Employee'),
('Bob Johnson', '0345678901', 'bobjohnson@gmail.com', 'Male', '789 Oak St', 'UK', 'Employee'),
('Alice Williams', '0678901234', 'alicewilliams@gmail.com', 'Female', '101 Pine St', 'Australia', 'Employee');

INSERT INTO Employees (Name, PhoneNumber, Email, Gender, Address, Nationality, Position)
VALUES
('Nguyễn Văn A', '0123456789', 'nguyenvana@gmail.com', 'Male', '123 Đường ABC, Quận XYZ', 'Việt Nam', 'Employee'),
('Trần Thị B', '0987654321', 'tranthib@gmail.com', 'Female', '456 Đường XYZ, Quận ABC', 'Việt Nam', 'Employee'),
('Lê Văn C', '0369852147', 'levanc@gmail.com', 'Male', '789 Đường XYZ, Quận XYZ', 'Việt Nam', 'Employee'),
('Phạm Thị D', '0246841357', 'phamthid@gmail.com', 'Female', '111 Đường ABC, Quận XYZ', 'Việt Nam', 'Employee'),
('Hoàng Văn E', '0589741236', 'hoangvane@gmail.com', 'Male', '222 Đường XYZ, Quận ABC', 'Việt Nam', 'Employee');

select * from rooms;
select * from Account;
select * from customers;

ALTER TABLE customers
ADD DateCheckOut DATE;
/*ALTER TABLE Account
ADD  UserType VARCHAR(50) NOT NULL;*/
