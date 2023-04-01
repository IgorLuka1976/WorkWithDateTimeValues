DECLARE @startDate DATE, @endDate DATE



----question: How to get the result of dates in @startDate,which only the first days of the month equal to the month of @endDate,
-------------and provided that when the first day of @endDate occurs, @startDate also includes the first number, but already of the previous month in relation to the @endDate.

----example Without problem, when in @endDate not consist of first date of month

SET @endDate='2023-03-22'

SET @startDate=DATEADD(DD,1,EOMONTH(@endDate,-1)) 

SELECT @startDate,@endDate ---Result: 2023-03-01,2023-03-22

----problem, when in @endDate consist of first date of month

SET @endDate='2023-04-01'

SET @startDate=DATEADD(DD,1,EOMONTH(@endDate,-1)) 

SELECT @startDate,@endDate ---Result: 2023-04-01,2023-04-01

-----=================Decision

SET @endDate='2023-04-01'

IF DAY(@endDate)>1

  SET @startDate=DATEADD(DD,1,EOMONTH(@endDate,-1)) 

ELSE 
  
  SET @startDate=DATEADD(MONTH,-1,@endDate)

SELECT @startDate,@endDate ---Result: 2023-03-01,2023-04-01

------check: when in @endDate not consist of first date of month

SET @endDate='2023-03-22'

IF DAY(@endDate)>1

  SET @startDate=DATEADD(DD,1,EOMONTH(@endDate,-1)) 

ELSE 
  
  SET @startDate=DATEADD(MONTH,-1,@endDate)

SELECT @startDate,@endDate ---Result: 2023-03-01,2023-03-22

----=====Now it is Ok!