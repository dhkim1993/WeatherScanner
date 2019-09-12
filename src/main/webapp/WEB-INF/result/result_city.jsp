<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />

<link href="../resources/assets/css/bootstrap.min.css" rel="stylesheet">

<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

<!-- jQuery library -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<!-- Popper JS -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>


</head>
<style>
@media (max-width:400px) {
   #Nocontent h4 h5 p {
      font-size: 18px;
   }
 #noLocation p {
      font-size: 18px;
   }

#Nocontent p {
	margin-left:350px;
	height: 50px;
	width: 700px;
	font-size: 30px;
}

</style>

<body>
				<jsp:include page="../include/header.jsp"/>

	<div class="container-fluid">
	
				<c:if test="${empty locations }">
					<p><b>검색하신 ${month}월의 추천 여행지를 수정하고 있습니다.</b></p>
				</c:if>
				<c:if test="${not empty locations }">
					<center><b style="font-size:25px;">${month }월의 추천 여행지</b></center><br>
				<c:forEach var="location" items="${locations }">
					<center><h2>${location.cityName }</h2></center><br>
					<center><img src="<c:url value='../resources/location-img/${location.cityImg}' />" style="width:70%; padding-bottom:3%;"/></center>
						<div style="padding-left:15%; padding-right:15%;">
							<h5>${location.title}</h5>
							<p style="width:100%;">${location.content }</p>
						</div><br><br>
						
				
				</c:forEach>
				</c:if>

	</div>
	<jsp:include page="../include/footer.jsp"/>
	
</body>
</html>
