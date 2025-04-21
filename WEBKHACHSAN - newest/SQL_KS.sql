---------------------------------------------------DATABSE KS---------------------------------------------------
GO
CREATE DATABASE KS
GO
USE KS
GO
---------------------------------------------------CREATE TABLE---------------------------------------------------
CREATE TABLE LOAITAIKHOAN(IDLOAITAIKHOAN INT IDENTITY PRIMARY KEY, TENLOAITAIKHOAN NVARCHAR(100))
GO
CREATE TABLE TAIKHOAN(TENDANGNHAP VARCHAR(200) PRIMARY KEY, MATKHAU VARCHAR(200), TRANGTHAI INT, IDLOAITAIKHOAN INT FOREIGN KEY (IDLOAITAIKHOAN) REFERENCES LOAITAIKHOAN (IDLOAITAIKHOAN))
GO
CREATE TABLE LOAIPHONG(IDLOAIPHONG INT IDENTITY PRIMARY KEY, TENLOAIPHONG NVARCHAR(200), MOTALOAIPHONG NVARCHAR(200), TENHINHANHLOAIPHONG NVARCHAR(200))
GO
CREATE TABLE PHONG(IDPHONG INT IDENTITY PRIMARY KEY, SOPHONG INT UNIQUE, TENPHONG NVARCHAR(200), MOTAPHONG NVARCHAR(1500), GIAPHONG DECIMAL(18,0), SOLUONGGIUONGPHONG INT, SOLUONGPHONGTAM INT, TENDANGNHAP VARCHAR(200) FOREIGN KEY (TENDANGNHAP) REFERENCES TAIKHOAN(TENDANGNHAP), DELAYPHONG DECIMAL(3,1), IDLOAIPHONG INT FOREIGN KEY (IDLOAIPHONG) REFERENCES LOAIPHONG(IDLOAIPHONG))
GO
CREATE TABLE HINHANHPHONG(IDHINHANHPHONG INT IDENTITY PRIMARY KEY, TENHINHANHPHONG NVARCHAR(200), IDPHONG INT FOREIGN KEY (IDPHONG) REFERENCES PHONG(IDPHONG), VITRI INT)
GO
CREATE TABLE THIETBIPHONG(IDTHIETBIPHONG INT IDENTITY PRIMARY KEY, TENTHIETBIPHONG NVARCHAR(200), IDPHONG INT FOREIGN KEY (IDPHONG) REFERENCES PHONG(IDPHONG))
GO 
CREATE TABLE TRANGTHAIDATPHONG(IDTRANGTHAIDATPHONG INT PRIMARY KEY IDENTITY, TENTRANGTHAIDATPHONG NVARCHAR(200) UNIQUE)
GO
CREATE TABLE DATPHONG(IDDATPHONG INT PRIMARY KEY IDENTITY,IDPHONG INT, TENDANGNHAP VARCHAR(200) FOREIGN KEY (TENDANGNHAP) REFERENCES TAIKHOAN(TENDANGNHAP), CHECKIN DATETIME2(0), CHECKOUT DATETIME2(0), NGUOILON INT, TREEM INT, GHICHU NVARCHAR(200), IDTRANGTHAIDATPHONG INT FOREIGN KEY (IDTRANGTHAIDATPHONG) REFERENCES TRANGTHAIDATPHONG(IDTRANGTHAIDATPHONG))
GO
CREATE TABLE THONGTINKHACHHANG(IDTHONGTINKHACHHANG INT PRIMARY KEY IDENTITY, TEN NVARCHAR(200), EMAIL VARCHAR(200), TENDANGNHAP VARCHAR(200) FOREIGN KEY (TENDANGNHAP) REFERENCES TAIKHOAN(TENDANGNHAP))
GO
---------------------------------------------------INESRT TABLE---------------------------------------------------
INSERT LOAITAIKHOAN (TENLOAITAIKHOAN) 
VALUES
(N'QUẢN TRỊ VIÊN'),
(N'NHÂN VIÊN'),
(N'KHÁCH HÀNG')
GO
INSERT TAIKHOAN (TENDANGNHAP, MATKHAU, TRANGTHAI, IDLOAITAIKHOAN) 
VALUES 
('ADMIN', 123, 1, 1),
('NHANVIENA', 123, 1, 2),
('KHACHHANGA', 123, 1, 3)
GO
INSERT LOAIPHONG(TENLOAIPHONG, MOTALOAIPHONG, TENHINHANHLOAIPHONG) 
VALUES
(N'Loft', N'Phòng Loft là loại phòng có thiết kế hai tầng (duplex), tái hiện sống động hình ảnh những ngôi nhà truyền…', N'Banner_MSP_Premium_01.jpg'),
(N'Superior', N'Một lựa chọn thông minh với thiết kế gọn gàng, tinh tế và tối giản, mang vẻ đẹp thanh lịch, hoàn…', N'Banner_MyMind_01.jpg'),
(N'Deluxe', N'Những căn phòng rộng rãi với ban công thoáng mát được thiết kế để khơi dậy và tái tạo trọn vẹn…', N'8E3A6179.jpg'),
(N'Rooftop Jacuzzi Suite', N'Tình yêu là chủ đề chính của hạng phòng này, với một bồn tắm Jacuzzi quyến rũ ở ban công và…', N'Banner_MyHeart_01.jpg'),
(N'Junior Suite', N'Junior Suite- 45m2 – with balconies – extra bed upon request- is minimalist in style with an elegant ambiance. In-room amenities…', N'Junior-Suite-04.jpg'),
(N'Executive Suite', N'Đây là loại phòng rộng nhất mang đến một không gian hấp dẫn, khơi nguồn cảm hứng sáng tạo cho những…', N'ffa368252f00f35eaa11-1.jpg'),
(N'Presidential Suite', N'Với diện tích 98 m2, Presidential Suite là một thiên đường tĩnh dưỡng và thư giãn với sự trang trí tinh…', N'2096e4c7d29c0ec2578d.jpg');
GO
INSERT INTO PHONG (SOPHONG, TENPHONG, MOTAPHONG, GIAPHONG, SOLUONGGIUONGPHONG, SOLUONGPHONGTAM, TENDANGNHAP, DELAYPHONG, IDLOAIPHONG)
VALUES
(101, N'Loft Room Double/ Twin', N'Loft Room là một loại phòng nghỉ có cấu trúc gác mái, tái hiện lại một cách sinh động các ngôi nhà truyền thống của Hội An vào những thập niên 1980. Hội An là một khu vực trũng thấp, dễ bị ngập lụt trong mùa mưa và phòng này tái hiện chính bản chất của những ngôi nhà lịch sử đó với một phòng ngủ ấm cúng ở tầng trên nơi người dân địa phương sẽ tìm thấy nơi an toàn ấm cúng trong khi khu vực phòng khách nằm ở tầng dưới. Phòng ngủ được thiết kế tinh tế vừa tiện nghi hiện đại nhưng vẫn giữ được sự hoài cổ. Khách có thể lựa chọn giường đôi hoặc giường đơn hoặc phòng có kết nối. Loft Room là lựa chọn lý tưởng cho những du khách trẻ tuổi, độc thân hoặc cặp đôi do bố trí độc đáo của nó, nhưng không được khuyến khích cho trẻ em dưới 12 tuổi hoặc người cao tuổi.', 1000000, 2, 1, 'admin', 0.1, 1),
--(102, N'Loft Room Double/ Twin', N'Loft Room là một loại phòng nghỉ có cấu trúc gác mái, tái hiện lại một cách sinh động các ngôi nhà truyền thống của Hội An vào những thập niên 1980. Hội An là một khu vực trũng thấp, dễ bị ngập lụt trong mùa mưa và phòng này tái hiện chính bản chất của những ngôi nhà lịch sử đó với một phòng ngủ ấm cúng ở tầng trên nơi người dân địa phương sẽ tìm thấy nơi an toàn ấm cúng trong khi khu vực phòng khách nằm ở tầng dưới. Phòng ngủ được thiết kế tinh tế vừa tiện nghi hiện đại nhưng vẫn giữ được sự hoài cổ. Khách có thể lựa chọn giường đôi hoặc giường đơn hoặc phòng có kết nối. Loft Room là lựa chọn lý tưởng cho những du khách trẻ tuổi, độc thân hoặc cặp đôi do bố trí độc đáo của nó, nhưng không được khuyến khích cho trẻ em dưới 12 tuổi hoặc người cao tuổi.', 1000000, 2, 1, 'admin', 0.1, 1),
--(103, N'Loft Room Double/ Twin', N'Loft Room là một loại phòng nghỉ có cấu trúc gác mái, tái hiện lại một cách sinh động các ngôi nhà truyền thống của Hội An vào những thập niên 1980. Hội An là một khu vực trũng thấp, dễ bị ngập lụt trong mùa mưa và phòng này tái hiện chính bản chất của những ngôi nhà lịch sử đó với một phòng ngủ ấm cúng ở tầng trên nơi người dân địa phương sẽ tìm thấy nơi an toàn ấm cúng trong khi khu vực phòng khách nằm ở tầng dưới. Phòng ngủ được thiết kế tinh tế vừa tiện nghi hiện đại nhưng vẫn giữ được sự hoài cổ. Khách có thể lựa chọn giường đôi hoặc giường đơn hoặc phòng có kết nối. Loft Room là lựa chọn lý tưởng cho những du khách trẻ tuổi, độc thân hoặc cặp đôi do bố trí độc đáo của nó, nhưng không được khuyến khích cho trẻ em dưới 12 tuổi hoặc người cao tuổi.', 1000000, 2, 1, 'admin', 0.1, 1),
--(104, N'Loft Room Double/ Twin', N'Loft Room là một loại phòng nghỉ có cấu trúc gác mái, tái hiện lại một cách sinh động các ngôi nhà truyền thống của Hội An vào những thập niên 1980. Hội An là một khu vực trũng thấp, dễ bị ngập lụt trong mùa mưa và phòng này tái hiện chính bản chất của những ngôi nhà lịch sử đó với một phòng ngủ ấm cúng ở tầng trên nơi người dân địa phương sẽ tìm thấy nơi an toàn ấm cúng trong khi khu vực phòng khách nằm ở tầng dưới. Phòng ngủ được thiết kế tinh tế vừa tiện nghi hiện đại nhưng vẫn giữ được sự hoài cổ. Khách có thể lựa chọn giường đôi hoặc giường đơn hoặc phòng có kết nối. Loft Room là lựa chọn lý tưởng cho những du khách trẻ tuổi, độc thân hoặc cặp đôi do bố trí độc đáo của nó, nhưng không được khuyến khích cho trẻ em dưới 12 tuổi hoặc người cao tuổi.', 1000000, 2, 1, 'admin', 0.1, 1),
--(105, N'Loft Room Double/ Twin', N'Loft Room là một loại phòng nghỉ có cấu trúc gác mái, tái hiện lại một cách sinh động các ngôi nhà truyền thống của Hội An vào những thập niên 1980. Hội An là một khu vực trũng thấp, dễ bị ngập lụt trong mùa mưa và phòng này tái hiện chính bản chất của những ngôi nhà lịch sử đó với một phòng ngủ ấm cúng ở tầng trên nơi người dân địa phương sẽ tìm thấy nơi an toàn ấm cúng trong khi khu vực phòng khách nằm ở tầng dưới. Phòng ngủ được thiết kế tinh tế vừa tiện nghi hiện đại nhưng vẫn giữ được sự hoài cổ. Khách có thể lựa chọn giường đôi hoặc giường đơn hoặc phòng có kết nối. Loft Room là lựa chọn lý tưởng cho những du khách trẻ tuổi, độc thân hoặc cặp đôi do bố trí độc đáo của nó, nhưng không được khuyến khích cho trẻ em dưới 12 tuổi hoặc người cao tuổi.', 1000000, 2, 1, 'admin', 0.1, 1),
--(106, N'Loft Room Double/ Twin', N'Loft Room là một loại phòng nghỉ có cấu trúc gác mái, tái hiện lại một cách sinh động các ngôi nhà truyền thống của Hội An vào những thập niên 1980. Hội An là một khu vực trũng thấp, dễ bị ngập lụt trong mùa mưa và phòng này tái hiện chính bản chất của những ngôi nhà lịch sử đó với một phòng ngủ ấm cúng ở tầng trên nơi người dân địa phương sẽ tìm thấy nơi an toàn ấm cúng trong khi khu vực phòng khách nằm ở tầng dưới. Phòng ngủ được thiết kế tinh tế vừa tiện nghi hiện đại nhưng vẫn giữ được sự hoài cổ. Khách có thể lựa chọn giường đôi hoặc giường đơn hoặc phòng có kết nối. Loft Room là lựa chọn lý tưởng cho những du khách trẻ tuổi, độc thân hoặc cặp đôi do bố trí độc đáo của nó, nhưng không được khuyến khích cho trẻ em dưới 12 tuổi hoặc người cao tuổi.', 1000000, 2, 1, 'admin', 0.1, 1),
--(107, N'Loft Room Double/ Twin', N'Loft Room là một loại phòng nghỉ có cấu trúc gác mái, tái hiện lại một cách sinh động các ngôi nhà truyền thống của Hội An vào những thập niên 1980. Hội An là một khu vực trũng thấp, dễ bị ngập lụt trong mùa mưa và phòng này tái hiện chính bản chất của những ngôi nhà lịch sử đó với một phòng ngủ ấm cúng ở tầng trên nơi người dân địa phương sẽ tìm thấy nơi an toàn ấm cúng trong khi khu vực phòng khách nằm ở tầng dưới. Phòng ngủ được thiết kế tinh tế vừa tiện nghi hiện đại nhưng vẫn giữ được sự hoài cổ. Khách có thể lựa chọn giường đôi hoặc giường đơn hoặc phòng có kết nối. Loft Room là lựa chọn lý tưởng cho những du khách trẻ tuổi, độc thân hoặc cặp đôi do bố trí độc đáo của nó, nhưng không được khuyến khích cho trẻ em dưới 12 tuổi hoặc người cao tuổi.', 1000000, 2, 1, 'admin', 0.1, 1),
--(108, N'Loft Room Double/ Twin', N'Loft Room là một loại phòng nghỉ có cấu trúc gác mái, tái hiện lại một cách sinh động các ngôi nhà truyền thống của Hội An vào những thập niên 1980. Hội An là một khu vực trũng thấp, dễ bị ngập lụt trong mùa mưa và phòng này tái hiện chính bản chất của những ngôi nhà lịch sử đó với một phòng ngủ ấm cúng ở tầng trên nơi người dân địa phương sẽ tìm thấy nơi an toàn ấm cúng trong khi khu vực phòng khách nằm ở tầng dưới. Phòng ngủ được thiết kế tinh tế vừa tiện nghi hiện đại nhưng vẫn giữ được sự hoài cổ. Khách có thể lựa chọn giường đôi hoặc giường đơn hoặc phòng có kết nối. Loft Room là lựa chọn lý tưởng cho những du khách trẻ tuổi, độc thân hoặc cặp đôi do bố trí độc đáo của nó, nhưng không được khuyến khích cho trẻ em dưới 12 tuổi hoặc người cao tuổi.', 1000000, 2, 1, 'admin', 0.1, 1),
--(109, N'Loft Room Double/ Twin', N'Loft Room là một loại phòng nghỉ có cấu trúc gác mái, tái hiện lại một cách sinh động các ngôi nhà truyền thống của Hội An vào những thập niên 1980. Hội An là một khu vực trũng thấp, dễ bị ngập lụt trong mùa mưa và phòng này tái hiện chính bản chất của những ngôi nhà lịch sử đó với một phòng ngủ ấm cúng ở tầng trên nơi người dân địa phương sẽ tìm thấy nơi an toàn ấm cúng trong khi khu vực phòng khách nằm ở tầng dưới. Phòng ngủ được thiết kế tinh tế vừa tiện nghi hiện đại nhưng vẫn giữ được sự hoài cổ. Khách có thể lựa chọn giường đôi hoặc giường đơn hoặc phòng có kết nối. Loft Room là lựa chọn lý tưởng cho những du khách trẻ tuổi, độc thân hoặc cặp đôi do bố trí độc đáo của nó, nhưng không được khuyến khích cho trẻ em dưới 12 tuổi hoặc người cao tuổi.', 1000000, 2, 1, 'admin', 0.1, 1),
--(110, N'Loft Room Double/ Twin', N'Loft Room là một loại phòng nghỉ có cấu trúc gác mái, tái hiện lại một cách sinh động các ngôi nhà truyền thống của Hội An vào những thập niên 1980. Hội An là một khu vực trũng thấp, dễ bị ngập lụt trong mùa mưa và phòng này tái hiện chính bản chất của những ngôi nhà lịch sử đó với một phòng ngủ ấm cúng ở tầng trên nơi người dân địa phương sẽ tìm thấy nơi an toàn ấm cúng trong khi khu vực phòng khách nằm ở tầng dưới. Phòng ngủ được thiết kế tinh tế vừa tiện nghi hiện đại nhưng vẫn giữ được sự hoài cổ. Khách có thể lựa chọn giường đôi hoặc giường đơn hoặc phòng có kết nối. Loft Room là lựa chọn lý tưởng cho những du khách trẻ tuổi, độc thân hoặc cặp đôi do bố trí độc đáo của nó, nhưng không được khuyến khích cho trẻ em dưới 12 tuổi hoặc người cao tuổi.', 1000000, 2, 1, 'admin', 0.1, 1),

