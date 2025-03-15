-- EXPLORATORY DATA ANALYSIS ON NIGERIAN ECONOMY FROM 1990 - 2023 BY DEBORAH OKOROH DAVID

CREATE DATABASE `nigeria_economy`;

USE nigeria_economy;

-- DATASET STRUCTURE (table name is 'data')
DESCRIBE data;
/*There are 10 fields in the dataset. One field has a date datatype and the remaining 9 are float (decimal) datatype.
COLUMN NAMES ARE:
Years
Inflation_rate
Unemployment
Government_debt
Agriculture
Industry
Services
GDP2010_Constant_Basic_Prices
NetTaxesOnProducts
GDP2010_ConstantMarketPrices */


-- COUNT TOTAL NUMBER OF RECORDS AND FIELDS IN THE DATASET
SELECT COUNT(*) AS total_rows FROM data;
-- Total number of records are 34.

SELECT COUNT(*) AS total_columns
FROM INFORMATION_SCHEMA.COLUMNS
WHERE table_name = 'data';
-- Total number of fields are 10.

-- DATA INTEGRITY: The data will be checked for missing values, duplicate values, and unique values.

-- Missing values check
SELECT 
SUM(Years IS NULL) AS missing_value,
SUM(Inflation_rate IS NULL) AS missing_value,
SUM(Unemployment IS NULL) AS missing_value,
SUM(Government_debt IS NULL) AS missing_value,
SUM(Agriculture IS NULL) AS missing_value,
SUM(Industry IS NULL) AS missing_value,
SUM(Services IS NULL) AS missing_value,
SUM(GDP2010_Constant_Basic_Prices IS NULL) AS missing_value,
SUM(NetTaxesOnProducts IS NULL) AS missing_value,
SUM(GDP2010_ConstantMarketPrices IS NULL) AS missing_value
FROM data;
-- There are no missing values in each rows.

-- Duplicate values check
SELECT *, 
COUNT(*) AS count
FROM data
GROUP BY Years, Inflation_rate, Unemployment, Government_debt, Agriculture, Industry, Services, GDP2010_Constant_Basic_Prices,
NetTaxesOnProducts, GDP2010_ConstantMarketPrices
HAVING count > 1;
-- There are no duplicate values in each field.


-- Unique values check
SELECT  
COUNT(DISTINCT Years) AS unique_value,
COUNT(DISTINCT Inflation_rate) AS unique_value,
COUNT(DISTINCT Unemployment) AS unique_value,
COUNT(DISTINCT Government_debt) AS unique_value,
COUNT(DISTINCT Agriculture) AS unique_value,
COUNT(DISTINCT Industry) AS unique_value,
COUNT(DISTINCT Services) AS unique_value,
COUNT(DISTINCT GDP2010_Constant_Basic_Prices) AS unique_value,
COUNT(DISTINCT NetTaxesOnProducts) AS unique_value,
COUNT(DISTINCT GDP2010_ConstantMarketPrices) AS unique_value
FROM data;
-- Seven out of ten columns has 34 unique values, two columns has 33 unique values, and one column have 19 unique values.
-- There is no categorical column in this dataset. All columns are numerical and date datatypes.


