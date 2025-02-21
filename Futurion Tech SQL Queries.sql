CREATE DATABASE lung_cancer;

USE lung_cancer;


-- BASIC LEVEL QUERY
-- 1. Retrieve all records for individuals diagnosed with lung cancer.
SELECT * FROM lung_cancer_data
WHERE Lung_Cancer_Diagnosis = "Yes";

-- 2. Count the number of smokers and non-smokers.
SELECT Smoker, COUNT(Smoker) AS COUNT_SMOKER FROM lung_cancer_data
GROUP BY Smoker;

-- 3. List all unique cancer stages present in the dataset.
SELECT DISTINCT Cancer_Stage FROM lung_cancer_data
WHERE Cancer_Stage != "None";

-- 4. Retrieve the average number of cigarettes smoked per day by smokers.
SELECT AVG(Cigarettes_per_Day) AS AVERAGE_CIGARETTES_SMOKER_PER_DAY FROM lung_cancer_data;

-- 5. Count the number of people exposed to high air pollution.
SELECT COUNT(Air_Pollution_Exposure) AS HIGH_AIR_POLLUTION FROM lung_cancer_data
WHERE Air_Pollution_Exposure = "High";

-- 6. Find the top 5 countries with the highest lung cancer deaths.
SELECT Country, SUM(Annual_Lung_Cancer_Deaths) AS TOTAL_DEATH FROM lung_cancer_data
GROUP BY Country
ORDER BY TOTAL_DEATH DESC
LIMIT 5;

-- 7. Count the number of people diagnosed with lung cancer by gender.
SELECT Gender, COUNT(Lung_Cancer_Diagnosis) AS COUNT_PEOPLE FROM lung_cancer_data
WHERE Lung_Cancer_Diagnosis = "Yes"
GROUP BY Gender;

-- 8. Retrieve records of individuals older than 60 who are diagnosed with lung cancer.
SELECT * FROM lung_cancer_data
WHERE Age > 60 AND Lung_Cancer_Diagnosis = "Yes"
ORDER BY AGE ASC;


-- INTERMEDIATE LEVEL
-- 1. Find the percentage of smokers who developed lung cancer.
SELECT 
	 (COUNT(CASE WHEN Smoker = "Yes" AND Lung_Cancer_Diagnosis = "Yes" THEN 1 END) 
    / COUNT(CASE WHEN Smoker = "Yes" THEN 1 END )) * 100 AS PERCENTAGE_SMOKERS_DEVELOPED_LUNG_CANCER
FROM lung_cancer_data;

-- 2. Calculate the average survival years based on cancer stages.
SELECT Cancer_Stage, AVG(Survival_Years) AS AVERAGE_SURVIVAL_YEARS FROM lung_cancer_data
GROUP BY Cancer_Stage; 

-- 3. Count the number of lung cancer patients based on passive smoking.
SELECT Passive_Smoker, COUNT(Lung_Cancer_Diagnosis) from lung_cancer_data
WHERE Lung_Cancer_Diagnosis = "Yes"
GROUP BY Passive_Smoker;

-- 4. Find the country with the highest lung cancer prevalence rate.
SELECT Country, AVG(Lung_Cancer_Prevalence_Rate) AS HIGHEST_PREVALENCE_RATE FROM lung_cancer_data
GROUP BY Country
ORDER BY Country DESC
LIMIT 1;

-- 5. Identify the smoking years' impact on lung cancer.
SELECT Years_of_Smoking, COUNT(*) AS NUMBER_OF_CASES FROM lung_cancer_data
WHERE Smoker = "Yes"
GROUP BY Years_of_Smoking
ORDER BY Years_of_Smoking ASC;

-- 6. Determine the mortality rate for patients with and without early detection.
SELECT AVG(Mortality_Rate) AS MORTALITY_RATE, Early_Detection FROM lung_cancer_data
GROUP BY Early_Detection;

-- 7. Group the lung cancer prevalence rate by developed vs. developing countries.
SELECT COUNT(Lung_Cancer_Prevalence_Rate) AS Lung_Cancer_Prevalence_Rate, Developed_or_Developing FROM lung_cancer_data
GROUP BY Developed_or_Developing;


-- Advanced Level
-- 1. Identify the correlation between lung cancer prevalence and air pollution levels.
SELECT SUM(Lung_Cancer_Prevalence_Rate) AS LUNG_CANCER_PREVALENCE, Air_Pollution_Exposure FROM lung_cancer_data
GROUP BY Air_Pollution_Exposure;

-- 2. Find the average age of lung cancer patients for each country.
SELECT AVG(Age) AS AVERAGE_AGE, Country FROM lung_cancer_data
WHERE Lung_Cancer_Diagnosis = "Yes"
GROUP BY Country;

-- 3. Calculate the risk factor of lung cancer by smoker status, passive smoking, and family history.
SELECT Smoker, Passive_Smoker, Family_History, COUNT(*) AS Total_People, 
    SUM(CASE WHEN Lung_Cancer_Diagnosis = 'Yes' THEN 1 END) AS Total_Lung_Cancer_Cases,
    (SUM(CASE WHEN Lung_Cancer_Diagnosis = 'Yes' THEN 1 END) * 100.0 / COUNT(*)) AS Risk_Factor_Percentage
FROM lung_cancer_data
GROUP BY Smoker, Passive_Smoker, Family_History
ORDER BY Risk_Factor_Percentage DESC;

-- 4. Rank countries based on their mortality rate.
SELECT Country, COUNT(Mortality_Rate) AS MORTALITY_RATE FROM lung_cancer_data
GROUP BY Country
ORDER BY MORTALITY_RATE DESC
LIMIT 5;

-- 5. Determine if treatment type has a significant impact on survival years.
SELECT Treatment_Type, AVG(Survival_Years) AS TOTAL_SURVIVAL_YEARS FROM lung_cancer_data
GROUP BY Treatment_Type;

-- 6. Compare lung cancer prevalence in men vs. women across countries.
SELECT COUNT(Lung_Cancer_Prevalence_Rate), Country, Gender FROM lung_cancer_data
GROUP BY Country, Gender
ORDER BY Gender DESC;

-- 7. Find how occupational exposure, smoking, and air pollution collectively impact lung cancer rates.
SELECT Occupational_Exposure, Smoker, Air_Pollution_Exposure, AVG(Lung_Cancer_Prevalence_Rate) AS LUNG_CANCER_RATE FROM lung_cancer_data
GROUP BY Occupational_Exposure, Smoker, Air_Pollution_Exposure;

-- 8. Analyze the impact of early detection on survival years.
SELECT Early_Detection, AVG(Survival_Years) AS AVERAGE_SURVIVAL_YEARS FROM lung_cancer_data
GROUP BY Early_Detection;
