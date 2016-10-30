$("#photo1").hover(function(){
    $("#touming").css(" display","block");
})
function clickhref(path) {
    window.location.href = path;
}

function getJson(RequestData, URL) { //获取json数据
    var reJson;
    $.ajax({
        type: 'POST',
        url: URL,
        data: RequestData,
        async: false, //为了简便，设置为同步操作
        cache: false,
        success: function (responseData) {
            reJson = responseData;
        }
    });
    return reJson;
}
function getphotos() {
    var url = "GetPhoto.aspx";
    var request = '';
    var json = getJson(request, url);//json字符串
    var photos =  eval("("+ json +")");//转成json对象
    for(var i=0;i<photos["Table"].length;i++){
        $("#photos").find("button").eq(i).css("background-image", "url(" + photos["Table"][i]["Pic"] + " )");
    }
   
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
	    var json_photo_url = "pic";
	    var json_photo_id = "photo_id";
	    var json_LikeNum = "LikeNum";
	    var json_CommentNum = "CommentsNum";
	    var getData = eval("(" + data + ")");
	    var colume_num = 3;
	    for (var i = 0; i < getData[json_table].length; i++) {
	    	var targetTable = '';
	    	if(i%colume_num == 0) {
//	    		alert('0');
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
        likeOrNot();
	    
	});
	

}
$(document).ready( function() {
	
	
	startGetData();
	
//	$("#1").click( function() {	
//
//		var like_src = ($(this).attr("class"));
//		
//		$(this).attr("src", "img/like" + like_src +".png");
//		$(this).removeClass(like_src);
//		if(parseInt(like_src) == 2) {
//			like_src = "1";
//		}
//		else {
//			like_src = "2";
//		}
//		$(this).addClass(like_src);
//	});
});
function likeOrNot() {
	$("#PhotoContainer .content-wrap img").each( function() {
		$(this).bind("click", function() {
			var like_class = $(this).attr("class");
//			alert(like_class);
			if(like_class=="unlike") {
				$(this).attr("src","img/like2.png");
				$(this).removeClass("unlike");
				$(this).addClass("like");
			}
			else if(like_class=="like") {
				$(this).attr("src","img/like1.png");
				$(this).removeClass("like");
				$(this).addClass("unlike");				
			}
		});
	});
}
function clickLike() {
	
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
//			alert(rate);
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
