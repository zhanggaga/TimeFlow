use TimeFlow
create table [Like] (
	ID int not null identity primary key,
	PhotoID int not null,
	ClientID int not null,
	foreign key(ClientID) references Client(ID),
	foreign key(PhotoID) references Photo(ID)
)