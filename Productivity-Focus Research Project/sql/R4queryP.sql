-- duration use x productivity
SELECT
    course_category,
    duration_use_hrs,
    AVG(APS_score) AS avg_APS,
    COUNT(*) AS n
FROM audio_study_data
GROUP BY course_category, duration_use_hrs
ORDER BY course_category, duration_use_hrs;

-- volume level x productivity
SELECT
    course_category,
    audio_volume_level,
    AVG(APS_score) AS avg_APS,
    COUNT(*) AS n
FROM audio_study_data
GROUP BY course_category, audio_volume_level
ORDER BY course_category, audio_volume_level;

-- noise cancellation x productivity
SELECT
    course_category,
    noise_cancellation,
    AVG(APS_score) AS avg_APS,
    COUNT(*) AS n
FROM audio_study_data
GROUP BY course_category, noise_cancellation
ORDER BY course_category;
