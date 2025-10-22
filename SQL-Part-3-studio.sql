### Event 1: Womens History Month

Highlight popular women writers based on ratings from BooksDB by writing a query that returns tag_id, 
the number of times each tag_id is used and the tag_name. 
Use the GROUP BY and HAVING clause to narrow your focus and try multiple keywords, such as "woman" and "female".

SELECT  t.tag_id,    t.tag_name,  b.average_rating
FROM  BooksDB.dbo.book_tags AS bt
INNER JOIN  BooksDB.dbo.tags AS t ON bt.tag_id = t.tag_id
INNER JOIN  BooksDB.dbo.books as b on bt.goodreads_book_id =b.book_id
WHERE  t.tag_name LIKE '%woman%'
    OR t.tag_name LIKE '%female%'
GROUP BY t.tag_id, t.tag_name,b.average_rating
HAVING b.average_rating >3.5    
ORDER BY   b.average_rating desc

Answer: Displays tags related to woman or female 


### Event 2: Choose another event from March/Spring

Write a query to return authors, titles, ratings, and tag_id that you would want to promote during your chosen event.


select  bt.tag_id,b.authors,b.title, b.average_rating
from BooksDB.dbo.tags as t
INNER JOIN  BooksDB.dbo.book_tags AS bt ON bt.tag_id = t.tag_id
INNER JOIN  BooksDB.dbo.books as b on bt.goodreads_book_id =b.book_id
where t.tag_name like'%general-sports%'
   or t.tag_name like '%extreme-sports%'
   or t.tag_name like '%other-sports%'
   or t.tag_name like '%sports-books%'
 group by   bt.tag_id,b.authors,b.title, b.average_rating
 having average_rating >3.75
   order by b.average_rating desc;
   

# Part 2: Choose Another Month

Choose another month and plan at least 2 events / promotions and answer the following questions:
1. Which month did you choose?
   May
1. What 2 events / promotions are you highlighting?
   Food festival,Flowers sale
    
	 	   
# Part 3: Summarize your Work

### Summarize Event 1

For each event write at least one query that joins any two tables in `BooksDB` to support your choice and record you thoughts as to why you 
used the paticlular query. At least one of your queries needs to include a HAVING clause.		   


	select  bt.tag_id,b.authors,b.title, b.average_rating
	from BooksDB.dbo.tags as t
	INNER JOIN  BooksDB.dbo.book_tags AS bt ON bt.tag_id = t.tag_id
	INNER JOIN  BooksDB.dbo.books as b on bt.goodreads_book_id =b.book_id
	where tag_name like '%fast-food%'
			or tag_name like '%eat-in-chicken%'
			or tag_name like '%cooking-vegan%'
			or tag_name like '%fish%'
	 group by   bt.tag_id,b.authors,b.title, b.average_rating
	 having average_rating >3.75
	   order by b.average_rating desc;	

### Summarize Event 1	  
  
		select  bt.tag_id,b.authors,b.title, b.average_rating
		from BooksDB.dbo.tags as t
		INNER JOIN  BooksDB.dbo.book_tags AS bt ON bt.tag_id = t.tag_id
		INNER JOIN  BooksDB.dbo.books as b on bt.goodreads_book_id =b.book_id
		where tag_name like '%flower%'
		 group by   bt.tag_id,b.authors,b.title, b.average_rating
		 having average_rating >3.75
		   order by b.average_rating desc;
