SELECT
    course_category,
    ROUND(
        AVG(CASE WHEN duration_use_hrs <> '0 - 1' THEN APS_score END) -
        AVG(CASE WHEN duration_use_hrs = '0 - 1' THEN APS_score END),
        2
    ) AS aps_audio_impact
FROM audio_study_data
GROUP BY course_category
ORDER BY aps_audio_impact DESC;
----------------------------------------------------------------------------
SELECT
    course_category,
    ROUND(
        AVG(CASE WHEN duration_use_hrs <> '0 - 1' THEN ACS_score END) -
        AVG(CASE WHEN duration_use_hrs = '0 - 1' THEN ACS_score END),
        2
    ) AS acs_audio_impact
FROM audio_study_data
GROUP BY course_category
ORDER BY acs_audio_impact DESC;

