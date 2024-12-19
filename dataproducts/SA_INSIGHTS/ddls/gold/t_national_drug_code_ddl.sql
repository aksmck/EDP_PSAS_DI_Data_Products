CREATE TABLE IF NOT EXISTS $$unity_catalog_name.$$schema_name.$$delta_table_name
(
  BUSINESS_UNIT STRING,
  SEGMENT_NAME STRING,
  SOURCE_SYSTEM_NAME STRING,
  NDC_SKEY bigint GENERATED BY DEFAULT AS IDENTITY,
  NDC_NUM STRING COMMENT 'National Drug Code Unique Identifier/Number; SOURCE: NDC_NUM',
  GNRC_NAME STRING COMMENT 'Generic Name of the Drug; SOURCE: GNRC_NAME',
  PREV_NDC_NUM STRING COMMENT 'Previous National Drug Code Number; SOURCE: PREV_NDC_NUM',
  OBSOLETE_DT TIMESTAMP COMMENT 'Obsolete Date of the NDC; SOURCE: OBSOLETE_DT',
  DOSE_FRM_DSCRPTN STRING COMMENT 'Description of the Dose Form; SOURCE: DOSE_FRM_DSCRPTN',
  DRG_STRNTH_DSCRPTN STRING COMMENT 'Description of the Drug Strength; SOURCE: DRG_STRNTH_DSCRPTN',
  GNRC_NDCTR STRING COMMENT 'Indicator for whether the Drug is generic; SOURCE: GNRC_NDCTR',
  GNRC_CD_NUM STRING COMMENT 'Generic Code Number of the Drug; SOURCE: GNRC_CD_NUM',
  THRPUTC_CLASS_CD STRING COMMENT 'Therapeutic Class Code; SOURCE: THRPUTC_CLASS_CD',
  SPECIF_THRPUTC_CLASS_CD STRING COMMENT 'Specific Therapeutic Class Code; SOURCE: SPECIF_THRPUTC_CLASS_CD',
  PKG_SZ DECIMAL(38,18) COMMENT 'Package Size; SOURCE: PKG_SZ',
  DRG_FRM_CD STRING COMMENT 'Drug Form Code; SOURCE: DRG_FRM_CD',
  ADMIN_RTE_CD STRING COMMENT 'Admin RTE Code; SOURCE: ADMIN_RTE_CD',
  GNRC_CD_NUM_SEQ STRING COMMENT 'Generic Code Number Sequence; SOURCE: GNRC_CD_NUM_SEQ',
  REPL_NDC_NUM STRING COMMENT 'Replicate NDC Number; SOURCE: REPL_NDC_NUM',
  DEA_CD STRING COMMENT 'DEA Code; SOURCE: DEA_CD',
  ADTL_DSCRPTN STRING COMMENT 'Additional Description; SOURCE: ADTL_DSCRPTN',
  BRND_NAME STRING COMMENT 'Brand Name of the Drug; SOURCE: BRND_NAME',
  GNRC_PRC_NDCTR STRING COMMENT 'Generic Price Indicator; SOURCE: GNRC_PRC_NDCTR',
  LBL_NAM STRING COMMENT 'Label Name; SOURCE: LBL_NAM',
  MFR_NAM STRING COMMENT 'Manufacturer Name; SOURCE: MFR_NAM',
  NDC_CNFG_NDCTR STRING COMMENT 'NDC Configuration Indicator; SOURCE: NDC_CNFG_NDCTR',
  PKG_DSCRPTN STRING COMMENT 'Package Description; SOURCE: PKG_DSCRPTN',
  RTE_DSCRTN STRING COMMENT 'Rate Description; SOURCE: RTE_DSCRTN',
  TOP_200_NDCTR STRING COMMENT 'Top 200 Indicator of the Drug; SOURCE: TOP_200_NDCTR',
  UNIT_DOSE_NDCTR STRING COMMENT 'Unit Dose Indicator; SOURCE: UNIT_DOSE_NDCTR',
  FFP_UL_CURR_EFFECTIVE_DT TIMESTAMP COMMENT 'FFP UL Current Effective Date; SOURCE: FFP_UL_CURR_EFFECTIVE_DT',
  FFP_UL_CURR_UNIT_PRC DECIMAL(38,18) COMMENT 'FFP UL Current Unit Price; SOURCE: FFP_UL_CURR_UNIT_PRC',
  GNRC_THRPUTC_CLASS_CD STRING COMMENT 'Generic Therapeutic Class Code; SOURCE: GNRC_THRPUTC_CLASS_CD',
  STNDRD_THRPUTC_CLASS_CD STRING COMMENT 'Standard Therapeutic Class Code; SOURCE: STNDRD_THRPUTC_CLASS_CD',
  DRG_CLASS_CD STRING COMMENT 'Drug Classification Code; SOURCE: DRG_CLASS_CD',
  INGR_CD_NUM STRING COMMENT 'Ingredient Code Number; SOURCE: INGR_CD_NUM',
  ORANGE_BK_CD STRING COMMENT 'Orange Book Code; SOURCE: ORANGE_BK_CD',
  CURR_BLU_BK_EFFECTIVE_DT TIMESTAMP COMMENT 'Current Blu Book Effective Date; SOURCE: CURR_BLU_BK_EFFECTIVE_DT',
  CURR_BLU_BK_UNIT_PRC DECIMAL(38,18) COMMENT 'Current Blu Book Unit Price; SOURCE: CURR_BLU_BK_UNIT_PRC',
  CURR_BLU_BK_PKG_DT TIMESTAMP COMMENT 'Current Blu Package Date; SOURCE: CURR_BLU_BK_PKG_DT',
  CURR_BLU_BK_PKG_PRC DECIMAL(38,18) COMMENT 'Current Blu Package Price; SOURCE: CURR_BLU_BK_PKG_PRC',
  LBLR_ID STRING COMMENT 'LBLR ID; SOURCE: LBLR_ID',
  PATENT_EXPIRATION_DT TIMESTAMP COMMENT 'Patent Expiration Date; SOURCE: PATENT_EXPIRATION_DT',
  EXCLSVTY_EXPIRATION_DT TIMESTAMP COMMENT 'Exclusivity Expiration Date; SOURCE: EXCLSVTY_EXPIRATION_DT',
  DRG_STRNTH_NUM DECIMAL(38,18) COMMENT 'Drug Strength Number; SOURCE: DRG_STRNTH_NUM',
  SHLF_PACK_NUM BIGINT COMMENT 'Shelf Pack Number; SOURCE: SHLF_PACK_NUM',
  PTNT_PKG_INSERT_NDCTR STRING COMMENT 'Patient Package Insert Indicator; SOURCE: PTNT_PKG_INSERT_NDCTR',
  DISPENSE_CNT DECIMAL(38,18) COMMENT 'Dispense Count; SOURCE: DISPENSE_CNT',
  -- UPD_DT TIMESTAMP COMMENT 'Update Timestamp; SOURCE: UPD_DT',
  -- CRTE_DT TIMESTAMP COMMENT 'Created Timestamp; SOURCE: CRTE_DT',
  EFFECTIVE_DATE DATE comment 'Record Effective Date', 
  EXPIRATION_DATE DATE comment 'Record Expiration Date',
  CURR_FLG STRING comment 'Flag records as Y if expiration date > current date and start date < current date; otherwise, flag as N',
  ADF_RUN_ID STRING COMMENT 'ID for specific pipeline run loaded from landing. This run_id gets generated when the records gets loaded from source to landing',
  ADF_JOB_ID STRING COMMENT 'ID of the trigger that invokes the pieline. This job_id gets generated when the records gets loaded from source to landing',
  RECORD_LOAD_TIME TIMESTAMP DEFAULT current_timestamp COMMENT 'This is the default generated column using current timestamp when the record is loaded in the table',
  INPUT_FILE_NAME STRING COMMENT 'File name which is getting populated from bronze layer',
  DATABRICKS_RUN_ID STRING COMMENT 'run id of the Databricks job run. This gets generated from the silver notebook run',
  DATABRICKS_JOB_ID STRING COMMENT 'job id of the Databricks job run. This gets generated from the silver notebook run',
  INSERT_TS TIMESTAMP COMMENT 'Timestamp when the Record was Inserted',
  UPDATE_TS TIMESTAMP COMMENT 'Timestamp when the Record was Inserted',
  INTEGRATION_KEY STRING COMMENT 'Hash key created using combination of all the columns except the housekeeping columns',
  DATE_PART date GENERATED ALWAYS AS (DATE(RECORD_LOAD_TIME)) COMMENT 'This the date part generated from Record load time column',
  HOUR_PART INT GENERATED ALWAYS AS (HOUR(RECORD_LOAD_TIME)) COMMENT 'This the hour part generated from Record load time column'
)
USING DELTA
PARTITIONED BY (DATE_PART,HOUR_PART)
LOCATION '$$delta_table_location'
TBLPROPERTIES (
  'delta.feature.allowColumnDefaults' = 'supported',
  'delta.feature.appendOnly' = 'supported',
  'delta.feature.invariants' = 'supported',
  'delta.minReaderVersion' = '1',
  'delta.minWriterVersion' = '7',
  'delta.enableChangeDataFeed' = true,
  'spark.sql.files.ignoreMissingFiles'= true,
  'delta.autoOptimize.optimizeWrite' = true);
