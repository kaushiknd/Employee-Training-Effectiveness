# Employee-Training-Effectiveness
## Optimizing Employee Training Programs

## Objective: 
Analyse the effectiveness of training programs and recommend improvements to enhance employee skills and performance.

Introduction:
Assessing training program effectiveness is vital in the dynamic business landscape. This analysis delves into the impact of training initiatives on employee skills and performance. It evaluates participation rates and post-training outcomes to identify successful strategies and areas needing improvement. By providing actionable recommendations, it aims to enhance workforce competencies, keeping the organization agile in a competitive environment.
## Data Cleaning and Processing:
1.	The available data with table name hr_data contains discrepancies which has to be taken care.
2.	Gender & Position column has incompatible data:

   ![image](https://github.com/kaushiknd/Employee-Training-Effectiveness/assets/115521614/c99a9605-9b14-4613-b3ca-cf0f300b9252)
   ![image](https://github.com/kaushiknd/Employee-Training-Effectiveness/assets/115521614/05920729-f4a4-4562-b4ac-1a5c799b0600)

  Here we can observe Data Scientist & Marketing Analyst data has Duplicates.

3.	Also the column Last_Promotion_Date is in varchar Datatype. 

![image](https://github.com/kaushiknd/Employee-Training-Effectiveness/assets/115521614/2fa2c1e5-2135-45a5-99d5-032c7e4a0504)

4.	All these columns has to be changed. Hence, data cleaning process was carried out using below queries,

   I.	Gender column was Replaced ‘Male’ to ‘M’ and ‘Female’ to ‘F’.

   II.	Position column was replaced ‘DataScientist’ to ‘Data Scientist’ and ‘Marketinganalyst’ to ‘Marketing Analyst’.

   III.	Age Group Column was created by filtering Age <= 30 and Age>30.

   IV.	SalaryBucket column was created by filtering the salary column.

   V.	LastPromotionDate Column was unable to modify hence followed different approach.

      a.	First datatype of the column was changed from text to varchar(50)
   
      b.	Then the data inside the column was converted as below.
   
      c.	Then the data type of the column was changed from varchar to date.

Now the data is cleaned and feasible for analysing the data.

## Data Analysis: 
1.	Analysing age group of employees who has left the organisation.

![image](https://github.com/kaushiknd/Employee-Training-Effectiveness/assets/115521614/fb61f2d5-72c8-4ef6-8c0c-7575822cd4c9)

 
Comparing this with Employees who has not left the organisation

 ![image](https://github.com/kaushiknd/Employee-Training-Effectiveness/assets/115521614/46ee4945-3a72-4d41-a2e7-bf6b5ffb060d)


There is no clear correlation between an employee's age and their performance rating. High-performing employees can be found across all age groups. This suggests that age is not a significant factor in determining job performance within the organization.

2.	Now Gender of the employees with their performance rating is compared.

 ![image](https://github.com/kaushiknd/Employee-Training-Effectiveness/assets/115521614/0e7b82f2-5de1-4906-b2a5-062981d654f8)

Comparing this with Employees who has not left the organisation

 ![image](https://github.com/kaushiknd/Employee-Training-Effectiveness/assets/115521614/fc5a35f3-0adc-495d-914e-5ba1eea70390)

Gender also doesn't appear to have a substantial impact on performance rating. Both male and female employees receive similar performance ratings. The organization seems to provide equal opportunities and assesses employee performance objectively.


3.	Comparing Year of Service with performance rating

![image](https://github.com/kaushiknd/Employee-Training-Effectiveness/assets/115521614/02b12da8-bd21-4720-8d00-790148e157b0)

Comparing this with Employees who has not left the organisation

 ![image](https://github.com/kaushiknd/Employee-Training-Effectiveness/assets/115521614/c1bd21b7-9a1f-4acf-a902-8c11fc472028)

The dataset shows that more experienced employees (with higher years of service) don't necessarily receive higher performance ratings. Performance ratings appear to be distributed evenly among employees with different levels of experience.

4.	Comparing Salary Bucket with performance rating
 
![image](https://github.com/kaushiknd/Employee-Training-Effectiveness/assets/115521614/b6908a53-2ce4-4df1-890b-c7f62a68fe2a)

Comparing this with Employees who has not left the organisation
 
![image](https://github.com/kaushiknd/Employee-Training-Effectiveness/assets/115521614/2a304726-83a2-482d-8159-350c0f6b0492)

Most employees with a performance rating of 4 or 5 fall into the 60K - 70K salary range. While higher salaries can be found in the 70K - 80K range, this doesn't seem to be a guarantee of higher performance ratings. The distribution of performance ratings is fairly consistent across different salary brackets.

5.	Comparing Training Hours with performance rating
 
![image](https://github.com/kaushiknd/Employee-Training-Effectiveness/assets/115521614/c1e1bd02-9eda-40c4-b9fd-ab3c60c817e6)

Comparing this with Employees who has not left the organisation

![image](https://github.com/kaushiknd/Employee-Training-Effectiveness/assets/115521614/81f96387-a45b-4ca4-af40-336b28e94093)

There is a noticeable positive correlation between the number of training hours and performance rating. Employees who receive more training tend to have higher performance ratings. This suggests that investing in employee training can lead to improved performance.

6.	Comparing Promotions with performance rating

 ![image](https://github.com/kaushiknd/Employee-Training-Effectiveness/assets/115521614/60f58e59-eb36-4617-ab09-4f679c80abc2)

Comparing this with Employees who has not left the organisation

 ![image](https://github.com/kaushiknd/Employee-Training-Effectiveness/assets/115521614/24a460e0-feb5-41f4-8fac-29cffb0b4d6c)

The presence of a promotion seems to have a positive impact on performance ratings. Employees who have been promoted have higher average performance ratings compared to those who haven't been promoted.

7.	Comparing Satisfaction Score with performance rating

 ![image](https://github.com/kaushiknd/Employee-Training-Effectiveness/assets/115521614/6b0a4bf5-44b5-4238-9b67-f515c8fc2769)

Comparing this with Employees who has not left the organisation

 ![image](https://github.com/kaushiknd/Employee-Training-Effectiveness/assets/115521614/ea91d0af-69c4-460c-8e7e-40831aa10ead)

A positive relationship is observed between employee satisfaction scores and performance ratings. Higher satisfaction scores are associated with higher performance ratings. It is essential for the organization to focus on employee satisfaction to improve overall performance.

## Recommendations:
1.	The organization should continue to focus on providing training and development opportunities to employees. This investment in skill enhancement is positively associated with improved performance.
2.	The organization should maintain its promotion strategy, as it appears to be linked to higher performance. However, it's important to ensure promotions are fair and based on merit.
3.	To further enhance employee performance, the organization should consider conducting regular employee satisfaction surveys to identify areas for improvement and act on employee feedback.
4.	Since age and gender do not seem to be correlated with performance ratings, the organization should maintain its commitment to diversity and equal opportunities in the workplace.
5.	To attract and retain high-performing employees, it may be beneficial to review compensation and benefits packages, especially in the 60K - 70K salary bracket.

This analysis provides a foundation for making data-driven decisions to enhance employee skills and performance within the organization. It's essential to continuously collect and analyse data to adapt and improve HR strategies over time.




