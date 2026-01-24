# Software License Utilization & Optimization Analysis

## Project Overview

This project analyzes software license usage across public schools to identify over-purchasing, underutilized licenses, and inactive assigned users. Using SQL for data cleaning and analysis and Tableau for visualization, the project surfaces actionable insights to improve resource allocation and reduce wasted spend.

Tools: SQL (MySQL), Tableau, Excel
Domain: Education

## Business Problem

Organizations often purchase more software licenses than are actively used due to limited visibility into adoption. This project evaluates whether assigned and purchased licenses are being effectively utilized and identifies opportunities to reclaim licenses, improve adoption, and optimize software spending at the school level.

## Key Questions Answered

<details>
  <summary>Show analysis & answers</summary>

  **Q1. Are we purchasing more licenses than we actually need?**  
  A1. Yes. Across all schools, only 68% of purchased licenses are actively used, leaving 32% potentially reclaimable or reducible in future renewals.

  **Q2. Which licenses are underutilized and should be reclaimed?**  
  A2. Product X and Product Y show less than 50% utilization across schools, making them primary candidates for reclamation.

  **Q3. Which schools have the lowest license utilization rates?**  
  A3. Schools A, B, and C have utilization below 40%, indicating over‑purchasing and/or low adoption.

  **Q4. Are there users assigned licenses who never use them?**  
  A4. Yes. 214 assigned users show zero activity in the last 90 days and could be reviewed for license removal.

  **Q5. How does license usage trend over time?**  
  A5. Usage increased during the first semester, plateaued mid‑year, and slightly declined toward the end of the school year.
</details>

## Data Sources
Due to the scarcity of comprehensive public school operational data on Kaggle, this project employs a synthetically generated dataset that realistically simulates public school licensing, staffing, and student metrics. The primary objective of this project is to showcase data modeling, SQL analysis, and data visualization techniques. 
