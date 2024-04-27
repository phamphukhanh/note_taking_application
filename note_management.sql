-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 24, 2024 at 07:52 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `note_management`
--

-- --------------------------------------------------------

--
-- Table structure for table `note`
--

CREATE TABLE `note` (
  `id` int(11) NOT NULL,
  `username` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `content` text DEFAULT NULL,
  `date_created` timestamp NOT NULL DEFAULT current_timestamp(),
  `date_modified` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;

--
-- Dumping data for table `note`
--

INSERT INTO `note` (`id`, `username`, `title`, `content`, `date_created`, `date_modified`) VALUES
(6, 'thihong@example.com', 'Công việc', 'Hôm nay tôi đã mua sữa, bánh mỳ, trứng và một số đồ cần thiết khác trước khi về nhà. Sau khi về nhà, tôi đã chuẩn bị bữa ăn tối cho gia đình. Cuối cùng, tôi dành một chút thời gian để đọc sách yêu thích của mình.', '2024-03-23 00:23:56', '2024-03-23 00:23:56'),
(7, 'quynhanh@example.com', 'Lịch hẹn khám bệnh', 'Buổi khám bệnh sẽ diễn ra vào thứ Sáu tuần này. Tôi cần chuẩn bị tinh thần và dọn đồ cần thiết trước.', '2024-03-23 00:23:56', '2024-03-23 00:23:56'),
(8, 'linhngoc@example.com', 'Ghi chú về học tập', 'Hôm nay tôi đã hoàn thành bài tập lớn môn Cơ sở dữ liệu. Tôi đã dành nhiều thời gian để nghiên cứu và thực hiện các yêu cầu của bài tập. Mong rằng kết quả sẽ được tốt.', '2024-03-23 00:23:56', '2024-03-23 00:23:56'),
(9, 'hoanganh@example.com', 'Ghi chú hằng ngày', 'Mua sữa và bánh mỳ trước khi về nhà.', '2024-03-23 00:24:40', '2024-03-23 00:24:40'),
(10, 'minhtrang@example.com', 'Lịch hẹn khám bệnh', 'Buổi khám bệnh sẽ diễn ra vào thứ Sáu tuần này.', '2024-03-23 00:24:40', '2024-03-23 00:24:40'),
(12, 'minhtrang@example.com', 'Ghi chú về kế hoạch du lịch', 'Kế hoạch du lịch sắp tới của gia đình sẽ là một chuyến đi dài ngày. Chúng ta cần chuẩn bị kỹ lưỡng từ việc đặt vé máy bay, đặt khách sạn, lên lịch trình tham quan và chuẩn bị hành lý.', '2024-03-23 00:25:54', '2024-03-23 00:25:54'),
(13, 'thihong@example.com', 'Ghi chú về công việc', 'Công việc của tôi đang rất bận rộn và áp lực. Tôi cảm thấy cần phải tạo ra một kế hoạch làm việc cụ thể để giải quyết mọi thứ một cách hiệu quả nhất.', '2024-03-23 00:25:54', '2024-03-23 00:25:54'),
(14, 'linhngoc@example.com', 'Ghi chú về công việc mới', 'Chiều nay:\n- Chuẩn bị báo cáo tổng kết tháng trước.\n- Tham dự cuộc họp dự án lúc 14:00.\nNgày mai:\n- Kiểm tra email và phản hồi các yêu cầu từ khách hàng.\n- Hoàn thiện bài thuyết trình cho cuộc họp vào cuối tuần.', '2024-03-23 00:32:25', '2024-03-23 00:32:38'),
(15, 'hoanganh@example.com', 'Chào', 'Đây là nội dung', '2024-04-11 23:00:09', '2024-04-11 23:00:22'),
(21, 'hoanganh@example.com', 'Translation of Chào', 'Đây là nội dung', '2024-04-15 03:21:57', '2024-04-15 03:28:42'),
(22, 'hoanganh@example.com', 'What is the 4th of July?', 'Also called Independence Day, the Fourth (4th) of July is a public holiday in the United States of America that commemorates the adoption of the Declaration of Independence on July 4, 1776, which declared the original colonies to be free from British rule.', '2024-04-15 03:32:43', '2024-04-15 03:32:55'),
(23, 'hoanganh@example.com', 'Translation of What is the 4th of July?', 'Còn được gọi là Ngày Độc lập, ngày 4 tháng 7 là một ngày nghỉ lễ ở Hoa Kỳ nhằm kỷ niệm việc thông qua Tuyên ngôn Độc lập vào ngày 4 tháng 7 năm 1776, tuyên bố các thuộc địa ban đầu được giải phóng khỏi sự cai trị của Anh.', '2024-04-15 03:33:05', '2024-04-15 03:33:05'),
(24, 'hoanganh@example.com', 'Translation of Translation of What is the 4th of July?', 'Also known as Independence Day, July 4 is a holiday in the United States commemorating the adoption of the Declaration of Independence on July 4, 1776, declaring the original colonies free from colonial rule. British rule.', '2024-04-15 03:38:44', '2024-04-15 03:38:44'),
(30, 'hoanganh@example.com', 'Ngày Thống nhất', 'Ngày lễ 30 tháng 4, tên chính thức là Ngày Giải phóng Miền Nam, thống nhất đất nước, Ngày Chiến thắng, Ngày Thống nhất là một ngày lễ quốc gia của Việt Nam, đánh dấu sự kiện chấm dứt Chiến tranh Việt Nam khi Tổng thống Dương Văn Minh và Thủ tướng Vũ Văn Mẫu của Việt Nam Cộng hòa tuyên bố đầu hàng vô điều kiện Chính phủ Cách mạng lâm thời Cộng hòa miền Nam Việt Nam vào trưa ngày 30 tháng 4 năm 1975. Ngày này là kết quả trực tiếp của Chiến dịch Mùa Xuân năm 1975 và là một mốc quan trọng trong lịch sử Việt Nam.\r\n\r\nSự kiện 30 tháng 4 diễn ra sau khi tất cả công dân và binh lính Mỹ cùng với hàng ngàn người Việt phục vụ cho chính thể Việt Nam Cộng hòa ở miền Nam Việt Nam di tản khỏi Sài Gòn. Năm 1976, Việt Nam chính thức tuyển cử bầu Quốc hội thống nhất và Sài Gòn đổi tên thành Thành phố Hồ Chí Minh, theo tên của cố Chủ tịch Việt Nam Dân chủ Cộng hoà Hồ Chí Minh.\r\n\r\nHằng năm, tại Việt Nam có rất nhiều hoạt động được tổ chức để kỷ niệm ngày này. Nó còn là ngày nghỉ lễ quốc gia, được ghi trong các văn bản pháp luật với tên gọi \"Ngày Chiến thắng\".\r\n\r\nTrong khi đó, tại một số cộng đồng người Việt hải ngoại, gồm những người đã từng phục vụ cho Hoa Kỳ và Việt Nam Cộng hoà, có tư tưởng chống chính phủ hiện tại của Việt Nam thì gọi đây là ngày Tháng Tư đen, Ngày Sài Gòn thất thủ, hoặc Ngày Quốc Hận.', '2024-04-18 22:14:42', '2024-04-18 23:00:02'),
(31, 'hoanganh@example.com', '', 'phấn trắng cao cấp phấn trắng không Bụi', '2024-04-18 22:42:07', '2024-04-18 22:42:16'),
(34, 'hoanganh@example.com', 'Translation of Ngày Thống nhất', 'April 30 holiday, officially named Southern Liberation Day, National Unification Day, Victory Day, Unification Day is a national holiday of Vietnam, marking the end of the Vietnam War when General President Duong Van Minh and Prime Minister Vu Van Mau of the Republic of Vietnam announced the unconditional surrender of the Provisional Revolutionary Government of the Republic of South Vietnam at noon on April 30, 1975. This date is a direct result of the 1975 Spring Campaign and was an important milestone in Vietnamese history. The April 30 event took place after all American citizens and soldiers along with thousands of Vietnamese serving the Republic of Vietnam regime in South Vietnam evacuated Saigon. In 1976, Vietnam officially elected a unified National Assembly and Saigon changed its name to Ho Chi Minh City, after the late President of the Democratic Republic of Vietnam Ho Chi Minh. Every year, in Vietnam, many activities are organized to celebrate this day. It is also a national holiday, recorded in legal documents as &quot;Victory Day&quot;. Meanwhile, in some overseas Vietnamese communities, including those who have served for the United States and the Republic of Vietnam, and have anti-Vietnamese thoughts, this is called Black April. The Day Saigon fell, or the Day of National Hate.', '2024-04-18 23:00:54', '2024-04-18 23:00:54'),
(38, 'test@example.com', 'Speech-to-text Test', 'Thì cái này nó phải đợi một khoảng thời gian tùy vào cái độ dài của K audio mình thì nó sẽ cho ra được cái test tương ứng', '2024-04-18 23:14:07', '2024-04-19 10:46:21'),
(40, 'test@example.com', 'Note summmary Test', 'Ngày lễ 30 tháng 4, tên chính thức là Ngày Giải phóng Miền Nam, thống nhất đất nước, Ngày Chiến thắng, Ngày Thống nhất là một ngày lễ quốc gia của Việt Nam, đánh dấu sự kiện chấm dứt Chiến tranh Việt Nam khi Tổng thống Dương Văn Minh và Thủ tướng Vũ Văn Mẫu của Việt Nam Cộng hòa tuyên bố đầu hàng vô điều kiện Chính phủ Cách mạng lâm thời Cộng hòa miền Nam Việt Nam vào trưa ngày 30 tháng 4 năm 1975. Ngày này là kết quả trực tiếp của Chiến dịch Mùa Xuân năm 1975 và là một mốc quan trọng trong lịch sử Việt Nam. Sự kiện 30 tháng 4 diễn ra sau khi tất cả công dân và binh lính Mỹ cùng với hàng ngàn người Việt phục vụ cho chính thể Việt Nam Cộng hòa ở miền Nam Việt Nam di tản khỏi Sài Gòn. Năm 1976, Việt Nam chính thức tuyển cử bầu Quốc hội thống nhất và Sài Gòn đổi tên thành Thành phố Hồ Chí Minh, theo tên của cố Chủ tịch Việt Nam Dân chủ Cộng hoà Hồ Chí Minh. Hằng năm, tại Việt Nam có rất nhiều hoạt động được tổ chức để kỷ niệm ngày này. Nó còn là ngày nghỉ lễ quốc gia, được ghi trong các văn bản pháp luật với tên gọi \"Ngày Chiến thắng\". Trong khi đó, tại một số cộng đồng người Việt hải ngoại, gồm những người đã từng phục vụ cho Hoa Kỳ và Việt Nam Cộng hoà, có tư tưởng chống chính phủ hiện tại của Việt Nam thì gọi đây là ngày Tháng Tư đen, Ngày Sài Gòn thất thủ, hoặc Ngày Quốc Hận.', '2024-04-18 23:42:49', '2024-04-18 23:51:07'),
(41, 'test@example.com', 'Note translation Test', 'April 30 holiday, officially named Southern Liberation Day, National Unification Day, Victory Day, Unification Day is a national holiday of Vietnam, marking the end of the Vietnam War when General President Duong Van Minh and Prime Minister Vu Van Mau of the Republic of Vietnam announced the unconditional surrender of the Provisional Revolutionary Government of the Republic of South Vietnam at noon on April 30, 1975. This date is a direct result of the 1975 Spring Campaign and was an important milestone in Vietnam\'s history. The April 30 event took place after all American citizens and soldiers along with thousands of Vietnamese serving the Republic of Vietnam regime in South Vietnam evacuated Saigon. In 1976, Vietnam officially elected a unified National Assembly and Saigon changed its name to Ho Chi Minh City, after the late President of the Democratic Republic of Vietnam Ho Chi Minh. Every year, in Vietnam, many activities are organized to celebrate this day. It is also a national holiday, recorded in legal documents as &quot;Victory Day&quot;. Meanwhile, in some overseas Vietnamese communities, including those who have served for the United States and the Republic of Vietnam, and have anti-Vietnamese thoughts, this is called Black April. The Day Saigon fell, or the Day of National Hate.', '2024-04-18 23:47:46', '2024-04-18 23:50:50'),
(49, 'test@example.com', '', '', '2024-04-24 09:48:27', '2024-04-24 09:48:27');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `username` varchar(255) NOT NULL,
  `password` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`username`, `password`, `name`, `phone`) VALUES
('hoanganh@example.com', 'ca4d4167e918641d37a414e5e11b349e6a015c21682a70ded8b9079e7686d80d', 'Nguyễn Hoàng Anh', '0987654321'),
('linhngoc@example.com', 'mklinhngoc', 'Trần Linh Ngọc', '0987654321'),
('minhtrang@example.com', 'mkminhtrang', 'Trần Minh Trang', '0123456789'),
('quynhanh@example.com', 'mkquynhanh', 'Nguyễn Quỳnh Anh', '0123456789'),
('test@example.com', 'a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3', 'Test', '0123456789'),
('thihong@example.com', 'mkthihong', 'Lê Thị Hồng', '0987654321');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `note`
--
ALTER TABLE `note`
  ADD PRIMARY KEY (`id`),
  ADD KEY `username` (`username`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `note`
--
ALTER TABLE `note`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `note`
--
ALTER TABLE `note`
  ADD CONSTRAINT `note_ibfk_1` FOREIGN KEY (`username`) REFERENCES `user` (`username`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
