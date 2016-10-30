function test() {

  var $image = $(".cropper"),
      $dataX = $("#dataX"),
      $dataY = $("#dataY"),
      $dataHeight = $("#dataHeight"),
      $dataWidth = $("#dataWidth"),
      console = window.console || {log:$.noop},
      cropper;

  $image.cropper({
    aspectRatio: 1 / 1,
    // autoCropArea: 1,
    data: {
      x: 420,
      y: 50,
      width: 640,
      height: 360
    },
    preview: ".preview",

    // multiple: true,
    // autoCrop: false,
    // dragCrop: false,
    // dashed: false,
    // modal: false,
    // movable: false,
    // resizable: false,
    // zoomable: false,
    // rotatable: false,
    // checkImageOrigin: false,

    // maxWidth: 480,
    // maxHeight: 270,
    // minWidth: 160,
    // minHeight: 90,

    done: function(data) {
      $dataX.val(data.x);
      $dataY.val(data.y);
      $dataHeight.val(data.height);
      $dataWidth.val(data.width);
//    $image.cropper("renderDragger");
    },

    build: function(e) {
      console.log(e.type);
    },

    built: function(e) {
      console.log(e.type);
    },

    dragstart: function(e) {
      console.log(e.type);
    },

    dragmove: function(e) {
      console.log(e.type);
    },

    dragend: function(e) {
      console.log(e.type);
    }
  });

  cropper = $image.data("cropper");

  $image.on({
    "build.cropper": function(e) {
      console.log(e.type);
      // e.preventDefault();
    },
    "built.cropper": function(e) {
      console.log(e.type);
      // e.preventDefault();
    },
    "dragstart.cropper": function(e) {
      console.log(e.type);
      // e.preventDefault();
    },
    "dragmove.cropper": function(e) {
      console.log(e.type);
      // e.preventDefault();
    },
    "dragend.cropper": function(e) {
      console.log(e.type);
      // e.preventDefault();
    }
  });

  $("#reset").click(function() {
    $image.cropper("reset");
  });

  $("#reset2").click(function() {
    $image.cropper("reset", true);
  });

  $("#clear").click(function() {
    $image.cropper("clear");
    var t_height = $(".cropper-container").height();
    var t_width = $(".cropper-container").width();
    var rank = t_width / t_height;
    
    $(".preview-md").height(120/rank);
    $image.cropper("initPreview");
    $image.cropper("setAspectRatio", rank);
  });

  $("#destroy").click(function() {
    $image.cropper("destroy");
  });

  $("#enable").click(function() {
    $image.cropper("enable");
  });

  $("#disable").click(function() {
    $image.cropper("disable");
  });

  $("#zoom").click(function() {
    $image.cropper("zoom", $("#zoomWith").val());
  });

  $("#zoomIn").click(function() {
    $image.cropper("zoom", 0.1);
  });

  $("#zoomOut").click(function() {
    $image.cropper("zoom", -0.1);
  });

  $("#rotate").click(function() {
    $image.cropper("rotate", $("#rotateWith").val());
  });

  $("#rotateLeft").click(function() {
    $image.cropper("rotate", -90);
  });

  $("#rotateRight").click(function() {
    $image.cropper("rotate", 90);
  });

  $("#setAspectRatio_1_1").click(function() {
    $image.cropper("setAspectRatio", 1);
  });
  $("#setAspectRatio_3_4").click(function() {
    $image.cropper("setAspectRatio", 0.75);
  });
  $("#setAspectRatio_4_3").click(function() {
  	var rate = 4/3;
//	alert(rate);
    $image.cropper("setAspectRatio", rate);
  });
  $("#setAspectRatio_9_16").click(function() {
  	var rate = 9/16;
    $image.cropper("setAspectRatio", rate);
  });
  $("#setAspectRatio_16_9").click(function() {
  	var rate = 16/9;
    $image.cropper("setAspectRatio", rate);
  });
  $("#replace").click(function() {
    $image.cropper("replace", $("#replaceWith").val());
  });

  $("#getImageData").click(function() {
    $("#showImageData").val(JSON.stringify($image.cropper("getImageData")));
  });

  $("#setData").click(function() {
    $image.cropper("setData", {
      x: $dataX.val(),
      y: $dataY.val(),
      width: $dataWidth.val(),
      height: $dataHeight.val()
    });
  });

  $("#getData").click(function() {
    $("#showData").val(JSON.stringify($image.cropper("getData")));
  });

  $("#getData2").click(function() {
    $("#showData").val(JSON.stringify($image.cropper("getData", true)));
  });

  $("#getDataURL").click(function() {

    var dataURL = $image.cropper("getDataURL");
    //原图
		if($(".cropper-viewer").css("height") == "100%") {
			dataURL = $("#picWrapper img").attr("src");
		}
		var srcs = Array();
		srcs = dataURL.split(",",2);
    $("#dataURL").text(srcs[1]);	
    var ifPublics = document.getElementsByName("ifPublic");
    var if_public;
    for(var i=ifPublics.length; i--; ) {
    	var ifPublic = ifPublics[i];
    	if(ifPublic.checked) {
    		if_public = $(ifPublic).val();
    	}
    }
    var  labels=$("textarea").val();
	
		$.post("../../AddPortrait.aspx",
		{
			imageurl: srcs[1],
			publicVal: if_public,
			photoLabels:labels
		},
		function(data, status) {
			if(data="success") {
				layer.msg('上传成功', {
					icon: 1
					,skin: 'layui-layer-molv'
					,time: 0
					,btn:['确定']
					,yes: function(index) {
						layer.close(index);
						var index = parent.layer.getFrameIndex(window.name);
						parent.layer.close(index);
					}
				});
								
			}
			else {
				layer.msg('程序发生了不可知的错误。。', {icon: 5});
			}
//			alert("Data: " + data + "\nStatus: " + status);
		});
//  $("#showDataURL").html('<img src="' + dataURL + '">');
  });

  $("#getDataURL2").click(function() {
    var dataURL = $image.cropper("getDataURL", "image/jpeg");

    $("#dataURL").text(dataURL);
    $("#showDataURL").html('<img src="' + dataURL + '">');
  });

  $("#getDataURL3").click(function() {
    var dataURL = $image.cropper("getDataURL", {
      width: 100,
      height: 100
    });
    //原图
		if($(".cropper-viewer").css("height") == "100%") {
			dataURL = $("#picWrapper img").attr("src");
		}
		var srcs = Array();
		srcs = dataURL.split(",",2);
    $("#dataURL").text(srcs[1]);	
    var ifPublics = document.getElementsByName("ifPublic");
    var if_public;
    for(var i=ifPublics.length; i--; ) {
    	var ifPublic = ifPublics[i];
    	if(ifPublic.checked) {
    		if_public = $(ifPublic).val();
    	}
    }

		$.post("../../AddPortrait.aspx",
		{
			imageurl: srcs[1],
//			publicVal: if_public
		},
		function(data, status) {
			if(data="success") {
				layer.msg('上传成功', {
					icon: 1
					,skin: 'layui-layer-molv'
					,time: 0
					,btn:['确定']
					,yes: function(index) {
						layer.close(index);
						var index = parent.layer.getFrameIndex(window.name);
						parent.layer.close(index);
					}
				});
								
			}
			else {
				layer.msg('程序发生了不可知的错误。。', {icon: 5});
			}
//			alert("Data: " + data + "\nStatus: " + status);
		});
//  $("#dataURL").text(dataURL);
//  $("#showDataURL").html('<img src="' + dataURL + '">');
  });
  function updatePreview() {
  	setTimeout( function() {
  		reSetPreview();
  		updatePreview();
  	},200);
  }

  var min_width = 180;
	function reSetPreview() {
//		  alert($(".cropper-dragger").length);
		var height = $(".cropper-dragger").width();
		var width = $(".cropper-dragger").height();
//		var srcs_height = Array();
//		srcs_height = height.split("p",2);
//		var srcs_width = Array();
//		srcs_width = height.split("p",2);
		var rank = (parseFloat(width)/parseFloat(height));
//		if($(".cropper-viewer").css("height") == "100%")
//			alert();
//		console.log("height:!!!"+$(".cropper-viewer").css("height"));
		if(!isNaN(rank)) {
			var origin_height= $(".preview-md").height();
		  $(".preview-md").width(120/rank);
		  $image.cropper("renderDragger");
			
		}
		
//		$(".preview-md img").width(origin_height/rank);
		

//		$(".cropper-canvas ").trigger("focus");

//		alert();
//		$image.cropper("dragend");
//		$(".preview-md").height()
//		$(".preview-md").css("height",function(index, value){
//			return parseFloat(value).
//		});
		
//		alert(height);
	}
	updatePreview();
}
