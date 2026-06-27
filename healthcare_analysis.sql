create database healthcare;

use healthcare;

select * from healthcare_cleaned;

alter table healthcare_cleaned
rename to healthcare;

select * from healthcare;


--   ---------------- --------------------- ------------------


-- Total number of patients
select count(*) from healthcare;

-- Total male and female patients
select * from healthcare;

select gender , 
count(*) as Gender_count from healthcare
group by gender;

-- Find average patient age.
select avg(age) as avg_age from healthcare;

-- Find youngest and oldest patient
select min(age) as youngest , max(age) as oldest from healthcare;


-- Count patients by blood type.

select `Blood Type` , count(*) as total_count
from healthcare
group by `Blood Type`
order by count(*) desc;

-- Count patients by admission type.

select `admission type` , count(*) as admission_count
from healthcare 
group by  `admission type` 
order by count(*) desc;

-- Count patients by medical condition.

select `medical condition` , count(*)
from healthcare
group by `medical condition`
order by count(*) desc;

-- Most insurance provider count 

select `insurance provider` , count(*)
from healthcare 
group by `insurance provider`
order by count(*) desc;




-- Find top 10 hospitals with highest patient count.

select hospital , count(*) as top_10_hospitals
from healthcare
group by hospital
order by count(*) desc
limit 10;


-- Find top 5 doctors handling the most patients.

select doctor ,count(*) as patients_count
from healthcare
group by doctor
order by count(*)
limit 5 ;


-- Calculate average billing amount by insurance provider.

select `insurance provider` , avg(`billing amount`) as avg_amount
from healthcare 
group by `insurance provider`;



-- Calculate average billing amount by disease.

select * from  healthcare;

select `Medical condition` , avg(`billing amount`) as avg_amount
from healthcare 
group by `Medical condition`;


-- Find highest billing amount.
select max(`billing amount`)  as max_billing_amount from healthcare;

-- Find lowest billing amount.
select min(`billing amount`)  as min_billing_amount from healthcare;


-- Display top 10 most expensive patient records.
select * from healthcare 
order by `billing amount` desc
limit 10;
 
 
--  Q16 Average hospital stay duration

select * from healthcare;

select 
round(
avg(
datediff(
`discharge date`,`Date of Admission`)),2) as avg_stay
from healthcare;






-- Q17 Longest hospital stay

select 
max(
datediff(
`discharge date`,`Date of Admission`)
)
from healthcare;


-- Q18 Shortest hospital stay
select 
min(
datediff(
`discharge date`,`Date of Admission`)
)
from healthcare;

-- Q19 Admissions by year
SELECT
YEAR(`Date of Admission`) AS admission_year,
COUNT(*) AS total_admissions									-- -- -- 	
FROM healthcare
GROUP BY admission_year
ORDER BY admission_year;

-- Q20 Admissions by month


select 
month(`Date of Admission`) AS admission_month,
count(*) as total_admission
from healthcare											-- -- -- 
group by admission_month
order by admission_month desc;

-- Q21  Month with highest admissions
select 
month(`Date of Admission`) AS admission_month,
count(*) as total_admission
from healthcare  							-- -- -- 
group by admission_month
order by total_admission desc
limit 1;


-- Disease generating highest revenue

select `medical condition` , sum(`billing amount`) as revenue
from healthcare
group by `medical condition`
order by sum(`billing amount`) desc
limit 1;


-- Q23 Hospital generating highest revenue

select hospital , sum(`billing amount`) as revenue
from healthcare
group by hospital
order by sum(`billing amount`) desc
limit 1;





-- Q24 Insurance provider generating highest revenue
select `insurance provider` , sum(`billing amount`) as revenue
from healthcare
group by `insurance provider`
order by sum(`billing amount`) desc
limit 1;


-- Q25 Blood group generating highest revenue

select `Blood type` , sum(`billing amount`) as revenue
from healthcare
group by `blood type`
order by sum(`billing amount`) desc
limit 1;


select * from healthcare;
 
 -- 26 -- Which Admission Type Generates the Highest Revenue?
 
 select `admission type` , sum(`billing amount`) as revenue
 from healthcare
 group by `admission type`
 order by revenue desc
 limit 1;
 
 
 -- Average Age by Medical Condition
 
 select `Medical condition` , avg(age) as avg_age
 from healthcare 
 group by  `Medical condition` ;
 
 -- Gender Distribution for Each Disease
 
 select `Medical condition` , Gender , count(*) as patient_count 
 from healthcare 
 group by `Medical condition` , Gender ;
 
 -- Most Common Disease Among Patients Above 60
 
 select `Medical Condition` ,  count(*) as patient_count 
 from healthcare 
 where age > 60
 group by `Medical Condition` ;
 
 
 -- Most Common Disease Among Patients Below 30
 
 select `Medical Condition`,  count(*) as patient_count 
 from healthcare 
 where age < 30
 group by `Medical Condition` ;
 
 -- Most Frequently Prescribed Medication
 

 select medication , count(*) as Total_Prescriptions
 from healthcare
 group by medication;
 
 
 -- Medication Usage by Disease
 
 select `Medical Condition`  ,  Medication   , Count(*) as count 
 from healthcare 
 group by `Medical Condition`  ,  Medication ; 
 
 
 -- Disease-wise Average Billing Amount
 
 select `Medical Condition` , avg(`billing amount`) as avg_bill
 from healthcare
 group by `Medical Condition`;
 
 
 -- Top 5 Doctors by Revenue
 
 select doctor , sum(`billing amount`) as revenue
 from healthcare 
 group by doctor 
 order by revenue desc 
 limit 5;

-- Top 10 Hospitals by Average Billing Amount


select hospital , avg(`billing amount`) avg_bill
from healthcare 
group by hospital 
order by avg_bill desc 
limit 10;

-- Create Age Groups Using CASE
select
CASE
WHEN Age BETWEEN 0 AND 18 THEN '0-18'
WHEN Age BETWEEN 19 AND 35 THEN '19-35'
WHEN Age BETWEEN 36 AND 50 THEN '36-50'
WHEN Age BETWEEN 51 AND 65 THEN '51-65'
ELSE '65+'
END AS Age_Group,
COUNT(*) AS Patient_Count
FROM healthcare
GROUP BY Age_Group;
    





-- Which Age Group Generates Highest Revenue?

select
CASE
WHEN Age BETWEEN 0 AND 18 THEN '0-18'
WHEN Age BETWEEN 19 AND 35 THEN '19-35'
WHEN Age BETWEEN 36 AND 50 THEN '36-50'
WHEN Age BETWEEN 51 AND 65 THEN '51-65'
ELSE '65+'
end as age_group , 
sum(`billing amount`) as revenue 
from healthcare 
group by age_group 
order by revenue desc 
limit 1;

-- Average Stay Duration by Disease


SELECT
`Medical Condition`,
ROUND(
AVG(
DATEDIFF(`Discharge Date`,`Date of Admission`)
),2
) AS avg_stay
FROM healthcare
GROUP BY `Medical Condition`;


-- -- Disease with Longest Average Stay


SELECT
`Medical Condition`,
ROUND(
AVG(
DATEDIFF(`Discharge Date`,`Date of Admission`)
),2
) AS avg_stay
FROM healthcare
GROUP BY `Medical Condition`
ORDER BY avg_stay DESC
LIMIT 1;


-- Insurance Provider with Highest Average Billing

select `insurance provider`, avg(`billing amount`)
from healthcare
group by `insurance provider`
order by avg(`billing amount`) desc
limit 1;








