# TV_Show_Analysis
SQL - анализ данных о ТВ шоу и их популярности

# 📺 TV Show Analysis Project

## Project Overview

This project provides an in-depth analysis of the popularity, genre trends, and success factors of television series and shows. The database is designed to efficiently store and structure a large volume of metadata related to shows, their ratings, producers, countries of origin, and languages.

## 🎯 Analytical Goals (SQL Queries)

The primary goal of the project is to use SQL analytical queries (found at the end of `project_analysis.sql`) to answer key questions regarding TV content production and demand:

1.  **Top Popularity:** Identify the **top 10 most popular** TV shows based on the `popularity` metric.
2.  **Genre Success:** Determine which **genres** achieve the highest **average user rating** (`vote_average`).
3.  **Longevity vs. Quality:** Analyze the relationship between a show's **number of seasons** and its **high rating** (average seasons for shows with `vote_average` > 7).
4.  **Global Production:** Identify the **Top 5 countries** that produce the most popular shows (by cumulative popularity).
5.  **Production Status:** Analyze the distribution of shows based on their current production status (e.g., In Production, Ended, Cancelled).

## 🛠️ Database Structure (Schema)

The database schema is normalized and consists of 17 tables, centered around the main **`shows`** entity. It includes key tables for metadata and numerous auxiliary/junction tables to manage many-to-many relationships (e.g., Genres, Networks, Production Companies).

### 💾 Contents of `project_analysis.sql`

The single file `project_analysis.sql` contains the complete logic necessary to deploy and analyze the project:

1.  **Schema (`CREATE TABLE`):** Commands to create all 17 tables with primary and foreign key constraints.
2.  **Optimization (`CREATE INDEX`):** Commands to create indexes on key columns (`name`, `popularity`, foreign keys) to ensure fast query performance.
3.  **Analytics (`SELECT`):** All structured SQL queries designed to fulfill the analytical goals listed above.

## 🔗 How to Reproduce and Run

To run the analysis:

1.  Execute the entire **`project_analysis.sql`** script on a MySQL server to create the database structure and optimization indices.
2.  Import the project data (CSV files) into the newly created tables.
3.  Run the **`SELECT`** queries included in the script to derive the analytical results.
