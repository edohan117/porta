-- --------------------------------------------------------
-- 호스트:                          127.0.0.1
-- 서버 버전:                        11.4.2-MariaDB - mariadb.org binary distribution
-- 서버 OS:                        Win64
-- HeidiSQL 버전:                  12.6.0.6765
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- inno_nest 데이터베이스 구조 내보내기
DROP DATABASE IF EXISTS `inno_nest`;
CREATE DATABASE IF NOT EXISTS `inno_nest` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;
USE `inno_nest`;

-- 테이블 inno_nest.common_code 구조 내보내기
DROP TABLE IF EXISTS `common_code`;
CREATE TABLE IF NOT EXISTS `common_code` (
  `CODE_TYPE` varchar(10) NOT NULL COMMENT '코드 타입',
  `CODE_VAL` varchar(10) NOT NULL COMMENT '코드 값',
  `CODE_NM` varchar(100) DEFAULT NULL COMMENT '코드 이름',
  `PARENT_CD` varchar(10) DEFAULT NULL COMMENT '상위 코드 값',
  PRIMARY KEY (`CODE_TYPE`,`CODE_VAL`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- 테이블 데이터 inno_nest.common_code:~58 rows (대략적) 내보내기
REPLACE INTO `common_code` (`CODE_TYPE`, `CODE_VAL`, `CODE_NM`, `PARENT_CD`) VALUES
	('TAG_CD', '101', '강남', '01'),
	('TAG_CD', '102', '건대', '01'),
	('TAG_CD', '103', '홍대', '01'),
	('TAG_CD', '104', '대학로', '01'),
	('TAG_CD', '105', '신촌', '01'),
	('AREA_CD', '106', '성수', '01'),
	('AREA_CD', '107', '외대', '01'),
	('AREA_CD', '108', '잠실', '01'),
	('AREA_CD', '109', '신림', '01'),
	('AREA_CD', '199', '기타', '01'),
	('AREA_CD', '201', '부천', '02'),
	('AREA_CD', '202', '일산', '02'),
	('AREA_CD', '203', '수원', '02'),
	('AREA_CD', '204', '안양', '02'),
	('AREA_CD', '299', '기타', '02'),
	('AREA_CD', '301', '인천', '03'),
	('AREA_CD', '401', '강원', '04'),
	('AREA_CD', '501', '대전', '05'),
	('AREA_CD', '502', '천안', '05'),
	('AREA_CD', '503', '아산', '05'),
	('AREA_CD', '504', '청주', '05'),
	('AREA_CD', '599', '기타', '05'),
	('AREA_CD', '601', '부산', '06'),
	('AREA_CD', '602', '대구', '06'),
	('AREA_CD', '699', '기타', '06'),
	('AREA_CD', '701', '전주', '07'),
	('AREA_CD', '702', '광주', '07'),
	('AREA_CD', '799', '기타', '07'),
	('AREA_CD', '801', '제주', '08'),
	('GENRE_CD', 'G01', '공포', NULL),
	('GENRE_CD', 'G02', '스릴러', NULL),
	('GENRE_CD', 'G03', '미스테리', NULL),
	('GENRE_CD', 'G04', '추리', NULL),
	('GENRE_CD', 'G05', '범죄', NULL),
	('GENRE_CD', 'G06', '잠입', NULL),
	('GENRE_CD', 'G07', '액션', NULL),
	('GENRE_CD', 'G08', '드라마', NULL),
	('GENRE_CD', 'G09', '감성', NULL),
	('GENRE_CD', 'G10', '로맨스', NULL),
	('GENRE_CD', 'G11', '모험', NULL),
	('GENRE_CD', 'G12', '코미디', NULL),
	('GENRE_CD', 'G13', '판타지', NULL),
	('GENRE_CD', 'G14', 'SF', NULL),
	('GENRE_CD', 'G15', '아케이드', NULL),
	('GENRE_CD', 'G16', '역사', NULL),
	('GENRE_CD', 'G17', '음악', NULL),
	('GENRE_CD', 'G18', '19금', NULL),
	('GENRE_CD', 'G19', '야외', NULL),
	('GENRE_CD', 'G99', '기타', NULL),
	('REGION_CD', '01', '서울', NULL),
	('REGION_CD', '02', '경기', NULL),
	('REGION_CD', '03', '인천', NULL),
	('REGION_CD', '04', '강원', NULL),
	('REGION_CD', '05', '충청', NULL),
	('REGION_CD', '06', '경상', NULL),
	('REGION_CD', '07', '전라', NULL),
	('REGION_CD', '08', '제주', NULL),
	('REGION_CD', '99', '기타', NULL);

-- 테이블 inno_nest.escape_room_list 구조 내보내기
DROP TABLE IF EXISTS `escape_room_list`;
CREATE TABLE IF NOT EXISTS `escape_room_list` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `REGION_CD` varchar(100) NOT NULL,
  `AREA_CD` varchar(100) NOT NULL,
  `ROOM_NM` varchar(255) NOT NULL,
  `THEME_NM` varchar(100) NOT NULL,
  `GENRE_CD` varchar(10) NOT NULL,
  `CONTENT` text DEFAULT NULL,
  `MIN_PARTY` int(11) NOT NULL DEFAULT 0,
  `MAX_PARTY` int(11) NOT NULL DEFAULT 0,
  `RUN_TIME` int(11) NOT NULL DEFAULT 0,
  `ACTIVITY` int(11) NOT NULL DEFAULT 0,
  `DEVICE_RATIO` int(11) NOT NULL DEFAULT 0,
  `PRICE` varchar(100) NOT NULL DEFAULT '0',
  `RATING` double NOT NULL DEFAULT 0,
  `LEVEL` int(11) NOT NULL DEFAULT 1,
  `RCMD` char(1) DEFAULT 'N',
  `NEW_THEME` char(1) DEFAULT 'N',
  `HIT` int(50) DEFAULT 0,
  `SITE` varchar(500) DEFAULT NULL,
  `IMG_PATH` varchar(255) DEFAULT NULL,
  `CREATED_ID` varchar(100) NOT NULL,
  `CREATED_TIME` datetime NOT NULL DEFAULT current_timestamp(),
  `UPDATED_ID` varchar(100) DEFAULT NULL,
  `UPDATED_TIME` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=97 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- 테이블 데이터 inno_nest.escape_room_list:~90 rows (대략적) 내보내기
REPLACE INTO `escape_room_list` (`ID`, `REGION_CD`, `AREA_CD`, `ROOM_NM`, `THEME_NM`, `GENRE_CD`, `CONTENT`, `MIN_PARTY`, `MAX_PARTY`, `RUN_TIME`, `ACTIVITY`, `DEVICE_RATIO`, `PRICE`, `RATING`, `LEVEL`, `RCMD`, `NEW_THEME`, `HIT`, `SITE`, `IMG_PATH`, `CREATED_ID`, `CREATED_TIME`, `UPDATED_ID`, `UPDATED_TIME`) VALUES
	(1, '01', '103', '퀘스천마크', '퀘스천마크', 'G99', '설명이나 내용이 여기에 들어가\n어떤느낌인지 알지? 내용 길게 들어감', 2, 4, 70, 1, 1, '인당 23000', 4.35, 3, 'N', 'N', 9, 'https://question-mark.co.kr/layout/res/home.php?go=main', '/poster/퀘스천마크.jpg', 'admin', '2024-10-11 13:37:50', 'admin', '2024-10-18 13:48:15'),
	(2, '01', '103', '룸엘이스케이프 홍대점', '퇴근길', 'G01', '설명이나 내용이 여기에 들어가\n어떤느낌인지 알지? 내용 길게 들어감', 2, 4, 65, 3, 3, '인당 23000', 4.22, 3, 'N', 'Y', 6, 'https://www.roomlescape.com/home.php?go=rev.make&showroomSeq=2', '/poster/퇴근길.jpg', 'admin', '2024-10-11 13:37:50', 'admin', '2024-10-23 12:17:31'),
	(3, '01', '103', '제로월드 홍대점', '층간소음', 'G01', '설명이나 내용이 여기에 들어가\n어떤느낌인지 알지? 내용 길게 들어감', 2, 4, 80, 2, 2, '인당 23000', 4.55, 2, 'Y', 'Y', 10, 'https://www.zerohongdae.com/reservation', '/poster/층간소음.jpg', 'admin', '2024-10-11 13:37:50', 'admin', '2024-10-23 12:27:10'),
	(4, '01', '103', '비트포비아 홍대던전3', 'And I met e', 'G01', '설명이나 내용이 여기에 들어가\n어떤느낌인지 알지? 내용 길게 들어감', 2, 4, 70, 4, 4, '인당 23000', 4.23, 3, 'N', 'N', 0, 'https://xdungeon.net/layout/res/home.php?go=main', '/poster/And I met e.jpg', 'admin', '2024-10-11 13:37:50', 'admin', '2024-10-14 10:37:07'),
	(5, '01', '103', '지구별방탈출 홍대라스트시티점', '섀도우', 'G01', '설명이나 내용이 여기에 들어가\n어떤느낌인지 알지? 내용 길게 들어감', 2, 4, 70, 5, 5, '인당 23000', 4.08, 2, 'N', 'N', 0, 'https://www.xn--2e0b040a4xj.com/', '/poster/섀도우.jpg', 'admin', '2024-10-11 13:37:50', 'admin', '2024-10-14 10:37:07'),
	(6, '01', '103', '지구별방탈출 홍대라스트시티점', '문신', 'G01', '설명이나 내용이 여기에 들어가\n어떤느낌인지 알지? 내용 길게 들어감', 2, 4, 65, 5, 5, '인당 23000', 4.16, 3, 'N', 'N', 5, 'https://www.xn--2e0b040a4xj.com/', '/poster/문신.jpg', 'admin', '2024-10-11 13:37:50', 'admin', '2024-10-17 11:04:37'),
	(7, '01', '103', '코드케이 홍대점', '꼬레아 우라', 'G01', '설명이나 내용이 여기에 들어가\n어떤느낌인지 알지? 내용 길게 들어감', 2, 4, 80, 3, 3, '인당 23000', 3.93, 4, 'N', 'N', 0, 'http://code-k.co.kr/', '/poster/꼬레아 우라.jpg', 'admin', '2024-10-11 13:37:50', 'admin', '2024-10-14 10:37:07'),
	(8, '01', '103', '지구별방탈출 홍대라스트시티점', '스텔라', 'G01', '설명이나 내용이 여기에 들어가\n어떤느낌인지 알지? 내용 길게 들어감', 2, 4, 70, 5, 5, '인당 23000', 4.02, 2, 'N', 'N', 0, 'https://www.xn--2e0b040a4xj.com/', '/poster/스텔라.jpg', 'admin', '2024-10-11 13:37:50', 'admin', '2024-10-14 10:37:07'),
	(9, '01', '103', '포인트나인 홍대점', '사일런트', 'G01', '설명이나 내용이 여기에 들어가\n어떤느낌인지 알지? 내용 길게 들어감', 2, 4, 70, 3, 3, '인당 23000', 4.07, 3, 'N', 'N', 0, 'https://point-nine.com/layout/res/home.php?go=main', '/poster/사일런트.jpg', 'admin', '2024-10-11 13:37:50', 'admin', '2024-10-14 10:37:07'),
	(10, '01', '103', '제로월드 홍대점', '얼라이브', 'G01', '설명이나 내용이 여기에 들어가\n어떤느낌인지 알지? 내용 길게 들어감', 2, 4, 65, 3, 3, '인당 23000', 4.16, 3, 'N', 'N', 0, 'https://www.zerohongdae.com/reservation', '/poster/얼라이브.jpg', 'admin', '2024-10-11 13:37:50', 'admin', '2024-10-14 10:37:07'),
	(11, '01', '103', '디코더', '템포 루바토', 'G01', '설명이나 내용이 여기에 들어가\n어떤느낌인지 알지? 내용 길게 들어감', 2, 4, 80, 2, 2, '인당 23000', 4.1, 3, 'N', 'N', 0, 'http://decoder.kr/book-rubato/', '/poster/템포 루바토.jpg', 'admin', '2024-10-11 13:37:50', 'admin', '2024-10-14 10:37:07'),
	(12, '01', '103', '제로월드 홍대점', '녹스', 'G01', '설명이나 내용이 여기에 들어가\n어떤느낌인지 알지? 내용 길게 들어감', 2, 4, 70, 5, 5, '인당 23000', 4.11, 3, 'N', 'N', 0, 'https://www.zerohongdae.com/reservation', '/poster/녹스.jpg', 'admin', '2024-10-11 13:37:50', 'admin', '2024-10-14 10:37:07'),
	(13, '01', '103', '비트포비아 던전 101', '화생설화: Blooming', 'G01', '설명이나 내용이 여기에 들어가\n어떤느낌인지 알지? 내용 길게 들어감', 2, 4, 70, 3, 3, '인당 23000', 4.19, 3, 'N', 'N', 0, 'https://xdungeon.net/layout/res/home.php?go=main', '/poster/화생설화.jpg', 'admin', '2024-10-11 13:37:50', 'admin', '2024-10-14 10:37:07'),
	(14, '01', '103', '오아시스 뮤지엄', '배드 타임', 'G01', '설명이나 내용이 여기에 들어가\n어떤느낌인지 알지? 내용 길게 들어감', 2, 4, 65, 3, 3, '인당 23000', 4.24, 2, 'N', 'N', 0, 'https://oasismuseum.com/', '/poster/배드 타임.jpg', 'admin', '2024-10-11 13:37:50', 'admin', '2024-10-14 10:37:07'),
	(15, '01', '103', '제로월드 홍대점', '깜방탈출', 'G01', '설명이나 내용이 여기에 들어가\n어떤느낌인지 알지? 내용 길게 들어감', 2, 4, 80, 3, 3, '인당 23000', 4.08, 4, 'N', 'N', 0, 'https://www.zerohongdae.com/reservation', '/poster/깜방탈출.jpg', 'admin', '2024-10-11 13:37:50', 'admin', '2024-10-14 10:37:07'),
	(16, '01', '103', '비트포비아 홍대던전', '오늘 나는', 'G01', '설명이나 내용이 여기에 들어가\n어떤느낌인지 알지? 내용 길게 들어감', 2, 4, 70, 5, 5, '인당 23000', 3.98, 3, 'N', 'N', 0, 'https://xdungeon.net/layout/res/home.php?go=main', '/poster/오늘 나는.jpg', 'admin', '2024-10-11 13:37:50', 'admin', '2024-10-14 10:37:07'),
	(17, '01', '103', '티켓투이스케이프', '갤럭시 익스프레스', 'G01', '설명이나 내용이 여기에 들어가\n어떤느낌인지 알지? 내용 길게 들어감', 2, 4, 65, 3, 3, '인당 23000', 4.02, 4, 'N', 'N', 0, 'http://ttescape.co.kr/main.asp', '/poster/갤럭시 익스프레스.jpg', 'admin', '2024-10-11 13:37:50', 'admin', '2024-10-14 10:37:07'),
	(18, '01', '103', '포인트나인 홍대점', '리슨', 'G01', '설명이나 내용이 여기에 들어가\n어떤느낌인지 알지? 내용 길게 들어감', 2, 4, 80, 3, 3, '인당 23000', 3.98, 3, 'N', 'N', 0, 'https://point-nine.com/layout/res/home.php?go=main', '/poster/리슨.jpg', 'admin', '2024-10-11 13:37:50', 'admin', '2024-10-14 10:37:07'),
	(19, '01', '103', '지구별방탈출 홍대라스트시티점', '멸종위기종 탐사대', 'G01', '설명이나 내용이 여기에 들어가\n어떤느낌인지 알지? 내용 길게 들어감', 2, 4, 70, 5, 5, '인당 23000', 4.06, 4, 'N', 'N', 0, 'https://www.xn--2e0b040a4xj.com/', '/poster/멸종위기종 탐사대.jpg', 'admin', '2024-10-11 13:37:50', 'admin', '2024-10-14 10:37:07'),
	(20, '01', '103', '위욜', '디어 마이 프렌드', 'G01', '설명이나 내용이 여기에 들어가\n어떤느낌인지 알지? 내용 길게 들어감', 2, 4, 70, 1, 1, '인당 23000', 3.98, 3, 'N', 'N', 0, 'https://weyol.com/layout/res/home.php?go=main', '/poster/디어 마이 프렌드.jpg', 'admin', '2024-10-11 13:37:50', 'admin', '2024-10-14 10:37:07'),
	(21, '01', '103', '라이브시네마', '우정', 'G01', '설명이나 내용이 여기에 들어가\n어떤느낌인지 알지? 내용 길게 들어감', 4, 5, 100, 3, 3, '고정 220000', 4.56, 2, 'Y', 'Y', 7, 'https://map.naver.com/p/search/%EB%9D%BC%EC%9D%B4%EB%B8%8C%EC%8B%9C%EB%84%A4%EB%A7%88/place/1214295834?c=15.00,0,0,0,dh&placePath=/ticket', '/poster/우정.jpg', 'admin', '2024-10-11 13:37:50', 'admin', '2024-10-15 13:19:58'),
	(22, '01', '103', '비트포비아 던전 101', '전래동 자살사건', 'G01', '설명이나 내용이 여기에 들어가\n어떤느낌인지 알지? 내용 길게 들어감', 2, 4, 80, 2, 2, '인당 23000', 3.94, 4, 'N', 'N', 0, 'https://xdungeon.net/layout/res/home.php?go=main', '/poster/전래동 자살사건.jpg', 'admin', '2024-10-11 13:37:50', 'admin', '2024-10-14 10:37:07'),
	(23, '01', '103', '비트포비아 홍대던전3', '경성 연쇄 실종사건', 'G01', '설명이나 내용이 여기에 들어가\n어떤느낌인지 알지? 내용 길게 들어감', 2, 4, 70, 4, 4, '인당 23000', 4.1, 2, 'N', 'N', 0, 'https://xdungeon.net/layout/res/home.php?go=main', '/poster/경성 연쇄 실종사건.jpg', 'admin', '2024-10-11 13:37:50', 'admin', '2024-10-14 10:37:07'),
	(24, '01', '103', '지구별방탈출 홍대어드벤처점', '아몬:새벽을 여는 소년', 'G01', '설명이나 내용이 여기에 들어가\n어떤느낌인지 알지? 내용 길게 들어감', 2, 4, 70, 5, 5, '인당 23000', 3.94, 2, 'N', 'N', 0, 'https://www.xn--2e0b040a4xj.com/', '/poster/새벽을 여는 소년.jpg', 'admin', '2024-10-11 13:37:50', 'admin', '2024-10-14 10:37:07'),
	(25, '01', '103', '싸인이스케이프 홍대점', '거상', 'G01', '설명이나 내용이 여기에 들어가\n어떤느낌인지 알지? 내용 길게 들어감', 2, 4, 65, 5, 5, '인당 23000', 3.92, 4, 'N', 'N', 0, 'http://www.signescape.com/main.html?JIJEM=S5', '/poster/거상.jpg', 'admin', '2024-10-11 13:37:50', 'admin', '2024-10-14 10:37:07'),
	(26, '01', '103', '상상의문 홍대점', '디든트', 'G01', '설명이나 내용이 여기에 들어가\n어떤느낌인지 알지? 내용 길게 들어감', 2, 4, 80, 3, 3, '인당 23000', 3.94, 5, 'N', 'N', 0, 'https://xn--z92b74ha268d.com/layout/res/home.php?go=main', '/poster/디든트.jpg', 'admin', '2024-10-11 13:37:50', 'admin', '2024-10-14 10:37:07'),
	(27, '01', '103', '머더파커 홍대점', '칠칠', 'G01', '설명이나 내용이 여기에 들어가\n어떤느낌인지 알지? 내용 길게 들어감', 2, 4, 70, 5, 5, '인당 23000', 4.08, 4, 'N', 'N', 0, 'http://murderparker.com/', '/poster/칠칠.jpg', 'admin', '2024-10-11 13:37:50', 'admin', '2024-10-14 10:37:07'),
	(28, '01', '103', '비트포비아 던전 101', 'MST 엔터테인먼트', 'G01', '설명이나 내용이 여기에 들어가\n어떤느낌인지 알지? 내용 길게 들어감', 2, 4, 70, 3, 3, '인당 23000', 3.97, 3, 'N', 'N', 0, 'https://xdungeon.net/layout/res/home.php?go=main', '/poster/MST 엔터테인먼트.jpg', 'admin', '2024-10-11 13:37:50', 'admin', '2024-10-14 10:37:07'),
	(29, '01', '103', '티켓투이스케이프', '헬로 프레이', 'G01', '설명이나 내용이 여기에 들어가\n어떤느낌인지 알지? 내용 길게 들어감', 2, 4, 65, 3, 3, '인당 23000', 3.97, 3, 'N', 'N', 0, 'http://ttescape.co.kr/main.asp', '/poster/헬로 프레이.jpg', 'admin', '2024-10-11 13:37:50', 'admin', '2024-10-14 10:37:07'),
	(30, '01', '103', '레다스퀘어', '세상의 진실을 마주하는 일에 대하여', 'G01', '설명이나 내용이 여기에 들어가\n어떤느낌인지 알지? 내용 길게 들어감', 2, 4, 80, 2, 2, '인당 23000', 3.95, 2, 'N', 'N', 9, 'https://ledasquare.com/layout/res/home.php?go=main', '/poster/세상의 진실을 마주하는 일에 대하여.jpg', 'admin', '2024-10-11 13:37:50', 'admin', '2024-10-15 12:31:56'),
	(31, '01', '103', '이스케이퍼스 홍대2호점', '테라포밍 마스', 'G01', '설명이나 내용이 여기에 들어가\n어떤느낌인지 알지? 내용 길게 들어감', 2, 4, 70, 5, 5, '인당 23000', 3.94, 2, 'N', 'N', 24, 'http://www.escapers.co.kr/reservation', '/poster/테라포밍 마스.jpg', 'admin', '2024-10-11 13:37:50', 'admin', '2024-10-17 11:26:07'),
	(32, '01', '108', '제로월드 롯데월드점', '바람: 우리는 그저 바람이었소', 'G01', '설명이나 내용이 여기에 들어가\n어떤느낌인지 알지? 내용 길게 들어감', 2, 4, 70, 3, 3, '인당 23000', 4.1, 3, 'N', 'N', 0, 'https://zerolotteworld.com/reservation', '/poster/바람.jpg', 'admin', '2024-10-11 13:37:50', 'admin', '2024-10-14 10:37:07'),
	(33, '01', '107', '엔터팟', '비공식수사', 'G04', '설명이나 내용이 여기에 들어가\n어떤느낌인지 알지? 내용 길게 들어감', 2, 4, 65, 3, 3, '인당 23000', 4.73, 3, 'Y', 'Y', 9, 'https://enterpot.co.kr/', '/poster/비공식수사.jpg', 'admin', '2024-10-11 13:37:50', 'admin', '2024-10-17 14:23:45'),
	(34, '01', '105', '나의신방', 'CHASER:한마음 폐공장', 'G01', '설명이나 내용이 여기에 들어가\n어떤느낌인지 알지? 내용 길게 들어감', 2, 4, 80, 3, 3, '인당 23000', 4.13, 4, 'N', 'Y', 0, 'https://xn--910bj3tlmfz4e.com/layout/res/home.php?go=rev.make', '/poster/한마음 폐공장.jpg', 'admin', '2024-10-11 13:39:45', 'admin', '2024-10-14 10:37:07'),
	(35, '01', '105', '나의신방', '신촌성심병원', 'G01', '설명이나 내용이 여기에 들어가\n어떤느낌인지 알지? 내용 길게 들어감', 2, 4, 70, 5, 5, '인당 23000', 4.52, 2, 'Y', 'Y', 15, 'https://xn--910bj3tlmfz4e.com/layout/res/home.php?go=rev.make', '/poster/신촌성심병원.jpg', 'admin', '2024-10-11 13:39:45', 'admin', '2024-10-17 12:35:21'),
	(36, '01', '105', '마스터키프라임 신촌퍼플릭', '씬:404 NOT FOUND', 'G01', '설명이나 내용이 여기에 들어가\n어떤느낌인지 알지? 내용 길게 들어감', 2, 4, 65, 3, 3, '인당 23000', 3.93, 3, 'N', 'N', 0, 'https://www.master-key.co.kr/booking/bk_detail?bid=32', '/poster/씬.jpg', 'admin', '2024-10-11 13:39:45', 'admin', '2024-10-14 10:37:07'),
	(37, '01', '105', '룸익스케이프 인디고블루점', '드림 포스트:다시 꿈꾸는 마을로', 'G01', '설명이나 내용이 여기에 들어가\n어떤느낌인지 알지? 내용 길게 들어감', 2, 4, 80, 3, 3, '인당 23000', 4.13, 2, 'N', 'N', 0, 'https://map.naver.com/p/entry/place/1767739132?placePath=%252Fhome%253Fentry%253Dplt&searchType=place&lng=126.9353965&lat=37.5571939&c=15.00,0,0,0,dh', '/poster/드림 포스트.jpg', 'admin', '2024-10-11 13:39:45', 'admin', '2024-10-14 10:37:07'),
	(38, '01', '105', '클레버타운', '난 너의 보이', 'G01', '설명이나 내용이 여기에 들어가\n어떤느낌인지 알지? 내용 길게 들어감', 2, 4, 70, 1, 1, '인당 23000', 4.25, 4, 'N', 'N', 0, 'https://clevertown.co.kr/layout/res/home.php?go=main', '/poster/난 너의 보이.jpg', 'admin', '2024-10-11 13:39:45', 'admin', '2024-10-14 10:37:07'),
	(39, '01', '105', '파노라마', '판도라', 'G01', '설명이나 내용이 여기에 들어가\n어떤느낌인지 알지? 내용 길게 들어감', 2, 4, 70, 3, 3, '인당 23000', 4.06, 4, 'N', 'N', 0, 'https://map.naver.com/p/entry/place/1094046939?placePath=%252Fhome%253Fentry%253Dplt&searchType=place&lng=126.9355765&lat=37.5579850&c=15.00,0,0,0,dh', '/poster/판도라.jpg', 'admin', '2024-10-11 13:39:45', 'admin', '2024-10-14 10:37:07'),
	(40, '01', '109', '룸엘이스케이프 신림점', '메트로', 'G01', '설명이나 내용이 여기에 들어가\n어떤느낌인지 알지? 내용 길게 들어감', 2, 4, 65, 2, 2, '인당 23000', 3.94, 3, 'N', 'N', 1, 'https://www.roomlescape.com/home.php?go=rev.make&showroomSeq=1', '/poster/메트로.jpg', 'admin', '2024-10-11 13:39:45', 'admin', '2024-10-23 12:28:38'),
	(41, '01', '106', '단편선 성수', '쓰여진 문장에 구원이 없다면', 'G01', '설명이나 내용이 여기에 들어가\n어떤느낌인지 알지? 내용 길게 들어감', 2, 4, 80, 4, 4, '인당 23000', 4.49, 3, 'Y', 'N', 0, 'https://www.dpsnnn.com/', '/poster/쓰여진 문장에 구원이 없다면.jpg', 'admin', '2024-10-11 13:39:45', 'admin', '2024-10-14 10:37:07'),
	(42, '01', '106', '단편선 성수', '뱃사람의 별', 'G01', '설명이나 내용이 여기에 들어가\n어떤느낌인지 알지? 내용 길게 들어감', 2, 4, 70, 5, 5, '인당 23000', 4.26, 2, 'N', 'N', 2, 'https://www.dpsnnn.com/', '/poster/뱃사람의 별.jpg', 'admin', '2024-10-11 13:39:45', 'admin', '2024-10-15 12:27:06'),
	(43, '01', '106', '단편선 성수', '존재할 자격', 'G01', '설명이나 내용이 여기에 들어가\n어떤느낌인지 알지? 내용 길게 들어감', 2, 4, 70, 5, 5, '인당 23000', 4.22, 2, 'N', 'N', 0, 'https://www.dpsnnn.com/', '/poster/존재할 자격.jpg', 'admin', '2024-10-11 13:39:45', 'admin', '2024-10-14 10:37:07'),
	(44, '01', '104', '에필로그', '스테이지', 'G01', '설명이나 내용이 여기에 들어가\n어떤느낌인지 알지? 내용 길게 들어감', 3, 4, 65, 3, 3, '인당 23000', 4.2, 3, 'Y', 'Y', 0, 'https://epilogueescape.com/layout/res/home.php?go=main', '/poster/스테이지.jpg', 'admin', '2024-10-11 13:39:45', 'admin', '2024-10-14 14:52:26'),
	(45, '01', '104', '에필로그', '먼데이 나이트', 'G01', '설명이나 내용이 여기에 들어가\n어떤느낌인지 알지? 내용 길게 들어감', 2, 4, 80, 5, 5, '인당 23000', 4.05, 3, 'N', 'N', 0, 'https://epilogueescape.com/layout/res/home.php?go=main', '/poster/먼데이 나이트.jpg', 'admin', '2024-10-11 13:39:45', 'admin', '2024-10-14 10:37:07'),
	(46, '01', '102', '드림이스케이프', '바야흐로 여름이었다', 'G01', '설명이나 내용이 여기에 들어가\n어떤느낌인지 알지? 내용 길게 들어감', 2, 4, 70, 3, 3, '인당 23000', 4.53, 3, 'N', 'N', 0, 'https://map.naver.com/p/search/%EB%93%9C%EB%A6%BC%EC%9D%B4%EC%8A%A4%EC%BC%80%EC%9D%B4%ED%94%84/place/1046642948?c=15.00,0,0,0,dh&placePath=%3Fentry%253Dpll', '/poster/바야흐로 여름이었다.jpg', 'admin', '2024-10-11 13:39:45', 'admin', '2024-10-14 10:37:07'),
	(47, '01', '102', '포인트나인 건대점', '잭 인 더 쇼', 'G01', '설명이나 내용이 여기에 들어가\n어떤느낌인지 알지? 내용 길게 들어감', 2, 4, 70, 3, 3, '인당 23000', 4.27, 1, 'Y', 'N', 0, 'https://point-nine.com/layout/res/home.php?go=main', '/poster/잭 인 더 쇼.jpg', 'admin', '2024-10-11 13:39:45', 'admin', '2024-10-14 10:37:07'),
	(48, '01', '102', '황금열쇠 건대유토피아호점', '플래시', 'G01', '설명이나 내용이 여기에 들어가\n어떤느낌인지 알지? 내용 길게 들어감', 2, 4, 65, 2, 2, '인당 23000', 4.16, 3, 'N', 'N', 0, 'http://xn--jj0b998aq3cptw.com/layout/res/home.php?go=main', '/poster/플래시.jpg', 'admin', '2024-10-11 13:39:45', 'admin', '2024-10-14 10:37:06'),
	(49, '01', '102', '황금열쇠 건대유토피아호점', '나우 히어', 'G01', '설명이나 내용이 여기에 들어가\n어떤느낌인지 알지? 내용 길게 들어감', 2, 4, 80, 5, 5, '인당 23000', 4.26, 3, 'N', 'N', 0, 'http://xn--jj0b998aq3cptw.com/layout/res/home.php?go=main', '/poster/나우 히어.jpg', 'admin', '2024-10-11 13:39:45', 'admin', '2024-10-14 10:37:06'),
	(50, '01', '102', '레토 성수', '호텔 레토', 'G01', '설명이나 내용이 여기에 들어가\n어떤느낌인지 알지? 내용 길게 들어감', 2, 4, 70, 3, 3, '인당 23000', 3.91, 3, 'N', 'N', 0, 'http://hotelletoh.co.kr/layout/res/home.php?go=main', '/poster/호텔 레토.jpg', 'admin', '2024-10-11 13:39:45', 'admin', '2024-10-14 10:37:07'),
	(51, '01', '102', '드림이스케이프', 'V.E.T', 'G01', '설명이나 내용이 여기에 들어가\n어떤느낌인지 알지? 내용 길게 들어감', 2, 4, 70, 3, 3, '인당 23000', 3.91, 3, 'N', 'N', 0, 'https://map.naver.com/p/search/%EB%93%9C%EB%A6%BC%EC%9D%B4%EC%8A%A4%EC%BC%80%EC%9D%B4%ED%94%84/place/1046642948?c=15.00,0,0,0,dh&placePath=%3Fentry%253Dpll', '/poster/VET.jpg', 'admin', '2024-10-11 13:39:45', 'admin', '2024-10-14 10:37:07'),
	(52, '01', '102', '이스케이프샾 건대점', '오메가', 'G01', '설명이나 내용이 여기에 들어가\n어떤느낌인지 알지? 내용 길게 들어감', 2, 4, 65, 3, 3, '인당 23000', 3.95, 4, 'N', 'N', 0, 'https://map.naver.com/p/entry/place/1224740947?c=15.00,0,0,0,dh&placePath=/ticket', '/poster/오메가.jpg', 'admin', '2024-10-11 13:39:45', 'admin', '2024-10-14 10:37:07'),
	(53, '01', '102', '드림이스케이프', '올더박스 파라다이스', 'G01', '설명이나 내용이 여기에 들어가\n어떤느낌인지 알지? 내용 길게 들어감', 2, 4, 80, 5, 5, '인당 23000', 4.18, 4, 'N', 'N', 0, 'https://map.naver.com/p/search/%EB%93%9C%EB%A6%BC%EC%9D%B4%EC%8A%A4%EC%BC%80%EC%9D%B4%ED%94%84/place/1046642948?c=15.00,0,0,0,dh&placePath=%3Fentry%253Dpll', '/poster/올더박스 파라다이스.jpg', 'admin', '2024-10-11 13:39:45', 'admin', '2024-10-14 10:37:07'),
	(55, '01', '102', '머더파커 건대점', '여행', 'G01', '설명이나 내용이 여기에 들어가\n어떤느낌인지 알지? 내용 길게 들어감', 2, 4, 65, 3, 3, '인당 23000', 3.97, 3, 'N', 'N', 0, 'http://murderparker.com/', '/poster/여행.jpg', 'admin', '2024-10-11 13:39:45', 'admin', '2024-10-14 10:37:07'),
	(56, '01', '102', '이스케이프샾 건대점', '캠프ing', 'G01', '설명이나 내용이 여기에 들어가\n어떤느낌인지 알지? 내용 길게 들어감', 2, 4, 80, 1, 1, '인당 23000', 3.93, 3, 'N', 'N', 0, 'https://map.naver.com/p/entry/place/1224740947?c=15.00,0,0,0,dh&placePath=/ticket', '/poster/캠프ing.jpg', 'admin', '2024-10-11 13:39:45', 'admin', '2024-10-14 10:37:07'),
	(57, '01', '101', '키이스케이프 메모리컴퍼니', '필름 바이 에디', 'G01', '설명이나 내용이 여기에 들어가\n어떤느낌인지 알지? 내용 길게 들어감', 2, 4, 70, 3, 3, '인당 23000', 4.4, 3, 'Y', 'Y', 0, 'https://www.keyescape.co.kr/web/home.php', '/poster/필름 바이 에디.jpg', 'admin', '2024-10-11 13:39:45', 'admin', '2024-10-14 10:37:07'),
	(58, '01', '101', '키이스케이프 메모리컴퍼니', '필름 바이 스티브', 'G01', '설명이나 내용이 여기에 들어가\n어떤느낌인지 알지? 내용 길게 들어감', 2, 4, 70, 2, 2, '인당 23000', 4.28, 4, 'Y', 'Y', 0, 'https://www.keyescape.co.kr/web/home.php', '/poster/필름 바이 스티브.jpg', 'admin', '2024-10-11 13:39:45', 'admin', '2024-10-14 10:37:07'),
	(59, '01', '101', '키이스케이프 메모리컴퍼니', '필름 바이 밥', 'G01', '설명이나 내용이 여기에 들어가\n어떤느낌인지 알지? 내용 길게 들어감', 2, 4, 65, 4, 4, '인당 23000', 4.55, 2, 'Y', 'N', 0, 'https://www.keyescape.co.kr/web/home.php', '/poster/필름 바이 밥.jpg', 'admin', '2024-10-11 13:39:45', 'admin', '2024-10-14 10:37:07'),
	(60, '01', '101', '단편선 강남', '그림자 없는 상자', 'G01', '설명이나 내용이 여기에 들어가\n어떤느낌인지 알지? 내용 길게 들어감', 2, 4, 80, 5, 5, '인당 23000', 4.14, 3, 'N', 'N', 0, 'https://www.dpsnnn.com/', '/poster/그림자 없는 상자.jpg', 'admin', '2024-10-11 13:39:45', 'admin', '2024-10-14 10:37:07'),
	(61, '01', '101', '키이스케이프 로그인2', '백 투 더 씬+', 'G01', '설명이나 내용이 여기에 들어가\n어떤느낌인지 알지? 내용 길게 들어감', 2, 4, 70, 5, 5, '인당 23000', 4.04, 3, 'N', 'N', 0, 'https://www.keyescape.co.kr/web/home.php', '/poster/백 투 더 씬+.jpg', 'admin', '2024-10-11 13:39:45', 'admin', '2024-10-14 10:37:07'),
	(62, '01', '101', '키이스케이프 로그인1', '머니머니 패키지', 'G01', '설명이나 내용이 여기에 들어가\n어떤느낌인지 알지? 내용 길게 들어감', 2, 4, 70, 3, 3, '인당 23000', 4.29, 3, 'N', 'N', 0, 'https://www.keyescape.co.kr/web/home.php', '/poster/머니머니 패키지.jpg', 'admin', '2024-10-11 13:39:45', 'admin', '2024-10-14 10:37:07'),
	(63, '01', '101', '단편선 강남', '사람들은 그것을 행복이라 부르기로 했다', 'G01', '설명이나 내용이 여기에 들어가\n어떤느낌인지 알지? 내용 길게 들어감', 2, 4, 65, 5, 5, '인당 23000', 4.11, 3, 'N', 'N', 0, 'https://www.dpsnnn.com/', '/poster/사람들은 그것을 행복이라 부르기로 했다.jpg', 'admin', '2024-10-11 13:39:45', 'admin', '2024-10-14 10:37:07'),
	(64, '01', '101', '키이스케이프 강남 더오름점', '네드', 'G01', '설명이나 내용이 여기에 들어가\n어떤느낌인지 알지? 내용 길게 들어감', 2, 4, 80, 3, 3, '인당 23000', 4.2, 4, 'N', 'N', 0, 'https://www.keyescape.co.kr/web/home.php', '/poster/네드.jpg', 'admin', '2024-10-11 13:39:45', 'admin', '2024-10-14 10:37:07'),
	(65, '01', '101', '키이스케이프 우주라이크', '워너 고 홈', 'G01', '설명이나 내용이 여기에 들어가\n어떤느낌인지 알지? 내용 길게 들어감', 2, 4, 70, 3, 3, '인당 23000', 4.03, 3, 'N', 'N', 0, 'https://www.keyescape.co.kr/web/home.php', '/poster/워너 고 홈.jpg', 'admin', '2024-10-11 13:39:45', 'admin', '2024-10-14 10:37:07'),
	(66, '01', '101', '제로월드 블랙', '제로', 'G01', '설명이나 내용이 여기에 들어가\n어떤느낌인지 알지? 내용 길게 들어감', 2, 4, 70, 2, 2, '인당 23000', 4.41, 4, 'N', 'N', 0, 'https://www.zeroworldblack.com/', '/poster/제로.jpg', 'admin', '2024-10-11 13:39:45', 'admin', '2024-10-14 10:37:07'),
	(67, '01', '101', '키이스케이프 로그인2', 'For Free', 'G01', '설명이나 내용이 여기에 들어가\n어떤느낌인지 알지? 내용 길게 들어감', 2, 4, 65, 5, 5, '인당 23000', 4.3, 3, 'N', 'N', 0, 'https://www.keyescape.co.kr/web/home.php', '/poster/For Free.jpg', 'admin', '2024-10-11 13:39:45', 'admin', '2024-10-14 10:37:07'),
	(68, '01', '101', '키이스케이프 우주라이크', '어스', 'G01', '설명이나 내용이 여기에 들어가\n어떤느낌인지 알지? 내용 길게 들어감', 2, 4, 80, 3, 3, '인당 23000', 4.1, 4, 'N', 'N', 0, 'https://www.keyescape.co.kr/web/home.php', '/poster/어스.jpg', 'admin', '2024-10-11 13:39:45', 'admin', '2024-10-14 10:37:07'),
	(69, '01', '101', '제로월드 강남점', '포레스트', 'G01', '설명이나 내용이 여기에 들어가\n어떤느낌인지 알지? 내용 길게 들어감', 2, 4, 70, 3, 3, '인당 23000', 4.03, 4, 'N', 'N', 0, 'https://zerogangnam.com/reservation', '/poster/포레스트.jpg', 'admin', '2024-10-11 13:39:45', 'admin', '2024-10-14 10:37:07'),
	(70, '01', '101', '비트포비아 던전스텔라', '향', 'G01', '설명이나 내용이 여기에 들어가\n어떤느낌인지 알지? 내용 길게 들어감', 2, 4, 70, 3, 3, '인당 23000', 4.16, 3, 'N', 'N', 0, 'https://xdungeon.net/layout/res/home.php?go=main', '/poster/향.jpg', 'admin', '2024-10-11 13:39:45', 'admin', '2024-10-14 10:37:07'),
	(71, '01', '101', '포인트나인 강남점', '열쇠공의 이중생활', 'G01', '설명이나 내용이 여기에 들어가\n어떤느낌인지 알지? 내용 길게 들어감', 2, 4, 65, 5, 5, '인당 23000', 4.11, 3, 'N', 'N', 0, 'https://point-nine.com/layout/res/home.php?go=main', '/poster/열쇠공의 이중생활.jpg', 'admin', '2024-10-11 13:39:45', 'admin', '2024-10-14 10:37:07'),
	(72, '01', '101', '비트포비아 강남던전 2호점', '메이데이', 'G01', '설명이나 내용이 여기에 들어가\n어떤느낌인지 알지? 내용 길게 들어감', 2, 4, 80, 3, 3, '인당 23000', 4.08, 3, 'N', 'N', 0, 'https://xdungeon.net/layout/res/home.php?go=main', '/poster/메이데이.jpg', 'admin', '2024-10-11 13:39:45', 'admin', '2024-10-14 10:37:07'),
	(73, '01', '101', '비트포비아 강남던전 2', '로스트 킹덤 2', 'G01', '설명이나 내용이 여기에 들어가\n어떤느낌인지 알지? 내용 길게 들어감', 2, 4, 70, 3, 3, '인당 23000', 4.08, 3, 'N', 'N', 0, 'https://xdungeon.net/layout/res/home.php?go=main', '/poster/로스트 킹덤 2.jpg', 'admin', '2024-10-11 13:39:45', 'admin', '2024-10-14 10:37:07'),
	(74, '01', '101', '비트포비아 던전스텔라', '데스티니 앤 타로', 'G01', '설명이나 내용이 여기에 들어가\n어떤느낌인지 알지? 내용 길게 들어감', 2, 4, 65, 1, 1, '인당 23000', 4.1, 4, 'N', 'N', 0, 'https://xdungeon.net/layout/res/home.php?go=main', '/poster/데스티니 앤 타로.jpg', 'admin', '2024-10-11 13:39:45', 'admin', '2024-10-14 10:37:07'),
	(75, '01', '101', '판타스트릭', '태초의 신부: 이브 프로젝트', 'G01', '설명이나 내용이 여기에 들어가\n어떤느낌인지 알지? 내용 길게 들어감', 2, 4, 80, 3, 3, '인당 23000', 4.2, 4, 'N', 'N', 0, 'http://fantastrick.co.kr/', '/poster/이브 프로젝트.jpg', 'admin', '2024-10-11 13:39:45', 'admin', '2024-10-14 10:37:07'),
	(76, '01', '101', '제로월드 강남점', '콜러', 'G01', '설명이나 내용이 여기에 들어가\n어떤느낌인지 알지? 내용 길게 들어감', 2, 4, 70, 2, 2, '인당 23000', 3.98, 4, 'N', 'N', 0, 'https://zerogangnam.com/reservation', '/poster/콜러.jpg', 'admin', '2024-10-11 13:39:45', 'admin', '2024-10-14 10:37:07'),
	(77, '01', '101', '키이스케이프 로그인2', '어 젠틀 먼데이', 'G01', '설명이나 내용이 여기에 들어가\n어떤느낌인지 알지? 내용 길게 들어감', 2, 4, 70, 4, 4, '인당 23000', 4.13, 3, 'N', 'N', 0, 'https://www.keyescape.co.kr/web/home.php', '/poster/어 젠틀 먼데이.jpg', 'admin', '2024-10-11 13:39:45', 'admin', '2024-10-14 10:37:07'),
	(78, '01', '101', '비트포비아 던전 루나', '검은 운명의 밤', 'G01', '설명이나 내용이 여기에 들어가\n어떤느낌인지 알지? 내용 길게 들어감', 2, 4, 70, 5, 5, '인당 23000', 3.96, 3, 'N', 'N', 0, 'https://xdungeon.net/layout/res/home.php?go=main', '/poster/검은 운명의 밤.jpg', 'admin', '2024-10-11 13:39:45', 'admin', '2024-10-14 10:37:07'),
	(79, '01', '101', '제로월드 강남점', '돈', 'G01', '설명이나 내용이 여기에 들어가\n어떤느낌인지 알지? 내용 길게 들어감', 2, 4, 65, 5, 5, '인당 23000', 3.97, 4, 'N', 'N', 0, 'https://zerogangnam.com/reservation', '/poster/돈.jpg', 'admin', '2024-10-11 13:39:45', 'admin', '2024-10-14 10:37:07'),
	(80, '01', '101', '플레이더월드 강남점', '이웃집 또도와', 'G01', '설명이나 내용이 여기에 들어가\n어떤느낌인지 알지? 내용 길게 들어감', 2, 4, 80, 3, 3, '인당 23000', 4.06, 4, 'N', 'N', 0, 'https://booking.naver.com/booking/12/bizes/999864', '/poster/이웃집 또도와.jpg', 'admin', '2024-10-11 13:39:45', 'admin', '2024-10-14 10:37:07'),
	(81, '01', '101', '키이스케이프 스테이션', '머니머니 부동산', 'G01', '설명이나 내용이 여기에 들어가\n어떤느낌인지 알지? 내용 길게 들어감', 2, 4, 70, 5, 5, '인당 23000', 4.48, 3, 'N', 'N', 0, 'https://www.keyescape.co.kr/web/home.php', '/poster/머니머니 부동산.jpg', 'admin', '2024-10-11 13:39:45', 'admin', '2024-10-14 10:37:07'),
	(82, '01', '101', '도어이스케이프 신논현 블루점', 'TRUTH', 'G01', '설명이나 내용이 여기에 들어가\n어떤느낌인지 알지? 내용 길게 들어감', 2, 4, 65, 3, 3, '인당 23000', 4.16, 3, 'N', 'N', 0, 'https://www.doorescape.co.kr/reservation.html?keycode=yGozPSZSJXwrzbin', '/poster/TRUTH.jpg', 'admin', '2024-10-11 13:39:45', 'admin', '2024-10-14 10:37:07'),
	(83, '01', '101', '엑소더스 강남1호점', '클레임', 'G01', '설명이나 내용이 여기에 들어가\n어떤느낌인지 알지? 내용 길게 들어감', 2, 4, 80, 3, 3, '인당 23000', 4, 4, 'N', 'N', 0, 'https://exodusescape.co.kr/layout/res/home.php?go=main', '/poster/클레임.jpg', 'admin', '2024-10-11 13:39:45', 'admin', '2024-10-14 10:37:07'),
	(84, '01', '101', '플레이포인트랩 강남점', '작은 창고', 'G01', '설명이나 내용이 여기에 들어가\n어떤느낌인지 알지? 내용 길게 들어감', 2, 4, 70, 2, 2, '인당 23000', 3.92, 3, 'N', 'N', 0, 'https://www.master-key.co.kr/booking/bk_detail?bid=35', '/poster/작은 창고.jpg', 'admin', '2024-10-11 13:39:45', 'admin', '2024-10-14 10:37:06'),
	(85, '01', '101', '엑소더스 강남점', '위시', 'G01', '설명이나 내용이 여기에 들어가\n어떤느낌인지 알지? 내용 길게 들어감', 2, 4, 80, 5, 5, '인당 23000', 3.94, 3, 'N', 'N', 0, 'https://exodusescape.co.kr/layout/res/home.php?go=main', '/poster/위시.jpg', 'admin', '2024-10-11 13:39:45', 'admin', '2024-10-14 10:37:07'),
	(86, '01', '101', '판타스트릭 2호점', '사자의 서: 북 오브 두아트', 'G01', '설명이나 내용이 여기에 들어가\n어떤느낌인지 알지? 내용 길게 들어감', 2, 4, 70, 3, 3, '인당 23000', 4.04, 4, 'N', 'N', 0, 'http://fantastrick.co.kr/', '/poster/북 오브 두아트.jpg', 'admin', '2024-10-11 13:39:45', 'admin', '2024-10-14 10:37:07'),
	(87, '01', '101', '포인트나인 강남2호점', '홈타운', 'G01', '설명이나 내용이 여기에 들어가\n어떤느낌인지 알지? 내용 길게 들어감', 2, 4, 65, 3, 3, '인당 23000', 4.25, 3, 'N', 'N', 0, 'https://point-nine.com/layout/res/home.php?go=main', '/poster/홈타운.jpg', 'admin', '2024-10-11 13:39:45', 'admin', '2024-10-14 10:37:07'),
	(88, '01', '101', '포인트나인 강남점', '눈먼 귀금속 상인의 후회', 'G01', '설명이나 내용이 여기에 들어가\n어떤느낌인지 알지? 내용 길게 들어감', 2, 4, 80, 3, 3, '인당 23000', 3.96, 3, 'N', 'N', 0, 'https://point-nine.com/layout/res/home.php?go=main', '/poster/눈먼 귀금속 상인의 후회.jpg', 'admin', '2024-10-11 13:39:45', 'admin', '2024-10-14 10:37:07'),
	(89, '01', '101', '이룸에이트', '낙원', 'G01', '설명이나 내용이 여기에 들어가\n어떤느낌인지 알지? 내용 길게 들어감', 2, 4, 70, 5, 5, '인당 23000', 3.92, 4, 'N', 'N', 0, 'https://eroom8.co.kr/layout/res/home.php?go=main', '/poster/낙원.jpg', 'admin', '2024-10-11 13:39:45', 'admin', '2024-10-14 10:37:07'),
	(90, '01', '101', '이룸에이트', '고인', 'G01', '설명이나 내용이 여기에 들어가\n어떤느낌인지 알지? 내용 길게 들어감', 2, 4, 70, 3, 3, '인당 23000', 4.2, 4, 'N', 'N', 0, 'https://eroom8.co.kr/layout/res/home.php?go=main', '/poster/고인.jpg', 'admin', '2024-10-11 13:39:45', 'admin', '2024-10-14 10:37:07'),
	(94, '01', '103', '라이브시네마', '학교', 'G01', '기다렸어 나의 오랜 친구들\n\n학교\n\n-그날의 이야기-', 3, 4, 100, 2, 3, '고정 220000', 4.8, 2, 'Y', 'Y', 164, 'https://map.naver.com/p/search/%EB%9D%BC%EC%9D%B4%EB%B8%8C%EC%8B%9C%EB%84%A4%EB%A7%88/place/1214295834?c=15.00,0,0,0,dh&placePath=/ticket', '/poster/학교.jpg', 'admin', '2024-10-14 14:24:58', 'admin', '2024-10-23 12:20:59');

-- 테이블 inno_nest.tb_likes 구조 내보내기
DROP TABLE IF EXISTS `tb_likes`;
CREATE TABLE IF NOT EXISTS `tb_likes` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `USER_ID` varchar(36) NOT NULL,
  `THEME_ID` int(11) NOT NULL,
  `CREATED_TIME` datetime NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`ID`) USING BTREE,
  KEY `USER_ID` (`USER_ID`),
  KEY `THEME_ID` (`THEME_ID`),
  CONSTRAINT `tb_likes_ibfk_1` FOREIGN KEY (`USER_ID`) REFERENCES `tb_member` (`USER_ID`) ON DELETE CASCADE,
  CONSTRAINT `tb_likes_ibfk_2` FOREIGN KEY (`THEME_ID`) REFERENCES `escape_room_list` (`ID`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- 테이블 데이터 inno_nest.tb_likes:~8 rows (대략적) 내보내기
REPLACE INTO `tb_likes` (`ID`, `USER_ID`, `THEME_ID`, `CREATED_TIME`) VALUES
	(1, 'admin', 94, '2024-10-15 12:12:16'),
	(3, 'admin', 42, '2024-10-15 12:27:00'),
	(4, 'admin', 30, '2024-10-15 12:29:41'),
	(9, 'admin', 35, '2024-10-15 12:37:01'),
	(13, 'test', 33, '2024-10-15 13:09:24'),
	(14, 'test', 94, '2024-10-15 13:12:11'),
	(15, 'test', 21, '2024-10-15 13:12:18'),
	(16, 'admin', 21, '2024-10-15 13:19:58');

-- 테이블 inno_nest.tb_member 구조 내보내기
DROP TABLE IF EXISTS `tb_member`;
CREATE TABLE IF NOT EXISTS `tb_member` (
  `USER_ID` varchar(36) NOT NULL,
  `USER_NM` varchar(100) NOT NULL,
  `NICK_NM` varchar(100) NOT NULL,
  `PASSWORD` varchar(1000) NOT NULL,
  `PHONE` varchar(20) NOT NULL,
  `EMAIL` varchar(255) NOT NULL,
  `BIRTH` varchar(15) NOT NULL,
  `ROLE` varchar(50) NOT NULL DEFAULT 'USER',
  `BIO` text DEFAULT NULL,
  `PROFILE_PICTURE` varchar(255) DEFAULT 'https://picsum.photos/200/300',
  `ADDRESS` varchar(255) DEFAULT NULL,
  `USE_YN` char(1) DEFAULT 'Y',
  `UPDATEDATE` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `CREATEDATE` datetime NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`USER_ID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- 테이블 데이터 inno_nest.tb_member:~5 rows (대략적) 내보내기
REPLACE INTO `tb_member` (`USER_ID`, `USER_NM`, `NICK_NM`, `PASSWORD`, `PHONE`, `EMAIL`, `BIRTH`, `ROLE`, `BIO`, `PROFILE_PICTURE`, `ADDRESS`, `USE_YN`, `UPDATEDATE`, `CREATEDATE`) VALUES
	('admin', 'admin', 'ADMIN', 'c7ad44cbad762a5da0a452f9e854fdc1e0e7a52a38015f23f3eab1d80b931dd472634dfac71cd34ebc35d16ab7fb8a90c81f975113d6c7538dc69dd8de9077ec', '010-0000-0000', 'admin@gmail.com', '1995-10-04', 'ADMIN', '반가웡', 'https://picsum.photos/200/300', '서울시 동작구', 'Y', '2024-10-17 16:52:30', '2024-10-11 14:47:45'),
	('admin1', 'admin1', 'ADMIN1', '9a2a1b139cdff9bf3096fd7ee9ba1ca904dac6647fc621814cf8e36812d46399354da9c91b79bd1244d7e1eb69567c0628bd7eadeb1f40951fd17a53da7ad70c', '010-1111-1111', 'admin1@gmail.com', '1995-01-11', 'USER', NULL, 'https://picsum.photos/200/300', '경기 양주시 평화로1429번길 3-1 쉬즈빌 201 (덕계동)', 'Y', '2024-10-17 16:52:35', '2024-10-17 13:58:39'),
	('edohan', 'edohan', 'EDOHAN', '382f12819980f53d294ad54b29d3ce3f7c5e66652319eeb27b29ab95e82d7bb6eb8eda63c3464cdcc853fe010fd424e8f550183a54c171aded91de8179ac809d', '010-0000-2905', 'edohan@gmail.com', '1995-01-17', 'USER', '반가웡', 'https://picsum.photos/200/300', '서울시 동작구', 'N', '2024-10-17 16:52:41', '2024-10-11 14:47:45'),
	('test', 'test', 'TEST', 'ee26b0dd4af7e749aa1a8ee3c10ae9923f618980772e473f8819a5d4940e0db27ac185f8a0e1d5f84f88bc887fd67b143732c304cc5fa9ad8e6f57f50028a8ff', '010-0000-0001', 'test@gmail.com', '1999-01-11', 'USER', '반가웡', 'https://picsum.photos/200/300', '서울시 동작구', 'Y', '2024-10-17 16:52:25', '2024-10-11 14:47:45'),
	('testid', '테스트', 'Tes', '345cd572ba0f6b2a85ef3fd56a152c88e9e1c7f65a8b3d5c15ed809765bc399c55f6ce970a13433c333c4e063298597bc50ad2093ce9d4cd93aea3c3ac127a53', '010-1234-5678', 'testid@gmail.com', '1995-01-17', 'USER', NULL, 'https://picsum.photos/200/300', '서울 중구 충무로 2 여기 예용 (필동1가)', 'Y', '2024-10-18 09:20:42', '2024-10-18 09:20:42');

-- 테이블 inno_nest.tb_notice 구조 내보내기
DROP TABLE IF EXISTS `tb_notice`;
CREATE TABLE IF NOT EXISTS `tb_notice` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TITLE` varchar(255) NOT NULL,
  `CONTENT` text NOT NULL,
  `WRITER` varchar(100) NOT NULL,
  `CREATEDATE` timestamp NULL DEFAULT current_timestamp(),
  `UPDATEDATE` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- 테이블 데이터 inno_nest.tb_notice:~15 rows (대략적) 내보내기
REPLACE INTO `tb_notice` (`ID`, `TITLE`, `CONTENT`, `WRITER`, `CREATEDATE`, `UPDATEDATE`) VALUES
	(1, '공지사항 1', '이것은 첫 번째 공지사항입니다. 관련된 내용은 아래를 참고하세요.', '관리자', '2024-10-11 06:04:27', '2024-10-11 06:04:27'),
	(2, '공지사항 2', '두 번째 공지사항입니다. 자세한 내용은 홈페이지를 방문해주세요.', '관리자', '2024-10-11 06:04:27', '2024-10-11 06:04:27'),
	(3, '공지사항 3', '세 번째 공지사항입니다. 모든 회원님들께 필독 부탁드립니다.', '관리자', '2024-10-11 06:04:27', '2024-10-11 06:04:27'),
	(4, '공지사항 4', '네 번째 공지사항입니다. 이벤트에 대한 정보입니다.', '관리자', '2024-10-11 06:04:27', '2024-10-11 06:04:27'),
	(5, '공지사항 5', '다섯 번째 공지사항입니다. 업데이트 일정에 대한 안내입니다.', '관리자', '2024-10-11 06:04:27', '2024-10-11 06:04:27'),
	(6, '공지사항 6', '여섯 번째 공지사항입니다. 서비스 점검에 대한 내용입니다.', '관리자', '2024-10-11 06:04:27', '2024-10-11 06:04:27'),
	(7, '공지사항 7', '일곱 번째 공지사항입니다. 새로운 기능이 추가되었습니다.', '관리자', '2024-10-11 06:04:27', '2024-10-11 06:04:27'),
	(8, '공지사항 8', '여덟 번째 공지사항입니다. 설문조사 참여를 부탁드립니다.', '관리자', '2024-10-11 06:04:27', '2024-10-11 06:04:27'),
	(9, '공지사항 9', '아홉 번째 공지사항입니다. 회원 가입 이벤트가 진행 중입니다.', '관리자', '2024-10-11 06:04:27', '2024-10-11 06:04:27'),
	(10, '공지사항 10', '열 번째 공지사항입니다. 플랫폼 이용 안내입니다.', '관리자', '2024-10-11 06:04:27', '2024-10-11 06:04:27'),
	(11, '공지사항 11', '열한 번째 공지사항입니다. 보안 업데이트 관련 안내입니다.', '관리자', '2024-10-11 06:04:27', '2024-10-11 06:04:27'),
	(12, '공지사항 12', '열두 번째 공지사항입니다. 고객센터 운영시간 안내입니다.', '관리자', '2024-10-11 06:04:27', '2024-10-11 06:04:27'),
	(13, '공지사항 13', '열세 번째 공지사항입니다. 새해 복 많이 받으세요!', '관리자', '2024-10-11 06:04:27', '2024-10-11 06:04:27'),
	(14, '공지사항 14', '열네 번째 공지사항입니다. 임시 점검 공지입니다.', '관리자', '2024-10-11 06:04:27', '2024-10-11 06:04:27'),
	(15, '공지사항 15', '열다섯 번째 공지사항입니다. 추후 공지 사항입니다.', '관리자', '2024-10-11 06:04:27', '2024-10-11 06:04:27');

-- 테이블 inno_nest.tb_reviews 구조 내보내기
DROP TABLE IF EXISTS `tb_reviews`;
CREATE TABLE IF NOT EXISTS `tb_reviews` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `USER_ID` varchar(36) NOT NULL,
  `THEME_ID` int(11) NOT NULL,
  `CONTENT` text NOT NULL,
  `RATING` int(11) DEFAULT NULL CHECK (`RATING` between 0 and 5),
  `PLAY_DATE` date DEFAULT NULL,
  `SUCCESS_FLAG` char(1) DEFAULT NULL,
  `LEVEL` int(11) DEFAULT NULL CHECK (`LEVEL` between 1 and 5),
  `LEFT_TIME` varchar(20) DEFAULT NULL,
  `CREATED_TIME` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`ID`),
  KEY `THEME_id` (`THEME_ID`) USING BTREE,
  KEY `user_id` (`USER_ID`) USING BTREE,
  CONSTRAINT `tb_reviews_ibfk_1` FOREIGN KEY (`USER_ID`) REFERENCES `tb_member` (`USER_ID`),
  CONSTRAINT `tb_reviews_ibfk_2` FOREIGN KEY (`THEME_ID`) REFERENCES `escape_room_list` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- 테이블 데이터 inno_nest.tb_reviews:~0 rows (대략적) 내보내기

-- 테이블 inno_nest.token_storage 구조 내보내기
DROP TABLE IF EXISTS `token_storage`;
CREATE TABLE IF NOT EXISTS `token_storage` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `USER_ID` varchar(50) NOT NULL,
  `EMAIL` varchar(255) NOT NULL,
  `TOKEN` char(6) NOT NULL,
  `CREATED_TIME` timestamp NOT NULL DEFAULT current_timestamp(),
  `EXPIRES_TIME` timestamp NOT NULL,
  `STATUS` enum('ACTIVE','USED') DEFAULT 'ACTIVE',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `TOKEN` (`TOKEN`),
  KEY `USER_ID` (`USER_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- 테이블 데이터 inno_nest.token_storage:~7 rows (대략적) 내보내기
REPLACE INTO `token_storage` (`ID`, `USER_ID`, `EMAIL`, `TOKEN`, `CREATED_TIME`, `EXPIRES_TIME`, `STATUS`) VALUES
	(1, 'testid1', 'axszax@naver.com', '985931', '2024-10-18 03:55:01', '2024-10-18 04:00:01', 'USED'),
	(2, 'testid1', 'axszax@naver.com', '100277', '2024-10-18 04:21:19', '2024-10-18 04:26:19', 'USED'),
	(3, 'testid1', 'axszax@naver.com', '057307', '2024-10-18 04:22:53', '2024-10-18 04:27:53', 'USED'),
	(4, 'testid1', 'axszax@naver.com', '383556', '2024-10-18 04:26:23', '2024-10-18 04:31:23', 'USED'),
	(5, 'testid1', 'axszax@naver.com', '916417', '2024-10-18 04:28:36', '2024-10-18 04:33:36', 'USED'),
	(6, 'testid1', 'axszax@naver.com', '652985', '2024-10-18 04:31:23', '2024-10-18 04:36:23', 'USED'),
	(7, 'testid1', 'axszax@naver.com', '047930', '2024-10-18 04:32:31', '2024-10-18 04:37:31', 'USED');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
