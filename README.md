# Netflix-Data-Analysis-with-SQL
[NETFLIX](https://github.com/Vaishnavi888-sys/Netflix-Data-Analysis-with-SQL/blob/main/logo.png)
Welcome to my Netflix data analysis project! This repository contains powerful SQL queries that explore, clean, and extract insights from the Netflix dataset. The dataset includes movies and TV shows available on Netflix, along with metadata like genre, cast, country, release year, and more.
## 📁 Dataset Info

- Source: `netflix_titles.csv`
- Size: ~8800+ records
- Fields: `show_id`, `type`, `title`, `director`, `casts`, `country`, `date_added`, `release_year`, `rating`, `duration`, `listed_in`, `description`


## 🔧 Tools Used

- **PostgreSQL 17**
- **pgAdmin** for database management
- SQL functions like: `UNNEST`, `STRING_TO_ARRAY`, `TRIM`, `ILIKE`, `GROUP BY`, `ORDER BY`, and window functions
- Data cleaning techniques for handling nulls, text splits, and transformations
## 🧠 Key SQL Queries & Insights

| Query | Description |
|-------|-------------|
| 🎬 List all movies that are Documentaries | Filters `listed_in` column for genre using `ILIKE` or `UNNEST` |
| 🌍 Top 5 countries with the most Netflix content | Splits multiple countries per record for accurate counts |
| 📅 Content added in the last 5 years | Uses `date_added` to filter recent content |
| ⭐ Top 10 most common ratings by type | Groups by `type` and `rating` for insights |
| 🎭 Top 10 actors in Indian movies | Breaks down `casts` and filters `country` = India |
| 📈 Average number of titles released by India each year | Aggregates by `release_year` with filtering |
| 📺 TV Shows with more than 5 seasons | Parses the `duration` field and filters numeric seasons |

## 🧽 Data Cleaning Highlights

- Handled comma-separated fields using `STRING_TO_ARRAY` and `UNNEST`
- Used `TRIM()` to remove unwanted spaces
- Replaced reserved SQL keywords (e.g., changed `cast` ➝ `casts`)
- Filtered NULL and blank values for cleaner outputs

## 📌 How to Run

1. Import `netflix_titles.csv` into PostgreSQL using pgAdmin or `\copy`.
2. Run queries from `queries.sql` in this repo.
3. Explore insights, modify filters, and visualize results in tools 
## 💁‍♀️ Author
**Santhi Vaishnavi**  
Final-year Computer Science student  
Aspiring Data Analyst & SQL Sorceress 🧙‍♀️✨

## 💌 Let’s Connect

- [LinkedIn](www.linkedin.com/in/vaishnavi-srinivas-554164253)


📜 License
This project is open for learning, sharing, and growth. Feel free to fork or star ⭐ the repo!

