/*
 There are 78 film recommendations
 */
select * from film where fulltext @@ to_tsquery('astronaut');


/*
 There are  52 films with rating R and replacement costs between $5 and $15
 */
select count(distinct film_id ) from film where rating ='R' and (replacement_cost <15 and replacement_cost >5);


/*
 Give the bonnus to Jon Stephens
 */
select staff.staff_id,staff.first_name , staff.last_name ,count(payment_id ) as total_payment_handle, sum(amount) as total_amount from payment
join staff on payment.staff_id  = staff.staff_id 
group by staff.staff_id order by total_payment_handle desc;


/*
 The average replacement cost for PG-13 film is the most expensive
 */
select rating,avg(replacement_cost ) from film group by rating order by avg desc;


/*
 Get this name a coupons !
 */
select customer.first_name, customer.last_name, customer.email, sum(amount) as money_spent from customer
left join payment on customer.customer_id = payment.customer_id 
group by customer.customer_id order by money_spent desc limit 5;


/*
 This is the stock
 */
select inventory.store_id,title,count(inventory.film_id) from inventory
left join film on inventory.film_id =film.film_id 
group by inventory.store_id,inventory.film_id, film.title order by inventory.store_id asc, count(inventory.film_id) desc ;


/*
 Eleanor, Karl, and Clara is our winner!
 */
select customer.first_name , customer.last_name ,customer.email , count(payment_id) from customer
left join payment on customer.customer_id = payment.customer_id group by customer.customer_id having count(payment_id)>=40 order by count(payment_id) desc;

