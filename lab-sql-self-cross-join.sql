use sakila;
select * from film_actor f1
join film_actor f2
on f1.film_id = f2.film_id
and f1.actor_id > f2.actor_id
order by f1.actor_id, f2.actor_id, f1.film_id
; -- Q1


select customer_id, film_id, count(rental_id) from customer c
join rental r using(customer_id)
join inventory i using(inventory_id)
join film f using(film_id)
group by customer_id, film_id
having count(rental_id) > 1
order by count(rental_id); 

select s1.customer_id, s2.customer_id, s1.film_id
from
(select customer_id, film_id, count(rental_id) from customer c
join rental r using(customer_id)
join inventory i using(inventory_id)
join film f using(film_id)
group by customer_id, film_id
having count(rental_id) > 1
order by count(rental_id)) s1
join 
(select customer_id, film_id, count(rental_id) from customer c
join rental r using(customer_id)
join inventory i using(inventory_id)
join film f using(film_id)
group by customer_id, film_id
having count(rental_id) > 1
order by count(rental_id)) s2
on s1.film_id = s2.film_id
and s1.customer_id > s2.customer_id; -- Q2

select * from (
  select distinct actor_id from actor
) sub1
cross join (
  select distinct film_id from film
) sub2; -- Q3