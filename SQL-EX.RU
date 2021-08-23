Похожие задачи сюда не записывал вроде 2,3,4.

БД для заданий 1-20, кроме 14. 

Схема БД состоит из четырех таблиц:
Product(maker, model, type)
PC(code, model, speed, ram, hd, cd, price)
Laptop(code, model, speed, ram, hd, price, screen)
Printer(code, model, color, type, price)

1. 
Find the model number, speed and hard drive capacity for all the PCs with prices below $500.
Result set: model, speed, hd.
select model, speed, hd from PC where price < 500

5.
Find the model number, speed and hard drive capacity of PCs cheaper than $600 having a 12x or a 24x CD drive.
Select model,speed,hd from pc
where price<600 and (cd='12x' or cd='24x')

6.
For each maker producing laptops with a hard drive capacity of 10 Gb or higher, find the speed of such laptops. Result set: maker, speed.
select distinct maker, speed from product, laptop
where hd >= 10 and product.model=laptop.model


7.
Get the models and prices for all commercially available products (of any type) produced by maker B.
SELECT model, price FROM 
(SELECT model, price fROM PC
 UNION SELECT model, price FROM Laptop
 UNION SELECT model, price FROM Printer) 
AS a
WHERE a.model in (SELECT model FROM Product WHERE maker = 'b')

8.
Find the makers producing PCs but not laptops.
select distinct maker from product where type='pc' and maker not in (select maker from product where type='laptop')

9.
Find the makers of PCs with a processor speed of 450 MHz or more. Result set: maker.
Select distinct maker from product FULL OUTER JOIN pc on pc.model=product.model where speed >=450

10.
Find the printer models having the highest price. Result set: model, price.
select model, price from printer where price = (select max(price) from printer)

11.
Find out the average speed of PCs.
select avg(speed) as speed from  pc

12.
Find out the average speed of the laptops priced over $1000.
select avg(speed)from laptop where price>1000

13.
Find out the average speed of the PCs produced by maker A.
select avg(speed) speed from pc
where model in (select model from product where maker='a')

14.
Classes(class, type, country, numGuns, bore, displacement)
Ships(name, class, launched)
Battles(name, date)
Outcomes(ship, battle, result)
For the ships in the Ships table that have at least 10 guns, get the class, name, and country.

select ships.class, ships.name, classes.country from ships
inner JOIN classes on classes.class=ships.class where numGuns>=10

15.
Get hard drive capacities that are identical for two or more PCs.
Result set: hd.
select pc.hd from pc group by hd having count(pc.hd)>1

16.
Get pairs of PC models with identical speeds and the same RAM capacity. Each resulting pair should be displayed only once, i.e. (i, j) but not (j, i).
Result set: model with the bigger number, model with the smaller number, speed, and RAM.
Select distinct pc_1.model, pc_2.model, pc_1.speed, pc_1.ram from pc pc_1, pc pc_2
where pc_1.speed=pc_2.speed and pc_1.ram=pc_2.ram and pc_1.model>pc_2.model
