$("document").ready( function() {
	$(".w-item img").each( function() {
		$(this).bind("click", function() {
			alert();
			
		});
	});
	var load = false;
	$("#test img").bind("click",function(){
		var src = ($(this).attr("src"));
		var load = false;
	   	var alt = ($(this).attr("alt"));
	// 	alert(alt);
		if(!load) {
			wmark.init({
				/* config goes here */
				"position": "bottom-right", // default "bottom-right"
				"opacity": 50, // default 50
				"className": alt, // default "watermark"
				"path": src
			});
		
			load = true;
		}
		var pics = $("#picWrapper img");
		pics.addClass(alt);
	});
	
	$("#Goback").click( function() {
		var src = $(".eg-wrapper .cropper-hidden").attr("src");
//		alert(src);
		$("#cluster").attr("style", "display:none");
		$("#alloy").attr("style", "display:block");
	});
	var origin_src = $("#picWrapper .pic").attr("src");
	$("#picWrapper .pic").load( function() {
		var height = $(this).height();
		var width = $(this).width();
		var rate = height/width;
		if(rate>1) {
			if($(this).css("width")) {
				$(this).css("width", "");
			}
			$(this).css("height", "100%");		
		}
		else {
			if($(this).css("height")) {
				$(this).css("height", "");
			}			
			$(this).css("width", "100%");
//			if($(this).hasClass("moreHeight"))
//				$(this).removeClass("moreHeight");
//			$(this).addClass("moreWidth")
		}
	});
});
