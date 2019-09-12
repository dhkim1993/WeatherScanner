<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="utf-8">
    <script src="<c:url value='/resources/icon/skycons.js'/>"></script>

</head>
<body>
<canvas id = "icon3" width = "128" height = "128"></canvas>


<script>


var skycons = new Skycons({"color": "pink"});
skycons.add("icon3", Skycons.PARTLY_CLOUDY_DAY);
skycons.play ();
/*
<button type="button" id="OauthClick" name="OauthClick">권한받기</button>
$("#OauthClick").click( function(){
	window.open('https://api.instagram.com/oauth/authorize/?client_id=4d2cc2ac80794b1184eaf27ff19d5330&redirect_uri=http://localhost:8080/weather/main&response_type=code');
});
*/
</script>
</body>
</html>