
-----------------------------------------------------------------------  'Creating Table bajaj1'  -----------------------------------------------------------------------------

CREATE TABLE bajaj1 (
    Date DATE,
    `Close Price` DOUBLE,
    `20 Day MA` DOUBLE,
    `50 Day MA` DOUBLE
);
 DROP TEMPORARY TABLE IF EXISTS temp;
 CREATE TEMPORARY TABLE if not exists temp
(SELECT Date,
		`Close Price`,
       ROW_NUMBER() OVER (ORDER BY Date ASC) RowNumber,
       AVG(`Close Price`) OVER (ORDER BY Date ASC ROWS 19 PRECEDING) AS `20 Day MA`,
       AVG(`Close Price`) OVER (ORDER BY Date ASC ROWS 49 PRECEDING) AS `50 Day MA`
       
FROM   `bajaj auto`);
insert into bajaj1 (Date,`Close Price`,`20 Day MA`,`50 Day MA`)
SELECT Date,
       `Close Price`,
       IF(RowNumber > 19, `20 Day MA`, NULL) `20 Day MA`,
       IF(RowNumber > 49, `50 Day MA`, NULL) `50 Day MA`
      
FROM   temp
ORDER BY Date;

SELECT 
    *
FROM
    bajaj1;


-------------------------------------------------------------- Creating Table eicher1 -----------------------------------------------------------------------------------------
CREATE TABLE eicher1 (
    Date DATE,
    `Close Price` DOUBLE,
    `20 Day MA` DOUBLE,
    `50 Day MA` DOUBLE
);
 DROP TEMPORARY TABLE IF EXISTS temp;
 CREATE TEMPORARY TABLE if not exists temp
(SELECT Date,
		`Close Price`,
       ROW_NUMBER() OVER (ORDER BY Date ASC) RowNumber,
       AVG(`Close Price`) OVER (ORDER BY Date ASC ROWS 19 PRECEDING) AS `20 Day MA`,
       AVG(`Close Price`) OVER (ORDER BY Date ASC ROWS 49 PRECEDING) AS `50 Day MA`
       
FROM   `eicher motors`);
insert into eicher1 (Date,`Close Price`,`20 Day MA`,`50 Day MA`)
SELECT Date,
       `Close Price`,
       IF(RowNumber > 19, `20 Day MA`, NULL) `20 Day MA`,
       IF(RowNumber > 49, `50 Day MA`, NULL) `50 Day MA`
      
FROM   temp
ORDER BY Date;

SELECT 
    *
FROM
    eicher1;
    
    
-------------------------------------------------------------- Creating Table hero1 -----------------------------------------------------------------------------------------
CREATE TABLE hero1 (
    Date DATE,
    `Close Price` DOUBLE,
    `20 Day MA` DOUBLE,
    `50 Day MA` DOUBLE
);
 DROP TEMPORARY TABLE IF EXISTS temp;
 CREATE TEMPORARY TABLE if not exists temp
(SELECT Date,
		`Close Price`,
       ROW_NUMBER() OVER (ORDER BY Date ASC) RowNumber,
       AVG(`Close Price`) OVER (ORDER BY Date ASC ROWS 19 PRECEDING) AS `20 Day MA`,
       AVG(`Close Price`) OVER (ORDER BY Date ASC ROWS 49 PRECEDING) AS `50 Day MA`
       
FROM   `hero motocorp`);
insert into hero1 (Date,`Close Price`,`20 Day MA`,`50 Day MA`)
SELECT Date,
       `Close Price`,
       IF(RowNumber > 19, `20 Day MA`, NULL) `20 Day MA`,
       IF(RowNumber > 49, `50 Day MA`, NULL) `50 Day MA`
      
FROM   temp
ORDER BY Date;

SELECT 
    *
FROM
    hero1;
    
-------------------------------------------------------------- Creating Table infosys1 -----------------------------------------------------------------------------------------
CREATE TABLE infosys1 (
    Date DATE,
    `Close Price` DOUBLE,
    `20 Day MA` DOUBLE,
    `50 Day MA` DOUBLE
);
 DROP TEMPORARY TABLE IF EXISTS temp;
 CREATE TEMPORARY TABLE if not exists temp
(SELECT Date,
		`Close Price`,
       ROW_NUMBER() OVER (ORDER BY Date ASC) RowNumber,
       AVG(`Close Price`) OVER (ORDER BY Date ASC ROWS 19 PRECEDING) AS `20 Day MA`,
       AVG(`Close Price`) OVER (ORDER BY Date ASC ROWS 49 PRECEDING) AS `50 Day MA`
       
FROM   `infosys`);
insert into infosys1 (Date,`Close Price`,`20 Day MA`,`50 Day MA`)
SELECT Date,
       `Close Price`,
       IF(RowNumber > 19, `20 Day MA`, NULL) `20 Day MA`,
       IF(RowNumber > 49, `50 Day MA`, NULL) `50 Day MA`
      
