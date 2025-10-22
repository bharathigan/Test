
/*1.Create a query that returns the longest title in the dataset.We can do this in two steps.

 A. Create a query that returns the length of the longest title.
 
 B. Create a query that uses the length you found in step A to find the longest title.*/
 
 SELECT len(title)
FROM booksdb.dbo.books
order by len(title) desc
Answer: 186

SELECT title 
from booksdb.dbo.books
where len(title)=186


Answer: Soccernomics: Why England Loses, Why Germany and Brazil Win, and Why the U.S., Japan, Australia, Turkey--and Even Iraq--Are Destined to Become the Kings of the World's Most Popular Sport

/*2.Use what you learned in question 1 to find the shortest author name.

 A. Create a query that returns the length of the shortest author.
 
 B. Create a query that returns the shortest authors name.*/



SELECT  len(authors)
FROM booksdb.dbo.books
order by len(authors)

select distinct authors
FROM booksdb.dbo.books
where len(authors)=3

Answer : Avi


/*3. How many titles contain the word "The"?  

A. Is there a difference between the number of titles that use "The" or "the"?*/


SELECT count (title)
FROM booksdb.dbo.books
where title like '%The%'


SELECT count (title)
FROM booksdb.dbo.books
where title like '%the%'

ANSWER : Both queries returned 4702 records.


/*4. How many authors names _start_ with 'Z'?*/

SELECT count( distinct authors)
FROM booksdb.dbo.books
WHERE authors like 'Z%'

Answer: 7

/*5. How many books have been identified as printed in a language other than English?
There are four language codes for English: 'en', 'eng', 'en-US', and 'en-UK'.
Use LEFT to answer the question. (Do not use the wildcard)*/

SELECT count(book_id)
FROM booksdb.dbo.books
where left(language_code,2)  != 'en'

Answer: 186

/*6. Retry question 5 using SUBSTRING.*/


SELECT count(book_id)
FROM booksdb.dbo.books
where SUBSTRING(language_code,1,2)  != 'en'

ANSWER : 186

/*7.Create a column that returns the title, authors, and language codes.Concatenate these elements so that they 
return in the following way: title by authors in language_code language.

 A.Check each selected column to see where any values are NULL.Did any of the columns contain NULL values?If so, which one?*/

SELECT CONCAT(title,' by ', authors, ' in ', language_code,' language'),
language_code
FROM booksdb.dbo.books


Answer: only language_code  contains null values 



/*8.Update the query in question 7 using COALESCE to change the language code values from NULL to 'unknown'.

 A.Has this changed the language_codewhere the values are NULL?*/



SELECT CONCAT(title,' by ', authors, ' in ', language_code,' language'),
language_code, 
COALESCE(language_code,'unknown')
FROM booksdb.dbo.books
	

Answer: Has this changed the language_codewhere the values are NULL?--Yes



/*9. Revisit question 7 using ISNULL instead of COALESCE.*/

 A.Has this changed the language_codewhere the values are NULL?

SELECT CONCAT(title,' by ', authors, ' in ', language_code,' language'),
language_code, 
isnull(language_code,'unknown')
FROM booksdb.dbo.books

Answer: A.Has this changed the language_codewhere the values are NULL?--NO







