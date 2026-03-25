/*The Task: Database Inventory Audit
Scenario: You’ve just joined a new team. 
You need to quickly find out which tables exist, how many columns they have, 
and which ones store "Salary" information.
*/

SELECT

    table_name,
    table_type
FROM
    information_schema.tables
WHERE
    table_schema = 'main';

SELECT
    table_name,
    column_name,
    data_type
FROM
    information_schema.columns
WHERE  
    column_name = '%salary%';


SELECT
    table_name,
    COUNT (column_name) AS column_count
FROM
    information_schema.columns
GROUP BY
    table_name
ORDER BY
    column_count DESC;