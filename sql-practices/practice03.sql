-- 테이블간 조인(JOIN) SQL 문제입니다.

-- 문제 1. 
-- 현재 급여가 많은 직원부터 직원의 사번, 이름, 그리고 연봉을 출력 하시오.
  select e.emp_no as '사번', concat(e.first_name, " ", e.last_name) as '이름', s.salary as '연봉'
    from employees e join salaries s on e.emp_no = s.emp_no
   where s.to_date like '9999%'
order by s.salary desc;

-- 문제2.
-- 전체 사원의 사번, 이름, 현재 직책을 이름 순서로 출력하세요.
  select e.emp_no as '사번', e.last_name as '이름', t.title as '현재 직책'
    from employees e join titles t on e.emp_no = t.emp_no
   where t.to_date like '9999%'
order by e.last_name;

-- 문제3.
-- 전체 사원의 사번, 이름, 현재 부서를 이름 순서로 출력하세요..
select e.emp_no as '사번', e.last_name as '이름', d.dept_name as '부서'
  from employees e join dept_emp de on e.emp_no = de.emp_no
                   join departments d on de.dept_no = d.dept_no
  where de.to_date like '9999%'
  order by e.last_name;

-- 문제4.
-- 현재 사원의 사번, 이름, 연봉, 직책, 부서를 모두 이름 순서로 출력합니다. -- 연봉이 시기마다 다를 경우에는?
select count(*)
-- select e.emp_no as '사번',
--        concat(e.first_name, " ", e.last_name) as '이름',
--        s.salary as '연봉',
--        t.title as '직책',
--        d.dept_name as '부서'
  from employees e join salaries s on e.emp_no = s.emp_no
				   join titles t on s.emp_no = t.emp_no
                   join dept_emp de on t.emp_no = de.emp_no
                   join departments d on de.dept_no = d.dept_no
  where s.to_date like '9999%'
    and t.to_date like '9999%'
    and de.to_date like '9999%'
  order by '이름';

-- 문제5.
-- 'Technique Leader'의 직책으로 과거에 근무한 적이 있는 모든 사원의 사번과 이름을 출력하세요.
-- (현재 'Technique Leader'의 직책(으로 근무하는 사원은 고려하지 않습니다.) 이름은 first_name과 last_name을 합쳐 출력 합니다.
select e.emp_no as '사번', e.last_name as '이름'
  from employees e join titles t on e.emp_no = t.emp_no
                   join dept_emp de on t.emp_no = de.emp_no
  where t.to_date != '9999-01-01'
    and t.title = 'Technique Leader';

-- 문제6.
-- 현재 직원 중에서, 직원 이름(last_name) 중에서 S(대문자)로 시작하는 직원들의 이름, 부서명, 직책을 조회하세요.
select concat(e.first_name, " ", e.last_name) as '이름', d.dept_name as '부서명', t.title as '직책'
  from employees e join titles t on e.emp_no = t.emp_no
                   join dept_emp de on t.emp_no = de.emp_no
                   join departments d on de.dept_no = d.dept_no
  where t.to_date like '9999%'
    and de.to_date like '9999%'
    and e.last_name like 'S%';

-- 문제7.
-- 현재, 직책이 Engineer인 사원 중에서 현재 급여가 40000 이상인 사원을 급여가 큰 순서대로 출력하세요.
-- 사번, 이름, 급여, 직책
   select e.emp_no as '사번', e.last_name as '이름', s.salary as '급여', t.title as '직책'
     from employees e join salaries s on e.emp_no = s.emp_no
                      join titles t on s.emp_no = t.emp_no
    where t.title = 'Engineer'
      and s.to_date like '9999%'
      and t.to_date like '9999%'
      and s.salary >= 40000
 order by s.salary desc;

-- 문제8.
-- 현재 급여가 50000이 넘는 직책을 직책, 직책별 평균 급여로 급여가 큰 순서대로 출력하시오
 select t.title as '직책', avg(s.salary) as '평균 급여'
   from titles t join salaries s on t.emp_no = s.emp_no
   where s.to_date like '9999%'
     and t.to_date like '9999%'
group by t.title
having avg(s.salary) >= 50000
order by avg(s.salary) desc;

-- 문제9.
-- 현재, 부서별 평균 연봉을 연봉이 큰 부서 순서대로 출력하세요.
  select d.dept_name as '부서명', avg(s.salary) as '평균 연봉'
    from salaries s join dept_emp de on s.emp_no = de.emp_no
                    join departments d on de.dept_no = d.dept_no
   where s.to_date like '9999%'
     and de.to_date like '9999%'
group by d.dept_name
order by avg(s.salary) desc;

-- 문제10.
-- 현재, 직책별 평균 연봉을 연봉이 큰 직책 순서대로 출력하세요.
  select t.title as '직책', avg(s.salary) as '평균 연봉'
    from salaries s join titles t on s.emp_no = t.emp_no
   where s.to_date like '9999%'
     and t.to_date like '9999%'
group by t.title
order by avg(s.salary) desc;