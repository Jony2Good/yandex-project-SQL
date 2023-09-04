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
AND EXTRACT(YEAR FROM ACQUIRED_AT) BETWEEN 2011 AND 2013;

4. Отобразите имя, фамилию и названия аккаунтов людей в твиттере, у которых названия аккаунтов начинаются на 'Silver'.

SELECT FIRST_NAME,
LAST_NAME,
TWITTER_USERNAME
FROM PEOPLE
WHERE TWITTER_USERNAME like 'Silver%';

 5. Выведите на экран всю информацию о людях, у которых
    названия аккаунтов в твиттере содержат подстроку 'money', а фамилия начинается на 'K'.

SELECT *
FROM PEOPLE
WHERE TWITTER_USERNAME like '%money%'
	AND LAST_NAME like 'K%';

6. Для каждой страны отобразите общую сумму привлечённых инвестиций, которые получили компании,
    зарегистрированные в этой стране. Страну, в которой зарегистрирована компания,
    можно определить по коду страны. Отсортируйте данные по убыванию суммы.

SELECT COUNTRY_CODE,
	SUM(FUNDING_TOTAL) AS TOTAL
FROM COMPANY
GROUP BY COUNTRY_CODE
ORDER BY TOTAL DESC

7. Составьте таблицу, в которую войдёт дата проведения раунда, а также минимальное и максимальное значения суммы инвестиций, привлечённых в эту дату.
Оставьте в итоговой таблице только те записи, в которых минимальное значение суммы инвестиций не равно нулю и не равно максимальному значению.

SELECT founded_at,
MIN(funding_total),
MAX(funding_total)
FROM company
GROUP BY founded_at
HAVING MIN(funding_total) > 0 AND MIN(funding_total) != MAX(funding_total);




























