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