(201, N'Superior Town Double/Twin', N'Gọn gàng, vừa phải, sắp đặt tối giản luôn là sự lựa chọn thông minh, thiết kế phòng trang nhã, vừa vặn cho , khách đi một mình hoặc cặp đôi ở mọi lứa tuổi và thị hiếu. Phòng có loại 1 giường đôi hoặc 2 giường đơn, các tiện nghi trong phòng được bố trí sao cho việc di chuyển được thuận tiện nhất.', 1000000, 2, 1, 'admin', 0.1, 2),
--(203, N'Superior Town Double/Twin', N'Gọn gàng, vừa phải, sắp đặt tối giản luôn là sự lựa chọn thông minh, thiết kế phòng trang nhã, vừa vặn cho , khách đi một mình hoặc cặp đôi ở mọi lứa tuổi và thị hiếu. Phòng có loại 1 giường đôi hoặc 2 giường đơn, các tiện nghi trong phòng được bố trí sao cho việc di chuyển được thuận tiện nhất.', 1000000, 2, 1, 'admin', 0.1, 2),
--(205, N'Superior Town Double/Twin', N'Gọn gàng, vừa phải, sắp đặt tối giản luôn là sự lựa chọn thông minh, thiết kế phòng trang nhã, vừa vặn cho , khách đi một mình hoặc cặp đôi ở mọi lứa tuổi và thị hiếu. Phòng có loại 1 giường đôi hoặc 2 giường đơn, các tiện nghi trong phòng được bố trí sao cho việc di chuyển được thuận tiện nhất.', 1000000, 2, 1, 'admin', 0.1, 2),
--(207, N'Superior Town Double/Twin', N'Gọn gàng, vừa phải, sắp đặt tối giản luôn là sự lựa chọn thông minh, thiết kế phòng trang nhã, vừa vặn cho , khách đi một mình hoặc cặp đôi ở mọi lứa tuổi và thị hiếu. Phòng có loại 1 giường đôi hoặc 2 giường đơn, các tiện nghi trong phòng được bố trí sao cho việc di chuyển được thuận tiện nhất.', 1000000, 2, 1, 'admin', 0.1, 2),
--(209, N'Superior Town Double/Twin', N'Gọn gàng, vừa phải, sắp đặt tối giản luôn là sự lựa chọn thông minh, thiết kế phòng trang nhã, vừa vặn cho , khách đi một mình hoặc cặp đôi ở mọi lứa tuổi và thị hiếu. Phòng có loại 1 giường đôi hoặc 2 giường đơn, các tiện nghi trong phòng được bố trí sao cho việc di chuyển được thuận tiện nhất.', 1000000, 2, 1, 'admin', 0.1, 2),

(202, N'Superior Pool Double/Twin', N'Gọn gàng, vừa phải, sắp đặt tối giản luôn là sự lựa chọn thông minh, thiết kế phòng trang nhã, vừa vặn cho khách đi một mình hoặc cặp đôi ở mọi lứa tuổi và thị hiếu. Phòng có loại 1 giường đôi hoặc 2 giường đơn, các tiện nghi trong phòng được bố trí sao cho việc di chuyển được thuận tiện nhất.', 1200000, 2, 1, 'admin', 0.2, 2),
--(204, N'Superior Pool Double/Twin', N'Gọn gàng, vừa phải, sắp đặt tối giản luôn là sự lựa chọn thông minh, thiết kế phòng trang nhã, vừa vặn cho khách đi một mình hoặc cặp đôi ở mọi lứa tuổi và thị hiếu. Phòng có loại 1 giường đôi hoặc 2 giường đơn, các tiện nghi trong phòng được bố trí sao cho việc di chuyển được thuận tiện nhất.', 1200000, 2, 1, 'admin', 0.2, 2),
--(206, N'Superior Pool Double/Twin', N'Gọn gàng, vừa phải, sắp đặt tối giản luôn là sự lựa chọn thông minh, thiết kế phòng trang nhã, vừa vặn cho khách đi một mình hoặc cặp đôi ở mọi lứa tuổi và thị hiếu. Phòng có loại 1 giường đôi hoặc 2 giường đơn, các tiện nghi trong phòng được bố trí sao cho việc di chuyển được thuận tiện nhất.', 1200000, 2, 1, 'admin', 0.2, 2),
--(208, N'Superior Pool Double/Twin', N'Gọn gàng, vừa phải, sắp đặt tối giản luôn là sự lựa chọn thông minh, thiết kế phòng trang nhã, vừa vặn cho khách đi một mình hoặc cặp đôi ở mọi lứa tuổi và thị hiếu. Phòng có loại 1 giường đôi hoặc 2 giường đơn, các tiện nghi trong phòng được bố trí sao cho việc di chuyển được thuận tiện nhất.', 1200000, 2, 1, 'admin', 0.2, 2),
--(210, N'Superior Pool Double/Twin', N'Gọn gàng, vừa phải, sắp đặt tối giản luôn là sự lựa chọn thông minh, thiết kế phòng trang nhã, vừa vặn cho khách đi một mình hoặc cặp đôi ở mọi lứa tuổi và thị hiếu. Phòng có loại 1 giường đôi hoặc 2 giường đơn, các tiện nghi trong phòng được bố trí sao cho việc di chuyển được thuận tiện nhất.', 1200000, 2, 1, 'admin', 0.2, 2),

(301, N'Deluxe Town Double/Twin', N'Phòng rộng rãi với ban công thoáng đãng giúp bạn lấy lại nguồn năng lượng tràn trề. Với lựa chọn 1 giường đôi hoặc 2 giường đơn, đây là loại phòng phù hợp nhất cho gia đình, hoặc đối tượng khách nghỉ dưỡng muốn tự mình phục hồi hoàn toàn năng lượng bên trong.', 800000, 1, 1, 'admin', 0.3, 3),
--(303, N'Deluxe Town Double/Twin', N'Phòng rộng rãi với ban công thoáng đãng giúp bạn lấy lại nguồn năng lượng tràn trề. Với lựa chọn 1 giường đôi hoặc 2 giường đơn, đây là loại phòng phù hợp nhất cho gia đình, hoặc đối tượng khách nghỉ dưỡng muốn tự mình phục hồi hoàn toàn năng lượng bên trong.', 800000, 1, 1, 'admin', 0.3, 3),
--(305, N'Deluxe Town Double/Twin', N'Phòng rộng rãi với ban công thoáng đãng giúp bạn lấy lại nguồn năng lượng tràn trề. Với lựa chọn 1 giường đôi hoặc 2 giường đơn, đây là loại phòng phù hợp nhất cho gia đình, hoặc đối tượng khách nghỉ dưỡng muốn tự mình phục hồi hoàn toàn năng lượng bên trong.', 800000, 1, 1, 'admin', 0.3, 3),
--(307, N'Deluxe Town Double/Twin', N'Phòng rộng rãi với ban công thoáng đãng giúp bạn lấy lại nguồn năng lượng tràn trề. Với lựa chọn 1 giường đôi hoặc 2 giường đơn, đây là loại phòng phù hợp nhất cho gia đình, hoặc đối tượng khách nghỉ dưỡng muốn tự mình phục hồi hoàn toàn năng lượng bên trong.', 800000, 1, 1, 'admin', 0.3, 3),
--(309, N'Deluxe Town Double/Twin', N'Phòng rộng rãi với ban công thoáng đãng giúp bạn lấy lại nguồn năng lượng tràn trề. Với lựa chọn 1 giường đôi hoặc 2 giường đơn, đây là loại phòng phù hợp nhất cho gia đình, hoặc đối tượng khách nghỉ dưỡng muốn tự mình phục hồi hoàn toàn năng lượng bên trong.', 800000, 1, 1, 'admin', 0.3, 3),

(302, N'Deluxe Pool Double/Twin', N'Phòng rộng rãi với ban công thoáng đãng giúp bạn lấy lại nguồn năng lượng tràn trề. Với lựa chọn 1 giường đôi hoặc 2 giường đơn, đây là loại phòng phù hợp nhất cho gia đình, hoặc đối tượng khách nghỉ dưỡng muốn tự mình phục hồi hoàn toàn năng lượng bên trong.', 3000000, 3, 1, 'admin', 0.4, 3),
--(304, N'Deluxe Pool Double/Twin', N'Phòng rộng rãi với ban công thoáng đãng giúp bạn lấy lại nguồn năng lượng tràn trề. Với lựa chọn 1 giường đôi hoặc 2 giường đơn, đây là loại phòng phù hợp nhất cho gia đình, hoặc đối tượng khách nghỉ dưỡng muốn tự mình phục hồi hoàn toàn năng lượng bên trong.', 3000000, 3, 1, 'admin', 0.4, 3),
--(306, N'Deluxe Pool Double/Twin', N'Phòng rộng rãi với ban công thoáng đãng giúp bạn lấy lại nguồn năng lượng tràn trề. Với lựa chọn 1 giường đôi hoặc 2 giường đơn, đây là loại phòng phù hợp nhất cho gia đình, hoặc đối tượng khách nghỉ dưỡng muốn tự mình phục hồi hoàn toàn năng lượng bên trong.', 3000000, 3, 1, 'admin', 0.4, 3),
--(308, N'Deluxe Pool Double/Twin', N'Phòng rộng rãi với ban công thoáng đãng giúp bạn lấy lại nguồn năng lượng tràn trề. Với lựa chọn 1 giường đôi hoặc 2 giường đơn, đây là loại phòng phù hợp nhất cho gia đình, hoặc đối tượng khách nghỉ dưỡng muốn tự mình phục hồi hoàn toàn năng lượng bên trong.', 3000000, 3, 1, 'admin', 0.4, 3),
--(310, N'Deluxe Pool Double/Twin', N'Phòng rộng rãi với ban công thoáng đãng giúp bạn lấy lại nguồn năng lượng tràn trề. Với lựa chọn 1 giường đôi hoặc 2 giường đơn, đây là loại phòng phù hợp nhất cho gia đình, hoặc đối tượng khách nghỉ dưỡng muốn tự mình phục hồi hoàn toàn năng lượng bên trong.', 3000000, 3, 1, 'admin', 0.4, 3),

(401, N'Rooftop Jacuzzi Suite', N'Nằm tại trung tâm khu nghỉ dưỡng, với tầm nhìn hướng phố hoặc hướng hồ bơi với giường lớn thoải mái, được trang bị bồn tắm Jacuzzi quyến rũ trên ban công. Loại phòng này phù hợp cho cặp đôi hưởng tuần trăng mật và khách nghỉ dưỡng.', 1500000, 2, 1, 'admin', 0.5, 4),
--(402, N'Rooftop Jacuzzi Suite', N'Nằm tại trung tâm khu nghỉ dưỡng, với tầm nhìn hướng phố hoặc hướng hồ bơi với giường lớn thoải mái, được trang bị bồn tắm Jacuzzi quyến rũ trên ban công. Loại phòng này phù hợp cho cặp đôi hưởng tuần trăng mật và khách nghỉ dưỡng.', 1500000, 2, 1, 'admin', 0.5, 4),
--(403, N'Rooftop Jacuzzi Suite', N'Nằm tại trung tâm khu nghỉ dưỡng, với tầm nhìn hướng phố hoặc hướng hồ bơi với giường lớn thoải mái, được trang bị bồn tắm Jacuzzi quyến rũ trên ban công. Loại phòng này phù hợp cho cặp đôi hưởng tuần trăng mật và khách nghỉ dưỡng.', 1500000, 2, 1, 'admin', 0.5, 4),
--(404, N'Rooftop Jacuzzi Suite', N'Nằm tại trung tâm khu nghỉ dưỡng, với tầm nhìn hướng phố hoặc hướng hồ bơi với giường lớn thoải mái, được trang bị bồn tắm Jacuzzi quyến rũ trên ban công. Loại phòng này phù hợp cho cặp đôi hưởng tuần trăng mật và khách nghỉ dưỡng.', 1500000, 2, 1, 'admin', 0.5, 4),
--(405, N'Rooftop Jacuzzi Suite', N'Nằm tại trung tâm khu nghỉ dưỡng, với tầm nhìn hướng phố hoặc hướng hồ bơi với giường lớn thoải mái, được trang bị bồn tắm Jacuzzi quyến rũ trên ban công. Loại phòng này phù hợp cho cặp đôi hưởng tuần trăng mật và khách nghỉ dưỡng.', 1500000, 2, 1, 'admin', 0.5, 4),

(501, N'Junior Suite1', N'Junior Suite- 45m2- có ban công và có thể đặt thêm giường phụ- phòng thiết kế theo phong cách tối giản với không gian thanh lịch. Trang thiết bị trong phòng được bố trí gọn gàng, đơn giản nhưng tiện nghi để tăng thêm sự tiện lợi cho khách.', 1800000, 2, 1, 'admin', 0.6, 5),
--(503, N'Junior Suite1', N'Junior Suite- 45m2- có ban công và có thể đặt thêm giường phụ- phòng thiết kế theo phong cách tối giản với không gian thanh lịch. Trang thiết bị trong phòng được bố trí gọn gàng, đơn giản nhưng tiện nghi để tăng thêm sự tiện lợi cho khách.', 1800000, 2, 1, 'admin', 0.6, 5),
--(505, N'Junior Suite1', N'Junior Suite- 45m2- có ban công và có thể đặt thêm giường phụ- phòng thiết kế theo phong cách tối giản với không gian thanh lịch. Trang thiết bị trong phòng được bố trí gọn gàng, đơn giản nhưng tiện nghi để tăng thêm sự tiện lợi cho khách.', 1800000, 2, 1, 'admin', 0.6, 5),
--(507, N'Junior Suite1', N'Junior Suite- 45m2- có ban công và có thể đặt thêm giường phụ- phòng thiết kế theo phong cách tối giản với không gian thanh lịch. Trang thiết bị trong phòng được bố trí gọn gàng, đơn giản nhưng tiện nghi để tăng thêm sự tiện lợi cho khách.', 1800000, 2, 1, 'admin', 0.6, 5),
--(509, N'Junior Suite1', N'Junior Suite- 45m2- có ban công và có thể đặt thêm giường phụ- phòng thiết kế theo phong cách tối giản với không gian thanh lịch. Trang thiết bị trong phòng được bố trí gọn gàng, đơn giản nhưng tiện nghi để tăng thêm sự tiện lợi cho khách.', 1800000, 2, 1, 'admin', 0.6, 5),

