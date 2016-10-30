function clickhref(path) {
    window.location.href = path;
}
function get_clients() {
	$("#clientList").empty();
	var end_url = "../GetClient_Photo.aspx";
	$.post( end_url, 
	{
		action: "0"
	}, function(data) {
//		alert(data);
		var json_table = "Table";
		var json_client_id = "Client_id";
		var json_client_name = "Client_name";
		var json_pic = "Pic";
		var getData = eval("(" + data + ")");
		
		for(var i = 0; i < getData[json_table].length; i++) {
			var targetTable = '';
			targetTable += '<div class="client_list">'
					 	+ '<img src="' + getData[json_table][i][json_pic] +'"class="client_pic" alt="'+getData[json_table][i][json_client_id]+'">'
					 	+ '<span class="client_name"> ' + getData[json_table][i][json_client_name] + '</span>' 
					 	+ '<button class="client_follow"value="' + getData[json_table][i][json_client_id] +'">关注</button>'
					 	+ '</div>';
			
			$("#clientList").append(targetTable);
		}
	});
}

function get_photos() {
	$("#PhotoContainer").empty();
	var end_url = "../GetClient_Photo.aspx";	
	
	$.post(end_url,
	{
		action: "1"
	} ,function (data) {
	    var json_table = "Table";
	    var json_photo_url = "Pic";
	    var json_photo_id = "photo_id";
	    var json_LikeNum = "LikeNum";
	    var json_CommentNum = "CommentsNum";
	    var getData = eval("(" + data + ")");
	    var colume_num = 3;
	    for (var i = 0; i < getData[json_table].length; i++) {
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
            + '<img src="' + getData[json_table][i][json_photo_url] + '" alt ="'+ getData[json_table][i][json_photo_id] +'"class="attachment-thumbnail wp-post-image">'
	        + '</div>'
	        + '<div class="content-wrap">'
            + '<span class="featured-image"><img class="unlike" src="img/like1.png"><span>'+getData[json_table][i][json_LikeNum]+'</span>&nbsp;&nbsp;'
            + '<img src="img/comment.png"><span>'+getData[json_table][i][json_CommentNum]+'</span></span></div></div></article>'
            + '</div>';
            
            	
	        $(".photoRow").eq(parseInt(i/colume_num)).append(targetTable);

   		}
        resetImage();        
        clickLike();
        clickClient();
        clickPhoto();
        resetLike();
//      likeOrNot();
	    
	});

}
function resetLike() {
//	alert();
	var end_url = "../If_Liked.aspx";
	$.post( end_url,
	{
		
	}, function(data, status) {
		var json_table = "Table";
		var json_Photo_id = "Photo_id";
		var json_IF_Liked = "IF_Liked";
		var getData = eval("(" + data + ")");
		$(".photoContainer article .post-format-content .post-thumbnail img").each( function() {
			for(var i=0; i<getData[json_table].length; i++) {
				if($(this).attr("alt") == getData[json_table][i][json_Photo_id]) {
					if(getData[json_table][i][json_IF_Liked] == "Y") {
						$(this).parent(".post-thumbnail").next(".content-wrap").children(".featured-image").children("img").eq(0).attr("src","img/like2.png");
						$(this).parent(".post-thumbnail").siblings(".content-wrap").children(".featured-image").children("img").eq(0).removeClass("unlike");
						$(this).parent(".post-thumbnail").siblings(".content-wrap").children(".featured-image").children("img").eq(0).addClass("like");							
//						var orignin_num = $(this).parent(".post-thumbnail").next(".content-wrap").children(".featured-image").children("img").eq(0).next().html();
//						orignin_num = parseInt(parseInt(orignin_num) + 1);
//						$(this).parent(".post-thumbnail").next(".content-wrap").children(".featured-image").children("img").eq(0).next().html(orignin_num);
					}
				}
			}
			
		});
	});
}
$(document).ready( function() {	
	startGetData();
});
function likeBack(photo_id) {
//	alert("like:"+photo_id);
//	return;
	
	var end_url = "../GetPhoto.aspx";
	var data_unlike = "unlike";
	var data_like = "like";
	var like_class = $(this).attr("class");
	

	$.post( end_url,
	{
		action: "2",
		p_id: photo_id
	}, function(data) {
//		alert(data);
		//得到点赞或取消赞
		if(data=="a_Succeed") {
//			alert(data);
			$(".deal_now").attr("src","img/like2.png");
			$(".deal_now").removeClass("unlike");
			$(".deal_now").addClass("like");	
			var orignin_num = $(".deal_now").next().html();
			orignin_num = parseInt(parseInt(orignin_num) + parseInt(1));
			$(".deal_now").next().html(orignin_num);			
		}
		if(data=="c_Succeed") {
//			alert(data);
			$(".deal_now").attr("src","img/like1.png");
			$(".deal_now").removeClass("like");
			$(".deal_now").addClass("unlike");	
			var orignin_num = $(".deal_now").next().html();
			orignin_num = parseInt(parseInt(orignin_num) - parseInt(1));
			$(".deal_now").next().html(orignin_num);				
		}
		
		
	});
	$(".deal_now").removeClass("deal_now");
}
var if_like = false; //avoid double-clike photo-like
//add like
function clickLike() {
	$("#PhotoContainer .content-wrap img").each( function() {
		var photo_id = $(this).parent().parent().prev(".post-thumbnail").children("img");
		$(this).bind("click", function() {
		if((!$(this).hasClass("like") && !$(this).hasClass("unlike"))) {
			return false;			
			
		}
			likeBack(photo_id.attr("alt"));
			$(this).addClass("deal_now");
			
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
				var ever_like = $(this).children().hasClass("like");
				var span_like = '<span id="span_like">' + ever_like + '</span>';
//				alert(ever_like);
				$("#forDeatil").append(span_like);
				var photo_id = photo_target.attr("alt");
				
				visitPhoto(photo_id);		
			}

		});
	})
}
function visitPhoto(photo_id) {
	viewPhoto(photo_id);
}
function clickClient() {
	$(".client_list img").each( function() {
		var client_id = $(this).attr("alt");
		$(this).bind("click", function() {
			visitClient(client_id);
		});
	});
	$(".client_list .client_name").each( function() {
		var client_id = $(this).prev("img").attr("alt");
		$(this).bind("click", function() {
			visitClient(client_id);
		});
	});
	$(".client_list .client_follow").each( function() {
		var client_id = $(this).siblings(".client_pic").attr("alt");
		$(this).bind("click", function() {
			var hasFollow = $(this).hasClass("hasFollow");
			
			$(this).addClass("deal_now");
			followClient(client_id, hasFollow);
		});
	})
}

