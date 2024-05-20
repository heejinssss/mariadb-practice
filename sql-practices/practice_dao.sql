desc emaillist;

-- (C)reate(insert)
insert into emaillist values(null, '우즈마키', '나루토', 'naruto@gmail.com');

-- (R)ead(select)
select no, first_name, last_name, email from emaillist order by no desc;

-- (D)elete(delete)
delete from emaillist where email = 'naruto@gmail.com';