function clickhref(path) {
    window.location.href = path;
}
$(document).ready( function() {
    getUserInfo();
});

function getUserInfo() {
    var end_url = "../ManagementInfo.aspx";
    $.post(end_url,
	{
	}, function (data) {
	    var json_table = "Table";
	    var json_user_id = "ID";
	    var json_user_mail = "Mail";
	    var json_user_phone = "Phone";
	    var json_user_nickname = "NickName";
	    var json_user_pic = "Pic";
	    var json_user_sex = "Sex";
	    var json_user_cou = "Country";
	    var json_user_pro = "Province";
	    var json_user_cit = "City";
	    var json_user_feenum= "FolloweeNum";
	    var json_user_fernum = "FollowerNum";
	    var json_user_state = "LockState";//1表示未封锁，0表示封锁
	    var getData = eval("(" + data + ")");
	    for (var i = 0; i < getData[json_table].length; i++) {
	        var targetTable = '';
	
	        targetTable += '<tr>' + '<td>' + getData[json_table][i][json_user_id] + '</td>'
             + '<td>' + getData[json_table][i][json_user_mail] + '</td>'
	         + '<td>' + getData[json_table][i][json_user_phone] + '</td>'
             + '<td>' + getData[json_table][i][json_user_nickname] + '</td>'
             + '<td>' + getData[json_table][i][json_user_pic] + '</td>'
             + '<td>' + getData[json_table][i][json_user_sex] + '</td>'
             + '<td>' + getData[json_table][i][json_user_cou] + '</td>'
             + '<td>' + getData[json_table][i][json_user_pro] + '</td>'
             + '<td>' + getData[json_table][i][json_user_cit] + '</td>'
             + '<td>' + getData[json_table][i][json_user_feenum] + '</td>'
             + '<td>' + getData[json_table][i][json_user_fernum] + '</td>';

	        var state = getData[json_table][i][json_user_state];
	        if (state == "1") {
	            targetTable +=  '<td><button class="m_btn">封锁</button></td>'+'</tr>';
	        }
	        if (state == "0") {
	            targetTable +=  '<td ><button class="m_btn">解除封锁</button></td>' + '</tr>';
	        }


	        $("#table_user").append(targetTable);
	       
	    }
	    manage();
	});
}

	    function manage() {
	        $(".m_btn").each(function () {
	            $(this).bind("click",function () {
	                var a = $(this).text();
	                if (a == "封锁") {
	                    var b = "lock";
	                    var u_uid = $(this).parent().parent().find("td").eq(0).text();
                        var t = $.ajax({
                                type: "Post",
                                url: "../LockUser.aspx",
                                data: "Type=" + b+"&ID=" + escape(u_uid) ,
                                async: false
                            }).responseText;
                        if (t == 'success_lock') {
                            alert("封锁成功");
                            $(this).empty();
                            $(this).html("解除封锁");
                        }
                        else {
                            alert("操作失败");
                        }
	                
	                }
	                else if (a = "解除封锁") {
	                    var b = "unlock";
	                    var u_uid = $(this).parent().parent().find("td").eq(0).text();
	                    var t = $.ajax({
	                        type: "Post",
	                        url: "../LockUser.aspx",
	                        data: "Type=" + b + "&ID=" + escape(u_uid),
	                        async: false
	                    }).responseText;
	                    if (t == 'success_unlock') {
	                        alert("解锁成功");
	                        $(this).empty();
	                        $(this).html("封锁");
	                    }
	                    else {
	                        alert("操作失败");
	                    }
	                }

	            });
	        });
	    }

