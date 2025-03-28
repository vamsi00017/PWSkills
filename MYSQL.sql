#1.
use sakila;
 create table employees(
 emp_id int not null primary key,
 emp_name Text not null,
 age int check(age>=18),
 email text not null,
 salary decimal(10,2) default 10000.00 
 );

#2. Explain the purpose of constraints and how they help maintain data integrity in a database. Provide examples of common types of constraints.
/* ans : Constraints are the rules used to store the data which is coming into the database by specific conditions.which can be used to avoid error and 
the consistency of the data stored. they are many types of the constraints
    */
#3)Why would you apply the NOT NULL constraint to a column? Can a primary key contain NULL values? Justify your answer.
/* not null ensures a column always has a value which will maintain data integrity. and the primary key cannot contain null values they must be
unique and not null to identify rows.*/

#4) Explain the steps and SQL commands used to add or remove constraints on an existing table. Provide an example for both adding and removing a constraint.
use sakila;
Alter table employees
Add constraint  emailunique unique (email(225)); 

Alter table employees
drop CONSTRAINT emailunique;

/*5)Explain the consequences of attempting to insert, update, or delete data in a way that violates constraints. Provide an example of an error message that might occur when violating a constraint.
ans: we use the constraints to maintain data integrity
*/

#6. You created a products table without constraints as follows: CREATE TABLE products ( product_id INT, product_name VARCHAR(50), price DECIMAL(10, 2)); Now, you realise that: The product_id should be a primary key. The price should have a default value of 50.00
use sakila;
 create table Products(
 Product_id int,
 Product_name varchar(30),
 Price Decimal(10,2)
 );
 
 Alter Table Products
 Add constraint primary key (Product_id);
 
 Alter Table Products
 Modify column price decimal(10,2) default (50.0);
 
 #7) You have two tables: Write a query to fetch the student_name and class_name for each student using an INNER JOIN.
 use sakila;
 create table Students(
 Student_id int primary key,
 Student_name varchar(30),
 Class_id int
 );
 
  create table Classes(
 Class_id int primary key,
 class_name varchar(30)
 );
 
 insert into students (Student_id ,Student_name,Class_id)values (1,"Alice",101),(2,"Bob",102),(3,"Charlie",101);
 insert into Classes (class_id ,Class_name)values (101,"Math"),(102,"Science"),(103,"History");
 
 Select s.student_name,c.Class_name from students as s inner join Classes as c on  s.class_id=c.class_id;
 
 #8. Consider the following three tables:
  create table Orders(
 order_id int primary key,
 order_date Date,
 Customer_id int
 );
   create table customers_O(
 customer_id int primary key,
customer_name varchar(30)
 );
 
   create table Products_O(
 product_id int primary key,
product_name varchar(30),
 order_id int
 );

insert into Orders (order_id, order_date, Customer_id)values (1,'2024-01-01',101),(2,'2024-01-03',102);
 insert into customers_O (customer_id, customer_name) values (101,"Alice"),(102,"Bob");
 insert into Products_O (product_id, product_name, order_id) values (1,"Laptop",1),(2,"Phone",Null);

 select 
 p.product_name,
 o.order_id,
 c.customer_name
 from 
 Products_o as p
 left join 
 orders as o on p.order_id=o.order_id
 left join 
 customers_O as c on o.customer_id=c.customer_id;
 
 #9) Given the following tables:Write a query to find the total sales amount for each product using an INNER JOIN and the SUM() function.
   create table Sales(
 sale_id int primary key,
 product_id int,
 amount int
 );
   create table Products_S(
 product_id int primary key,
product_name varchar(30)
 );

 insert into Sales (sale_id, product_id, amount) values (1,101,500),(2,102,300),(3,101,700);
 insert into Products_S (product_id, product_name) values (101,"Laptop"),(102,"Phone");
 
 select p.product_name,Sum(s.amount) as total_sales from products_s as p inner join Sales  as s on s.product_id= p.product_id group by p.product_name;
 
 
 #10)Write a query to display the order_id, customer_name, and the quantity of products ordered by each customer using an INNER JOIN between all three tables.
 create table OrderDetails(
 order_id int ,
product_id int,
 quantity int
 );

