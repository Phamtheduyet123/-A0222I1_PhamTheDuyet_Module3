use them_du_lieu;
select *
from student
where  student_name like 'h%';
select *
from class
where  month(start_date)>=12;
select *
from `subject`
where (credit between 3 and 5);  
update student
set class_id = 2
where (student_name = 'Hung' and student_id <>0 );
select s.student_name, c.sub_name, m.mark
from student s join mark m on s.student_id = m.student_id
join `subject` c on m.sub_id = c.sub_id
order by m.mark desc, s.student_name;


       
