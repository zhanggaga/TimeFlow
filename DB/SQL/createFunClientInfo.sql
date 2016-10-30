use TimeFlow
go
create function fun_Cilent_photo()
returns @all_info table (Client_id int,Client_name varchar(40), photo_num int, like_num int, 
follow_num int, followee_num int, album_num int)
as
begin
insert @all_info
	select ClientInfo.ID, ClientInfo.NickName,COUNT(distinct Photo.ID),SUM(Photo.LikeNum), ClientInfo.FollowerNum,
	ClientInfo.FolloweeNum, COUNT(distinct Photo.AlbumID)
	from ClientInfo, Photo
	where ClientInfo.ID = Photo.ClientID
	group by ClientInfo.ID, ClientInfo.NickName, ClientInfo.FolloweeNum, ClientInfo.FollowerNum
	return
	end
	go