insert into OrderDetails ( order_id, product_id, quantity) values (1,101,2),(2,102,1),(2,101,3);

select o.order_id,c.customer_name,sum(od.quantity) as quantityOrdered from orders as o INNER JOIN
    customers_O as c ON o.Customer_id = c.customer_id
INNER JOIN
    orderdetails as od ON o.order_id = od.order_id
GROUP BY
    o.order_id, c.customer_name;
    
    
    
# SQL Commands

 /* 1-Identify the primary keys and foreign keys in maven movies db. Discuss the differences 
 ans: primary keys uniquely identify each record in a table and cannot contain nulls or duplicates, while foreign keys 
 establish relationships between tables by referencing primary keys in other tables  and can contain nulls and duplicates*/

 /* 2- List all details of actors  */
	Desc actor;

/* 3 -List all customer information from DB.  */
select * from customer;
/* 4 -List different countries.  */
select distinct country from country;
/* 5 -Display all active customers.  */
select * from customer where active=1;
/* 6 -List of all rental IDs for customer with ID 1.  */
select * from rental where customer_id=1;
/* 7 - Display all the films whose rental duration is greater than 5 .  */
select * from film where rental_duration>5;
/* 8 - List the total number of films whose replacement cost is greater than $15 and less than $20.  */
select count(*) as count from film  where replacement_cost between 15 and 20;
/* 9 - Display the count of unique first names of actors.  */
select distinct count(first_name) as count from actor;
/* 10- Display the first 10 records from the customer table .  */
select * from customer limit 10;
/* 11 - Display the first 3 records from the customer table whose first name starts with ‘b’.  */
select * from customer where first_name like 'b%' limit 3;
/* 12 -Display the names of the first 5 movies which are rated as ‘G’.  */
select title from film where rating='G' limit 5;
/* 13-Find all customers whose first name starts with "a".  */
select * from customer where first_name like'a%';
/* 14- Find all customers whose first name ends with "a".  */
select * from customer where first_name like '%a';
/* 15- Display the list of first 4 cities which start and end with ‘a’ .  */
select * from city where city like 'a%a';
/* 16- Find all customers whose first name have "NI" in any position.  */
select * from customer where first_name like '%ni%';
/* 17- Find all customers whose first name have "r" in the second position .  */
select * from customer where first_name like '_r%';
/* 18 - Find all customers whose first name starts with "a" and are at least 5 characters in length.  */
select * from customer where first_name like 'a____';
/* 19- Find all customers whose first name starts with "a" and ends with "o".  */
select * from customer where first_name like 'a%o';
/* 20 - Get the films with pg and pg-13 rating using IN operator.  */
select * from film where rating in ('pg','pg-13');
/* 21 - Get the films with length between 50 to 100 using between operator.  */
select * from film where length between 50 and 100;
/* 22 - Get the top 50 actors using limit operator.  */
SELECT * FROM actor LIMIT 50;
/*  23 - Get the distinct film ids from inventory table.  */
SELECT DISTINCT film_id FROM inventory;


#Functions
/* Question 1: Retrieve the total number of rentals made in the Sakila database.*/
use sakila;
select count(*) as total_count from rental;

/*Question 2: Find the average rental duration (in days) of movies rented from the Sakila database.*/
select avg(rental_duration) as Average_duration from film;

/*Question 3: Display the first name and last name of customers in uppercase.*/
select upper(first_name),upper(last_name) from customer;

/*Question 4: Extract the month from the rental date and display it alongside the rental ID.*/
select rental_id,month(rental_date) as rentalMonth from rental;

/*Question 5: Retrieve the count of rentals for each customer (display customer ID and the count of rentals).*/
select customer_id,count(*) as count from customer group by customer_id;

/*Question 6: Find the total revenue generated by each store.*/
select store_id, SUM(amount) AS total_revenue
FROM payment p
JOIN rental r ON p.rental_id = r.rental_id
JOIN staff s ON r.staff_id = s.staff_id
GROUP BY store_id;

