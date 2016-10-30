$(document).ready(function () { 
	$("#search").keydown(function (e) { 
		var curKey = e.which; 
		if (curKey == 13) { 
			var keyWord = $(this).val().trim();
			if(keyWord=='') {
				layer.msg('请输入搜索内容', {icon: 5});
				return;
			}
//			alert();
			searchLink(keyWord);
		}
	});
});
function searchLink(keyWord) {
	document.location.href = "search.html?search=" + keyWord;
}
