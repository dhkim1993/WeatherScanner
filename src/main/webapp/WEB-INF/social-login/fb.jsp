<%--
  Created by IntelliJ IDEA.
  User: voldemort
  Date: 11/09/2019
  Time: 7:30 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<div class="fb-login-button" data-max-rows="1" data-size="large" data-button-type="continue_with" data-show-faces="true" data-auto-logout-link="true" data-use-continue-as="true" onlogin="fbLogin();"></div>
<div id="fb-root"></div>

<script>
    function fbLogin() {
        FB.getLoginStatus(function (response) {

            if (response.status === 'connected') {
                FB.api('/me', function (res) {
                    // 제일 마지막에 실행
                    console.log("Success Login : " + response.name);
                    // alert("Success Login : " + response.name);
                });
            } else if (response.status === 'not_authorized') {
                // 사람은 Facebook에 로그인했지만 앱에는 로그인하지 않았습니다.
                alert('앱에 로그인해야 이용가능한 기능입니다.');
            } else {
                // 그 사람은 Facebook에 로그인하지 않았으므로이 앱에 로그인했는지 여부는 확실하지 않습니다.
                alert('페이스북에 로그인해야 이용가능한 기능입니다.');
            }
        }, true);
    }
    window.fbAsyncInit = function() {
        FB.init({
            appId      : '655796684925897',
            cookie     : true,
            xfbml      : true,
            version    : 'v4.0'
        });

        FB.AppEvents.logPageView();

    };

    (function(d, s, id){
        var js, fjs = d.getElementsByTagName(s)[0];
        if (d.getElementById(id)) {return;}
        js = d.createElement(s); js.id = id;
        js.src = "https://connect.facebook.net/ko_KR/sdk.js";
        fjs.parentNode.insertBefore(js, fjs);
    }(document, 'script', 'facebook-jssdk'));
</script>

</body>
</html>
