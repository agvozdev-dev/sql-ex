14. For the ships in the Ships table that have at least 10 guns, get the class, name, and country.

```sql
select ships.class, ships.name, classes.country
from Ships ships
join Classes classes on ships.class = classes.class
where classes.numGuns >= 10
```
