/*function shou()
{
    $("#comments").attr("class", "com-no-display");
    $("#la").attr("class", "display");
}
function la() {
    $("#comments").attr("class", "com-display");
    $("#la").attr("class", "com-no-display");
}*/
function clickhref(path) {
    window.location.href = path;
}

/*function cancel() {
    $("#selectphoto").attr("class", "com-no-display");
    $("body").css("background-color", "rgb(237,237,239)");
}*/

/*function myNomouse(imgpath) {
    $("#file").css("background-image", "url(" + imgpath + ")");
}
*/
/*function reply(id) {
    var p = $("#" + id).parent().attr("id");//获取该按钮的父元素div
    var name = $("#" + p).find("span").eq(0).text();//获取.lnn元素的文本
    $("#com").attr("placeholder", "回复  " + name + ":");
}*/

$("document").ready( function() {
	$("#add").click( function() {
		var index = layer.open( {
			title: '上传照片',
			type: 2,
			area: ['1366px', '768px'],
			maxmin: true, 
			shadeClose: true,
      		shade: false,
			content: 'ImageDesign/index.html'
		});
		layer.full(index);
	});
	get_clients();
	//resetImage();
	resetLike();
	//clickLike();
	//clickClient();
	//reply();
});

function get_clients() {
    //异步请求
    //alert("1");
    $.ajaxSetup({
        async: false
    });
    var end_url = "../HomePage.aspx";
    $.post(end_url,
	{
	    action: "0"
	}, function (data) {
	    var json_table1 = "Table";
	    var json_client_id = "FolloweeID";
	    var json_client_name = "NickName";
	    var json_tx = "Followee_pic";
	    var json_photo = "Photo_pic";
	    var json_photo_id = "Photo_id";
	    var json_comnum = "CommentsNum";
	    var json_likenum = "LikeNum";
	    var getData1 = eval("(" + data + ")");
	    var getData2 = '';
	    var json_label = '';
	    for (var i = 0; i < getData1[json_table1].length; i++) {
	        var targetTable = '';
	        targetTable += '<div class="container">'
              + '<img src="' + getData1[json_table1][i][json_tx] + '"class="client_pic" alt="' + getData1[json_table1][i][json_client_id] + '">'
              + '<span class="nikename"> ' + getData1[json_table1][i][json_client_name] + '</span><br/>'
              + '<img class="photo" src="' + getData1[json_table1][i][json_photo] + '" " alt ="' + getData1[json_table1][i][json_photo_id] + '">' + '<br/>'
              + '<div class="label_content">'+'<img class="label" src="img/label.png"/>'
              + '<span class="label">' +  '</span></div>'
              + '<div class="tb_content">'+'<button  class="comment"></button>' + '<span class="num">' + getData1[json_table1][i][json_comnum] + '</span>'
              + '<button  class="share"></button>'
              + '<button class="unlike"></button><span class="num">' + getData1[json_table1][i][json_likenum] + '</span></div><br/>'
              + '</div>'
              + '<div class="comments " ><input type="text"  class="com"/>'
              + '<button class="publish">发 表</button><br /><br />'
              + '</div>'
              + '<br /><br />';
	        $("#content").append(targetTable);
	    }
	});
    var photoLength = $(".photo").length;
    var json_table1 = "Table";
    var json_LabelName = "LabelName";
    for(var i=0; i<photoLength; i++) {
        $.post(end_url,
            {
                action: "2",
                pa_id: $(".photo").eq(i).attr("alt")
            }, function (data) {
                var getData1 = eval("(" + data + ")");
                var temp_label = '';
                for (var j = 0; j < getData1[json_table1].length; j++) {
                    
                    temp_label += getData1[json_table1][j][json_LabelName];
                    
                }
                $("span.label").eq(i).text(temp_label);
                
            });
    }
   // alert("2");
    var photoLength = $(".photo").length;
    for (var i = 0; i < photoLength; i++) {
        $.post(end_url,
           {
               action: "1",
               p_id: $(".photo").eq(i).attr("alt")
           }, function (data) {
               var json_table1 = "Table";
               var json_com_pid = "PrintUserID";
               var json_com_pname = "PrintUserNickname";
               var json_com_ptx = "PrintUser_pic";
               var json_com_rtx = "ReceiveUserID";
               var json_com_rname = "ReceiveUserNickname";
               var json_com_rtx = "ReceiveUser_pic";
               var json_com_cont = "Comment_content";
               var json_com_time = "Comment_time";
               var getData3 = eval("(" + data + ")");
               var targetTable2 = '';
               for (var m = 0; m < getData3[json_table1].length; m++) {
                   targetTable2 += '<div class="c">'
                    + '<img src="' + getData3[json_table1][m][json_com_ptx] + '"class="luser" alt="' + getData3[json_table1][m][json_com_pid] + '">'
                    + '<span class="lnn"> ' + getData3[json_table1][m][json_com_pname] + '</span>'
                    + '<span class="com">' + getData3[json_table1][m][json_com_cont] + '</span><br/>'
                    + ' <span class="time">' + getData3[json_table1][m][json_com_time] + '</span>'
                    + ' <button  class="reply" >回复</button> '
                    + '</div>';

               }
               $(".comments").eq(i).append(targetTable2);

           });
    }


    }
    //$.post(end_url, 
    //    {
    //        action: "",


	        //$.post(end_url,
            //           {
            //               action: "1",
            //               p_id: json_photo_id
            //           }, function (data) {
            //               var json_table2 = "Table";
            //               var json_com_pid = "PrintUserID";
            //               var json_com_pname = "PrintUserNickname";
            //               var json_com_ptx = "PrintUser_pic";
            //               var json_com_rtx = "ReceiveUserID";
            //               var json_com_rname = "ReceiveUserNickname";
            //               var json_com_rtx = "ReceiveUser_pic";
            //               var json_com_cont = "Comment_content";
            //               var json_com_time = "Comment_Time";
            //               var getData3 = eval("(" + data + ")");
            //               for (var i = 0; i < getData3[json_table2].length; i++) {
            //                   var targetTable2 = '';
            //                   targetTable2 += '<div class="c">'
            //                               + '<img src="' + getData3[json_table2][i][json_com_ptx] + '"class="luser" alt="' + getData3[json_table2][i][json_com_pid] + '">'
            //                               + '<span class="lnn"> ' + getData3[json_table2][i][json_com_pname] + '</span>'
            //                               + '<span class="com">' + getData3[json_table2][i][json_com_cont] + '</span><br/>'
            //                               + ' <span class="time">' + getData3[json_table2][i][json_com_time] + '</span>'
            //                               + ' <button  class="reply" >回复</button> '
            //                               + '</div>'
            //               }
            //               $(".comments").append(targetTable2);
            //           });
	    //}
	   
	//});
	    //
	   



