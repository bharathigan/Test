loan
# SQL Part 5 Studio:  A Library Service

## Setting Up Your Data

You will be creating 5 new tables within your own schema.

4 of the tables can be populated using the starter code which can be found in the data folder.

After setting up the data you should have the following five tables:

1. book
2. author
3. patron
4. genre
5. loan

## **Part A: Setting Up Your Tables**

### **Book Table**

To create the **book** table, you can use the following SQL query:


CREATE TABLE Sep2025JunkDB.bharathi_ganjikunta.book (
    book_id INT IDENTITY(1,1) PRIMARY KEY,
    author_id INT,
    title VARCHAR(255),
    isbn INT,
    available BIT,
    genre_id INT
);

Answer: Table created.


### Populate the **book** table

For the starter data, use the book_data.ipynb notebook.

You may copy/paste the commands into the next code block.  
You will need to update each INSERT statement to contain the names of your database and schema.

Answer: Given data populated in to the book table.

### Test your data
                
Run a quick query of your choice to see if the book table was properly created.

SELECT * FROM  Sep2025JunkDB.bharathi_ganjikunta.BOOK;


We will repeat a similar process for the **author, patron,** and **genre** tables. 
                
### **Author Table**

To create the **author** table, you will use the following code:


CREATE TABLE Sep2025JunkDB.bharathi_ganjikunta.author (
    author_id INT IDENTITY(1,1) PRIMARY KEY,
    first_name VARCHAR(255),
    last_name VARCHAR(255),
    birth_year INT,
    death_year INT
);

Answer: Table created.

Populate the **author** table with the author_data.ipynb notebook.

ANSWER : Given data populated in to the author table.

### **Patron Table**

To create the **patron**, you will use the following code:


CREATE TABLE Sep2025JunkDB.bharathi_ganjikunta.patron (
    patron_id INT IDENTITY (1,1) PRIMARY KEY,
    first_name VARCHAR(255),
    last_name VARCHAR(255),
    loan_id INT
);

Answer: Table created.

Populate the **patron** table with the patron_data.ipynb notebook.

### **Genre Table**

ANSWER : Given data populated in to the patron table.



To create the **genre** table, use the following code:


CREATE TABLE Sep2025JunkDB.bharathi_ganjikunta.genre (
    genre_id INT PRIMARY KEY,
    genres VARCHAR(100)
);

Answer: Table created.

Populate the **genre** table with the genre_data.ipynb notebook.

ANSWER : Given data populated in to the genre table.

### **Loan Table**

The **loan** table will be created differently and will stay empty.  We will use our other tables to populate the loan table using queries shortly. 

Use the following code to create the **loan** table:


CREATE TABLE Sep2025JunkDB.bharathi_ganjikunta.loan (
    loan_id INT IDENTITY(1,1) PRIMARY KEY,
    patron_id INT,
    date_out DATE,
    date_in DATE,
    book_id INT
    CONSTRAINT book_id FOREIGN KEY (book_id) REFERENCES Sep2025JunkDB.bharathi_ganjikunta.BOOK (book_id)
        ON UPDATE SET NULL
        ON DELETE SET NULL
);

Answer: Table created.

 ## **Part B: Warm-Up Queries**

Write the following queries to get warmed up and make sure your tables have populated appropriately.

1. Return the mystery book titles and their ISBNs.

Answer: Below query returns the book titles and their ISBNs.

SELECT b.title, b.isbn
		FROM  Sep2025JunkDB.bharathi_ganjikunta.book b,
		Sep2025JunkDB.bharathi_ganjikunta.genre g
		WHERE g.genres  like '%mystery%'
		and g.genre_id =b.genre_id
		order by title
		;


2. Return all of the titles and the authors first and last names for books written by authors who are currently living.

Answer: Below query returns the titles and the authors first and last names for books written by authors who are currently living.

SELECT b.title, a.first_name, a.last_name
		FROM  Sep2025JunkDB.bharathi_ganjikunta.author a,
			  Sep2025JunkDB.bharathi_ganjikunta.book b
		WHERE a.death_year is null
		AND a.author_id =b.author_id
		order by a.first_name
;

## **Part C: Loan Out a Book**
                
The library would like you to create a query that will update the database when a book is loaned out.

This query needs to perform the following functions:

1. Change **available** to **0** (false) for the appropriate book.

 Answer: update Sep2025JunkDB.bharathi_ganjikunta.book
set available=0
where book_id=1


2. Add a new row to the **loan** table with todays date as the date_out and the ids in the row matching the appropriate patron_id and book_id.
 
Answer: INSERT INTO Sep2025JunkDB.bharathi_ganjikunta.loan( patron_id,date_out,date_in,book_id)
VALUES (1,getdate(),null,1);

3. Update the appropriate **patron** with the loan_id for the new row created in the **loan** table.

You can use any patron and book that strikes your fancy to create and test out this query.

