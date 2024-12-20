WITH RentalCountOver5 AS (
    SELECT CAR_ID
    FROM CAR_RENTAL_COMPANY_RENTAL_HISTORY
    WHERE START_DATE BETWEEN '2022-08-01' AND '2022-10-31'
    GROUP BY CAR_ID
    HAVING COUNT(*) >= 5
)
SELECT MONTH(CRH.START_DATE) AS MONTH,
       CRH.CAR_ID,
       COUNT(*) AS RECORDS
FROM CAR_RENTAL_COMPANY_RENTAL_HISTORY AS CRH
JOIN RentalCountOver5 AS RC5
ON CRH.CAR_ID = RC5.CAR_ID
WHERE START_DATE BETWEEN '2022-08-01' AND '2022-10-31'
GROUP BY MONTH(CRH.START_DATE), CRH.CAR_ID
ORDER BY MONTH ASC, CRH.CAR_ID DESC;