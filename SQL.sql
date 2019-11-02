create table bajaj (Date varchar(50),	`Open Price` double	,`High Price` double	,`Low Price`	double	,`Close Price`	double	,`WAP`	double	,`No.of Shares` int,	`No. of Trades`	double,	`Total Turnover (Rs.)` double	,	`Deliverable Quantity`	int,`% Deli. Qty to Traded Qty`	double	,`Spread High-Low`	double	,`Spread Close-Open` double	
);
SET GLOBAL local_infile = 1;
SHOW VARIABLES LIKE 'local_infile';
LOAD DATA LOCAL INFILE 'C:/Users/lenovo/Desktop/Python/Upgrad/Assignment/Assignment/bajaj auto.csv' 
INTO TABLE bajaj
FIELDS TERMINATED BY ',' 
LINES TERMINATED BY '\n' 
IGNORE 1 ROWS 
(@Date,	`Open Price`,	`High Price`,	`Low Price`,	`Close Price`,	`WAP`,	`No.of Shares`,	`No. of Trades`,	`Total Turnover (Rs.)`,	`Deliverable Quantity`,	`% Deli. Qty to Traded Qty`,	`Spread High-Low`,	`Spread Close-Open`)
SET Date  = STR_TO_DATE(Date, '%m/%d/%y');
select * from `bajaj auto`;
alter table `bajaj auto`

modify `Deliverable Quantity` double;

update `bajaj auto`

set `Deliverable Quantity` = IF(`Deliverable Quantity` = '', NULL, `Deliverable Quantity`);

alter table `bajaj auto`

modify `% Deli. Qty to Traded Qty` double;

update `bajaj auto`

set `% Deli. Qty to Traded Qty` = IF(`% Deli. Qty to Traded Qty` = '', NULL, `% Deli. Qty to Traded Qty`);


update `bajaj auto`
set `Date` = str_to_date(`Date`,'%d-%M-%Y');

alter table `bajaj auto`

modify `Date` date;


select * , avg(`Close Price`) over (order by Date asc rows 19 preceding)
from bajaj
order by date;
CREATE TABLE bajaj1 (Date VARCHAR(50), `Close Price` double,
    `20 Day MA` double, `50 Day MA` double);
    

INSERT INTO bajaj1 (Date,`Close Price`)
SELECT b.Date,b.`Close Price`
FROM bajaj b;

select * from bajaj1;

CREATE TABLE bajaj2 (Date VARCHAR(50), `Close Price` double,
    `20 Day MA` double, `50 Day MA` double);
    
insert into bajaj2 (Date,`Close Price`,`20 Day MA`,`50 Day MA`) 
select Date,`Close Price`,avg(`Close Price`) over (order by Date rows 19 preceding ) ,
avg(`Close Price`) over (order by Date rows 49 preceding ) 
from bajaj ;

select * from bajaj2;
