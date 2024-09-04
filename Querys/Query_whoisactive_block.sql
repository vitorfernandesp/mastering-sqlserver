EXEC sp_WhoIsActive @get_outer_command=1, @get_plans =1--, @get_locks = 1
,@output_column_list = '[collection_time],[dd hh:mm:ss.mss],[blocked_session_count],[open_tran_count],[session_id],[blocking_session_id],[wait_info],[status],[locks],[login_name],[host_name],[program_name],[database_name], [sql_text], [sql_command],[query_plan],[reads],[writes]'



,@find_block_leaders =1, @sort_order = '[blocked_session_count] DESC'