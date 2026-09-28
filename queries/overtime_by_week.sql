-- Hours worked per employee per week, flagging anything over 40
SELECT
    employee_id,
    DATE_TRUNC('week', punch_in) AS week_start,
    ROUND(SUM(EXTRACT(EPOCH FROM (punch_out - punch_in)) / 3600)::numeric, 2) AS total_hours,
    SUM(EXTRACT(EPOCH FROM (punch_out - punch_in)) / 3600) > 40 AS over_40
FROM punch
WHERE punch_out IS NOT NULL
GROUP BY employee_id, DATE_TRUNC('week', punch_in)
ORDER BY week_start, employee_id;
