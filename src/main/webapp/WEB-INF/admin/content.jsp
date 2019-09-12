<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>ReviewContent</title>

<!-- Bootstrap -->
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
.wrapper {
	padding-left: 10%;
	padding-right: 10%;
}

.navbar-brand {
	color: #00FFFF;
}

.navbar li a:hover {
	background-color: #555;
	color: #00BFFF;
}

.content-header {
	width: 200px;
	margin: 0 auto;
}
body {
    margin: 0;
    font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, "Helvetica Neue", Arial, "Noto Sans", sans-serif, "Apple Color Emoji", "Segoe UI Emoji", "Segoe UI Symbol", "Noto Color Emoji";
    font-size: 1rem;
    font-weight: 400;
    line-height: 1.5;
    color: #212529;
    text-align: right;
    background-color: #fff;
}

.box-title {
	background-color: White;
	border: 1px outset black;
	border-radius: 15px;
	margin-left: 0px;
	margin-right: 0px;
	padding-left: 10px;
	padding-right: 10px;
}

.box-body {
	border: 1px outset black;
	font-size: 20px;
	height: 700px;
	margin-left: 10px;
	padding-left: 10px;
	padding-right: 10px;
	margin-right: 10px;
	margin-left: 10px;
	height: 700px;
}
.button-group{
float: left;
}
</style>



<body class="hold-transition skin-blue sidebar-mini layout-boxed">

	<nav class="navbar navbar-expand-lg navbar-light bg-light">

		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#bs-example-navbar-collapse-1">
			<span class="navbar-toggler-icon"></span>
		</button>
		<a class="navbar-brand" href="/">WeatherScanner</a>


		<div class="collapse navbar-collapse"
			id="bs-example-navbar-collapse-1">
			<ul class="navbar-nav nav-justified">
				<li class="nav-item active"><a class="nav-link"
					class="nav-link active" href="#">Link <span class="sr-only">(current)</span></a>
				</li>
				<li class="nav-item"><a class="nav-link" href="#">Link</a></li>
				<li class="nav-item"><a class="nav-link dropdown-toggle"
					href="http://example.com" id="navbarDropdownMenuLink"
					data-toggle="dropdown">Dropdown link</a>
					<div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
						<a class="dropdown-item" href="#">Action</a> <a
							class="dropdown-item" href="#">Another action</a> <a
							class="dropdown-item" href="#">Something else here</a>
						<div class="dropdown-divider"></div>
						<a class="dropdown-item" href="#">Separated link</a>
					</div></li>
			</ul>

			<ul class="navbar-nav ml-md-auto">
				<li class="nav-item active"><a class="nav-link" href="#">Link
						<span class="sr-only">(current)</span>
				</a></li>

				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle" href="http://example.com"
					id="navbarDropdownMenuLink" data-toggle="dropdown">Dropdown
						link</a>
					<div class="dropdown-menu dropdown-menu-right"
						aria-labelledby="navbarDropdownMenuLink">
						<a class="dropdown-item" href="#">Action</a> <a
							class="dropdown-item" href="#">Another action</a> <a
							class="dropdown-item" href="#">Something else here</a>
						<div class="dropdown-divider"></div>
						<a class="dropdown-item" href="#">Separated link</a>
					</div></li>

			</ul>
		</div>
	</nav>

	<div class="wrapper">

		<!-- Content Wrapper. Contains page content -->
		<div class="content-wrapper">
			<!-- Content Header (Page header) -->
			<section class="content-header">
				<h1>도시 정보</h1>

			</section>

			<!-- Main content -->
			<section class="content container-fluid">

				<div class="col-lg-12">
					<div class="box box-primary">

						<div class="box-header" align="center">
							<h3 class="box-title">TITLE : ${article.title}</h3>
						</div>
						
						<div class="box-body with-border" align="left">
							${article.content}</div>

						<div class="box-footer">
							<div class="member-block" align="right">
								<img class="img-circle img-bordered-sm"
									src="<c:url value='/dist/img/member1-128x128.jpg'/>"
									alt="member image"> <span class="membername"> <a
									href="#">${article.nickname}</a>
								</span> <span class="description"><fmt:formatDate
										pattern="yyyy-MM-dd a hh:mm" value="${article.regDate}" /></span>
							</div>
						</div>

						<div class="box-footer">
							<form role="form" method="post">
								<input type="hidden" name="boardNo" value="${article.boardNo}">
								<input type="hidden" name="page" value="${criteria.page}">
								<input type="hidden" name="countPerPage"
									value="${criteria.countPerPage}"> <input type="hidden"
									name="condition" value="${criteria.condition}"> <input
									type="hidden" name="keyword" value="${criteria.keyword}">
							</form>

								
									<div class="button-group">
										<button type="submit" class="btn btn-warning modBtn"><i class="fa fa-edit"></i> 수정	</button>
										<button type="submit" class="btn btn-danger delBtn"><i class="fa fa-trash"></i> 삭제	</button>
								</div>
<br><br><br>






						</div>
					</div>
				</div>

			</section>
			<!-- /.content -->
		</div>
		<!-- /.content-wrapper -->


		<!-- Main Footer -->

	</div>
	<!-- ./wrapper -->


	<script type="text/javascript">
		$(document).ready(function() {

			const formObj = $("form[role='form']");


			$(".modBtn").on("click", function() {
				formObj.attr("method", "get");
				formObj.attr("action", "modify");
				formObj.submit();
			});

			$(".delBtn").on("click", function() {
				formObj.attr("action", "delete");
				formObj.submit();
			});

		});
	</script>

</body>

</html>








