create table [dbo].[DI_PIPELINE_CONFIG_TBL](
id INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
env nvarchar(max),
process_name nvarchar(max),
interface_desc nvarchar(max),
interface_active nvarchar(max),
business_unit nvarchar(max),
segment_name nvarchar(max),
process_type nvarchar(max),
source_table_name nvarchar(max),
landing_storage_layer nvarchar(max),
source_query_dml nvarchar(max),
source_delta_col nvarchar(max),
source_delta_val nvarchar(max),
source_delta_op nvarchar(max),
landing_storage_account nvarchar(max),
landing_storage_container nvarchar(max),
landing_target_dir nvarchar(max),
landing_target_path nvarchar(max),
landing_target_file_nm nvarchar(max),
landing_target_full_path nvarchar(max),
landing_last_start_date nvarchar(max),
landing_last_end_date nvarchar(max),
bronze_table_name nvarchar(max),
bronze_storage_layer nvarchar(max),
bronze_table_delta_path nvarchar(max),
bronze_write_mode nvarchar(max),
bronze_storage_container nvarchar(max),
bronze_storage_account nvarchar(max),
bronze_table_full_path nvarchar(max),
bronze_table_housekeeping_column_list nvarchar(max),
bronze_ddl_file_path nvarchar(max),
silver_table_name nvarchar(max),
silver_storage_layer nvarchar(max),
silver_table_delta_path nvarchar(max),
silver_write_mode nvarchar(max),
silver_storage_container nvarchar(max),
silver_storage_account nvarchar(max),
silver_table_full_path nvarchar(max),
silver_dml nvarchar(max),
silver_ddl_file_path nvarchar(max),
silver_enable_dq_checks nvarchar(max),
silver_dq_config_id nvarchar(max),
md5_flag nvarchar(max),
silver_table_housekeeping_column_list nvarchar(max),
gold_table_name nvarchar(max),
gold_storage_layer nvarchar(max),
gold_table_full_path nvarchar(max),
gold_ddl_file_path nvarchar(max),
is_gold_enable nvarchar(max),
gold_dml nvarchar(max),
gold_recon_query nvarchar(max),
is_dimension nvarchar(max),
source_system_name nvarchar(max),
source_landing_column_map  nvarchar(max),
source_partition_col nvarchar(max),
GOLD_LAST_UPDATED_CDC_VERS INT,
silver_table_checkpoint_path nvarchar(max),
bronze_table_checkpoint_path nvarchar(max),
gold_table_checkpoint_path nvarchar(max),
source_business_filter nvarchar(max),
silver_invalid_ddl_file_path nvarchar(max),
silver_invalid_table_name nvarchar(max),
silver_invalid_table_full_path nvarchar(max)
);
