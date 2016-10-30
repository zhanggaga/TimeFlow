function viewPhoto(photo_id) {
	var end_url="../GetPhoto_Details.aspx";	
	var input_myphoto = '<span id="span_photoID">' + photo_id + '</span>';
	$("#forDeatil").append(input_myphoto);
	var json_table = "Table";
	var json_photo_pic = "Photo_pic";
	var img_height =0 , img_width=0;
	//异步请求
	$.ajaxSetup({   
            async : false  
        }); 
	
	//client_photo
	$.post(end_url,
	{
		action: "0",
		p_id: photo_id
	},function(data) {
		var getData = eval("(" + data + ")");
		var img = '<img id="tempPhoto" src="' + getData.Table[0][json_photo_pic] +'" />';
		$("#forDeatil").append(img);
		img_height = $("#tempPhoto").height();
		img_width = $("#tempPhoto").width();
//		alert(img_height+' '+img_width);
		var input_client = '<span id="span_client">' + data + '</span>';	
		$("#forDeatil").append(input_client);	

	});	
	//label
	$.post( end_url,
	{
		action: "2",
		p_id: photo_id
	}, function(data) {
		var input_mylabel = '<span id="span_label">' + data + '</span>';	
		$("#forDeatil").append(input_mylabel);
		
	});
	//Comments
	$.post( end_url,
	{
		action: "1",
		p_id: photo_id
	}, function(data) {
		var input_comment = '<span id="span_comment">' + data + '</span>';	
		$("#forDeatil").append(input_comment);
	});

	getNewWindow(img_width,img_height);
	
}
function getNewWindow(img_width,img_height) {
		var rate = img_width/img_height;
		
		if(img_width>img_height) {
			if(parseInt(img_width) > 600) {
				img_width = 600;
				img_height = 600/rate;
			}
		}
		else {
			if(parseInt(img_height)>600) {
				img_height = 600;
				img_width = 600*rate;
			}
		}
//		if(img_height<250) {
//			img_height = 250;
//		}
		if(img_width<250) {
			img_width = 250;
		}
		img_width = parseInt(parseInt(img_width) + 300);
		
		var width_value = img_width + 'px';
		var height_value = img_height + 'px';
		var offset_top = (768 - img_height - 50)/2;
		var offset_left = (1200 - img_width + 100)/2;
		offset_top = offset_top + 'px';
		offset_left = offset_left + 'px';
		layer.open({
		  type: 2,
		  title: false,
		  area: [width_value, height_value],
		  closeBtn: 1,
		  maxmin: false,
		  shadeClose: true,
		  offset: [offset_top, offset_left],
		  content: ['../photoDeail.html'],
		  cancel: function() {
		  	$("#forDeatil").empty();
		  	
		  }
		});			

}

