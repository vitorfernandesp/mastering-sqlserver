SELECT

AB.name,B.*

FROM
	sys.databases AB
	
	OUTER APPLY (
SELECT TOP 1 convert(decimal(32,2),A.backup_size/1024/1024) as tamanho_banco, a.backup_start_date,convert(decimal(32,2),A.compressed_backup_size/1024/1024) AS TAMANHO_BKP_COMPRIMIDO,physical_device_name, A.backup_finish_date , is_copy_only
FROM msdb.dbo.backupset A INNER JOIN msdb.dbo.backupmediafamily B  
ON A.media_set_id = B.media_set_id 
WHERE database_name = AB.name
--AND backup_finish_date >= '20190223' AND backup_finish_date < '20190225'
AND type = 'd' 
ORDER BY A.backup_finish_date DESC
) AS B
where
	state_desc = 'ONLINE'
ORDER BY backup_finish_date DESC

-- d = full
-- l = log
-- i = incremental

--02:00