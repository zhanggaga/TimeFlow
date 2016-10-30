$("document").ready( function() {
	$("#container > button").click(getDisplay);
    $("#form_register").submit( function(){
    	return false;
    });
    $("#form_login").submit( function() {
    	return false;
    });
    $("#reset").click( function() {
    	location.href = "reset_1.html";
    });
	$('#formContainer input').bind('input propertychange', function() {
		$(this).trigger("validate");
	});   
//  $("#formContainer #register input").oninput = function() {
//  	alert();
//  	$(this).trigger("validate");
//  }
    $("#testcodeArea img").click( function() {
    	$(this).attr("src","ValidateCode.aspx?"+Math.random());
   });
    $("#submit_register").click( function() {
    	var v = $('#form_register').validator().data('validator');
    	if(!v.isFormValid()){
    		return;
    	}
		  $.post("Register.aspx",
			  $("#form_register").serialize(),
			  function(data){
//			  	alert("Data: " + data + "\nStatus: " + status);
			  	if(data=="takeup") {
			  		layer.tips('该用户名已被占用','#username', {
					  tips: [1, '#3595CC'],
					  time: 4000			  			
			  		});
			  	}else if(data=="success") {
			  		layer.open({
			  			title: false,
			  			skin: 'test_layer_skin',
			  			content: '注册成功，请验证邮箱',
			  			btn: '确认',
			  			yes: function(index, layero){
			  				layer.close(index);
							$("#container  > button").each( function() {
								
								$(this).addClass("no-display");
								if($(this).hasClass("display"))
									$(this).removeClass("display");
							});
							$("#container #formContainer #login input").val("");
							if($("#btn_login").hasClass("no-display"))
								$("#btn_login").removeClass("no-display");
							$("#btn_login").addClass("display");
							$("#register").css("display","none");
							$("#login").css("display","block");	
							
			  			}
			  		});
//			  		setTimeout('window.location.href="HomePage.html";',1000);
			  	} else if(data=="fail") {
			  		layer.open({
			  			time: 3000,
			  			title: false,
			  			skin: 'test_layer_skin',
			  			content: '注册失败'
			  		});
			  	} else if(data=="takeup") {
			  		layer.open({
			  			time: 3000,
			  			title: false,
			  			skin: 'test_layer_skin',
			  			content: '您的邮箱已被占用'
			  		});			  		
			  	}
//			    alert("Data: " + data + "\nStatus: " + status);
			  }
		  );
    });
    $("#submit_login").click( function() {
    	var v = $('#form_login').validator().data('validator');
    	if(!v.isFormValid())
    		return;
		  $.post("Login.aspx",
			  $("#form_login").serialize(),
			  function(data){
				  if(data=="success") {
			  		layer.open({
			  			title: false,
			  			skin: 'test_layer_skin',
			  			content: '登录成功，将跳转到主页'
			  		});
			  		setTimeout('window.location.href="HomePage.html";',1000);
				  } else if(data=="validate_fail") {
				  		layer.tips('验证码不正确','#testcode', {
						  tips: [3, '#3595CC'],
						  time: 4000			  			
				  		});				  		
				  }else if(data=="psw_fail") {
			  		layer.open({
			  			time: 3000,
			  			title: false,
			  			skin: 'test_layer_skin',
			  			content: '用户名或密码错误'
			  		});				  	
				  } else if(data == "locked") {
			  		layer.open({
			  			time: 3000,
			  			title: false,
			  			skin: 'test_layer_skin',
			  			content: '您的账号已被封锁，请联系管理员'	
			  		});					  	
				  } else if(data=="active_fail") {
			  		layer.open({
			  			time: 3000,
			  			title: false,
			  			skin: 'test_layer_skin',
			  			content: '您的账号尚未激活，请先完成验证'	
			  		});					  	
				  }
				  else {
					layer.msg('程序发生了不可知的错误。。', {icon: 5});				  	
				  }
//			    alert("Data: " + data + "\nStatus: " + status);
			  }

		  );
    });
   
	function validateLogin() {
		$("#form_login").on("validation", function(e, current){
		    // 表单全部字段验证通过则返回 true
		    // 只要有一个字段验证不通过就返回 false
		    // 还没验证完，即验证结果未知的情况下返回 undefined
		    console.log(this.isValid);
		    if(this.isValid) {
				return 1;
//		    	$("#submit_login").removeAttr("disabled");
		    }else {
		    	return 0;
//		    	$("#submit_login").attr("disabled","disabled");
		    }
		    // 当前正在验证的字段是否通过
		    console.log(current.isValid);
		}); 	
	}
	function validateRegister() {
		$("#form_register").on("validation", function(e, current){
		// 表单全部字段验证通过则返回 true
		// 只要有一个字段验证不通过就返回 false
		// 还没验证完，即验证结果未知的情况下返回 undefined
		console.log(this.isValid);
		if(this.isValid) {
			return 1;
		}else {
			return -1;
//			$("#submit_register").attr("disabled","disabled");
		}
		// 当前正在验证的字段是否通过
		    console.log(current.isValid);
		});	
	}
	$('form[name="register"]').validator({
		showOk: "",
		timely: 1,
	//		msgClass: "test",
		validClass: "ok",
		rules: {
	        username: function(element, params){
	        	if(this.test(element, 'email')) {
	        		$("#register_type").val("email");
	        	}
//	        	if(this.test(element, 'mobile')) {
//	        		$("#register_type").val("phone");
//	        	}
	            //内部的this指向的是当前实例，可以直接调用所有方法，这里调用了test方法
	            return this.test(element, 'email')|| 
	                    '输入邮箱';
	            //内部的this指向的是当前实例，可以直接调用所有方法，这里调用了test方法
//	            return this.test(element, 'email') || this.test(element, 'mobile') || 
//	                    '输入邮箱或者手机号';	                    
	        }	
		},
	    messages: {
	//	        required: "请填写{0}",
	        email: "请检查邮箱格式",
	        username : "用户名可以输入邮箱",
	//	        testcode : ""
	//	        match: "前后密码不一致"
	    },
	    fields: {
	        'username': 'required;username',
	        'password': 'required;password',
	        're-password': 'required;match(password)'
	    },   
	
	});   
    $('form[name="login"]').validator({
    	showOk: "",
		timely: 1,
		rules: {
	        username: function(element, params){
	        	if(this.test(element, 'email')) {
	        		$("#login_type").val("email");
	        	}
//	        	if(this.test(element, 'mobile')) {
//	        		$("#login_type").val("phone");
//	        	}
	            //内部的this指向的是当前实例，可以直接调用所有方法，这里调用了test方法
	            return this.test(element, 'email') || 
	                    '输入邮箱';
	        }	
		},
	    messages: {
	        required: "请填写{0}",
	        email: "请检查邮箱格式",
	        username : "用户名可以输入邮箱",
	        
	    },	
	    fields: {
	        'username': '用户名:required;username',
	        'password': '密码:required;password',
	        'testcode': {
	        	rule : "验证码:required;match(true_testcode)",
	        	msgClass : "helloooooo",
//	        	msgStyle : "left:70px;",
	        }
	    }, 
    });
	$("#container #formContainer #register #putinArea input").blur(validtext);
});
function getDisplay() {
//	alert();
	var class_name = "np-display";
	$("#container  > button").each( function() {
		$(this).addClass("no-display");
		if($(this).hasClass("display"))
			$(this).removeClass("display");
	});
	if($(this).hasClass("no-display"))
		$(this).removeClass("no-display");
	$(this).addClass("display");
	var click_btn = this.id;
//	alert(click_btn);
	switch(click_btn) {
		case "btn_register" :
			$("#register").css("display", "block")
			$("#login").css("display","none");
			break;
		case "btn_login" :
			$("#register").css("display","none");
			$("#login").css("display","block");	
			break;
		default:
			break;
	}	
}
function validtext() {
//	 alert(validateNonEmpty(this.value));
	 var eidt_element = this.name;
	 
	 switch(eidt_element) {
	 	case "username" :
	 		break;
	 	case "password" :
	 		break;
	 	case "re-password":
	 		break;
	 }
}
function validateNonEmpty(text) {
	if(text) {
		return true;
	}
	else {
		return false;
	}
}

//by：yihualing,用来点击验证码时，验证码刷新
function f_refreshtype() {
    var validate_Image = document.getElementByIdx_x_x_x("img");
    if (validate_Image != null) {
        validate_Image.src = validate_Image.src + "?";
    }
}

