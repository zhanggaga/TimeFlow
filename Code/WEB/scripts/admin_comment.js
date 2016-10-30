function clickhref(path) {
    window.location.href = path;
}
$(document).ready(function () {
    getCommentInfo();
});

function getCommentInfo() {
    var end_url = "../MaComent.aspx";
    $.post(end_url,
	{
	}, function (data) {
	    var json_table = "Table";
	    var json_comment_id = "ID";
	    var json_comment_pid = "PrintUserID";
	    var json_comment_cont = "Content";
	    var json_comment_time = "Time";
	    var getData = eval("(" + data + ")");
	    for (var i = 0; i < getData[json_table].length; i++) {
	        var targetTable = '';

	        targetTable += '<tr>' + '<td>' + getData[json_table][i][json_comment_id] + '</td>'
             + '<td>' + getData[json_table][i][json_comment_pid] + '</td>'
	         + '<td>' + getData[json_table][i][json_comment_cont] + '</td>'
             + '<td>' + getData[json_table][i][json_comment_time] + '</td>'
             + '<td><button class="m_btn">删除</button></td>' + '</tr>';

	        $("#table_comment").append(targetTable);

	    }
	    manage();
	});
}
function manage() {
    $(".m_btn").each(function () {
        $(this).bind("click", function () {
                var cid = $(this).parent().parent().find("td").eq(0).text();
                var t = $.ajax({
                    type: "Post",
                    url: "../Ma_DelComment.aspx",
                    data: "&ID=" + escape(cid),
                    async: false
                }).responseText;
                if (t == 'success') {
                    alert("删除成功");
                    $(this).parent().parent().empty();
                }
                else {
                    alert("操作失败");
                }
        });
    });
}

