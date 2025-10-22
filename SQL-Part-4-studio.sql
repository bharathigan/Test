  
  # SQL Part 4 Studio

For this studio, you will be working in small groups and using the BooksDB.
One group member should screen share while fellow group members code along in their own notebooks.
Each group member will submit a link to their studio notebook.

You are back at the bookstore helping employees with their inventory of books.
Four employees need your help with finding books to create in-store displays.
Read their requests and decide if you want to use a correlated subquery, nested subquery, UNION operator, EXCEPT operator, or INTERSECT operator.
You may not use any joins or add multiple statements to the WHERE clause unless explicitly asked.



## QUESTION 1:Willow

Willow wants a list of book titles that have multiple authors attributed to them.Write a query to return her desired results.

Answer: authors column contains multiple authors separated by comma, below query returns book titles that have multiple authors attributed to them.

SELECT b1.title
 from booksdb.dbo.books b1
  where title in(select b2.title
                 from  booksdb.dbo.books b2
                 where b1.book_id=b2.book_id
                 and b2.authors like '%,%')  
order by b1.title 

 
 
## QUESTION 2: Ira

Ira was asked by a customer for titles that have been tagged "Meditation".
As you create a query for Ira, think about how the tables in BooksDB are organized as you write your query.

Answer: Below query displays titles that have been tagged "Meditation"

select title
from  booksdb.dbo.books b
where b.book_id in         
       (select bt.goodreads_book_id
       from  booksdb.dbo.book_tags bt
       where bt.tag_id in
            (SELECT tag_id 
            from booksdb.dbo.tags t
            where t.tag_name like '%Meditation%')
        )
order by title


## QUESTION 3:Alyce

Alyce wants to create a display of books with an average rating of 4.2 or higher, but she only wants books that share both title and original title.
Write a query that displays both the original title and title for Alyce, in descending order by rating.
Make sure that none of the original titles contain NULL values either.

Answer: Below query displays books with an average rating of 4.2 or higher and books that share both title and original title.


SELECT original_title, title, average_rating
FROM BooksDB.dbo.books b1
where book_id =( select book_id
                from  booksdb.dbo.books b2
                where b2.book_id= b1.book_id
                and average_rating>=4.2)
  AND original_title IS NOT NULL
  INTERSECT
SELECT original_title, title, average_rating
FROM BooksDB.dbo.books b1
where book_id =( select book_id
                from  booksdb.dbo.books b2
                where b2.book_id= b1.book_id
                and average_rating>=4.2)
  AND title = original_title
  AND original_title IS NOT NULL
ORDER BY average_rating DESC;


## QUESTION 4:Thisbe

Thisbe is planning to make a long-term display of popular books that she will update monthly, reflecting different time periods.
She wants to make it reader-centric by including titles that readers have averagely rated higher than the books actual average rating.

Answer: Below query displays popular books with periods and order by year and titl.

SELECT title, 
       average_rating AS book_avg_rating,
        (SELECT avg(rating) FROM   booksdb.dbo.ratings r WHERE r.book_id = b1.book_id) AS reader_avg_rating,
       original_publication_year
 from  booksdb.dbo.books b1
 where average_rating <(SELECT avg(rating) 
						 FROM   booksdb.dbo.ratings r 
						 WHERE r.book_id = b1.book_id)
 order by original_publication_year, title;

**Part A:**Write a query that compares the publication time with average reader ratings.
	SELECT title, 
       average_rating AS book_avg_rating,
        (SELECT avg(rating) FROM   booksdb.dbo.ratings r WHERE r.book_id = b1.book_id) AS reader_avg_rating,
       original_publication_year
 from  booksdb.dbo.books b1
 where average_rating <(SELECT avg(rating) 
						 FROM   booksdb.dbo.ratings r 
						 WHERE r.book_id = b1.book_id)

**Part B:**She wants the list ordered by year, then the book title
SELECT title, 
       average_rating AS book_avg_rating,
        (SELECT avg(rating) FROM   booksdb.dbo.ratings r WHERE r.book_id = b1.book_id) AS reader_avg_rating,
       original_publication_year
 from  booksdb.dbo.books b1
 where average_rating <(SELECT avg(rating) 
						 FROM   booksdb.dbo.ratings r 
						 WHERE r.book_id = b1.book_id)
 order by original_publication_year, title;