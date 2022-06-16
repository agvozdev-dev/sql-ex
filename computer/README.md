1.  Find the model number, speed and hard drive capacity for all the PCs with prices below $500.

    Result set: model, speed, hd.

```sql
select product.model, pc.speed, pc.hd
from product
join pc on product.model = pc.model
where pc.price < 500
```

2. List all printer makers.

   Result set: maker.

```sql
select distinct maker
from product
where type = 'Printer'
```

3. Find the model number, RAM and screen size of the laptops with prices over $1000.

```sql
select distinct product.model, laptop.ram, laptop.screen
from product
join laptop on product.model = laptop.model
where laptop.price > 1000
```

4. Find all records from the Printer table containing data about color printers.

```sql
select distinct *
from printer
where color = 'y'
```

5. Find the model number, speed and hard drive capacity of PCs cheaper than $600 having a 12x or a 24x CD drive.

```sql
select distinct model, speed, hd
from pc
where cd in ('12x', '24x') and price < 600
```

6. For each maker producing laptops with a hard drive capacity of 10 Gb or higher, find the speed of such laptops.

   Result set: maker, speed.

```sql
select distinct product.maker, laptop.speed
from Product product
join Laptop laptop on product.model = laptop.model
WHERE laptop.hd >= 10
```

7. Get the models and prices for all commercially available products (of any type) produced by maker B.

```sql
select distinct product.model, laptop.price
from Product product
join Laptop laptop on product.model = laptop.model
where product.maker = 'B'

union

select distinct product.model, pc.price
from Product product
join PC pc on product.model = pc.model
where product.maker = 'B'

union

select distinct product.model, printer.price
from Product product
join Printer printer on product.model = printer.model
where product.maker = 'B'
```

8. Find the makers producing PCs but not laptops.

```sql
select distinct product.maker
from Product product
where product.type = 'PC'

except

select distinct product.maker
from Product product
where product.type = 'Laptop'
```

9. Find the makers of PCs with a processor speed of 450 MHz or more. Result set: maker.

```sql
select distinct product.maker
from Product product
join PC pc on product.model = pc.model
where pc.speed >= 450
```

10. Find the printer models having the highest price. Result set: model, price.

```sql
select distinct printer.model, printer.price
from  printer
join (select max(price) as max_price
	  from Printer) as subquery
on
	printer.price = subquery.max_price

---

select distinct printer.model, printer.price
from  printer
where printer.price =  (select max(price) as max_price
	  from Printer)
```

11. Find out the average speed of PCs.

```sql
select avg(speed)
from PC pc
```

12. Find out the average speed of the laptops priced over $1000.

```sql
select avg(speed)
from Laptop laptop
where price > 1000
```

13. Find out the average speed of the PCs produced by maker A.

```sql
select avg(speed)
from PC pc
join Product product on pc.model = product.model
where product.maker = 'A'
```

15. Get hard drive capacities that are identical for two or more PCs.

    Result set: hd.

```sql
select hd
from PC pc
group by hd
having count(hd) > 1
```

16. Get pairs of PC models with identical speeds and the same RAM capacity.
    Each resulting pair should be displayed only once, i.e. (i, j) but not (j, i).

    Result set: model with the bigger number, model with the smaller number, speed, and RAM.

```sql
select distinct pc1.model, pc2.model, pc1.speed, pc1.ram
from PC pc1, PC pc2
where pc1.speed  = pc2.speed and
	  pc1.ram = pc2.ram and
	  pc1.model > pc2.model
```

**Условие pc1.model > pc2.model используется, чтобы в результате не было одинаковых строк, отличающихся только перестановкой**

17. Get the laptop models that have a speed smaller than the speed of any PC.

    Result set: type, model, speed.

```sql
select distinct
	product.type,
	laptop.model,
	laptop.speed
from Laptop laptop, Product product
where product.model = laptop.model and
	speed < (select min(speed) from PC)

---

select distinct
	product.type,
	laptop.model,
	laptop.speed
from Laptop laptop, Product product
where product.model = laptop.model and
	speed < all (select distinct speed from PC)
```

18. Find the makers of the cheapest color printers.

    Result set: maker, price.

```sql
select distinct
	product.maker,
	printer.price
from Printer printer
join Product product
	on printer.model = product.model
where printer.color = 'y' and
	printer.price =
		(select min(printer.price)
			from Printer printer
			where printer.color = 'y')
```

19. For each maker having models in the Laptop table, find out the average screen size of the laptops he produces.

    Result set: maker, average screen size.

```sql
select distinct
	product.maker,
	avg(laptop.screen)
from Product product
join Laptop laptop
	on product.model = laptop.model
group by product.maker
```

20. Find the makers producing at least three distinct models of PCs.

    Result set: maker, number of PC models.

```sql
select distinct
	product.maker,
	count(product.model)
from Product product
where product.type = 'PC'
group by product.maker
having count(product.model) >= 3
```

21. Find out the maximum PC price for each maker having models in the PC table.

        Result set: maker, maximum price.

```sql
select product.maker, max(pc.price)
from Product product
join PC pc on product.model = pc.model
group by product.maker
```

22. For each value of PC speed that exceeds 600 MHz, find out the average price of PCs with identical speeds.

    Result set: speed, average price.

```sql
select pc.speed, avg(pc.price)
from PC pc
where pc.speed > 600
group by pc.speed
```
