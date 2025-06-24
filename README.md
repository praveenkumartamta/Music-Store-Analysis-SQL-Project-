# Music-Store-Analysis-SQL-Project-
Sql-based data analysis project on Music store analysis
# 🎵 Music Store Analysis (SQL Project)

## 📌 Project Overview

This project showcases a complete **data analysis on a music store database** using **SQL**.  
It consists of multiple business questions that are answered using SQL queries to derive insights related to sales, customers, genres, and countries.

---

## 🗂️ Dataset Information

The data is assumed to be from a music store database and includes the following key tables:

-
  `employee`
- 'genre'
- 'media_type'
- playlist_track'
- `customer`
- `invoice`
- `invoice_line`
- `track`
- `album`
- `artist`
- `genre`

---

## 💡 Business Questions & SQL Insights

Below are the questions answered using SQL in the project:

### 🔹 Q1: Who is the senior most employee based on job title?
Find the highest level employee using `levels`.

---

### 🔹 Q2: Which countries have the most invoices?
Aggregates invoice counts per country to identify where the store is most active.
---

### 🔹 Q3: What are the top 3 highest invoice totals?
Lists the top 3 individual invoices with the highest total amounts.

### 🔹 Q4: Which city has the best customers (highest total revenue)?
Returns the city with the maximum total invoice amount — useful for promotion planning.

---

### 🔹 Q5: Who is the best customer (most money spent)?
Identifies the customer who spent the most across all invoices.

---

### 🔹 Q6: List all Rock music listeners (emails + names).
Finds customers who purchased Rock music, sorted alphabetically by email.

---

### 🔹 Q7: Top 10 Rock bands (most songs).
Identifies artists with the most Rock genre songs in the store.

---

### 🔹 Q8: Songs longer than average length.
Returns all tracks with length greater than the average duration.

---

### 🔹 Q9: How much each customer spent on the top artist?
Finds the highest-earning artist, then shows how much each customer spent on that artist.

---

### 🔹 Q10: Most popular music genre in each country.
Shows top-purchased genre per country using `ROW_NUMBER()` and partitions.

---

### 🔹 Q11: Top customer per country by total spending.
Finds the highest spending customer in each country using `ROW_NUMBER()` window function.

---

## 🧰 Tools Used

- **PostgreSQL / MySQL / SQLite** (any SQL engine can be used)
- **DB Browser**, **pgAdmin**, or **DBeaver** for execution
- Queries written in pure SQL

---
 ## Insights
---
* senior most employee based on job title - Madan Mohan Senior General Manager
* Most invoices countries - USA and CANADA
* Top 3 values of total invoice - 23.759999999999998, 19.8 and 19.8
* One city that has the highest sum of invoice totals - city = "Prague"	, invoise_total = 273.24000000000007
* The customer who has spent the most money - Name = R Madhav , Total spent = 144.54000000000002
* Track count of the 10 rock bands - 
--Name = "Led Zeppelin", "U2","Deep Purple","Iron Maiden","Pearl Jam","Van Halen","Queen","The Rolling Stones","Creedence Clearwater Revival","Kiss"
--Number of songs = 114,112,92,81,54,52,45,41,40,35
* How much money has the highest customer spent on the artist - Customer name = Hugh O'Reilly  , Amount_spent = 27.719999999999985                                      "


