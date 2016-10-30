USE TimeFlow
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create trigger tgr_newClient on [dbo].[Client]
for insert
as
declare @new_client_id int
select @new_client_id = ID  from inserted;
insert  ClientInfo 
values(@new_client_id,'','','','','','','','')