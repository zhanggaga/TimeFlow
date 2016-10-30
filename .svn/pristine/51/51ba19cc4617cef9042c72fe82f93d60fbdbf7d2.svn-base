create view View_habbit_user
as
select [TimeFlow].[dbo].[ClientInfo].NickName, Habbit.Name
from [TimeFlow].[dbo].[ClientInfo], [TimeFlow].[dbo].[Habbit_User],[TimeFlow].[dbo].[Habbit]
where [TimeFlow].[dbo].[Habbit_User].ClientID = [TimeFlow].[dbo].[ClientInfo].ID and [TimeFlow].[dbo].[Habbit_User].HabbitID = Habbit.ID