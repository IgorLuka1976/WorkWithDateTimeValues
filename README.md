# WorkWithDateTimeValues
Examples of work with datetime values
When create some reports or processes, some tasks require the use of datetime filters.

   1.First of all, let's consider how to upload a daily generated report in which one date (usually limiting the period at the end, example @endDate) will be fixed and linked to the date of the current day(GETDATE()), and the second date(usually limiting the period at the start, example @startDate) depends on the @endDate.
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

----==============================================================------
In the folder: 1.DateTime Automatic Generated Period offers a solution.
----==============================================================------
