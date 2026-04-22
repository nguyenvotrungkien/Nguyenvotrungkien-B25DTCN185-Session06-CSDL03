create database bookings_task3;
use bookings_task3;
-- dữ liệu mẫu em nhờ AI thêm để test 
CREATE TABLE bookings (
    booking_id INT,
    user_id INT,
    status VARCHAR(20),
    total_price INT
);
INSERT INTO bookings (booking_id, user_id, status, total_price) VALUES
(1, 1, 'COMPLETED', 100),
(2, 1, 'CANCELLED', 200),
(3, 1, 'CANCELLED', 150),
(4, 1, 'CANCELLED', 120),
(5, 1, 'CANCELLED', 130),
(6, 1, 'CANCELLED', 140),
(7, 1, 'CANCELLED', 110),
(8, 1, 'COMPLETED', 100),
(9, 1, 'PENDING', 90),
(10,1, 'COMPLETED', 80),
(11,2,'COMPLETED',100),
(12,2,'COMPLETED',120),
(13,2,'CANCELLED',130),
(14,2,'CANCELLED',140),
(15,2,'PENDING',150),
(16,2,'COMPLETED',160),
(17,2,'COMPLETED',170),
(18,2,'COMPLETED',180),
(19,2,'COMPLETED',190),
(20,2,'COMPLETED',200),
(21,3,'CANCELLED',100),
(22,3,'CANCELLED',110),
(23,3,'CANCELLED',120),
(24,3,'CANCELLED',130),
(25,3,'CANCELLED',140),
(26,3,'CANCELLED',150),
(27,3,'COMPLETED',160),
(28,3,'PENDING',170);
-- dùng sum và case when để khi status = 'CANCELLED' sẽ bằng 1 còn lại là 0 để đếm số lượng huỷ phòng
select user_id, count(*), sum(case when status = 'CANCELLED' then 1 else 0 end) sumstatus
from bookings -- lấy dữ liệu từ bảng booking 
group by user_id -- gom dữ liệu nhóm theo từng user và trạng thái tử đó có thể dùng count để đếm tổng số lần đặt phòng
-- dùng having để thêm điều kiện cho cột đã được tổng hợp và kiểm tra điều kiện số lần đặt phòng lớn hơn 10 và số đơn đặt huỷ lớn hơn 5 
having count(*) >= 10 and sumstatus > 5
