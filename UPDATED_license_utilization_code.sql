# Which licenses are underutilized and should be reclaimed?

WITH savings_cte AS (
  SELECT
    software_name,
    school_id,
    licenses_purchased,
    licenses_used,
    ROUND(licenses_used / licenses_purchased, 2) AS utilization_rate,
    (licenses_purchased - licenses_used) AS reclaimable_licenses,
    annual_cost,
    ROUND(
      (licenses_purchased - licenses_used) 
      * (annual_cost / licenses_purchased), 
      2
    ) AS potential_cost_savings
  FROM license_utilization
  WHERE (licenses_used / licenses_purchased) < 0.50
)
SELECT *,
       SUM(potential_cost_savings) OVER () AS total_potential_cost_savings
FROM savings_cte
ORDER BY potential_cost_savings DESC;

# Which Applcations has the lowest utilization rate?

SELECT
    software_name,
    ROUND(
        SUM(COALESCE(licenses_used, 0)) /
        NULLIF(SUM(COALESCE(licenses_purchased, 0)) * 1.0, 0),
        2
    ) AS utilization_rate,
    SUM(annual_cost) AS total_annual_cost
FROM license_utilization
GROUP BY software_name
ORDER BY utilization_rate DESC
LIMIT 6;

# Are we purchasing more licenses than we actually need?

WITH license_totals AS (
    SELECT
        software_name,
        SUM(licenses_purchased) AS total_license_purchases,
        SUM(licenses_used) AS total_used,
        SUM(licenses_purchased - licenses_used) AS total_reclaimable
    FROM license_utilization
    GROUP BY software_name
)
SELECT
    software_name,
    SUM(licenses_purchased) AS total_purchased,
    SUM(licenses_used) AS total_used,
    ROUND(SUM(licenses_used) / NULLIF(SUM(licenses_purchased) * 1.0, 0), 2) AS utilization_rate,
    SUM(licenses_purchased - licenses_used) AS total_reclaimable
FROM license_utilization
GROUP BY software_name
ORDER BY total_reclaimable DESC
LIMIT 6;

# Which schools have the highest license utilization rates?

SELECT
  school_id,

  SUM(COALESCE(licenses_purchased, 0)) AS total_purchased,
  SUM(COALESCE(licenses_used, 0)) AS total_used,

  ROUND(
    SUM(COALESCE(licenses_used, 0)) 
    / NULLIF(SUM(COALESCE(licenses_purchased, 0)), 0),
    2
  ) AS school_utilization_rate,

  SUM(
    COALESCE(licenses_purchased, 0)
    - COALESCE(licenses_used, 0)
  ) AS total_reclaimable_licenses

FROM license_utilization
GROUP BY school_id
ORDER BY school_utilization_rate DESC
LIMIT 5;


# Are there users assigned licenses who never use them?

SELECT
  lu.school_id,
  lu.software_name,

  lu.licenses_assigned,
  sam.monthly_active_users,

  (lu.licenses_assigned - sam.monthly_active_users)
    AS inactive_assigned_users,

  ROUND(
    (lu.licenses_assigned - sam.monthly_active_users)
    / NULLIF(lu.licenses_assigned, 0),
    2
  ) AS inactive_user_rate

FROM license_utilization lu
JOIN software_activity_monthly sam
  ON lu.school_id = sam.school_id
 AND lu.software_name = sam.software_name
WHERE lu.licenses_assigned > sam.monthly_active_users
ORDER BY inactive_assigned_users DESC;

# How does license usage trend over time?

SELECT
  activity_month,
  software_name,

  SUM(monthly_active_users) AS active_users

FROM software_activity_monthly

# Adding this to filter the software_name comlumn even more
WHERE software_name NOT IN (
  'Wake County',
  'Durham County'
)
GROUP BY activity_month, software_name
ORDER BY software_name, activity_month;

