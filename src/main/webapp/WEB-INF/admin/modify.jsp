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
<title>ReviewBoard</title>

<!-- Bootstrap -->
<link href="../../resources/assets/css/bootstrap.min.css" rel="stylesheet">

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
<script src="../../resources/assets/js/bootstrap.min.js"></script>

<jsp:include page="../include/header_ad.jsp" flush="true"/>
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

.button-group {
	float: left;
}

.box-footer {
	margin-top: 10px;
	font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto,
		"Helvetica Neue", Arial, "Noto Sans", sans-serif, "Apple Color Emoji",
		"Segoe UI Emoji", "Segoe UI Symbol", "Noto Color Emoji";
	font-size: 1rem;
	font-weight: 400;
	line-height: 1.5;
	color: #212529;
	text-align: right;
	background-color: #fff;
}

</style>
<body class="hold-transition skin-blue sidebar-mini layout-boxed">

	

	<div class="wrapper">


		<!-- Content Wrapper. Contains page content -->
		<div class="content-wrapper">
			<!-- Content Header (Page header) -->
			<section class="content-header">
				<h1></h1>

			</section>

			<!-- Main content -->
			<section class="content container-fluid">

				<div class="col-lg-12">
					<form role="form" id="writeForm" method="post"
						action="<c:url value='/reLoca/modifycity'/>">
						<div class="box box-primary">
							<div class="box-header with-border"><br>
								<h3 class="box-title">추천여행지 수정</h3><br>
							</div>
							<div class="box-body">
								<input type="hidden" name="cityNo" value="${article.cityNo}">

								<div class="form-group Motitle">
									<label for="title">제목</label> <input class="form-control"
										id="title" name="title" placeholder="제목을 입력해주세요"
										value="${article.title}">
								</div>
								<div class="form-group Mocontent">
									<label for="content">내용</label>
									<textarea class="form-control" id="content" name="content"
										rows="10" placeholder="내용을 입력해주세요" style="resize: none;">${article.content}</textarea>
								</div>
								
							
								
							</div>
							
							<div>
								<label for="cityImg">이미지</label> <input class="form-control"
										id="cityImg" name="cityImg"  value="${article.cityImg}">
							</div>

							<div class="box-footer">

								<button type="submit" class="btn btn-success modBtn">
										<i class="fa fa-save"></i> 수정 저장
									</button>



								<div class="button-group">
									<button type="button" class="btn btn-warning cancelBtn">
										<i class="fa fa-trash"></i> 취소
									</button>
									
								</div>
								<br><br>



							</div>




						</div>
					</form>
				</div>

			</section>
			<!-- /.content -->
		</div>
		<!-- /.content-wrapper -->


	</div>
	<!-- ./wrapper -->


	<script>
    $(document).ready(function () {

        const formObj = $("form[role='form']");        

        $(".modBtn").on("click", function () {
            formObj.submit();
        });

        $(".cancelBtn").on("click", function () {
            history.back();
        });

      

    });
</script>

<jsp:include page="../include/footer.jsp"></jsp:include>

</body>

</html>








