<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<!--font-family-->
<link href="https://fonts.googleapis.com/css?family=Poppins:100,100i,200,200i,300,300i,400,400i,500,500i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- title of site -->
<title>Directory Landing Page</title>


<script src="<%=request.getContextPath()%>/resources/assets/js/jquery.js"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-3.2.1.min.js"></script>


<!-- For favicon png -->
<link rel="shortcut icon" type="/image/icon"
	href="<%=request.getContextPath()%>/resources/assets/logo/favicon.png" />

<!--font-awesome.min.css-->
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/assets/css/font-awesome.min.css">

<!--linear icon css-->
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/assets/css/linearicons.css">

<!--animate.css-->
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/assets/css/animate.css">

<!--flaticon.css-->
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/assets/css/flaticon.css">

<!--slick.css-->
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/assets/css/slick.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/assets/css/slick-theme.css">

<!--bootstrap.min.css-->
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/assets/css/bootstrap.min.css">

<!-- bootsnav -->
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/assets/css/bootsnav.css">

<!--style.css-->
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/assets/css/style.css">

<!--responsive.css-->
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/assets/css/responsive.css">

<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->

<!--[if lt IE 9]>
			<script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
			<script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
        <![endif]-->


<style>
.dropdown:hover>.dropdown-menu {
	display: block;
	text-transform: none;
}

.hidden-xs {
	cursor: pointer;
	color: rgb(167, 176, 186);
	font-size: 12px;
	font-weight: 300;
	border-width: initial;
	border-style: none;
	border-color: initial;
	border-image: initial;
	text-transform: none;
}
</style>
<header id="header-top" class="header-top">


	<!--/.header-top-->
	<!--header-top end -->

	<!-- top-area Start -->
	<section class="top-area">
		<div class="header-area">
			<!-- Start Navigation -->
			<nav
				class="navbar navbar-default bootsnav  navbar-sticky navbar-scrollspy"
				data-minus-value-desktop="70" data-minus-value-mobile="55"
				data-speed="1000">

				<div class="container">

					<!-- Start Header Navigation -->
					<div class="navbar-header">
						<button type="button" class="navbar-toggle" data-toggle="collapse"
							data-target="#navbar-menu">
							<i class="fa fa-bars"></i>
						</button>
						<a class="navbar-brand" href="/">Weather<span>Scanner</span></a>

					</div>
					<!--/.navbar-header-->
					<!-- End Header Navigation -->

					<!-- Collect the nav links, forms, and other content for toggling -->
					<div class="collapse navbar-collapse menu-ui-design"
						id="navbar-menu">
						<ul class="nav navbar-nav navbar-right" data-in="fadeInDown"
							data-out="fadeOutUp">
							
					
						<c:if test="${empty login}">
							<li class="scroll"><a href="<c:url value='/member/login'/>" style="padding-rignt:1%;">로그인</a></li>
							<li class="scroll"><a href="<c:url value='/member/join'/>" style="padding-rignt:1%;">회원가입</a></li>
						</c:if>
							<li class=" scroll active"><a href="/" style="padding-rignt:1%;">home</a></li>
							<li class="scroll"><a href="<c:url value='/board/list'/>" style="padding-rignt:1%;">리뷰게시판</a></li>
							<li class="nav-item dropdownBtn"><a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown" style="padding-rignt:1%;">
								추천여행지 <b class="caret"></b></a>
								<ul class="dropdown-menu">
									<%--<li><a class="dropdown-item"
										href="<c:url value='/reLoca/recity?month=1'/>">1월</a></li>
									<li><a class="dropdown-item"
										href="<c:url value='/reLoca/recity?month=2'/>">2월</a></li>
									<li><a class="dropdown-item"
										href="<c:url value='/reLoca/recity?month=3'/>">3월</a></li>
									<li><a class="dropdown-item"
										href="<c:url value='/reLoca/recity?month=4'/>">4월</a></li>
									<li><a class="dropdown-item"
										href="<c:url value='/reLoca/recity?month=5'/>">5월</a></li>
									<li><a class="dropdown-item"
										href="<c:url value='/reLoca/recity?month=6'/>">6월</a></li>
									<li><a class="dropdown-item"
										href="<c:url value='/reLoca/recity?month=7'/>">7월</a></li>
									<li><a class="dropdown-item"
										href="<c:url value='/reLoca/recity?month=8'/>">8월</a></li>--%>
									<li><a class="dropdown-item"
										href="<c:url value='/reLoca/recity?month=9'/>">9월</a></li>
									<li><a class="dropdown-item"
										href="<c:url value='/reLoca/recity?month=10'/>">10월</a></li>
									<li><a class="dropdown-item"
										href="<c:url value='/reLoca/recity?month=11'/>">11월</a></li>
									<li><a class="dropdown-item"
										href="<c:url value='/reLoca/recity?month=12'/>">12월</a></li>
								</ul></li>&emsp;

							
							
				<%-- 	@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@--%>		
				
						<c:if test="${!empty login}">
							<li class="nav-item dropdownBtn">
							<a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown">${login.memberId}<b class="caret"></b></a>
								<ul class="dropdown-menu">
										<li><a class="dropdown-item" href="<c:url value='/mypage/myModify'/>">회원정보 수정</a></li>
										<li><a class="dropdown-item" href="<c:url value='/mypage/myLike'/>">내가 찜한 게시물</a></li>
										<li><a class="dropdown-item" href="<c:url value='/mypage/myWrite'/>">내가 쓴 게시물</a></li>
										<li><a class="dropdown-item" href="<c:url value='/member/logout'/>">로그아웃 </a></li>
								</ul>
							</li>
						</c:if>

				<%-- 	@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@--%>		
						</ul>
						<!--/.nav -->
					</div>
					<!-- /.navbar-collapse -->
				</div>

			<%--검색박스검색박스검색박스검색박스검색박스검색박스검색박스검색박스검색박스검색박스검색박스 --%>
			<div id="page-wrapper" style="padding-left:2%; padding-right:2%;">
				<div class="offset-md-1 col-md-11" style="width:100%;">
					<hr>
					<form action="/WI/result" method="get" style="margin-top:20px;">
						<input type="date" name="date" id="dateSelect"/> 
						<select name="city" style="margin-left: 1%;" id="citySelect">
							<option selected disabled hidden >나라&도시</option>
							<optgroup label="아시아">
								<option value="방콕">방콕</option>
								<option value="싱가포르">싱가포르</option>
								<option value="다낭">다낭</option>
								<option value="하노이">하노이</option>
								<option value="발리">발리</option>
								<option value="세부">세부</option>
								<option value="코타키나발루">코타키나발루</option>
							</optgroup>
						</select> <input id="search-Btn" type="submit" value="search"  style="margin-left: 1%;" />
					</form>
					<hr>
				</div>
			</div>
				<!--/.container-->
			</nav>
			<!--/nav-->
			<!-- End Navigation -->
		</div>
		<!--/.header-area-->
		<div class="clearfix"></div>

	</section>
	<!-- /.top-area-->
	<!-- top-area End -->

</header>
<script>
$("#search-Btn").click(function(){
  		var target = document.getElementById("citySelect").value;
  		
  		if((target==="나라&도시")||( $("#dateSelect").val() === "" )){
  			alert("날짜와 도시를 선택하세요!");
  			return false;
  		}
  	});
</script>
<!--welcome-hero end -->