/*Question 7: Determine the total number of rentals for each category of movies.*/
select c.name AS category_name, COUNT(*) AS rental_count
FROM rental r
join inventory i ON r.inventory_id = i.inventory_id
join film f ON i.film_id = f.film_id
join film_category fc ON f.film_id = fc.film_id
join category c ON fc.category_id = c.category_id
GROUP BY c.name;

/*Question 8: Find the average rental rate of movies in each language.*/
select l.name AS language_name, AVG(f.rental_rate) AS average_rental_rate
FROM film f
join language l ON f.language_id = l.language_id
GROUP BY l.name;

#Joins

/*Questions 9 -Display the title of the movie, customer s first name, and last name who rented it.
Hint: Use JOIN between the film, inventory, rental, and customer tables.*/
select f.title, c.first_name,c.last_name from film f 
join inventory i on f.film_id = i.film_id 
join rental r on i.inventory_id=r.inventory_id
join customer c on c.customer_id=r.customer_id ;

/*Question 10:Retrieve the names of all actors who have appeared in the film "Gone with the Wind."
Hint: Use JOIN between the film actor, film, and actor tables.*/
select a.first_name, a.last_name FROM actor a
join film_actor fa ON a.actor_id = fa.actor_id
join film f ON fa.film_id = f.film_id
WHERE f.title = 'Gone with the Wind';


/*Question 11:Retrieve the customer names along with the total amount they've spent on rentals.
Hint: JOIN customer, payment, and rental tables, then use SUM() and GROUP BY.*/
select c.first_name, c.last_name, SUM(p.amount) AS total_spent FROM customer c
join rental r ON c.customer_id = r.customer_id
join payment p ON r.rental_id = p.rental_id
GROUP BY c.customer_id, c.first_name, c.last_name;


/*Question 12:List the titles of movies rented by each customer in a particular city (e.g., 'London').
Hint: JOIN customer, address, city, rental, inventory, and film tables, then use GROUP BY  */
select c.first_name, c.last_name, f.title FROM customer c
join address a ON c.address_id = a.address_id
join city ci ON a.city_id = ci.city_id
join rental r ON c.customer_id = r.customer_id
join inventory i ON r.inventory_id = i.inventory_id
join film f ON i.film_id = f.film_id
WHERE ci.city = 'London'
GROUP BY c.customer_id, f.title;

# Advanced Joins and GROUP BY:

/* Question 13:Display the top 5 rented movies along with the number of times they've been rented.
Hint: JOIN film, inventory, and rental tables, then use COUNT () and GROUP BY, and limit the results.*/
select f.title, COUNT(*) AS rental_count
FROM film f
join inventory i ON f.film_id = i.film_id
join rental r ON i.inventory_id = r.inventory_id
GROUP BY f.title
ORDER BY rental_count DESC
LIMIT 5;

/* Question 14:Determine the customers who have rented movies from both stores (store ID 1 and store ID 2).
Hint: Use JOINS with rental, inventory, and customer tables and consider COUNT() and GROUP BY. */
select c.customer_id, c.first_name, c.last_name from customer c
join rental r on c.customer_id = r.customer_id
join inventory i on r.inventory_id = i.inventory_id
where i.store_id in (1, 2)
group by c.customer_id, c.first_name, c.last_name
having count(distinct i.store_id) = 2;

#Windows Function:

/*1. Rank the customers based on the total amount they've spent on rentals.*/
select c.customer_id, c.first_name, c.last_name, sum(p.amount) as total_spent, rank() over (order by sum(p.amount) desc) as customer_rank from customer c
join rental r on c.customer_id = r.customer_id
join payment p on r.rental_id = p.rental_id
group by c.customer_id, c.first_name, c.last_name;
/*2. Calculate the cumulative revenue generated by each film over time.*/
select f.title, p.payment_date, sum(p.amount) over (partition by f.film_id order by p.payment_date) as cumulative_revenue
from film f
join inventory i on f.film_id = i.film_id
join rental r on i.inventory_id = r.inventory_id
join payment p on r.rental_id = p.rental_id;

/*3. Determine the average rental duration for each film, considering films with similar lengths.*/
select f.title, avg(f.rental_duration) over (partition by floor(f.length / 10)) as avg_rental_duration
from film f;

