create database CUSTOMERS_managements;
use CUSTOMERS_managements;
CREATE TABLE CUSTOMERS (
    CustomerID INT PRIMARY KEY AUTO_INCREMENT,
    FullName VARCHAR(100) NOT NULL,
    Email VARCHAR(100) NOT NULL,
    Age INT CHECK (Age >= 0)
);
CREATE TABLE ORDERS (
    OrderID INT PRIMARY KEY AUTO_INCREMENT,
    OrderDate Date default (current_date),
    TotalAmount DECIMAL(12,4) NOT NULL CHECK (TotalAmount >= 0),
    CustomerID INT NOT NULL,
    foreign key (CustomerID) references CUSTOMERS(CustomerID)
);
select * from CUSTOMERS;
-- giải thích 
-- thêm ràng buộc không rỗng đối với tổng tiền, tên và email và dùng varchar tối ưu dữ liệu khi nhập tên, email
-- thêm check đối với tuổi và tổng tiền phải lớn hơn 0, khi không nhập gì tự lấy ngày hiện tại dùng default và curent_date
-- dùng decimal để lấy số thập phân chính xác nhất dùng cho tổng tiền