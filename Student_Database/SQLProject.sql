--9.Write the following Query based on the above datasets.
use LMT_University ;
-- a. List all the Student information from the Student table
SELECT * 
FROM Students

--9b.List all the Department information from the Department table.
SELECT * 
FROM Department

--9c. List all the Lecturer information from the Lecturer table.
SELECT * 
FROM Lecturer

--9d. List all the Address information from the Address table.
SELECT *
FROM Address

--9e. List the StudentFullName, StudentDOB, StudentMobile from Student 
SELECT CONCAT(StudentFirstName,' ', StudentLastName) as StudentFullName
FROM Students

--9f. List the StudentID, StudentFirstName, StudentLastName, StudentDOB, StudentMobile 
SELECT StudentId,StudentFirstName,StudentLastName,StudentDOB,StudentMobile,StudentRollNo
FROM Students
WHERE AddressID = 7;

--9g. List all the student information whose first name is start with 'B'
SELECT * FROM Students
WHERE StudentFirstName Like 'B%';

--9h. List all the student information whose first name is start and end with 'A'
SELECT * FROM Students
WHERE StudentFirstName Like 'A%A'; 

--9i. Count the number of Student from Student table whose DepartmentID 6.
SELECT Count(StudentId) FROM Students
WHERE Department_ID = 6;

--j. List all the StudentFullName, StudentAge, StudentMobile from Student 
SELECT concat(StudentFirstName,' ',StudentLastName),
		(YEAR(GETDATE())-YEAR(StudentDOB)) as StudentAge, 
		StudentMobile
FROM students

--k. List all the StudentFullName, StudentAge, StudentMobile whose Age>23 from Student 
SELECT CONCAT(studentfirstname,studentlastname) StudentFullName,
		(YEAR(GETDATE())-YEAR(StudentDOB)) as StudentAge, 
		StudentMobile
FROM students
WHERE (YEAR(GETDATE())-YEAR(StudentDOB)) >23;

--l. List all the StudentFullName, StudentAge, StudentMobile whose Age is either 21 or 23 
SELECT CONCAT(studentfirstname,studentlastname) StudentFullName,
		(YEAR(GETDATE())-YEAR(StudentDOB)) as StudentAge, 
		StudentMobile
FROM students
WHERE (YEAR(GETDATE())-YEAR(StudentDOB)) in (21,23); 

--m. List all the LecturerID, LecturerName, LecturerHighestQualification, LecturerAge from Lecturer
SELECT Lecturer_ID, Lecturer_Name, Lecturer_Highest_Qualification, Lecturer_Age 
from Lecturer
order by Lecturer_Age

--n . List all the LecturerID, LecturerName, LecturerHighestQualification, LecturerAge from Lecturer whose HighestQualification is either “MS” or “PhD”.
SELECT Lecturer_ID, Lecturer_Name, Lecturer_Highest_Qualification, Lecturer_Age
FROM LECTURER
WHERE Lecturer_Highest_Qualification in ('MS','PhD');

--9O List all the lecturer information who belongs to DepartmentID 2
select * 
from Lecturer 
where Department_ID=2;


--9P List all the lecturer information whose name end with “R”.
select * 
from Lecturer 
where Lecturer_Name LIKE '%r';

--9Q List all the lecturer information whose name either start or end with “E”
select * 
from Lecturer 
where Lecturer_Name LIKE 'e%e'

--9R List all the lecturer name is in capital letter
select UPPER(lecturer_name) 
from LECTURER ;

--9S Display 5 character from the lecturer name along with LecturerID and LecturerHighestQualification.
	SELECT LEFT(lecturer_name,5) lecturer,
	lecturer_name,Lecturer_ID,
	LEFT(Lecturer_Highest_Qualification,5) Qualifications
	FROM LECTURER

--9T List LecturerID, LecturerName, LecturerHighestQualification, LecturerAge(in year) [LecturerAge= Current Date – LecturerAge)] (in year).
SELECT Lecturer_ID, Lecturer_Name, Lecturer_Highest_Qualification,
(YEAR(GETDATE())-YEAR(Lecturer_Age)) as Lecturer_Age
FROM LECTURER

--9U List DepartmentID, DepartmentName, DepartmentDescription, DepartmentCapacity from Department.
select DepartmentID,Department_Name,Department_Description,Department_Capacity 
from Department

--9V List all the Department information who’s DepartmentName is “ECE”.
select * from Department where Department_Name='ECE'

--9W List all DepartmentName, DepartmentDescription, DepartmentCapacity from Department whose capacity is greater than 60.
select Department_Name,Department_Capacity,Department_Description
from Department 
where Department_Capacity>60

--9X List all AddressID, StreetAddress, City, State, PostalCode, Country from Address.
Select Address_ID,Street_Address,City,State,Postal_Code,Country 
from Address

--9Y List all AddressID, StreetAddress, City, State, PostalCode, Country from Address who belongs to “Poland” country.
Select Address_ID,Street_Address,City,State,Postal_Code,Country
from Address 
where Country='Poland';

--9Z List all the Address information whose state is null.
SELECT * FROM Address
WHERE STATE IS NULL;