FROM   temp
ORDER BY Date;

SELECT 
    *
FROM
    infosys1;
    
-------------------------------------------------------------- Creating Table tcs -----------------------------------------------------------------------------------------
CREATE TABLE tcs1 (
    Date DATE,
    `Close Price` DOUBLE,
    `20 Day MA` DOUBLE,
    `50 Day MA` DOUBLE
);
 DROP TEMPORARY TABLE IF EXISTS temp;
 CREATE TEMPORARY TABLE if not exists temp
(SELECT Date,
		`Close Price`,
       ROW_NUMBER() OVER (ORDER BY Date ASC) RowNumber,
       AVG(`Close Price`) OVER (ORDER BY Date ASC ROWS 19 PRECEDING) AS `20 Day MA`,
       AVG(`Close Price`) OVER (ORDER BY Date ASC ROWS 49 PRECEDING) AS `50 Day MA`
       
FROM   `tcs`);
insert into tcs1 (Date,`Close Price`,`20 Day MA`,`50 Day MA`)
SELECT Date,
       `Close Price`,
       IF(RowNumber > 19, `20 Day MA`, NULL) `20 Day MA`,
       IF(RowNumber > 49, `50 Day MA`, NULL) `50 Day MA`
      
FROM   temp
ORDER BY Date;

SELECT 
    *
FROM
    tcs1;
    
-------------------------------------------------------------- Creating Table tvs -----------------------------------------------------------------------------------------
CREATE TABLE tvs1 (
    Date DATE,
    `Close Price` DOUBLE,
    `20 Day MA` DOUBLE,
    `50 Day MA` DOUBLE
);
 DROP TEMPORARY TABLE IF EXISTS temp;
 CREATE TEMPORARY TABLE if not exists temp
(SELECT Date,
		`Close Price`,
       ROW_NUMBER() OVER (ORDER BY Date ASC) RowNumber,
       AVG(`Close Price`) OVER (ORDER BY Date ASC ROWS 19 PRECEDING) AS `20 Day MA`,
       AVG(`Close Price`) OVER (ORDER BY Date ASC ROWS 49 PRECEDING) AS `50 Day MA`
       
FROM   `tvs motors`);
insert into tvs1 (Date,`Close Price`,`20 Day MA`,`50 Day MA`)
SELECT Date,
       `Close Price`,
       IF(RowNumber > 19, `20 Day MA`, NULL) `20 Day MA`,
       IF(RowNumber > 49, `50 Day MA`, NULL) `50 Day MA`
      
FROM   temp
ORDER BY Date;

SELECT 
    *
FROM
    tvs1;
-------------------------------------------------------------------- Creating Table bajaj2 ---------------------------------------------------------------------------------    
CREATE TABLE bajaj2 (
    Date DATE,
    `Close Price` DOUBLE,
    `Signal` VARCHAR(20)
);
    
insert into bajaj2 (Date,`Close Price`,`Signal`) 
WITH CTE_Bajaj2 (Date,`Close Price`,RowNumber,`20 Day MA`,`50 Day MA`)
AS
(
SELECT Date,
		`Close Price`,
       ROW_NUMBER() OVER (ORDER BY Date ASC) RowNumber,
       AVG(`Close Price`) OVER (ORDER BY Date ASC ROWS 19 PRECEDING) AS `20 Day MA`,
       AVG(`Close Price`) OVER (ORDER BY Date ASC ROWS 49 PRECEDING) AS `50 Day MA`
FROM   bajaj1
)
SELECT Date,
       `Close Price`,
       CASE
          WHEN RowNumber > 49 AND `20 Day MA` > `50 Day MA` and lag(`20 Day MA`,1,Null) over (order by Date asc) < lag(`50 Day MA`,1,Null) over (order by Date asc) THEN 'Buy'
          WHEN RowNumber > 49 AND `20 Day MA` < `50 Day MA` and lag(`20 Day MA`,1,Null) over (order by Date asc) > lag(`50 Day MA`,1,Null) over (order by Date asc) THEN 'Sell'
          ELSE 'Hold'
       END as `Signal`
FROM   CTE_Bajaj2
ORDER BY Date;

SELECT 
    *
FROM
    bajaj2;

