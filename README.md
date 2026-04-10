# K-12 Software License Utilization & Optimization

**Tools:** SQL (MySQL Workbench) · Tableau · Excel  
**Domain:** K-12 Education | Public Sector  
**Data:** Synthetic dataset modeled after real school district licensing structures

---

## The Problem

School districts spend millions on software licenses with little visibility into who's actually using them. Without usage data, procurement teams over-buy, licenses go unassigned, and money gets left on the table every renewal cycle.

This project answers one core question: **Are we getting what we're paying for?**

---

## Key Findings

- A significant portion of purchased licenses across all schools went completely unused
- Several software tools had inactive assigned users — access granted, but zero activity recorded
- A subset of schools showed consistently low utilization, signaling adoption or allocation gaps
- Usage trends revealed which tools are growing in value vs. declining — critical intel for renewal decisions

---

## Questions Answered

| # | Question | Approach |
|---|----------|----------|
| 1 | Are we buying more licenses than we need? | Aggregated purchased vs. active licenses; calculated weighted utilization rates |
| 2 | Which licenses should be reclaimed? | Flagged tools below utilization threshold; quantified reclaimable license counts |
| 3 | Which schools underutilize the most? | Ranked schools by weighted utilization rate to avoid small-count skew |
| 4 | Are there users assigned but never logging in? | Compared assigned licenses to monthly active users per tool |
| 5 | How does usage trend over time? | Analyzed month-over-month activity to identify growing vs. declining tools |

---

## Workflow

**1. Data Cleaning & Validation (SQL)**  
Handled missing usage values, corrected malformed records, and validated numeric fields for accurate aggregation.

**2. Data Modeling (SQL)**  
Joined license allocation data with monthly activity logs using school and software identifiers.

**3. Metric Development (SQL)**  
Built utilization rates, reclaimable license counts, inactive user flags, and estimated cost savings per tool.

**4. Visualization & Storytelling (Tableau)**  
Dashboards surface low-utilization schools, underperforming software, inactive user patterns, and adoption trends.

---

## Dashboards

> 📊 [View on Tableau Public](https://public.tableau.com/views/K-12LicenseUtilizationAnalysis/K-12LicenseUtilizationDashboard?:language=en-US&:sid=&:redirect=auth&:display_count=n&:origin=viz_share_link)

---

## About the Data

This project uses a synthetically generated dataset designed to mirror real K-12 licensing structures. The goal was to demonstrate end-to-end analytical workflow — not to analyze live district data. All schools, software names, and usage figures are simulated.
