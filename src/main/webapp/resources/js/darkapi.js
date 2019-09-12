const latitude = "${lat}";
const longitude = "${lon}";
const time = "${time}";

$.ajax({
    headers: {
        "Content-Type": "application/json",
    },
    type: "GET",
    url: "https://cors-anywhere.herokuapp.com/"
        + "https://wi.darksky.net/forecast/9db690b67adc938cb967104b6bb2b664/"
        + latitude + "," + longitude + "," + time + "?exclude=flags&lang=ko",
    dataType: "json",
    success: function (result) {
        printWeatherInfo(result);
    }
});
function printWeatherInfo(result) {
    //시간별 날씨상태아이콘
    const dailyIcon = result.daily.data[0].icon;
    const icon0 = result.hourly.data[0].icon;
    const icon3 = result.hourly.data[3].icon;
    const icon6 = result.hourly.data[6].icon;
    const icon9 = result.hourly.data[9].icon;
    const icon12 = result.hourly.data[12].icon;
    const icon15 = result.hourly.data[15].icon;
    const icon18 = result.hourly.data[18].icon;
    const icon21 = result.hourly.data[21].icon;
    // 날씨설명
    const dailySum = result.daily.data[0].summary;
    //최저,최고 온도
    const dailyTemMin = (((result.daily.data[0].temperatureMin) - 32) * (5 / 9)).toFixed(1);
    const dailyTemMax = (((result.daily.data[0].temperatureMax) - 32) * (5 / 9)).toFixed(1);
    //습도
    const dailyHumidity = (result.daily.data[0].humidity * 100).toFixed(1);
    // 나라별 국제 기준시간별 offset
    const offset = result.offset;
    //일출,일몰
    var sunriseTime = result.daily.data[0].sunriseTime;
    var sunsetTime = result.daily.data[0].sunsetTime;
    //유닉스 일몰일출 변환
    var riseT = new Date(sunriseTime * 1000 - (offset * (-60000)));
    var setT = new Date(sunsetTime * 1000 - (offset * (-60000)));
    //현재유닉스시간 -> 현재시간변환
    var localtime = new Date();
    var t = localtime.getTime()
        + (localtime.getTimezoneOffset() * 60000)
        + (offset * 3600000);
    localtime.setTime(t);
    let year = localtime.getFullYear();
    let month = localtime.getMonth() + 1;
    let day = localtime.getDate();
    let hours = localtime.getHours();
    let minutes = localtime.getMinutes();
    //2자리 숫자로 변환
    month < 10 ? month = '0' + month : month;
    day < 10 ? day = '0' + day : day;
    hours < 10 ? hours = '0' + hours : hours;
    minutes < 10 ? minutes = '0' + minutes : minutes;

    const element =
        "- daily 아이콘 : <canvas class='" + dailyIcon + "'width ='" + 50 + "'height ='" + 50 + "'></canvas><br>"
        + "- daily 날씨 : " + dailySum + "<br>"
        + "- 최고온도 : " + dailyTemMax + "°<br>"
        + "- 최저온도 : " + dailyTemMin + "°<br><br>"
        + "<h4>Dry season & Rainy season</h4><br>"
        + "<div id='timeline'></div><br>"
        + "<h4>Daily Data Chart</h4>"
        + "<div id='lineChartArea'></div>"
        + "&ensp;00시:<canvas class='" + icon0 + "'width ='" + 60 + "'height ='" + 60 + "'></canvas>&emsp;"
        + "03시:<canvas class='" + icon3 + "'width ='" + 60 + "'height ='" + 60 + "'></canvas>&emsp;"
        + "06시:<canvas class='" + icon6 + "'width ='" + 60 + "'height ='" + 60 + "'></canvas>&emsp;"
        + "09시:<canvas class='" + icon9 + "'width ='" + 60 + "'height ='" + 60 + "'></canvas>&emsp;"
        + "12시:<canvas class='" + icon12 + "'width ='" + 60 + "'height ='" + 60 + "'></canvas>&emsp;"
        + "15시:<canvas class='" + icon15 + "'width ='" + 60 + "'height ='" + 60 + "'></canvas>&emsp;"
        + "18시:<canvas class='" + icon18 + "'width ='" + 60 + "'height ='" + 60 + "'></canvas>&emsp;"
        + "21시:<canvas class='" + icon21 + "'width ='" + 60 + "'height ='" + 60 + "'></canvas>&emsp;<br>"
        + "- 습도 : " + dailyHumidity + "%<br>"
        + "- 일출 : " + riseT.getHours() + ":" + riseT.getMinutes() + "<br>"
        + "- 일몰 : " + setT.getHours() + ":" + setT.getMinutes() + "<br>"
        + "- 현재시간기준 로컬시간 : " + year + "-"
        + month + "-" + day + "-" + hours
        + "시-" + minutes + "분<br>"
        + "- offset : " + offset;

    const target = $("#show-weather p");
    target.html(element);

    //아이콘 셋팅
    var icons = new Skycons({"color": "skyblue"}), i, list = [
        dailyIcon, icon0, icon3, icon6, icon9,
        icon12, icon15, icon18, icon21];

    for (i = list.length; i--;) {
        var weatherType = list[i], elements = document
            .getElementsByClassName(weatherType);
        for (e = elements.length; e--;) {
            icons.set(elements[e], weatherType);
        }
    }
    icons.play();

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

    //시간별 온도 차트
    google.charts.load('current', {'packages': ['line']});
    google.charts.setOnLoadCallback(drawChart);

    function drawChart() {

        var data = new google.visualization.DataTable();
        //그래프에 표시할 컬럼 추가
        data.addColumn('number', '시간');
        data.addColumn('number', '온도');
        //데이터 셋팅
        var dataRow = new Array();
        for (var i = 0; i <= 23; i++) {
            var tem = (((result.hourly.data[i].temperature) - 32) * (5 / 9)).toFixed(1);
            var temperature = tem * 1;
            dataRow[i] = [i, temperature];
            data.addRows(dataRow);
        }
        var options = {
            chartType: 'LineChart',
            chart: {
                title: 'Hourly data of Daily',
                subtitle: 'temperature'
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
        var chart = new google.charts.Line(document.getElementById('lineChartArea'));
        chart.draw(data, google.charts.Line.convertOptions(options));
    }
}
