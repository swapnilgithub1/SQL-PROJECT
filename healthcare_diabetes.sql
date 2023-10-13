-- Data Exploration --
SELECT * FROM healthcare.`healthcare-diabetes`;

-- Check for missing values in each column --
SELECT
    SUM(CASE WHEN Pregnancies IS NULL THEN 1 ELSE 0 END) AS missing_pregnancies,
    SUM(CASE WHEN Glucose IS NULL THEN 1 ELSE 0 END) AS missing_glucose,
    SUM(CASE WHEN BloodPressure IS NULL THEN 1 ELSE 0 END) AS missing_bp,
    SUM(CASE WHEN SkinThickness IS NULL THEN 1 ELSE 0 END) AS missing_skinthickness,
    SUM(CASE WHEN Insulin IS NULL THEN 1 ELSE 0 END) AS missing_insulin,
    SUM(CASE WHEN BMI IS NULL THEN 1 ELSE 0 END) AS missing_bmi
FROM healthcare.`healthcare-diabetes`;

-- Descriptive Statistics --
-- Calculate the average glucose level for diabetic and non-diabetic patients --
SELECT
    AVG(Glucose) AS avg_glucose_diabetic,
    AVG(CASE WHEN Outcome = 0 THEN Glucose ELSE NULL END) AS avg_glucose_non_diabetic
FROM healthcare.`healthcare-diabetes`;

-- Calculate statistics for numeric columns --
SELECT
    AVG(Glucose) AS avg_glucose,
    MIN(Glucose) AS min_glucose,
    MAX(Glucose) AS max_glucose,
    STDDEV(Glucose) AS std_dev_glucose
FROM healthcare.`healthcare-diabetes`;

-- Calculate the count of diabetic and non-diabetic patients --
SELECT
    SUM(CASE WHEN outcome = 1 THEN 1 ELSE 0 END) AS diabetic_count,
    SUM(CASE WHEN outcome = 0 THEN 1 ELSE 0 END) AS non_diabetic_count
FROM healthcare.`healthcare-diabetes`;

-- Data Distribution --
-- Count the number of patients in each age group --
SELECT
    CASE
        WHEN Age < 30 THEN 'Under 30'
        WHEN Age >= 30 AND Age < 40 THEN '30-39'
        WHEN Age >= 40 AND Age < 50 THEN '40-49'
        ELSE '50 and Above'
    END AS age_group,
    COUNT(*) AS patient_count
FROM healthcare.`healthcare-diabetes`
GROUP BY age_group;