-------------------------------------------------------------------- Creating Table eicher2 ---------------------------------------------------------------------------------    
CREATE TABLE eicher2 (
    Date DATE,
    `Close Price` DOUBLE,
    `Signal` VARCHAR(20)
);
    
insert into eicher2 (Date,`Close Price`,`Signal`) 
WITH CTE_eicher2 (Date,`Close Price`,RowNumber,`20 Day MA`,`50 Day MA`)
AS
(
SELECT Date,
		`Close Price`,
       ROW_NUMBER() OVER (ORDER BY Date ASC) RowNumber,
       AVG(`Close Price`) OVER (ORDER BY Date ASC ROWS 19 PRECEDING) AS `20 Day MA`,
       AVG(`Close Price`) OVER (ORDER BY Date ASC ROWS 49 PRECEDING) AS `50 Day MA`
FROM   eicher1
)
SELECT Date,
       `Close Price`,
       CASE
          WHEN RowNumber > 49 AND `20 Day MA` > `50 Day MA` and lag(`20 Day MA`,1,Null) over (order by Date asc) < lag(`50 Day MA`,1,Null) over (order by Date asc) THEN 'Buy'
          WHEN RowNumber > 49 AND `20 Day MA` < `50 Day MA` and lag(`20 Day MA`,1,Null) over (order by Date asc) > lag(`50 Day MA`,1,Null) over (order by Date asc) THEN 'Sell'
          ELSE 'Hold'
       END as `Signal`
FROM   CTE_eicher2
ORDER BY Date;

SELECT 
    *
FROM
    eicher2;

-------------------------------------------------------------------- Creating Table hero2 ---------------------------------------------------------------------------------    
CREATE TABLE hero2 (
    Date DATE,
    `Close Price` DOUBLE,
    `Signal` VARCHAR(20)
);
    
insert into hero2 (Date,`Close Price`,`Signal`) 
WITH CTE_hero2 (Date,`Close Price`,RowNumber,`20 Day MA`,`50 Day MA`)
AS
(
SELECT Date,
		`Close Price`,
       ROW_NUMBER() OVER (ORDER BY Date ASC) RowNumber,
       AVG(`Close Price`) OVER (ORDER BY Date ASC ROWS 19 PRECEDING) AS `20 Day MA`,
       AVG(`Close Price`) OVER (ORDER BY Date ASC ROWS 49 PRECEDING) AS `50 Day MA`
FROM   hero1
)
SELECT Date,
       `Close Price`,
       CASE
          WHEN RowNumber > 49 AND `20 Day MA` > `50 Day MA` and lag(`20 Day MA`,1,Null) over (order by Date asc) < lag(`50 Day MA`,1,Null) over (order by Date asc) THEN 'Buy'
          WHEN RowNumber > 49 AND `20 Day MA` < `50 Day MA` and lag(`20 Day MA`,1,Null) over (order by Date asc) > lag(`50 Day MA`,1,Null) over (order by Date asc) THEN 'Sell'
          ELSE 'Hold'
       END as `Signal`
FROM   CTE_hero2
ORDER BY Date;

SELECT 
    *
FROM
    hero2;
    
-------------------------------------------------------------------- Creating Table infosys2 ---------------------------------------------------------------------------------    
CREATE TABLE infosys2 (
    Date DATE,
    `Close Price` DOUBLE,
    `Signal` VARCHAR(20)
);
    
insert into infosys2 (Date,`Close Price`,`Signal`) 
WITH CTE_infosys2 (Date,`Close Price`,RowNumber,`20 Day MA`,`50 Day MA`)
AS
(
SELECT Date,
		`Close Price`,
       ROW_NUMBER() OVER (ORDER BY Date ASC) RowNumber,
       AVG(`Close Price`) OVER (ORDER BY Date ASC ROWS 19 PRECEDING) AS `20 Day MA`,
       AVG(`Close Price`) OVER (ORDER BY Date ASC ROWS 49 PRECEDING) AS `50 Day MA`
FROM   `infosys1`
)
SELECT Date,
       `Close Price`,
       CASE
          WHEN RowNumber > 49 AND `20 Day MA` > `50 Day MA` and lag(`20 Day MA`,1,Null) over (order by Date asc) < lag(`50 Day MA`,1,Null) over (order by Date asc) THEN 'Buy'
          WHEN RowNumber > 49 AND `20 Day MA` < `50 Day MA` and lag(`20 Day MA`,1,Null) over (order by Date asc) > lag(`50 Day MA`,1,Null) over (order by Date asc) THEN 'Sell'
          ELSE 'Hold'
       END as `Signal`
FROM   CTE_infosys2
ORDER BY Date;

SELECT 
    *
FROM
    infosys2;
    