--9aa List all the Address information whose PostalCode is not null.
select * from Address where Postal_Code IS NOT NULL;

--9bb . List all the Address information whose City name is "Honda" and Country name is "Colombia"
select * from Address where City='Honda' AND Country='Colombia';

--9Z List all the Address information whose state is null.
select * from Address where State IS NULL;

--9aa  List all the Address information whose state is null.
SELECT * 
FROM address
WHERE State is not null;

--9bb List all the Address information whose PostalCode is not null.
select * from Address where Postal_Code IS NOT NULL

--10a. List unique DOB from Student.
SELECT DISTINCT(StudentDOB)
FROM Students

--10b List unique DepartmentName from Department
SELECT DISTINCT(Department_Name)
FROM Department

--10c List unique Country name from Address
SELECT DISTINCT(Country)
FROM Address

SELECT count(Country) total FROM Address

--10d List unique State name from Address
SELECT DISTINCT State
FROM Address
WHERE State IS NOT NULL;

--10e List unique City name from Address
SELECT DISTINCT City
FROM Address;

--10f List all the LecturerID, LecturerName, LecturerHighestQualification, LecturerYearService from Lecturer
Select Lecturer_ID, Lecturer_Name, Lecturer_Highest_Qualification, 
	LecturerYearService = YEAR(Getdate())-year(Lecturer_Age)
from Lecturer;

