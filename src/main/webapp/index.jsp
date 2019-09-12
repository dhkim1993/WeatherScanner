<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML>
<html>
<head>
    <style type="text/text/css">
        @font-face {
            font-family: 'naBrush';
        }
    </style>
    <title>Aerial by HTML5 UP</title>
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no"/>
    <link rel="stylesheet" href="assets/css/main.css"/>
    <noscript><link rel="stylesheet" href="assets/css/noscript.css"/></noscript>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
</head>
<style>
    @media (max-width: 400px) {
        select {
            float: left;
            width: 100%;
        }
    }

    @media (max-width: 400px) {
        input {
            float: left;
            width: 100%;
            margin-right: 0px;
        }
    }

    form {
        margin: 0 auto;
    }

    option {
        width: 20%;
        color: #000000;
    }

    optgroup {
        color: #0A0A2A;
    }

    input {
        color: #0A0A2A;
    }

    select {
        margin-top: 5px;
    }

    .navbar-expand-md {
        width: 500px;
        background-color: #81F7D8;
        opacity: 0.9;

    }

</style>
<body class="is-preload">
<div id="wrapper">
    <div id="bg"></div>
    <div id="overlay"></div>
    <div id="main">

        <!-- Header -->
        <header id="header">
            <div class="container">
                <h1>
                    <p style="font-family: naBrush; color:#ffffff">Weather Scanner</p>
                </h1>
                <p style="font-family: naBrush; color:#ffffff">History Weather &nbsp;&bull;&nbsp; Currently Weather&nbsp;&bull;&nbsp; Future Weather</p>

                <nav class="navbar navbar-expand-md bg-light navbar-light" style="width: 100%;background: none;">
                    <!-- WI 는 WeatherInfo -->
                    <form action="/WI/result" method="get" style="width:75%;">
                        <input type="date" name="date" id="dateSelect" style="border:1px; "/>
                        <select name="city" style="margin-top:5px;" id="citySelect">
                            <option selected disabled hidden>나라&도시</option>
                            <optgroup label="아시아">
                                <option value="방콕">방콕</option>
                                <option value="싱가포르">싱가포르</option>
                                <option value="다낭">다낭</option>
                                <option value="하노이">하노이</option>
                                <option value="발리">발리</option>
                                <option value="세부">세부</option>
                                <option value="코타키나발루">코타키나발루</option>
                            </optgroup>
                        </select>
                        <input id="searchBtn" type="submit" value="search" style="margin-top:5px;"/>
                    </form>
                </nav>
                <div class="welcome-hero-serch-box"></div>
            </div>

            <nav>
                <ul>
                    <%--<li><a href="https://kauth.kakao.com/oauth/authorize?client_id=fd4f87b0a1c6e0be3ef4cd9b8a05b285&redirect_uri=http://localhost:8080/kakaoLogin&response_type=code">
                        <img src="//mud-kage.kakao.com/14/dn/btqbjxsO6vP/KPiGpdnsubSq3a0PHEGUK1/o.jpg"></a>
                    </li>--%>
                    <li><a href="#" class="icon brands fa-facebook" style="color:#ffffff"><span
                        class="label">Facebook</span></a>
                    </li>
                    <li>
                        <a href="https://api.instagram.com/oauth/authorize/?client_id=4d2cc2ac80794b1184eaf27ff19d5330&redirect_uri=&response_type=code"
                           class="icon brands fa-instagram" style="color:#ffffff"><span class="label">Instargram</span></a>
                    </li>
                    <li><a href="#" class="icon brands fa-github" style="color:#ffffff"><span
                            class="label">Github</span></a></li>
                    <li><a href='<c:url value="/member/login"/>' class="icon solid fa-envelope" style="color:#ffffff"><span
                            class="label">Email</span></a></li>
                </ul>
            </nav>
        </header>

        <!-- Footer -->
        <footer id="footer">
            <span class="copyright">&copy; Untitled. Design: <a
                    href="http://html5up.net">HTML5 UP</a>.
            </span>
        </footer>

    </div>
</div>
<script>
    $("#searchBtn").click(function () {
        var target = document.getElementById("citySelect").value;

        if ((target === "나라&도시") || ($("#dateSelect").val() === "")) {
            alert("날짜와 도시를 선택하세요!");
            return false;
        }
    });

    window.onload = function () {
        document.body.classList.remove('is-preload');
    }
    window.ontouchmove = function () {
        return false;
    }
    window.onorientationchange = function () {
        document.body.scrollTop = 0;
    }
</script>
</body>
</html>