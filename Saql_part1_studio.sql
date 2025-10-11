/*## Part 1: BooksDB Questions

Question 1: Write a query of the `books` table that returns the top 100 results and includes `book_id`, `authors`, `title`, and `average_rating`. Use an alias for at least one column and sort the result set in descending order of rating. What is the number one book?
select top 100  book_id, authors, title, average_rating as "AvgRating"
from booksdb.dbo.books
order by average_rating desc*/


/*Question 2: Write a query to find the least popular book.*/

select top 1 book_id , books_count
from booksdb.dbo.books
order by books_count

/*Question 3: Which tag is the most popular?*/

select top 1 tag_id, "count"
from booksdb.dbo.book_tags
order by "count" desc

/*Question 4: What is the name of the most popular tag?*/

select tag_name
from   booksdb.dbo.tags
  where tag_id=30574

/*Question 5: How many books where released in the first decade of 2000?*/
select count(id)
from booksdb.dbo.books
where original_publication_year=2000

/*Question 6: How many book titles contain the word, "happy"?*/

select count(*)
from booksdb.dbo.books
where title like '%happy%'


/*Question 7: List the books from the top 3 authors from Question 1.  If there is more than one author just use the first one. 
Sort the title alphabetically by `author` and then by `average_rating`, best rated to lowest. Does this order matter in sorting?*/

select original_title,authors, average_rating
from booksdb.dbo.books
where authors in('Bill Watterson','Brandon Sanderson','J.K. Rowling, Mary GrandPré_')
order by authors, average_rating desc

/*Question 8: Write a query that returns the number of authors whose first name is between rock and roll.*/


select  count(authors)
from booksdb.dbo.books
where upper(LEFT(authors, CHARINDEX(' ', authors + ' ') - 1)) between  upper('rock'') and upper('roll')