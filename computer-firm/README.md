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
