SELECT * FROM DataProfessionalsurvey

-- Identify invalid email addresses 
SELECT * FROM DataProfessionalsurvey
WHERE Email NOT LIKE '%@%.%'; 

UPDATE DataProfessionalsurvey
SET Email = NULL WHERE Email NOT LIKE '%@%.%';

UPDATE DataProfessionalsurvey
SET City = NULL WHERE Email NOT LIKE '****';

UPDATE DataProfessionalsurvey
SET [Q12 - Highest Level of Education] = 'Bachelors'
WHERE [Q12 - Highest Level of Education] = '';

alter table ['Data Professional Survey$'] 
drop column City 


SELECT * FROM DataProfessionalsurvey

alter table ['Data Professional Survey$']
drop column OS
 

alter table ['Data Professional Survey$']
drop column Browser,Country,Referrer

alter table ['Data Professional Survey$']
drop column Country,Referrer

select * from DataProfessionalsurvey

alter table ['Data Professional Survey$']
drop column Email

ALTER TABLE ['Data Professional Survey$'];


 EXEC sp_rename 'DataProfessionalsurvey.[Date Taken (America/New_York)]','Date Taken','COLUMN';

 SELECT * FROM DataProfessionalsurvey

 EXEC sp_rename 'DataProfessionalsurvey.[DATE TAKEN]','Date Taken','COLUMN';

 EXEC sp_rename 'DataProfessionalsurvey.[Q3 - Current Yearly Salary (in USD)]','yearlysalary','COLUMN';

 SELECT SUBSTRING(yearlysalary, CHARINDEX('-',yearlysalary)+1,LEN(yearlysalary))
 from DataProfessionalsurvey
 
 with CTEsalary as (select[unique id],SUBSTRING(yearlysalary, CHARINDEX('-',yearlysalary)+1,LEN(yearlysalary))
 AS yearlysalary 
 from DataProfessionalsurvey)
 select * from CTEsalary c


 SELECT * FROM DataProfessionalsurvey
 update DataProfessionalsurvey
 SET yearlysalary=
 
 (SELECT SUBSTRING(yearlysalary, CHARINDEX('-',yearlysalary)+1,LEN(yearlysalary))
 from DataProfessionalsurvey)



--splitting salary
 SELECT SUBSTRING(yearlysalary, CHARINDEX('-',yearlysalary)+1,LEN(yearlysalary))
 from DataProfessionalsurvey

 --REMOVING OTHERS PLEASE SPECIFY
 select REPLACE([Q1 - Which Title Best Fits your Current Role?],'Other (Please Specify):','') from DataProfessionalsurvey
 UPDATE DataProfessionalsurvey
 SET [Q1 - Which Title Best Fits your Current Role?]=REPLACE([Q1 - Which Title Best Fits your Current Role?],'Other (Please Specify):','')
 WHERE [Q1 - Which Title Best Fits your Current Role?] LIKE 'Other (Please Specify):%'

 UPDATE DataProfessionalsurvey
 SET [Q1 - Which Title Best Fits your Current Role?]='Student'
 WHERE [Q1 - Which Title Best Fits your Current Role?]='Student/Looking/None'

 EXEC sp_rename  'DataProfessionalsurvey.[Q1 - Which Title Best Fits your Current Role?]', 'CurrentRole','COLUMN'

 SELECT * FROM DataProfessionalsurvey

 EXEC sp_rename 'DataProfessionalsurvey.[Q2 - Did you switch careers into Data?]','switched careers?','COLUMN'

 --CLEANING Q4
  UPDATE DataProfessionalsurvey
 SET [Q4 - What Industry do you work in?]=REPLACE([Q4 - What Industry do you work in?],'Other (Please Specify)',NULL)
 WHERE [Q4 - What Industry do you work in?] = 'Other (Please Specify)'
  EXEC sp_rename 'DataProfessionalsurvey.[Q4 - What Industry do you work in?]','Industry','COLUMN'
  
  UPDATE DataProfessionalsurvey
  set Industry=REPLACE(Industry,'None for now', NULL)
  WHERE Industry = 'None for now'

