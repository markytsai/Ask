<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->

    <title>Signin Template for Bootstrap</title>

    <!-- Bootstrap core CSS -->
    <link href="css/signin.css" type="text/css" rel="stylesheet">
    <link href="css/bootstrap.min.css" type="text/css" rel="stylesheet">
    <link href="css/bootstrap-theme.min.css" type="text/css" rel="stylesheet">

</head>
<body>

<div class="container">

    <form class="form-signin">
        <h2 class="form-signin-heading">Please sign in</h2>
        <label for="inputEmail" class="sr-only">Email address</label>
        <input type="email" id="inputEmail" class="form-control" placeholder="Email address" required autofocus>
        <label for="inputPassword" class="sr-only">Password</label>
        <input type="password" id="inputPassword" class="form-control" placeholder="Password" required>
        <div class="checkbox">
            <label>
                <input type="checkbox" value="remember-me"> Remember me
            </label>
        </div>
        <button id="loginButton" class="btn btn-lg btn-primary btn-block" type="button">Sign in</button>
    </form>

</div> <!-- /container -->

<script type="text/javascript" src="js/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>

<script>

    $("#loginButton").on("click", function () {

        var userData = {
            "email": $("#inputEmail").val(),
            "password": $("#inputPassword").val()
        }

        $.ajax({
            url: "/toLogin",
            type: "post",
            data: userData,
            dataType: 'json',
            success: function (response) {
                if (response.state == 1) {
                    window.location.href = "/index";
                } else {
                    $("#login-password-error").text(response.message);
                }
            }
        });
    });

</script>
</body>
</html>
