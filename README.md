# Spring WebMVC Project - WeatherScanner 
### This is a web project that tells you the weather of your chosen destination, the city information, and the good time to travel there.<br>
## Main Function<br>
1. Providing weather and travel information for a selected date and destination.<br>
2. Providing information about a good time to travel (ex: dry-season, rainy-season information)<br>
3. Monthly Recommended Travel Destination Information.<br>
4. Membership registration (Asynchronized Communication), login (Auto Login)<br>
5. Board (attached file), Reply (Asynchronized Communication) CRUD <br>
6. Admin-Page (Member management, Manage Posts, Travel Site Management)
7. MyPage (my collection, my writed, modify my member-info)

### 여러분이 선택한 목적지의 날씨, 도시 정보, 그리고 그곳을 여행하기 좋은 기간을 알려주는 웹 프로젝트 입니다. <br>
## 주요기능 
1. 선택한 날짜 및 목적지에 대한 날씨 및 여행 정보 제공 (dark sky API)<br>
2. 여행하기 좋은 시간에 대한 정보 제공 (예: 건기,우기 정보)<br>
3. 월별 추천 여행지 정보<br>
4. 회원가입 (비동기통신), 로그인 (자동로그인기능) <br>
5. 게시판 (첨부파일기능) ,댓글 (비동기통신) CRUD <br>
6. 관리자 페이지 (회원관리, 게시물관리, 월별 추천여행지 관리)<br>
7. 마이페이지 (저장한 컬렉션, 내가 작성한 게시물, 회원정보 수정) 


## Development Environment

macOS 10.14.6<br>
IntelliJ IDEA 2018.2.5 (Ultimate Edition)<br>
Build #IU-182.4892.20, built on October 16, 2018<br>
JRE: 1.8.0_152-release-1248-b19 x86_64<br>
JVM: OpenJDK 64-Bit Server VM by JetBrains s.r.o<br>
SDK: java 1.8<br>
Spring 5.1.9.RELEASE<br>
Tomacat 8.0.53<br>
Gradle<br>
mysql<br>
mybatis 2.1.0<br><br>


Main Page
> 날짜와 여행지를 선택해서 검색합니다. 하단에 email 모양 버튼은 회원가입 입니다.
> <img width="1262" alt="main" src="https://user-images.githubusercontent.com/46931527/64922105-4aed9b80-d806-11e9-9950-f4e0b6f651de.png">

Weather Infomation Page
> 도시의 정보와 건기,우기를 차트로 보여줍니다. 
> <img width="1396" alt="스크린샷 2019-09-15 오후 5 59 00" src="https://user-images.githubusercontent.com/46931527/64935750-d2cab880-d88d-11e9-95fc-f8cb92dbe7c5.png">
> 선택한 날짜의 날씨와 하루 시간대별 온도를 차트로 보여 줍니다.
> <img width="1396" alt="스크린샷 2019-09-15 오후 5 59 45" src="https://user-images.githubusercontent.com/46931527/64935767-e4ac5b80-d88d-11e9-97d6-0897b053835e.png">
> 오늘 날짜로부터 일주일간 날씨와 최고저 온도를 보여줍니다.
> <img width="1396" alt="스크린샷 2019-09-15 오후 5 59 52" src="https://user-images.githubusercontent.com/46931527/64935769-e6761f00-d88d-11e9-8f49-823cefe9d971.png">

Login, Register Page
> Auto-Login 기능은 session_limit을 90일로 증가시킵니다.
> <img width="1170" alt="스크린샷 2019-09-16 오전 10 32 02" src="https://user-images.githubusercontent.com/46931527/64935958-9cda0400-d88e-11e9-92d9-3f6d725dcdad.png">
> login, pw input은 key-up event로 비동기(Asynchronized Communication) ajax 통신으로 실시간으로 DB에서 중복검사를 합니다. 
> <img width="1170" alt="스크린샷 2019-09-16 오전 10 32 48" src="https://user-images.githubusercontent.com/46931527/64935962-9f3c5e00-d88e-11e9-9a49-9e4621eca3c0.png">

