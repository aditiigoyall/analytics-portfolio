CREATE DATABASE AudioResearchDB;
USE AudioResearchDB;
SELECT * FROM audio_study_data;

SELECT 
    course_category,
    AVG(APS_score) AS avg_productivity,
    COUNT(*) AS sample_size
FROM audio_study_data
GROUP BY course_category
ORDER BY avg_productivity DESC;
-----------------------------------------------

SELECT 
    course_category,
    AVG(APS_score) AS avg_APS,
    STDEV(APS_score) AS sd_APS,
    COUNT(*) AS n
FROM audio_study_data
GROUP BY course_category;
-----------------------------------------------


SELECT
    course_category,
    CASE 
        WHEN duration_use_hrs = '0 - 1' THEN 'Low / No Audio'
        ELSE 'Audio Users'
    END AS audio_group,
    AVG(APS_score) AS avg_APS,
    COUNT(*) AS n
FROM audio_study_data
GROUP BY 
    course_category,
    CASE 
        WHEN duration_use_hrs = '0 - 1' THEN 'Low / No Audio'
        ELSE 'Audio Users'
    END;
-----------------------------------------------------------------