function followClient(client_id, hasFollow) {
	var end_url = "../GetFan_FolloweeInfo.aspx";
	//已关注
	if(hasFollow) {
		layer.confirm('确定取消关注吗？', {
			title: '',
			btn: ['确定','取消'] //按钮
		}, function(){
			$.post(end_url,
			{
				action : "3",
				c_id : client_id
			}, function(data) {
				if(data=="Succeed") {
					$(".deal_now").html("关注");
					$(".deal_now").removeClass("hasFollow deal_now");
//					$(".deal_now").removeClass("deal_now");
					layer.msg('取消关注成功', {icon: 1});					
				}
				else {
					$(".deal_now").removeClass("deal_now");
					layer.msg('程序发生了不可知的错误。。', {icon: 5});
				}
			});
		  
		}, function(index){
			layer.close(index);
		});			
	}
	//未关注
	else {
		$.post(end_url, 
		{
			action : "2",
			f_id: client_id
		}, function(data) {
			if(data=="Succeed") {
				$(".deal_now").html("已关注");
				$(".deal_now").addClass("hasFollow");
				$(".deal_now").removeClass("deal_now");
			}
			else {
				$(".deal_now").removeClass("deal_now");
				layer.msg('程序发生了不可知的错误。。', {icon: 5});
			}
		});		
	}
}
function visitClient(client_id) {
	window.location.href= "photos.html?clientID="+client_id;
}
var FREQ = 1000 ;
function startGetData() {
	setTimeout( function() {
		get_clients();
		get_photos();
		//startGetData();
	}, FREQ);
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
