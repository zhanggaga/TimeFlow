function ifLogin() {
//	var end_url = "../App_Code/BasePage.cs";
	var end_url = "IfLogin.aspx";
	$.post(end_url, 
	{
		
	}, function(data){
		if(data=="null") {
			
//			window.location.href = "index.html";
	  		layer.open({
	  			title: false,
	  			skin: 'test_layer_skin',
	  			content: '请先登录'
	  		});
	  		setTimeout('window.location.href="index.html";',300);
		}
		else {
			
		}
	})
}
$(document).ready( function() {
	ifLogin();
});
