SELECT CONCAT(YEAR(date_column), '/', WEEK(date_column)) AS desired_name, COUNT(*) as desired_count_name
FROM table_column
GROUP BY desired_name
ORDER BY YEAR(date_column) ASC, WEEK(date_column) ASC