Answer: update Sep2025JunkDB.bharathi_ganjikunta.patron
set loan_id=1
where patron_id=1


## **Part D: Check a Book Back In**

Work with the same patron and book as you create your query to check a book back into the library.

The check a book back in, your query need to do the following:

1. Change **available** to **1** (true) for the appropriate book.

Answer:   update Sep2025JunkDB.bharathi_ganjikunta.book
set available=1
where book_id=1

2. Update the appropriate row in the **loan** table with todays date as the date_in.

Answer:   update Sep2025JunkDB.bharathi_ganjikunta.loan
set date_in=getdate()
where loan_id=1

3. Update the appropriate **patron** changing loan_id back to NULL.

Answer:	update Sep2025JunkDB.bharathi_ganjikunta.patron
set loan_id=null
where patron_id=1

Once you have created these queries, loan out 5 new books to 5 different patrons.

Answer:

INSERT INTO Sep2025JunkDB.bharathi_ganjikunta.loan( patron_id,date_out,date_in,book_id)
VALUES (3,getdate(),null,4);

INSERT INTO Sep2025JunkDB.bharathi_ganjikunta.loan( patron_id,date_out,date_in,book_id)
VALUES (5,getdate(),null,5);

INSERT INTO Sep2025JunkDB.bharathi_ganjikunta.loan( patron_id,date_out,date_in,book_id)
VALUES (6,getdate(),null,8);

INSERT INTO Sep2025JunkDB.bharathi_ganjikunta.loan( patron_id,date_out,date_in,book_id)
VALUES (10,getdate(),null,9);

INSERT INTO Sep2025JunkDB.bharathi_ganjikunta.loan( patron_id,date_out,date_in,book_id)
VALUES (11,getdate(),null,13);

## **Part E: Create a temp table**

CREATE TABLE Sep2025JunkDB.bharathi_ganjikunta.temp (
    book_name VARCHAR(500),
    patron_first_name VARCHAR(255),
    patron_last_name VARCHAR(255),
	date_out DATE,
    date_in DATE
);


Answer: Table created.

Write a query that returns a temporary table for a patron that shows them all of their loans.

Answer:
INSERT INTO Sep2025JunkDB.bharathi_ganjikunta.temp
(book_name, patron_first_name,patron_last_name,date_out,date_in)
SELECT  b.title,p.first_name,p.last_name,l.date_out,l.date_in
FROM  Sep2025JunkDB.bharathi_ganjikunta.patron p,
      Sep2025JunkDB.bharathi_ganjikunta.loan l,
      Sep2025JunkDB.bharathi_ganjikunta.book b
WHERE p.patron_id = l.patron_id
AND   l.book_id = b.book_id

_Question to think about:_  Why might a temp table be a good option for this type of query?

Answer: The temp table contains key details like patron names and their loaned books, making it easy to view all related information in one place.


## **Part F: Wrap-up Query**

Create a query that returns the names of the patrons with the genre of every book they currently have checked out.

Things to consider:  How are these tables related and connected to each other?

Answer:
SELECT p.first_name,p.last_name, b.title, g.genres
FROM  Sep2025JunkDB.bharathi_ganjikunta.patron p,
      Sep2025JunkDB.bharathi_ganjikunta.loan l,
      Sep2025JunkDB.bharathi_ganjikunta.book b,
      Sep2025JunkDB.bharathi_ganjikunta.genre g
WHERE p.loan_id=l.loan_id     
AND   l.book_id = b.book_id 
AND   b.genre_id=g.genre_id


## **Bonus Challenge:**
                
This is an optional challenge.

Create a new table for reference materials using the following code:


CREATE TABLE Sep2025JunkDB.bharathi_ganjikunta.reference_books (
    reference_id INT IDENTITY(1,1) PRIMARY KEY,
    edition INT,
    book_id INT FOREIGN KEY REFERENCES Sep2025JunkDB.bharathi_ganjikunta.book(book_id)
        ON UPDATE SET NULL
        ON DELETE SET NULL
);

Answer: Table created.

Fill the table with the following query:


INSERT INTO Sep2025JunkDB.bharathi_ganjikunta.reference_books (edition, book_id)
VALUES (5,32);


A reference book cannot leave the library. 
How would you modify either the **reference_book** table or the **book** table to make sure that doesnt happen?
 Try to apply your modifications.

Answer:

ALTER TABLE Sep2025JunkDB.bharathi_ganjikunta.reference_books
ADD can_be_loaned VARCHAR(255);

UPDATE Sep2025JunkDB.bharathi_ganjikunta.reference_books
SET can_be_loaned = 'N';

INSERT INTO Sep2025JunkDB.bharathi_ganjikunta.loan (patron_id, date_out, date_in, book_id)
SELECT 1, GETDATE(), NULL, 32
WHERE NOT EXISTS (
    SELECT 1
    FROM Sep2025JunkDB.bharathi_ganjikunta.reference_books
    WHERE book_id = 32
	AND can_be_loaned ='Y'
);
