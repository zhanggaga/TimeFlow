use TimeFlow
go
create function fun_Cilent_album(@Client_id int='')
returns @all_info table (Client_id int,Client_name varchar(40), photo_id int,pic varchar(80), like_num int, comment_num int,
album_name varchar(40),album_id int)
as
begin
insert @all_info
	select ClientInfo.ID, ClientInfo.NickName,Photo.ID,Photo.Pic,Photo.LikeNum, Photo.CommentsNum,
	Album.AlbumName, Album.ID 
	from ClientInfo, Photo, Album 
	where ClientInfo.ID = Photo.ClientID and Photo.AlbumID = Album.ID and ClientInfo.ID = @Client_id order by Album.ID
	return
	end
	go

