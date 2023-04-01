# WorkWithDateTimeValues
Examples of work with datetime values
When create some reports or processes, some tasks require the use of datetime filters.

First of all, let's consider how to upload a daily generated report in which one date (usually limiting the period at the end, example @endDate) will be fixed and linked to the date of the current day(GETDATE()), and the second date(usually limiting the period at the start, example @startDate) depends on the @endDate.
