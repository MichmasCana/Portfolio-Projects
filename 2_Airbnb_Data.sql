select *
from airbnb_data;

create table staging_airbnb
like airbnb_data;

select *
from staging_airbnb;

insert staging_airbnb
select *
from airbnb_data;

select *
from staging_airbnb;

select *
from staging_airbnb
where `NAME` = '';

update staging_airbnb
set `NAME` = 'Unnamed'
where `NAME` = '';

select count(`host id`), count(distinct `host id`)
from staging_airbnb;

create procedure bnb()
select *
from staging_airbnb;

call bnb();

select *
from staging_airbnb
where `host name` = '';

update staging_airbnb
set `host name` = 'Unnamed'
where `host name` = '';

select distinct `neighbourhood group`
from staging_airbnb;

select *
from staging_airbnb
where `neighbourhood group` is null;

select *
from staging_airbnb
where neighbourhood = '';

update staging_airbnb
set `neighbourhood group` = 'The Bronx'
where `neighbourhood group` = 'Bronx';

update staging_airbnb
set `neighbourhood group` = null
where `neighbourhood group` = '';

call bnb();

select tb1.`neighbourhood group`, tb2.`neighbourhood group`
from staging_airbnb as tb1
join staging_airbnb as tb2
	on tb1.neighbourhood = tb2.neighbourhood
    where tb1.`neighbourhood group` is null and tb2.`neighbourhood group` is not null;
    
update staging_airbnb as tb1
join staging_airbnb as tb2
	on tb1.neighbourhood = tb2.neighbourhood
set tb1.`neighbourhood group` = tb2.`neighbourhood group`
    where tb1.`neighbourhood group` is null and tb2.`neighbourhood group` is not null;
    
update staging_airbnb
set `neighbourhood group` = 'Queens'
where `neighbourhood group` is null and neighbourhood = 'Woodside';

call bnb();

select distinct neighbourhood
from staging_airbnb
order by 1;

select distinct `country`
from staging_airbnb;

select *
from staging_airbnb
where country is null;

update staging_airbnb
set country = null
where country = '';

select t1.country, t2.country
from staging_airbnb as t1
join staging_airbnb as t2
	on t1.`neighbourhood group`	 = t2.`neighbourhood group`
    where t1.country is null and t2.country is not null;
    
update staging_airbnb as t1
join staging_airbnb as t2
	on t1.`neighbourhood group`	 = t2.`neighbourhood group`
set t1.country = t2.country
where t1.country is null and t2.country is not null;

call bnb();

select distinct `country code`
from staging_airbnb;

select *
from staging_airbnb
where `country code` = '';

update staging_airbnb
set `country code` = 'US'
where `country code` = '';

select `Construction year`
from staging_airbnb;

update staging_airbnb
set `Construction year` = null
where `Construction year` = '';

call bnb();

select *
from staging_airbnb
where `Construction year` = '';

alter table staging_airbnb
modify column `Construction year` int;

select price
from staging_airbnb;

update staging_airbnb
set price = substring(price, 2);

alter table staging_airbnb
modify column price int;

select replace(price, ',', '')
from staging_airbnb;

update staging_airbnb
set price = replace(price, ',', '');

update staging_airbnb
set price = null
where price = '';

alter table staging_airbnb
modify column price int;

call bnb();

select substring(`service fee`, 2)
from staging_airbnb;

update staging_airbnb
set `service fee` = substring(`service fee`, 2);

update staging_airbnb
set `service fee` = null
where `service fee` = '';

select `service fee`
from staging_airbnb
where `service fee` like '%,%';

alter table staging_airbnb
modify column `service fee` int;

select distinct `minimum nights`
from staging_airbnb;

update staging_airbnb
set `minimum nights` = null
where `minimum nights` = '';

alter table staging_airbnb
modify column `minimum nights` int;

select *
from staging_airbnb
where `number of reviews` = '';

update staging_airbnb
set `number of reviews` = null
where `number of reviews` = '';

alter table staging_airbnb
modify column `number of reviews` int;

call bnb();

update staging_airbnb
set `last review` = null
where `last review` = '';

select str_to_date(`last review`, '%m/%d/%Y')
from staging_airbnb;

update staging_airbnb
set `last review` = str_to_date(`last review`, '%m/%d/%Y');

select distinct `availability 365`
from staging_airbnb
order by 1;

update staging_airbnb
set `availability 365` = null
where `availability 365` = '';

alter table staging_airbnb
modify column `review rate number` int, 
modify column `calculated host listings count` int, 
modify column `availability 365` int;

select house_rules
from staging_airbnb;

alter table staging_airbnb
drop column house_rules,
drop column license;