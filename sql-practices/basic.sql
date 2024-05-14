USE webdb;

SELECT VERSION(), CURRENT_DATE, NOW() FROM DUAL;

-- 사친 연산, 함수 사용 가능
SELECT SIN(PI()/4), 1 + 2 * 3 - 4 / 5 FROM DUAL;

-- 대소문자 구분 없음
SeLeCt VERSION(), CURRENT_DATE, NOW() FROM DUAL;

-- TABLE 생성: DDL
CREATE TABLE PET(
	NAME VARCHAR(100),
    OWNER VARCHAR(50),
    SPECIES VARCHAR(20),
    GENDER CHAR(1),
    BIRTH DATE,
    DEATH DATE
);

-- SCHEMA
DESCRIBE PET;
DESC PET;

-- TABLE 삭제
DROP TABLE PET;
SHOW TABLES;

-- INSERT: DML(CREATE)
INSERT INTO PET VALUES('성탄이', '안대혁', 'DOG', 'M', '2007-12-25', NULL);

-- SELECT: DML(REAPETD)
SELECT * FROM PET;

-- UPDATE: DML(UPDATE)
UPDATE PET SET NAME='성타니' WHERE NAME='성탄이';
UPDATE PET SET SPECIES='dog' WHERE SPECIES='DOG';
UPDATE PET SET GENDER='m' WHERE GENDER='M';

-- DELETE: DML(DELETE)
DELETE FROM PET WHERE NAME='성타니';

-- LOAD DATA: MYsql(CLI) 전용
LOAD DATA LOCAL INFILE '/root/pet.txt' INTO TABLE PET;

-- SELECT 연습
SELECT NAME, SPECIES
  FROM PET
 WHERE NAME = 'BOWSER';

SELECT NAME, SPECIES, BIRTH
  FROM PET
 WHERE BIRTH > '1997-12-31';

SELECT NAME, SPECIES, GENDER
       FROM PET
      WHERE SPECIES = 'dog'
      AND GENDER = 'F';

SELECT NAME, SPECIES
  FROM PET
 WHERE SPECIES = 'bird'
    OR SPECIES = 'snake';

  SELECT NAME, BIRTH
    FROM PET
ORDER BY BIRTH ASC;

  SELECT NAME, BIRTH
    FROM PET
ORDER BY BIRTH DESC;

  SELECT NAME, BIRTH, DEATH
    FROM PET
   WHERE DEATH IS NULL;

  SELECT NAME
    FROM PET
   WHERE NAME LIKE 'b%';

  SELECT NAME
    FROM PET
   WHERE NAME LIKE '%fy';

  SELECT NAME
    FROM PET
   WHERE NAME LIKE '%w%';

  SELECT NAME
    FROM PET
   WHERE NAME LIKE 'b____'; -- b로 시작, 다섯글자 이름

SELECT NAME, COUNT(*), MAX(BIRTH)
  FROM PET;