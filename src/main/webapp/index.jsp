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
            width: 100%;
        }
    }
    @media (max-width: 400px) {
        input {
            width: 100%;
        }
    }

    form {
        margin: 0 auto;
    }

    option {
        color: #000000;
    }

    optgroup {
        color: #0A0A2A;
    }

    input {
        color: #0A0A2A;
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

                <nav class="navbar navbar-expand-md bg-light navbar-light" style="background: none;">
                    <!-- WI 는 WeatherInfo -->
                    <form class="form-inline" action="/WI/result"  method="get">
                        <div class="form-group" style="text-align:center; width: 120%">
                        <input type="date" class="form-control" name="date" id="dateSelect" style="margin-right: 2%; margin-bottom: 2px;"/>
                        <select class="form-control" name="city" id="citySelect" style="margin-right: 2%; margin-bottom: 2px;">
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
                        <input class="form-control" id="searchBtn" type="submit" value="search"/>
                        <div class="welcome-hero-serch-box"></div>
                        </div>
                    </form>
                </nav>
            </div>

            <nav>
                <ul>
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