(502, N'Junior Suite2', N'Junior Suite – với diện tích 45 m² và ban công – có thể bố trí thêm giường theo yêu cầu. Căn phòng này mang phong cách tối giản với không gian trang nhã. Các tiện nghi trong phòng được thiết kế gọn gàng, ngăn nắp và đơn giản, tạo sự thuận tiện cho khách hàng.', 2500000, 3, 1, 'admin', 0.7, 5),
--(504, N'Junior Suite2', N'Junior Suite – với diện tích 45 m² và ban công – có thể bố trí thêm giường theo yêu cầu. Căn phòng này mang phong cách tối giản với không gian trang nhã. Các tiện nghi trong phòng được thiết kế gọn gàng, ngăn nắp và đơn giản, tạo sự thuận tiện cho khách hàng.', 2500000, 3, 1, 'admin', 0.7, 5),
--(506, N'Junior Suite2', N'Junior Suite – với diện tích 45 m² và ban công – có thể bố trí thêm giường theo yêu cầu. Căn phòng này mang phong cách tối giản với không gian trang nhã. Các tiện nghi trong phòng được thiết kế gọn gàng, ngăn nắp và đơn giản, tạo sự thuận tiện cho khách hàng.', 2500000, 3, 1, 'admin', 0.7, 5),
--(508, N'Junior Suite2', N'Junior Suite – với diện tích 45 m² và ban công – có thể bố trí thêm giường theo yêu cầu. Căn phòng này mang phong cách tối giản với không gian trang nhã. Các tiện nghi trong phòng được thiết kế gọn gàng, ngăn nắp và đơn giản, tạo sự thuận tiện cho khách hàng.', 2500000, 3, 1, 'admin', 0.7, 5),
--(510, N'Junior Suite2', N'Junior Suite – với diện tích 45 m² và ban công – có thể bố trí thêm giường theo yêu cầu. Căn phòng này mang phong cách tối giản với không gian trang nhã. Các tiện nghi trong phòng được thiết kế gọn gàng, ngăn nắp và đơn giản, tạo sự thuận tiện cho khách hàng.', 2500000, 3, 1, 'admin', 0.7, 5),

(601, N'Executive Suite', N'Đây là loại phòng rộng rãi nhất trong tất cả các nhóm phòng, không gian gợi mở cảm hứng cho sự sáng tạo, phù hợp với khách thiên hướng nghệ thuật. Điểm đặc biệt của loại phòng này là quầy bar cá nhân, tủ quần áo rộng và chỗ chứa hành lý, và TV xoay 360 độ, loại phòng này phù hợp cho gia đình gồm 2 người lớn và 2 trẻ em hoặc 4 người lớn.', 2000000, 2, 1, 'admin', 0.8, 6),
--(602, N'Executive Suite', N'Đây là loại phòng rộng rãi nhất trong tất cả các nhóm phòng, không gian gợi mở cảm hứng cho sự sáng tạo, phù hợp với khách thiên hướng nghệ thuật. Điểm đặc biệt của loại phòng này là quầy bar cá nhân, tủ quần áo rộng và chỗ chứa hành lý, và TV xoay 360 độ, loại phòng này phù hợp cho gia đình gồm 2 người lớn và 2 trẻ em hoặc 4 người lớn.', 2000000, 2, 1, 'admin', 0.8, 6),
--(603, N'Executive Suite', N'Đây là loại phòng rộng rãi nhất trong tất cả các nhóm phòng, không gian gợi mở cảm hứng cho sự sáng tạo, phù hợp với khách thiên hướng nghệ thuật. Điểm đặc biệt của loại phòng này là quầy bar cá nhân, tủ quần áo rộng và chỗ chứa hành lý, và TV xoay 360 độ, loại phòng này phù hợp cho gia đình gồm 2 người lớn và 2 trẻ em hoặc 4 người lớn.', 2000000, 2, 1, 'admin', 0.8, 6),
--(604, N'Executive Suite', N'Đây là loại phòng rộng rãi nhất trong tất cả các nhóm phòng, không gian gợi mở cảm hứng cho sự sáng tạo, phù hợp với khách thiên hướng nghệ thuật. Điểm đặc biệt của loại phòng này là quầy bar cá nhân, tủ quần áo rộng và chỗ chứa hành lý, và TV xoay 360 độ, loại phòng này phù hợp cho gia đình gồm 2 người lớn và 2 trẻ em hoặc 4 người lớn.', 2000000, 2, 1, 'admin', 0.8, 6),
--(605, N'Executive Suite', N'Đây là loại phòng rộng rãi nhất trong tất cả các nhóm phòng, không gian gợi mở cảm hứng cho sự sáng tạo, phù hợp với khách thiên hướng nghệ thuật. Điểm đặc biệt của loại phòng này là quầy bar cá nhân, tủ quần áo rộng và chỗ chứa hành lý, và TV xoay 360 độ, loại phòng này phù hợp cho gia đình gồm 2 người lớn và 2 trẻ em hoặc 4 người lớn.', 2000000, 2, 1, 'admin', 0.8, 6),

(701, N'Presidential Suite', N'Với diện tích 98 m2, Presidential Suite là một thiên đường tĩnh dưỡng và thư giãn với sự trang trí tinh tế đến từng chi tiết. Đây là lựa chọn lý tưởng cho những ai có nhu cầu vừa nghỉ dưỡng lại vừa có thể kết hợp công tác. Nằm ở trung tâm của khu nghỉ mát, từ ban công phòng ngủ, bạn có thể ngắm toàn cảnh hồ bơi tuyệt đẹp như một bức tranh thủy mặc. Sự kết hợp hài hòa và tinh tế trong cách bài trí phòng từ phòng ngủ, phòng ăn, phòng tắm với bồn sục Jacuzzi sẽ mang đến cho bạn một kỳ nghỉ thực sự thú vị và khó quên hơn bao giờ hết. Loại phòng này là một lựa chọn lý tưởng cho gia đình có hai người lớn hoặc bốn người lớn.', 900000, 2, 1, 'admin', 0.9, 7);
--(702, N'Presidential Suite', N'Với diện tích 98 m2, Presidential Suite là một thiên đường tĩnh dưỡng và thư giãn với sự trang trí tinh tế đến từng chi tiết. Đây là lựa chọn lý tưởng cho những ai có nhu cầu vừa nghỉ dưỡng lại vừa có thể kết hợp công tác. Nằm ở trung tâm của khu nghỉ mát, từ ban công phòng ngủ, bạn có thể ngắm toàn cảnh hồ bơi tuyệt đẹp như một bức tranh thủy mặc. Sự kết hợp hài hòa và tinh tế trong cách bài trí phòng từ phòng ngủ, phòng ăn, phòng tắm với bồn sục Jacuzzi sẽ mang đến cho bạn một kỳ nghỉ thực sự thú vị và khó quên hơn bao giờ hết. Loại phòng này là một lựa chọn lý tưởng cho gia đình có hai người lớn hoặc bốn người lớn.', 900000, 2, 1, 'admin', 0.9, 7),
--(703, N'Presidential Suite', N'Với diện tích 98 m2, Presidential Suite là một thiên đường tĩnh dưỡng và thư giãn với sự trang trí tinh tế đến từng chi tiết. Đây là lựa chọn lý tưởng cho những ai có nhu cầu vừa nghỉ dưỡng lại vừa có thể kết hợp công tác. Nằm ở trung tâm của khu nghỉ mát, từ ban công phòng ngủ, bạn có thể ngắm toàn cảnh hồ bơi tuyệt đẹp như một bức tranh thủy mặc. Sự kết hợp hài hòa và tinh tế trong cách bài trí phòng từ phòng ngủ, phòng ăn, phòng tắm với bồn sục Jacuzzi sẽ mang đến cho bạn một kỳ nghỉ thực sự thú vị và khó quên hơn bao giờ hết. Loại phòng này là một lựa chọn lý tưởng cho gia đình có hai người lớn hoặc bốn người lớn.', 900000, 2, 1, 'admin', 0.9, 7),
--(704, N'Presidential Suite', N'Với diện tích 98 m2, Presidential Suite là một thiên đường tĩnh dưỡng và thư giãn với sự trang trí tinh tế đến từng chi tiết. Đây là lựa chọn lý tưởng cho những ai có nhu cầu vừa nghỉ dưỡng lại vừa có thể kết hợp công tác. Nằm ở trung tâm của khu nghỉ mát, từ ban công phòng ngủ, bạn có thể ngắm toàn cảnh hồ bơi tuyệt đẹp như một bức tranh thủy mặc. Sự kết hợp hài hòa và tinh tế trong cách bài trí phòng từ phòng ngủ, phòng ăn, phòng tắm với bồn sục Jacuzzi sẽ mang đến cho bạn một kỳ nghỉ thực sự thú vị và khó quên hơn bao giờ hết. Loại phòng này là một lựa chọn lý tưởng cho gia đình có hai người lớn hoặc bốn người lớn.', 900000, 2, 1, 'admin', 0.9, 7),
--(705, N'Presidential Suite', N'Với diện tích 98 m2, Presidential Suite là một thiên đường tĩnh dưỡng và thư giãn với sự trang trí tinh tế đến từng chi tiết. Đây là lựa chọn lý tưởng cho những ai có nhu cầu vừa nghỉ dưỡng lại vừa có thể kết hợp công tác. Nằm ở trung tâm của khu nghỉ mát, từ ban công phòng ngủ, bạn có thể ngắm toàn cảnh hồ bơi tuyệt đẹp như một bức tranh thủy mặc. Sự kết hợp hài hòa và tinh tế trong cách bài trí phòng từ phòng ngủ, phòng ăn, phòng tắm với bồn sục Jacuzzi sẽ mang đến cho bạn một kỳ nghỉ thực sự thú vị và khó quên hơn bao giờ hết. Loại phòng này là một lựa chọn lý tưởng cho gia đình có hai người lớn hoặc bốn người lớn.', 900000, 2, 1, 'admin', 0.9, 7);

GO
INSERT PHONG(SOPHONG, IDLOAIPHONG)
VALUES
--(101, 1),
(102, 1),
(103, 1),
(104, 1),
(105, 1),
(106, 1),
(107, 1),
(108, 1),
(109, 1),
(110, 1),

--(201, 2),
(203, 2),
(205, 2),
(207, 2),
(209, 2),

--(202, 2),
(204, 2),
(206, 2),
(208, 2),

--(301, 3),
(303, 3),
(305, 3),
(307, 3),
(309, 3),

--(302, 3),
(304, 3),
(306, 3),
(308, 3),
(310, 3),

--(401, 4),
(402, 4),
(403, 4),
(404, 4),
(405, 4),

--(501, 5),
(503, 5),
(505, 5),
(507, 5),
(509, 5),

--(502, 5),
(504, 5),
(506, 5),
(508, 5),
(510, 5),

--(601, 6),
(602, 6),
(603, 6),
(604, 6),
(605, 6),

--(701, 7),
(702, 7),
(703, 7),
(704, 7),
(705, 7);
GO
INSERT HINHANHPHONG (TENHINHANHPHONG, IDPHONG, VITRI)
VALUES
(N'Downstair-768x1024.jpg', 1, 1),
(N'Bedroom-2-1024x683.jpg', 1, 2),
(N'8E3A6157JPG-1024x683.jpg', 1, 3),
(N'myspiritsuperior_02.jpg', 1, 4),
(N'myspiritsuperior_06.jpg', 1, 5),

(N'287b4bf3_y.jpg', 2, 1),
(N'mymind_08.jpg', 2, 2),
(N'mymind_02.jpg', 2, 3),
(N'mymind_03.jpg', 2, 4),
(N'mymind_09.jpg', 2, 5),

(N'Bedroom-1-1024x683.jpg', 3, 1),
(N'287b4bf3_y.jpg', 3, 2),
(N'mymind_03_2.jpg', 3, 3),
(N'mymind_09_2.jpg', 3, 4),
(N'8E3A5918.jpg', 3, 5),

(N'8E3A6179-1024x683.jpg', 4, 1),
(N'myenergy_01.jpg', 4, 2),
(N'myenergy_02.jpg', 4, 3),
(N'myenergy_04.jpg', 4, 4),

(N'myenergy_01.jpg', 5, 1),
(N'8E3A6179.jpg', 5, 2),
(N'myenergy_02_2.jpg', 5, 3),
(N'myenergy_04_2.jpg', 5, 4),

(N'Banner_MyHeart_01.jpg', 6, 1),
(N'8E3A5387JPG.jpg', 6, 2),
(N'myheart_02.jpg', 6, 3),
(N'myheart_09.jpg', 6, 4),
(N'myheart_03.jpg', 6, 5),
(N'myheart_04.jpg', 6, 6),
(N'myheart_05.jpg', 6, 7),
(N'myheart_06.jpg', 6, 8),
(N'myheart_07.jpg', 6, 9),
(N'myheart_08.jpg', 6, 10),
(N'myheart_10.jpg', 6, 11),
(N'8E3A5403JPG.jpg', 6, 12),
(N'8E3A6200JPG.jpg', 6, 13),

(N'8E3A4960-Edit-Edit-1024x683.jpg', 7, 1),
(N'Junior-Suite-04.jpg', 7, 2),
(N'8E3A5011-HDR-Edit.jpg', 7, 3),
(N'8E3A5004-Edit.jpg', 7, 4),
(N'8E3A4973-Edit-Edit-Edit.jpg', 7, 5),
(N'Junior-Suite-02.jpg', 7, 6),

(N'Junior-Suite-03.jpg', 8, 1),
(N'Junior-Suite-01.jpg', 8, 2),
(N'Junior-Suite-02_2.jpg', 8, 3),
(N'Junior-Suite-04_2.jpg', 8, 4),
(N'Junior-Suite-05.jpg', 8, 5),

(N'MySoul-11-1.jpg', 9, 1),
(N'8E3A5265JPG.jpg', 9, 2),
(N'8E3A5113JPG.jpg', 9, 3),
(N'8E3A5236JPG.jpg', 9, 4),
(N'8E3A5248JPG.jpg', 9, 5),
(N'8E3A5203JPG.jpg', 9, 6),
(N'8E3A5213JPG.jpg', 9, 7),
(N'8E3A5218JPG.jpg', 9, 8),

(N'2096e4c7d29c0ec2578d-1024x768.jpg', 10, 1),
(N'8E3A5575.jpg', 10, 2),
(N'f89bfbdbcd8011de4891.jpg', 10, 3),
(N'8E3A5542.jpg', 10, 4),
(N'8E3A5554.jpg', 10, 5),
(N'5e565f16694db513ec5c.jpg', 10, 6),
(N'Alma-Suite_10.jpg', 10, 7);
GO
INSERT TRANGTHAIDATPHONG(TENTRANGTHAIDATPHONG) 
VALUES 
(N'Đã được đặt'),
(N'Đã trả phòng'),
(N'Đang dọn dẹp'),
(N'Xong');
GO
--INSERT INTO DATPHONG (IDPHONG, TENDANGNHAP, CHECKIN, CHECKOUT, NGUOILON, TREEM, GHICHU)
--VALUES 
--(1, 'admin', '2025-03-01 14:00:00', '2025-03-05 12:00:00', 2, 1, N'Yêu cầu phòng có view đẹp'),
--(2, 'admin', '2025-03-02 15:00:00', '2025-03-06 11:00:00', 2, 0, N'Phòng tầng cao'),
--(3, 'admin', '2025-03-03 13:00:00', '2025-03-07 10:00:00', 3, 1, N'Có giường phụ'),
--(4, 'admin', '2025-03-04 16:00:00', '2025-03-08 12:00:00', 2, 2, N'Có xe đưa đón sân bay'),
--(5, 'admin', '2025-03-05 14:30:00', '2025-03-09 10:30:00', 1, 0, N'Phòng yên tĩnh'),
--(6, 'admin', '2025-03-06 12:00:00', '2025-03-10 11:00:00', 2, 0, N'Cần bữa sáng miễn phí'),
--(7, 'admin', '2025-03-07 14:00:00', '2025-03-11 12:00:00', 2, 1, N'Có ban công rộng');
--GO
---------------------------------------------------CREATE PROC---------------------------------------------------
CREATE PROC DANGNHAP(@TENDANGNHAP VARCHAR(200), @MATKHAU VARCHAR(200)) AS
BEGIN
	IF EXISTS (SELECT * FROM TAIKHOAN WHERE TENDANGNHAP = @TENDANGNHAP AND MATKHAU = @MATKHAU AND TRANGTHAI = 1) BEGIN
		SELECT * FROM TAIKHOAN WHERE TENDANGNHAP = @TENDANGNHAP AND MATKHAU = @MATKHAU
	END 
END
GO
CREATE PROC DANGKY(@TENDANGNHAP VARCHAR(200), @MATKHAU VARCHAR(200)) AS
BEGIN
	IF NOT EXISTS (SELECT * FROM TAIKHOAN WHERE TENDANGNHAP = @TENDANGNHAP) BEGIN
		INSERT TAIKHOAN (TENDANGNHAP, MATKHAU, TRANGTHAI, IDLOAITAIKHOAN) VALUES (@TENDANGNHAP, @MATKHAU, 1, 3)
		SELECT * FROM TAIKHOAN WHERE TENDANGNHAP = @TENDANGNHAP AND MATKHAU = @MATKHAU
	END
