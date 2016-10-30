$("document").ready(function () {
    $("#form_login").submit(function () {
        return false;
    });
    $("#login").click(function () {
        $.post("Admin.aspx",
            $("#form_login").serialize(),//表单数据序列化
            function (data) {
                if (data == "success") {
                    alert("登录成功");
                   window.location.href="admin_user.html";

                } else if (data == "psw_fail") {
                    alert("登录失败");
                }
            }
        );
    });
});