Board Page
> 여행 후기나 날씨 정보를 게시할 수 있는 게시판 입니다. 검색기능이 있습니다.
> <img width="1400" alt="스크린샷 2019-09-16 오전 10 38 25" src="https://user-images.githubusercontent.com/46931527/64936373-9056ab00-d890-11e9-9e8f-90dd2d1ed32f.png">
> 글쓰기 버튼을 눌렀을때 Write Page 입니다. 파일을 첨부 할 수 있습니다.
> <img width="911" alt="스크린샷 2019-09-16 오전 10 41 56" src="https://user-images.githubusercontent.com/46931527/64936382-9d739a00-d890-11e9-8385-e0301333c704.png">
> Modify Page
> <img width="1194" alt="스크린샷 2019-09-16 오전 11 18 42" src="https://user-images.githubusercontent.com/46931527/64936384-a06e8a80-d890-11e9-83be-ca7889543b7d.png">
> 게시물 제목 클릭시 게시물 내용 보는 Content Page 입니다. 댓글 등록과 수정, 삭제가 가능합니다.
> 좋아요 버튼 클릭시 자신의 컬렉션으로 저장되어 자신이 좋아요 누른 게시물을 마이페이지에서 모아 볼 수 있습니다.
> <img width="1400" alt="스크린샷 2019-09-16 오전 10 40 30" src="https://user-images.githubusercontent.com/46931527/64936640-f2fc7680-d891-11e9-9df0-57ec78d8883d.png">
> <img width="1400" alt="스크린샷 2019-09-16 오전 10 40 39" src="https://user-images.githubusercontent.com/46931527/64936399-b419f100-d890-11e9-8568-204fc79e238b.png">
> Reply modify, delete는 modal 창으로 구현
> <img width="697" alt="스크린샷 2019-09-16 오전 10 41 10" src="https://user-images.githubusercontent.com/46931527/64936398-b1b79700-d890-11e9-822a-292ead4baec3.png">

Monthly Recommend Page
> 해당 월에 가장 여행학 좋은 여행지를 3개씩 추천해주는 페이지 입니다.
> <img width="1157" alt="스크린샷 2019-09-16 오후 3 17 22" src="https://user-images.githubusercontent.com/46931527/64937436-373d4600-d895-11e9-95fe-f7e4c702d905.png">
> <img width="1157" alt="스크린샷 2019-09-16 오후 3 17 48" src="https://user-images.githubusercontent.com/46931527/64937437-37d5dc80-d895-11e9-86b1-e73fe7314910.png">

Admin Page
> 회원관리 페이지 - 회원 탈퇴 및 회원이 작성한 게시물을 삭제 할 수 있습니다.
> <img width="1433" alt="스크린샷 2019-09-16 오전 11 21 41" src="https://user-images.githubusercontent.com/46931527/64936641-f3950d00-d891-11e9-8dd2-cbd86afbc29f.png">
> 월별 추천여행지 관리 페이지 - 여행지를 수정 삭제 할 수 있습니다.
> <img width="1433" alt="스크린샷 2019-09-16 오전 11 22 06" src="https://user-images.githubusercontent.com/46931527/64936642-f3950d00-d891-11e9-9c4d-531a31d1f385.png">
> 수정 페이지
> <img width="1433" alt="스크린샷 2019-09-16 오전 11 22 17" src="https://user-images.githubusercontent.com/46931527/64936643-f3950d00-d891-11e9-9d35-e008be338cbd.png">
> 추천 여행지 등록 페이지 
> <img width="1157" alt="스크린샷 2019-09-16 오전 11 22 58" src="https://user-images.githubusercontent.com/46931527/64936644-f42da380-d891-11e9-9a03-a48b2fb4e2c5.png">

MyPage
> 회원정보 수정 페이지 
> <img width="1362" alt="스크린샷 2019-08-16 오전 10 31 42" src="https://user-images.githubusercontent.com/46931527/64936397-af553d00-d890-11e9-821a-0851ff611824.png">
> 내가 좋아요 누른 컬렉션에 저장된 게시물 모아 보기 
> <img width="1362" alt="스크린샷 2019-08-16 오전 10 32 28" src="https://user-images.githubusercontent.com/46931527/64936390-a6646b80-d890-11e9-831f-62f62d75dd95.png">
> 내가 작성한 게시글 모아 보기 - 수정,삭제 가능
> <img width="1362" alt="스크린샷 2019-08-16 오전 10 32 42" src="https://user-images.githubusercontent.com/46931527/64937807-b8e1a380-d896-11e9-9b84-be027166b961.png">