--10g List all the LecturerID, LecturerName, LecturerHighestQualification, LecturerType from Lecturer [LecturerType= if LecturerYearService< 5 then "Begining Level Experience" elseif LecturerYearService>=5 and LecturerYearService<10 then "Mid Level experience" else "Experienced".
SELECT Lecturer_ID, Lecturer_Name, Lecturer_Highest_Qualification,
CASE
	WHEN YEAR(Getdate())-year(Lecturer_Age) <5 then 'Begining Level Experience'
	WHEN YEAR(Getdate())-year(Lecturer_Age) <10 then 'Mid Level experience'
	else 'Experienced' 
End as LectureType
FROM Lecturer


--11.a Display all Student and their Department Information based on the relationship.
SELECT CONCAT(StudentFirstName,' ',StudentLastName) Student_Name,StudentRollNo, D.Department_Description
FROM Students S
Left Join Department D
ON S.Department_ID = D.DepartmentID


--11 (b) Display all Student and their Address Information based on the relationship.
SELECT CONCAT(StudentFirstName,' ',StudentLastName) Student_Name,StudentRollNo,StudentDOB, A.Street_Address,A.City, A.State,
	A.Postal_Code, A.Country
FROM Students S
Left Join Address A
ON S.AddressID = A.Address_ID;

--11 (c) . Display all Department and their Lecturer Information based on the relationship.
SELECT *
FROM Department D
left join LECTURER L 
ON D.DepartmentID = L.Department_ID

-- 11(d) Display all Student with their Department with Lecturer Information based on the relationship.
SELECT * 
FROM Students S
LEFT JOIN Department D on S.Department_ID = D.DepartmentID
LEFT JOIN LECTURER L on L.Department_ID = D.DepartmentID;

-- 11(e) Display all Student with their Address and Department Information based on the relationship.
SELECT
	S.[StudentID], 
	S.[StudentFirstName], 
	S.[StudentLastName], 
	S.[StudentDOB], 
	S.[StudentMobile], 
	S.[StudentRollNo], 
	S.[AddressID],
	S.[Inserted_On],
	A.[Street_Address],
	A.[City],
	A.[State],
	A.[Country],
	A.[Postal_Code],
	D.[Department_Name],
	D.[Department_Description],
	D.[Department_Capacity]
FROM Students S
Left join Address A ON S.AddressID = A.Address_ID
Left join Department D ON S.Department_ID = D.DepartmentID;


-- 11(f) Display all Student with Address, Department and Lecturer Information based on the relationship.
Select 
	S.[StudentID], 
	S.[StudentFirstName], 
	S.[StudentLastName], 
	S.[StudentDOB], 
	S.[StudentMobile], 
	S.[StudentRollNo], 
	S.[AddressID],
	S.[Inserted_On],
	A.[Street_Address],
	A.[City],
	A.[State],
	A.[Country],
	A.[Postal_Code],
	D.[Department_Name],
	D.[Department_Description],
	D.[Department_Capacity],
	L.[Lecturer_ID],
	L.[Lecturer_Name],
	L.[Lecturer_Age],
	L.[Lecturer_Highest_Qualification]
	From [dbo].[Students] S
Left join [dbo].[Address] A on S.AddressID=A.Address_ID
Left join [dbo].[Department] D on S.Department_ID=D.DepartmentID
Left join [dbo].[Lecturer] L on D.DepartmentID=L.Department_ID
WHERE D.[Department_Name] IN ('ME','ECE');


--11(h)	Display Student with Department and their Lecturer information based on the LecturerHighestQualification either “MS” or “PhD”.

Select 
	S.StudentID, 
	S.StudentFirstName, 
	S.StudentLastName, 
	S.StudentDOB, 
	S.StudentMobile, 
	S.StudentRollNo,
	S.Inserted_On,
	D.Department_Name,
	D.Department_Description,
	D.Department_Capacity,
	L.Lecturer_ID,
	L.Lecturer_Name,
	L.Lecturer_Age,
	L.Lecturer_Highest_Qualification
From Students S
Left join Department D on S.Department_ID =D.DepartmentID
Left join Lecturer L on D.DepartmentID=L.Department_ID

WHERE L.Lecturer_Highest_Qualification IN ( 'MS''PhD')
Order By S.StudentID;



--11(i) Display Student with Department and Address Information, where student belongs to “Thailand” country.
SELECT *
From Students S
Left join Address A on S.AddressID=A.Address_ID
Left join Department D on S.Department_ID=D.DepartmentID
WHERE A.Country = 'Thailand';


--11(j) Display Count of Student, Department wise.
SELECT D.Department_Name, Count(StudentID) as Students
FROM Students S
Left join Department D
ON S.Department_ID = D.DepartmentID
Group by D.Department_Name
Order By D.Department_Name;

--11(k) Display Count of Lecturer, Department wise.
SELECT D.Department_Name, Count(Lecturer_ID) as Lecturs
FROM LECTURER L
Left join Department D
ON L.Department_ID = D.DepartmentID
Group by D.Department_Name
Order By D.Department_Name;

--11(i) Display Count of Student, Country wise.
SELECT A.Country, Count(StudentID) as Students
FROM Students S
Left join Address A
ON A.Address_ID= S.StudentId
Group by A.Country
Order By count(StudentId) desc;

SELECT A.Country, Count(StudentID) as Students
FROM Students S
Left join Address A
ON A.Address_ID= S.StudentId
where A.Country is not null 
Group by A.Country
Order By count(StudentId) desc;



--12.a. Create new table StudCopy and copy all records from Student table.
 
Select * into StudCopy FROM Students;

--12.b. Create a new table DeptCopy and copy only the schema from Department table
Select * into DeptCopy FROM Department where 0 = 1; 

Select * into DeptCxcmn FROM Department where 1 = 0; 

Select * from DeptCopy

Select * from DeptCxcmn

--12c.	Create a new table DepartmentCopy and copy all records from Department table
Select * into DepartmentCopy from Department;

Select * from DepartmentCopy

Select Top 5 * from DepartmentCopy

--12d.	Create a new table AddrCopy and copy only the schema from Address table.

Select * into AddrCopy FROM Address where 0 = 1; 

SELECT * FROM AddrCopy

--12e.	Create a new table AddrCopy and copy all the records from Address table.
Select * into AddressCopy from Address;


--12f.	Create a new table LecturerCopy and copy all the records from Lecturer table.
Select * into LecturerCopy from Lecturer;

Select * from LecturerCopy

Select Top 5 * from LecturerCopy

--13a.	Delete all the records from LecturerCopy table.
DELETE FROM LecturerCopy;

--13b.	Delete all the student information for the students who belong to “IT” department
DELETE StudCopy from StudCopy S
Inner join Department D
ON D.DepartmentID = S.Department_ID
where Department_Name = 'IT';

SELECT * FROM StudCopy

--13c.	Delete all the student information for the students who belong to “Indonesia” country.
DELETE StudCopy from StudCopy S
Inner join Address A
ON A.Address_ID = S.AddressID
where Country = 'Indonesia';

SELECT * FROM StudCopy

--13d.	Delete all the student information for the student who belongs to “Nanshi” city.
DELETE StudCopy from StudCopy S
Inner join Address A
ON A.Address_ID = S.AddressID
where City = 'Nanshi';

SELECT * FROM StudCopy;


--13e.	Delete all the student information for the student who belongs to “Bretagne” state.
DELETE StudCopy from StudCopy S
Inner join Address A
ON A.Address_ID = S.AddressID
where State = 'Bretagne';

SELECT * FROM StudCopy;



--14a. Update StudentMobile for those students who belongs to Department “ME”
UPDATE StudCopy 
SET StudentMobile = ABS(CHECKSUM(newid()))
FROM StudCopy S
inner join Department D
ON D.DepartmentID = S.Department_ID
where D.Department_Name = 'ME';

Select * From StudCopy S
inner join Department D
ON D.DepartmentID = S.Department_ID
where D.Department_Name = 'ME';


--14b. Update Student DepartmentID as 3, for the StudentID=42.
UPDATE Students
SET Department_ID = 3
WHERE StudentId = 42;


--14c. Update LecturerHighestQualification as “PHd” for the Lecturer whose LecturerHighestQualification= “PhD”.
UPDATE LECTURER
SET Lecturer_Highest_Qualification = 'PHd'
WHERE Lecturer_Highest_Qualification= 'PhD';

--14d. Update PostalCode as “00000” for the Address which contain NULL as a PostalCode
UPDATE Address
SET Postal_Code = '00000'
WHERE Postal_Code IS NULL;


--14e Update StudentLastName as “Paul” for the Student whose Name is “Jerry”
UPDATE Students
SET StudentLastName = 'Paul'
Where StudentFirstName = 'Jerry';