END
GO
CREATE PROC THEMTAIKHOAN(@TENDANGNHAP VARCHAR(200), @MATKHAU VARCHAR(200), @TRANGTHAI INT, @IDLOAITAIKHOAN INT) AS
BEGIN
	IF NOT EXISTS (SELECT * FROM TAIKHOAN WHERE TENDANGNHAP = @TENDANGNHAP) BEGIN
		INSERT TAIKHOAN (TENDANGNHAP, MATKHAU, TRANGTHAI, IDLOAITAIKHOAN) VALUES (@TENDANGNHAP, @MATKHAU, @TRANGTHAI, @IDLOAITAIKHOAN)
		SELECT * FROM TAIKHOAN WHERE TENDANGNHAP = @TENDANGNHAP AND MATKHAU = @MATKHAU
	END
END
GO
CREATE PROC THEMPHONG(@SOPHONG INT, @TENPHONG NVARCHAR(200), @MOTAPHONG NVARCHAR(1500), @GIAPHONG DECIMAL(18,0), @SOLUONGGIOUNGPHONG INT, @SOLUONGPHONGTAM INT, @TENDDANGNHAP VARCHAR(200), @IDLOAIPHONG INT, @TENHINHANHPHONG NVARCHAR(200)) AS
BEGIN
	IF NOT EXISTS (SELECT * FROM PHONG WHERE SOPHONG = @SOPHONG) BEGIN

		DECLARE @DELAYPHONG DECIMAL(3,2)
		SELECT TOP 1 @DELAYPHONG = (DELAYPHONG + 0.1) FROM PHONG ORDER BY DELAYPHONG DESC

		INSERT PHONG (SOPHONG, TENPHONG, MOTAPHONG, GIAPHONG, SOLUONGGIUONGPHONG, SOLUONGPHONGTAM, TENDANGNHAP, IDLOAIPHONG, DELAYPHONG) VALUES (@SOPHONG, @TENPHONG, @MOTAPHONG, @GIAPHONG, @SOLUONGGIOUNGPHONG, @SOLUONGPHONGTAM, @TENDDANGNHAP, @IDLOAIPHONG, @DELAYPHONG)

		DECLARE @IDPHONG INT
		SELECT @IDPHONG = IDPHONG FROM PHONG WHERE SOPHONG = @SOPHONG

		INSERT HINHANHPHONG (TENHINHANHPHONG, IDPHONG, VITRI) VALUES (@TENHINHANHPHONG, @IDPHONG, 1)

		SELECT P.* FROM PHONG AS P, HINHANHPHONG AS HAP WHERE P.IDPHONG = HAP.IDPHONG AND P.IDPHONG = @IDPHONG

	END
END
GO 
CREATE PROC XOAPHONG(@IDPHONG INT) AS
BEGIN
	IF EXISTS (SELECT * FROM PHONG WHERE IDPHONG = @IDPHONG) BEGIN
		DELETE HINHANHPHONG WHERE IDPHONG = @IDPHONG
		
		DELETE PHONG WHERE IDPHONG = @IDPHONG

		IF NOT EXISTS (SELECT * FROM PHONG WHERE IDPHONG = @IDPHONG) BEGIN
			SELECT TOP 1 * FROM PHONG
		END

	END
END
GO 
CREATE PROC CAPNHATPHONG(@IDPHONG INT, @TENHINHANHPHONG NVARCHAR(200), @SOPHONG INT, @TENPHONG NVARCHAR(200), @MOTAPHONG NVARCHAR(1500), @GIAPHONG DECIMAL(18,0), @SOLUONGGIUONGPHONG INT, @SOLUONGPHONGTAM INT, @IDLOAIPHONG INT) AS
BEGIN
	IF EXISTS (SELECT * FROM PHONG AS P, HINHANHPHONG AS HAP, LOAIPHONG AS LP WHERE P.IDPHONG = @IDPHONG AND P.IDPHONG = HAP.IDPHONG AND LP.IDLOAIPHONG = P.IDLOAIPHONG) BEGIN
		UPDATE PHONG SET SOPHONG = @SOPHONG, TENPHONG = @TENPHONG, MOTAPHONG = @MOTAPHONG, GIAPHONG = @GIAPHONG, SOLUONGGIUONGPHONG = @SOLUONGGIUONGPHONG, SOLUONGPHONGTAM = @SOLUONGPHONGTAM, IDLOAIPHONG = @IDLOAIPHONG WHERE IDPHONG = @IDPHONG
		UPDATE HINHANHPHONG SET TENHINHANHPHONG = @TENHINHANHPHONG WHERE IDPHONG = @IDPHONG

		SELECT P.* FROM PHONG AS P, HINHANHPHONG AS HAP, LOAIPHONG AS LP WHERE P.IDPHONG = @IDPHONG AND P.IDPHONG = HAP.IDPHONG AND LP.IDLOAIPHONG = P.IDLOAIPHONG

	END
END
GO
CREATE PROC THEMLOAIPHONG2(@TENLOAIPHONG NVARCHAR(200), @MOTALOAIPHONG NVARCHAR(200), @TENHINHANHLOAIPHONG NVARCHAR(200)) AS
BEGIN
	IF NOT EXISTS (SELECT * FROM LOAIPHONG WHERE TENLOAIPHONG = @TENLOAIPHONG AND MOTALOAIPHONG = @MOTALOAIPHONG) BEGIN
		INSERT LOAIPHONG (TENLOAIPHONG, MOTALOAIPHONG, TENHINHANHLOAIPHONG) VALUES (@TENLOAIPHONG, @MOTALOAIPHONG, @TENHINHANHLOAIPHONG)

		SELECT * FROM LOAIPHONG WHERE TENLOAIPHONG = @TENLOAIPHONG AND MOTALOAIPHONG = @MOTALOAIPHONG
	END
END
GO
CREATE PROC XOALOAIPHONG(@IDLOAIPHONG INT) AS
BEGIN
	IF EXISTS (SELECT * FROM LOAIPHONG WHERE IDLOAIPHONG = @IDLOAIPHONG) BEGIN
		DELETE HINHANHPHONG WHERE IDPHONG IN (SELECT IDPHONG FROM PHONG WHERE IDLOAIPHONG = @IDLOAIPHONG)

		DELETE PHONG WHERE IDLOAIPHONG = @IDLOAIPHONG

		DELETE LOAIPHONG WHERE IDLOAIPHONG = @IDLOAIPHONG

		IF NOT EXISTS (SELECT * FROM LOAIPHONG WHERE IDLOAIPHONG = @IDLOAIPHONG) BEGIN
			SELECT TOP 1 * FROM LOAIPHONG
		END

	END
END
GO
CREATE PROC CAPNHATLOAIPHONG(@IDLOAIPHONG INT, @TENLOAIPHONG NVARCHAR(200), @MOTALOAIPHONG NVARCHAR(200), @TENHINHANHLOAIPHONG NVARCHAR(2000)) AS
BEGIN
	IF EXISTS (SELECT * FROM LOAIPHONG WHERE IDLOAIPHONG = @IDLOAIPHONG) BEGIN
		IF NOT EXISTS (SELECT * FROM LOAIPHONG WHERE IDLOAIPHONG != @IDLOAIPHONG AND TENLOAIPHONG = @TENLOAIPHONG) BEGIN
			UPDATE LOAIPHONG SET TENLOAIPHONG = @TENLOAIPHONG, MOTALOAIPHONG = @MOTALOAIPHONG, TENHINHANHLOAIPHONG = @TENHINHANHLOAIPHONG WHERE IDLOAIPHONG = @IDLOAIPHONG

			SELECT * FROM LOAIPHONG WHERE IDLOAIPHONG = @IDLOAIPHONG AND TENLOAIPHONG = @TENLOAIPHONG
		END
	END
END
GO
CREATE PROC BOOKPHONG(@TEN NVARCHAR(200), @EMAIL VARCHAR(200), @CHECKIN DATETIME2(0), @CHECKOUT DATETIME2(0), @TENDANGNHAP VARCHAR(200), @IDLOAIPHONG INT, @NGUOILON INT, @TREEM INT, @GHICHU NVARCHAR(200), @SOPHONG INT) AS
BEGIN
	DECLARE @IDPHONGMOI INT, @CHECK INT; 

	SELECT @CHECK = COUNT(*) FROM PHONG AS P , HINHANHPHONG AS HAP, LOAIPHONG AS LP WHERE P.IDPHONG = HAP.IDPHONG AND HAP.VITRI = 1 AND LP.IDLOAIPHONG = P.IDLOAIPHONG AND P.IDLOAIPHONG = @IDLOAIPHONG
	IF(@CHECK = 2) BEGIN
		IF EXISTS (SELECT * FROM PHONG WHERE SOPHONG = @SOPHONG) BEGIN
			IF(@SOPHONG % 2= 0) BEGIN
				SELECT TOP 1 @IDPHONGMOI = P.IDPHONG FROM PHONG AS P WHERE P.SOPHONG % 2 = 0 AND P.IDLOAIPHONG = @IDLOAIPHONG AND P.IDPHONG NOT IN (SELECT DP.IDPHONG FROM DATPHONG AS DP WHERE @CHECKIN BETWEEN DP.CHECKIN AND DP.CHECKOUT OR @CHECKOUT BETWEEN DP.CHECKIN AND DP.CHECKOUT OR (DP.CHECKIN BETWEEN @CHECKIN AND @CHECKOUT AND DP.CHECKOUT BETWEEN @CHECKIN AND @CHECKOUT)) ORDER BY P.SOPHONG 
			END ELSE BEGIN
					SELECT TOP 1 @IDPHONGMOI = P.IDPHONG FROM PHONG AS P WHERE P.SOPHONG % 2 <> 0 AND P.IDLOAIPHONG = @IDLOAIPHONG AND P.IDPHONG NOT IN (SELECT DP.IDPHONG FROM DATPHONG AS DP WHERE @CHECKIN BETWEEN DP.CHECKIN AND DP.CHECKOUT OR @CHECKOUT BETWEEN DP.CHECKIN AND DP.CHECKOUT OR (DP.CHECKIN BETWEEN @CHECKIN AND @CHECKOUT AND DP.CHECKOUT BETWEEN @CHECKIN AND @CHECKOUT)) ORDER BY P.SOPHONG 
				END
		END
		INSERT DATPHONG (IDPHONG, CHECKIN, CHECKOUT, NGUOILON, TREEM, GHICHU, TENDANGNHAP, IDTRANGTHAIDATPHONG) VALUES (@IDPHONGMOI, @CHECKIN, @CHECKOUT, @NGUOILON, @TREEM, @GHICHU, @TENDANGNHAP, (SELECT TOP 1 IDTRANGTHAIDATPHONG FROM TRANGTHAIDATPHONG ORDER BY IDTRANGTHAIDATPHONG))
		IF NOT EXISTS (SELECT * FROM THONGTINKHACHHANG WHERE TENDANGNHAP = @TENDANGNHAP) BEGIN
			INSERT THONGTINKHACHHANG (TEN, EMAIL, TENDANGNHAP) VALUES (@TEN, @EMAIL, @TENDANGNHAP)
		END ELSE BEGIN
			UPDATE THONGTINKHACHHANG SET TEN = @TEN, EMAIL = @EMAIL WHERE TENDANGNHAP = @TENDANGNHAP
		END
	END ELSE BEGIN 
			SELECT TOP 1 @IDPHONGMOI = P.IDPHONG FROM PHONG AS P WHERE P.IDLOAIPHONG = @IDLOAIPHONG AND P.IDPHONG NOT IN (SELECT DP.IDPHONG FROM DATPHONG AS DP WHERE @CHECKIN BETWEEN DP.CHECKIN AND DP.CHECKOUT OR @CHECKOUT BETWEEN DP.CHECKIN AND DP.CHECKOUT OR (DP.CHECKIN BETWEEN @CHECKIN AND @CHECKOUT AND DP.CHECKOUT BETWEEN @CHECKIN AND @CHECKOUT)) ORDER BY P.SOPHONG 
			INSERT DATPHONG (IDPHONG, CHECKIN, CHECKOUT, NGUOILON, TREEM, GHICHU, TENDANGNHAP, IDTRANGTHAIDATPHONG) VALUES (@IDPHONGMOI, @CHECKIN, @CHECKOUT, @NGUOILON, @TREEM, @GHICHU, @TENDANGNHAP, (SELECT TOP 1 IDTRANGTHAIDATPHONG FROM TRANGTHAIDATPHONG ORDER BY IDTRANGTHAIDATPHONG))
			IF NOT EXISTS (SELECT * FROM THONGTINKHACHHANG WHERE TENDANGNHAP = @TENDANGNHAP) BEGIN
				INSERT THONGTINKHACHHANG (TEN, EMAIL, TENDANGNHAP) VALUES (@TEN, @EMAIL, @TENDANGNHAP)
			END ELSE BEGIN
				UPDATE THONGTINKHACHHANG SET TEN = @TEN, EMAIL = @EMAIL WHERE TENDANGNHAP = @TENDANGNHAP
			END
		END
		SELECT * FROM DATPHONG WHERE IDPHONG = @IDPHONGMOI
END
GO

--EXEC BOOKPHONG 
--    @TEN = N'Nguyễn Văn DUNG', 
--    @EMAIL = 'nguyenvana@email.com', 
--    @CHECKIN = '2025-03-02',  -- Ngày này đã có phòng 101 đặt trước
--    @CHECKOUT = '2025-03-06', 
--    @TENDANGNHAP = 'DUNG', 
--    @IDLOAIPHONG = 2, 
--    @NGUOILON = 2, 
--    @TREEM = 1, 
--    @GHICHU = N'Khách test',
--	@SOPHONG = 202;
--GO
--SELECT * FROM DATPHONG

--DELETE DATPHONG

--DECLARE @IDPHONGMOI INT;
--SELECT TOP 1 @IDPHONGMOI = P.IDPHONG FROM PHONG AS P WHERE P.IDLOAIPHONG = 1 AND P.IDPHONG NOT IN (SELECT DP.IDPHONG FROM DATPHONG AS DP WHERE '2025-02-24 23:29:00' BETWEEN DP.CHECKIN AND DP.CHECKOUT OR '2025-02-25 23:29:00' BETWEEN DP.CHECKIN AND DP.CHECKOUT) ORDER BY P.SOPHONG 
--PRINT @IDPHONGMOI


--SELECT * FROM DATPHONG AS DP, TAIKHOAN AS TK, PHONG AS P WHERE DP.TENDANGNHAP = TK.TENDANGNHAP AND DP.TENDANGNHAP = 'DUNG' AND DP.IDPHONG = P.IDPHONG 
--GO
--SELECT * FROM PHONG WHERE IDLOAIPHONG = 1
--GO

CREATE PROC THEMPHONGNHANBAN2(@IDLOAIPHONG INT, @SOPHONG INT) 
AS
BEGIN
    DECLARE @SOPHONGMOI INT, @CHECK INT;
    
    -- Kiểm tra IDLOAIPHONG có tồn tại không
    IF EXISTS (SELECT 1 FROM LOAIPHONG WHERE IDLOAIPHONG = @IDLOAIPHONG) 
    BEGIN
        -- Kiểm tra SOPHONG đã tồn tại chưa
        IF EXISTS (SELECT 1 FROM PHONG WHERE SOPHONG = @SOPHONG) 
        BEGIN
			SELECT @CHECK = COUNT(*) FROM PHONG AS P , HINHANHPHONG AS HAP, LOAIPHONG AS LP WHERE P.IDPHONG = HAP.IDPHONG AND HAP.VITRI = 1 AND LP.IDLOAIPHONG = P.IDLOAIPHONG AND P.IDLOAIPHONG = @IDLOAIPHONG
			IF(@CHECK = 2) BEGIN
				IF (@SOPHONG % 2 = 0)
				BEGIN
					SELECT @SOPHONGMOI = MAX(P.SOPHONG) 
					FROM PHONG AS P 
					WHERE P.IDLOAIPHONG = @IDLOAIPHONG AND P.SOPHONG % 2 = 0;
				END
				ELSE 
				BEGIN
						SELECT @SOPHONGMOI = MAX(P.SOPHONG) 
						FROM PHONG AS P 
						WHERE P.IDLOAIPHONG = @IDLOAIPHONG AND P.SOPHONG % 2 <> 0;
						
					END

				INSERT INTO PHONG(SOPHONG, IDLOAIPHONG) VALUES (@SOPHONGMOI + 2, @IDLOAIPHONG);
                SELECT * FROM PHONG WHERE SOPHONG = @SOPHONGMOI + 2;

				END 
				ELSE
				BEGIN
						SELECT @SOPHONGMOI = MAX(P.SOPHONG) 
						FROM PHONG AS P 
						WHERE P.IDLOAIPHONG = @IDLOAIPHONG

						INSERT INTO PHONG(SOPHONG, IDLOAIPHONG) VALUES (@SOPHONGMOI + 1, @IDLOAIPHONG);
						SELECT * FROM PHONG WHERE SOPHONG = @SOPHONGMOI + 1;
				END
        END
    END
