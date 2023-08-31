1. Посчитайте сколько компаний закрылось.

SELECT NAME,
COUNT(ID) as closed
FROM COMPANY
WHERE STATUS = 'closed'
GROUP BY NAME

2. Отобразите количество привлечённых средств для новостных компании США.

SELECT FUNDING_TOTAL
FROM COMPANY
WHERE CATEGORY_CODE = 'news' AND COUNTRY_CODE = 'USA'
ORDER BY FUNDING_TOTAL DESC;

3.Найдите общую сумму сделок по покупке одних компаний другими в долларах.
Отберите сделки, которые осуществлялись только за наличные с 2011 по 2013 год включительно.

SELECT SUM(PRICE_AMOUNT)
FROM ACQUISITION
WHERE TERM_CODE = 'cash'
AND EXTRACT(YEAR FROM ACQUIRED_AT) IN (2011,2012,2013);