# SQL (Structured Query Language)

Created by Vince Chang </br>

SQL code and materials will be here. SQL is a programming language designed to
manage data stored in relational databases. It operates through simple,
declarative statements

#### RELATIONAL DATABASES

- Is a database that organizes information into one or more tables
- Tables are referred to as **_relations_**

#### QUICK GUIDE

- `SELECT` is the clause we use every time we want to query information from a
  database
- `AS` renames a column or table
- `DISTINCT` return unique values
- `WHERE` is a popular command that lets you filter the results of the query
  based on conditions that you specify
- `LIKE` and `BETWEEN` are special operators
- `AND` and `OR` combines multiple conditions
- `ORDER BY` sorts the result
- `LIMIT` specifies the maximum number of rows that the query will return
- `CASE` creates different outputs

#### STATEMENTS

- Statements are a text that DB recognizes as a valid command and end in a ;

```
CREATE TABLE table_name(
  column_1 data_type,
  column_2 data_type
);
```

- `CREATE TABLE` is the clause aka command
- Clauses perform specific tasks in SQL and are written in CAPS
- Everything inside the `( )` are the parameters
- Ex:

```
CREATE TABLE celebs(
  id INTEGER,
  name TEXT,
  age INTEGER
);
```

#### INSERT INTO

- Use `INSERT INTO table_name` statement
- Followed by parameters identifying the columns the data will be inserted
- Lastly, the values that will be inserted
- Ex:

```
INSERT INTO celebs (id, name, age)
VALUES (1, 'Justin Bieber', 21);
```

#### SELECT

- `SELECT` statements are used to query data from a database
- Ex:

```
SELECT name FROM celebs;
```

- This will query the column called name from the table name celebs
- Can also select multiple columns, just separate column names with a comma
- Can also select all columns from a table:

```
SELECT * FROM celebs;
```

- SELECT statements always return a new table called the result set

#### UPDATE

- Allows to edit a row in a table to change existing records
- Ex:

```
UPDATE celebs
SET age = 22
WHERE id = 1;
```

- SET column = new_value
- WHERE id = id_number // will tell you what row to update

#### ALTER TABLE

- Adds a new column to a table

```
ALTER TABLE celebs
ADD COLUMN twitter_handle TEXT;
```

- Use ALTER TABLE to edit the table called celebs
- Adds a column called twitter_handle which is of type TEXT

#### DELETE FROM

- Deletes one ore more rows from a table

```
DELETE FROM celebs
WHERE twitter_handle IS NULL;
```

- This will delete from the celebs table where the twitter_handle column has
  null values

#### CONSTRAINTS

- Add information about how a column can be used
- They can be used to tell a DB to reject inserted data that does not adhere to
  a certain restriction
- Ex:

```
CREATE TABLE celebs (
   id INTEGER PRIMARY KEY,
   name TEXT UNIQUE,
   date_of_birth TEXT NOT NULL,
   date_of_death TEXT DEFAULT 'Not Applicable',
);
```

1. `PRIMARY KEY` columns can be used to uniquely identify the row. Attempts to
   insert a row with an identical value to a row already in the table will result
   in a constraint violation which will not allow you to insert the new row.

2. `UNIQUE` columns have a different value for every row. This is similar to
   `PRIMARY KEY` except a table can have many different `UNIQUE` columns.

3. `NOT NULL` columns must have a value. Attempts to insert a row without a
   value for a `NOT NULL` column will result in a constraint violation and the new
   row will not be inserted.

4. `DEFAULT` columns take an additional argument that will be the assumed value
   for an inserted row if the new row does not specify a value for that column.

#### AS (change a column or table to be known as something else)

- IS a keyword in SQL that allows you to rename a column or table using an
  alias
- The new name can be anything you want as long as you put it inside of
  **_single quotes_**

#### DISTINCT

- Used to return unique values in the output
- Filters out all duplicate values in specified columns
- Ex:

```
SELECT DISTINCT genre
FROM movies;
```

- This will get all unique genres

#### WHERE

- filters the result set to only include rows where the following condition is
  true

```
SELECT *
FROM movies
WHERE imdb_rating > 8;
```

#### LIKE

- Use when wanting to compare similar values
- This is used in the `WHERE` clause to search for a specific pattern in a
  column
- Not case sensitive
- `_` is the wildcard character to match a pattern
- `%` Are used for before and after

```
SELECT *
FROM movies
WHERE name LIKE 'Se_en';
```

- This would recognize 'Seven' and 'Se7en'

```
SELECT *
FROM movies
WHERE name LIKE '%man%';
```

- This will return any movie that contains the word man in its name
- A% matches all movies with names that begin with letter 'A'
- %a matches all movies that end with 'a'

#### BETWEEN

- Operator that can be used in a `WHERE` clause to filter the result set within
  a certain range
