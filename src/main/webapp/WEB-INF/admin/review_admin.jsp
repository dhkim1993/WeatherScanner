<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no"/>
    <title>Insert title here</title>
    <link href="../../resources/assets/css/bootstrap.min.css"
          rel="stylesheet">

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

</head>
<style>
    .table-bordered tr td b {
        color: #000000;
    }
</style>
<body>

<div class="container-fluid">
    <div class="row">
        <div class="col-md-12">
            <jsp:include page="../include/header_ad.jsp"></jsp:include>

            <div class="offset-md-4 col-md-8 memberId"
                 style="font-size: x-large">
                <br> ${nickname} 님 게시물 목록
            </div>
            <hr>
            <div class="box-body">
                <table class="table table-bordered">
                    <tbody>
                    <tr>
                        <th style="width: 30px">No</th>
                        <th style="width: 350px">제목</th>
                        <th style="width: 150px">작성시간</th>
                        <th style="width: 60px">조회</th>
                        <th style="width: 20px">삭제</th>
                    </tr>

                    <!-- 리스트 반복문 돌려서 나열 -->
                    <c:if test="${empty articles}">
                        <tr>
                            <td colspan="5" align="center"><b>회원의 게시물이 존재하지 않습니다.</b></td>
                        </tr>
                    </c:if>
                    <c:if test="${not empty articles }">
                        <c:forEach items="${articles }" var="article">
                            <tr>
                                <td id="boardNo">${article.boardNo}</td>
                                <td><a href="<c:url value='/board/content?boardNo=${article.boardNo}'/>"> ${article.title } </a></td>
                                <td><fmt:formatDate value="${article.regDate}" pattern="yyyy-MM-dd a hh:mm"/></td>
                                <td>${article.viewCnt }</td>
                                <td><button type="button" class="btn btn-danger deleteBtn">삭제</button></td>
                            </tr>®
                        </c:forEach>
                    </c:if>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>
<jsp:include page="../include/footer.jsp"></jsp:include>
<script type="text/javascript">
    $(document).ready(
        function () {
            $(".deleteBtn").on("click", function () {
                    const boardNoObj = $(this).parent().parent().find("#boardNo");
                    const memberIdObj = $(".memberId").text().split('님');
                    let boardNo = boardNoObj.text();
                    let memberId = $.trim(memberIdObj[0]);
                    console.log(memberId);

                    $.ajax({
                        type: "POST",
                        url: "/board/deleteAd/" + boardNo,
                        headers: {
                            "Content-Type": "application/json",
                            "X-HTTP-Method-Override": "POST"
                        },
                        data: JSON.stringify({
                            boardNo: boardNo,
                            memberId: memberId
                        }),
                        dataType: "text",
                        success: function (message) {
                            console.log(message);
                            console.log("result: " + message);
                            if (message === "delSuccess") {
                                alert("삭제가 완료되었습니다.");
                                self.location = "";
                            }
                        },
                        error: function (error) {
                            console.log("error: " + error);
                        }
                    }); //ajax end
                });
        });
</script>
</body>
</html>