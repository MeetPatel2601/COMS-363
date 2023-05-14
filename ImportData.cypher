//This script creates the graph database for the same information from Project 1. The tables are provided as csv files. You need to load those csv files into Neo4J to create nodes and edges. 


//load student
LOAD CSV with headers FROM 'https://docs.google.com/spreadsheets/d/e/2PACX-1vROrskhgTXDn0YC0bMnn9pSZG0fguBT8qSemdN8iJyNqhhn9bQ6z5X-3Lw1I3lFBmNyfDVohA4ZfOHi/pub?gid=946458172&single=true&output=csv' AS students
CREATE (s:student {snum:toInteger(students.snum), ssn:toInteger(students.ssn), name:students.name, gender:students.gender, c_addr:students.c_addr, c_phone:toInteger(students.c_phone), p_addr:students.p_addr, p_phone:toInteger(students.p_phone) })
with s, students
MATCH(c:course{name:students.name})
CREATE(s)<- [:registers]-(c);
CREATE CONSTRAINT FOR (s:student) REQUIRE s.ssn is unique;


//load department
LOAD CSV with headers FROM 'https://docs.google.com/spreadsheets/d/e/2PACX-1vSZjB-njgyoNAS7hhgvyqPMKs7gSEAzRzj55XrDsS4Ly_Q5pS2XWIWe-Qnx_UsszAxs7GZDT8z9N6l6/pub?gid=1270533085&single=true&output=csv' AS departments 
CREATE (d:departments { dcode:toInteger(departments.dcode),dname:departments.name,phone:toInteger(departments.phone),college:departments.college})
with d, departments
MATCH(c:course{dcode:toInteger(departments.code)})
CREATE(c)<- [:offers]-(d);
match (d:departments)
match (d:degree {dcode:d})
create (d)-[:administer]->(d);
CREATE CONSTRAINT FOR(d:department) REQUIRE d.dcode is unique;


//load degree
LOAD CSV with headers FROM 'https://docs.google.com/spreadsheets/d/e/2PACX-1vQmzlXmZkQbRaV4gcSaMRINRlEypaOZjMNBNutAHj2Eij4CgpfYni54oj5pFtNAb1k5vCu6pQlsuSBN/pub?gid=1817942933&single=true&output=csv' AS degrees
CREATE (dgr:degree {dname:degrees.name,level:degrees.level})
WITH dgr, degrees
MATCH (dep: department {dcode:toInteger(degrees.dcode)})
CREATE (dgr)<-[:administer]-(dep);
CREATE CONSTRAINT FOR (dg:degree) REQUIRE dg.name is unique;


//load course
LOAD CSV with headers FROM 'https://docs.google.com/spreadsheets/d/e/2PACX-1vQl4ewanefLXz_qsNa1FEYimkQoPWLighjsYtUicQ2ZAfje3BJNvIq2LHLMsTtNhSRq3bdDudFwSA47/pub?gid=1395040011&single=true&output=csv' AS courses
CREATE(c:course {number:toInteger(courses.number), name:courses.name, description:courses.description, credithours:toInteger(courses.credithours), level:courses.level, dcode:toInteger(courses.dcode)} );
CREATE CONSTRAINT FOR (c:courses) REQUIRE c.number is unique;


//load register
LOAD CSV with headers FROM 'https://docs.google.com/spreadsheets/d/e/2PACX-1vT7DgJc6JrTXz0JI5QUy4Vf8EbUipytjzLBLTRYe9qCQai62-4wxQFAnW5VUzHI0YZcKzt3_aGZS_GD/pub?gid=147295713&single=true&output=csv' AS register
CREATE(:register {snum:toInteger(register.snum), course_number:toInteger(register.course_number), regtime:register.regtime, grade:toInteger(register.grade) } );
CREATE CONSTRAINT FOR (r:register) REQUIRE r.snum is unique;


//load major
LOAD CSV with headers FROM 'https://docs.google.com/spreadsheets/d/e/2PACX-1vShYSEUl5j9HpV0GngP4AIk_3wlIfQXK-OF3zCxiL6TkDZ69ultb734LN5LPBq9oKAfcl-T1iqQkS1q/pub?gid=995703209&single=true&output=csv' AS majors
CREATE(ma:major {snum:toInteger(majors.snum), name:majors.name, level:majors.level } );
CREATE CONSTRAINT FOR (ma:major) REQUIRE ma.snum is unique;


//load minor
LOAD CSV with headers FROM 'https://docs.google.com/spreadsheets/d/e/2PACX-1vQEhGIicNxhMTy6z0bpzPZIlSneFOorg0Sp6ApOFlHf0uz3aNuZAHB1KoXNssjqrGPksWXjEdBJeZ1j/pub?gid=1971279781&single=true&output=csv' AS minors
CREATE(mi:minor {snum:toInteger(minors.snum), name:minors.name, level:minors.name } );
CREATE CONSTRAINT FOR (mi:register) REQUIRE mi.snum is unique;
