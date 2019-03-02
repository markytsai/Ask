// $("#inputEmail").blur(function () {
//     var email = $(this).val();
//
//     if (!/^([a-zA-Z0-9_-])+@([a-zA-Z0-9_-])+((\.[a-zA-Z0-9_-]{2,3}){1,2})$/.test(email)) {
//         $("#login-email-error").text("请输入格式正确的邮箱");
//     } else {
//         $("#login-email-error").text("");
//     }
// });
//
// $("#inputPassword").blur(function () {
//     var value = $(this).val();
//
//     if (!/[a-zA-Z0-9]{6,10}/.test(value)) {
//         $("#login-password-error").text("密码长度须在6-20个字符");
//     } else {
//         $("#login-password-error").text("");
//     }
// });


$("#loginButton").on("click", function () {

    var userData = {
        "email": $("#inputEmail").val(),
        "password": $("#inputPassword").val(),
        "rememberMe": document.getElementById("rememberMe").checked,
    }

    $.ajax({
        url: "/toLogin",
        type: "post",
        data: userData,
        async: false,
        dataType: 'json',
        success: function (response) {
            if (response.code == "103") {
                window.location.href = "/chooseTopic";
            } else if (response.code == "104") {
                window.location.href = "/index";
            } else {
                $("#login-password-error").text(response.message);
            }
        }
    });
});


/* 注册处理 */
var registerInputEmail = $("#inputEmailReg");
var registerInputPassword = $("#inputPasswordReg");

registerInputEmail.blur(function () {
    var email = $(this).val();

    if (!/^([a-zA-Z0-9_-])+@([a-zA-Z0-9_-])+((\.[a-zA-Z0-9_-]{2,3}){1,2})$/.test(email)) {
        $("#regi-email-error").text("请输入正确的邮箱");
    } else {
        $("#regi-email-error").text("");
    }
});
registerInputPassword.blur(function () {
    var value = $(this).val();
    if (!/[a-zA-Z0-9]{6,10}/.test(value)) {
        $("#regi-password-error").text("密码长度须在6-20个字符");
    } else {
        $("#regi-password-error").text("");
    }
});


$("#registerButton").on("click", function () {

    var userData = {
        "email": $("#inputEmailReg").val(),
        "username": $("#inputUsernameReg").val(),
        "password": $("#inputPasswordReg").val()
    }

    $.ajax({
        url: "/doRegister",
        type: "post",
        data: userData,
        dataType: 'json',
        success: function (response) {
            if (response.code == 1) {
                window.location.href = "/login";
            } else {
                $("#login-password-error").text(response.message);
            }
        }
    });
});

$('.toRegister').on("click", function () {

    document.getElementById("mainContainer").style.height = "825px";
    $('#registerModule').show(100);

});

$('.cancelReg').on("click", function () {
    $('#registerModule').hide();
    document.getElementById("mainContainer").style.height = "545px";
    $('#inputEmail').focus();
});
