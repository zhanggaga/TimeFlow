use TimeFlow
go
create function fun_get_similiar_Label_ByTime_Photo_RecentLabel(@Client_id int='')
returns @all_info table (LabelID int, id int)
as
begin
insert @all_info
	select  LabelID , id from fun_get_similiar_Label_ByTime_getLabelinTime(@Client_id)
	WHERE id  IN (select MIN(id) 
	from fun_get_similiar_Label_ByTime_getLabelinTime(@Client_id) GROUP BY LabelID);
	return
	end
	go