- BETWEEN two letters **_is not_** inclusive of the 2nd letter
- BETWEEN two numbers **_is_** inclusive of the 2nd number

```
SELECT *
FROM movies
WHERE name BETWEEN 'A' AND 'J';
```

- This is will be A - not including J

```
SELECT *
FROM movies
WHERE year BETWEEN 1990 AND 1999;
```

- This will be 1990 - 1999 including 1999

#### AND

- Combine multiple conditions in a `WHERE` clause

```
SELECT *
FROM movies
WHERE year < 1985
AND genre == 'horror';
```

- This specifically gets the movies prior to 1985 and are only Horror films

#### OR

- Same as AND but will display if any condition is true

```
SELECT *
FROM movies
WHERE year > 2014
OR genre = 'action';
```

#### ORDER BY

- Sort results using `ORDER BY` either alphabetically or numerically
- Ex:

```
SELECT name, year, imdb_rating
FROM movies
ORDER BY imdb_rating DESC;
```

- This will display 3 columns (name, year, imdb_rating) and sort them in
  descending order by values from the imdb_rating column (note, don't need to use
  `DESC` if want it to be in Ascending order)

#### LIMIT

- You can cap the number of rows in the result using the `LIMIT` Clause
- You can specify the max number of rows a result set would have
- This could possibly make the queries run faster

```
SELECT *
FROM movies
ORDER BY imdb_rating DESC
LIMIT 3;
```

- This will get the top 3 movies by rating

#### CASE

- Allows to create different outputs in the `SELECT` statement
- Ex:

```
SELECT name,
 CASE
  WHEN genre = 'romance' THEN 'Chill'
  WHEN genre = 'comedy' THEN 'Chill'
  ELSE 'Intense'
 END AS 'Mood'
FROM movies;
```

- This will create a new column called Mood and group the movies from the
  romance and comedy genres by their mood

#### AGGREGATES

- Calculations on multiple rows of a table are called aggregates
- Ex:
  - `SELECT COUNT( *) FROM table_name`: count the number of rows
  - `SELECT SUM(column_name) FROM table_name`: the sum of values in a column
  - `MAX()/MIN()`: returns the largest/smallest value in the given column
  - `SELECT MAX(column_name) FROM table_name`
  - `SELECT MIN(column_name) FROM table_name`
  - `SELECT AVG() FROM table_name`: the average of the values in a column
  - `ROUND(column_name,number of decimals)`: round the values in the column
  - `GROUP BY` is a clause used with aggregate functions to combine data from
    one or more columns
  - `HAVING` limit the results of a query based on an aggregate property

#### GROUPBY

- `GROUPBY` is a clause in SQL that is used with aggregate functions
- Used in collaboration with `SELECT` statements to arrange identical data into
  groups
- Comes before any `WHERE` statement but **_before_** `ORDERBY` and `LIMIT`
- Ex:

```
SELECT price, COUNT(*)
FROM fake_apps
GROUP BY price;
```

- This will group all the results by the price and count per price
- You can also group by column numbers:
  - 1 is the first column selected
  - 2 is the second column selected
  - 3 is the third column selected

#### HAVING

- Allows filtering by **_Group_**
- It is similar to `WHERE` but you can't use it in this cause because you don't
  want to filter the rows, you want to filter the groups!
- Always comes **_after_** `GROUPBY` but before `ORDERBY` and `LIMIT`
-

# MULTIPLE TABLES

#### JOIN

- Combine information from different tables into a single table
- Ex:

```
SELECT *
FROM orders
JOIN customers
  ON orders.customer_id = customers.customer_id;
```

- This will get everything from orders table and customer table, could also
  specify which columns you want. Then I want to JOIN information from the orders
  with customers. Next is telling how to combine the two tables. Want to take
  order's customer_id and match it with customer's customer_id

#### INNER JOIN

- The result will only include rows that match the ON condition, everything it
  doesn't match, will not be in the final result table

#### LEFT JOIN

- Keeps all rows from the first table, regardless of whether there is a
  matching rows from the second table

#### PRIMARY KEY VS FOREIGN KEY

- Requirements:
  - None of the values can be `NULL`
  - Each value must be unique
  - Table can not have more than one primary key
- When a primary key for one table appears in a different table it is called a
  **_Foreign Key_**
- This is important because most common types of joins will be joining a
  foreign key from one table with the primary key from another table

#### CROSS JOIN

- Ex:

```
SELECT shirts.shirt_color,
   pants.pants_color
FROM shirts
CROSS JOIN pants;
```

- This will select two columns (shirt_color and pants_color) from the shirts
  table, then a `CROSS JOIN` is performed with pants.
- `ON` statement is not required in a `CROSS JOIN`

#### UNION

- Rules for combining tables together
  - Tables must have the same number of columns
  - The columns must have the same data types in the same order as the first
    table.

#### WITH

- The `WITH` statement allows us to perform a separate query
