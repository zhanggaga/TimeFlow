function clickhref(path) {
    window.location.href = path;
}
$("document").ready( function() {
	getClientInfo();
	getFans();
	getFansNum();
});
function getFansNum() {
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
	var json_followNum = "follow_num"; 
	var client_id = '';
	if(now_href.indexOf("?clientID=")!=-1) {
		var srcs = Array();
		srcs = now_href.split("?clientID=",2);
		client_id += srcs[1];
	}
	$.post( end_url,
	{
		c_id : client_id,
		action: "1"		
	}, function(data) {
		var getData = eval("(" + data + ")");
		var fansNum = getData[json_table][0][json_followNum];
//		alert(fansNum);
//		alert($("#fansNum_Total").html());
		$("#fansNum_Total").html(fansNum);
	})
}
//初始化时 if follow? list表的follow
function ifFollow() {
	$(".follow_0").each( function() {
		this.innerHTML = "关&nbsp;注";
	});
	$(".follow_1").each( function() {
		this.innerHTML = "已关注";
	});
}
function clickClient() {
	$(".othersPic").each( function() {
		var client_id = $(this).attr("alt");
		$(this).bind("click", function() {
			visitClient(client_id);
		});
	});
	$(".detail_name").each( function() {
		var client_id = $(this).parent(".textDetail").next(".imageDetail").children("img").attr("alt");
		$(this).bind("click", function() {
			visitClient(client_id);
		});
	});
}
function clickFollow() {
	$(".detail_one button").each( function() {
		$(this).bind("click", function() {
			var follow_if = $(this).hasClass("follow_1"); //T-follow
			$(this).addClass("deal_now");
			var client_id = $(this).val();			
			followClient(follow_if,client_id);
			ifFollow();
		});
		
	})
}
function followClient(follow_if, client_id) {
	if(follow_if) {
		layer.confirm('确定取消关注吗？', {
			title: '',
			btn: ['确定','取消'] //按钮
		}, function(){
			var end_url = "../GetFan_FolloweeInfo.aspx";
			$.post(end_url,
			{
				action : "3",
				if_id: client_id
			}, function(data) {
				if(data=="Succeed") {
					$(".deal_now").html("关&nbsp;注");
					var orign_num =$(".deal_now").next(".textDetail").find(".detail_li_fan_num");
					$(".deal_now").attr("class", "follow_0");
					var num = orign_num.html();
					num -= 1;
					var my_num = parseInt($("#followee span").eq(0).html());
					my_num -=1;
					$("#followee span").eq(0).html(my_num);
					orign_num.html(num);
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
	else {
		var end_url;
		$.post(end_url = "../GetFan_FolloweeInfo.aspx",
		{
			action : "2",
			f_id: client_id
		}, function(data) {
			if(data=="Succeed") {
				$(".deal_now").html("已关注");
				var orign_num =$(".deal_now").next(".textDetail").find(".detail_li_fan_num");				
				$(".deal_now").attr("class", "follow_1");	
				var num = parseInt(orign_num.html());
				num += 1;
				var my_num = parseInt($("#followee span").eq(0).html());
				my_num +=1;
				$("#followee span").eq(0).html(my_num);				
				orign_num.html(num);				
			}
			else {
				$(".deal_now").removeClass("deal_now");
				layer.msg('程序发生了不可知的错误。。', {icon: 5});
			}
		});		
	}
	getFansNum();
	
}
function visitClient(client_id) {
	window.location.href= "photos.html?clientID="+client_id;
}
function getFans() {
	$("#detail").empty();
	var end_url = "../GetFan_FolloweeInfo.aspx";
	var json_table = "Table";
	var json_client_id = "Follower_id"; //目标用户ID
	var json_followerNum = "Follower_num"; //粉丝数目
	var json_followeeNum = "Followee_num"; //关注者数目
	var json_client_name = "Nickname"; // 目标用户昵称
	var json_sex = "Sex"; //性别
	var json_pic = "Client_pic";
	var json_country = "Country";
	var json_province = "Province";
	var json_city = "City";
	var json_ifFollowed = "IF_Followed";
	var now_href = window.location.href;
	var client_id = '';
	if(now_href.indexOf("?clientID=")!=-1) {
		var srcs = Array();
		srcs = now_href.split("?clientID=",2);
		client_id += srcs[1];
	}	
	$.post(end_url, 
	{
		c_id : client_id,
		action: "0"
	}, function(data, status){
		var getData = eval("(" + data + ")");
		for(var i=0; i<getData[json_table].length; i++) {
			var targetTable = '';
			targetTable += '<div class="detail_one">'
						+ '<button class="follow_'+(getData[json_table][i][json_ifFollowed]) +'" value="'+getData[json_table][i][json_client_id] +'">关注</button>'
						+ '<div class="textDetail">'
						+ '<span class="detail_name">' + getData[json_table][i][json_client_name]+ '&nbsp;&nbsp;</span>'
						+ '<img src="'+ "img/".trim() +(getData[json_table][i][json_sex]).trim()+'.png" class="detail_sex" /><br />'
						+ '<ul class="detail_ul">'
						+ '<li class="detail_li_follow">'
						+ '<span class="detail_li_follow_span detail_li_title">关注&nbsp;&nbsp;</span>'
						+ '<span class="detail_li_follow_num">' + getData[json_table][i][json_followeeNum] +'&nbsp;&nbsp;</span></li>'
						+ '<li class="detail_li_fan">'
						+ '<span class="detail_li_follow_span detail_li_title">粉丝&nbsp;&nbsp;</span>'
						+ '<span class="detail_li_fan_num">' + getData[json_table][i][json_followerNum] + '</span></li>'
						+ '</ul>'
						+ '<span class="detail_adrress detail_li_title">地址&nbsp;&nbsp;</span>'
						+ '<span class="detail_adrress_val">' + getData[json_table][i][json_country] +'&nbsp;' 
						+ getData[json_table][i][json_province] +'&nbsp;' + getData[json_table][i][json_city]
						+ '</span><br />'
						+ '</div>'
						+ '<div class="imageDetail">'
						+ '<img alt="'+ getData[json_table][i][json_client_id] +'"class="othersPic" src="' + getData[json_table][i][json_pic] +'" />'
						+ '</div></div>';
			$("#detail").append(targetTable);
		}
		ifFollow();
		clickClient();
		clickFollow();
		ifMyPage();
//		clickLink();
	});
	
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

