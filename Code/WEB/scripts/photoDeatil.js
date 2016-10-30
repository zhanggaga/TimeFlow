function getContent() {
	$("#imgContainer").empty();
	$("#textContainer").empty();
	var index = parent.layer.getFrameIndex(window.name);
	var getData = parent.$("#mySrc").val();
	
	var json_table = "Table";
	var json_content = "Comment_content";
	var json_commentNum = "Comment_num";
	var json_likeNum = "Like_num";
	var json_print_ID = "Comment_printUserID";
	var json_print_name = "Comment_receiveUserNickname";
	var json_receive_ID = "Comment_receiveUserID";
	var json_receive_name = "Comment_receiveUserNickname";
	var json_time = "";
	var json_label_name = "Label_name";
	var json_photo_ID = "Photo_id";
	var json_photo_pic = "Photo_pic";
	var json_label_num = "";
	var json_client_pic = "";
	var json_client_name = "";
	
	for(var i=0; i<getData[json_table].length; i++) {
		var targetTable = '';
		//初次加载
		if(i==0) {
			targetTable += '<img id="targetPhoto" src="' + getData[json_table][i][json_photo_pic] + '" />';
			$("#imgContainer").append(targetTable);
			targetTable = '';
			targetTable += '<div id="imgInfo">'
						+ '<img id="clientPic" src="' + getData[json_table][i][json_client_pic] + '" />'
						+ '<span id="clientName">' + getData[json_table][i][json_client_name] + '</span>'
						+ '<button id="followBtn">关注</button>'
						+ '<br />'
						+ '<img id="likeImg" src="img/like1.png" />' 
						+ '<span id="likeNume">'+ getData[json_table][i][json_likeNum] +'</span>'
						+ '<img id="commentImg" src="img/comment.png"/>'
						+ '<span id="commentNum">' + getData[json_table][i][json_commentNum] +'</span>'
						+ '<br />'
						+ '<div id="myLabel">'
						+ '<span class="label">' + getData[json_table][i][json_label_name] + '</span>'
						+ '</div>'
						+ '</div>'
						+ '<div id="CommentArea">';							
																
		}
		//获取标签
		if(0<i<parseInt(getData[json_table][i][json_label_num])) {
			var labelTable = '<span class="label">' + getData[json_table][i][json_label_name] +'</span>';
			$("#myLabel").append(labelTable);
			
		}
		targetTable += '<div class="comment_one">';
		if(getData[json_table][i][json_receive_name] != null) {
			targetTable += '<span class="comment_client_name">' + getData[json_table][i][json_print_name] + '</span>'
						+ '<span class="comment_normal">回复</span>'
						+ '<span class="comment_client_name">' + getData[json_table][i][json_receive_name] + '</span>'
						+ '<span class="comment_text">' + getData[json_table][i][json_content] + '</span>';								
		}
		else {
			targetTable += '<span class="comment_client_name">' + getData[json_table][i][json_print_name] + '</span>'
						+ '<span class="comment_text">' + getData[json_table][i][json_content] + '</span>';
		}
		targetTable += '</div>';	
		if(i==0) {
			targetTable += '</div></div>';
		}
		$("#textContainer").append(targetTable);
		
	}	
}
function resetImage() {
	var img_height = $("#targetPhoto").height();
	var img_width = $("#targetPhoto").width();
	var rate = img_width/img_height;
	if(img_width>img_height) {		
		if(img_width > 600) {
			img_width = 600;
			img_height = 600/rate;
			$("#targetPhoto").css("width", img_width);
		}
	}
	else {
		if(img_height>600) {
			img_height = 600;
			img_width = 600*rate;
			$("#targetPhoto").css("height", img_height);
		}
	}
	var body_width = $("body").width();
	$("#imgInfo").width(body_width-img_width-30);
	$("#myComment").width(body_width-img_width-20);
	$("#textContainer").css("margin-left", img_width+15);
	everLike();
	clickLike();
	clickClient();
	submitComment();
	ifFollow();
}
function test() {
	var index = parent.layer.getFrameIndex(window.name);
	var getData = parent.$("#client_photo").html();
}
$(document).ready( function(){
	$.ajaxSetup({   
        async : false  
    }); 
	getDate();
	resetImage();	
});
function getDate() {
//	$("#imgContainer").empty();
//	$("#textContainer").empty();
	getClient();
}
function getClient() {
	var index = parent.layer.getFrameIndex(window.name);
	var getData = parent.$("#span_client").html();
	getData = jQuery.parseJSON(getData);
//	alert(jQuery.parseJSON(getData).Table.length);
	var photoID = parent.$("#client_photo").html();
	var json_table = "Table";
	var json_client_pic = "Client_pic";
	var json_client_name = "NickName";	
	var json_time = "Photo_time";
	var json_photo_pic = "Photo_pic";
	var json_commentNum = "CommentsNum";
	var json_likeNum = "LikeNum";
	var json_clientID = "Client_id";
	var photo_id = parent.$("#span_photoID").html();
//	var client_id='';
	var appendImg = '<img alt="'+ photo_id +'"src="' + getData.Table[0][json_photo_pic] + '" id="targetPhoto"/>';
	$("#imgContainer").append(appendImg);
	var appendClient = '';
	appendClient += '<div id="imgInfo">'
				 + '<img id="clientPic" alt="'+ getData.Table[0][json_clientID] +'"src="' + getData.Table[0][json_client_pic] +'"/>'
				 + '<span id="clientName">' + getData.Table[0][json_client_name] + '</span>'
				 + '<button id="followBtn" value="'+getData.Table[0][json_clientID]+'">关&nbsp;注</button>'
				 + '<br />'
				 + '<img id="likeImg" src="img/like1.png"/>'
				 + '<span id="likeNume">' + getData.Table[0][json_likeNum] + '</span>'
				 + '<img id="commentImg" src="img/comment.png"/>'
				 + '<span id="commentNum">' + getData.Table[0][json_commentNum] + '</span>'
				 + '<br />'
				 + '<div id="myLabel"></div>'
				 + '</div>';			 
	$("#textContainer").append(appendClient);
	getLabel();
	
}
function getLabel() {
	var index = parent.layer.getFrameIndex(window.name);
	var getData = parent.$("#span_label").html();
	getData = jQuery.parseJSON(getData);
	var json_table = "Table";
	var json_label_name = "LabelName";
	for(var i=0; i<getData.Table.length; i++) {
		var labelTable = '';
		labelTable += '<span class="label">'+ getData.Table[i][json_label_name] + '</span>';
		$("#myLabel").append(labelTable);
	}	
	var CommentArea_div = '<div id="CommentArea"></div>';
	$("#textContainer").append(CommentArea_div);
	getComment();
}
function getComment() {
	$("#CommentArea").empty();
	var index = parent.layer.getFrameIndex(window.name);
	var getData = parent.$("#span_comment").html();
	getData = jQuery.parseJSON(getData);
	var json_table = "Table";
	var json_content = "Comment_content";
//	var json_commentNum = "Comment_num";
	var json_likeNum = "Like_num";
	var json_print_ID = "PrintUserID";
	var json_print_name = "PrintUserNickname";
	var json_receive_ID = "ReceiveUserID";
	var json_receive_name = "ReceiveUserNickname";
//	alert(getData.Table.length);

	for(var i=0; i<getData.Table.length; i++) {
		var commentTable = '';
//		commentTable += '<div class="comment_one">'
		commentTable += '<div class="comment_one">';
//		alert(getData.Table[i][json_receive_ID]!=-1);
		if(getData.Table[i][json_receive_ID]!=-1) {
			commentTable += '<span class="comment_client_name" title="'+ getData.Table[i][json_print_ID] +'">' + getData.Table[i][json_print_name] + '</span>'
						+ '<span class="comment_normal">回复</span>'
						+ '<span class="comment_client_name" title="'+ getData.Table[i][json_receive_ID] +'">' + getData.Table[i][json_receive_name] + '</span>'
						+ '<span class="comment_text">' + getData.Table[i][json_content] + '</span>';								
		}
		else {
			commentTable += '<span class="comment_client_name" title="'+ getData.Table[i][json_print_ID] +'">' + getData.Table[i][json_print_name] + '</span>'
						+ '<span class="comment_text">' + getData.Table[i][json_content] + '</span>';
		}
		commentTable += '</div>';
		$("#CommentArea").append(commentTable);
	}
	inputComment();
}
function inputComment() {
	var targetArea = '<div id="myComment"><input type="text" name ="comment_input" id="comment_input"value="" placeholder="添加评论"/><button id="submit_comment">发&nbsp;布</button></div>';
	$("#CommentArea").append(targetArea);
}
function clickClient() {
//	$(".client_list img").each( function() {
//		var client_id = $(this).attr("alt");
//		$(this).bind("click", function() {
//			visitClient(client_id);
//		});
//	});
	$("#clientPic").click( function() {
		var client_id = $(this).attr("alt");
		visitClient(client_id);
	})
	$("#CommentArea .comment_client_name").each( function() {
		var client_id = $(this).attr("title");
		var client_replay_name = $(this).html();
		
		$(this).bind("click", function() {
			$("#comment_input").attr("value", "");
			replyComment(client_id, client_replay_name);
		});
	});
	$("#followBtn").click( function() {
		var client_id  = $(this).attr("value");
		var hasFollow = $(this).hasClass("hasFollow");
		followClient(client_id, hasFollow);
	});
}
function visitClient(client_id) {
	var index = parent.layer.getFrameIndex(window.name);
	parent.window.location.href= "photos.html.html?clientID="+client_id;	
    parent.layer.close(index);

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
					$("#followBtn").html("关注");
					$("#followBtn").removeClass("hasFollow");
					layer.msg('取消关注成功', {icon: 1});					
				}
				else {
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
				$("#followBtn").html("已关注");
				$("#followBtn").addClass("hasFollow");
			}
			else {
				layer.msg('程序发生了不可知的错误。。', {icon: 5});
			}
		});		
	}
}
function everLike() {
	var index = parent.layer.getFrameIndex(window.name);
	var getData = parent.$("#span_like").html();
	if(getData=="true") {
		$("#likeImg").attr("src", "img/like2.png");
		$("#likeImg").addClass("like");
	}
	else {
		$("#likeImg").addClass("unlike");
	}
}
//add like
function clickLike() {
	$("#likeImg").click( function() {
		var photo_id = $("#targetPhoto").attr("alt");
//		alert(photo_id);
		likeBack(photo_id);
	});
}
function likeBack(photo_id) {
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
			$("#likeImg").attr("src","img/like2.png");
			$("#likeImg").removeClass("unlike");
			$("#likeImg").addClass("like");	
			apdateNum(photo_id);
		}
		if(data=="c_Succeed") {
			$("#likeImg").attr("src","img/like1.png");
			$("#likeImg").removeClass("like");
			$("#likeImg").addClass("unlike");	
			apdateNum(photo_id);
		}	
		
	});
}
var t;
function replyComment(client_id, client_replay_name) {
//	alert(client_id);
	$("#comment_input").attr("class", client_id);
//	alert($("#comment_input").attr("class"));
	var id ="comment_input";
	$("#"+id).val(''); 
	$("#"+id).val("回复 "+client_replay_name+"："); 	
	t=$("#"+id).val(); 
	$("#"+id).val("").focus().val(t); 
	return;
}
function submitComment() {
	var end_url = "GetPhoto.aspx";
	var receiveID = '-1';
	var photoID = $("#targetPhoto").attr("alt"); 
	$("#submit_comment").click( function() {
		var comment_content = $("#comment_input").val().trim();
		if(!t) {
			//直接评论
			if(comment_content.length == 0) {
				layer.msg('请输入评论',{
					skin: 'layui-layer-molv'
				}, function(){
				});	
				return;
			}
		}
		else {				
			//如果是回复
			if((comment_content.substr(0,t.length)==t)) {
				comment_content= comment_content.substr(t.length);
					if(comment_content.length == 0) {
						layer.msg('请输入评论',{
							skin: 'layui-layer-molv'
						}, function(){
						});	
						return;
					}
					else {
						receiveID = $("#comment_input").attr("class");
					}
			}
			//不是回复
			else {
				if(comment_content.length == 0) {
					layer.msg('请输入评论',{
						skin: 'layui-layer-molv'
					}, function(){
					});	
					return;
				}				
			}
		}
//		alert(receiveID);
		$.post(end_url, 
		{
			action : 1,
			comment_content: comment_content,
 			ru_id : receiveID,
 			p_id : photoID
		}, function(data) {
			if(data == "Succeed") {
				//alert(photoID);
				apdateNum(photoID);
				upDateComment();
	var body_width = $("body").width();
	var img_width = $("#targetPhoto").width();
	$("#imgInfo").width(body_width-img_width-30);
	$("#myComment").width(body_width-img_width-20);
	$("#textContainer").css("margin-left", img_width+15);
		everLike();
	clickLike();
	clickClient();
	submitComment();
	ifFollow();
//				resetImage();
			}
			else {
				//alert("123");
				layer.msg('程序发生了不可知的错误。。', {icon: 5});				
			}
		})

	});
}
//更新点赞数和评论数
function apdateNum(photo_id) {
	var end_url="../GetPhoto_Details.aspx";	
	var json_likeNum = "LikeNum";
	var json_commentNum = "CommentsNum";
	$.post(end_url,
	{
		action: "0",
		p_id: photo_id
	}, function(data) {
		var getData = eval("(" + data + ")");
		var comment_num = getData.Table[0][json_commentNum];	
		var like_num = getData.Table[0][json_likeNum];	
//		alert(like_num);
//		alert($("#likeNume").html());
		$("#likeNume").html(like_num);
		$("#commentNum").html(comment_num);
	});
	
}
function ifFollow() {
	var client_id = $("#clientPic").attr("alt");
	var end_url = "GetFan_FolloweeInfo.aspx";
	$.post( end_url, 
	{
		action: "4",
		if_id: client_id
	}, function(data) {
		if(data=="followed") {
			$("#followBtn").html("已关注");
			$("#followBtn").addClass("hasFollow");
		}
		else if (data =="notfollowed") {
			$("#followBtn").html("关&nbsp;注");
		}
	});
}
//动态刷新评论
function upDateComment() {
//	alert("flush");
	$("#CommentArea").empty();
//	var getData = parent.$("#span_comment").html();
//	getData = jQuery.parseJSON(getData);
	var end_url="../GetPhoto_Details.aspx";	
	photo_id = $("#targetPhoto").attr("alt");
	$.post( end_url,
	{
		action: "1",
		p_id: photo_id
	}, function(data) {
		var json_table = "Table";
		var json_content = "Comment_content";
		var json_likeNum = "Like_num";
		var json_print_ID = "PrintUserID";
		var json_print_name = "PrintUserNickname";
		var json_receive_ID = "ReceiveUserID";
		var json_receive_name = "ReceiveUserNickname";
		var getData = eval("(" + data + ")");
		for(var i=0; i<getData.Table.length; i++) {
			var commentTable = '';
		//		commentTable += '<div class="comment_one">'
			commentTable += '<div class="comment_one">';
			if(getData.Table[i][json_receive_name]) {
				commentTable += '<span class="comment_client_name" title="'+ getData.Table[i][json_print_ID] +'">' + getData.Table[i][json_print_name] + '</span>'
							+ '<span class="comment_normal">回复</span>'
							+ '<span class="comment_client_name" title="'+ getData.Table[i][json_receive_ID] +'">' + getData.Table[i][json_receive_name] + '</span>'
							+ '<span class="comment_text">' + getData.Table[i][json_content] + '</span>';								
			}
			else {
				commentTable += '<span class="comment_client_name" title="'+ getData.Table[i][json_print_ID] +'">' + getData.Table[i][json_print_name] + '</span>'
							+ '<span class="comment_text">' + getData.Table[i][json_content] + '</span>';
			}
			commentTable += '</div>';
			$("#CommentArea").append(commentTable);
		}
		inputComment();	
	});
//	inputComment();
}

