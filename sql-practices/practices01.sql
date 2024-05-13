-- 기본 SQL 문제입니다.

SELECT * FROM employees;
-- 문제1.
-- 사번이 10944인 사원의 이름은(전체 이름)
SELECT CONCAT(FIRST_NAME, " ", LAST_NAME) AS '사번이 10944인 사원의 이름'
  FROM employees
 WHERE EMP_NO = 10944;

-- 문제2. 
-- 전체직원의 다음 정보를 조회하세요.
-- 가장 선임부터 출력이 되도록 하세요.
-- 출력은 이름, 성별, 입사일 순서이고 "이름", "성별", "입사일"로 컬럼 이름을 대체해 보세요.
  SELECT CONCAT(FIRST_NAME, " ", LAST_NAME) AS '이름', GENDER AS '성별', HIRE_DATE AS '입사일'
    FROM employees
ORDER BY HIRE_DATE;

-- 문제3.
-- 여직원과 남직원은 각 각 몇 명이나 있나요?
SELECT COUNT(*) AS '남직원 수' FROM employees WHERE GENDER = 'M';
SELECT COUNT(*) AS '남직원 수' FROM employees WHERE GENDER = 'F';

-- 문제4.
-- 현재 근무하고 있는 직원 수는 몇 명입니까? (salaries 테이블을 사용합니다.) 
-- sol 1
SELECT COUNT(*) AS '현재 근무하고 있는 직원 수' FROM salaries WHERE TO_DATE > TO_CHAR(NOW(), 'yyyy-mm-dd');
-- sol 2
SELECT COUNT(*) AS '현재 근무하고 있는 직원 수' FROM salaries WHERE TO_DATE = '9999-01-01';

-- 문제5.
-- 부서는 총 몇 개가 있나요?
SELECT COUNT(*) AS '부서 개수' FROM departments;

-- 문제6.
-- 현재 부서 매니저는 몇 명이나 있나요? (역임 매너저는 제외)
-- sol 1
SELECT COUNT(*) AS '현재 부서 매니저 인원' FROM dept_manager WHERE TO_DATE > TO_CHAR(NOW(), 'yyyy-mm-dd');
-- sol 2
SELECT COUNT(*) AS '현재 부서 매니저 인원' FROM dept_manager WHERE TO_DATE = '9999-01-01';

-- 문제7.
-- 전체 부서를 출력하려고 합니다. 순서는 부서이름이 긴 순서대로 출력해 보세요.
  SELECT DEPT_NAME AS '전체 부서'
    FROM departments
ORDER BY LENGTH(DEPT_NAME) DESC;

-- 문제8.
-- 현재 급여가 120,000이상 받는 사원은 몇 명이나 있습니까?
SELECT COUNT(*) AS '급여가 120,000이상 받는 사원'
  FROM salaries
 WHERE SALARY >= 120000
   AND TO_DATE = '9999-01-01';

-- 문제9.
-- 어떤 직책들이 있나요? 중복 없이 이름이 긴 순서대로 출력해 보세요.
  SELECT DISTINCT TITLE AS '직책'
    FROM titles
ORDER BY LENGTH(TITLE) DESC;

-- 문제10
-- 현재 Enginner 직책의 사원은 총 몇 명입니까?
  SELECT COUNT(*) AS '현재 Enginner 직책의 사원 인원'
    FROM titles
   WHERE TITLE = 'Engineer'
     AND TO_DATE = '9999-01-01';

-- 문제11
-- 사번이 13250(Zeydy)인 직원의 직책 변경 상황을 시간순으로 출력해보세요.
SELECT * FROM titles WHERE EMP_NO = 13250 ORDER BY FROM_DATE;