-- DESCRIPTIVE STATISTICS: This gives insight into the mean, max, min, and standard deviation of the 9 numerical column
SELECT 

    AVG(Inflation_rate) AS Inflation_rate_mean,
    MIN(Inflation_rate) AS Inflation_rate_min,
    MAX(Inflation_rate) AS Inflation_rate_max,
    STDDEV(Inflation_rate) AS Inflation_rate_std_dev,

    AVG(Unemployment) AS Unemployment_mean,
    MIN(Unemployment) AS Unemployment_min,
    MAX(Unemployment) AS Unemployment_max,
    STDDEV(Unemployment) AS Unemployment_std_dev,

    AVG(Government_debt) AS Government_debt_mean,
    MIN(Government_debt) AS Government_debt_min,
    MAX(Government_debt) AS Government_debt_max,
    STDDEV(Government_debt) AS Government_debt_std_dev,

    AVG(Agriculture) AS Agriculture_mean,
    MIN(Agriculture) AS Agriculture_min,
    MAX(Agriculture) AS Agriculture_max,
    STDDEV(Agriculture) AS Agriculture_std_dev,

    AVG(Industry) AS Industry_mean,
    MIN(Industry) AS Industry_min,
    MAX(Industry) AS Industry_max,
    STDDEV(Industry) AS Industry_std_dev,

    AVG(Services) AS Services_mean,
    MIN(Services) AS Services_min,
    MAX(Services) AS Services_max,
    STDDEV(Services) AS Services_std_dev,

    AVG(GDP2010_Constant_Basic_Prices) AS GDP2010_Constant_Basic_Prices_mean,
    MIN(GDP2010_Constant_Basic_Prices) AS GDP2010_Constant_Basic_Prices_min,
    MAX(GDP2010_Constant_Basic_Prices) AS GDP2010_Constant_Basic_Prices_max,
    STDDEV(GDP2010_Constant_Basic_Prices) AS GDP2010_Constant_Basic_Prices_std_dev,

    AVG(NetTaxesOnProducts) AS NetTaxesOnProducts_mean,
    MIN(NetTaxesOnProducts) AS NetTaxesOnProducts_min,
    MAX(NetTaxesOnProducts) AS NetTaxesOnProducts_max,
    STDDEV(NetTaxesOnProducts) AS NetTaxesOnProducts_std_dev,

    AVG(GDP2010_ConstantMarketPrices) AS GDP2010_ConstantMarketPrices_mean,
    MIN(GDP2010_ConstantMarketPrices) AS GDP2010_ConstantMarketPrices_min,
    MAX(GDP2010_ConstantMarketPrices) AS GDP2010_ConstantMarketPrices_max,
    STDDEV(GDP2010_ConstantMarketPrices) AS GDP2010_ConstantMarketPrices_std_dev
FROM data;
/*
Inflation Rate
Mean - 18.1%
Minimum value - 5.4%
Maximum value - 72.9%
Standard Deviation - 15.7%

Unemployment
Mean - 10%
Minimum value - 4%
Maximum value - 41%
Standard Deviation - 11.1%

Government Debt
Mean - 33.9%
Minimum value - 7.3%
Maximum value - 75%
Standard Deviation - 20%

Agriculture (Naira)
Mean - N10,168
Minimum value - N3,465
Maximum value - N19,091
Standard Deviation - N5,530

Industry (Naira)
Mean - N12,804
Minimum value - N3,736
Maximum value - N16,742
Standard Deviation - N2,581

Services (Naira)
Mean - N20,524
Minimum value - N6,850
Maximum value - N41,353
Standard Deviation - N12,303

GDP 2010 Constant Basic Prices (Naira)
Mean - N43,496
Minimum value - N17,750
Maximum value - N74,639
Standard Deviation - N19,941

Net Taxes On Products (Naira)
Mean - N492
Minimum value - N217
Maximum value - N1,129
Standard Deviation - N263

GDP 2010 Constant Market Prices (Naira)
Mean - N43,989
Minimum value - N17,994
Maximum value - N75,769
Standard Deviation - N20,193
*/


-- RELATIONSHIPS BETWEEN VARIABLES
-- GDP2010 CONSTANT BASIC PRICES AND GDP2010 CONSTANT MARKET PRICES
SELECT 
    (AVG(GDP2010_Constant_Basic_Prices * GDP2010_ConstantMarketPrices) - AVG(GDP2010_Constant_Basic_Prices) * AVG(GDP2010_ConstantMarketPrices)) / (STDDEV(GDP2010_Constant_Basic_Prices) * STDDEV(GDP2010_ConstantMarketPrices)) AS correlation 
FROM data;
/* The correlation coefficient between GDP2010_Constant_Basic_Prices and GDP2010_Constant_Market_Prices is 0.999993, 
indicating an almost perfect positive linear relationship. This suggests that increases in GDP2010_Constant_Basic_Prices are 
almost always accompanied by corresponding increases in GDP2010_Constant_Market_Prices.*/

-- INFLATION RATE AND NET TAXES ON PRODUCTS CORRELATION
SELECT 
     (AVG(Inflation_rate * NetTaxesOnProducts) - AVG(inflation_rate) * AVG(NetTaxesOnProducts)) / (STDDEV(Inflation_rate) * STDDEV(NetTaxesOnProducts)) AS correlation 
     FROM data;
/*The correlation coefficient between inflation rate and Net taxes on products is -0.3316, indicating a moderate negative relationship. 
This suggests that as Inflation rate increases, Net taxes on products tends to decrease somewhat, though other factors may also play 
a role in this relationship.*/



