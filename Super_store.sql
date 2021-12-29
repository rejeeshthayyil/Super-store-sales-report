
  select * from Orders$

  select * from orders
  order by [order date] asc

 -- Order numbers and total sales from 2014 until 2017 which order status is finished

 select [order date] from orders
 order by [order date]asc

 select count([order Id])[Total orders] , sum(sales)[Total Sales] from orders
 where [order status]='finished'


-- Total sales for each sub-category of product on 2014 and 2015


with orderyear
as

(select datepart(year,[order date])[order year],[sub-Category],sum([sales])[Total Sales] from orders
where datepart(year,[order date]) between '2014' and '2015'
group by [sub-category],
datepart(year,[order date]))
--[order date])

select [order year],[sub-category],sum([total sales]) [Total sales] from orderyear
where [order year] between '2014' and  '2015'
group by [sub-category],
[order year]
order by [order year]


select datepart(year,[order date])Order_year,[Sub-Category],sum([sales]) Total from orders
where datepart(year,[order date])between'2014' and '2015'
group by[Sub-Category],
datepart(year,[order date])
order by datepart(year,[order date])

------------------------------------------------------------------------------------------------------


------------------------------------------------------
 



select datepart(year,[order date])Order_year,[Sub-Category],sum([sales]) Total from orders
where datepart(year,[order date])between'2014' and '2015'
group by[Sub-Category],
datepart(year,[order date])

select [Sub-Category],

case
when datepart(year,[order date])='2014'then [Sales] else ''end as s2014,
case
when datepart(year,[order date])='2015'then [Sales] else ''end as s2015
from Orders




select datepart(year,[order date])Order_year,[Sub-Category],sum([sales]) Total from orders
where datepart(year,[order date])between'2014' and '2015'
group by[Sub-Category],
datepart(year,[order date])

select [Sub-Category],

case
when datepart(year,[order date])='2014'then [Sales] else ''end as s2014,
case
when datepart(year,[order date])='2015'then [Sales] else ''end as s2015
from Orders


with orderyear
as
(select datepart(year,[order date])Order_year,[Sub-Category],sum([sales]) Total from orders
where datepart(year,[order date])between'2014' and '2015'
group by[Sub-Category],
datepart(year,[order date]))

--select * from orderyear
--order by order_year 
--------------------------------------------------------------------------------------------

select [sub-category],

sum(case 
when order_year ='2014' then [total]  else ''end) as s2014,
sum(case 
when order_year ='2015' then [total]  else ''end) as s2015
--case 
--when order_year ='2016'then [total]  else ''end as s2016

from orderyear

select distinct datepart(year,[order date]) as [order Year] from  orders
order by [order year]  desc

--sub_category wise year wise total sales

select [Sub-Category],[2014],[2015],[2016],[2017]
from
(select [Sub-Category], datepart(year,[order date])Order_year,[Sales] from orders)
as source

pivot

(sum([sales])
for [order_year] in ([2014],[2015],[2016],[2017])) as pvt

--select * from Orders

--year wise ship mode 

select [Order_year], [Second class], [standard class],[first class],[Same day] from

(select datepart(year,[order date])Order_year,[ship mode] from Orders) as source

pivot
(count([ship mode])
for 
[ship mode] in ([second class],  [standard class],[first class],[same day])) as pvt
order by [order_year] 

--select * from orders

select datepart(year,[order date]) as [Order year],[ship mode],count([Ship Mode]) as [total] from Orders
group by [Ship Mode],
datepart(year,[order date])
order by datepart(year,[order date]) asc

--Promotion Effectiveness and Efficiency by Product Sub-Category


select DATEPART(year,[order date])[Order year],[Sub-Category],[Category], sum(sales)[Total ()],
sum(discount) [Total promo Discount($)],
round(sum(discount)*100/sum(sales),2)'Burn rate(%)' from Orders
where DATEPART(year,[order date])=2015 and [Order status]='Finished'
group by [Sub-Category],[Category],DATEPART(year,[order date])
order by [Order year]

select DATEPART(year,[order date])[Order year],[Sub-Category],[Category], sum(sales)[Total ()],
sum(discount) [Total promo Discount($)],
round(sum(discount)*100/sum(sales),2)'Burn rate(%)' from Orders
where DATEPART(year,[order date])=2016 and [Order status]='Finished'
group by [Sub-Category],[Category],DATEPART(year,[order date])
order by [Order year]

select DATEPART(year,[order date])[Order year],[Sub-Category],[Category], sum(sales)[Total ()],
sum(discount) [Total promo Discount($)],
round(sum(discount)*100/sum(sales),2)'Burn rate(%)' from Orders
where DATEPART(year,[order date])=2017and [Order status]='Finished'
group by [Sub-Category],[Category],DATEPART(year,[order date])
order by [Order year]

select DATEPART(year,[order date])[Order year],[Sub-Category],[Category], sum(sales)[Total ()],
sum(discount) [Total promo Discount($)],
round(sum(discount)*100/sum(sales),2)'Burn rate(%)' from Orders
where DATEPART(year,[order date])=2014and [Order status]='Finished'
group by [Sub-Category],[Category],DATEPART(year,[order date])
order by [Order year]

select [Sub-Category],[2014],[2015],[2016],[2017] from 
(select [Sub-Category], datepart(year,[order date] ) as [Order Year],[sales] from 
Orders) as source

pivot 
(sum(Sales)
for
[order year] in([2014],[2015],[2016],[2017])) as pvt 

select * from orders

--customer transaction per year

select datepart(year,[order date])[Order Year],count(distinct [customer id]) as  [number of customer]
from Orders
where [order status] ='finished'
group by datepart(year,[order date])

--The number of customers over the years tends to remain same, on an average 500 customers every year.
-------------------------------------------------------------------------------------------------------------------


--New customers over the years

	   select   datepart(year,[order date]) [year],count([order quantity])[New customers] from orders 
	   where [order quantity]=1 and [Order status]='finished'
	   group by datepart(year,[order date])
	   order by [year] asc
	   



