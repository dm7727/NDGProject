<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  	<title>NongDamGom - introduce</title>
  	<meta charset="utf-8">
  	<meta name="viewport" content="width=device-width, initial-scale=1">
  	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
  	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
	<div class="p-5 text-white text-center" style="background-color: #B4E8E6">
		<a href="main.jsp"><img src="./images/simple.png" alt="기본당곰얼굴" width="70px" height="60px"/><img src="./images/logo2.png" alt="상단로고2" height="55px"/></a>
	</div>
	<div style="text-align: right; background-color: #B4E8E6;">
		<%
	    if (session.getAttribute("userid") == null) {
	    	//session영역에 저장된 속성값이 없다면 로그아웃 상태이다.
	    	//그러므로 로그인 폼이 화면에 출력되어야 한다.
	    %>
	   	<a href="../login.do"><img src="./images/login.png" alt="로그인" width="70px;" height="60px" /></a>
	    <% 
	    }
	    else {
	    %>
	    <span style="font-family:HY강M; font-weight: bold;">환영합니다, <%= session.getAttribute("userid") %> 님</span>
	    <a href="logout.jsp"><img src="./images/logout.png" alt="로그아웃" width="50px;" height="50px"  /></a>
	    <%}%>
	</div>
	
	<nav class="navbar navbar-expand-sm" style="background-color: #FFFED9">
	  	<div class="container-fluid justify-content-center">
		    <ul class="navbar-nav">
		      	<li class="nav-item">
		        	<a class="nav-link active" href="notice.jsp" 
		        	style="color: black; font-family:한컴 백제 B; font-size: 20px">공지사항</a>
		      	</li>
		      	<li class="nav-item">
		        	<a class="nav-link active" href="#" 
		        	style="color: black; font-family:한컴 백제 B; font-size: 20px">소개</a>
		      	</li>
		      	<li class="nav-item">
		        	<a class="nav-link active" href="shop.jsp" 
		        	style="color: black; font-family:한컴 백제 B; font-size: 20px">상품판매</a>
		      	</li>
		      	<li class="nav-item">
		        	<a class="nav-link active" href="../list.do" 
		        	style="color: black; font-family:한컴 백제 B; font-size: 20px">게시판</a>
		      	</li>
		    </ul>
	  	</div>
	</nav>
	<!-- 여기가 컨텐츠 소개는 인사말/캐릭터/작가/오시는 길로 할 생각 -->
	<div class="container-fluid" style="background-color: rgb(252, 252, 249);">
		<div class="container mt-3">
		  	<!-- Nav tabs -->
		  	<ul class="nav nav-tabs" role="tablist">
		  		<li class="nav-item">
		      		<a class="nav-link active" data-bs-toggle="tab" href="#hello"><h5 style="font-family:HY강B;" >인사말</h5></a>
		    	</li>
		    	<li class="nav-item">
		      		<a class="nav-link" data-bs-toggle="tab" href="#character"><h5 style="font-family:HY강B;" >캐릭터소개</h5></a>
		    	</li>
		    	<li class="nav-item">
		      		<a class="nav-link" data-bs-toggle="tab" href="#artist"><h5 style="font-family:HY강B;" >작가 소개</h5></a>
		    	</li>
		    	<li class="nav-item">
		      		<a class="nav-link" data-bs-toggle="tab" href="#way"><h5 style="font-family:HY강B;" >오시는 길</h5></a>
		    	</li>
		  	</ul>
		
		  	<!-- Tab panes -->
		  	<div class="tab-content">
		    	<div id="hello" class="container tab-pane active"><br>
		    		<img src="./images/hello.png" alt="인사곰" />
		      		<p style="font-family:HY강M; font-size: 20px ">
		      		안녕하세요.<br/>
		      		저는 농담곰페이지를 만들게 된 농담곰을 좋아하는 코린이입니다. <br/>
		      		개인프로젝트로 홈페이지를 만들게 되었고, <br/>
		      		가장 좋아하는 캐릭터인 농담곰을 소개하고 싶어서 농담곰페이지를 만들게 되었습니다. <br/>
		      		비록 농담곰이 한국에서는 활동을 하고 있지 않지만...<br/>
		      		짤로 쓰이는 캐릭터로는 어느정도 인기가 있고 <br/>
		      		최근에는 농담곰 작가의 다른 캐릭터인 치이카와가 한국에 들어오면서 <br/>
		      		농담곰도 다시 돌아올 수 있다는 희망을 얻었습니다! <br/>
		      		그런 의미에서 농담곰의 매력에 빠져보시죠~ <br/>
		      		하찮고 하얀 곰이... 여러분을 기다립니다.
		      		</p>
		    	</div>
		    	<div id="character" class="container tab-pane fade"><br>
		    		<table>
		    			<tr>
		    				<th><img src="./images/cha.png" alt="당곰이 소개" width="400px" height="450px" style="padding-right: 20px" /></th>
		    				<td style="font-family:HY강M; font-size: 16px ">
		    				<b>농담곰 :</b> <br />
							일본명은 自分ツッコミ(지분츳코미쿠마)로 한국말로 설명하자면<br />
							스스로 딴지를 거는 곰이라는 뜻이다. 한국에서는 저런류의 말이 없기 때문에<br />
							한국정서에 맞게 '농담곰' 이라는 이름이 붙여졌다.<br />
							하지만 현재는 저작권의 문제로 작가의 이름인 나가노를 따서 '나가노의 곰' 이라고 한다.<br />
							그래도 농담곰이라는 이름이 가장 잘 어울린다.<br />
							<br />
							농담곰은 먹는 것을 굉장히 좋아한다. <br />
							특히 B급 감성의 서민 음식을 좋아해서 농담곰 만화를 먹으면서 치유하는 만화로 볼 수 있을정도이다.<br />
							형 혹은 오빠가 있다. 간장 센베와 치즈를 같이 먹곤 하는데, 손위 형제가 먹던 것을 흉내 내서 먹는다고 한다. <br />
							그 외에도 어렸을 적 손위 형제가 록맨을 하는 걸 구경했다는 에피소드 만화도 있었다.<br />
							매운맛의 음식을 좋아한다. 매운맛 카레를 8배까지 먹은 바 있다. 엄청나게 고생하긴 했지만... <br />
							한국의 불닭볶음면 같은 것도 좋아하는 듯 하다. 맵지만 중독성이 있다고...<br />
							한국 음식도 꽤나 좋아하는 듯한데 집에서 음식을 만들 때 김치를 넣는다든지, <br />
							불고기 상추쌈을 먹은 만화를 올린다든지,<br />
							양념 치킨을 먹고 양념 치킨을 한글로 쓴 적도 있다. <br />
							순두부찌개랑 주먹밥도 편의점에서 곧잘 먹는다. <br />
							한국 팬에게 보내는 메시지에서도 '나는 호떡을 좋아합니다'라고 한글로 써서 보낸 바 있다. <br />
							이후 농담곰의 판권 문제가 겹치며 한국에서 철수하게 되었지만,,, 한국어로 꼭 돌아오겠다고 남기는 등 <br />
							한국에 상당히 호감을 가지고 있는 듯하다.<br />
		    				</td>
		    			</tr>
		    		</table>
		    		<hr />
		    		<table>
		    			<tr>
		    				<th style="font-size: 20px; font-weight: bold;">농담곰 패밀리 :</th>
		    			</tr>
		    			<tr>
		    				<th><img src="./images/family.png" alt="당곰이가족" /></th>
		    			</tr>
		    				<td style="font-family:HY강M; ">
		    					<br />
			    				<b>퍼그 :</b> 파그 씨(パグさん)라고도 한다. 
			    				농담곰과는 영혼의 단짝.   <br />
			    				농담곰의 주변 인물 중 최초로 등장하게 된 메이저 캐릭터다.  
			    				이름 그대로 강아지 퍼그의 생김새를 하고 있다. 
			    				농담곰과 함께하는 장면이 많다.  <br />
			    				<br />
								<b>마레쿠마 : </b>이름 그대로 말레이시아 곰이 모티브. 혀가 길다.  
								말레이시아 곰은 사실 곰 중에서는 가장 크기가 작은 곰에 속하지만 농담곰이 작아서인지,  <br />
								아니면 농담곰 세계관에선 말레이시아 곰이 커서인지 엄청나게 크게 나온다.   <br />
								농담곰이 마지못해 같이 놀기는 하지만 덩치가 작은 농담곰은 늘 마레쿠마를 만나면  
								아무 말도 못 하고 덜덜 떨기만 한다.  
								덮밥을 좋아하는지 덮밥에 관련해서 먹는 법을 농담곰에게 가르치는 경우가 많다. <br />
								<br />
								<b>두더지 고로케 :</b> 고로케이면서 두더지. 두더지처럼 지하에 모여서 산다. 
								털갈이를 하는 대신 고로케이기 때문에 주기적으로 튀김옷을 털어낸다.  
								바닥에 떨어진 튀김옷은 직접 치우는 착한 고로케.  
								고로케인 주제에 개밥을 먹는 만화가 있었다.  
								바삭바삭해야 하기 때문에 비에 젖으면 몸 상태가 급격히 악화된다.   <br />
								두더지 고로케가 메인으로 등장하는 두더지 고로케 장편 만화가 연재 중이다. <br />
								<br />
								<b>대형견 :</b> 농담곰보다 더 큰 크기의 강아지. 사납지 않고 온화한 성격이며 
								자신의 밥을 훔쳐가는 두더지 고로케에게도 화를 내지 않는다. <br />
								<br />
								<b>유니콘 & 바이콘 :</b> 두더지 고로케 만화에서 간간이 등장하는 악역(?), 
								주로 이들이 등장하면 고로케에게 도움을 주는 것 같지만  
								결과적으로 볼 땐 고로케들이 위기에 처한다. <br />
								<br />
								<b>눙쿠마 : </b>걸을 때 나는 소리가 눙 눙(ヌンヌン)이어서 팬덤 사이에서 눙쿠마, 눙눙쿠마라고 불리고 있다. 
								일명 가짜곰. 농담곰과 비슷하게 생겼지만 입 모양이 전혀 다르다.  
								유니콘, 바이콘과 함께 고로케 만화에서 간간이 등장하며, 그들이 살고 있는 성의 주인. <br />
		    				</td>
		    			<tr>
		    		</table>
		    	</div>
		    	<div id="artist" class="container tab-pane fade"><br>
		      		<h3 style="font-family:HY강M; font-size: 30px; font-weight: bold;">작가 : 일본의 크리에이터 나가노(ナガノ)</h3>
		      		<p style="font-family:HY강M; font-size: 20px ">
		      		농담곰뿐만아니라 치이카와 등 귀여운 캐릭터를 많이 만들어 낸 작가 <br />
		      		최근 그의 캐릭터인 '치이카와'는 2021년 들어서는 일본쪽에서 그야말로 독보적이라고 할 정도의 인기를 얻고 있다. <br />
		      		단행본 2권 판매랭킹이 쟁쟁한 주술회전, 진격의거인 최종권, 원피스, 아인, 우마무스메 신데렐라 그레이 등 유명 만화들을 제치고<br />
		      		1위를 차지하기도 하였고, 각종 어패럴 브랜드들과 쉴새없이 콜라보를 진행하고 있다. <br />
		      		최근 카카오톡 이모티콘에 출시되어 인기순위 1위를 달성했다. 한국을 좋아한다고 한다. 한국과 계약했으면 좋겠다.
		      		</p>
		      		<table>
		      			<th>하얀 햄스터가 치이카와이다.</th>
		      			<tr><img src="./images/chi1.png" alt="치이카와1" /></tr>
		      			<tr><img src="./images/chi2.png" alt="치이카와2" /></tr>
		      		</table>
		    	</div>
		    	
		    	<!-- 지도넣기 -->
		    	<%-- <jsp:include page ="./way.jsp"/> --%>
		    	<div id="way" class="container-fluid tab-pane fade">
			    	<br />
			    	<br />
		    	<img src="./images/map.png" alt="지도" width="500px" height="300px" />
		    	<br /> <br />
		    	<button><a href="./way.jsp" target="blank">지도상세보기</a></button> <br />
		    		<!-- * 카카오맵 - 지도퍼가기 -->
					<!-- 1. 지도 노드 -->
					<!-- <h3 style="font-family:HY강M;">위치 : KOSMO(한국소프트웨어인재개발원)</h3>
					<div id="daumRoughmapContainer1656132846791" class="root_daum_roughmap root_daum_roughmap_landing "></div>
					
					
					   2. 설치 스크립트
					   * 지도 퍼가기 서비스를 2개 이상 넣을 경우, 설치 스크립트는 하나만 삽입합니다.
					
					<script charset="UTF-8" class="daum_roughmap_loader_script" src="https://ssl.daumcdn.net/dmaps/map_js_init/roughmapLoader.js"></script>
					
					3. 실행 스크립트
					<script charset="UTF-8">
					   new daum.roughmap.Lander({
					      "timestamp" : "1656132846791",
					      "key" : "2aqig",
					      "mapWidth" : "700",
					      "mapHeight" : "400"
					   }).render();
					</script>
					-->
					<br />
					<table style="font-family:HY강M; font-size: 20px ">
						<tr>
							<th style="color: blue;">&lt;대중교통으로 오시는 길&gt;</th>
						</tr>
						<tr>
							<td>
								<b>지하철</b> <br />
								- 가산디지털단지역 6번출구 나오셔서 좌측횡단보도 건너 좌측으로 10m 가시면 삼거리가 나옵니다. <br />
								삼거리에서 우측 방향으로 직진하셔서 사거리 대각선방향에 우리은행 건물 413호입니다. <br />
								<br />
								
								<b>버스</b><br />
								- 21, 571, 652, 금천 05 <br />
								[디지털3단지월드벤쳐센터] 정류장에서 하차 <br />
								<br />
								
								<b>주소</b><br />
								- 서울시 금천구 가산디지털2로 123 <br />
								월드메르디앙2차 4층  413호 <br />
							</td>
					</table>
					<hr />
					<table style="font-family:HY강M; font-size: 20px ">
						<tr>
							<th style="color: blue;">&lt;자가용으로 오시는 길&gt;</th>
						</tr>
						<tr>
							<td>
		 						- 서부간선도로를 타고 오다가 광명교를 타고 좌회전 후 첫 사거리에서 우회전 <br />
			
								- 가리봉5거리에서 철산방향 수출의 다리를 넘어 첫 사거리(한진사거리)에서 우회전 <br />
								
								- 남부순환도로 구로IC로 나와 좌회전
							</td>
						</tr>
					</table>
		    	</div>
		  	</div>
		</div>
	</div>
	<div class="mt-2 p-4 text-black text-center" style="background-color: #FFFED9">
	  	<p style="font-family:Hobo BT;">Copyright &copy; NongDamGom</p>
	</div>
</body>
</html>