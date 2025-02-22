TRUNCATE TABLE $$target_table_name;
INSERT INTO $$target_table_name (
  THRPUTC_CLASS_CD,
  THRPUTC_CLASS_DSCRPTN,
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
  source.THERA_CLS_CD,
  source.THERA_CLS_DSCR,
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
FROM $$bronze_temp_table_name AS source;