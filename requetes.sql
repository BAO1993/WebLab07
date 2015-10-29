--EX1

CREATE TABLE `student` (
  `student_id` INTEGER UNSIGNED NOT NULL auto_increment,
  `name` varchar(10) NOT NULL,
  `year` SMALLINT NOT NULL default '1',
  `dept_no` INTEGER UNSIGNED NOT NULL,
  `major` varchar(20),
  PRIMARY KEY  (`student_id`),
  FOREIGN KEY (dept_no) REFERENCES department(dept_no)
);

CREATE TABLE `department` (
  `dept_no` INTEGER UNSIGNED NOT NULL auto_increment,
  `dept_name` varchar(20) NOT NULL,
  `office` varchar(20) NOT NULL default '1',
  `office_tel` varchar(13),
  PRIMARY KEY  (`dept_no`),
  UNIQUE (dept_name)
  
);

ALTER TABLE student CHANGE COLUMN major major varchar(40) ;

ALTER TABLE student ADD gender varchar(10) NOT NULL;

ALTER TABLE department CHANGE COLUMN dept_name dept_name varchar(40) NOT NULL ;

ALTER TABLE department CHANGE COLUMN office office varchar(30) NOT NULL default '1' ;

--EX2

INSERT INTO department (dept_name,office,office_tel)
VALUES  ('Computer Science', 'Engineering building', '02-3290-0123') ,
 ('Electronic Engineering', 'Engineering building', '02-3290-2345') ,
 ('Law', 'Law building', '02-3290-7896'), 
 ( 'Business Administration', 'Administration building', '02-3290-1112') , 
 ('English Literature', 'Literature building', '02-3290-4412');

INSERT INTO student
VALUES(20070002, 'James Bond', 3, 4, 'Business Administration'), (20060001, 'Queenie', 4, 4, 'Business Administration'), 
(20030001, 'Reonardo', 4, 2, 'Electronic Engineering'), (20040003, 'Julia', 3, 2, 'Electronic Engineering') ,
(20060002, 'Roosevelt', 3, 1, 'Computer Science'), (20100002, 'Fearne', 3, 4, 'Business Administration') ,
(20110001, 'Chloe', 2, 1, 'Computer Science'), (20080003, 'Amy', 4, 3, 'Law') ,
(20040002, 'Selina', 4, 5, 'English Literature'), (20070001, 'Ellen', 4, 4, 'Business Administration') ,
(20100001, 'Kathy', 3, 4, 'Business Administration'), (20110002, 'Lucy', 2, 2, 'Electronic Engineering') ,
(20030002, 'Michelle', 5, 1, 'Computer Science'), (20070003, 'April', 4, 3, 'Law') ,
(20070005, 'Alicia', 2, 5, 'English Literature'), (20100003, 'Yullia', 3, 1, 'Computer Science') ,
(20070007, 'Ashlee', 2, 4, 'Business Administration');

--EX3

UPDATE department
SET dept_name = "Electronic and Electrical Engineering"
WHERE dept_no = 2;

INSERT INTO department (dept_name,office,office_tel)
VALUES ('Education','Education Building','02-3290-2347');

UPDATE student
SET dept_no = 6 , major='Education'
WHERE name = 'Chloe';

DELETE FROM student
WHERE name = 'Michelle';

DELETE FROM student
WHERE name =  'Fearne';

--EX4

SELECT * from student 
WHERE major='Computer Science';

SELECT student_id, year, major
FROM student;

SELECT * FROM student
WHERE year='3';

SELECT * FROM student
WHERE year='1' or year='2';

SELECT * from student s
JOIN department d on d.dept_no=s.dept_no
WHERE d.dept_name='Business Administration';

--EX5

SELECT * FROM student 
WHERE student_id LIKE '%2007%';

SELECT * FROM student 
ORDER BY student_id;

SELECT major FROM student 
GROUP BY major
HAVING AVG(year)>3;

SELECT * FROM student 
WHERE major='Business Administration'
AND student_id LIKE '%2007%'
LIMIT 2;


--EX6

SELECT * FROM roles r
JOIN movies m ON r.movie_id=m.id
WHERE m.name='Pi';

SELECT a.first_name,a.last_name,r.role FROM actors a
JOIN roles r ON r.actor_id=a.id
JOIN movies m ON r.movie_id=m.id
WHERE m.name='Pi';

SELECT a.first_name,a.last_name FROM actors a
JOIN roles r ON r.actor_id=a.id
JOIN movies m ON r.movie_id=m.id 
WHERE m.name LIKE "Kill Bill: Vol. 1"
OR m.name LIKE "Kill Bill: Vol. 2"
GROUP BY a.id
HAVING COUNT(*)=2;

SELECT a.first_name,a.last_name, COUNT(DISTINCT r.movie_id) as NumberOfMovies FROM actors a
JOIN roles r ON r.actor_id=a.id
GROUP BY a.id
ORDER BY COUNT(DISTINCT r.movie_id) DESC
LIMIT 7;

SELECT mg.genre, COUNT(mg.genre) FROM movies_genres mg
JOIN movies m ON mg.movie_id=m.id
GROUP BY mg.genre
ORDER BY COUNT(mg.genre) DESC
LIMIT 3;

SELECT d.first_name,d.last_name,COUNT(d.id) FROM directors d
JOIN movies_directors md ON md.director_id=d.id
JOIN movies_genres mg ON md.movie_id=mg.movie_id 
WHERE mg.genre="Thriller"
GROUP BY d.id
ORDER BY COUNT(d.id) DESC
LIMIT 1;


--EX7

SELECT * FROM grades g
JOIN courses c on g.course_id=c.id
WHERE c.name="Computer Science 143";

SELECT s.name, g.grade,c.name FROM students s
JOIN grades g ON g.student_id=s.id
JOIN courses c on g.course_id=c.id
WHERE c.name="Computer Science 143"
AND (g.grade LIKE 'A%' OR g.grade LIKE 'B%');

SELECT s.name, g.grade,c.name FROM students s
JOIN grades g ON g.student_id=s.id
JOIN courses c on g.course_id=c.id
WHERE g.grade LIKE 'A%' OR g.grade LIKE 'B%';

SELECT c.name FROM courses c
JOIN grades g ON g.course_id=c.id
JOIN students s ON s.id=g.student_id
GROUP BY c.id
HAVING COUNT(s.id)>=2;

