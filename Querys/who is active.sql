

EXEC sp_WhoIsActive @get_outer_command=1, @get_plans =1, @get_locks = 1
,@output_column_list = '[collection_time],[dd hh:mm:ss.mss],[blocked_session_count],[open_tran_count],[session_id],[blocking_session_id],[wait_info],[status],[locks],[login_name],[host_name],[program_name],[database_name], [sql_text], [sql_command],[query_plan],[reads],[writes]'

,@find_block_leaders =1, @sort_order = '[blocked_session_count] DESC'
--,@filter = '10', @filter_type = 'session'

--somente backup

sp_WhoIsActive @filter = '56', @filter_type = 'session',@output_column_list = '[dd hh:mm:ss.mss],[sql_text],[wait_info],[percent_complete]'


-----------
 
-- delta_interval, consumo cpu
sp_whoisactive @get_outer_command = 1,@get_plans = 1,@delta_interval = 10, @sort_order = '[CPU_delta] DESC'

 
