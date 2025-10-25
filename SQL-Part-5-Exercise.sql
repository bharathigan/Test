 # Exercises: Creating, Updating, and Destroying Objects

For the exercises, you will be working with objects and data you create. 
Before opening this notebook, make sure that you have set up the new connection to the server and that you have located the database and your schema.

## Object Creation

Before coding, think of three things you want to make.
 These could be coding projects, new recipes, or planned projects for a woodworking hobby. 
 Brainstorm the appropriate column names and data types as well.

Create a table under your schema called `planned_makes`.
ANSWER:
        create table sep2025junkDB.bharathi_ganjikunta.planned_makes
(recipe_id INT IDENTITY(1,1) PRIMARY KEY,
    recipe_name NVARCHAR(100) NOT NULL,
    cuisine_type NVARCHAR(50),
    main_ingredient NVARCHAR(50));
	
	 	 select *
         FROM sep2025junkDB.bharathi_ganjikunta.planned_makes


Add three rows to your table that are your planned makes.

 ANSWER:  INSERT INTO sep2025junkDB.bharathi_ganjikunta.planned_makes
          VALUES('BRINJAL CURRY','SOUTH INDIA','BRINJAL');
   
          INSERT INTO sep2025junkDB.bharathi_ganjikunta.planned_makes
          VALUES('NATUKODI PULUSU','SOUTH INDIA','CHICKEN');
   
         INSERT INTO sep2025junkDB.bharathi_ganjikunta.planned_makes
	     VALUES('ULAVA CHARU BIRYANI','SOUTH INDIA','HORSEGRAM');



## Update a Row
Change different values in one of your three rows.

Answer:UPDATE sep2025junkDB.bharathi_ganjikunta.planned_makes
	SET recipe_name= 'BRINJAL CURRY',
	    cuisine_type= 'NORTH INDIA'
	WHERE recipe_id=1;


## Delete a Row
Delete one of the rows from your table.

Answer:DELETE sep2025junkDB.bharathi_ganjikunta.planned_makes
	WHERE recipe_id=2;


## Drop the Table

While this has been fun, it is time to drop the table!
 
Answer:DROP table sep2025junkDB.bharathi_ganjikunta.planned_makes; 