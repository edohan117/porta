-- porta 데이터베이스 구조 내보내기
DROP DATABASE IF EXISTS `porta`;
CREATE DATABASE IF NOT EXISTS `porta` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;
USE `porta`;

-- 테이블 porta.common_code 구조 내보내기
DROP TABLE IF EXISTS `common_code`;
CREATE TABLE IF NOT EXISTS `common_code` (
  `CODE_TYPE` varchar(10) NOT NULL COMMENT '코드 타입',
  `CODE_VAL` varchar(10) NOT NULL COMMENT '코드 값',
  `CODE_NM` varchar(100) DEFAULT NULL COMMENT '코드 이름',
  `PARENT_CD` varchar(10) DEFAULT NULL COMMENT '상위 코드 값',
  PRIMARY KEY (`CODE_TYPE`,`CODE_VAL`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- 테이블 porta.link_list 구조 내보내기
DROP TABLE IF EXISTS `link_list`;
CREATE TABLE IF NOT EXISTS `link_list` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TITLE` varchar(255) NOT NULL,
  `CONTENT` text DEFAULT NULL,
  `RECO` char(1) DEFAULT 'N',			-- 추천
  `NEW_YN` char(1) DEFAULT 'N',
  `HIT` int(50) DEFAULT 0,
  `SITE` varchar(500) DEFAULT NULL,
  `IMG_PATH` varchar(255) DEFAULT NULL,
  `CREATED_ID` varchar(100) NOT NULL,
  `CREATED_TIME` datetime NOT NULL DEFAULT current_timestamp(),
  `UPDATED_ID` varchar(100) DEFAULT NULL,
  `UPDATED_TIME` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=97 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- 테이블 porta.tb_pin 구조 내보내기
DROP TABLE IF EXISTS `tb_pin`;
CREATE TABLE IF NOT EXISTS `tb_pin` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `USER_ID` varchar(36) NOT NULL,
  `LINK_ID` int(11) NOT NULL,
  `CREATED_TIME` datetime NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`ID`) USING BTREE,
  KEY `USER_ID` (`USER_ID`),
  KEY `LINK_ID` (`LINK_ID`),
  CONSTRAINT `tb_pin_ibfk_1` FOREIGN KEY (`USER_ID`) REFERENCES `tb_member` (`USER_ID`) ON DELETE CASCADE,
  CONSTRAINT `tb_pin_ibfk_2` FOREIGN KEY (`LINK_ID`) REFERENCES `link_list` (`ID`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- 테이블 porta.tb_member 구조 내보내기
DROP TABLE IF EXISTS `tb_member`;
CREATE TABLE IF NOT EXISTS `tb_member` (
  `USER_ID` varchar(36) NOT NULL,
  `USER_NM` varchar(100) NOT NULL,
  `NICK_NM` varchar(100) NOT NULL,
  `PASSWORD` varchar(1000) NOT NULL,
  `EMAIL` varchar(255) NOT NULL,
  `ROLE` varchar(50) NOT NULL DEFAULT 'USER',
  `USE_YN` char(1) DEFAULT 'Y',
  `UPDATEDATE` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `CREATEDATE` datetime NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`USER_ID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- 테이블 porta.tb_notice 구조 내보내기
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

-- 테이블 데이터 porta.tb_notice:~15 rows (대략적) 내보내기
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

-- 테이블 porta.token_storage 구조 내보내기
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