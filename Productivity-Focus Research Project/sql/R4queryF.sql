-- duration use x attentional focus
SELECT
    course_category,
    duration_use_hrs,
    AVG(ACS_score) AS avg_ACS,
    COUNT(*) AS n
FROM audio_study_data
GROUP BY course_category, duration_use_hrs
ORDER BY course_category, duration_use_hrs;

-- volume x af
SELECT
    course_category,
    audio_volume_level,
    ROUND(AVG(ACS_score),2) AS avg_ACS,
    COUNT(*) AS n
FROM audio_study_data
GROUP BY course_category, audio_volume_level
ORDER BY course_category, audio_volume_level;

-- noise cancellation x af
SELECT
    course_category,
    noise_cancellation,
    ROUND(AVG(ACS_score),2) AS avg_ACS,
    COUNT(*) AS n
FROM audio_study_data
GROUP BY course_category, noise_cancellation
ORDER BY course_category;