END
GO
CREATE PROC XOAPHONGNHANBAN (
    @IDLOAIPHONG INT, 
    @SOPHONG INT
) 
AS
BEGIN
    DECLARE @SOPHONGMOI INT, @CHECK INT;
    
    -- Kiểm tra IDLOAIPHONG có tồn tại không
    IF EXISTS (SELECT 1 FROM LOAIPHONG WHERE IDLOAIPHONG = @IDLOAIPHONG) 
    BEGIN
        -- Kiểm tra SOPHONG đã tồn tại chưa
        IF EXISTS (SELECT 1 FROM PHONG WHERE SOPHONG = @SOPHONG) 
        BEGIN
			SELECT @CHECK = COUNT(*) FROM PHONG AS P , HINHANHPHONG AS HAP, LOAIPHONG AS LP WHERE P.IDPHONG = HAP.IDPHONG AND HAP.VITRI = 1 AND LP.IDLOAIPHONG = P.IDLOAIPHONG AND P.IDLOAIPHONG = @IDLOAIPHONG
            IF (@CHECK = 2) 
            BEGIN
                -- Nếu SOPHONG là số chẵn
                IF (@SOPHONG % 2 = 0)
                BEGIN
                    SELECT @SOPHONGMOI = MAX(P.SOPHONG) 
                    FROM PHONG AS P 
                    WHERE P.IDLOAIPHONG = @IDLOAIPHONG AND P.SOPHONG % 2 = 0;
                END
                ELSE 
                BEGIN
                    SELECT @SOPHONGMOI = MAX(P.SOPHONG) 
                    FROM PHONG AS P 
                    WHERE P.IDLOAIPHONG = @IDLOAIPHONG AND P.SOPHONG % 2 <> 0;
                END

                DELETE FROM PHONG WHERE SOPHONG = @SOPHONGMOI;
                SELECT TOP 1 * FROM PHONG;
            END 
            ELSE
            BEGIN
                SELECT @SOPHONGMOI = MAX(P.SOPHONG) 
                FROM PHONG AS P 
                WHERE P.IDLOAIPHONG = @IDLOAIPHONG;

                DELETE FROM PHONG WHERE SOPHONG = @SOPHONGMOI;
                SELECT TOP 1 * FROM PHONG;
            END
        END
    END
END
GO
--CREATE PROC PHONGDAT2(@TENDANGNHAP NVARCHAR(200)) 
--AS
--BEGIN
--    DECLARE @COUNT_LOAIPHONG INT;
--    DECLARE @SOPHONG_MIN INT;
--    DECLARE @CHECK INT;
--    DECLARE @IDLOAIPHONG INT;

--    -- Kiểm tra số lượng loại phòng có ảnh vị trí 1
--    SELECT @COUNT_LOAIPHONG = COUNT(DISTINCT LP.IDLOAIPHONG)
--    FROM PHONG AS P
--    JOIN HINHANHPHONG AS HAP ON P.IDPHONG = HAP.IDPHONG
--    JOIN LOAIPHONG AS LP ON P.IDLOAIPHONG = LP.IDLOAIPHONG
--    WHERE HAP.VITRI = 1;

--    -- Nếu có ít nhất 2 loại phòng, kiểm tra SOPHONG chẵn/lẻ
--    IF @COUNT_LOAIPHONG >= 2
--    BEGIN
--        SELECT TOP 1 @SOPHONG_MIN = SOPHONG
--        FROM PHONG 
--        WHERE SOPHONG % 2 = 0
--        ORDER BY SOPHONG ASC;

--        -- Nếu không có SOPHONG chia hết cho 2, lấy số nhỏ nhất không chia hết cho 2
--        IF @SOPHONG_MIN IS NULL
--        BEGIN
--            SELECT TOP 1 @SOPHONG_MIN = SOPHONG
--            FROM PHONG 
--            WHERE SOPHONG % 2 <> 0
--            ORDER BY SOPHONG ASC;
--        END
--    END

--    IF(@TENDANGNHAP = 'ADMIN') BEGIN
--		-- Lấy thông tin đặt phòng + hình ảnh
--    SELECT 
--		DP.IDPHONG,
--		DP.TENDANGNHAP,
--        DP.IDDATPHONG,
--        P1.SOPHONG, 
--		COALESCE(HAP1.TENHINHANHPHONG, HAP2.TENHINHANHPHONG) AS TENHINHANHPHONG,
--        COALESCE(P1.TENPHONG, P2.TENPHONG) AS TENPHONG, 
--        COALESCE(P1.GIAPHONG, P2.GIAPHONG) AS GIAPHONG, 
--        DP.CHECKIN, 
--        DP.CHECKOUT, 
--        DP.NGUOILON, 
--        DP.TREEM, 
--		DP.GHICHU,
--		DP.IDTRANGTHAIDATPHONG
--    FROM DATPHONG AS DP 
--    JOIN PHONG AS P1 ON DP.IDPHONG = P1.IDPHONG
--    LEFT JOIN (
--        -- Lấy phòng cùng loại với IDLOAIPHONG của P1
--        SELECT IDLOAIPHONG, MIN(SOPHONG) AS SOPHONG_NHO_NHAT, 
--               MIN(TENPHONG) AS TENPHONG, MIN(GIAPHONG) AS GIAPHONG
--        FROM PHONG 
--        WHERE TENPHONG IS NOT NULL AND GIAPHONG IS NOT NULL
--        GROUP BY IDLOAIPHONG
--    ) AS P2 ON P1.IDLOAIPHONG = P2.IDLOAIPHONG
--        AND (P1.TENPHONG IS NULL OR P1.GIAPHONG IS NULL) -- Chỉ thay thế nếu bị NULL

--    -- Kiểm tra số lượng hình ảnh vị trí 1 trong loại phòng
--    LEFT JOIN (
--        SELECT P.IDLOAIPHONG, COUNT(*) AS CHECK_HINHANH
--        FROM PHONG AS P
--        JOIN HINHANHPHONG AS HAP ON P.IDPHONG = HAP.IDPHONG
--        WHERE HAP.VITRI = 1
--        GROUP BY P.IDLOAIPHONG
--    ) AS C ON P1.IDLOAIPHONG = C.IDLOAIPHONG
    
--    -- Lấy ảnh chẵn/lẻ nếu @CHECK = 2
--    LEFT JOIN (
--        SELECT P.IDLOAIPHONG, P.SOPHONG, MIN(HAP.TENHINHANHPHONG) AS TENHINHANHPHONG
--        FROM PHONG AS P
--        JOIN HINHANHPHONG AS HAP ON P.IDPHONG = HAP.IDPHONG
--        WHERE HAP.VITRI = 1
--        GROUP BY P.IDLOAIPHONG, P.SOPHONG
--    ) AS HAP1 ON P1.IDLOAIPHONG = HAP1.IDLOAIPHONG
--        AND ((C.CHECK_HINHANH = 2 AND P1.SOPHONG % 2 = HAP1.SOPHONG % 2) OR C.CHECK_HINHANH <> 2) -- Chẵn lẻ khi CHECK = 2, còn lại lấy min

--    -- Nếu không tìm thấy ảnh theo chẵn/lẻ, lấy ảnh của SOPHONG nhỏ nhất trong loại phòng đó
--    LEFT JOIN (
--        SELECT P.IDLOAIPHONG, MIN(P.SOPHONG) AS SOPHONG_NHO_NHAT, 
--               MIN(HAP.TENHINHANHPHONG) AS TENHINHANHPHONG
--        FROM PHONG AS P
--        JOIN HINHANHPHONG AS HAP ON P.IDPHONG = HAP.IDPHONG
--        WHERE HAP.VITRI = 1
--        GROUP BY P.IDLOAIPHONG
--    ) AS HAP2 ON P1.IDLOAIPHONG = HAP2.IDLOAIPHONG
--        AND C.CHECK_HINHANH <> 2 -- Chỉ lấy khi CHECK <> 2

--    ORDER BY DP.IDDATPHONG DESC
--	END ELSE BEGIN
--			-- Lấy thông tin đặt phòng + hình ảnh
--    SELECT 
--		DP.IDPHONG,
--		DP.TENDANGNHAP,
--        DP.IDDATPHONG,
--        P1.SOPHONG, 
--		COALESCE(HAP1.TENHINHANHPHONG, HAP2.TENHINHANHPHONG) AS TENHINHANHPHONG,
--        COALESCE(P1.TENPHONG, P2.TENPHONG) AS TENPHONG, 
--        COALESCE(P1.GIAPHONG, P2.GIAPHONG) AS GIAPHONG, 
--        DP.CHECKIN, 
--        DP.CHECKOUT, 
--        DP.NGUOILON, 
--        DP.TREEM, 
--		DP.GHICHU,
--		DP.IDTRANGTHAIDATPHONG
--    FROM DATPHONG AS DP 
--    JOIN PHONG AS P1 ON DP.IDPHONG = P1.IDPHONG
--    LEFT JOIN (
--        -- Lấy phòng cùng loại với IDLOAIPHONG của P1
--        SELECT IDLOAIPHONG, MIN(SOPHONG) AS SOPHONG_NHO_NHAT, 
--               MIN(TENPHONG) AS TENPHONG, MIN(GIAPHONG) AS GIAPHONG
--        FROM PHONG 
--        WHERE TENPHONG IS NOT NULL AND GIAPHONG IS NOT NULL
--        GROUP BY IDLOAIPHONG
--    ) AS P2 ON P1.IDLOAIPHONG = P2.IDLOAIPHONG
--        AND (P1.TENPHONG IS NULL OR P1.GIAPHONG IS NULL) -- Chỉ thay thế nếu bị NULL

--    -- Kiểm tra số lượng hình ảnh vị trí 1 trong loại phòng
--    LEFT JOIN (
--        SELECT P.IDLOAIPHONG, COUNT(*) AS CHECK_HINHANH
--        FROM PHONG AS P
--        JOIN HINHANHPHONG AS HAP ON P.IDPHONG = HAP.IDPHONG
--        WHERE HAP.VITRI = 1
--        GROUP BY P.IDLOAIPHONG
--    ) AS C ON P1.IDLOAIPHONG = C.IDLOAIPHONG
    
--    -- Lấy ảnh chẵn/lẻ nếu @CHECK = 2
--    LEFT JOIN (
--        SELECT P.IDLOAIPHONG, P.SOPHONG, MIN(HAP.TENHINHANHPHONG) AS TENHINHANHPHONG
--        FROM PHONG AS P
--        JOIN HINHANHPHONG AS HAP ON P.IDPHONG = HAP.IDPHONG
--        WHERE HAP.VITRI = 1
--        GROUP BY P.IDLOAIPHONG, P.SOPHONG
--    ) AS HAP1 ON P1.IDLOAIPHONG = HAP1.IDLOAIPHONG
--        AND ((C.CHECK_HINHANH = 2 AND P1.SOPHONG % 2 = HAP1.SOPHONG % 2) OR C.CHECK_HINHANH <> 2) -- Chẵn lẻ khi CHECK = 2, còn lại lấy min

--    -- Nếu không tìm thấy ảnh theo chẵn/lẻ, lấy ảnh của SOPHONG nhỏ nhất trong loại phòng đó
--    LEFT JOIN (
--        SELECT P.IDLOAIPHONG, MIN(P.SOPHONG) AS SOPHONG_NHO_NHAT, 
--               MIN(HAP.TENHINHANHPHONG) AS TENHINHANHPHONG
--        FROM PHONG AS P
--        JOIN HINHANHPHONG AS HAP ON P.IDPHONG = HAP.IDPHONG
--        WHERE HAP.VITRI = 1
--        GROUP BY P.IDLOAIPHONG
--    ) AS HAP2 ON P1.IDLOAIPHONG = HAP2.IDLOAIPHONG
--        AND C.CHECK_HINHANH <> 2 -- Chỉ lấy khi CHECK <> 2

--    WHERE DP.TENDANGNHAP = @TENDANGNHAP ORDER BY DP.IDDATPHONG DESC
--		END
--END;