-------------------------------------------------------------------- Creating Table tcs2 ---------------------------------------------------------------------------------    
CREATE TABLE tcs2 (
    Date DATE,
    `Close Price` DOUBLE,
    `Signal` VARCHAR(20)
);
    
insert into tcs2 (Date,`Close Price`,`Signal`) 
WITH CTE_tcs2 (Date,`Close Price`,RowNumber,`20 Day MA`,`50 Day MA`)
AS
(
SELECT Date,
		`Close Price`,
       ROW_NUMBER() OVER (ORDER BY Date ASC) RowNumber,
       AVG(`Close Price`) OVER (ORDER BY Date ASC ROWS 19 PRECEDING) AS `20 Day MA`,
       AVG(`Close Price`) OVER (ORDER BY Date ASC ROWS 49 PRECEDING) AS `50 Day MA`
FROM   `tcs1`
)
SELECT Date,
       `Close Price`,
       CASE
          WHEN RowNumber > 49 AND `20 Day MA` > `50 Day MA` and lag(`20 Day MA`,1,Null) over (order by Date asc) < lag(`50 Day MA`,1,Null) over (order by Date asc) THEN 'Buy'
          WHEN RowNumber > 49 AND `20 Day MA` < `50 Day MA` and lag(`20 Day MA`,1,Null) over (order by Date asc) > lag(`50 Day MA`,1,Null) over (order by Date asc) THEN 'Sell'
          ELSE 'Hold'
       END as `Signal`
FROM   CTE_tcs2
ORDER BY Date;

SELECT 
    *
FROM
    tcs2;


-------------------------------------------------------------------- Creating Table tvs2 ---------------------------------------------------------------------------------    
CREATE TABLE tvs2 (
    Date DATE,
    `Close Price` DOUBLE,
    `Signal` VARCHAR(20)
);
    
insert into tvs2 (Date,`Close Price`,`Signal`) 
WITH CTE_tvs2 (Date,`Close Price`,RowNumber,`20 Day MA`,`50 Day MA`)
AS
(
SELECT Date,
		`Close Price`,
       ROW_NUMBER() OVER (ORDER BY Date ASC) RowNumber,
       AVG(`Close Price`) OVER (ORDER BY Date ASC ROWS 19 PRECEDING) AS `20 Day MA`,
       AVG(`Close Price`) OVER (ORDER BY Date ASC ROWS 49 PRECEDING) AS `50 Day MA`
FROM   `tvs1`
)
SELECT Date,
       `Close Price`,
       CASE
          WHEN RowNumber > 49 AND `20 Day MA` > `50 Day MA` and lag(`20 Day MA`,1,Null) over (order by Date asc) < lag(`50 Day MA`,1,Null) over (order by Date asc) THEN 'Buy'
          WHEN RowNumber > 49 AND `20 Day MA` < `50 Day MA` and lag(`20 Day MA`,1,Null) over (order by Date asc) > lag(`50 Day MA`,1,Null) over (order by Date asc) THEN 'Sell'
          ELSE 'Hold'
       END as `Signal`
FROM   CTE_tvs2
ORDER BY Date;

SELECT 
    *
FROM
    tvs2;
 
-------------------------------------------------------------------- Creating master table stocks ----------------------------------------------------------------------------
CREATE TABLE stocks (
    Date DATE,
    Bajaj DOUBLE,
    TCS DOUBLE,
    TVS DOUBLE,
    Infosys DOUBLE,
    Eicher DOUBLE,
    Hero DOUBLE
);

insert into stocks (Date, Bajaj, TCS, TVS, Infosys, Eicher, Hero )

SELECT 
    b.Date,
    b.`Close Price`,
    t.`Close Price`,
    tv.`Close Price`,
    i.`Close Price`,
    e.`Close Price`,
    h.`Close Price`
FROM
    bajaj1 b
        LEFT JOIN
    tcs1 t ON t.Date = b.Date
        LEFT JOIN
    tvs1 tv ON tv.Date = b.Date
        LEFT JOIN
    infosys1 i ON i.Date = b.Date
        LEFT JOIN
    eicher1 e ON e.Date = b.Date
        LEFT JOIN
    hero1 h ON h.Date = b.Date
ORDER BY b.Date;
        
SELECT 
    *
FROM
    stocks;
    
----------------------------------------------------------------- Creating User-Defined_Function ---------------------------------------------------------------------------
create function bajaj_signal (D date)
	returns char(50) deterministic
	return (SELECT 
    `Signal`
FROM
    bajaj2
WHERE
    Date = D);

SELECT BAJAJ_SIGNAL('2015-05-18') AS `Signal`;