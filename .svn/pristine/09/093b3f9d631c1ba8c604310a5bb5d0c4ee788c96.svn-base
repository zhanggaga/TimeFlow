function clickhref(path) {
    window.location.href = path;
}

$(document).ready(function () {
    get_photos();
});
function get_photos() {
    var end_url = "../MaPhoto.aspx";
    $.post(end_url,
	{
	}, function (data) {
	    var json_table = "Table";
	    var json_photo_url = "Pic";
	    var json_photo_id = "ID";
	    var getData = eval("(" + data + ")");
	    var colume_num = 3;
	    for (var i = 0; i < getData[json_table].length; i++) {
	        var targetTable = '';
	        if (i % colume_num == 0) {
	            targetTable += '<div class="photoRow"></div>';
	        }
	        $("#PhotoContainer").append(targetTable);
	        targetTable = '';
	        targetTable += '<div class="photoContainer">';
	        targetTable += '<article class="post-152 post type-post status-publish format-standard hentry category-people category-photos">'
	        + '<div class="post-format-content">'
            + '<div class="post-thumbnail">'
            + '<img src="' + getData[json_table][i][json_photo_url] + '" alt ="' + getData[json_table][i][json_photo_id] + '"class="attachment-thumbnail wp-post-image">'
	        + '</div>'
	        + '<div class="content-wrap">'
            + '<span class="featured-image"><img class="delete" src="img/delete.png">' 
            + '</span></div></div></article>'
            + '</div>';


	        $(".photoRow").eq(parseInt(i / colume_num)).append(targetTable);

	    }
	    resetImage();
	    delete_photo();
	});
}
function resetImage() {
    $(".photoContainer article .post-format-content .post-thumbnail img").each(function () {
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
}
function delete_photo() {
    $(".delete").each(function () {
        $(this).bind("click", function () {
            var pid = $(this).parent().parent().prev().find("img").eq(0).attr("alt");
            var t = $.ajax({
                type: "Post",
                url: "../Ma_DelPhoto.aspx",
                data: "&ID=" + escape(pid),
                async: false
            }).responseText;
            if (t == 'success') {
                alert("删除成功");
                $(this).parents(".photoContainer").empty();
                window.location.href = "../admin_photo.html";

            }
            else {
                alert("删除失败");
            }
        });
    });
}
