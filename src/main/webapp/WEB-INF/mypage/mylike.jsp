<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<jsp:include page="../include/header.jsp" />
<!-- jQuery library -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<!-- Popper JS -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
  <!--/.header-top-->
  <!--header-top end -->
<body>

  <!--blog start -->
  <section id="reviews" class="reviews">
    <div class="container">
<div class="wrapper">

		<div class="content-wrapper">
			<!-- Main content -->
			<section class="content container-fluid">
			<div class="section-header">
        <h2>내가 찜한 게시글</h2>
        <p></p>
      </div>
				<div class="col-lg-12">
					<div class="box box-primary">
						<div class="box-body">
							<table class="table table-hover">
								<tbody>
									<tr>
										<th style="width: 30px">No</th>
										<th>제목</th>
										<th style="width: 100px">작성자</th>
										<th style="width: 200px">작성시간</th>
										<th style="width: 60px">조회수</th><th style="width: 50px"><img src="<c:url value='/assets/images/likeit.JPG' />" style="width: 30px"></th>
									</tr>

									<%-- 게시물이 들어갈 공간 --%>
									<c:if test="${articles.size() <= 0}">
										<tr>
											<td align="center" colspan="5"><strong>내가 찜한 게시글이 없습니다.</strong></td>
										</tr>
									</c:if>
									
									<c:if test="${articles.size() > 0}">
										<c:forEach var="article" items="${articles}">
											<tr>
												<td>${article.boardNo}</td>
												<td><a href="<c:url value='/board/content${pageCreator.makeSearchURI(pageCreator.criteria.page)}&boardNo=${article.boardNo}'/>"
												 style="text-transform: none;">
														${article.title} [${article.replyCnt}]</a> <c:if
														test="${article.newMark}">
														<span class="label label-success">new</span>
													</c:if></td>
													<td>${article.memberId}</td>
												<td><fmt:formatDate value="${article.regDate}"
														pattern="yyyy-MM-dd a hh:mm" /></td>
												<td>${article.viewCnt}</td>
												<td>${article.likeCnt}</td>
											</tr>
										</c:forEach>
									</c:if>
								</tbody>
							</table>
						</div>


						<div class="box-footer">
							<div class="text-center">
								<ul class="pagination">

									<c:if test="${pageCreator.prev}">
										<li><a href="<c:url value='/mypage/myLike${pageCreator.makeSearchURI(pageCreator.beginPage - 1)}' />">이전</a></li>
									</c:if>

									<c:forEach var="idx" begin="${pageCreator.beginPage}" end="${pageCreator.endPage}">
										<li <c:out value="${pageCreator.criteria.page == idx ? 'class=active' : ''}"/>><a href="<c:url value='/mypage/myLike${pageCreator.makeSearchURI(idx)}'/>">${idx}</a></li>
									</c:forEach>

									<c:if test="${pageCreator.next}">
										<li><a href="<c:url value='/mypage/myLike${pageCreator.makeSearchURI(pageCreator.endPage + 1)}' />">다음</a></li>
									</c:if>

								</ul>
							</div> 
						</div>
						
						
						<div class="box-footer" >
							<div class="col-sm-2" ></div>
								<form role="form" class="form-inline">
								<div class="form-group" style="padding-left:20%; padding-right:20%;">
									<select id="condition" class="form-control" name="condition">
										<option value="title"
											<c:out value="${param.condition == 'title' ? 'selected' : ''}"/>>제목</option>
										<option value="content"
											<c:out value="${param.condition == 'content' ? 'selected' : ''}"/>>내용</option>
										<option value="memberId"
											<c:out value="${param.condition == 'memberId' ? 'selected' : ''}"/>>작성자</option>
										<option value="titleContent"
											<c:out value="${param.condition == 'titleContent' ? 'selected' : ''}"/>>제목+내용</option>
									</select>
								
									<div class="input-group">
										<input type="text" class="form-control" name="keyword"
											id="keywordInput" value="${param.keyword}" placeholder="검색어">
										<span class="input-group-btn">
											<button type="button" class="btn btn-primary btn-flat"
												id="searchBtn">
												<i class="fa fa-search"></i> 검색
											</button>
										</span>
									</div>
								</div>
							
								</form>
						</div>




					</div>
				</div>

			</section>
			<!-- /.content -->
		</div>
		<!-- /.content-wrapper -->
	</div>
    <!--/.container-->
</div>
  </section>


<script type="text/javascript">
	
	//JQuery문의 시작
	$(document).ready(function() {
		
		//목록 개수 표현하기
		$("#count-per-page input[type=button]").on("click", function() {
						    	
			//console.log($(this).val());
			let count = $(this).val();
			self.location = "mylike?page=${pageCreator.criteria.page}&countPerPage=" + count; 
		});
		
		//검색 버튼 클릭 이벤트
		$("#searchBtn").on("click", function(){
			self.location ="/mypage/myLike?id=${login.memberId}&${pageCreator.makePageURI(1)}"
							+"&condition="+$("select option:selected").val()
							+"&keyword="+$("#keywordInput").val();
		});
		
		//엔터키 입력 이벤드
		$("#keywordInput").keydown(function (key){
			if(key.keyCode==13){//키가 13이면 실행(엔터는 13)
				$("#searchBtn").click();
			}
		})
	});


	</script>
	
  <!--/.blog-->
  <!--blog end -->



<jsp:include page="../include/footer.jsp" />    