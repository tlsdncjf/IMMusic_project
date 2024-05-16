DROP DATABASE IF EXISTS `IMMusicDB`;
CREATE DATABASE `IMMusicDB`;
USE `IMMusicDB`;

# press 테이블 생성
CREATE TABLE press(
    id INT(10) UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
    regDate DATETIME NOT NULL,
    updateDate DATETIME NOT NULL,
    title CHAR(100) NOT NULL,
    `body` TEXT NOT NULL
);

# member 테이블 생성
CREATE TABLE `member`(
    id INT(10) UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
    regDate DATETIME NOT NULL,
    updateDate DATETIME NOT NULL,
    loginId CHAR(20) NOT NULL,
    loginPw CHAR(80) NOT NULL,
    `authLevel` SMALLINT(2) UNSIGNED DEFAULT 3 COMMENT '권한 레벨 (3=일반,7=관리자)',
    `name` CHAR(20) NOT NULL,
    nickname CHAR(20) NOT NULL,
    cellphoneNum CHAR(20) NOT NULL,
    email CHAR(50) NOT NULL,
    delStatus TINYINT(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '탈퇴 여부 (0=탈퇴 전, 1=탈퇴 후)',
    delDate DATETIME COMMENT '탈퇴 날짜'
);


# press TD 생성
INSERT INTO press
SET regDate = NOW(),
updateDate = NOW(),
title = '제목1',
`body` = '내용1';

INSERT INTO press
SET regDate = NOW(),
updateDate = NOW(),
title = '제목2',
`body` = '내용2';

INSERT INTO press
SET regDate = NOW(),
updateDate = NOW(),
title = '제목3',
`body` = '내용3';

INSERT INTO press
SET regDate = NOW(),
updateDate = NOW(),
title = '제목4',
`body` = '내용4';

INSERT INTO press
SET regDate = NOW(),
updateDate = NOW(),
title = '제목5',
`body` = '내용5';

INSERT INTO press
SET regDate = NOW(),
updateDate = NOW(),
title = '제목6',
`body` = '내용6';

# member TD 생성
# (관리자)
INSERT INTO `member`
SET regDate = NOW(),
updateDate = NOW(),
loginId = 'admin',
loginPw = 'admin',
`authLevel` = 7,
`name` = '관리자',
nickname = '관리자',
cellphoneNum = '01012341234',
email = 'abcd@gmail.com';

# (일반)
INSERT INTO `member`
SET regDate = NOW(),
updateDate = NOW(),
loginId = 'test1',
loginPw = 'test1',
`name` = '회원1',
nickname = '회원1',
cellphoneNum = '01043214321',
email = 'abcde@gmail.com';

# (일반)
INSERT INTO `member`
SET regDate = NOW(),
updateDate = NOW(),
loginId = 'test2',
loginPw = 'test2',
`name` = '회원2',
nickname = '회원2',
cellphoneNum = '01056785678',
email = 'abcdef@gmail.com';

ALTER TABLE press ADD COLUMN memberId INT(10) UNSIGNED NOT NULL AFTER updateDate;

UPDATE press
SET memberId = 2
WHERE id IN (1,2);

UPDATE press
SET memberId = 3
WHERE id IN (3,4);


# board 테이블 생성
CREATE TABLE board(
    id INT(10) UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
    regDate DATETIME NOT NULL,
    updateDate DATETIME NOT NULL,
    `code` CHAR(50) NOT NULL UNIQUE COMMENT 'notice(공지사항), free(자유), QnA(질의응답) ...',
    `name` CHAR(20) NOT NULL UNIQUE COMMENT '게시판 이름',
    delStatus TINYINT(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '삭제 여부 (0=삭제 전, 1=삭제 후)',
    delDate DATETIME COMMENT '삭제 날짜'
);

# board TD 생성
INSERT INTO board
SET regDate = NOW(),
updateDate = NOW(),
`code` = 'NOTICE',
`name` = '공지사항';

INSERT INTO board
SET regDate = NOW(),
updateDate = NOW(),
`code` = 'FREE',
`name` = '자유';

INSERT INTO board
SET regDate = NOW(),
updateDate = NOW(),
`code` = 'QnA',
`name` = '질의응답';

ALTER TABLE press ADD COLUMN boardId INT(10) UNSIGNED NOT NULL AFTER `memberId`;

UPDATE press
SET boardId = 1
WHERE id IN (1,2);

UPDATE press
SET boardId = 2
WHERE id = 3;

UPDATE press
SET boardId = 3
WHERE id = 4;




# 파일 테이블 추가
CREATE TABLE genFile (
  id INT(10) UNSIGNED NOT NULL  AUTO_INCREMENT, # 번호
  regDate DATETIME DEFAULT NULL, # 작성날짜
  updateDate DATETIME DEFAULT NULL, # 갱신날짜
  delDate DATETIME DEFAULT NULL, # 삭제날짜
  delStatus TINYINT(1) UNSIGNED NOT NULL DEFAULT 0, # 삭제상태(0:미삭제,1:삭제)
  relTypeCode CHAR(50) NOT NULL, # 관련 데이터 타입(press, member)
  relId INT(10) UNSIGNED NOT NULL, # 관련 데이터 번호
  originFileName VARCHAR(100) NOT NULL, # 업로드 당시의 파일이름
  fileExt CHAR(10) NOT NULL, # 확장자
  typeCode CHAR(20) NOT NULL, # 종류코드 (common)
  type2Code CHAR(20) NOT NULL, # 종류2코드 (attatchment)
  fileSize INT(10) UNSIGNED NOT NULL, # 파일의 사이즈
  fileExtTypeCode CHAR(10) NOT NULL, # 파일규격코드(img, video)
  fileExtType2Code CHAR(10) NOT NULL, # 파일규격2코드(jpg, mp4)
  fileNo SMALLINT(2) UNSIGNED NOT NULL, # 파일번호 (1)
  fileDir CHAR(20) NOT NULL, # 파일이 저장되는 폴더명
  PRIMARY KEY (id),
  KEY relId (relTypeCode,relId,typeCode,type2Code,fileNo)
);

# 기존의 회원 비번을 암호화
UPDATE `member`
SET loginPw = SHA2(loginPw,256);

############### IMMusic DB 작성 -> 이후에 위의 쿼리들하고 자바 레포지터리 다 정리 ###########

# about 테이블 추가
CREATE TABLE about(
  id INT(10) UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT, # 번호
  regDate DATETIME DEFAULT NULL, # 작성날짜
  updateDate DATETIME DEFAULT NULL, # 갱신날짜
  greet TEXT NOT NULL
);

# artist 테이블 추가
CREATE TABLE artist(
  id INT(10) UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT, # 번호
  `name` CHAR(10) NOT NULL,
  birth CHAR(10) NOT NULL,
  gender TINYINT(1) NOT NULL, # 0=남성, 1=여성
  phone CHAR(255) NOT NULL, 
  email CHAR(255) NOT NULL, 
  postcode CHAR(10) NOT NULL, 
  address CHAR(255) NOT NULL, 
  major CHAR(20) NOT NULL, 
  sns CHAR(50) NOT NULL, 
  photo CHAR(255) NOT NULL,
  career CHAR(255) NOT NULL,
  introduction TEXT NOT NULL,
  regDate DATETIME DEFAULT NULL, # 작성날짜
  updateDate DATETIME DEFAULT NULL, # 갱신날짜
  delStatus TINYINT(1) UNSIGNED NOT NULL DEFAULT 0, # 삭제상태(0:미삭제,1:삭제)
  delDate DATETIME DEFAULT NULL # 삭제날짜
);


# contact_artist 테이블 추가
CREATE TABLE contact_artist (
  id INT(10) UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT, # 번호
  a_name CHAR(10) NOT NULL,
  a_birth CHAR(10) NOT NULL,
  a_gender TINYINT(1) NOT NULL, # 0=남성, 1=여성
  a_phone CHAR(255) NOT NULL, 
  a_email CHAR(255) NOT NULL, 
  a_postcode CHAR(10) NOT NULL, 
  a_address CHAR(255) NOT NULL, 
  a_major CHAR(10) NOT NULL, 
  a_sns CHAR(50) NOT NULL, 
  # a_photo CHAR(255) NOT NULL,
  # a_career CHAR(255) NOT NULL,
  a_introduction TEXT NOT NULL,
  a_check TINYINT(1) UNSIGNED NOT NULL, # 개인정보 동의(0:비동의,1:동의)
  regDate DATETIME DEFAULT NULL, # 작성날짜
  updateDate DATETIME DEFAULT NULL, # 갱신날짜
  delStatus TINYINT(1) UNSIGNED NOT NULL DEFAULT 0, # 삭제상태(0:미삭제,1:삭제)
  delDate DATETIME DEFAULT NULL # 삭제날짜
);

#contact_artist TD
INSERT INTO contact_artist
SET regDate = NOW(),
updateDate = NOW(),
a_name = '테이름',
a_birth ='1988-10-2',
a_gender = 1,
a_phone = '01029382938',
a_email = 'test@test.com',
a_postcode= 2323,
a_address = '대전시 실험구',
a_major = '기타',
a_sns = '카톡',
a_introduction = '소개글 내용임',
a_check= 1;

INSERT INTO contact_artist
SET regDate = NOW(),
updateDate = NOW(),
a_name = '테이름2',
a_birth ='1988-10-2',
a_gender = 1,
a_phone = '01029382323',
a_email = 'test2@test.com',
a_postcode= 2323,
a_address = '대전시 실험구2',
a_major = '기타2',
a_sns = '카톡2',
a_introduction = '소개글 내용임2',
a_check= 1;

# contact 테이블 추가
CREATE TABLE contact_concert (
  id INT(10) UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT, # 번호
  c_name CHAR(10) NOT NULL,
  c_email CHAR(255) NOT NULL,
  c_phone CHAR(255) NOT NULL,
  c_date CHAR(10) NOT NULL,
  c_postcode CHAR(10) NOT NULL, 
  c_address CHAR(255) NOT NULL, 
  c_inquiry TEXT NOT NULL,
  c_check TINYINT(1) UNSIGNED NOT NULL, # 개인정보 동의(0:비동의,1:동의)
  regDate DATETIME DEFAULT NULL, # 작성날짜
  updateDate DATETIME DEFAULT NULL, # 갱신날짜
  delStatus TINYINT(1) UNSIGNED NOT NULL DEFAULT 0, # 삭제상태(0:미삭제,1:삭제)
  delDate DATETIME DEFAULT NULL # 삭제날짜
);

#contact_concert TD
INSERT INTO contact_concert
SET regDate = NOW(),
updateDate = NOW(),
c_name = '연주수요기관',
c_email = 'institute@test.com',
c_phone = '01092923256',
c_date = '2024-05-12',
c_postcode = 12534,
c_address = '수원시 평평',
c_inquiry = '문의사항 내용임',
c_check = 1;

INSERT INTO contact_concert
SET regDate = NOW(),
updateDate = NOW(),
c_name = '연주수요기관2',
c_email = 'institute2@test.com',
c_phone = '01092922222',
c_date = '2024-05-12',
c_postcode = 12534,
c_address = '수원시 평평2',
c_inquiry = '문의사항 내용임2',
c_check = 1;

###############################################

SELECT MAX(id) FROM press;

SELECT * FROM press;

SELECT * FROM `member`;

SELECT * FROM `genFile`;

SELECT * FROM about;

SELECT * FROM artist;

SELECT * FROM contact_artist;

SELECT * FROM contact_concert;


