
-- Q1 : Who is the senior most employee based on job title?

select * from employee
order by levels desc 
limit 1


--Q2 : which countries have the most Invoices?

select count(*) as Invoices, billing_country 
from invoice
group by billing_country
order by Invoices desc


--Q3 : What are top 3 values of total invoice?

select total 
from invoice 
order by total desc
limit 3



--Q4 : Which city has the best customers ? we would like to throw a promotional music fastival in the city we made the most money. write a query that returns one 
      --city that has the highest sum of invoice totals. return both the city name & sum of all invoice totals.


select billing_city , sum(total) as invoise_total
from invoice
group by billing_city
order by invoise_total desc
limit 1


--Q5 : Who is the best customer? the customer who has spent the most money will be declared the best custmer. 
--write a query that retuns the person who has spent the most money.


select customer.customer_id, customer.first_name, customer.last_name , sum(invoice.total) as total_spent
from customer join invoice
on customer.customer_id = invoice.customer_id
group by customer.customer_id
order by total_spent desc
limit 1


--Q6 : Write query  to return the email, first name , last name , & Genre of all Rock music listeners. 
       --return your list ordered alphabetically by email starting with A.



select distinct customer.email, customer.first_name,customer.last_name,genre.name
from customer join invoice
on customer.customer_id = invoice.customer_id
join invoice_line
on invoice_line.invoice_id = invoice.invoice_id
join track
on invoice_line.track_id = track.track_id
join genre
on track.genre_id = genre.genre_id
where genre.name = 'Rock'
order by customer.email




--Q7 : Let's invite the artists who have written the most rock music in our datadet.
    --write a query that returns the artist name and total track count of the 10 rock bands.

select artist.artist_id,artist.name , count(artist.artist_id) as number_of_songs
from track join genre 
on track.genre_id = genre.genre_id
join album
on album.album_id = track.album_id
join artist
on artist.artist_id = album.artist_id
where genre.name = 'Rock'
group by artist.artist_id
order by number_of_songs desc
limit 10




--Q8 : Return all the track names that have a song length longer than the average song length. return the name and milliseconds for each track.
    --order by the song length with the longest songs listed first.


select name, milliseconds
from track
where milliseconds >(
select avg(milliseconds) as avg_track_length
from track )
order by milliseconds desc



--Q9 : Find how much amount spent by each customer on artists? write a query to return customer name,artist name and total spent.



With best_selling_artist As (
     select artist.artist_id as artist_id,artist.name as artist_name,
     sum(invoice_line.unit_price * invoice_line.quantity) as total_spent
     from invoice_line join track
	 on track.track_id = invoice_line.track_id
	 join album
	 on album.album_id = track.album_id
	 join artist
	 on artist.artist_id = album.artist_id
     Group by 1
     order by 3 desc
     limit 1
)
select c.customer_id,c.first_name,c.last_name,bsa.artist_name,
sum(il.unit_price * il.quantity) as amount_spent
from invoice i join customer c 
on c.customer_id = i.customer_id
join invoice_line il
on il.invoice_id = i.invoice_id
join track t
on t.track_id = il.track_id
join album alb
on alb.album_id = t.album_id
join best_selling_artist bsa
on bsa.artist_id = alb.artist_id
group by 1,2,3,4
order by 5 desc



--Q10 : We want to find out the most popular music genre for each country. we detemine the most popular genre as the genre with highest amount of puchases.
     -- write a query that return each country along with the top genre. for countries where the maximum number of purchases is shared return all genres.




With popular_genre as (
select count(invoice_line.quantity) as purchases,customer.country,genre.name as genre_name,genre.genre_id,
row_number() over(partition by customer.country order by count(invoice_line.quantity)desc) as Rowno
from invoice_line
join invoice on invoice.invoice_id = invoice_line.invoice_id
join customer on customer.customer_id = invoice.customer_id
join track on track.track_id = invoice_line.track_id
join genre on genre.genre_id = track.genre_id
group by 2,3,4
order by 2 asc, 1 desc
)
select * from popular_genre 
where Rowno = 1




--Q11 : Write a query determines the customer that has spent the most on music for each country.write a query that returns the country along with the top
    --customer and how much they spent. for countres where the top amount spent is shared , provide all customer who spent this amount.



With Customer_with_country As (
select customer.customer_id,first_name,last_name,billing_country,sum(total) as total_spending,
row_number() over(partition by billing_country order by sum(total) desc) as Rowno
from invoice
join customer on customer.customer_id = invoice.customer_id
group by 1,2,3,4
order by 4 asc, 5 desc
)
select * from customer_with_country
where Rowno = 1





















