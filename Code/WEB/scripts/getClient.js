function getClientInfo() {
	$("#userArea").empty();
//	alert();
	var now_href = window.location.href;
	
	if(now_href.indexOf("?clientID=")!=-1) {
		var srcs = Array();
		srcs = now_href.split("?clientID=",2);
		client_id += srcs[1];
	}	
	var end_url = "Scan_MyPhoto.aspx";
	var json_table = "Table";
	var json_clientID = "Client_id";
	var json_clientName = "Client_name";
	var json_albumNum = "album_num";
	var json_followNum = "follow_num"; //粉丝
	var json_followeeNum = "followee_num"; //关注
	var json_likeNum = "like_num";
	var json_photoNum = "photo_num";
	var json_clientPic = "Client_pic";
	var client_id = '';
	if(now_href.indexOf("?clientID=")!=-1) {
		var srcs = Array();
		srcs = now_href.split("?clientID=",2);
		client_id += srcs[1];
	}
	
//	alert(location.href);
//	return;
	$.post( end_url, 
	{
		c_id : client_id,
		action: "1"
	}, function(data, status) {
		var getData = eval("(" + data + ")");
		for(var i = 0; i< getData[json_table].length; i++){
			var targetTable = '';
			targetTable += '<div id="userintro">'
						+ '<div id="textDetail">'
						+ '<span>' + getData[json_table][i][json_clientName] + '</span>'
						+ '<button id="followBtn" value ="' + getData[json_table][i][json_clientID] + '">关&nbsp;注<tton>'
						+ '</div><div id="imgDetail">'
						+ '<img src="' + getData[json_table][i][json_clientPic] +'" alt="'+ getData[json_table][i][json_clientID] +'"/>'
						+ '</div>'
                        + '</div>'
                        +' <div id="userInfor">'
						+ '<div id="photo">'
						+ '<span>' + getData[json_table][i][json_photoNum] + '</span><br />'
						+ '<span>照片</span></div>'
						+ '<div id="follower">'
						+ '<span>' + getData[json_table][i][json_followNum] + '</span><br />'
						+ '<span>粉丝</span></div>'
						+ '<div id="followee">'
						+ '<span>' + getData[json_table][i][json_followeeNum] + '</span><br />'
						+ '<span>关注</span></div>'
						+ '<div id="hdp"style="padding-right:70px">'
						+ '<span>' + '</span><br />'
						+ '<span >时间轴</span></div>'
                        +'</div>'
						+ '</div>';
			$("#userArea").append(targetTable);		
//			alert(targetTable);
		}		
		getLocation();
	});
};
function getLocation() {
	var href_now = location.href;
	var keyWord = "?clientID=";
	
	if(href_now.indexOf(keyWord)==-1) {
		$("#followBtn").attr("style", "display: none;");
		$("#textDetail").attr("style", "right: 550px;");
	}	
	else {		
		if_Follow();		
	}
	
	clickLink();
}
function followBtn() {
	$("#followBtn").click( function() {
		var client_id = $("#imgDetail img").attr("alt");
		var follow_if;
		if($(this).hasClass("follow_y")) {
			follow_if = true;
		}
		else {
			follow_if = false;
		}
		follow_Client(follow_if, client_id);
	});
}
function if_Follow() {	
	var client_id = $("#imgDetail img").attr("alt");
	var end_url = "GetFan_FolloweeInfo.aspx";
	$.post( end_url, 
	{
		action: "4",
		if_id: client_id
	}, function(data) {
		if(data=="followed") {
			$("#followBtn").html("已关注");
			$("#followBtn").addClass("follow_y");
		}
		else if (data =="notfollowed") {
			$("#followBtn").html("关&nbsp;注");
		}
	});
	
	followBtn();
	
}
function follow_Client(follow_if, client_id) {
	if(follow_if) {
		layer.confirm('确定取消关注吗？', {
			title: '',
			btn: ['确定','取消'] //按钮
		}, function(){
			var end_url = "GetFan_FolloweeInfo.aspx";
			$.post(end_url,
			{
				action : "3",
				c_id: client_id
			}, function(data) {
				if(data=="Succeed") {
					$("#followBtn").html("关&nbsp;注");
					$("#followBtn").removeClass("follow_y");
					var orign_num = $("#follower").children().first();
					var num = orign_num.html();
					num -= 1;
					orign_num.html(num);					
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
	else {
		var end_url;
		$.post(end_url = "../GetFan_FolloweeInfo.aspx",
		{
			action : "2",
			f_id: client_id
		}, function(data) {
			if(data=="Succeed") {
				$("#followBtn").html("已关注");
				$("#followBtn").addClass("follow_y");	
				var orign_num = $("#follower").children().first();
				var num = parseInt(orign_num.html());
				num += 1;
				orign_num.html(num);					
			}
			else {
				layer.msg('程序发生了不可知的错误。。', {icon: 5});
			}
		});		
	}
	
}
function clickLink() {
	var now_href = window.location.href;
	var client_id = '';
	if(now_href.indexOf("?clientID=")!=-1) {
		var srcs = Array();
		srcs = now_href.split("?clientID=",2);
		client_id += "?clientID=" + srcs[1];
	}
	$("#photo").click( function() {
		window.location.href = "photos.html" + client_id;
	});
	$("#follower").click( function() {
		window.location.href = "fans.html" + client_id;
	});
	$("#followee").click( function() {
		window.location.href = "follows.html" + client_id;
	});
	$("#hdp").click( function() {
		window.location.href = "hdp.html" + client_id;
	});
//	return client_id;
}

