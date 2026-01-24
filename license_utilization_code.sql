# Which licenses are underutilized and should be reclaimed?
SELECT
  software_name,
  school_id,
  licenses_purchased,
  licenses_used,
  ROUND(licenses_used / licenses_purchased, 2) AS utilization_rate,
  (licenses_purchased - licenses_used) AS reclaimable_licenses, annual_cost,
  ROUND(
    (licenses_purchased - licenses_used) 
    * (annual_cost / licenses_purchased), 
    2
  ) AS potential_cost_savings
FROM license_utilization
WHERE (licenses_used / licenses_purchased) < 0.50
ORDER BY potential_cost_savings DESC;

# Are we purchasing more licenses than we actually need?

SELECT
  SUM(licenses_purchased) AS total_purchased,
  SUM(licenses_used) AS total_used,
  SUM(licenses_purchased - licenses_used) AS total_reclaimable
FROM license_utilization;

# Which schools have the lowest license utilization rates?

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
ORDER BY school_utilization_rate ASC;


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

