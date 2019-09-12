<%--
  Created by IntelliJ IDEA.
  User: voldemort
  Date: 11/09/2019
  Time: 7:12 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>

<div class="fb-login-button" data-max-rows="1" data-size="large" data-button-type="continue_with" data-show-faces="true"
     data-auto-logout-link="true" data-use-continue-as="true"></div>

<div id="fb-root"></div>
<script>(function (d, s, id) {
    var js, fjs = d.getElementsByTagName(s)[0];
    if (d.getElementById(id)) return;
    js = d.createElement(s);
    js.id = id;
    js.src = "//connect.facebook.net/ko_KR/sdk.js#xfbml=1&version=v4.0&appId=655796684925897";
    fjs.parentNode.insertBefore(js, fjs);
}(document, 'script', 'facebook-jssdk'));
</script>
facebook
</body>
</html>
