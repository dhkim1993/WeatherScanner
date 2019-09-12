<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
<title>Insert title here</title>
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

<!-- bootstrap.js -->
<script src="../resources/assets/js/bootstrap.min.js"></script>
</head>
<style>
.box-footer {
	position: absolute;
	bottom: 0;
	width: 100%;
	height: 50px;
}

.form-group {
	form-align: center;
}

.text-center {
	form-align: center;
}

.cityInBtn {
}
</style>
<body>

	<div class="container-fluid">
		<div class="row">
			<div class="col-md-12">
				<jsp:include page="../include/header_ad.jsp"></jsp:include>
				<br>

				<div class="offset-md-1 col-md-11">
					<hr>
				</div>

				<c:forEach var="location" items="${locations }">
					<div class="offset-md-1 col-md-11">
						<div class="row">
							<div class="col-md-2">
								<img alt="Bootstrap Image Preview"
									src="<c:url value='../resources/location-img/${location.cityImg}'/>" />
							</div>
							<div class="col-md-10">
								<h4>${location.cityName }</h4>
								<br>
								<h5>${location.title}</h5>
								${location.content }
								<br> <a class="btn btn-danger btn-small cityInfoBtn"
									href="<c:url value='modify/${location.cityNo }'/>">수정</a> 
									<input id="cityNo" type="hidden" name="cityNo" value="${location.cityNo}" />
								<button class="btn btn-danger btn-small cityDelBtn">삭제</button>
							</div>
						</div>
						<hr>
				<br> 
					</div>
				</c:forEach>
				
				
			</div>
		</div>
	</div>

	<jsp:include page="../include/footer.jsp"></jsp:include>

	<script type="text/javascript">
		$(document).ready(function() {

			$(".cityDelBtn").on("click", function() {

				const cityNoObj = $(this).parent().find("#cityNo");

				var cityNo = $.trim(cityNoObj.val());
				console.log(cityNo);

				$.ajax({

					type : "delete",
					url : "/reLoca/delcity?cityNo=" + cityNo,
					headers : {
						"Content-Type" : "application/json",
						"X-HTTP-Method-Override" : "POST"
					},
					dataType : "text",
					data : JSON.stringify({
						cityNo : cityNo
					}),
					success : function(result) {
						console.log("result: " + result)
						if (result === "delSuccess") {
							alert("삭제가 완료되었습니다.");
							//cityNo.val("");
							self.location = "";
						}
					},
					error : function(error) {
						console.log("error: " + error);
					}

				});//ajax end
			});
			
			$(".cityInBtn").on("click", function(){
				
				location.href="/reLoca/writeCity";
				
			});
			
		});
	</script>
</body>
</html>