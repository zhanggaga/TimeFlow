use master 
go

declare @dbname sysname 
set @dbname='test' --�����Ҫɾ�������ݿ����

declare @s nvarchar(1000) 
declare tb cursor local for 
select s='kill '+cast(spid as varchar) 
from master..sysprocesses 
where dbid=db_id(@dbname) 
open tb 
fetch next from tb into @s 
while @@fetch_status=0 
begin 
exec(@s) 
fetch next from tb into @s 
end 
close tb 
deallocate tb 
exec('drop database ['+@dbname+']')