##QUESTION 1:  Exploring a LEFT JOIN using the books and to_read tables

The code block below has been commented out. To answer this question, you will need to uncomment it by removing the / (line 1) and / (line 16).

Part A: Look at Query 1, which table is the 'Left' table and which is the 'Right'?/

 Your Answer: BooksDB.dbo.books is left table and BooksDB.dbo.to_read is right table.

Part B: Using table 2, answer the following questions: 
- When we added a WHERE tr.user_id IS NOT NULL clause (line 14), how did the table change?  Why?/

 Your Answer: Now query not showing null records for user_id column, reason is query2 has IS NOT NULL condition on user_id column.

-- Query 1: LEFT JOIN
SELECT TOP 50 b.title, b.average_rating, b.books_count,tr.user_id, tr.book_id
FROM BooksDB.dbo.books AS b
LEFT JOIN BooksDB.dbo.to_read AS tr
ON b.best_book_id = tr.book_id
ORDER BY b.average_rating;

-- Query 2: LEFT JOIN USING 'IS NOT NULL'
SELECT TOP 50 b.title, b.average_rating, b.books_count,tr.user_id, tr.book_id
FROM BooksDB.dbo.books AS b
LEFT JOIN BooksDB.dbo.to_read AS tr
ON b.best_book_id = tr.book_id
WHERE tr.user_id IS NOT NULL
ORDER BY b.average_rating;

##QUESTION 2: Exploring RIGHT joins with the books and to_read tables

You will need to uncomment the query to answer the question.

Part A: Looking at the query, which table is the 'Left' and which is the 'Right'?

Your Answer: BooksDB.dbo.books is left table and BooksDB.dbo.to_read is right table.

Part B: How do the RIGHT-joined tables differ from the LEFT-joined tables in Question 1?

 Your Answer: The RIGHT JOIN pulls all rows from to_read table, shows NULLs for unmatched records from books table, 
 while the LEFT JOIN pulls all rows from books table, showing NULLs for unmatched records from to_read table.

-- Query 1: RIGHT JOIN
SELECT TOP 300 b.title, b.average_rating, b.books_count, tr.user_id, tr.book_id
FROM BooksDB.dbo.books AS b
RIGHT JOIN BooksDB.dbo.to_read AS tr
ON b.best_book_id = tr.book_id;

##QUESTION 3:Exploring FULL JOINS with the books and to_read tables

You will need to uncomment the Query to answer the question.

Part A: Look at the table and explore how it was populated.  Try manipulating the query to better understand how this table works. 
 Try adding a WHERE clause, or ORDER BY a column on the books table. 
 Based on your exploration, can you think of when you might want a FULL join rather than a LEFT, RIGHT, or INNER?

 Your Answer: A FULL JOIN pulls all the records from both books and to_read tables. 
             It shows the matching rows together, and if something doesn’t match, it fills in the missing side with NULL value.
			We can use a FULL JOIN when we want to see everything from both tables.
-- FULL JOIN
SELECT TOP 30 b.title, b.average_rating, b.books_count,tr.user_id, tr.book_id
FROM BooksDB.dbo.books AS b
FULL JOIN BooksDB.dbo.to_read AS tr
ON b.book_id = tr.book_id;


##QUESTION 4:Exploring INNER Joins with the books and to_read tables

You will need to uncomment the Query to answer the question.

Part A: What does an inner join do?

 Your Answer: INNER JOIN only shows the rows that will matches values in both tables.

Part B:Currently this table has an 'IS NOT NULL' in the WHERE clause. Is this necessary for this table? Why or Why not?

 Your Answer: Actually IS NOT NULL is not necessary, but if it is added in query then query wont shows the rows which are having null values in title column.

Part C: When using SQL, you are usually returning much larger tables so every line of code will add to the compilation and return time.  
Rewrite this inner join query so that it contains no redundant code.

 Your Answer:  SELECT TOP 30 b.title, b.average_rating, b.books_count,tr.user_id, tr.book_id
				FROM BooksDB.dbo.books AS b
				INNER JOIN BooksDB.dbo.to_read AS tr
				ON b.book_id = tr.book_id
				ORDER BY tr.book_id;

-- INNER JOIN
SELECT TOP 30 b.title, b.average_rating, b.books_count,tr.user_id, tr.book_id
FROM BooksDB.dbo.books AS b
INNER JOIN BooksDB.dbo.to_read AS tr
ON b.book_id = tr.book_id
WHERE b.title IS NOT NULL
ORDER BY tr.book_id;

##QUESTION 5: Using joins to find the most tagged book and the most popular tag

We will be writing 3 queries to find both the most tagged book and that books most popular tag.
 
Part A: What is the most tagged book?


Start by joining the books and book_tags tables ON the books.best_book_id and book_tags.goodreads_book_id. 
We want the most popular book, so think about ordering the table in a way that will display both the book title 
and the number of times a book tag has been used.

Minimum Desired output:_  The title of the most tagged book, and the number of times the book has been tagged.

Answer: Title The Alchemist
 
		SELECT TOP 1 b.title, tr.count
		FROM BooksDB.dbo.books AS b
		INNER JOIN BooksDB.dbo.book_tags AS tr
		ON b.best_book_id = tr.goodreads_book_id
		ORDER BY tr.count desc;

Part B:How many different tags have been used for the most tagged book?

Start by joining the books and book_tags tables ON the books.best_book_id and book_tags.goodreads_book_id. 
We want to find the most popular tag id, so think about ordering in a way that will display the most popular tag id.

Minimum Desired Output: The tag id for the most popular tag used for the most tagged book.

Answer:  Tag Id 30574

	SELECT TOP 1  tr.tag_id, tr.count
	FROM BooksDB.dbo.books AS b
	INNER JOIN BooksDB.dbo.book_tags AS tr
	ON b.best_book_id = tr.goodreads_book_id
	ORDER BY tr.count desc;

