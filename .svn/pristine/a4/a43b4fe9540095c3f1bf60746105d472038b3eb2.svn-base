function shou()
{
    $("#comments").attr("class", "com-no-display");
    $("#la").attr("class", "display");
}
function la() {
    $("#comments").attr("class", "com-display");
    $("#la").attr("class", "com-no-display");
}
function clickhref(path) {
    switch(path)
    {
        case "HomePage.html":
            $("#btn_homepage").attr("class", "display");
            $("#btn_scan").attr("class", "no-display");
            $("#btn_more").attr("class", "no-display");
            break;
        case "scan.html":
            $("#btn_homepage").attr("class", "no-display");
            $("#btn_scan").attr("class", "display");
            $("#btn_more").attr("class", "no-display");
            break;
        case "more.html":
            $("#btn_homepage").attr("class", "no-display");
            $("#btn_scan").attr("class", "no-display");
            $("#btn_more").attr("class", "display");
            break;
        default:
            break;
    }
    window.location.href = path;
}
function selectphoto(path) {
    /*$("#selectphoto").attr("class", "com-display");
    $("body").css("background-color", "rgba(0,0,0,0.75)");*/
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
function reply(num) {
   // var btn = $(this).id;//获取按钮id
   // var p = $("btn").parent().id;//获取该按钮的父元素div
   // var name = $("#div").children(".lnn").text();//获取该div中的.lnn元素
   // var name = $("p").find("span").eq(1).text();//获取.lnn元素的文本

   // alert(btn);
    switch (num) {
        case 1:
            var name = $("#c1").find("span").eq(0).text();
            break;
        case 2:
            var name = $("#c2").find("span").eq(0).text();
            break;
        case 3:
            var name = $("#c3").find("span").eq(0).text();
            break;
    }
    $("#com").attr("placeholder", "回复  "+name+":");
    
}
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
});