/*4. Identify the top 3 films in each category based on their rental counts.*/
select category_name, title, rental_count, film_rank
from (
    select c.name as category_name, f.title as title, count(*) as rental_count, rank() over (partition by c.name order by count(*) desc) as film_rank
    from category c
    join film_category fc on c.category_id = fc.category_id
    join film f on fc.film_id = f.film_id
    join inventory i on f.film_id = i.film_id
    join rental r on i.inventory_id = r.inventory_id
    group by c.name, f.title
) as ranked_films
where film_rank <= 3;

/*5. Calculate the difference in rental counts between each customer's total rentals and the average rentals across all customers.*/
select cid, cname, clast, customer_rental_count, customer_rental_count - avg_rental_count as rental_count_difference
from (
    select c.customer_id as cid, c.first_name as cname, c.last_name as clast, count(r.rental_id) as customer_rental_count, avg(count(r.rental_id)) over () as avg_rental_count
    from customer c
    left join rental r on c.customer_id = r.customer_id
    group by c.customer_id, c.first_name, c.last_name
) as rental_differences;

/*6. Find the monthly revenue trend for the entire rental store over time.*/
select date_format(p.payment_date, '%Y-%m') as payment_month, sum(p.amount) as monthly_revenue
from payment p
group by payment_month
order by payment_month;

/*7. Identify the customers whose total spending on rentals falls within the top 20% of all customers.*/
select cid, cname, clast, total_spent
from (
    select c.customer_id as cid, c.first_name as cname , c.last_name as clast, sum(p.amount) as total_spent, ntile(5) over (order by sum(p.amount) desc) as spending_quartile
    from customer c
    join rental r on c.customer_id = r.customer_id
    join payment p on r.rental_id = p.rental_id
    group by c.customer_id, c.first_name, c.last_name
) as spending_quartiles
where spending_quartile = 1;

/*8. Calculate the running total of rentals per category, ordered by rental count.*/
select c.name as category_name, count(*) as rental_count, sum(count(*)) over (order by count(*) desc) as running_total
from category c
join film_category fc on c.category_id = fc.category_id
join film f on fc.film_id = f.film_id
join inventory i on f.film_id = i.film_id
join rental r on i.inventory_id = r.inventory_id
group by c.name
order by rental_count desc;

/*9. Find the films that have been rented less than the average rental count for their respective categories.*/
select cname, title, rental_count
from (
    select c.name as cname, f.title as title, count(*) as rental_count, avg(count(*)) over (partition by c.name) as avg_category_rentals
    from category c
    join film_category fc on c.category_id = fc.category_id
    join film f on fc.film_id = f.film_id
    join inventory i on f.film_id = i.film_id
    join rental r on i.inventory_id = r.inventory_id
    group by c.name, f.title
) as film_rentals
where rental_count < avg_category_rentals;

/*10. Identify the top 5 months with the highest revenue and display the revenue generated in each month. */
select payment_month, monthly_revenue
from (
    select date_format(p.payment_date, '%Y-%m') as payment_month, sum(p.amount) as monthly_revenue, rank() over (order by sum(p.amount) desc) as revenue_rank
    from payment p
    group by payment_month
) as ranked_months
where revenue_rank <= 5;


#Normalisation & CTE

/*1. First Normal Form (1NF):
 a. Identify a table in the Sakila database that violates 1NF. Explain how you
 would normalize it to achieve 1NF.*/

 /*1NF: Imagine, for example, the film_actor table improperly held several actor names within a single column; to achieve 1NF,
 we'd restructure the data into distinct rows for each actor-film association. Thankfully, the existing film_actor table in Sakila 
 is already correctly formatted in first normal form.*/
 
/*2. Second Normal Form (2NF):
 a. Choose a table in Sakila and describe how you would determine whether it is in 2NF. 
 If it violates 2NF, explain the steps to normalize it.*/
 
 /*2NF: Should the inventory table, for instance, include a film title column, it would breach 2NF since the title's dependence is 
 solely on film_id, a partial key; normalization requires removing this redundant title column and relying on a join with the film 
 table to retrieve titles.*/
 
