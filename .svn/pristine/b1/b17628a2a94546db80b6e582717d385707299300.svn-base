use TimeFlow
go
create function fun_get_similiar_Label_getLabels_Count(@Client_id int='')
returns @all_info table (label_id int,times int, label_name varchar(20))
as
begin
insert @all_info
	select a.label_id, count(a.label_id)as times,a.label_name
	from fun_get_similiar_Label_getLabels(@Client_id) a
	group by a.label_id,a.label_name order by times desc
	return
	end
	go

