use TimeFlow
go
create function fun_get_similar_Client(@Client_id int='')
returns @all_info table (Client_id_a int,Client_name_a varchar(40), Client_id_b int,Client_name_b int,
habbit_name varchar(40),habbit_id int)
as
begin
insert @all_info
	select a.Cid, b.Cid, 
	from View_habbit_user a, View_label_user b
	where  a.Cid = @Client_id and a.Cid <> b.Cid and a.Hid = b.Hid order by Habbit.ID
	return
	end
	go

