<%--
  Created by IntelliJ IDEA.
  User: voldemort
  Date: 09/09/2019
  Time: 5:51 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
</head>
<body>

<script>
    //시간별 온도 차트
    google.charts.load('current', {'packages': ['line']});
    google.charts.setOnLoadCallback(drawChart);

    function drawChart() {
        var hourlyData = new google.visualization.DataTable();
        //그래프에 표시할 컬럼 추가
        hourlyData.addColumn('timeofday', 'Time of Day');
        hourlyData.addColumn('number', '온도');
        //데이터 셋팅
        hourlyData.addRows([
            [[0,0,0], ${hourly.getHour(16).temperature()}],
            [[1,0,0], ${hourly.getHour(17).temperature()}],
            [[2,0,0], ${hourly.getHour(18).temperature()}],
            [[3,0,0], ${hourly.getHour(19).temperature()}],
            [[4,0,0], ${hourly.getHour(20).temperature()}],
            [[5,0,0], ${hourly.getHour(21).temperature()}],
            [[6,0,0], ${hourly.getHour(22).temperature()}],
            [[7,0,0], ${hourly.getHour(23).temperature()}],
            [[8,0,0], ${hourly.getHour(0).temperature()}],
            [[9,0,0], ${hourly.getHour(1).temperature()}],
            [[10,0,0], ${hourly.getHour(2).temperature()}],
            [[11,0,0], ${hourly.getHour(3).temperature()}],
            [[12,0,0], ${hourly.getHour(4).temperature()}],
            [[13,0,0], ${hourly.getHour(5).temperature()}],
            [[14,0,0], ${hourly.getHour(6).temperature()}],
            [[15,0,0], ${hourly.getHour(7).temperature()}],
            [[16,0,0], ${hourly.getHour(8).temperature()}],
            [[17,0,0], ${hourly.getHour(9).temperature()}],
            [[18,0,0], ${hourly.getHour(10).temperature()}],
            [[19,0,0], ${hourly.getHour(11).temperature()}],
            [[20,0,0], ${hourly.getHour(12).temperature()}],
            [[21,0,0], ${hourly.getHour(13).temperature()}],
            [[22,0,0], ${hourly.getHour(14).temperature()}],
            [[23,0,0], ${hourly.getHour(15).temperature()}]
        ]);

        var options = {
            chart: {
                subtitle: 'Temperature'
            },
            width: '80%',
            height: 500,
            colors: 'blue',
            axes: {
                x: {
                    0: {side: 'bottom'}
                }
            },
            isStacked: 'percent',
            focusTarget: 'category',
            legend: {position: "top", textStyle: {fontSize: 13}},
            animation: {startup: true, duration: 1000, easing: 'linear'}
        };
        var chart = new google.charts.Line(document.getElementById('HourlyChartArea'));
        chart.draw(hourlyData, google.charts.Line.convertOptions(options));
    }

    //요일별 온도 차트
    google.charts.load('current', {'packages': ['line']});
    google.charts.setOnLoadCallback(drawChart2);

    function drawChart2() {
        var dailyData = new google.visualization.DataTable();
        //그래프에 표시할 컬럼 추가
        // data.addColumn('date', 'week of Day');
        dailyData.addColumn('date', 'Day of Week');
        dailyData.addColumn('number', '최고');
        dailyData.addColumn('number', '최저');

        //데이터 셋팅
        dailyData.addRows([
            [new Date('${time[0]}'),  ${daily.getDay(1).temperatureMax()}, ${daily.getDay(1).temperatureMin()}],
            [new Date('${time[1]}'),  ${daily.getDay(2).temperatureMax()}, ${daily.getDay(2).temperatureMin()}],
            [new Date('${time[2]}'),  ${daily.getDay(3).temperatureMax()}, ${daily.getDay(3).temperatureMin()}],
            [new Date('${time[3]}'),  ${daily.getDay(4).temperatureMax()}, ${daily.getDay(4).temperatureMin()}],
            [new Date('${time[4]}'),  ${daily.getDay(5).temperatureMax()}, ${daily.getDay(5).temperatureMin()}],
            [new Date('${time[5]}'),  ${daily.getDay(6).temperatureMax()}, ${daily.getDay(6).temperatureMin()}],
            [new Date('${time[6]}'),  ${daily.getDay(7).temperatureMax()}, ${daily.getDay(7).temperatureMin()}]
        ]);

        var options2 = {
            chartType: 'LineChart',
            chart: {
                subtitle: 'Max,Min'
            },
            gradient:{
                color1: 'red',
                color2: 'blue'
            },
            width: '80%',
            height: 500,
            axes: {
                x: {
                    0: {side: 'bottom'}
                }
            },
            isStacked: 'percent',
            focusTarget: 'category',
            legend: {position: "top", textStyle: {fontSize: 13}},
            animation: {startup: true, duration: 1000, easing: 'linear'}
        };
        var weeklyChart = new google.charts.Line(document.getElementById('WeeklyChartArea'));
        weeklyChart.draw(dailyData, google.charts.Line.convertOptions(options2));
    }
</script>


<h4>Hourly Data Chart</h4>
<div id='HourlyChartArea'></div>
<br>
<h4>Daily Data Chart</h4>
<div id='WeeklyChartArea'></div><br>

<table width="90%" align="center" style="text-align: center">
    <tr style="text-align: center">
        <c:forEach var="weekofday" items="${weekOfDay}">
        <td>${weekofday}</td>
        </c:forEach>
    </tr>
    <tr>
        <c:forEach var="i" begin="1" end="7" step="1">
            <td><canvas id = "icon${i}" width = "60" height = "60"></canvas></td>
        </c:forEach>
    </tr>
    <tr>
        <td>Max : ${daily.getDay(1).temperatureMax()}</td>
        <td>Max : ${daily.getDay(2).temperatureMax()}</td>
        <td>Max : ${daily.getDay(3).temperatureMax()}</td>
        <td>Max : ${daily.getDay(4).temperatureMax()}</td>
        <td>Max : ${daily.getDay(5).temperatureMax()}</td>
        <td>Max : ${daily.getDay(6).temperatureMax()}</td>
        <td>Max : ${daily.getDay(7).temperatureMax()}</td>
    </tr>
    <tr>
        <td>Min : ${daily.getDay(1).temperatureMin()}</td>
        <td>Min : ${daily.getDay(2).temperatureMin()}</td>
        <td>Min : ${daily.getDay(3).temperatureMin()}</td>
        <td>Min : ${daily.getDay(4).temperatureMin()}</td>
        <td>Min : ${daily.getDay(5).temperatureMin()}</td>
        <td>Min : ${daily.getDay(6).temperatureMin()}</td>
        <td>Min : ${daily.getDay(7).temperatureMin()}</td>
    </tr>
</table>
<script>
    var skycons = new Skycons({"color": "pink"});
    for(var i=1; i<=7; i++){
        skycons.add("icon"+i, ${daily.getDay(i).icon()});
    }
    skycons.play ();
</script>
</body>
</html>