Part C:What is this particular tag?

You may return this answer with a simple query.

Minimum Desired Output: The tag name for the most popular tag used for the most tagged book.

Answer: Tag Name to-read
-- Code Here

select tag_name from BooksDB.dbo.tags
    where tag_id=30574


##QUESTION 6: Find a book based on a tag of your choice using joins.

Some suggestions: any hobbies you like? baking, drawing, etc. how about favorite holidays, subjects, animals, etc?

Part A:Explore the tags table for a tag of your choice.  Suggested ideas, try searching for one of your hobbies, a favorite time of year, 
favorite animal, etc.  Start by querying the tag table for your chosen tag.  
(_Hint:_ in order to make sure you find all combinations of your tags, use the wildcard).  
If your query returns more than one result, pick your favorite.

Here is an example.  Alyce wanted to search for Halloween books.  She used the wildcard, %halloween% and 8 different combinations were found.
  Alyce selected halloween-storytime, with a tag id of 13877.

Minimum Desired Output: tag name and tag id



Answer: Your Tag and 	Tag Id:
        general-sports	12964

select tag_id, tag_name
 from BooksDB.dbo.tags
    where tag_name like '%sport%'

Part B:Now that you have the tag id, find the title that was tagged the most with this tag by joining the books and books_tags tables.

Alyce joined the book table with the tags table and discovered that "The Little Old Lady Who Was Not Afraid of Anything" was tagged as halloween-storytime 
the most.

Minimum Desired Output: title and tag count

Your Title and Number of times the tag was used: 
Answer:				Title  												No_of_times
Those Guys Have All the Fun: Inside the World of ESPN				   2
The Book of Basketball: The NBA According to The Sports Guy			   2	
-- Code Here:
SELECT TOP 10 b.title, tr.count as No_of_times
		FROM BooksDB.dbo.books AS b
		INNER JOIN BooksDB.dbo.book_tags AS tr
		ON b.best_book_id = tr.goodreads_book_id
        where tag_id=12964;



## QUESTION 7:What are the top 10 most popular book titles on the 'to read' list?

Part A: Explore how the to_read and books tables are organized, and then join them.  What will you use as a key?

Your Answer: b.best_book_id = tr.book_id

select top 10 b.title, count(tr.book_id) AS book_count
     from BooksDB.dbo.books AS b
    INNER JOIN  BooksDB.dbo.to_read AS tr
    ON b.best_book_id = tr.book_id
    group by b.title
    order by book_count desc
    ;

Part B:Organize your newly joined table in a way that groups popularity based on the title based on users.

Hint: Suggest using an alias for the aggregation you will need to run on the user_id

Minimum Desired Output: title and aliased column
-- Code Here:
	SELECT TOP 10 b.title,     COUNT(DISTINCT tr.user_id) AS user_count
	FROM BooksDB.dbo.books AS b
	INNER JOIN BooksDB.dbo.to_read AS tr
		ON b.best_book_id = tr.book_id
	GROUP BY b.title
	ORDER BY user_count DESC;


## QUESTION 8:Largest 'To Read' Lists

Part A: Create a query that returns a table that contains the top 10 users with the most number of titles on their 'to read' list.
    Group all the entries by user_id.

_Hint:_ You might want an alias for the titles.

_Minimum Desired Output:_ user_id and your aliased column of titles.


SELECT TOP 10 tr.user_id,   COUNT(DISTINCT b.title) AS title_count
	FROM BooksDB.dbo.books AS b
	INNER JOIN BooksDB.dbo.to_read AS tr
		ON b.best_book_id = tr.book_id
	GROUP BY tr.USER_ID
	ORDER BY title_count DESC;

Answer"

user_id 	total_count
11932		15
12483		15
14771		15
38201		15
27933		14
36923		14
37359		14
6772		13
9961		13
28480		13


Part B: The longest list length is 15 titles total, and is shared by 4 different users.  
   Select one of the uses and print out their entire 'to read' list.
-- Code Here:
SELECT   tr.user_id , b.title
	FROM BooksDB.dbo.books AS b
	INNER JOIN BooksDB.dbo.to_read AS tr
		ON b.best_book_id = tr.book_id
	where  tr.USER_ID=11932
	ORDER BY b.title;

Answer:
user_id 	title
11932	Harry Potter and the Half-Blood Prince (Harry Potter, #6)
11932	Harry Potter and the Order of the Phoenix (Harry Potter, #5)
11932	Harry Potter and the Prisoner of Azkaban (Harry Potter, #3)
11932	Harry Potter and the Sorcerer's Stone (Harry Potter, #1)
11932	Harry Potter Boxed Set, Books 1-5 (Harry Potter, #1-5)
11932	Harry Potter Collection (Harry Potter, #1-6)
11932	Heretics of Dune (Dune Chronicles #5)
11932	I am Charlotte Simmons
11932	I'm a Stranger Here Myself: Notes on Returning to America after Twenty Years Away
11932	Neither Here nor There: Travels in Europe
11932	The Lord of the Rings (The Lord of the Rings, #1-3)
11932	The Lord of the Rings: The Art of The Fellowship of the Ring
11932	The Lord of the Rings: Weapons and Warfare
11932	The Mother Tongue: English and How It Got That Way
11932	The Ultimate Hitchhiker's Guide to the Galaxy

SELECT  distinct TOP 20   tr.user_id 
,count(b.title) as cb
	FROM BooksDB.dbo.books AS b
	INNER JOIN BooksDB.dbo.to_read AS tr
		ON b.best_book_id = tr.book_id
	GROUP BY tr.USER_ID
	ORDER BY cb DESC, user_id;




