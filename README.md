# Olympic-Game-SQL-Analysis
Data cleaning, analysis and reporting for Olympic Datasets

## 1. Project Background
This project involves analyzing an Olympics database using SQL. The analysis is broken down into several stages, including exploratory data analysis, data cleaning, and generating comprehensive reports. The project showcases the power of SQL in handling large datasets, performing complex queries, and deriving actionable insights from the data.

## 2. Datasets
The project uses data from various tables related to the Olympics, including:
- `summer_games`: Contains records of athletes and events from the Summer Olympics.
- `winter_games`: Contains records of athletes and events from the Winter Olympics.
- `countries`: Information about countries participating in the Olympics.
- `athletes`: Details about the athletes, including their age, height, and weight.
- `country_stats`: Economic and demographic data for the countries.

## 3. SQL Files
The project consists of the following SQL files:
1. **[Exploratory Data Analysis (EDA)](https://github.com/Sophie-XL/Olympic-Game-SQL-Analysis/blob/c7ce6f0edb77a4c81acceb9050aaf02272ede57c/EDA.sql)**: Initial exploration of the dataset, focusing on key metrics such as the number of athletes per sport, the age of athletes, and the number of events.
2. **[Combining Tables & Filtering](https://github.com/Sophie-XL/Olympic-Game-SQL-Analysis/blob/c7ce6f0edb77a4c81acceb9050aaf02272ede57c/Combining%20Tables%20%26%20Filtering.sql)**: Advanced queries using JOIN, UNION, and CASE statements to combine data from multiple tables and apply filters.
3. **[Data Cleaning](https://github.com/Sophie-XL/Olympic-Game-SQL-Analysis/blob/c7ce6f0edb77a4c81acceb9050aaf02272ede57c/Data%20Cleaning.sql)**: Identifying data types, converting them as needed, and cleaning string data to ensure accuracy in the analysis.
4. **[Complex Calculations](https://github.com/Sophie-XL/Olympic-Game-SQL-Analysis/blob/c7ce6f0edb77a4c81acceb9050aaf02272ede57c/Complex%20Calculations.sql)**: Utilizes window functions and layered calculations to perform calculations across rows related to the current row, such as calculating GDP totals and percentages, and ranking athletes.
5. **[Olympic Reports](https://github.com/Sophie-XL/Olympic-Game-SQL-Analysis/blob/c7ce6f0edb77a4c81acceb9050aaf02272ede57c/Olympic%20Reports.sql)**: A collection of reports that apply SQL skills to generate insights, such as identifying the most decorated athletes, analyzing countries with high medal rates, and more.

## 4. Skills Used
- [x] **SQL Querying**: Writing efficient SQL queries to extract and manipulate data.
- [x] **Data Exploration**: Analyzing and understanding data patterns and distributions.
- [x] **Data Cleaning**: Ensuring data quality by fixing data type issues, cleaning messy strings, handling nulls, and removing duplication.
- [x] **Advanced SQL Techniques**: Implementing complex SQL operations like joins, subqueries, window functions, and aggregations.
- [x] **Report Generation**: Creating comprehensive reports to summarize and present key findings.
