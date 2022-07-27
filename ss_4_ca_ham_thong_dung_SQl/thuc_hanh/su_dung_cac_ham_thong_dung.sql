USE them_du_lieu;
-- Đếm số lượng học viên
SELECT address, count(student_id) AS 'Số lượng học viên'
FROM student
GROUP BY address;
-- Hiển thị điểm TB của từng học viên
SELECT S.student_id,S.student_name, AVG(mark) as TB
FROM student S join mark M on S.student_id = M.student_id
GROUP BY S.student_id, S.student_name;
-- hiển thị những học sinh có điểm Tb > 15
SELECT S.student_id,S.student_name, AVG(mark)
FROM Student S join Mark M on S.student_id = M.student_id
GROUP BY S.student_id, S.student_name
HAVING AVG(mark) > 15;
-- Hiển thị  học viên có điểm TB lớn nhất
SELECT S.student_id,S.student_name, AVG(mark)
FROM Student S join Mark M on S.student_id = M.student_id
GROUP BY S.student_id, S.student_name
HAVING AVG(mark) >= ALL (SELECT AVG(mark) FROM mark GROUP BY mark.student_id);
