-- Checking for any data discrepancies in Gender Column and Position Column
SELECT Gender 
from hr_data 
group by Gender;

SELECT Position 
from hr_data 
group by Position;

-- Checking for data type of the columns
describe hr_data;

-- For the purpose of more detailed analysis, the Age and Salary columns were categorized into different groups.
CREATE TABLE hr_database AS 
SELECT
	EmployeeID,
	Age,
	CASE
		WHEN Age <= 30 THEN '<= 30 years'
		ELSE '> 30 years'
	END AS AgeGroup,
	REPLACE(REPLACE(GENDER, 'Female', 'F'), 'Male', 'M') AS Gender,
	Department,
	REPLACE(REPLACE(Position, 'DataScientist', 'Data Scientist'), 'Marketinganalyst', 'Marketing Analyst') AS Position,
	YearsOfService,
	Salary,
	CASE 
		WHEN Salary >= 90000 THEN '90K - 100K'
		WHEN Salary >= 80000 THEN '80K - 90K'
		WHEN Salary >= 70000 THEN '70K - 80K'
		WHEN Salary >= 60000 THEN '60K - 70K'
		ELSE '50K - 60K'
	END AS SalaryBucket,
	PerformanceRating,
	WorkHours,
	Attrition,
	Promotion,
	TrainingHours,
	SatisfactionScore,
	LastPromotionDate
FROM hrdata;

-- datatype of the column Last_Promotion_Date was changed from text to varchar(50)
ALTER TABLE hr_database
MODIFY COLUMN Last_Promotion_Date VARCHAR(50);

-- data inside the column was converted 
UPDATE hr_database
SET Last_Promotion_Date = 
  CASE 
    WHEN LENGTH(Last_Promotion_Date) = 10 AND Last_Promotion_Date LIKE '__-__-____' THEN STR_TO_DATE(Last_Promotion_Date, '%d-%m-%Y')
    WHEN LENGTH(Last_Promotion_Date) = 10 AND Last_Promotion_Date LIKE '____-__-__' THEN STR_TO_DATE(Last_Promotion_Date, '%Y-%m-%d')
    ELSE NULL
  END;

-- datatype of the column Last_Promotion_Date was changed from  varchar(50) to date
ALTER TABLE hr_database
MODIFY COLUMN Last_Promotion_Date DATE;

-- Analysing age group of employees who has left the organisation.
SELECT 
	AgeGroup, 
	Performance_Rating, 
	count(*) as employeeLeft 
from hr_database 
where attrition='Yes' 
group by AgeGroup, Performance_Rating;
-- Comparing this with Employees who has not left the organisation
SELECT 
	AgeGroup, 
	Performance_Rating, 
	count(*) as employeeLeft 
from hr_database 
where attrition='No' 
group by AgeGroup, Performance_Rating;

-- Analysing Gender of the employees with their performance rating is compared.
SELECT 
	Gender, 
	Performance_Rating, 
	count(*) as employeeLeft 
from hr_database 
where attrition='Yes' 
group by Gender, Performance_Rating;
-- Comparing this with Employees who has not left the organisation
SELECT 
	Gender, 
	Performance_Rating, 
	count(*) as employeeLeft 
from hr_database 
where attrition='No' 
group by Gender, Performance_Rating;

-- Comparing Year of Service with performance rating
SELECT 
    CASE 
        WHEN Years_of_Service <= 5 THEN '<= 5 years'
        WHEN Years_of_Service > 5 AND Years_of_Service <= 10 THEN '6 to 10 years'
        ELSE '> 10 years'
    END AS Years_of_Service_bucket, 
    Performance_Rating, 
    COUNT(*) AS employeeLeft
FROM hr_database
WHERE attrition = 'Yes' 
GROUP BY Years_of_Service_bucket, Performance_Rating;
-- Comparing this with Employees who has not left the organisation
SELECT 
    CASE 
        WHEN Years_of_Service <= 5 THEN '<= 5 years'
        WHEN Years_of_Service > 5 AND Years_of_Service <= 10 THEN '6 to 10 years'
        ELSE '> 10 years'
    END AS Years_of_Service_bucket, 
    Performance_Rating, 
    COUNT(*) AS employeeLeft
FROM hr_database
WHERE attrition = 'No' GROUP BY Years_of_Service, bucket, Performance_Ratin;

-- Comparing Salary Bucket with performance rating
SELECT
	SalaryBucket,
    Performance_Rating,
    count(*)
from hr_database
WHERE attrition = 'Yes'
GROUP BY SalaryBucket, Performance_Rating;
-- Comparing this with Employees who has not left the organisation
SELECT
	SalaryBucket,
    Performance_Rating,
    count(*)
from hr_database
WHERE attrition = 'No'
GROUP BY SalaryBucket, Performance_Rating;

-- Comparing Training Hours with performance rating
SELECT 
    CASE 
        WHEN Training_Hours <= 15 THEN '<= 15 Hours'
        WHEN Training_Hours > 15 AND Training_Hours <= 20 THEN '15 to 20 Hours'
        WHEN Training_Hours > 20 AND Training_Hours <= 25 THEN '20 to 25 Hours'
        ELSE '> 15 Hours'
    END AS Training_Hours_bucket, 
    Performance_Rating, 
    COUNT(*) AS employeeLeft
FROM hr_database
WHERE attrition = 'Yes'
GROUP BY Training_Hours_bucket, Performance_Rating;
-- Comparing this with Employees who has not left the organisation
SELECT 
    CASE 
        WHEN Training_Hours <= 15 THEN '<= 15 Hours'
        WHEN Training_Hours > 15 AND Training_Hours <= 20 THEN '15 to 20 Hours'
        WHEN Training_Hours > 20 AND Training_Hours <= 25 THEN '20 to 25 Hours'
        ELSE '> 15 Hours'
    END AS Training_Hours_bucket, 
    Performance_Rating, 
    COUNT(*) AS employeeStayed
FROM hr_database
WHERE attrition = 'No'
GROUP BY Training_Hours_bucket, Performance_Rating;

-- Comparing Promotions with performance rating
SELECT 
	Promotion,
    Performance_Rating, 
    count(*) 
from hr_database 
WHERE attrition = 'Yes'
GROUP BY Promotion, Performance_Rating;
-- Comparing this with Employees who has not left the organisation
SELECT 
	Promotion,
    Performance_Rating, 
    count(*)
from hr_database 
WHERE attrition = 'No'
GROUP BY Promotion, Performance_Rating;

-- Comparing Satisfaction Score with performance rating
SELECT 
	Satisfaction_Score,
    Performance_Rating, 
    count(*) 
from hr_database 
WHERE attrition = 'Yes'
GROUP BY Satisfaction_Score, Performance_Rating;
-- Comparing this with Employees who has not left the organisation
SELECT 
	Satisfaction_Score,
    Performance_Rating, 
    count(*) 
from hr_database 
WHERE attrition = 'No'
GROUP BY Satisfaction_Score, Performance_Rating;
