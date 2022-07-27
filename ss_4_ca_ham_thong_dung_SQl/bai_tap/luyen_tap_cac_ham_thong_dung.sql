use them_du_lieu;
-- hiển thị tất cả các môn học có credit lớn nhất
select sub_name, credit
from `subject`
group by sub_name, credit
having credit >= all(select credit from `subject` group by sub_id);
-- hiển thị các thông tin môn học có điểm thi lớn nhất
select s.sub_id,s.sub_name,s.credit,s.`status`, m.mark 
from `subject` s join mark m on s.sub_id = m.sub_id
group by  s.sub_id,s.sub_name,s.credit,s.`status`,m.mark
having mark >= all(select mark from mark group by mark_id);
-- Hiển thị các thông tin sinh viên và điểm trung bình của mỗi sinh viên, xếp hạng theo thứ tự điểm giảm dần
select s.student_id,s.student_name,s.address,s.phone,s.`status`,s.class_id, avg(mark) 
from student s join mark m on s.student_id = m.student_id
group by  s.student_id,s.student_name,s.address,s.phone,s.`status`,s.class_id
order by avg(mark) ;

