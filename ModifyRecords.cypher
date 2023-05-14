//1)	Change the name of the student with ssn = 746897816 to Scott

MATCH (s:student {ssn:"746897816"})
SET s.name = "Scott"
return s.name, s.ssn;

//2)	Change the major of the student with ssn = 746897816 to Computer Science, Master. 

MATCH (s:student {ssn:"746897816"})-[ma:major]->(:degree)
DELETE ma WITH s
MATCH(d:degree {name:"Computer Science", level:"MS"})
CREATE (s)-[:major]->(d);

//3)	Delete all registration records that were in “Spring2021”,

MATCH (:student)-[r:register {regtime:"Spring2021"}]->(:courses)
DELETE r;