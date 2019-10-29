-- DB
CREATE DATABASE ts_pj;
USE ts_pj

-- tbl_class
CREATE TABLE `tbl_class` (
   `class_id` int(11) NOT NULL AUTO_INCREMENT,
   `user_id` varchar(255) NOT NULL COMMENT '튜터 아이디',
   `class_name` varchar(255) DEFAULT NULL COMMENT '강의 이름',
   `class_regdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '강의 등로일',
   `class_student_cnt` int(11) DEFAULT NULL COMMENT '강의 최대 인원 수',
   `class_image` varchar(255) DEFAULT NULL COMMENT '강의 사진',
   `class_price` int(11) DEFAULT NULL COMMENT '강의 가격',
   `class_summary` varchar(255) DEFAULT NULL COMMENT '강의 요약',
   `class_content` text COMMENT '강의 상세설명',
   `class_MON` varchar(255) DEFAULT NULL COMMENT '가능한 시간',
   `class_TUE` varchar(255) DEFAULT NULL COMMENT '가능한 시간',
   `class_WED` varchar(255) DEFAULT NULL COMMENT '가능한 시간',
   `class_THU` varchar(255) DEFAULT NULL COMMENT '가능한 시간',
   `class_FRI` varchar(255) DEFAULT NULL COMMENT '가능한 시간',
   `class_SAT` varchar(255) DEFAULT NULL COMMENT '가능한 시간',
   `class_SUN` varchar(255) DEFAULT NULL COMMENT '가능한 시간',
   `class_lat` double DEFAULT NULL COMMENT '위도',
   `class_lng` double DEFAULT NULL COMMENT '경도',
   `class_maincategories` varchar(255) DEFAULT NULL COMMENT '클래스 카테고리',
   `class_startday` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '강의 시작날짜',
   `class_endday` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '강의 종료날짜',
   `class_subcategories` varchar(255) DEFAULT NULL COMMENT '서브카테고리',
   `class_teacher_name` varchar(255) DEFAULT NULL COMMENT '튜터 이름',
   `class_youtube` varchar(255) DEFAULT NULL COMMENT '강의 유튜브링크',
   PRIMARY KEY (`class_id`),
   KEY `fk1_tbl_class` (`user_id`),
   CONSTRAINT `fk1_tbl_class` FOREIGN KEY (`user_id`) REFERENCES `tbl_user` (`user_id`) ON DELETE CASCADE
 ) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8

-- tbl_enrolment
CREATE TABLE `tbl_enrolment` (
   `enrolment_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '수강등록 id',
   `user_id` varchar(255) NOT NULL,
   `enrolment_classname` varchar(255) NOT NULL COMMENT '수강등록 강의명',
   `enrolment_review` varchar(255) DEFAULT NULL COMMENT '수강등록 리뷰',
   `enrolment_reviewdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '수강리뷰 등록일',
   `enrolment_class_id` int(11) NOT NULL COMMENT '강의 id',
   `enrolment_rating` double DEFAULT '0' COMMENT '수강 평점',
   PRIMARY KEY (`enrolment_id`),
   KEY `fk1_tbl_enrolment` (`user_id`),
   KEY `fk2_tbl_enrolment` (`enrolment_class_id`),
   CONSTRAINT `fk1_tbl_enrolment` FOREIGN KEY (`user_id`) REFERENCES `tbl_user` (`user_id`) ON DELETE CASCADE,
   CONSTRAINT `fk2_tbl_enrolment` FOREIGN KEY (`enrolment_class_id`) REFERENCES `tbl_class` (`class_id`) ON DELETE CASCADE
 ) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8

-- tbl_user
CREATE TABLE `tbl_user` (
   `user_id` varchar(255) NOT NULL COMMENT '유저id',
   `user_pw` varchar(255) NOT NULL COMMENT '유저pw',
   `user_name` varchar(255) NOT NULL COMMENT '유저 이름',
   `user_birth` varchar(255) NOT NULL COMMENT '유저 생년월일',
   `user_image` varchar(255) DEFAULT NULL COMMENT '유저 사진',
   `user_sex` int(11) NOT NULL COMMENT '유저 성별',
   `user_status` text COMMENT '유저 상태메세지',
   `user_youtube` varchar(255) DEFAULT NULL COMMENT '유저 유튜브 링크',
   `user_auth` int(11) NOT NULL COMMENT '유저 튜터인지 튜티인지 확인 1이면 튜티, 2이면 튜터',
   `user_regdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '유저 등록일',
   `user_moddate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '유저 수정일',
   `user_sessionkey` varchar(255) NOT NULL COMMENT '유저 로그인세션키',
   `user_sessionlimit` timestamp NULL DEFAULT NULL COMMENT '유저 로그인 세션시간(자동로그인시 필요)',
   `user_rating` double DEFAULT '0' COMMENT '유저 평균 평점',
   PRIMARY KEY (`user_id`)
 ) ENGINE=InnoDB DEFAULT CHARSET=utf8

-- tbl_user
CREATE TABLE `tbl_image` (
   `image_id` mediumint(9) NOT NULL AUTO_INCREMENT,
   `image_name` varchar(255) NOT NULL,
   `user_id` varchar(255) DEFAULT NULL,
   `class_id` int(11) DEFAULT NULL,
   `image_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
   PRIMARY KEY (`image_id`),
   KEY `class_id_idx` (`class_id`),
   KEY `user_id_idx` (`user_id`),
   CONSTRAINT `class_id` FOREIGN KEY (`class_id`) REFERENCES `tbl_class` (`class_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
   CONSTRAINT `user_id` FOREIGN KEY (`user_id`) REFERENCES `tbl_user` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
 ) ENGINE=InnoDB AUTO_INCREMENT=203 DEFAULT CHARSET=utf8


 