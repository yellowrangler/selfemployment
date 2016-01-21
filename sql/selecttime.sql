SELECT enterdate, SUM(timeinterval) AS dayInterval
FROM projectdailytimetbl
where projectid = 2
GROUP BY enterdate