INSERT INTO $$unity_catalog_name.$$schema_name.$$delta_table_name (
  NDC_SKEY,
  NDC_NUM,
  BUSINESS_UNIT,
  SEGMENT_NAME,
  SOURCE_SYSTEM_NAME,
  GNRC_NAME,
  PREV_NDC_NUM,
  OBSOLETE_DT,
  DOSE_FRM_DSCRPTN,
  DRG_STRNTH_DSCRPTN,
  GNRC_NDCTR,
  GNRC_CD_NUM,
  THRPUTC_CLASS_CD,
  SPECIF_THRPUTC_CLASS_CD,
  PKG_SZ,
  DRG_FRM_CD,
  ADMIN_RTE_CD,
  GNRC_CD_NUM_SEQ,
  REPL_NDC_NUM,
  DEA_CD,
  ADTL_DSCRPTN,
  BRND_NAME,
  GNRC_PRC_NDCTR,
  LBL_NAM,
  MFR_NAM,
  NDC_CNFG_NDCTR,
  PKG_DSCRPTN,
  RTE_DSCRTN,
  TOP_200_NDCTR,
  UNIT_DOSE_NDCTR,
  FFP_UL_CURR_EFFECTIVE_DT,
  FFP_UL_CURR_UNIT_PRC,
  GNRC_THRPUTC_CLASS_CD,
  STNDRD_THRPUTC_CLASS_CD,
  DRG_CLASS_CD,
  INGR_CD_NUM,
  ORANGE_BK_CD,
  CURR_BLU_BK_EFFECTIVE_DT,
  CURR_BLU_BK_UNIT_PRC,
  CURR_BLU_BK_PKG_DT,
  CURR_BLU_BK_PKG_PRC,
  LBLR_ID,
  PATENT_EXPIRATION_DT,
  EXCLSVTY_EXPIRATION_DT,
  DRG_STRNTH_NUM,
  SHLF_PACK_NUM,
  PTNT_PKG_INSERT_NDCTR,
  DISPENSE_CNT,
  -- UPD_DT,
  -- CRTE_DT,
  EFFECTIVE_DATE,
  EXPIRATION_DATE,
  CURR_FLG,
  ADF_RUN_ID,
  ADF_JOB_ID,
  DATABRICKS_RUN_ID,
  DATABRICKS_JOB_ID,
  INPUT_FILE_NAME,
  INTEGRATION_KEY,
  INSERT_TS,
  UPDATE_TS
) VALUES (
  -9999,
  'NA',
  'PSAS',
  'US Pharma',
  'BHP',
  'NA',
  'NA',
  NULL,
  'NA',
  'NA',
  'NA',
  'NA',
  'NA',
  'NA',
  NULL,
  'NA',
  'NA',
  'NA',
  'NA',
  'NA',
  'NA',
  'NA',
  'NA',
  'NA',
  'NA',
  'NA',
  'NA',
  'NA',
  'NA',
  'NA',
  NULL,
  NULL,
  'NA',
  'NA',
  'NA',
  'NA',
  'NA',
  NULL,
  NULL,
  NULL,
  NULL,
  'NA',
  NULL,
  NULL,
  NULL,
  NULL,
  'NA',
  NULL,
  -- NULL,
  -- NULL,
  NULL,
  NULL,
  'NA',
  'NA',
  'NA',
  'NA',
  'NA',
  'NA',
  'NA',
  NULL,
  NULL
);