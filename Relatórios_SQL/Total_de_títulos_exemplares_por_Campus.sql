SELECT 
    IF(itemtypes.description IS NULL, 
       CONCAT("TOTAL - ", (SELECT branchname FROM branches WHERE branchcode = <<Campus|branches>>)), 
       itemtypes.description) AS "Tipo de Material",
    COUNT(DISTINCT items.biblionumber) AS "Total de Títulos",
    COUNT(items.itemnumber) AS "Total de Exemplares"
FROM items
LEFT JOIN itemtypes ON (items.itype = itemtypes.itemtype)
WHERE items.homebranch = <<Campus|branches>>
  AND items.dateaccessioned <= <<Até a data|date>>
GROUP BY itemtypes.description WITH ROLLUP