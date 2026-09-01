# HR Data Analytics Dashboard


**Executive Overview**

A single HR attrition dataset, modeled and visualized three ways — Excel, Power BI, and Tableau — with every KPI and breakdown independently verified against raw SQL output before publishing.

`SQL` `Excel (PivotTables)` `Power BI` `Tableau`

---

## Overview

This project takes one employee dataset and asks the same question three different ways a workplace might actually need it answered: a quick, filterable spreadsheet for an HR generalist, an interactive Power BI report for leadership, and a shareable Tableau dashboard for wider distribution. All three pull from the same underlying data and are built to reconcile to the same numbers — which is also what the SQL testing layer exists to prove.

## The question

**The business problem:** an HR team wants to understand where attrition is concentrated — by department, job role, education, age, and gender — and track headcount and attrition rate as ongoing KPIs, without waiting on a analyst to pull a one-off report every time the question comes up.

**The data:** an employee-level HR dataset (1,470 employees, 237 of whom left the company) covering age, gender, marital status, department, job role, education field, job satisfaction, and attrition status.

## Approach

1. **Establish ground truth in SQL.** Wrote the core KPI and breakdown logic (employee count, attrition count, attrition rate, active employees, average age, and eight grouped breakdowns) as plain SQL queries against the raw table — the standard every dashboard would be checked against.
2. **Build three parallel dashboards.** Modeled the same KPIs and breakdowns in Excel (PivotTables with slicers), Power BI, and Tableau, each built independently in its native tool rather than copied/pasted, to demonstrate the same analysis translates across platforms.
3. **QA every number against SQL.** For each of the three dashboards, ran the identical set of 11 test cases — one per KPI/breakdown — comparing the dashboard's displayed value against the SQL query's output.
4. **Reconcile and document.** Logged every test as Pass/Fail with a QA remark, so the validation record travels with the dashboards rather than living only in memory.

## QA & validation

Each dashboard (Excel, Power BI, Tableau) was tested against the same 11-query SQL suite covering every KPI and breakdown in the report:

| # | Check | Result |
|---|---|---|
| 1 | Employee Count | ✅ Pass — all 3 tools |
| 2 | Attrition Count | ✅ Pass — all 3 tools |
| 3 | Attrition Rate | ✅ Pass — all 3 tools |
| 4 | Active Employees | ✅ Pass — all 3 tools |
| 5 | Average Age | ✅ Pass — all 3 tools |
| 6 | Attrition by Gender | ✅ Pass — all 3 tools |
| 7 | Attrition by Department | ✅ Pass — all 3 tools |
| 8 | Employees by Age Group | ✅ Pass — all 3 tools |
| 9 | Attrition by Education Field | ✅ Pass — all 3 tools |
| 10 | Attrition Rate by Gender × Age Band | ✅ Pass — all 3 tools |
| 11 | Job Satisfaction Rating | ✅ Pass — all 3 tools |

**33/33 tests passed** across the three platforms — every dashboard reconciles exactly to the SQL source of truth. Full query text and per-tool results are in the individual QA documents (`SQLTestingDocument_Excel.docx`, `SQLTestingDocument_Power_BI.docx`, `SQLTestingDocument_Tableau.docx`).

## Key findings

- **Attrition sits at 16.1%** — 237 of 1,470 employees, leaving 1,233 active headcount.
- **R&D carries the majority of attrition** — 56.1% of all departures come from R&D, versus 38.8% from Sales and just 5.1% from HR.
- **Early-career employees leave the most:** the 25–34 age band accounts for 112 of the 237 departures (47%) — more than double the next-highest band (35–44, at 51).
- **Laboratory Technician and Sales Executive are the highest-attrition roles**, at 62 and 57 departures respectively — together over half of all attrition.
- **Attrition skews toward Bachelor's-level education:** 99 of 237 departures (42%) hold a Bachelor's degree, the single largest education group among leavers.
- **Average job satisfaction sits at 2.6 out of 4** company-wide, a useful baseline for tracking whether future engagement initiatives move the number.

## Repository contents

| File | Description |
|---|---|
| `HR_Dashboard.xlsx` | Excel workbook — PivotTables, slicers, and KPI sheet |
| `HR_Dashboard.pbix` | Power BI report |
| `HR_Dashboard.twb` | Tableau workbook |
| `SQLTesting_Dashboards.sql` | Source-of-truth SQL queries for every KPI and breakdown |
| `SQLTestingDocument_Excel.docx` | QA test log — Excel dashboard |
| `SQLTestingDocument_Power_BI.docx` | QA test log — Power BI dashboard |
| `SQLTestingDocument_Tableau.docx` | QA test log — Tableau dashboard |

## Tools

Excel (PivotTables, Slicers) · Power BI · Tableau Desktop · SQL

---
