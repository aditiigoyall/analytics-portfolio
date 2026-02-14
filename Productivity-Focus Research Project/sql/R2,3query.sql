SELECT 
    course_category,
    AVG(ACS_score) AS avg_attentional_focus,
    COUNT(*) AS sample_size
FROM audio_study_data
GROUP BY course_category
ORDER BY avg_attentional_focus DESC;
-----------------------------------------------

SELECT 
    course_category,
    AVG(ACS_score) AS avg_ACS,
    STDEV(ACS_score) AS sd_ACS,
    COUNT(*) as n
FROM audio_study_data
GROUP BY course_category;
-----------------------------------------------

SELECT
    course_category,
    CASE 
        WHEN duration_use_hrs = '0 - 1' THEN 'Low / No Audio'
        ELSE 'Audio Users'
    END AS audio_group,
    AVG(ACS_score) AS avg_ACS,
    COUNT(*) AS n
FROM audio_study_data
GROUP BY 
    course_category,
    CASE 
        WHEN duration_use_hrs = '0 - 1' THEN 'Low / No Audio'
        ELSE 'Audio Users'
    END;