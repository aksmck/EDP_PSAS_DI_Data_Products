TRUNCATE TABLE $$target_table_name;
WITH MaxRank AS (
  SELECT
    MAX(LKG_RANK) AS Max_LKG_RANK
  FROM
    $$psas_catalog.gold_sales.VW_MPB_LKG_SITE_PRODUCTS
  WHERE
    MPB_SGMNT = 'ACUTE'
    AND upper(PROD_CTGRY) = 'SPECIALTY'
    AND upper(PROD_ACCESS_CTGRY) IN ('APPROVAL', 'COT', 'REMS')
    AND CAST(YR_MTH AS DATE) > (
      SELECT ADD_MONTHS(MAX(CAST(YR_MTH AS DATE)), -3)
      FROM $$psas_catalog.gold_sales.VW_MPB_LKG_SITE_PRODUCTS
      WHERE
        MPB_SGMNT = 'ACUTE'
        AND upper(PROD_CTGRY) = 'SPECIALTY'
        AND upper(PROD_ACCESS_CTGRY) IN ('APPROVAL', 'COT', 'REMS')
    )
),
ITEM AS (
  SELECT DISTINCT 
    MPB_BRND_NAME as BRAND_NAME, 
    MNC_CD
  FROM 
    $$psas_catalog.gold_master.t_item_mstr 
  WHERE 
    CURRENT_RECORD_IND = 'Y' 
    AND ITEM_ACTVY_CD = 'A'
    AND MNC_CD NOT IN ('NEW', 'CLN')
),
Leakage AS (
  SELECT
    DISTINCT
    UPPER(SLS_REP) AS SALES_REP,
    CMMN_GRP_ID,
    UPPER(CMMN_GRP_DSC) AS CMMN_GRP_DSC,
    CMMN_ENTITY_ID,
    UPPER(CMMN_ENTITY_DSC) AS CMMN_ENTITY_DSC,
    UPPER(PROD_NAME) AS BRAND,
    LKG_RANK AS LEAKAGE_RANK,
    UPPER(PROD_ACCESS_CTGRY) AS PRODUCT_ACCESS_CATEGORY,
    UPPER(YR_MTH) AS YEAR_MONTH,
    2000 - (LKG_RANK - 1) * 10 AS LEAKAGE_WEIGHT
  FROM
    $$psas_catalog.gold_sales.VW_MPB_LKG_SITE_PRODUCTS,
    MaxRank
  WHERE
    MPB_SGMNT = 'ACUTE'
    AND upper(PROD_CTGRY) = 'SPECIALTY'
    AND upper(PROD_ACCESS_CTGRY) IN ('APPROVAL', 'COT', 'REMS')
    AND CAST(YR_MTH AS DATE) > (
      SELECT ADD_MONTHS(MAX(CAST(YR_MTH AS DATE)), -3)
      FROM $$psas_catalog.gold_sales.VW_MPB_LKG_SITE_PRODUCTS
      WHERE
        MPB_SGMNT = 'ACUTE'
        AND upper(PROD_CTGRY) = 'SPECIALTY'
        AND upper(PROD_ACCESS_CTGRY) IN ('APPROVAL', 'COT', 'REMS')
    )
),
Final AS (
  SELECT 
    lkg.SALES_REP AS SLS_REP,
    lkg.CMMN_GRP_ID,
    lkg.CMMN_GRP_DSC AS CMMN_GRP_NAME,
    lkg.CMMN_ENTITY_ID,
    lkg.CMMN_ENTITY_DSC AS CMMN_ENTITY_NAME,
    lkg.BRAND AS PROD_NAME,     
    COALESCE(ITEM.MNC_CD, '***') AS MNC_PROD_ACCESS,
    lkg.LEAKAGE_RANK AS LKG_RANK,
    lkg.PRODUCT_ACCESS_CATEGORY AS PROD_ACCESS_CTGRY,
    lkg.YEAR_MONTH AS YR_MTH,
    lkg.LEAKAGE_WEIGHT AS LKG_RANK_WGHT
  FROM 
    Leakage AS lkg
  LEFT JOIN
    ITEM ON UPPER(ITEM.BRAND_NAME) = UPPER(lkg.BRAND)
)
INSERT INTO
  $$target_table_name (
    SLS_REP,
    CMMN_GRP_ID,
    CMMN_GRP_NAME,
    CMMN_ENTITY_ID,
    CMMN_ENTITY_NAME,
    PROD_NAME,
    MNC_PROD_ACCESS,
    LKG_RANK,
    PROD_ACCESS_CTGRY,
    YR_MTH,
    LKG_RANK_WGHT,
    BUSINESS_UNIT,
    SEGMENT,
    RECORD_LOAD_TIME,
    DATABRICKS_RUN_ID,
    DATABRICKS_JOB_ID,
    INSERT_TS,
    UPDATE_TS
  )
SELECT
    SLS_REP,
    CMMN_GRP_ID,
    CMMN_GRP_NAME,
    CMMN_ENTITY_ID,
    CMMN_ENTITY_NAME,
    PROD_NAME,
    MNC_PROD_ACCESS,
    LKG_RANK,
    PROD_ACCESS_CTGRY,
    YR_MTH,
    LKG_RANK_WGHT,
    'PSAS' AS BUSINESS_UNIT,
    'US PHARMA' AS SEGMENT,
    CURRENT_TIMESTAMP() AS RECORD_LOAD_TIME,
    '$$DATABRICKS_RUN_ID' AS DATABRICKS_RUN_ID,
    '$$DATABRICKS_JOB_ID' AS DATABRICKS_JOB_ID,
    CURRENT_TIMESTAMP() AS INSERT_TS,
    CURRENT_TIMESTAMP() AS UPDATE_TS
FROM
  Final;