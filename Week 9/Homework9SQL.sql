/*Use the Sakila db*/
use sakila;

/*Display the first and last names of all actors from the table `actor`.*/
select first_name, last_name from actor;

/*Display the first and last names of all actors from the table `actor`.*/
select upper(concat(first_name, " ", last_name)) as fullname from actor;

/*2a. You need to find the ID number, first name, and last name of an actor, 
of whom you know only the first name, "Joe." What is one query would you use 
to obtain this information?*/

select actor_id, first_name, last_name 
from actor
where first_name = "Joe";

/*2b. Find all actors whose last name contain the letters `GEN`*/
select * from actor
where last_name like "%gen%";

/*2c. Find all actors whose last names contain the letters `LI`. This time, 
order the rows by last name and first name, in that order*/
select * from actor
where last_name like "%li%"
order by last_name,first_name;

/* 2d. Using `IN`, display the `country_id` and `country` columns of the 
following countries: Afghanistan, Bangladesh, and China */

select country_id, country from country
where country in ("Afghanistan","Bangladesh","China");

/*3a. You want to keep a description of each actor. You don't think you 
will be performing queries on a description, so create a column in the 
table `actor` named `description` and use the data type `BLOB` (Make sure
 to research the type `BLOB`, as the difference between it and `VARCHAR` 
 are significant).*/
 
alter table actor
add description blob;

/*3b. Very quickly you realize that entering descriptions for each actor 
is too much effort. Delete the `description` column.*/
alter table actor
drop column description;

/*4a. List the last names of actors, as well as how many actors have that last name.*/

select last_name, count(last_name) as count
from actor
group by  last_name;
 
/*4b. List last names of actors and the number of actors who have that last name, 
but only for names that are shared by at least two actors.*/
select last_name, count(last_name) as count
from actor
group by  last_name
having count(last_name)>1;

/*4c. The actor `HARPO WILLIAMS` was accidentally entered in the `actor` table as 
`GROUCHO WILLIAMS`. Write a query to fix the record.*/

update actor set first_name = "Harpo"
where first_name = "GROUCHO" and last_name = "Williams";

/* 4d. Perhaps we were too hasty in changing `GROUCHO` to `HARPO`. It turns out 
that `GROUCHO` was the correct name after all! In a single query, if the first 
name of the actor is currently `HARPO`, change it to `GROUCHO`*/

update actor
set first_name = 
case first_name when "Harpo" then "GROUCHO" else first_name end;

/* * 5a. You cannot locate the schema of the `address` table. Which query would 
you use to re-create it?*/

show create table address;

/* 6a. Use `JOIN` to display the first and last names, as well as the address, 
of each staff member. Use the tables `staff` and `address`: */

select first_name, last_name, address 
from staff  
inner join address on staff.address_id = address.address_id;

/* * 6b. Use `JOIN` to display the total amount rung up by each staff member 
in August of 2005. Use tables `staff` and `payment`.*/

select first_name, last_name, sum(amount)
from payment
inner join staff on payment.staff_id = staff.staff_id
group by first_name;

/** 6c. List each film and the number of actors who are listed for that 
film. Use tables `film_actor` and `film`. Use inner join.*/

select film_id, count(film_actor.actor_id)
from actor
inner join film_actor on actor.actor_id = film_actor.actor_id
group by actor.actor_id;

/** 6d. How many copies of the film `Hunchback Impossible` exist in the 
inventory system?*/

select count(inventory_id) from
inventory where film_id in( 
select film_id from film
where title = "Hunchback Impossible");

/* * 6e. Using the tables `payment` and `customer` and the `JOIN` command,
 list the total paid by each customer. List the customers alphabetically 
 by last name:*/
 
select first_name, last_name, sum(amount) 
from customer
inner join payment on customer.customer_id = payment.customer_id
group by last_name;

/** 7a. The music of Queen and Kris Kristofferson have seen an unlikely 
resurgence. As an unintended consequence, films starting with the letters 
`K` and `Q` have also soared in popularity. Use subqueries to display the 
titles of movies starting with the letters `K` and `Q` whose language is English.*/

select title from film where language_id in
(select language_id from language
where name = "English") and 
(title like "K%" or title like "Q%");

/** 7b. Use subqueries to display all actors who appear in the film `Alone Trip`.*/
select first_name, last_name from actor
where actor_id in(
select actor_id from film_actor 
where film_id in
(select film_id from film
where title = "Alone Trip"));

/** 7c. You want to run an email marketing campaign in Canada, for which you will 
need the names and email addresses of all Canadian customers. Use joins to retrieve
 this information.*/
 
select first_name, last_name, email 
from customer 
inner join address on customer.address_id = address.address_id
inner join city on address.city_id = city.city_id
inner join country on country.country_id = city.country_id
where country.country = "Canada";

/** 7d. Sales have been lagging among young families, and you wish to target all 
family movies for a promotion. Identify all movies categorized as _family_ films.*/

select title, description from film
where film_id in
(select film_id from film_category
where category_id in
(select category_id from category
where name = "Family"));
 
/** 7e. Display the most frequently rented movies in descending order.*/


select film_id, sum(film_id) as number_rented from inventory 
where inventory_id in
(select inventory_id from rental)
group by film_id
order by sum(film_id) desc
;
 
 
/** 7f. Write a query to display how much business, in dollars, each store 
brought in.*/

select store_id, sum(amount)
from payment
inner join staff 
on payment.staff_id = staff.staff_id
group by store_id;

/** 7g. Write a query to display for each store its store ID, city, and country.*/
select store_id, city, country 
from store
inner join address on store.address_id = address.address_id
inner join city on address.city_id = city.city_id
inner join country on city.country_id = country.country_id;
 
 /** 7h. List the top five genres in gross revenue in descending order. (**Hint**:
 you may need to use the following tables: category, film_category, inventory, 
 payment, and rental.)*/
 
select name, sum(amount) 
from payment
inner join rental on rental.rental_id = payment.rental_id
inner join inventory on inventory.inventory_id = rental.inventory_id
inner join film_category on film_category.film_id = inventory.film_id
inner join category on category.category_id = film_category.category_id
group by name
order by sum(amount)
limit 5;

/** 8a. In your new role as an executive, you would like to have an easy way of 
viewing the Top five genres by gross revenue. Use the solution from the problem 
above to create a view. If you haven't solved 7h, you can substitute another 
query to create a view.*/

create view top_genres_sold as select name, sum(amount) 
from payment
inner join rental on rental.rental_id = payment.rental_id
inner join inventory on inventory.inventory_id = rental.inventory_id
inner join film_category on film_category.film_id = inventory.film_id
inner join category on category.category_id = film_category.category_id
group by name
order by sum(amount)
limit 5;

/** 8b. How would you display the view that you created in 8a?*/
 select * from sakila.top_genres_sold;

/** 8c. You find that you no longer need the view `top_five_genres`. Write a 
query to delete it.*/

drop view top_genres_sold; 



