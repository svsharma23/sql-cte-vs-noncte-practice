# 📊 SQL CTE vs Non-CTE — 10 Practice Scenarios

This project compares Common Table Expressions (CTEs) with traditional subquery-based approaches using 10 real-world SQL questions.

It demonstrates where CTEs improve readability and structure — and where a simple query is good enough without them.

---

## 🗂️ Tables Used

- **employees**
- **departments**

Includes realistic fields like:
- `salary`, `join_date`, `department_id`, and some `NULL` values

---

## ✅ Topics Covered

- Filtering and conditions  
- Aggregations: `AVG`, `MAX`, `COUNT`  
- `JOIN` + `GROUP BY`  
- Filters on aggregated data  
- `ORDER BY`, `LIMIT`  
- Real-world query breakdowns  
- "Most recent record per group"

---

## 🔟 Practice Questions

| Q# | Problem Statement |
|----|-------------------|
| 1  | Filter employees with non-null salary |
| 2  | Employees with salary above average |
| 3  | Employee names with their department names |
| 4  | Count of employees per department |
| 5  | Departments where average salary > ₹60,000 |
| 6  | Top 3 highest-paid employees |
| 7  | Max salary per department |
| 8  | Departments where max salary > ₹65,000 |
| 9  | Departments with avg salary > ₹55,000 and at least 2 employees |
| 10 | Most recently joined employee per department |

Each question is solved:
- 🔹 Using CTE  
- 🔸 Without CTE (subquery-based approach)

---

## 📁 File Included

- `cte-vs-noncte-10-questions.sql`

You can run this in any PostgreSQL-compatible SQL environment.

---

## 🚀 Author

> Built as part of my SQL learning journey to understand where CTEs add value and how to use them effectively in real-world scenarios.

