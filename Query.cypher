//1)	The student number and ssn of the student whose name is "Becky"

MATCH(s:student)
WHERE s.name = "Becky"
RETURN s.snum, s.ssn;

//2)	The major name and major level of the student whose ssn is 123097834

MATCH(s:student)-[:major]->(dg:degree)
WHERE s.ssn = '123097834'
return s.name, dg.level;

//3	All degree names and levels offered by the department Computer Science

MATCH(dg:degree)-[:offers]->(d:department)
where dg.name = "Computer Science"
return dg.name, dg.level;

//4)	The names of all students who have a minor

MATCH(s:student), (mi:minor)
where s.snum = mi.snum
return s.name;

//5)	The count of students who have a minor

MATCH(s:student), (mi:minor)
WHERE s.snum = mi.snum
return count(s);

//6)	The names and snums of all students enrolled in course “Algorithm”

MATCH(s:student), (c:course), (r:register)
WHERE s.snum = r.snum AND r.course_number = c.number AND c.name = "Algorithm"
return s.name, s.snum;

//7)	The names of all students who enrolled in course 363 and their corresponding grade 
MATCH (s:Student)-[r:register]->(c:Course)
WHERE c.number = 363
RETURN s.name, r.grade


//8)	The name and snum of the oldest student

MATCH(s:student)
return s.name ORDER by s.name ASC LIMIT 1;

//9)	The name and snum of the youngest student

MATCH(s:student)
return s.name ORDER by s.name DESC LIMIT 1;

//10)	The name, snum and SSN of the students whose name contains letter “n” or “N”

MATCH(s:student)
WHERE s.name contains 'n' or s.name contains 'N'
return s.snum, s.name, s.ssn;

//11)	The name, snum and SSN of the students whose name does not contain letter “n” or “N”

MATCH(s:student)
WHERE NOT s.name contains 'n' AND NOT s.name contains 'N'
return s.name, s.snum, s.ssn;

//12)	The course number, name and the number of students registered for each course

MATCH (c:courses), (s:student)-[:register]->(c)
return c.name, count(s);

//13)	The name of the students enrolled in Fall2020 semester.

MATCH (s:student)-[:register {regtime:"Fall2020"}]->(:courses)
return s.name;

//14)	The course numbers and names of all courses offered by Department of Computer Science

MATCH (d:departments)-[:offers]->(c:courses)
WHERE d.name = "Computer Science"
return c.number, c.name;

//15)	The course numbers and names of all courses offered by either Department of Computer Science or Department of Landscape Architect.

MATCH (d:departments)-[:offers]->(c:courses)
where d.name = "Computer Science" OR d.name = "Landscape Architect"
return c.number, c.name;
