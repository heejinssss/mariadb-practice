-- 서브쿼리(SUBQUERY) SQL 문제입니다.

-- 문제1.
-- 현재 평균 연봉보다 많은 월급을 받는 직원은 몇 명이나 있습니까?
select count(e.emp_no) as '평균 연봉보다 많은 월급을 받는 직원'
  from (select emp_no
          from employees) e,
       (select emp_no, salary, to_date
          from salaries) s1
 where e.emp_no = s1.emp_no
   and s1.to_date like '9999%'
   and s1.salary > (select avg(salary) as avgs
                      from salaries
					 where to_date like '9999%');

-- 문제2. 
-- 현재, 각 부서별로 최고의 급여를 받는 사원의 사번, 이름, 부서 연봉을 조회하세요. 단 조회결과는 연봉의 내림차순으로 정렬되어 나타나야 합니다. 
  select e.emp_no, e.first_name, d.dept_name, t.salary
    from employees e, salaries s, dept_emp de, departments d,
         (  select de.dept_no as dept_no, max(s.salary) as salary -- 현재 기준, 부서별 최고 급여 테이블 출력하는 서브쿼리 생성
              from salaries s, dept_emp de
             where s.emp_no = de.emp_no
               and s.to_date like '9999%'
               and de.to_date like '9999%'
          group by de.dept_no) t
   where e.emp_no = s.emp_no
     and s.emp_no = de.emp_no
	 and de.dept_no = d.dept_no
     and d.dept_no = t.dept_no
     and s.salary = t.salary
     and s.to_date like '9999%'
     and de.to_date like '9999%'
order by t.salary desc;

-- 문제3.
-- 현재, 자신의 부서 평균 급여보다 연봉(salary)이 많은 사원의 사번, 이름과 연봉을 조회하세요.
select e.emp_no, first_name as name, s.salary
  from employees e, salaries s, dept_emp de, departments d,
	   (  select de.dept_no as dept_no, avg(s.salary) as avg_salary -- 현재 기준, 부서별 평균 급여 테이블 출력하는 서브쿼리 생성
	  	    from salaries s, dept_emp de
	  	   where s.emp_no = de.emp_no
	  	     and s.to_date like '9999%'
	  	     and de.to_date like '9999%'
	    group by de.dept_no) t
 where e.emp_no = s.emp_no
   and s.emp_no = de.emp_no
   and de.dept_no = d.dept_no
   and d.dept_no = t.dept_no
   and s.to_date like '9999%'
   and de.to_date like '9999%'
   and s.salary > t.avg_salary;

-- 문제4.
-- 현재, 사원들의 사번, 이름, 사원 담당 매니저 이름, 부서 이름으로 출력해 보세요.
select e.emp_no as '사번',
       concat(e.first_name, " ", e.last_name) as '이름',
	   dme.m_name as '부서 담당 매니저 이름',
       d.dept_name as '부서명' 
  from employees e, dept_emp de, dept_manager dm, departments d,
       (select concat(e.first_name, " ", e.last_name) as m_name,
               dm.emp_no as m_emp_no,
               dm.dept_no as m_dept_no,
               d.dept_name as m_dept_name 
          from employees e, dept_manager dm, departments d
         where e.emp_no = dm.emp_no
	       and dm.dept_no = d.dept_no
           and dm.to_date like '9999%') dme
 where e.emp_no = de.emp_no -- 사원명 조건
   and de.dept_no = d.dept_no
   and d.dept_no = dme.m_dept_no
   and de.dept_no = dme.m_dept_no
   and de.to_date like '9999%'
   and dm.to_date like '9999%';

-- 문제5.
-- 현재, 평균연봉이 가장 높은 부서의 사원들의 사번, 이름, 직책, 연봉을 조회하고 연봉 순으로 출력하세요.
 select e.emp_no as '사번', first_name as '이름', t.title as '직책', s.salary as '연봉'
   from employees e, titles t, salaries s, dept_emp de,
        ( select de.dept_no as dept_no, avg(s.salary) as salary
           from salaries s, dept_emp de
          where s.emp_no = de.emp_no
            and s.to_date like '9999%'
            and de.to_date like '9999%'
       group by de.dept_no
       order by salary desc -- 내림차순
           limit 1) b
   where e.emp_no = s.emp_no
     and s.emp_no = t.emp_no
     and t.emp_no = de.emp_no
     and de.dept_no = b.dept_no -- 평균 연봉이 가장 높은 부서 번호
     and s.to_date like '9999%'
     and t.to_date like '9999%'
     and de.to_date like '9999%'
order by s.salary;

-- 문제6.
-- 평균 연봉이 가장 높은 부서는?
  select d.dept_name as '부서명', avg(s.salary) as '평균 연봉'
    from salaries s, dept_emp de, departments d
   where s.emp_no = de.emp_no
     and de.dept_no = d.dept_no
     and s.to_date like '9999%'
     and de.to_date like '9999%'
group by d.dept_name
order by avg(s.salary) desc
    limit 1;

-- 문제7.
-- 평균 연봉이 가장 높은 직책?
  select t.title as '직책명', avg(s.salary) as '평균 연봉'
    from salaries s, titles t
   where s.emp_no = t.emp_no
     and s.to_date like '9999%'
     and t.to_date like '9999%'
group by t.title
order by avg(s.salary) desc
   limit 1;

-- 문제8.
-- 현재 자신의 매니저보다 높은 연봉을 받고 있는 직원은?
-- 부서이름, 사원이름, 연봉, 부서 담당 매니저 이름, 메니저 연봉 순으로 출력합니다.
select d.dept_name as '부서 이름',
       concat(e.first_name, " ", e.last_name) as '사원 이름',
       s.salary as '사원 연봉',
	   dme.m_name as '부서 담당 매니저 이름',
       dme.m_salary as '매니저 연봉'
  from employees e, salaries s, dept_emp de, dept_manager dm, departments d,
       (select concat(e.first_name, " ", e.last_name) as m_name,
               s.salary as m_salary,
               dm.emp_no as m_emp_no,
               dm.dept_no as m_dept_no,
               d.dept_name as m_dept_name
          from employees e, salaries s, dept_manager dm, departments d
         where e.emp_no = s.emp_no
           and s.emp_no = dm.emp_no
	       and dm.dept_no = d.dept_no
           and s.to_date like '9999%'
           and dm.to_date like '9999%') dme
 where e.emp_no = s.emp_no
   and s.emp_no = de.emp_no
   and de.dept_no = d.dept_no
   and d.dept_no = dme.m_dept_no
   and de.dept_no = dme.m_dept_no
   and s.salary > dme.m_salary
   and s.to_date like '9999%'
   and de.to_date like '9999%'
   and dm.to_date like '9999%';