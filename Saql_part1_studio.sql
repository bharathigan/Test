/*## Part 1: BooksDB Questions

Question 1: Write a query of the `books` table that returns the top 100 results and includes `book_id`, 
`authors`, `title`, and `average_rating`. Use an alias for at least one column 
and sort the result set in descending order of rating. What is the number one book?*/

select Top 100 book_id,
authors,
title,
average_rating "Avg Rating"
FROM booksdb.dbo.books 
ORDER BY average_rating DEsc

 Answer: The Complete Calvin and Hobbes


/*Question 2: Write a query to find the least popular book.*/

 SELECT TOP 1 original_title
 FROM booksdb.dbo.books
 ORDER BY average_rating
 
 Answer: One Night @ The Call Center


/*Question 3: Which tag is the most popular?*/

SELECT TOP 1 tag_id,"count"
FROM Booksdb.dbo.book_tags
ORDER BY "COUNT" DESC

 Answer:30574

/*Question 4: What is the name of the most popular tag?*/

SELECT tag_name
FROM Booksdb.dbo.tags
WHERE tag_id= 30574

 Answer:to-read

/*Question 5: How many books where released in the first decade of 2000?*/

 SELECT count(book_id)
from booksdb.dbo.books
WHERE original_publication_year >=2000 

 Answer: 6188

/*Question 6: How many book titles contain the word, "happy"?*/

SELECT  COUNT(original_title)
from booksdb.dbo.books
WHERE original_title LIke '%happy%'

 Answer: 11

 /*Question 7: List the books from the top 3 authors from Question 1.  If there is more than one author just use the first one. 
Sort the title alphabetically by `author` and then by `average_rating`, best rated to lowest. Does this order matter in sorting?*/

select original_title,authors, average_rating
from booksdb.dbo.books
where authors in('Bill Watterson','Brandon Sanderson','J.K. Rowling, Mary GrandPré')
order by authors, average_rating desc

 Answer: It's a Magical World: A Calvin and Hobbes Collection
There's Treasure Everywhere: A Calvin and Hobbes Collection
The Authoritative Calvin and Hobbes

/*Question 8: Write a query that returns the number of authors whose first name is between rock and roll.*/


select  count(distinct authors)
from booksdb.dbo.books
where upper(LEFT(authors, CHARINDEX(' ', authors + ' ') - 1)) between  upper('rock') and upper('roll')

 Answer:16


 

/* Part 2: Find the Answers to Your Own Questions*/


/*1. What book has the longest title?*/

 select top 1 original_title, len(original_title), book_id
from booksdb.dbo.books
order by len(original_title) desc
Answer: The Art Spirit: Notes, Articles, Fragments of Letters and Talks to Students, Bearing on the Concept and Technique of Picture Making, the Study of Art Generally, and on Appreciation (Icon Editions)


2. Which author has written the most books?

select top 1 authors, count(original_title)
from booksdb.dbo.books
group by authors
order by count(original_title) desc

Answer:Nora Roberts

3. What were the top ten books published the year I was born?

select  Top 10 original_title
From booksdb.dbo.books
WHERE original_publication_year=1992

Answer: The Pelican Brief
She's Come Undone
Snow Crash
Dragonfly in Amber
The Secret History
The Shadow Rising 
The Black Echo
Gerald's Game
Dolores Claiborne
The English Patient

