<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script type="text/javascript" src="https://www.google.com/jsapi"></script>
    <script>
        //건기우기차트
        google.charts.load('current', {'packages': ['timeline']});
        google.charts.setOnLoadCallback(DRdrawChart);

        function DRdrawChart() {
            var container = document.getElementById('timeline');
            var DRchart = new google.visualization.Timeline(container);
            var DRdataTable = new google.visualization.DataTable();

            DRdataTable.addColumn({type: 'string', id: 'President'});
            DRdataTable.addColumn({type: 'date', id: 'Start'});
            DRdataTable.addColumn({type: 'date', id: 'End'});

            DRdataTable.addRows([
                ['우기(비)', new Date("${dr.cityRainStart}"), new Date("${dr.cityRainEnd}")],
                ['건기(dry)', new Date("${dr.cityDryStart}"), new Date("${dr.cityDryEnd}")],
                ['추천(recommend)', new Date("${dr.rcmdMonStart}"), new Date("${dr.rcmdMonEnd}")]
            ]);
            DRchart.draw(DRdataTable);
        }
    </script>
</head>
<body>
<h4>Dry season & Rainy season</h4><br>
<div id='timeline'></div>
</body>
</html>