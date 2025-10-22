 sql exercise :4
# Exercises: Complex queries

For the exercises, you are tasked with writing five queries that will help you delve deeper into BooksDB. 
You can choose whether you want to use a correlated subquery, a nested subquery, the UNION operator, the INTERSECT operator, 
or the EXCEPT operator for each one. You may not use joins or add multiple statements to the WHERE clause.

1.Write a query that will return the number of users who rated a book above its average rating.

Answer:650327

	SELECT count(USER_ID)
	from  BooksDB.dbo.ratings
	WHERE rating >(select avg(rating) from  BooksDB.dbo.ratings)


2.Write a query that returns the book ids of all books that have over 1000 ratings of 1 star or over 1000 ratings of 5 stars.

Answer: 12232
 
 SELECT book_id
	from  BooksDB.dbo.books
	WHERE ratings_1 >1000
UNION 
SELECT book_id
	from  BooksDB.dbo.books
	WHERE ratings_5 >1000	



3.Write a query that returns the book ids of all books that have over 1000 ratings of 1 star and over 1000 ratings of 5 stars.

Answer: 2234

SELECT book_id
	from  BooksDB.dbo.books
	WHERE ratings_1 >1000
INTERSECT
SELECT book_id
	from  BooksDB.dbo.books
	WHERE ratings_5 >1000	

4.Write a query that returns the book ids of books that have a language code of "en-US" and not a langugae code of "en-GB".
Answer: 2070

SELECT book_id
	from  BooksDB.dbo.books
	WHERE language_code ='en-US'
	EXCEPT
SELECT book_id
	from  BooksDB.dbo.books
	WHERE  language_code ='en-GB'



5.Write a query that returns the names of the tags and the tag ids for tags that were used over 100,000 times for a book. 
Answer: tag_id   tag_name
		30574	 to-read

SELECT tag_id, tag_name
	from  BooksDB.dbo.tags
	where tag_id in (SELECT tag_id
					from  BooksDB.dbo.book_tags
					where "count">100000
					)