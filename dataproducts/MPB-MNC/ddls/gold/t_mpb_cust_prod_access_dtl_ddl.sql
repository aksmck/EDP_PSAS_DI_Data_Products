CREATE TABLE IF NOT EXISTS $$unity_catalog_name.$$schema_name.$$delta_table_name (
  BUSINESS_UNIT STRING COMMENT 'Business Unit',
  SEGMENT STRING COMMENT 'Segment Name',
  CUST_ACCT_ID STRING COMMENT 'Customer Account ID; Source : CUST_ACCT_ID',
  PROD_NAME STRING COMMENT 'Product Name; Source : MPB_BRAND_NAME',
  MNC_PROD_ACCESS STRING COMMENT 'Membership Network Code; Source : MNC_CD',
  CMMN_GRP_ID STRING COMMENT 'Common Group ID; Source : CMMN_GRP_ID',
  CMMN_GRP_NAME STRING COMMENT 'Common Group Name; Source : CMMN_GRP_NAME',
  CMMN_ENTITY_ID STRING COMMENT 'Common Entity ID; Source : CMMN_ENTITY_ID',
  CMMN_ENTITY_NAME STRING COMMENT 'Common Entity Name; Source : CMMN_ENTITY_NAME',
  CUST_ACCT_NAME STRING COMMENT 'Customer Account Name; Source : CUST_ACCT_NAME',
  CHN_ID STRING COMMENT 'Chain ID; Source : CHN_ID',
  CHN_NAME STRING COMMENT 'Chain Name; Source : CHN_NAME',
  NATL_GRP_CD STRING COMMENT 'National Group Code; Source : NATL_GRP_CD',
  NATL_GRP_NAME STRING COMMENT 'National Group Name; Source : NATL_GRP_NAME',
  NATL_SUB_GRP_CD STRING COMMENT 'National Sub Group Code; Source : NATL_SUB_GRP_CD',
  NATL_SUB_GRP_NAME STRING COMMENT 'National Sub Group Name; Source : NATL_SUB_GRP_NAME',
  ACCT_CLASS_CD STRING COMMENT 'Account Classification Code; Source : ACCT_CLASS_CD',
  ACCT_CLASS_DESC STRING COMMENT 'Account Classification Description; Source : ACCT_CLASS_DESC',
  COT_KEY STRING COMMENT 'Class of Trade Key; Source : COT_KEY',
  COT_DESC STRING COMMENT 'Class of Trade Description; Source : COT_DESC',
  DEA_NUM STRING COMMENT 'DEA Number; Source : DEA_NUM',
  CUST_REGION_NUM STRING COMMENT 'Customer Region Number; Source : CUST_REGION_NUM',
  CUST_REGION_NAME STRING COMMENT 'Customer Region Name; Source : CUST_REGION_NAME',
  STATE STRING COMMENT 'State; Source : ACCT_DLVRY_ST_ABRV',
  CUST_PROD_ACCESS_INDICATOR STRING COMMENT 'Customer Product Access Indicator',
  CMMN_ENTITY_PROD_ACCESS_INDICATOR STRING COMMENT 'Common Entity Product Access Indicator',
  PROD_ACCESS_CTGRY STRING COMMENT 'Product Access Category; Source : PROD_ACCESS_CTGRY',
  THRPUTC_CLASS STRING COMMENT 'Therapeutic Class; Source : THRPTC_CLASS',
  LKG_FLG BOOLEAN COMMENT 'Leakage Flag; Source : Leakage Brands',
  RECORD_LOAD_TIME TIMESTAMP DEFAULT CURRENT_TIMESTAMP COMMENT 'This is the default generated column using current timestamp when the record is loaded in the table',
  DATABRICKS_RUN_ID STRING COMMENT 'run id of the Databricks job run. This gets generated from the silver notebook run',
  DATABRICKS_JOB_ID STRING COMMENT 'job id of the Databricks job run. This gets generated from the silver notebook run',
  INSERT_TS TIMESTAMP COMMENT 'Timestamp when the Record was Inserted',
  UPDATE_TS TIMESTAMP COMMENT 'Timestamp when the Record was Inserted'
)USING DELTA LOCATION '$$delta_table_location' TBLPROPERTIES (
'delta.feature.allowColumnDefaults' = 'supported',
'delta.feature.appendOnly' = 'supported',
'delta.feature.invariants' = 'supported',
'delta.minReaderVersion' = '1',
'delta.minWriterVersion' = '7',
'delta.enableChangeDataFeed' = true,
'spark.sql.files.ignoreMissingFiles' = true,
'delta.autoOptimize.optimizeWrite' = true);