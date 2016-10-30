use TimeFlow
create table ClientInfo (
	ID varchar(40) not null,
	FollowerNum int,
	FolloweeNum int,
	NickName varchar(40),
	Sex char(1),
	Pic varchar(40),
	Country varchar(8),
	Province varchar (20),
	City varchar (10),
	primary key (ID)
)