--Q5
SELECT DISTINCT ProgrammingLanguage, COUNT( FROM DataProfessionalsurvey

SELECT DISTINCT ProgrammingLanguage, COUNT(ProgrammingLanguage) OVER (Partition by ProgrammingLanguage Order by ProgrammingLanguage) FROM DataProfessionalsurvey

  EXEC sp_rename 'DataProfessionalsurvey.Q5 - Favorite Programming Language','ProgrammingLanguage','COLUMN'

update DataProfessionalsurvey
set ProgrammingLanguage=REPLACE(ProgrammingLanguage,'Other:','')
WHERE ProgrammingLanguage LIKE 'Other:%'

update DataProfessionalsurvey
set ProgrammingLanguage=REPLACE(ProgrammingLanguage,'Sql &  plsql','SQL')
WHERE ProgrammingLanguage = 'Sql &  plsql'


update DataProfessionalsurvey
set ProgrammingLanguage=REPLACE(ProgrammingLanguage,'SQL because that is all I know really well so far. ','SQL')
WHERE ProgrammingLanguage = 'SQL because that is all I know really well so far. '

SELECT DISTINCT ProgrammingLanguage, COUNT(ProgrammingLanguage) OVER (Partition by ProgrammingLanguage Order by ProgrammingLanguage) FROM DataProfessionalsurvey

update DataProfessionalsurvey
set ProgrammingLanguage=REPLACE(ProgrammingLanguage,'I currently do not work with programming languages yet',NULL)
WHERE ProgrammingLanguage = 'I currently do not work with programming languages yet'

update DataProfessionalsurvey
set ProgrammingLanguage=REPLACE(ProgrammingLanguage,'I do analysis and create presentations based on datasets provided by others',NULL)
WHERE ProgrammingLanguage = 'I do analysis and create presentations based on datasets provided by others'


update DataProfessionalsurvey
set ProgrammingLanguage=REPLACE(ProgrammingLanguage,'None%',NULL)
WHERE ProgrammingLanguage LIKE 'None%'


SELECT PROGRAMMINGlANGUAGE FROM DataProfessionalsurvey
WHERE ProgrammingLanguage='NULL'


SELECT * FROM DataProfessionalsurvey

EXEC sp_rename 'DataProfessionalsurvey.Q6 - How Happy are you in your Current Position with the followi','SalarySatisfaction','COLUMN'

EXEC sp_rename 'DataProfessionalsurvey.Q6 - How Happy are you in your Current Position with the follow1','WorkLifeSatisfaction','COLUMN'
EXEC sp_rename 'DataProfessionalsurvey.Q6 - How Happy are you in your Current Position with the follow2','CoWorkersSatisfaction','COLUMN'
EXEC sp_rename 'DataProfessionalsurvey.Q6 - How Happy are you in your Current Position with the follow3','ManagementSatisfaction','COLUMN'
EXEC sp_rename 'DataProfessionalsurvey.Q6 - How Happy are you in your Current Position with the follow4','UpwardMobilitySatisfaction','COLUMN'
EXEC sp_rename 'DataProfessionalsurvey.Q6 - How Happy are you in your Current Position with the follow5','LearningNewThingsSatisfaction','COLUMN'
EXEC sp_rename 'DataProfessionalsurvey.Q7 - How difficult was it for you to break into Data?','EaseOfEntryIntoData','COLUMN'
EXEC sp_rename 'DataProfessionalsurvey.Q8 - If you were to look for a new job today, what would be the ','NewJobInterest','COLUMN'
EXEC sp_rename 'DataProfessionalsurvey.Q9 - Male/Female?','Gender','COLUMN'
EXEC sp_rename 'DataProfessionalsurvey.Q10 - Current Age','Age','COLUMN'
EXEC sp_rename 'DataProfessionalsurvey.Q11 - Which Country do you live in?','Country','COLUMN'
EXEC sp_rename 'DataProfessionalsurvey.Q12 - Highest Level of Education','EducationalLevel','COLUMN'
EXEC sp_rename 'DataProfessionalsurvey.Q13 - Ethnicity','Ethnicity','COLUMN'
EXEC sp_rename 'DataProfessionalsurvey.[DATE TAKEN]','Date taken','COLUMN'
select * from DataProfessionalsurvey

SELECT DISTINCT NewJobInterest, COUNT(NewJobInterest) OVER (Partition by NewJobInterest Order by NewJobInterest) FROM DataProfessionalsurvey


UPDATE DataProfessionalsurvey
SET NewJobInterest=REPLACE(NewJobInterest,'Other (Please Specify):','')
WHERE NewJobInterest LIKE 'Other (Please Specify):%'

SELECT Ethnicity FROM DataProfessionalsurvey
GROUP BY Ethnicity
;

UPDATE DataProfessionalsurvey
SET Country=REPLACE(Country,'Other (Please Specify):',NULL)
WHERE Country LIKE 'Other (Please Specify)'

UPDATE DataProfessionalsurvey
SET Ethnicity=REPLACE(Ethnicity,'Other (Please Specify):','')
WHERE Ethnicity LIKE 'Other (Please Specify)%'



select * from DataProfessionalsurvey

update DataProfessionalsurvey
set Ethnicity = trim((REPLACE(Ethnicity,'White or Caucasian','white')))
where Ethnicity like 'White or Caucasian'

Alter table DataProfessionalsurvey
add salary int;

select * from DataProfessionalsurvey 

update DataProfessionalsurvey
set salary = replace(replace(substring(yearlysalary, CHARINDEX('-', yearlysalary)+1, len(yearlysalary)), 'k',''),'+','')



alter table DataProfessionalsurvey
drop column yearlysalary

update DataProfessionalsurvey
set Ethnicity = trim(replace(Ethnicity,'Black or African American','AfricanAmerican'))
where Ethnicity = 'Black or African American'

select * from DataProfessionalsurvey
update DataProfessionalsurvey
set Ethnicity = trim(replace(Ethnicity,'Asian or Asian American','AsianAmerican'))
where Ethnicity = 'Asian or Asian American'

update DataProfessionalsurvey
set Ethnicity = trim(replace(Ethnicity,'Hispanic or Latino','Latino'))
where Ethnicity = 'Hispanic or Latino'