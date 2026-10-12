# 📚 Library Management System using SQL

## 📌 Project Overview

The **Library Management System** is a SQL-based project designed to manage library operations, including books, authors, publishers, library branches, borrowers, and book loans.

This project demonstrates how SQL can be used to organize relational data, retrieve information from multiple tables, and analyze library borrowing activities.

## 🎯 Project Objectives

- Organize and manage library-related information using SQL.
- Maintain records of books, authors, and publishers.
- Track book copies available across library branches.
- Manage borrowers and book loan records.
- Analyze borrowing activity using SQL queries.
- Practice relational database design and data retrieval.

## 🛠️ Tools & Technologies

- **SQL** – Database creation, data management, and querying.
- **Relational Database Concepts** – Tables, primary keys, and foreign keys.
- **SQL Analysis** – Joins, aggregate functions, grouping, and filtering.

## 🗂️ Database Tables

The project uses the following tables:

| Table Name | Description |
|---|---|
| `tbl_publisher` | Stores publisher information. |
| `tbl_book` | Stores book details. |
| `tbl_book_authors` | Stores book-author relationships. |
| `tbl_library_branch` | Stores library branch information. |
| `tbl_book_copies` | Tracks book copies at each branch. |
| `tbl_borrower` | Stores borrower information. |
| `tbl_book_loans` | Maintains book loan records. |

## 📊 SQL Concepts Used

- **CREATE DATABASE & CREATE TABLE** – Create the database structure.
- **Primary Keys & Foreign Keys** – Define relationships between tables.
- **JOIN** – Retrieve related information from multiple tables.
- **LEFT JOIN** – Include records even when matching records are unavailable.
- **COUNT()** – Count records and summarize data.
- **GROUP BY** – Group records for analysis.
- **HAVING** – Filter grouped results.
- **COALESCE()** – Handle NULL values in query results.

## 🔍 Project Analysis

The SQL queries explore library data and help answer questions such as:

- How can book and publisher information be retrieved together?
- How can book copies be examined across library branches?
- How can loan records be analyzed using joins and aggregate functions?
- How can grouped results be filtered to identify relevant records?

## 📸 Project Screenshots

### 1. Database Tables
![Database Tables](screenshots/database-tables.png)

### 2. SQL Query Results
![SQL Query Results](screenshots/sql-query-results.png)

### 3. Loan Analysis
![Loan Analysis](screenshots/loan-analysis.png)

## 💡 Key Learnings

- Understanding relational database design.
- Working with primary keys and foreign key relationships.
- Writing SQL queries across multiple related tables.
- Using aggregate functions to summarize data.
- Retrieving and interpreting information from a database.

## 🚀 How to Use This Project

1. Download or clone this repository.
2. Open the SQL script in a compatible database management tool.
3. Execute the script after checking that the database environment is compatible.
4. Review the created tables and query results.
5. Modify the queries to explore additional library-related questions.

## 👨‍💻 About the Author

I am a B.Tech graduate in **Artificial Intelligence and Data Science**, developing my skills in SQL, data analysis, and database management.

This project is part of my journey toward building practical data analytics projects and strengthening my technical portfolio.

## ⭐ Feedback

If you find this project useful, feel free to explore the SQL script and suggest improvements.

