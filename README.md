# Software License Utilization & Optimization Analysis

## Project Overview

This project analyzes software license usage across public schools to identify over-purchasing, underutilized licenses, and inactive assigned users. Using SQL for data cleaning and analysis and Tableau for visualization, the project surfaces actionable insights to improve resource allocation and reduce wasted spend.

- **Tools:** SQL (MySQL), Tableau, Excel
- **Domain:** Education

## Business Problem

Organizations often purchase more software licenses than are actively used due to limited visibility into adoption. This project evaluates whether assigned and purchased licenses are being effectively utilized and identifies opportunities to reclaim licenses, improve adoption, and optimize software spending at the school level.

## Key Questions Answered

<details>
  <summary>Show analysis & answers</summary>

  **Q1. Are we purchasing more licenses than we actually need?**
  A1. By aggregating licenses purchased and licenses used across all schools and software, I found that a meaningful portion of purchased licenses were not actively used. This indicates systemic over-purchasing rather than isolated cases. Weighted utilization rates showed that overall usage lagged behind capacity, suggesting opportunities to reduce license volumes without impacting users.

  **Q2. Which licenses are underutilized and should be reclaimed?**
  A2. I identified underutilized licenses by calculating utilization rates (licenses used ÷ licenses purchased) and quantifying reclaimable licenses where usage fell below defined thresholds. Several software tools showed consistently low utilization, with a significant number of licenses remaining unused. These licenses represent immediate candidates for reclamation and cost optimization.

  **Q3. Which schools have the lowest license utilization rates?**
  A3. License utilization was aggregated at the school level to identify disparities in adoption. Schools were ranked using weighted utilization rates to avoid skew from small license counts. This analysis revealed a subset of schools with consistently low utilization, indicating potential gaps in training, adoption, or over-allocation of licenses.

  **Q4. Are there users assigned licenses who never use them?**
  A4. By comparing licenses assigned to monthly active users, I identified inactive assigned users—cases where access was granted but no usage occurred during the measured period. Several software tools showed a substantial gap between assigned licenses and active users, highlighting opportunities to revoke or reassign licenses and improve access governance.

  **Q5. How does license usage trend over time?**
  A5. Monthly activity data was analyzed to assess usage trends over time. Aggregated trends revealed that some software tools showed stable or increasing adoption, while others experienced flat or declining usage. These trends help distinguish tools that are gaining value from those that may no longer justify their current license counts.

</details>

## Data Sources

Due to the scarcity of comprehensive public school operational data on Kaggle, this project employs a synthetically generated dataset that realistically simulates public school licensing, staffing, and student metrics. The primary objective of this project is to showcase data modeling, SQL analysis, and data visualization techniques.
