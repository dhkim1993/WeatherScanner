<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <jsp:include page="../include/header.jsp"></jsp:include>
    <script src="<c:url value='/resources/icon/skycons.js'/>"></script>
    <script src="https://code.jquery.com/jquery.min.js"></script>
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script type="text/javascript" src="https://www.google.com/jsapi"></script>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
</head>
<body>
<div class="container-fluid">
    <div class="row">
        <div class="col-md-12">
            <div id="page-wrapper" style="padding-left:5%; padding-right:5%;"><br>
                <h1 style="font-size:30px; ">${city}의 정보</h1><br>
                <div id="city-info-page">
                    <p style="font-size:16px;">${cityInfo}</p><hr>
                </div>
                <!-- dr은 건기우기(dry,rain)을 뜻합니다 -->
                <c:import url="/WI/dr"/>
                <div>
                    <h2 style="font-size:30px;">${date} 날씨정보</h2><br>
                    <p style="font-size:16px;">
                        시간 : ${currently.get().time()}<br>
                        날씨 : ${currently.get().summary()}<br>
                        현재온도 : ${currently.get().temperature()}<br><br>
                    </p>
                </div>
                <c:import url="/WI/charticon"/>
            </div>
        </div>
    </div>
</div>
<jsp:include page="../include/footer.jsp"/>
</body>
</html>