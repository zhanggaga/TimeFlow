function clickhref(path) {
    window.location.href = path;
}
$(document).ready( function() {
//	getClientInfo();
	getdata();
	
});
function getdata() {
	var keyWod = '';
	var srcs = Array();
	srcs = now_href.split("?search=",2);
	keyWod += srcs[1];
	$("#PhotoContainer").empty();
	var json_table = "Table";
	var end_url = "../SearchLabel.aspx";
//	var json_albumID = "album_id";
//	var json_albumName = "album_name";
	var json_commentNum = "CommentsNum";
	var json_likeNum = "LikeNum";
	var json_photoID = "PhotoID";
	var json_pic = "Pic";
	var colume_num = 3;
	$.post(end_url,
	{
		search : keyWod	
	}, function(data) {
		var getData = eval("(" + data + ")");
		for(var i = 0; i<getData[json_table].length; i++){
			var targetTable = '';
	    	if(i%colume_num == 0) {
	    		targetTable += '<div class="photoRow"></div>';
	    	}
	    	$("#PhotoContainer").append(targetTable);	
	    	targetTable = '';
	        targetTable += '<div class="photoContainer">';
	        targetTable += '<article class="post-152 post type-post status-publish format-standard hentry category-people category-photos">'
	        + '<div class="post-format-content">'
            + '<div class="post-thumbnail">'
            + '<img src="' + getData[json_table][i][json_pic] + '" alt ="'+ getData[json_table][i][json_photoID] +'"class="attachment-thumbnail wp-post-image">'
	        + '</div>'
	        + '<div class="content-wrap">'
            + '<span class="featured-image"><img class="unlike" src="img/like1.png"><span>'+getData[json_table][i][json_likeNum]+'</span>&nbsp;&nbsp;'
            + '<img src="img/comment.png"><span>'+getData[json_table][i][json_commentNum]+'</span></span></div></div></article>'
            + '</div>';
            
            	
	        $(".photoRow").eq(parseInt(i/colume_num)).append(targetTable);			
		}
		ifMyPage();
		resetImage();
		clickPhoto();

	});
}
function resetImage() {
	$(".photoContainer article .post-format-content .post-thumbnail img").each( function() {		
			var height = $(this).height();
			var width = $(this).width();
			var rate = height/width;
			if(rate<1) {
				if($(this).css("width")) {
					$(this).css("width", "auto");
				}
				$(this).css("height", "100%");		
			}
			else {
				if($(this).css("height")) {
					$(this).css("height", "auto");
				}			
				$(this).css("width", "100%");
	//			if($(this).hasClass("moreHeight"))
	//				$(this).removeClass("moreHeight");
	//			$(this).addClass("moreWidth")
			}				
	
	});
}
function likeBack(photo_id) {
//	alert("like:"+photo_id);
	return;
	var end_url = "../GetFan_FolloweeInfo.aspx";
	var data_unlike = "unlike";
	var data_like = "like";
	var like_class = $(this).attr("class");
	$.post( end_url,
	{
		photoID: photo_id
	}, function(data) {
		//得到点赞或取消赞
		if(data=="unlike") {
			$(this).attr("src","img/like2.png");
			$(this).removeClass("unlike");
			$(this).addClass("like");			
		}
		if(data=="like") {
			$(this).attr("src","img/like1.png");
			$(this).removeClass("like");
			$(this).addClass("unlike");					
		}
		
	});
}
var if_like = false; //avoid double-clike photo-like
//add like
function clickLike() {
	$("#PhotoContainer .content-wrap img").each( function() {	
		var photo_id = $(this).parent().parent().prev(".post-thumbnail").children("img");
		$(this).bind("click", function() {
			likeBack(photo_id.attr("alt"));
			if_like = true;
			setTimeout(function(){ //delat for avoid double-click
				if_like = false;
			}, 100);
		});
	});
}
//visit the photo
function clickPhoto() {
	$(".featured-image").each( function() {
		var photo_target = $(this).parent(".content-wrap").prev(".post-thumbnail").children("img");
		$(this).bind("click", function() {
			if(!if_like) {
				var photo_id = photo_target.attr("alt");
				visitPhoto(photo_id);		
			}

		});
	})
}
function visitPhoto(photo_id) {
	viewPhoto(photo_id);
}
function ifMyPage(){
	var now_href = window.location.href;
	if(now_href.indexOf("?clientID=")!=-1){
		$(".follow_0").each( function() {
			$(this).css("display", "none");
		});
		$(".follow_1").each( function() {
			$(this).css("display", "none");
		});	
		$("#followerList #detail .textDetail").each( function() {
			$(this).css("right", "280px");
		});
//		$("#userintro").
	}
}