CREATE PROC PHONGDAT2(@TENDANGNHAP NVARCHAR(200)) 
AS
BEGIN
    DECLARE @COUNT_LOAIPHONG INT;
    DECLARE @SOPHONG_MIN INT;
    DECLARE @CHECK INT;
    DECLARE @IDLOAIPHONG INT;

    -- Kiểm tra số lượng loại phòng có ảnh vị trí 1
    SELECT @COUNT_LOAIPHONG = COUNT(DISTINCT LP.IDLOAIPHONG)
    FROM PHONG AS P
    JOIN HINHANHPHONG AS HAP ON P.IDPHONG = HAP.IDPHONG
    JOIN LOAIPHONG AS LP ON P.IDLOAIPHONG = LP.IDLOAIPHONG
    WHERE HAP.VITRI = 1;

    -- Nếu có ít nhất 2 loại phòng, kiểm tra SOPHONG chẵn/lẻ
    IF @COUNT_LOAIPHONG >= 2
    BEGIN
        SELECT TOP 1 @SOPHONG_MIN = SOPHONG
        FROM PHONG 
        WHERE SOPHONG % 2 = 0
        ORDER BY SOPHONG ASC;

        -- Nếu không có SOPHONG chia hết cho 2, lấy số nhỏ nhất không chia hết cho 2
        IF @SOPHONG_MIN IS NULL
        BEGIN
            SELECT TOP 1 @SOPHONG_MIN = SOPHONG
            FROM PHONG 
            WHERE SOPHONG % 2 <> 0
            ORDER BY SOPHONG ASC;
        END
    END

    IF(@TENDANGNHAP = 'ADMIN') BEGIN
		-- Lấy thông tin đặt phòng + hình ảnh
    SELECT 
		DP.IDPHONG,
		DP.TENDANGNHAP,
        DP.IDDATPHONG,
        P1.SOPHONG, 
		COALESCE(HAP1.TENHINHANHPHONG, HAP2.TENHINHANHPHONG) AS TENHINHANHPHONG,
        COALESCE(P1.TENPHONG, P2.TENPHONG) AS TENPHONG, 
        COALESCE(P1.GIAPHONG, P2.GIAPHONG) AS GIAPHONG, 
        DP.CHECKIN, 
        DP.CHECKOUT, 
        DP.NGUOILON, 
        DP.TREEM, 
		DP.GHICHU,
		DP.IDTRANGTHAIDATPHONG
    FROM DATPHONG AS DP 
    JOIN PHONG AS P1 ON DP.IDPHONG = P1.IDPHONG
    LEFT JOIN (
        -- Lấy phòng cùng loại với IDLOAIPHONG của P1
        SELECT IDLOAIPHONG, MIN(SOPHONG) AS SOPHONG_NHO_NHAT, 
               MIN(TENPHONG) AS TENPHONG, MIN(GIAPHONG) AS GIAPHONG
        FROM PHONG 
        WHERE TENPHONG IS NOT NULL AND GIAPHONG IS NOT NULL
        GROUP BY IDLOAIPHONG
    ) AS P2 ON P1.IDLOAIPHONG = P2.IDLOAIPHONG
        AND (P1.TENPHONG IS NULL OR P1.GIAPHONG IS NULL) -- Chỉ thay thế nếu bị NULL

    -- Kiểm tra số lượng hình ảnh vị trí 1 trong loại phòng
    LEFT JOIN (
        SELECT P.IDLOAIPHONG, COUNT(*) AS CHECK_HINHANH
        FROM PHONG AS P
        JOIN HINHANHPHONG AS HAP ON P.IDPHONG = HAP.IDPHONG
        WHERE HAP.VITRI = 1
        GROUP BY P.IDLOAIPHONG
    ) AS C ON P1.IDLOAIPHONG = C.IDLOAIPHONG
    
    -- Lấy ảnh chẵn/lẻ nếu @CHECK = 2
    LEFT JOIN (
        SELECT P.IDLOAIPHONG, P.SOPHONG, MIN(HAP.TENHINHANHPHONG) AS TENHINHANHPHONG
        FROM PHONG AS P
        JOIN HINHANHPHONG AS HAP ON P.IDPHONG = HAP.IDPHONG
        WHERE HAP.VITRI = 1
        GROUP BY P.IDLOAIPHONG, P.SOPHONG
    ) AS HAP1 ON P1.IDLOAIPHONG = HAP1.IDLOAIPHONG
        AND ((C.CHECK_HINHANH = 2 AND P1.SOPHONG % 2 = HAP1.SOPHONG % 2) OR C.CHECK_HINHANH <> 2) -- Chẵn lẻ khi CHECK = 2, còn lại lấy min

    -- Nếu không tìm thấy ảnh theo chẵn/lẻ, lấy ảnh của SOPHONG nhỏ nhất trong loại phòng đó
    LEFT JOIN (
        SELECT P.IDLOAIPHONG, MIN(P.SOPHONG) AS SOPHONG_NHO_NHAT, 
               MIN(HAP.TENHINHANHPHONG) AS TENHINHANHPHONG
        FROM PHONG AS P
        JOIN HINHANHPHONG AS HAP ON P.IDPHONG = HAP.IDPHONG
        WHERE HAP.VITRI = 1
        GROUP BY P.IDLOAIPHONG
    ) AS HAP2 ON P1.IDLOAIPHONG = HAP2.IDLOAIPHONG
        AND C.CHECK_HINHANH <> 2 -- Chỉ lấy khi CHECK <> 2

    ORDER BY DP.IDDATPHONG DESC
	END ELSE IF(@TENDANGNHAP = 'NHANVIENA') BEGIN
		SELECT 
		DP.IDPHONG,
		DP.TENDANGNHAP,
        DP.IDDATPHONG,
        P1.SOPHONG, 
		COALESCE(HAP1.TENHINHANHPHONG, HAP2.TENHINHANHPHONG) AS TENHINHANHPHONG,
        COALESCE(P1.TENPHONG, P2.TENPHONG) AS TENPHONG, 
        COALESCE(P1.GIAPHONG, P2.GIAPHONG) AS GIAPHONG, 
        DP.CHECKIN, 
        DP.CHECKOUT, 
        DP.NGUOILON, 
        DP.TREEM, 
		DP.GHICHU,
		DP.IDTRANGTHAIDATPHONG
    FROM DATPHONG AS DP 
    JOIN PHONG AS P1 ON DP.IDPHONG = P1.IDPHONG
    LEFT JOIN (
        -- Lấy phòng cùng loại với IDLOAIPHONG của P1
        SELECT IDLOAIPHONG, MIN(SOPHONG) AS SOPHONG_NHO_NHAT, 
               MIN(TENPHONG) AS TENPHONG, MIN(GIAPHONG) AS GIAPHONG
        FROM PHONG 
        WHERE TENPHONG IS NOT NULL AND GIAPHONG IS NOT NULL
        GROUP BY IDLOAIPHONG
    ) AS P2 ON P1.IDLOAIPHONG = P2.IDLOAIPHONG
        AND (P1.TENPHONG IS NULL OR P1.GIAPHONG IS NULL) -- Chỉ thay thế nếu bị NULL

    -- Kiểm tra số lượng hình ảnh vị trí 1 trong loại phòng
    LEFT JOIN (
        SELECT P.IDLOAIPHONG, COUNT(*) AS CHECK_HINHANH
        FROM PHONG AS P
        JOIN HINHANHPHONG AS HAP ON P.IDPHONG = HAP.IDPHONG
        WHERE HAP.VITRI = 1
        GROUP BY P.IDLOAIPHONG
    ) AS C ON P1.IDLOAIPHONG = C.IDLOAIPHONG
    
    -- Lấy ảnh chẵn/lẻ nếu @CHECK = 2
    LEFT JOIN (
        SELECT P.IDLOAIPHONG, P.SOPHONG, MIN(HAP.TENHINHANHPHONG) AS TENHINHANHPHONG
        FROM PHONG AS P
        JOIN HINHANHPHONG AS HAP ON P.IDPHONG = HAP.IDPHONG
        WHERE HAP.VITRI = 1
        GROUP BY P.IDLOAIPHONG, P.SOPHONG
    ) AS HAP1 ON P1.IDLOAIPHONG = HAP1.IDLOAIPHONG
        AND ((C.CHECK_HINHANH = 2 AND P1.SOPHONG % 2 = HAP1.SOPHONG % 2) OR C.CHECK_HINHANH <> 2) -- Chẵn lẻ khi CHECK = 2, còn lại lấy min

    -- Nếu không tìm thấy ảnh theo chẵn/lẻ, lấy ảnh của SOPHONG nhỏ nhất trong loại phòng đó
    LEFT JOIN (
        SELECT P.IDLOAIPHONG, MIN(P.SOPHONG) AS SOPHONG_NHO_NHAT, 
               MIN(HAP.TENHINHANHPHONG) AS TENHINHANHPHONG
        FROM PHONG AS P
        JOIN HINHANHPHONG AS HAP ON P.IDPHONG = HAP.IDPHONG
        WHERE HAP.VITRI = 1
        GROUP BY P.IDLOAIPHONG
    ) AS HAP2 ON P1.IDLOAIPHONG = HAP2.IDLOAIPHONG
        AND C.CHECK_HINHANH <> 2 -- Chỉ lấy khi CHECK <> 2

    ORDER BY DP.IDDATPHONG DESC

	END ELSE BEGIN
			-- Lấy thông tin đặt phòng + hình ảnh
    SELECT 
		DP.IDPHONG,
		DP.TENDANGNHAP,
        DP.IDDATPHONG,
        P1.SOPHONG, 
		COALESCE(HAP1.TENHINHANHPHONG, HAP2.TENHINHANHPHONG) AS TENHINHANHPHONG,
        COALESCE(P1.TENPHONG, P2.TENPHONG) AS TENPHONG, 
        COALESCE(P1.GIAPHONG, P2.GIAPHONG) AS GIAPHONG, 
        DP.CHECKIN, 
        DP.CHECKOUT, 
        DP.NGUOILON, 
        DP.TREEM, 
		DP.GHICHU,
		DP.IDTRANGTHAIDATPHONG
    FROM DATPHONG AS DP 
    JOIN PHONG AS P1 ON DP.IDPHONG = P1.IDPHONG
    LEFT JOIN (
        -- Lấy phòng cùng loại với IDLOAIPHONG của P1
        SELECT IDLOAIPHONG, MIN(SOPHONG) AS SOPHONG_NHO_NHAT, 
               MIN(TENPHONG) AS TENPHONG, MIN(GIAPHONG) AS GIAPHONG
        FROM PHONG 
        WHERE TENPHONG IS NOT NULL AND GIAPHONG IS NOT NULL
        GROUP BY IDLOAIPHONG
    ) AS P2 ON P1.IDLOAIPHONG = P2.IDLOAIPHONG
        AND (P1.TENPHONG IS NULL OR P1.GIAPHONG IS NULL) -- Chỉ thay thế nếu bị NULL

    -- Kiểm tra số lượng hình ảnh vị trí 1 trong loại phòng
    LEFT JOIN (
        SELECT P.IDLOAIPHONG, COUNT(*) AS CHECK_HINHANH
        FROM PHONG AS P
        JOIN HINHANHPHONG AS HAP ON P.IDPHONG = HAP.IDPHONG
        WHERE HAP.VITRI = 1
        GROUP BY P.IDLOAIPHONG
    ) AS C ON P1.IDLOAIPHONG = C.IDLOAIPHONG
    
    -- Lấy ảnh chẵn/lẻ nếu @CHECK = 2
    LEFT JOIN (
        SELECT P.IDLOAIPHONG, P.SOPHONG, MIN(HAP.TENHINHANHPHONG) AS TENHINHANHPHONG
        FROM PHONG AS P
        JOIN HINHANHPHONG AS HAP ON P.IDPHONG = HAP.IDPHONG
        WHERE HAP.VITRI = 1
        GROUP BY P.IDLOAIPHONG, P.SOPHONG
    ) AS HAP1 ON P1.IDLOAIPHONG = HAP1.IDLOAIPHONG
        AND ((C.CHECK_HINHANH = 2 AND P1.SOPHONG % 2 = HAP1.SOPHONG % 2) OR C.CHECK_HINHANH <> 2) -- Chẵn lẻ khi CHECK = 2, còn lại lấy min

    -- Nếu không tìm thấy ảnh theo chẵn/lẻ, lấy ảnh của SOPHONG nhỏ nhất trong loại phòng đó
    LEFT JOIN (
        SELECT P.IDLOAIPHONG, MIN(P.SOPHONG) AS SOPHONG_NHO_NHAT, 
               MIN(HAP.TENHINHANHPHONG) AS TENHINHANHPHONG
        FROM PHONG AS P
        JOIN HINHANHPHONG AS HAP ON P.IDPHONG = HAP.IDPHONG
        WHERE HAP.VITRI = 1
        GROUP BY P.IDLOAIPHONG
    ) AS HAP2 ON P1.IDLOAIPHONG = HAP2.IDLOAIPHONG
        AND C.CHECK_HINHANH <> 2 -- Chỉ lấy khi CHECK <> 2

    WHERE DP.TENDANGNHAP = @TENDANGNHAP ORDER BY DP.IDDATPHONG DESC
		END
END;



GO
CREATE PROC XOAPHONGDAT(@IDDATPHONG INT, @TENDANGNHAP VARCHAR(200)) AS
BEGIN
	IF EXISTS (SELECT * FROM DATPHONG AS DP, TAIKHOAN AS TK WHERE (IDDATPHONG = @IDDATPHONG AND TK.TENDANGNHAP = DP.TENDANGNHAP) OR @TENDANGNHAP = 'ADMIN') BEGIN
		DECLARE @CHECKIN DATETIME2(0) = (SELECT CHECKIN FROM DATPHONG WHERE IDDATPHONG = @IDDATPHONG)
		IF(@CHECKIN > SYSDATETIME() OR @TENDANGNHAP = 'ADMIN') BEGIN
			DELETE DATPHONG WHERE IDDATPHONG = @IDDATPHONG
			IF NOT EXISTS(SELECT * FROM DATPHONG WHERE IDDATPHONG = @IDDATPHONG) BEGIN
				SELECT TOP 1 * FROM DATPHONG
			END
		END
	END
END
GO
--ALTER PROC CAPNHATPHONGDAT(@IDDATPHONG INT, @CHECKIN DATETIME2(0), @CHECKOUT DATETIME2(0), @NGUOILON INT, @TREME INT, @GHICHU NVARCHAR(200), @IDTRANGTHAIDATPHONG INT) AS
--BEGIN
--	IF EXISTS (SELECT * FROM DATPHONG WHERE IDDATPHONG = @IDDATPHONG) BEGIN

--		DECLARE @IDPHONGMOI INT, @CHECK INT, @SOPHONG INT, @IDLOAIPHONG INT; 

--		SELECT @SOPHONG = P.SOPHONG, @IDLOAIPHONG = P.IDLOAIPHONG  FROM DATPHONG AS DP, PHONG AS P WHERE DP.IDPHONG = P.IDPHONG AND DP.IDDATPHONG = @IDDATPHONG

--		SELECT @CHECK = COUNT(*) FROM PHONG AS P , HINHANHPHONG AS HAP, LOAIPHONG AS LP WHERE P.IDPHONG = HAP.IDPHONG AND HAP.VITRI = 1 AND LP.IDLOAIPHONG = P.IDLOAIPHONG AND P.IDLOAIPHONG = @IDLOAIPHONG
--		IF(@CHECK = 2) BEGIN
--			IF EXISTS (SELECT * FROM PHONG WHERE SOPHONG = @SOPHONG) BEGIN
--				IF(@SOPHONG % 2= 0) BEGIN
--					SELECT TOP 1 @IDPHONGMOI = P.IDPHONG FROM PHONG AS P WHERE P.SOPHONG % 2 = 0 AND P.IDLOAIPHONG = @IDLOAIPHONG AND P.IDPHONG NOT IN (SELECT DP.IDPHONG FROM DATPHONG AS DP WHERE @CHECKIN BETWEEN DP.CHECKIN AND DP.CHECKOUT OR @CHECKOUT BETWEEN DP.CHECKIN AND DP.CHECKOUT OR (DP.CHECKIN BETWEEN @CHECKIN AND @CHECKOUT AND DP.CHECKOUT BETWEEN @CHECKIN AND @CHECKOUT)) ORDER BY P.SOPHONG 
--				END ELSE BEGIN
--						SELECT TOP 1 @IDPHONGMOI = P.IDPHONG FROM PHONG AS P WHERE P.SOPHONG % 2 <> 0 AND P.IDLOAIPHONG = @IDLOAIPHONG AND P.IDPHONG NOT IN (SELECT DP.IDPHONG FROM DATPHONG AS DP WHERE @CHECKIN BETWEEN DP.CHECKIN AND DP.CHECKOUT OR @CHECKOUT BETWEEN DP.CHECKIN AND DP.CHECKOUT OR (DP.CHECKIN BETWEEN @CHECKIN AND @CHECKOUT AND DP.CHECKOUT BETWEEN @CHECKIN AND @CHECKOUT)) ORDER BY P.SOPHONG 
--					END
--			END
--			UPDATE DATPHONG SET IDPHONG = @IDPHONGMOI, CHECKIN = @CHECKIN, CHECKOUT = @CHECKOUT, NGUOILON = @NGUOILON, TREEM = @TREME, GHICHU = @GHICHU WHERE IDDATPHONG = @IDDATPHONG
			 
--		END ELSE BEGIN 
--				SELECT TOP 1 @IDPHONGMOI = P.IDPHONG FROM PHONG AS P WHERE P.IDLOAIPHONG = @IDLOAIPHONG AND P.IDPHONG NOT IN (SELECT DP.IDPHONG FROM DATPHONG AS DP WHERE @CHECKIN BETWEEN DP.CHECKIN AND DP.CHECKOUT OR @CHECKOUT BETWEEN DP.CHECKIN AND DP.CHECKOUT OR (DP.CHECKIN BETWEEN @CHECKIN AND @CHECKOUT AND DP.CHECKOUT BETWEEN @CHECKIN AND @CHECKOUT)) ORDER BY P.SOPHONG 
--				UPDATE DATPHONG SET IDPHONG = @IDPHONGMOI, CHECKIN = @CHECKIN, CHECKOUT = @CHECKOUT, NGUOILON = @NGUOILON, TREEM = @TREME, GHICHU = @GHICHU WHERE IDDATPHONG = @IDDATPHONG

--			END

--		IF EXISTS (SELECT * FROM TRANGTHAIDATPHONG WHERE IDTRANGTHAIDATPHONG = @IDTRANGTHAIDATPHONG) BEGIN
--			UPDATE DATPHONG SET IDTRANGTHAIDATPHONG = @IDTRANGTHAIDATPHONG WHERE IDDATPHONG = @IDDATPHONG
--		END
--		SELECT TOP 1 * FROM DATPHONG WHERE IDDATPHONG = @IDDATPHONG
--	END
--END

--ALTER PROC CAPNHATPHONGDAT(@IDDATPHONG INT, @CHECKIN DATETIME2(0), @CHECKOUT DATETIME2(0), @NGUOILON INT, @TREME INT, @GHICHU NVARCHAR(200), @IDTRANGTHAIDATPHONG INT) AS
--BEGIN
--	IF EXISTS (SELECT * FROM DATPHONG WHERE IDDATPHONG = @IDDATPHONG) BEGIN
		
--		DECLARE @IDPHONGMOI INT, @CHECK INT, @SOPHONG INT, @IDLOAIPHONG INT, @DPCHECKIN DATETIME2(0), @DPCHECKOUT DATETIME2(0); 

