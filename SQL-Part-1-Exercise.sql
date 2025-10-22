/* A. The Books Table*/


/*Question 1: Select the top 1000 rows from the books table.  Make sure you are able to see all of the columns.*/
  select   top 1000 * 
  from Booksdb.dbo.books
  Answer: 1000 rows total
  
/*Question 2: Count the number of titles.  Are there 10,000 titles as promised by the dataset?*/

SELECT COUNT(original_title)
FROM Booksdb.dbo.books

Answer 9410

/*Are there 10,000 titles as promised by the dataset?*/
Answer:Yes

/*Question 3: Count the number of books where the `original_publication_year` is earlier than 1800.*/

SELECT COUNT (book_id)
FROM Booksdb.dbo.books
WHERE original_publication_year < 1800

Answer 125

/*Question 4: Create a query that displays distinct authors from the table.*/

SELECT  distinct authors 
FROM Booksdb.dbo.books
	  
Answer: above query will display distinct authors


/*Question 5: Create a query that displays a count of all the books that contain a language code for English.
This could be represented in the table as */

select count(book_id)
FROM Booksdb.dbo.books
where language_code like 'en%'

Answer 8730 rows total


/*Question 6: Create a query to check how many original titles were written during World War I era (1914-1921).*/

SELECT COUNT (original_title)
FROM Booksdb.dbo.books
WHERE original_publication_year BETWEEN 1914 AND 1921
   
Answer 38 titles total


/*B. The Book Tags Table*/

/*Question 1: Select the top 1000 table items ordered by the `tag_id`.*/

SELECT top 1000*
FROM  Booksdb.dbo.book_tags	
ORDER BY tag_id

Answer: 1000 rows total
	  
/*Question 2: Create a query that counts the number of `goodreads_book_id` grouped by the `tag_id`.*/

select tag_id, count(goodreads_book_id)
FROM  Booksdb.dbo.book_tags	
group by tag_id

Answer: above query display tagid and goodreads_book_id count by tag_id
	  



/*Question 3: In the last query, we created a new, unnamed column.  
Use `AS` to create an alias to provide a name of your choice to this new column.*/

select tag_id, count(goodreads_book_id) as "Goodreads book count"
FROM  Booksdb.dbo.book_tags	
group by tag_id

Answer: Goodreads book count

/*C The Ratings Table*/


/*Question 1: Create a query that displays the top 1000 items in the table in descending order.*/

select top 1000 *
from Booksdb.dbo.ratings
order by rating desc
 
Answer: Displays top 1000 rows by rating descending order 

/*Question 2: Create a query that returns the total number of users that have given a rating of less than 2.*/

select count( user_id)
from Booksdb.dbo.ratings
where rating <2

Answer 19575

/*Question 3: Create a query that returns the sum of books that have a rating of 4 or higher.*/
select sum(book_id)
from Booksdb.dbo.ratings
where rating >=4


Answer 3236228609


/*D. The Tags table*/


/*Question 1: Create a query that returns table items where the `tag_name` describes the book as a mystery. 

Hint: Use the wildcard to find the word mystery at the beginning, middle, and end of a `tag_name`*/

select *
from Booksdb.dbo.tags
where tag_name like '%mystery%'



/*Question 2: Run the query below. In your own words, what is it returning?*/

 SELECT *
   FROM BooksDB.dbo.tags
    WHERE tag_name < 'd' AND tag_name >= 'c';
	
Answer: Showing all tag names starting with letter c

   
   
/*E. The To Read table*/


/*Question 1:  Create a query that uses the `user_id` to count the total number of books that each user wants to read. 
 Print the results in ascending order by `user_id` under the alias 'Total Books To Read'.

Hint: You can use both `GROUP BY` and `ORDER BY` to complete this query.*/

SELECT user_id, count(book_id) "Total Books To Read"
   FROM BooksDB.dbo.to_read
GROUP BY user_id
   order by user_id
    


/*Question 2: Create a query that uses `user_id` to count the total number of books each user wants to read. 
 Have the results sort the table by the total number of `book_ids` in descending order and under the alias 'Total Books To Read'.

Hint: You can use both `GROUP BY` and `ORDER BY` to complete this query.   */

SELECT user_id, count(book_id) "Total Books To Read"
   FROM BooksDB.dbo.to_read
GROUP BY user_id
   order by "Total Books To Read" desc 
    
