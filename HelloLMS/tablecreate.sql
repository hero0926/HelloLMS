CREATE TABLE `advertisement` (
  `adxseq` int(9) NOT NULL AUTO_INCREMENT,
  `adxname1` varchar(100) DEFAULT NULL,
  `adxurl1` varchar(100) DEFAULT NULL,
  `adxname2` varchar(100) DEFAULT NULL,
  `adxurl2` varchar(100) DEFAULT NULL,
  `adxname3` varchar(100) DEFAULT NULL,
  `adxurl3` varchar(100) DEFAULT NULL,
  `regdate` char(8) CHARACTER SET latin1 DEFAULT NULL,
  PRIMARY KEY (`adxseq`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

CREATE TABLE `apply` (
  `axseq` int(9) NOT NULL AUTO_INCREMENT COMMENT '신청일련번호',
  `coxseq` int(9) NOT NULL COMMENT '과정일련번호',
  `mxseq` int(9) NOT NULL COMMENT '회원일련번호',
  `axstatus` char(1) CHARACTER SET latin1 NOT NULL COMMENT '신청상태',
  `axscore` decimal(5,2) DEFAULT NULL COMMENT '평가점수',
  `axresult` char(1) CHARACTER SET latin1 DEFAULT NULL COMMENT '평가결과',
  `regdate` char(8) CHARACTER SET latin1 NOT NULL COMMENT '신청일',
  PRIMARY KEY (`axseq`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


CREATE TABLE `board_notice` (
  `bxnseq` int(9) NOT NULL AUTO_INCREMENT COMMENT '공지사항일련번호',
  `bxngrid` int(9) NOT NULL COMMENT '기업ID',
  `bxnno` int(9) NOT NULL COMMENT '공지 번호',
  `bxnsubject` varchar(30) NOT NULL COMMENT '공지 제목',
  `bxncontent` varchar(30) NOT NULL COMMENT '공지 내용',
  `bxncnt` int(9) NOT NULL COMMENT '공지 조회수',
  `regdate` char(8) CHARACTER SET latin1 DEFAULT NULL COMMENT '공지 작성일',
  PRIMARY KEY (`bxnseq`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='공지사항 게시판';


CREATE TABLE `board_qna` (
  `bxqseq` int(9) NOT NULL AUTO_INCREMENT COMMENT 'Q&A 일련번호',
  `bxqno` int(9) NOT NULL COMMENT 'Q&A 번호',
  `bxqsubject` varchar(30) NOT NULL COMMENT 'Q&A 제목',
  `bxqcontent` varchar(30) NOT NULL COMMENT 'Q&A 내용',
  `regdate` char(8) CHARACTER SET latin1 DEFAULT NULL COMMENT 'Q&A 작성일',
  PRIMARY KEY (`bxqseq`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Q&A 게시판';


CREATE TABLE `board_qnarep` (
  `bxseq` int(9) NOT NULL AUTO_INCREMENT COMMENT 'Q&A 답글 일련번호',
  `bxqno` int(9) NOT NULL COMMENT 'Q&A 번호',
  `bxqrepcontent` varchar(300) NOT NULL COMMENT 'Q&A 답글 내용',
  `regdate` char(8) CHARACTER SET latin1 NOT NULL COMMENT 'Q&A 작성일',
  `bxqrepchk` char(1) CHARACTER SET latin1 NOT NULL COMMENT 'Q&A 답변 체크',
  PRIMARY KEY (`bxseq`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


CREATE TABLE `code` (
  `cxseq` int(9) NOT NULL AUTO_INCREMENT COMMENT '일련번호',
  `cxgubun` char(3) CHARACTER SET latin1 DEFAULT NULL COMMENT '분류코드',
  `cxcode` varchar(3) CHARACTER SET latin1 DEFAULT NULL COMMENT '코드',
  `cxname` varchar(20) DEFAULT NULL COMMENT '코드명',
  PRIMARY KEY (`cxseq`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 COMMENT='코드';


CREATE TABLE `course` (
  `coxseq` int(9) NOT NULL AUTO_INCREMENT COMMENT '과정 일련번호',
  `coxcate` int(9) DEFAULT NULL COMMENT '과정 분류',
  `coxname` varchar(100) DEFAULT NULL COMMENT '과정명',
  `coxstart` char(8) CHARACTER SET latin1 DEFAULT NULL COMMENT '기간시작일',
  `coxend` char(8) CHARACTER SET latin1 DEFAULT NULL COMMENT '기간종료일',
  `coxreqstart` char(8) CHARACTER SET latin1 DEFAULT NULL COMMENT '수강신청시작일',
  `coxreqend` char(8) CHARACTER SET latin1 DEFAULT NULL COMMENT '수강신청종료일',
  `tuxseq` int(9) DEFAULT NULL COMMENT '강사 일련번호',
  `coxintro` varchar(400) DEFAULT NULL COMMENT '과정소개',
  `coxopen` char(1) CHARACTER SET latin1 DEFAULT 'N' COMMENT '공개여부',
  `coxprog` int(3) DEFAULT NULL COMMENT '(이수기준)진도율',
  `coxscore` int(3) DEFAULT NULL COMMENT '(이수기준)평가점수',
  `coxoffice` int(9) DEFAULT NULL COMMENT '회사일련번호',
  `regdate` char(8) CHARACTER SET latin1 DEFAULT NULL COMMENT '등록일',
  `mxseq` int(9) DEFAULT NULL COMMENT '작성자',
  PRIMARY KEY (`coxseq`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='과정';

CREATE TABLE `lecture` (
  `lxseq` int(9) NOT NULL AUTO_INCREMENT COMMENT '강의 일련번호',
  `lxnum` int(3) DEFAULT NULL COMMENT '강의 회차',
  `coxseq` int(9) DEFAULT NULL COMMENT '과정 일련번호',
  `lxname` varchar(100) DEFAULT NULL COMMENT '강의제목',
  `lxtype` int(9) DEFAULT NULL COMMENT '강의 종류코드',
  `lxlink` varchar(100) DEFAULT NULL COMMENT '강의 링크',
  `lxfile` varchar(100) DEFAULT NULL COMMENT '강의자료',
  `regdate` char(8) CHARACTER SET latin1 DEFAULT NULL COMMENT '등록일',
  `mxseq` int(9) DEFAULT NULL COMMENT '등록자',
  PRIMARY KEY (`lxseq`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='강의';


CREATE TABLE `lexstudy` (
  `lsxseq` int(9) NOT NULL AUTO_INCREMENT COMMENT '일련번호',
  `lxseq` int(9) DEFAULT NULL COMMENT '강의 일련번호',
  `mxseq` int(9) DEFAULT NULL COMMENT '회원 일련번호',
  `regdate` char(8) CHARACTER SET latin1 DEFAULT NULL COMMENT '수강일',
  PRIMARY KEY (`lsxseq`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='강의 이력';


CREATE TABLE `lexstudylog` (
  `lslxseq` int(9) NOT NULL AUTO_INCREMENT COMMENT '일련번호',
  `lxseq` int(9) DEFAULT NULL COMMENT '강의 일련번호',
  `mxseq` int(9) DEFAULT NULL COMMENT '회원 일련번호',
  `lslxdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '강의 접속 시간',
  PRIMARY KEY (`lslxseq`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='강의 이력 상세';


CREATE TABLE `loginhis` (
  `lxseq` int(9) NOT NULL AUTO_INCREMENT COMMENT '로그인일련번호',
  `mxseq` int(9) NOT NULL COMMENT '회원일련번호',
  `lxdev` varchar(30) NOT NULL COMMENT '로그인 기기',
  `lxos` varchar(30) NOT NULL COMMENT '로그인 os',
  `regdate` date NOT NULL,
  PRIMARY KEY (`lxseq`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='로그인기록';


CREATE TABLE `member` (
  `mxseq` int(9) NOT NULL AUTO_INCREMENT COMMENT '회원일련번호',
  `mxid` varchar(30) NOT NULL COMMENT '회원아이디',
  `mxpw` varchar(100) NOT NULL COMMENT '회원비밀번호',
  `mxname` varchar(30) NOT NULL COMMENT '회원이름',
  `mxmail` varchar(100) NOT NULL COMMENT '회원이메일',
  `mxoffice` int(9) NOT NULL COMMENT '회원 회사',
  `mxdiv` char(1) NOT NULL COMMENT '회원 구분자',
  `regdate` char(8) DEFAULT NULL COMMENT '가입일yyyymmdd',
  PRIMARY KEY (`mxseq`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 COMMENT='회원';


CREATE TABLE `popup` (
  `pxseq` int(9) NOT NULL AUTO_INCREMENT COMMENT '팝업 일련번호',
  `pxname` varchar(100) NOT NULL COMMENT '팝업 제목',
  `pxfrom` char(8) NOT NULL COMMENT '게시일',
  `pxto` char(8) NOT NULL COMMENT '종료일',
  `pxday` int(30) NOT NULL COMMENT '게시 기간',
  `pxurl` varchar(1000) NOT NULL COMMENT '이동할주소',
  PRIMARY KEY (`pxseq`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='팝업 테이블';


CREATE TABLE `quiz` (
  `qxseq` int(9) NOT NULL AUTO_INCREMENT COMMENT '퀴즈일련번호',
  `lxseq` int(9) DEFAULT NULL COMMENT '강의일련번호',
  `qxorder` int(1) DEFAULT NULL COMMENT '문제 순서',
  `qxcont` varchar(500) DEFAULT NULL COMMENT '퀴즈문제',
  `qxcorrect` char(1) CHARACTER SET latin1 DEFAULT NULL COMMENT '답',
  `regdate` char(8) CHARACTER SET latin1 DEFAULT NULL COMMENT '등록일',
  PRIMARY KEY (`qxseq`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='퀴즈';


CREATE TABLE `qxanswer` (
  `qaxseq` int(9) NOT NULL AUTO_INCREMENT COMMENT '답안일련번호',
  `qxseq` int(9) DEFAULT NULL COMMENT '퀴즈일련번호',
  `mxseq` int(9) DEFAULT NULL COMMENT '회원일련번호',
  `qaxans` char(1) CHARACTER SET latin1 DEFAULT NULL COMMENT '회원이쓴답',
  `qaxresult` char(1) CHARACTER SET latin1 DEFAULT NULL COMMENT '정답',
  `regdate` char(8) CHARACTER SET latin1 DEFAULT NULL COMMENT '등록일',
  PRIMARY KEY (`qaxseq`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='퀴즈답안';


CREATE TABLE `testanswer` (
  `taxseq` int(9) NOT NULL AUTO_INCREMENT,
  `tpxseq` int(9) DEFAULT NULL,
  `mxseq` int(9) DEFAULT NULL COMMENT '평가지 일련번호',
  `taxorder` int(3) DEFAULT NULL COMMENT '문제 순서',
  `txseq` int(9) DEFAULT NULL COMMENT '문제 일련번호',
  `txcorrect` varchar(100) DEFAULT NULL COMMENT '정답',
  `txscore` decimal(5,2) DEFAULT NULL COMMENT '문항 점수',
  `taxanswer` varchar(100) DEFAULT NULL COMMENT '회원이 쓴 답',
  `taxcorrect` char(1) CHARACTER SET latin1 DEFAULT NULL COMMENT '정답 여부',
  `taxscore` decimal(5,2) DEFAULT NULL COMMENT '내 점수',
  `regdate` char(8) CHARACTER SET latin1 DEFAULT NULL COMMENT '등록일',
  PRIMARY KEY (`taxseq`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='개인 답안지 테이블';


CREATE TABLE `testpaper` (
  `tpxseq` int(9) NOT NULL AUTO_INCREMENT COMMENT '평가지 일련번호',
  `coxseq` int(9) DEFAULT NULL COMMENT '과정 일련번호',
  `tpxtitle` varchar(100) DEFAULT NULL COMMENT '평가 제목',
  `tpxfrom` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '평가 시작시간',
  `tpxto` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '평가 종료시간',
  `tpxduring` int(3) DEFAULT NULL COMMENT '시험시간(분)',
  `tpx1cnt` int(2) DEFAULT NULL COMMENT '객관식 문제 수',
  `tpx2cnt` int(2) DEFAULT NULL COMMENT '주관식 문제 수',
  `tpx3cnt` int(2) DEFAULT NULL COMMENT 'O/X 문제 수',
  `tpx1score` decimal(5,2) DEFAULT NULL COMMENT '객관식 문제당 점수',
  `tpx2score` decimal(5,2) DEFAULT NULL COMMENT '주관식 문제당 점수',
  `tpx3score` decimal(5,2) DEFAULT NULL COMMENT 'O/X 문제당 점수',
  `regdate` char(8) CHARACTER SET latin1 DEFAULT NULL COMMENT '등록일',
  `mxseq` int(9) DEFAULT NULL COMMENT '등록자',
  PRIMARY KEY (`tpxseq`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='평가지 테이블';


CREATE TABLE `testpool` (
  `txseq` int(9) NOT NULL AUTO_INCREMENT COMMENT '문제 일련번호',
  `coxseq` int(9) DEFAULT NULL COMMENT '과정 일련번호',
  `lxseq` int(9) DEFAULT NULL COMMENT '강의 일련번호',
  `txtype` char(1) CHARACTER SET latin1 DEFAULT NULL COMMENT '문제 유형',
  `txcont` varchar(1000) DEFAULT NULL COMMENT '문제 내용',
  `tx1` varchar(500) DEFAULT NULL COMMENT '보기1',
  `tx2` varchar(500) DEFAULT NULL COMMENT '보기2',
  `tx3` varchar(500) DEFAULT NULL COMMENT '보기3',
  `tx4` varchar(500) DEFAULT NULL COMMENT '보기4',
  `tx5` varchar(500) DEFAULT NULL COMMENT '보기5',
  `txcorrect` varchar(100) DEFAULT NULL COMMENT '정답',
  `regdate` char(8) CHARACTER SET latin1 DEFAULT NULL COMMENT '등록일',
  `mxseq` int(9) DEFAULT NULL COMMENT '등록자',
  PRIMARY KEY (`txseq`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='평가문제 테이블';


CREATE TABLE `testresult` (
  `trxseq` int(9) NOT NULL AUTO_INCREMENT COMMENT '평가결과일련번호',
  `tpxseq` int(9) DEFAULT NULL COMMENT '평가지일련번호',
  `mxseq` int(9) DEFAULT NULL COMMENT '회원 일련번호',
  `trxstart` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '평가 시작시간',
  `trxend` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '평가 종료시간',
  `trxrest` int(3) DEFAULT NULL COMMENT '평가 남은시간(분)',
  `trxscore` decimal(5,2) DEFAULT NULL COMMENT '총점',
  `regdate` char(8) CHARACTER SET latin1 DEFAULT NULL COMMENT '등록일',
  PRIMARY KEY (`trxseq`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='평가결과테이블';


CREATE TABLE `tutor` (
  `tuxseq` int(9) NOT NULL AUTO_INCREMENT COMMENT '일련번호',
  `txseq` int(9) NOT NULL COMMENT '강사 일련번호',
  `tuxname` varchar(20) NOT NULL COMMENT '강사 이름',
  PRIMARY KEY (`tuxseq`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='강사 정보';


CREATE TABLE `tutor_comment` (
  `tuxseq` int(9) NOT NULL AUTO_INCREMENT COMMENT '일련번호',
  `tuxcseq` int(9) NOT NULL COMMENT '평가 일련번호',
  `cmt` varchar(500) NOT NULL COMMENT '평가 내용',
  `cmt_date` char(12) CHARACTER SET latin1 NOT NULL COMMENT '평가 작성일',
  PRIMARY KEY (`tuxseq`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='강사 한 줄 평가 테이블';


CREATE TABLE `tutor_favo` (
  `tuxseq` int(9) NOT NULL AUTO_INCREMENT COMMENT '일련번호',
  `tuxfseq` int(9) NOT NULL COMMENT '강사 좋아요 일련번호',
  `cnt` int(3) NOT NULL DEFAULT '0' COMMENT '좋아요 카운트',
  PRIMARY KEY (`tuxseq`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='강사 좋아요';
