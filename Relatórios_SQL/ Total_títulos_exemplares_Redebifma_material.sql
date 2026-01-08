SELECT 
    IF(ISNULL(itype), "TOTAL", itype) AS "Tipo de Material",
    COUNT(DISTINCT biblionumber) AS "Total de Títulos",
    COUNT(itemnumber) AS "Total de Exemplares"
FROM items
WHERE dateaccessioned <= <<Até a data|date>>
GROUP BY itype WITH ROLLUP