--		SELECT @SOPHONG = P.SOPHONG, @IDLOAIPHONG = P.IDLOAIPHONG, @DPCHECKIN = DP.CHECKIN, @DPCHECKOUT = DP.CHECKOUT  FROM DATPHONG AS DP, PHONG AS P WHERE DP.IDPHONG = P.IDPHONG AND DP.IDDATPHONG = @IDDATPHONG



--		IF(@DPCHECKIN <> @CHECKIN OR @DPCHECKOUT <> @CHECKOUT) BEGIN

--		SELECT @CHECK = COUNT(*) FROM PHONG AS P , HINHANHPHONG AS HAP, LOAIPHONG AS LP WHERE P.IDPHONG = HAP.IDPHONG AND HAP.VITRI = 1 AND LP.IDLOAIPHONG = P.IDLOAIPHONG AND P.IDLOAIPHONG = @IDLOAIPHONG
--		IF(@CHECK = 2) BEGIN
--			IF EXISTS (SELECT * FROM PHONG WHERE SOPHONG = @SOPHONG) BEGIN
--				IF(@SOPHONG % 2= 0) BEGIN
--					SELECT TOP 1 @IDPHONGMOI = P.IDPHONG FROM PHONG AS P WHERE P.SOPHONG % 2 = 0 AND P.IDLOAIPHONG = @IDLOAIPHONG AND P.IDPHONG NOT IN (SELECT DP.IDPHONG FROM DATPHONG AS DP WHERE @CHECKIN BETWEEN DP.CHECKIN AND DP.CHECKOUT OR @CHECKOUT BETWEEN DP.CHECKIN AND DP.CHECKOUT OR (DP.CHECKIN BETWEEN @CHECKIN AND @CHECKOUT AND DP.CHECKOUT BETWEEN @CHECKIN AND @CHECKOUT)) ORDER BY P.SOPHONG 
--				END ELSE BEGIN
--						SELECT TOP 1 @IDPHONGMOI = P.IDPHONG FROM PHONG AS P WHERE P.SOPHONG % 2 <> 0 AND P.IDLOAIPHONG = @IDLOAIPHONG AND P.IDPHONG NOT IN (SELECT DP.IDPHONG FROM DATPHONG AS DP WHERE @CHECKIN BETWEEN DP.CHECKIN AND DP.CHECKOUT OR @CHECKOUT BETWEEN DP.CHECKIN AND DP.CHECKOUT OR (DP.CHECKIN BETWEEN @CHECKIN AND @CHECKOUT AND DP.CHECKOUT BETWEEN @CHECKIN AND @CHECKOUT)) ORDER BY P.SOPHONG 
--					END
--			END
--			UPDATE DATPHONG SET IDPHONG = @IDPHONGMOI, CHECKIN = @CHECKIN, CHECKOUT = @CHECKOUT, NGUOILON = @NGUOILON, TREEM = @TREME, GHICHU = @GHICHU WHERE IDDATPHONG = @IDDATPHONG
			 
--		END ELSE BEGIN 
--				SELECT TOP 1 @IDPHONGMOI = P.IDPHONG FROM PHONG AS P WHERE P.IDLOAIPHONG = @IDLOAIPHONG AND P.IDPHONG NOT IN (SELECT DP.IDPHONG FROM DATPHONG AS DP WHERE @CHECKIN BETWEEN DP.CHECKIN AND DP.CHECKOUT OR @CHECKOUT BETWEEN DP.CHECKIN AND DP.CHECKOUT OR (DP.CHECKIN BETWEEN @CHECKIN AND @CHECKOUT AND DP.CHECKOUT BETWEEN @CHECKIN AND @CHECKOUT)) ORDER BY P.SOPHONG 
--				UPDATE DATPHONG SET IDPHONG = @IDPHONGMOI, CHECKIN = @CHECKIN, CHECKOUT = @CHECKOUT, NGUOILON = @NGUOILON, TREEM = @TREME, GHICHU = @GHICHU WHERE IDDATPHONG = @IDDATPHONG

--			END

--		END ELSE BEGIN
--			UPDATE DATPHONG SET NGUOILON = @NGUOILON, TREEM = @TREME, GHICHU = @GHICHU WHERE IDDATPHONG = @IDDATPHONG
--		END

--		IF EXISTS (SELECT * FROM TRANGTHAIDATPHONG WHERE IDTRANGTHAIDATPHONG = @IDTRANGTHAIDATPHONG) BEGIN
--			UPDATE DATPHONG SET IDTRANGTHAIDATPHONG = @IDTRANGTHAIDATPHONG WHERE IDDATPHONG = @IDDATPHONG
--		END
--		SELECT TOP 1 * FROM DATPHONG WHERE IDDATPHONG = @IDDATPHONG
--	END
--END

--ALTER PROC CAPNHATPHONGDAT(@IDDATPHONG INT, @CHECKIN DATETIME2(0), @CHECKOUT DATETIME2(0), @NGUOILON INT, @TREME INT, @GHICHU NVARCHAR(200), @IDTRANGTHAIDATPHONG INT) AS
--BEGIN
--	IF EXISTS (SELECT * FROM DATPHONG WHERE IDDATPHONG = @IDDATPHONG) BEGIN

--		DECLARE @IDPHONGMOI INT, @CHECK INT, @SOPHONG INT, @IDLOAIPHONG INT; 

--		SELECT @SOPHONG = P.SOPHONG, @IDLOAIPHONG = P.IDLOAIPHONG  FROM DATPHONG AS DP, PHONG AS P WHERE DP.IDPHONG = P.IDPHONG AND DP.IDDATPHONG = @IDDATPHONG

--		SELECT @CHECK = COUNT(*) FROM PHONG AS P , HINHANHPHONG AS HAP, LOAIPHONG AS LP WHERE P.IDPHONG = HAP.IDPHONG AND HAP.VITRI = 1 AND LP.IDLOAIPHONG = P.IDLOAIPHONG AND P.IDLOAIPHONG = @IDLOAIPHONG
--		IF(@CHECK = 2) BEGIN
--			IF EXISTS (SELECT * FROM PHONG WHERE SOPHONG = @SOPHONG) BEGIN
--				IF(@SOPHONG % 2= 0) BEGIN
--					SELECT TOP 1 @IDPHONGMOI = P.IDPHONG FROM PHONG AS P WHERE P.SOPHONG % 2 = 0 AND P.IDLOAIPHONG = @IDLOAIPHONG AND P.IDPHONG NOT IN (SELECT DP.IDPHONG FROM DATPHONG AS DP WHERE @CHECKIN BETWEEN DP.CHECKIN AND DP.CHECKOUT OR @CHECKOUT BETWEEN DP.CHECKIN AND DP.CHECKOUT OR (DP.CHECKIN BETWEEN @CHECKIN AND @CHECKOUT AND DP.CHECKOUT BETWEEN @CHECKIN AND @CHECKOUT)) ORDER BY P.SOPHONG 
--				END ELSE BEGIN
--						SELECT TOP 1 @IDPHONGMOI = P.IDPHONG FROM PHONG AS P WHERE P.SOPHONG % 2 <> 0 AND P.IDLOAIPHONG = @IDLOAIPHONG AND P.IDPHONG NOT IN (SELECT DP.IDPHONG FROM DATPHONG AS DP WHERE @CHECKIN BETWEEN DP.CHECKIN AND DP.CHECKOUT OR @CHECKOUT BETWEEN DP.CHECKIN AND DP.CHECKOUT OR (DP.CHECKIN BETWEEN @CHECKIN AND @CHECKOUT AND DP.CHECKOUT BETWEEN @CHECKIN AND @CHECKOUT)) ORDER BY P.SOPHONG 
--					END
--			END
--			UPDATE DATPHONG SET IDPHONG = @IDPHONGMOI, CHECKIN = @CHECKIN, CHECKOUT = @CHECKOUT, NGUOILON = @NGUOILON, TREEM = @TREME, GHICHU = @GHICHU WHERE IDDATPHONG = @IDDATPHONG
			 
--		END ELSE BEGIN 
--				SELECT TOP 1 @IDPHONGMOI = P.IDPHONG FROM PHONG AS P WHERE P.IDLOAIPHONG = @IDLOAIPHONG AND P.IDPHONG NOT IN (SELECT DP.IDPHONG FROM DATPHONG AS DP WHERE @CHECKIN BETWEEN DP.CHECKIN AND DP.CHECKOUT OR @CHECKOUT BETWEEN DP.CHECKIN AND DP.CHECKOUT OR (DP.CHECKIN BETWEEN @CHECKIN AND @CHECKOUT AND DP.CHECKOUT BETWEEN @CHECKIN AND @CHECKOUT)) ORDER BY P.SOPHONG 
--				UPDATE DATPHONG SET IDPHONG = @IDPHONGMOI, CHECKIN = @CHECKIN, CHECKOUT = @CHECKOUT, NGUOILON = @NGUOILON, TREEM = @TREME, GHICHU = @GHICHU WHERE IDDATPHONG = @IDDATPHONG

--			END

--		IF EXISTS (SELECT * FROM TRANGTHAIDATPHONG WHERE IDTRANGTHAIDATPHONG = @IDTRANGTHAIDATPHONG) BEGIN
--			UPDATE DATPHONG SET IDTRANGTHAIDATPHONG = @IDTRANGTHAIDATPHONG WHERE IDDATPHONG = @IDDATPHONG
--		END
--		SELECT TOP 1 * FROM DATPHONG WHERE IDDATPHONG = @IDDATPHONG
--	END
--END

CREATE PROC CAPNHATPHONGDAT(@IDDATPHONG INT, @CHECKIN DATETIME2(0), @CHECKOUT DATETIME2(0), @NGUOILON INT, @TREME INT, @GHICHU NVARCHAR(200), @IDTRANGTHAIDATPHONG INT) AS
BEGIN
	IF EXISTS (SELECT * FROM DATPHONG WHERE IDDATPHONG = @IDDATPHONG) BEGIN
		
		DECLARE @IDPHONGMOI INT, @CHECK INT, @SOPHONG INT, @IDLOAIPHONG INT, @DPCHECKIN DATETIME2(0), @DPCHECKOUT DATETIME2(0), @DPTENDANGNHAP VARCHAR(200); 

		SELECT @SOPHONG = P.SOPHONG, @IDLOAIPHONG = P.IDLOAIPHONG, @DPCHECKIN = DP.CHECKIN, @DPCHECKOUT = DP.CHECKOUT, @DPTENDANGNHAP = DP.TENDANGNHAP  FROM DATPHONG AS DP, PHONG AS P WHERE DP.IDPHONG = P.IDPHONG AND DP.IDDATPHONG = @IDDATPHONG

		IF(@DPCHECKIN <> @CHECKIN OR @DPCHECKOUT <> @CHECKOUT) BEGIN

		DELETE DATPHONG WHERE IDDATPHONG = @IDDATPHONG

		SELECT @CHECK = COUNT(*) FROM PHONG AS P , HINHANHPHONG AS HAP, LOAIPHONG AS LP WHERE P.IDPHONG = HAP.IDPHONG AND HAP.VITRI = 1 AND LP.IDLOAIPHONG = P.IDLOAIPHONG AND P.IDLOAIPHONG = @IDLOAIPHONG
		IF(@CHECK = 2) BEGIN
			IF EXISTS (SELECT * FROM PHONG WHERE SOPHONG = @SOPHONG) BEGIN
				IF(@SOPHONG % 2= 0) BEGIN
					SELECT TOP 1 @IDPHONGMOI = P.IDPHONG FROM PHONG AS P WHERE P.SOPHONG % 2 = 0 AND P.IDLOAIPHONG = @IDLOAIPHONG AND P.IDPHONG NOT IN (SELECT DP.IDPHONG FROM DATPHONG AS DP WHERE @CHECKIN BETWEEN DP.CHECKIN AND DP.CHECKOUT OR @CHECKOUT BETWEEN DP.CHECKIN AND DP.CHECKOUT OR (DP.CHECKIN BETWEEN @CHECKIN AND @CHECKOUT AND DP.CHECKOUT BETWEEN @CHECKIN AND @CHECKOUT)) ORDER BY P.SOPHONG 
				END ELSE BEGIN
						SELECT TOP 1 @IDPHONGMOI = P.IDPHONG FROM PHONG AS P WHERE P.SOPHONG % 2 <> 0 AND P.IDLOAIPHONG = @IDLOAIPHONG AND P.IDPHONG NOT IN (SELECT DP.IDPHONG FROM DATPHONG AS DP WHERE @CHECKIN BETWEEN DP.CHECKIN AND DP.CHECKOUT OR @CHECKOUT BETWEEN DP.CHECKIN AND DP.CHECKOUT OR (DP.CHECKIN BETWEEN @CHECKIN AND @CHECKOUT AND DP.CHECKOUT BETWEEN @CHECKIN AND @CHECKOUT)) ORDER BY P.SOPHONG 
					END
			END
			--UPDATE DATPHONG SET IDPHONG = @IDPHONGMOI, CHECKIN = @CHECKIN, CHECKOUT = @CHECKOUT, NGUOILON = @NGUOILON, TREEM = @TREME, GHICHU = @GHICHU WHERE IDDATPHONG = @IDDATPHONG
			INSERT DATPHONG (IDPHONG, CHECKIN, CHECKOUT, NGUOILON, TREEM, GHICHU, TENDANGNHAP, IDTRANGTHAIDATPHONG) VALUES (@IDPHONGMOI, @CHECKIN, @CHECKOUT, @NGUOILON, @TREME, @GHICHU, @DPTENDANGNHAP, (SELECT TOP 1 IDTRANGTHAIDATPHONG FROM TRANGTHAIDATPHONG ORDER BY IDTRANGTHAIDATPHONG))
		END ELSE BEGIN 
				SELECT TOP 1 @IDPHONGMOI = P.IDPHONG FROM PHONG AS P WHERE P.IDLOAIPHONG = @IDLOAIPHONG AND P.IDPHONG NOT IN (SELECT DP.IDPHONG FROM DATPHONG AS DP WHERE @CHECKIN BETWEEN DP.CHECKIN AND DP.CHECKOUT OR @CHECKOUT BETWEEN DP.CHECKIN AND DP.CHECKOUT OR (DP.CHECKIN BETWEEN @CHECKIN AND @CHECKOUT AND DP.CHECKOUT BETWEEN @CHECKIN AND @CHECKOUT)) ORDER BY P.SOPHONG 
				--UPDATE DATPHONG SET IDPHONG = @IDPHONGMOI, CHECKIN = @CHECKIN, CHECKOUT = @CHECKOUT, NGUOILON = @NGUOILON, TREEM = @TREME, GHICHU = @GHICHU WHERE IDDATPHONG = @IDDATPHONG
				INSERT DATPHONG (IDPHONG, CHECKIN, CHECKOUT, NGUOILON, TREEM, GHICHU, TENDANGNHAP, IDTRANGTHAIDATPHONG) VALUES (@IDPHONGMOI, @CHECKIN, @CHECKOUT, @NGUOILON, @TREME, @GHICHU, @DPTENDANGNHAP, (SELECT TOP 1 IDTRANGTHAIDATPHONG FROM TRANGTHAIDATPHONG ORDER BY IDTRANGTHAIDATPHONG))
			END

		END ELSE BEGIN
			UPDATE DATPHONG SET NGUOILON = @NGUOILON, TREEM = @TREME, GHICHU = @GHICHU WHERE IDDATPHONG = @IDDATPHONG
		END

		IF EXISTS (SELECT * FROM TRANGTHAIDATPHONG WHERE IDTRANGTHAIDATPHONG = @IDTRANGTHAIDATPHONG) BEGIN
			UPDATE DATPHONG SET IDTRANGTHAIDATPHONG = @IDTRANGTHAIDATPHONG WHERE IDDATPHONG = @IDDATPHONG
		END
		SELECT TOP 1 * FROM DATPHONG WHERE IDDATPHONG = @IDDATPHONG
	END
END

GO

CREATE PROC CAPNHATPHONGDATTRANGTHAI3(@IDDATPHONG INT, @IDTRANGTHAIDATPHONG INT) AS 
BEGIN
	IF EXISTS (SELECT * FROM DATPHONG WHERE IDDATPHONG = @IDDATPHONG) BEGIN
		UPDATE DATPHONG SET IDTRANGTHAIDATPHONG = @IDTRANGTHAIDATPHONG WHERE IDDATPHONG = @IDDATPHONG
	END
	SELECT TOP(1) * FROM DATPHONG WHERE IDDATPHONG = @IDDATPHONG