/*3. Third Normal Form (3NF):
 a. Identify a table in Sakila that violates 3NF. Describe the transitive dependencies 
 present and outline the steps to normalize the table to 3NF.*/ 
 
 /* 3NF: The address table, as it exists, violates 3NF because city details are transitively dependent on address_id through city_id;
 to normalize, we must create a separate city table, leaving address with only the city_id foreign key.  */
 
/*4. Normalization Process:
 a. Take a specific table in Sakila and guide through the process of normalizing it from the initial 
 unnormalized form up to at least 2NF.*/
 
 /*2NF Normalization of Customer: An unnormalized hypothetical customer table, containing address, city, and country details, 
 requires 1NF to ensure atomic values and a primary key; subsequently, 2NF necessitates the creation of separate address, city, 
 and country tables, reducing the customer table to customer_id and address_id. */
 
 /*5. CTE Basics:
 a. Write a query using a CTE to retrieve the distinct list of actor names and the number of films they 
 have acted in from the actor and film_actor tables.*/ 
 with actor_film_counts as (
    select a.actor_id, a.first_name, a.last_name, count(fa.film_id) as film_count
    from actor a
    join film_actor fa on a.actor_id = fa.actor_id
    group by a.actor_id, a.first_name, a.last_name
)
select first_name, last_name, film_count
from actor_film_counts;

/*6. CTE with Joins:
 a. Create a CTE that combines information from the film and language tables to display the film title, 
 language name, and rental rate.*/
 with film_language_info as (
    select f.title, l.name as language_name, f.rental_rate
    from film f
    join language l on f.language_id = l.language_id
)
select title, language_name, rental_rate
from film_language_info;

/*7. CTE for Addredation:
 a. Write a query usi]g a CTE to fi]d the total reve]ue ge]erated by each customer (sum of payme]ts) 
 from the customer a]d payment tables.*/
 with customer_revenue as (
    select c.customer_id, sum(p.amount) as total_revenue
    from customer c
    join payment p on c.customer_id = p.customer_id
    group by c.customer_id
)
select customer_id, total_revenue
from customer_revenue;
 
/* 8.CTE with Window Functions:
 a. Utilize a CTE with a window function to rank films based on their rental duration from the film table.*/
 with ranked_films as (
    select film_id, title, rental_duration, rank() over (order by rental_duration desc) as rental_rank
    from film
)
select film_id, title, rental_duration, rental_rank
from ranked_films;
 
/*9. CTE and Filterind:
 a. Create a CTE to list customers who have made more than two rentals, and then join this CTE with the 
 customer table to retrieve additional customer details*/
 with frequent_customers as (
    select customer_id
    from rental
    group by customer_id
    having count(*) > 2
)
select c.*
from customer c
join frequent_customers fc on c.customer_id = fc.customer_id;

/* 10.CTE for Date Calculations:
 a. Write a query usi(g a CTE to fi(d the total (umber of re(tals made each mo(th, co(sideri(g the 
 re(tal
date from the re(tal table*/
with monthly_rentals as (
    select date_format(rental_date, '%Y-%m') as rental_month, count(*) as rental_count
    from rental
    group by rental_month
)
select rental_month, rental_count
from monthly_rentals;

/* 11. CTE and Self-Join:
 a. Create a CTE to ge(erate a report showi(g pairs of actors who have appeared i( the same film 
 together, usi(g the film
actor table.*/
with actor_pairs as (
    select fa1.actor_id as actor1_id, fa2.actor_id as actor2_id, fa1.film_id
    from film_actor fa1
    join film_actor fa2 on fa1.film_id = fa2.film_id
    where fa1.actor_id < fa2.actor_id
)
select a1.first_name, a1.last_name, a2.first_name, a2.last_name, ap.film_id
from actor_pairs ap
join actor a1 on ap.actor1_id = a1.actor_id
join actor a2 on ap.actor2_id = a2.actor_id;


/*12. CTE for Recursive Search:
 a. Impleme(t a recursive CTE to fi(d all employees i( the staff table who report to a specific ma(ager, 
 co(sideri(g the reports
to column  */
with employee_list as (
    select staff_id, first_name, last_name
    from staff
)
select *
from employee_list;
