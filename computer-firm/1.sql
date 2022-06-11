select product.model, pc.speed, pc.hd
from product
join pc on product.model = pc.model
where pc.price < 500 