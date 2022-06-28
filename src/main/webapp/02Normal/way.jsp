<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>NDG - way</title>
</head>
<body>
	<h3 style="font-family:HY강M;">위치 : KOSMO(한국소프트웨어인재개발원)</h3>
	<div id="daumRoughmapContainer1656132846791" class="root_daum_roughmap root_daum_roughmap_landing "></div>
	
	<!--
	   2. 설치 스크립트
	   * 지도 퍼가기 서비스를 2개 이상 넣을 경우, 설치 스크립트는 하나만 삽입합니다.
	-->
	<script charset="UTF-8" class="daum_roughmap_loader_script" src="https://ssl.daumcdn.net/dmaps/map_js_init/roughmapLoader.js"></script>
	
	<!-- 3. 실행 스크립트 -->
	<script charset="UTF-8">
	   new daum.roughmap.Lander({
	      "timestamp" : "1656132846791",
	      "key" : "2aqig",
	      "mapWidth" : "700",
	      "mapHeight" : "400"
	   }).render();
	</script>
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
</body>
</html>