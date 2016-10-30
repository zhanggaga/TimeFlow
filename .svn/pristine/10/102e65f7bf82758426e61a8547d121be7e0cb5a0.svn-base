use TimeFlow
go
create function fun_get_similar_Client_Info(@Client_id int='')
returns @all_info table (Client_id int,Client_name varchar(40),Pic varchar(40))
as
begin
insert @all_info
	select a.Client_id, ClientInfo.NickName, ClientInfo.Pic
	from fun_get_similar_Client_Count(@Client_id) a, ClientInfo
	where  a.Client_id = ClientInfo.ID
	return
	end
	go