END

---------------------------------------------------TEST DATA---------------------------------------------------

DELETE DATPHONG WHERE TENDANGNHAP = 'ADMIN'

SELECT * FROM LOAITAIKHOAN

SELECT * FROM TRANGTHAIDATPHONG

SELECT * FROM DATPHONG 

SELECT COUNT(*) FROM PHONG AS P , HINHANHPHONG AS HAP, LOAIPHONG AS LP WHERE P.IDPHONG = HAP.IDPHONG AND HAP.VITRI = 1 AND LP.IDLOAIPHONG = P.IDLOAIPHONG AND P.IDLOAIPHONG = 2

SELECT * FROM DATPHONG

SELECT 
	DP.IDDATPHONG,
    P1.SOPHONG, 
    COALESCE(P1.TENPHONG, P2.TENPHONG) AS TENPHONG, 
    COALESCE(P1.GIAPHONG, P2.GIAPHONG) AS GIAPHONG, 
    DP.CHECKIN, 
    DP.CHECKOUT, 
    DP.NGUOILON, 
    DP.TREEM 
FROM DATPHONG AS DP
JOIN PHONG AS P1 ON DP.IDPHONG = P1.IDPHONG
LEFT JOIN (
    -- Lấy phòng có SOPHONG nhỏ nhất trong cùng loại, chỉ khi cần thay thế
    SELECT IDLOAIPHONG, MIN(SOPHONG) AS SOPHONG_NHO_NHAT, TENPHONG, GIAPHONG
    FROM PHONG 
    WHERE TENPHONG IS NOT NULL AND GIAPHONG IS NOT NULL
    GROUP BY IDLOAIPHONG, TENPHONG, GIAPHONG
) AS P2 ON P1.IDLOAIPHONG = P2.IDLOAIPHONG
    AND (P1.TENPHONG IS NULL OR P1.GIAPHONG IS NULL) -- Chỉ thay thế nếu bị NULL
WHERE DP.TENDANGNHAP = 'DUNG';


SELECT 
    P1.SOPHONG, 
    COALESCE(P1.TENPHONG, P2.TENPHONG) AS TENPHONG, 
    COALESCE(P1.GIAPHONG, P2.GIAPHONG) AS GIAPHONG, 
    DP.CHECKIN, 
    DP.CHECKOUT, 
    DP.NGUOILON, 
    DP.TREEM 
FROM DATPHONG AS DP
JOIN PHONG AS P1 ON DP.IDPHONG = P1.IDPHONG
LEFT JOIN PHONG AS P2 ON P1.IDLOAIPHONG = P2.IDLOAIPHONG 
    AND P2.TENPHONG IS NOT NULL 
    AND P2.GIAPHONG IS NOT NULL
WHERE DP.TENDANGNHAP = 'DUNG'


SELECT P.SOPHONG, P.TENPHONG, P.GIAPHONG, DP.CHECKIN, DP.CHECKOUT, DP.NGUOILON, DP.TREEM, P.IDLOAIPHONG FROM TAIKHOAN AS TK, DATPHONG AS DP, PHONG AS P, LOAIPHONG AS LP WHERE P.IDLOAIPHONG = LP.IDLOAIPHONG AND DP.IDPHONG = P.IDPHONG AND DP.TENDANGNHAP = TK.TENDANGNHAP AND DP.TENDANGNHAP = 'DUNG'
	
SELECT * FROM PHONG WHERE IDPHONG = 3

SELECT COUNT(*) FROM PHONG AS P, LOAIPHONG AS LP WHERE LP.IDLOAIPHONG = P.IDLOAIPHONG AND LP.IDLOAIPHONG = 1 AND P.SOPHONG % 2 <> 0
GO
SELECT COUNT(*) FROM PHONG AS P, LOAIPHONG AS LP WHERE LP.IDLOAIPHONG = P.IDLOAIPHONG AND LP.IDLOAIPHONG = 2 AND P.SOPHONG % 2 = 0

SELECT * FROM PHONG AS P, LOAIPHONG AS LP WHERE P.IDLOAIPHONG = LP.IDLOAIPHONG AND LP.IDLOAIPHONG = 1

SELECT * FROM PHONG AS P, HINHANHPHONG AS HAP WHERE HAP.IDPHONG = P.IDPHONG AND HAP.TENHINHANHPHONG = 'MySoul-11-1.JPG'

SELECT P.IDPHONG, P.SOPHONG, P.IDLOAIPHONG , HAP.IDHINHANHPHONG, HAP.IDPHONG, HAP.VITRI FROM PHONG AS P, HINHANHPHONG AS HAP WHERE HAP.IDPHONG = P.IDPHONG AND P.IDLOAIPHONG = 1

select MIN(p.IDPHONG) as IDPHONG , p.TENPHONG from PHONG as p, LOAIPHONG as lp where p.IDLOAIPHONG = lp.IDLOAIPHONG  group by p.TENPHONG ORDER BY IDPHONG 
SELECT * FROM LOAIPHONG
DELETE DATPHONG
SELECT * FROM DATPHONG
GO
EXEC BOOKPHONG 
    @TEN = N'Nguyễn Văn DUNG', 
    @EMAIL = 'nguyenvana@email.com', 
    @CHECKIN = '2025-03-02',  -- Ngày này đã có phòng 101 đặt trước
    @CHECKOUT = '2025-03-06', 
    @TENDANGNHAP = 'DUNG', 
    @IDLOAIPHONG = 1, 
    @NGUOILON = 2, 
    @TREEM = 1, 
    @GHICHU = N'Khách test'
	@SOPHONG = 101;
GO
SELECT * FROM DATPHONG

SELECT * FROM PHONG AS P, LOAIPHONG AS LP WHERE P.IDLOAIPHONG = LP.IDLOAIPHONG AND LP.IDLOAIPHONG = 11

SELECT TOP 1 * FROM PHONG AS P WHERE P.IDLOAIPHONG = 1 AND P.IDPHONG IN (SELECT DP.IDPHONG FROM DATPHONG AS DP WHERE '2025-03-02 15:00:00' BETWEEN DP.CHECKIN AND DP.CHECKOUT AND '2025-03-06 12:00:00' BETWEEN DP.CHECKIN AND DP.CHECKOUT) ORDER BY P.SOPHONG 


SELECT * FROM LOAIPHONG
GO
SELECT P.TENPHONG, P.IDPHONG, P.SOPHONG FROM PHONG AS P, LOAIPHONG AS LP WHERE LP.IDLOAIPHONG = P.IDLOAIPHONG 
GO
SELECT * FROM DATPHONG


SELECT * FROM BOOKTESTPHONG AS BP WHERE '2025-10-02 14:00:00' NOT BETWEEN BP.NGAYBOOKTESTPHONG AND BP.TRABOOKTESTPHONG AND '2025-10-02 15:00:00' NOT BETWEEN BP.NGAYBOOKTESTPHONG AND BP.TRABOOKTESTPHONG
GO
SELECT * FROM BOOKTESTPHONG


SELECT COLUMN_NAME, DATA_TYPE, CHARACTER_MAXIMUM_LENGTH
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'PHONG' AND COLUMN_NAME = 'MOTAPHONG'


ALTER TABLE PHONG ALTER COLUMN MOTAPHONG NVARCHAR(MAX)

SELECT P.IDPHONG, HAP.* FROM HINHANHPHONG AS HAP, PHONG AS P WHERE HAP.IDPHONG = P.IDPHONG AND P.IDPHONG = 1

SELECT * FROM HINHANHPHONG

insert HINHANHPHONG (TENHINHANHPHONG, IDPHONG, VITRI)
values
(N'Downstair-768x1024.jpg', 1, 2),
(N'Downstair-768x1024.jpg', 1, 3),
(N'Downstair-768x1024.jpg', 1, 4),
(N'Downstair-768x1024.jpg', 1, 5),
(N'Downstair-768x1024.jpg', 1, 6),
(N'Downstair-768x1024.jpg', 1, 7);


SELECT LP.IDLOAIPHONG, P.TENPHONG, HAP.TENHINHANHPHONG, P.GIAPHONG, P.SOLUONGGIUONGPHONG, P.SOLUONGPHONGTAM, P.MOTAPHONG FROM PHONG AS P, LOAIPHONG AS LP, HINHANHPHONG AS HAP WHERE P.IDPHONG = HAP.IDPHONG AND P.IDLOAIPHONG = LP.IDLOAIPHONG GROUP BY LP.IDLOAIPHONG, P.TENPHONG, HAP.TENHINHANHPHONG, P.GIAPHONG, P.SOLUONGGIUONGPHONG, P.SOLUONGPHONGTAM, P.MOTAPHONG

SELECT * FROM LOAIPHONG
GO
EXEC CAPNHATLOAIPHONG 1, A, NULL, NULL
GO
SELECT * FROM LOAIPHONG

SELECT DISTINCT LP.IDLOAIPHONG, HAP.TENHINHANHPHONG FROM PHONG AS P, HINHANHPHONG AS HAP, LOAIPHONG AS LP WHERE LP.IDLOAIPHONG = P.IDLOAIPHONG AND P.IDPHONG = HAP.IDPHONG AND HAP.VITRI = 1

UPDATE PHONG SET SOLUONGPHONGTAM = 2

EXEC CAPNHATPHONG 
    @IDPHONG = 33, 
    @TENHINHANHPHONG = N'phong_moi.jpg', 
    @SOPHONG = 108, 
    @TENPHONG = N'Phòng VIP Deluxe', 
    @MOTAPHONG = N'Phòng sang trọng với view biển', 
    @GIAPHONG = 2500000, 
    @SOLUONGGIUONGPHONG = 2, 
    @SOLUONGPHONGTAM = 1, 
    @IDLOAIPHONG = 3;


DROP PROC XOAPHONG2

EXEC XOAPHONG 14

EXEC THEMPHONG 
    @SOPHONG = 500, 
    @TENPHONG = N'Phòng Test', 
    @MOTAPHONG = N'Phòng thử nghiệm', 
    @GIAPHONG = 1500000, 
    @SOLUONGGIOUNGPHONG = 2, 
    @SOLUONGPHONGTAM = 1, 
    @TENDDANGNHAP = 'admin', 
    @IDLOAIPHONG = 1, 
    @TENHINHANHPHONG = N'test.jpg';
GO
SELECT * FROM PHONG WHERE SOPHONG = 123;
GO
SELECT HAP.* FROM HINHANHPHONG AS HAP, PHONG AS P WHERE P.IDPHONG = HAP.IDPHONG AND P.SOPHONG = 123

SELECT * FROM LOAITAIKHOAN
GO
SELECT * FROM TAIKHOAN
GO
SELECT * FROM LOAIPHONG
GO
SELECT * FROM PHONG
GO
SELECT * FROM HINHANHPHONG

EXEC THEMTAIKHOAN 'C', '123', 1, 3
INSERT INTO TAIKHOAN (TENDANGNHAP, MATKHAU, TRANGTHAI, IDLOAITAIKHOAN)  
VALUES  
(N'user1', N'password1', 1, 3),  
(N'user2', N'password2', 1, 3),  
(N'user3', N'password3', 1, 3),  
(N'user4', N'password4', 1, 3),  
(N'user5', N'password5', 1, 3),  
(N'user6', N'password6', 1, 3),  
(N'user7', N'password7', 1, 3),  
(N'user8', N'password8', 1, 3),  
(N'user9', N'password9', 1, 3),  
(N'user10', N'password10', 1, 3)

EXEC DANGKY ADMÍN, 123
GO
DELETE TAIKHOAN WHERE TENDANGNHAP = N'ADMÍN'

SELECT * 
FROM TAIKHOAN 
WHERE TENDANGNHAP != N'ADMÍN';

DROP TABLE PHONG
GO
SELECT * FROM HINHANHPHONG

SELECT * FROM TAIKHOAN WHERE TENDANGNHAP = N'ADMÍN'
SELECT * FROM PHONG
delete PHONG
UPDATE PHONG SET GIAPHONG = 1

CREATE TABLE TESTPHONG (IDPHONG INT IDENTITY PRIMARY KEY, TENPHONG NVARCHAR(200), LOAIPHONG NVARCHAR(200))
GO
CREATE TABLE BOOKTESTPHONG (IDBOOKTESTPHONG INT IDENTITY PRIMARY KEY, NGAYBOOKTESTPHONG DATETIME2(0), TRABOOKTESTPHONG DATETIME2(0), IDPHONG INT FOREIGN KEY (IDPHONG) REFERENCES TESTPHONG (IDPHONG))
GO
INSERT INTO TESTPHONG (TENPHONG, LOAIPHONG) 
VALUES 
(N'Phòng Couple', N'COUPLE'),
(N'Phòng Family', N'FAMILY'),
(N'Phòng VIP Family', N'VIPFAMILY');
GO
INSERT INTO BOOKTESTPHONG (NGAYBOOKTESTPHONG, TRABOOKTESTPHONG, IDPHONG)  
VALUES  
('2025-10-02 14:00:00', '2025-10-05 12:00:00', (SELECT IDPHONG FROM TESTPHONG WHERE LOAIPHONG = 'COUPLE')),
('2025-11-15 15:00:00', '2025-11-20 11:00:00', (SELECT IDPHONG FROM TESTPHONG WHERE LOAIPHONG = 'FAMILY')),
('2025-12-01 18:00:00', '2025-12-07 10:00:00', (SELECT IDPHONG FROM TESTPHONG WHERE LOAIPHONG = 'VIPFAMILY'));
GO

SELECT 2 FROM TESTPHONG
GO
SELECT * FROM BOOKTESTPHONG
GO
SELECT * FROM BOOKTESTPHONG AS BP, TESTPHONG AS TP WHERE BP.IDPHONG = TP.IDPHONG

SELECT TOP 1 TP.IDPHONG FROM TESTPHONG AS TP WHERE NOT EXISTS (SELECT * FROM BOOKTESTPHONG AS BP WHERE TP.IDPHONG = BP.IDPHONG AND '2025-10-02 13:00:00' BETWEEN BP.NGAYBOOKTESTPHONG AND BP.TRABOOKTESTPHONG OR '2025-10-02 13:59:00' BETWEEN BP.NGAYBOOKTESTPHONG AND BP.TRABOOKTESTPHONG) AND TP.LOAIPHONG IN ('FAMILY', 'COUPLE', 'VIPFAMILY')
ORDER BY 
    CASE 
        WHEN TP.LOAIPHONG = 'FAMILY' THEN 1 
        WHEN TP.LOAIPHONG = 'COUPLE' THEN 2 
        WHEN TP.LOAIPHONG = 'VIPFAMILY' THEN 3 
        ELSE 4 
    END

SELECT * FROM TESTPHONG AS TP, BOOKTESTPHONG AS BP WHERE TP.IDPHONG = BP.IDPHONG AND '2025-10-02 14:00:00' BETWEEN BP.NGAYBOOKTESTPHONG AND BP.TRABOOKTESTPHONG AND '2025-10-02 15:00:00' BETWEEN BP.NGAYBOOKTESTPHONG AND BP.TRABOOKTESTPHONG

INSERT INTO BOOKTESTPHONG (NGAYBOOKTESTPHONG, TRABOOKTESTPHONG, IDPHONG)  
VALUES  
('2025-10-02 13:00:00', '2025-10-02 13:59:00', (SELECT TOP 1 TP.IDPHONG FROM TESTPHONG AS TP WHERE NOT EXISTS (SELECT * FROM BOOKTESTPHONG AS BP WHERE TP.IDPHONG = BP.IDPHONG AND '2025-10-02 13:00:00' BETWEEN BP.NGAYBOOKTESTPHONG AND BP.TRABOOKTESTPHONG OR '2025-10-02 13:59:00' BETWEEN BP.NGAYBOOKTESTPHONG AND BP.TRABOOKTESTPHONG) AND TP.LOAIPHONG IN ('FAMILY', 'COUPLE', 'VIPFAMILY')
ORDER BY 
    CASE 
        WHEN TP.LOAIPHONG = 'FAMILY' THEN 1 
        WHEN TP.LOAIPHONG = 'COUPLE' THEN 2 
        WHEN TP.LOAIPHONG = 'VIPFAMILY' THEN 3 
        ELSE 4 
    END))