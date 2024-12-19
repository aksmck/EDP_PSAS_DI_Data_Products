TRUNCATE TABLE $$target_table_name;
INSERT INTO $$target_table_name (
  CLIENT,
  APPLICATION,
  EXCLSN_TYPE,
  SLS_ORG,
  CHN_CD,
  NATL_GRP_CD,
  NATL_SUB_GRP_CD,
  MNC_CD,
  EXPR_DT,
  EFFCTV_DT,
  _rescued_data,
  ADF_RUN_ID,
  ADF_JOB_ID,
  RECORD_LOAD_TIME,
  INPUT_FILE_NAME,
  DATABRICKS_RUN_ID,
  DATABRICKS_JOB_ID,
  INSERT_TS,
  UPDATE_TS,
  INTEGRATION_KEY,
  DATE_PART,
  HOUR_PART
)
SELECT
  source.MANDT,
  source.KAPPL,
  source.KSCHL,
  source.VKORG,
  source.YYKONZS,
  source.YYBRAN1,
  source.YYBRAN2,
  source.YYMEM_NETWRK,
  to_date(source.DATBI, 'yyyy.MM.dd'),
  to_date(source.DATAB, 'yyyy.MM.dd'),
  source._rescued_data,
  source.ADF_RUN_ID,
  source.ADF_JOB_ID,
  current_timestamp(),
  source.INPUT_FILE_NAME,
  '$$DATABRICKS_RUN_ID',
  '$$DATABRICKS_JOB_ID',
  current_timestamp(),
  current_timestamp(),
  source.INTEGRATION_KEY,
  DATE(current_timestamp()),
  HOUR(current_timestamp())
FROM
  $$bronze_temp_table_name AS source;