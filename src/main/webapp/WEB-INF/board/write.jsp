<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>bootstrap4</title>
    
  <jsp:include page="../include/header.jsp"></jsp:include>
    
     <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js"></script>
 <link href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote-bs4.css" rel="stylesheet">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote-bs4.js"></script>
</head>

<style>
.wrapper {
	padding-left: 5%;
	padding-right: 5%;
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
	margin: 0;
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
			<center>
				<section class="content-header" style="padding-top:30px; padding-bottom:20px;">
					ReviewWrite
				</section>
			</center>

			<!-- Main content -->
			<section class="content container-fluid" style="width: 70%">

				<div class="col-lg-12">
				
					<form role="form" id="writeForm" method="post"
						action="<c:url value='/board/write' />" enctype="multipart/form-data">
						<div class="box box-primary">
							<div class="box-header with-border">
								<center><h3 class="box-title">게시글 작성</h3><br></center>
							</div>
							<div class="box-body">
								<div class="form-group">
									<label for="memberId">작성자</label> <input class="form-control" 
										readonly="readonly" id="memberId" name="memberId" value="${login.memberId}">
								</div>
								<div class="form-group">
									<label for="title">제목</label> <input class="form-control"
										id="title" name="title" placeholder="제목을 입력해주세요">
								</div>
								
								<!--  
								<div id="summernote"></div>
								<textarea name="content" id="summernote" class="summernote" style="width:100%; height:100%;"></textarea>
								-->
								<div id="form-group">
									<label for="title">내용</label><textarea rows="20" class="form-control"
										id="content" name="content" placeholder="내용을 입력해주세요" ></textarea>
								</div>
								
								<div class="form-group">
									<label># 이미지파일: </label> 
									
									<input type="file" name="file">
									
								</div>
							</div>
							<div class="box-footer">

								<button type="button" id="listBtn"
									class="btn btn-primary listBtn">
									<a href="<c:url value='/board/list'/>"> <i
										class="fa fa-list"></i> 목록
									</a>
								</button>



								<div class="button-group">
									<button type="reset" class="btn btn-warning">
										<i class="fa fa-reply"></i> 초기화
									</button>
									<button type="submit" class="btn btn-success">
										<i class="fa fa-save"></i> 입력
									</button>
								</div>



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

	<jsp:include page="../include/footer.jsp" />
</body>

</html>
