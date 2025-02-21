# LUNG CANCER ANALYTICS

<img width="508" alt="00" src="https://github.com/user-attachments/assets/62c4386d-1209-4b9d-a423-b0dffc855fea" />


## Table Of Content
- [PROJECT OVERVIEW](#project-overview)
- [PROBLEM STATEMENT](#problem-statement)
- [OBJECTIVES](#objectives)
- [DATASET OVERVIEW](#dataset-overview)
- [INSIGHTS AND HIGHLIGHTS](#insights-and-highlights)
- [TOOLS](#tools)
- [DATA VISUALIZATION AND DASHBOARD](#data-visualization-and-dashboard)
- [SQL QUERIES](#sql-queries)

### PROJECT OVERVIEW

The Lung Cancer Prediction Dataset contains patient records that help in analysing risk factors associated with lung cancer. It includes demographic details such as age, gender, and country, along with medical and lifestyle factors like smoking habits, passive smoking exposure, and air pollution levels. The dataset also provides genetic risk levels, lung cancer diagnosis status, cancer stage, and treatment types, making it useful for predictive modelling and healthcare analytics. Additionally, it includes computed risk scores, survival years, and mortality rates, which can be used to assess the impact of different factors on patient outcomes. The dataset is valuable for identifying high-risk individuals, studying smoking-related lung cancer trends, and developing early detection strategies. Researchers and data analysts can leverage this dataset to build machine learning models for cancer prediction, survival analysis, and personalized treatment recommendations.

### PROBLEM STATEMENT

A major problem with Lung Cancer is its high mortality rate due to certain factors like late-stage diagnosis, Cigarettes consumption, exposure to Air pollution and others. It has resulted into a significant public health concern requiring improved methods and treatment strategies to increase survival rates.
The goal of the analysis is to help in identifying high-risk individuals, studying smoking-related lung cancer trends, and developing early detection strategies.

### OBJECTIVES

1. Analyze Lung Cancer trends, cause and impact
2. Create a Dashboard using any BI tool to visualize key metrics and insights
3. Provide actionable and data driven recommendation

### DATASET OVERVIEW
Dataset contains patient records that help in analysing risk factors associated with lung cancer.
- It contains 25 fields/columns-
ID, Country, Population_Size, Age, Gender, Smoker, Years_of_Smoking, Cigarettes_per_Day, Passive_Smoker, Family_History, Lung_Cancer_Diagnosis, Cancer_Stage, Survival_Years, Adenocarcinoma_Type, Air_Pollution_Exposure, Occupational_Exposure, Indoor_Pollution, Healthcare_Access, Early_Detection, Treatment_Type, Developed_or_Developing, Annual_Lung_Cancer_Deaths, Lung_Cancer_Prevalence_Rate, Mortality_Rate

- Total Records/Rows- 220,632

- Data cleaning/pre-processing- 
Extract a new column "Survival Rate" from the "Mortality Rate"
Extracted an "Age (Group)" column from "Age"
Ensure data consistency and standardization across all fields

### INSIGHTS AND HIGHLIGHTS

- A total of 8961 lung cancer cases was recorded
- Lung cancer cases was highest for Ethiopia at 409 accounting for 20.99% of total lung cancer cases, followed by Japan and Turkey
- Total lung cancer cases was higher for Male at 59.5% (5332) than female at 40.5% (3629)
- Patients within the Age group of 60-69 had the highest incident of lung cancer with 1424 diagnosed cases
- Stage 3 Lung Cancer Stage had the highest Early Detection Rate of 29.29% and was 6.78% higher than Stage 1, which had the lowest Early Detection Rate at 27.43%.
- ﻿None (No Cancer Stage) had the highest Survival Rate by Early Detection at 100 and was 300.19% higher than Stage 3, which had the lowest Survival Rate by Early Detection at 25.﻿
- Late diagnosis increased mortality rate with led to poor survival rate

### TOOLS
- SQL (Data Extraction & Exploratory Data Analysis)
- Power BI (Data Visualization & Dashboard)
- Microsoft Excel (Data Analysis)

### DATA VISUALIZATION AND DASHBOARD
<img width="509" alt="01" src="https://github.com/user-attachments/assets/e41f5214-008b-4dd5-b2ce-0dc21328ccda" />

<img width="508" alt="02" src="https://github.com/user-attachments/assets/4a5d2afe-3772-4f45-b181-beae445a5d0f" />

<img width="507" alt="03" src="https://github.com/user-attachments/assets/98a2e7f7-39e8-479f-9136-9709ec5b6f17" />


### SQL QUERIES
BASIC LEVEL
*1. Retrieve all records for individuals diagnosed with lung cancer.*

        SELECT * FROM lung_cancer_data
        WHERE Lung_Cancer_Diagnosis = "Yes";

*2. Count the number of smokers and non-smokers.*

        SELECT Smoker, COUNT(Smoker) AS COUNT_SMOKER FROM lung_cancer_data
        GROUP BY Smoker;

*3. List all unique cancer stages present in the dataset.*

        SELECT DISTINCT Cancer_Stage FROM lung_cancer_data
        WHERE Cancer_Stage != "None";

*4. Retrieve the average number of cigarettes smoked per day by smokers.*

        SELECT AVG(Cigarettes_per_Day) AS AVERAGE_CIGARETTES_SMOKER_PER_DAY FROM lung_cancer_data;

*5. Count the number of people exposed to high air pollution.*

        SELECT COUNT(Air_Pollution_Exposure) AS HIGH_AIR_POLLUTION FROM lung_cancer_data
        WHERE Air_Pollution_Exposure = "High";

*6. Find the top 5 countries with the highest lung cancer deaths.*

        SELECT Country, SUM(Annual_Lung_Cancer_Deaths) AS TOTAL_DEATH FROM lung_cancer_data
        GROUP BY Country
        ORDER BY TOTAL_DEATH DESC
        LIMIT 5;

*7. Count the number of people diagnosed with lung cancer by gender.*

        SELECT Gender, COUNT(Lung_Cancer_Diagnosis) AS COUNT_PEOPLE FROM lung_cancer_data
        WHERE Lung_Cancer_Diagnosis = "Yes"
        GROUP BY Gender;

*8. Retrieve records of individuals older than 60 who are diagnosed with lung cancer.*

        SELECT * FROM lung_cancer_data
        WHERE Age > 60 AND Lung_Cancer_Diagnosis = "Yes"
        ORDER BY AGE ASC;


**INTERMEDIATE LEVEL**

*1. Find the percentage of smokers who developed lung cancer.*

        SELECT 
        	(COUNT(CASE WHEN Smoker = "Yes" AND Lung_Cancer_Diagnosis = "Yes" THEN 1 END) 
            / COUNT(CASE WHEN Smoker = "Yes" THEN 1 END )) * 100 AS PERCENTAGE_SMOKERS_DEVELOPED_LUNG_CANCER
        FROM lung_cancer_data;

*2. Calculate the average survival years based on cancer stages.*

        SELECT Cancer_Stage, AVG(Survival_Years) AS AVERAGE_SURVIVAL_YEARS FROM lung_cancer_data
        GROUP BY Cancer_Stage; 

*3. Count the number of lung cancer patients based on passive smoking.*

        SELECT COUNT(Lung_Cancer_Diagnosis), Passive_Smoker from lung_cancer_data
        WHERE Lung_Cancer_Diagnosis = "Yes"
        GROUP BY Passive_Smoker;

*4. Find the country with the highest lung cancer prevalence rate.*

        SELECT Country, AVG(Lung_Cancer_Prevalence_Rate) AS HIGHEST_PREVALENCE_RATE FROM lung_cancer_data
        GROUP BY Country
        ORDER BY Country DESC
        LIMIT 1;

*5. Identify the smoking years' impact on lung cancer.*

        SELECT Years_of_Smoking, COUNT(*) AS NUMBER_OF_CASES FROM lung_cancer_data
        WHERE Smoker = "Yes"
        GROUP BY Years_of_Smoking
        ORDER BY Years_of_Smoking ASC;

*6. Determine the mortality rate for patients with and without early detection.*

        SELECT AVG(Mortality_Rate) AS MORTALITY_RATE, Early_Detection FROM lung_cancer_data
        GROUP BY Early_Detection;

*7. Group the lung cancer prevalence rate by developed vs. developing countries.*

        SELECT COUNT(Lung_Cancer_Prevalence_Rate) AS Lung_Cancer_Prevalence_Rate, Developed_or_Developing FROM lung_cancer_data
        GROUP BY Developed_or_Developing;


**ADVANCED LEVEL**

*1. Identify the correlation between lung cancer prevalence and air pollution levels.*

        SELECT SUM(Lung_Cancer_Prevalence_Rate) AS LUNG_CANCER_PREVALENCE, Air_Pollution_Exposure FROM lung_cancer_data
        GROUP BY Air_Pollution_Exposure;

*2. Find the average age of lung cancer patients for each country.*

        SELECT AVG(Age) AS AVERAGE_AGE, Country FROM lung_cancer_data
        WHERE Lung_Cancer_Diagnosis = "Yes"
        GROUP BY Country;

*3. Calculate the risk factor of lung cancer by smoker status, passive smoking, and family history.*

        SELECT Smoker, Passive_Smoker, Family_History, COUNT(*) AS Total_People, 
            SUM(CASE WHEN Lung_Cancer_Diagnosis = 'Yes' THEN 1 END) AS Total_Lung_Cancer_Cases,
            (SUM(CASE WHEN Lung_Cancer_Diagnosis = 'Yes' THEN 1 END) * 100.0 / COUNT(*)) AS Risk_Factor_Percentage
        FROM lung_cancer_data
        GROUP BY Smoker, Passive_Smoker, Family_History
        ORDER BY Risk_Factor_Percentage DESC;

*4. Rank countries based on their mortality rate.*

        SELECT Country, COUNT(Mortality_Rate) AS MORTALITY_RATE FROM lung_cancer_data
        GROUP BY Country
        ORDER BY MORTALITY_RATE DESC
        LIMIT 5;

*5. Determine if treatment type has a significant impact on survival years.*

        SELECT Treatment_Type, AVG(Survival_Years) AS TOTAL_SURVIVAL_YEARS FROM lung_cancer_data
        GROUP BY Treatment_Type;

*6. Compare lung cancer prevalence in men vs. women across countries.*

        SELECT COUNT(Lung_Cancer_Prevalence_Rate), Country, Gender FROM lung_cancer_data
        GROUP BY Country, Gender
        ORDER BY Gender DESC;

*7. Find how occupational exposure, smoking, and air pollution collectively impact lung cancer rates.*

        SELECT Occupational_Exposure, Smoker, Air_Pollution_Exposure, AVG(Lung_Cancer_Prevalence_Rate) AS LUNG_CANCER_RATE FROM lung_cancer_data
        GROUP BY Occupational_Exposure, Smoker, Air_Pollution_Exposure;

*8. Analyze the impact of early detection on survival years.*

        SELECT Early_Detection, AVG(Survival_Years) AS AVERAGE_SURVIVAL_YEARS FROM lung_cancer_data
        GROUP BY Early_Detection;