/*function resetImage() {
    $(".client_pic,.luser ,.photo").each(function () {
        var height = $(this).height();
        var width = $(this).width();
        var rate = height / width;
        if (rate < 1) {
            if ($(this).css("width")) {
                $(this).css("width", "auto");
            }
            $(this).css("height", "100%");
        }
        else {
            if ($(this).css("height")) {
                $(this).css("height", "auto");
            }
            $(this).css("width", "100%");
        }
    });
}*/

function resetLike() {//加载时判断是否点过赞
    
    var end_url = "../If_Liked.aspx";
    $.post(end_url,
	{
	}, function (data, status) {
	    var json_table = "Table";
	    var json_Photo_id = "Photo_id";
	    var json_IF_Liked = "IF_Liked";
	    var getData = eval("(" + data + ")");
	    $(".photo").each(function () {
	        for (var i = 0; i < getData[json_table].length; i++) {
	            if ($(this).attr("alt") == getData[json_table][i][json_Photo_id]) {
	               
	                if (getData[json_table][i][json_IF_Liked] == "Y") {
	                    
	                    $(this).siblings(".tb_content").children().eq(3);
	                 //   alert($(this).siblings(".tb_content").children().eq(3));
	                    $(this).parent().find("button").eq(2).removeClass("unlike");
	                    $(this).parent().find("button").eq(2).addClass("like");
	                    
	                    //						var orignin_num = $(this).parent(".post-thumbnail").next(".content-wrap").children(".featured-image").children("img").eq(0).next().html();
	                    //						orignin_num = parseInt(parseInt(orignin_num) + 1);
	                    //						$(this).parent(".post-thumbnail").next(".content-wrap").children(".featured-image").children("img").eq(0).next().html(orignin_num);
	                }
	            }
	        }

	    });
	});
}
function likeBack(photo_id) {
   // alert("like:"+photo_id);
    //	return;
    
    var end_url = "../GetPhoto.aspx";
    var data_unlike = "unlike";
    var data_like = "like";
    var like_class = $(this).attr("class");


    $.post(end_url,
	{
	    action: "2",
	    p_id: photo_id
	}, function (data) {
	    //		alert(data);
	    //得到点赞或取消赞
	    if (data == "a_Succeed") {
	        //			alert(data);
	        $(".deal_now").removeClass("unlike");
	        $(".deal_now").addClass("like");
	        var orignin_num = $(".deal_now").next().html();
	        orignin_num = parseInt(parseInt(orignin_num) + parseInt(1));
	        $(".deal_now").next().html(orignin_num);
	    }
	    if (data == "c_Succeed") {
	        //			alert(data);
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
    $(".like").each(function () {
        var pid = $(this).parent().parent().find("img").eq(1).attr("alt");
        $(this).bind("click", function () {
            //alert(pid);
            if (!((!$(this).hasClass("like"))&& ($(this).hasClass("unlike")))) {
                return false;
            }
            //alert(pid);
            likeBack(pid);
            $(this).addClass("deal_now");

            if_like = true;
            setTimeout(function () { //delat for avoid double-click
                if_like = false;
            }, 100);

        });
    });
}

function clickClient() {
    $(".client_pic").each(function () {
        var client_id = $(this).attr("alt");
        $(this).bind("click", function () {
            visitClient(client_id);
        });
    });
    $(".nikename").each(function () {
        var client_id = $(this).prev().attr("alt");
        $(this).bind("click", function () {
            visitClient(client_id);
        });
    });
    $(". luser").each(function () {
        var client_id = $(this).attr("alt");
        $(this).bind("click", function () {
            visitClient(client_id);
        });
    });
    $(".lnn").each(function () {
        var client_id = $(this).prev().attr("alt");
        $(this).bind("click", function () {
            visitClient(client_id);
        });
    });
}


function visitClient(client_id) {
    window.location.href = "HomePage.html?clientID=" + client_id;
}
function reply() {
    $(".reply").each(function () {
        $(this).bind("click", function () {
            var name = $(this).parent().find("span").eq(0).text();
            $(this).parent().parent().find("input").eq(0).attr("placeholder", "回复  " + name + ":");
        });
    });
}