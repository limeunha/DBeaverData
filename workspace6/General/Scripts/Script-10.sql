-- 한글 저장을 위해 UTF-8를 캐릭터 셋으로 하는 데이터베이스 생성
CREATE DATABASE test DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci; 

-- 데이터베이스(스키마) 보기
show databases;

-- test 데이터 베이스(스키마) 사용하기
use test;

-- 데이터 베이스 삭제
drop DATABASE test;