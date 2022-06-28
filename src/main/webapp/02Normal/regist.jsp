<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>NDG - regist</title>
    <link rel="stylesheet" href="<%=request.getContextPath() %>/02Normal/common/style.css">
    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
  	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <script>
    $(function() {
        //라디오를 버튼모양으로 바꿔주는 jQuery UI
        $("input[type=radio]").checkboxradio({
            icon: false
        });
        //날짜선택을 편리하게 - Date Picker
        $("#birthday").datepicker({
            dateFormat : "yy-mm-dd",
            showOn: "both",
            buttonImage: "./images/pick.jpg",
            buttonImageOnly: true,
        });    
        $('img.ui-datepicker-trigger').css({'position':'relative','top':'1px','width':'33px','marginTop':'-5px', 'padding-left':'2px'});
    });
    </script>
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <script>
    function zipcodeFind(){
        new daum.Postcode({
            oncomplete: function(data) {
                //DAUM 우편번호API가 전달해주는 값을 콘솔에 출력
                console.log("zonecode", data.zonecode);
                console.log("address", data.address);
                //회원 가입폼에 적용
                var f = document.registFrm;//<form>태그의 DOM객체를 변수에 저장
                f.zipcode.value = data.zonecode;
                f.address1.value = data.address;
                f.address2.focus();
            }
        }).open();
    }
    </script>
    <script>
    function registValdidate(form){ 
    	// alert("폼값이 전송되기 전 유효성 체크를 해주세요.");
        var frm = document.forms[0];
        if(frm.userid.value==''){
            alert('아이디를 입력해주세요');
            frm.userid.focus();
            return false;
        }
        if(frm.pass1.value==''){
            alert('비밀번호를 입력해주세요');
            frm.pass1.focus();
            return false;
        }
        if(frm.pass2.value==''){
            alert('비밀번호 확인을 해주세요');
            frm.pass2.focus();
            return false;
        }
        if(frm.name.value==''){
            alert('이름을 입력해주세요');
            frm.name.focus();
            return false;
        }
        if(frm.birthday.value==''){
            alert('생년월일을 입력해주세요');
            frm.birthday.focus();
            return false;
        }
        if(frm.zipcode.value==''){
            alert('주소를 입력해주세요');
            frm.zipcode.focus();
            return false;
        }
        if(frm.address1.value==''){
            alert('주소를 입력해주세요');
            frm.address1.focus();
            return false;
        }
        if(frm.address2.value==''){
            alert('주소를 입력해주세요');
            frm.address2.focus();
            return false;
        }
        if(frm.email1.value==''){
            alert('이메일을 입력해주세요');
            frm.email1.focus();
            return false;
        }
        if(frm.email2.value==''){
            alert('이메일을 입력해주세요');
            frm.email2.focus();
            return false;
        }
        if(frm.mobile1.value==''){
            alert('핸드폰번호를 입력해주세요');
            frm.mobile1.focus();
            return false;
        }
    } 
    function idCheck(form){
    	
    	alert("아이디 중복체크는 하지않습니다.");
    }
    function inputEmail(form){
        //alert("이메일을 선택하면 도메인 부분에 입력되게 해주세요.")
        var value = $('.s01').val();
        if(value==""){
            $('input[name=email2]').attr('readonly', false);
            $('input[name=email2]').val('');
        }
        else{
            $('input[name=email2]').attr('readonly', true);
            $('input[name=email2]').val(value);
        }
    }
    function commonFocusMove(obj, charLen, nextObj){
    	//alert("글자수 "+charLen+"이 되면 "+nextObj+"으로 포커스가 이동합니다.");
        if(obj.value.length==charLen) {
            document.getElementsByName(nextObj)[0].focus();
        }
    }
    </script>
</head>
<body>
<body>
	<div class="p-5 text-white text-center" style="background-color: #B4E8E6">
		<a href="./02Normal/main.jsp"><img src="./images/simple.png" alt="기본당곰얼굴" width="70px" height="60px"/><img src="./images/logo2.png" alt="상단로고2" height="55px"/></a>
	</div>
	
	<nav class="navbar navbar-expand-sm" style="background-color: #FFFED9">
	  	<div class="container-fluid justify-content-center">
		    <ul class="navbar-nav">
		      	<li class="nav-item">
		        	<a class="nav-link active" href="./02Normal/notice.jsp" 
		        	style="color: black; font-family:한컴 백제 B; font-size: 20px">공지사항</a>
		      	</li>
		      	<li class="nav-item">
		        	<a class="nav-link active" href="./02Normal/introduce.jsp" 
		        	style="color: black; font-family:한컴 백제 B; font-size: 20px">소개</a>
		      	</li>
		      	<li class="nav-item">
		        	<a class="nav-link active" href="./02Normal/shop.jsp" 
		        	style="color: black; font-family:한컴 백제 B; font-size: 20px">상품판매</a>
		      	</li>
		      	<li class="nav-item">
		        	<a class="nav-link active" href="./list.do" 
		        	style="color: black; font-family:한컴 백제 B; font-size: 20px">게시판</a>
		      	</li>
		    </ul>
	  	</div>
	  		<!-- <a href="./login.jsp"><img src="./images/login.png" alt="로그인" width="70px;" height="60px" /></a>
		    <a href="./buy.jsp"><img src="./images/buy.png" alt="장바구니" width="65px;" height="70px" /></a> -->
	</nav>
	<div class="container-fluid" style="background-color: rgb(252, 252, 249);">
		<form action="./regist.do" method="post" name="registFrm" onsubmit="return registValdidate(this)">
			<div class="AllWrap">
			    <div class="wrap_regiform">
			    	<span style="color: black; font-weight: bold;"> 
			    	<img src="./images/heart.png" alt="회원가입" width="30px" height="30px" />
			    	모두 입력해주세요</span>
			    	<!-- <img src="./images/regi.png" alt="회원가입" width="200px" height="80px" /> -->
			        <table style="border-top: 1px solid silver;" class="regi_table">
			            <colgroup>
			                <col width="180px">
			                <col width="*">
			            </colgroup>
			            <tr>
			                <td><span class="red">*</span> 아이디</td>
			                <td>
			                    <input type="text" class="w01" name="userid" value="" />       
			                    <button type="button" onclick="idCheck(this.form);">중복확인</button>             
			                </td>
			            </tr>
			            <tr>
			                <td></td>
			                <td>
			                    <span class="comment">※ 8~16자의 영문과 숫자만 가능합니다.</span>                
			                </td>
			            </tr>
			            <tr>
			                <td><span class="red">*</span> 비밀번호</td>
			                <td>
			                    <input type="password" class="w01" name="pass1" value="" />                   
			                </td>
			            </tr>
			            <tr>
			                <td></td>
			                <td>
			                    <span class="comment">
			                        ※ 영문/숫자/특수문자 조합 6~20자 이상 입력해주세요.
			                    </span>
			                </td>
			            </tr>
			            <tr>
			                <td><span class="red">*</span> 비밀번호확인</td>
			                <td>
			                    <input type="password" class="w01" name="pass2" value="" />
			                </td>
			            </tr>
			            <tr>
			                <td><span class="red">*</span> 이름</td>
			                <td>
			                    <input type="text" class="w01" name="name" value="" />
			                    <label style="height: 30px;" for="radio-1">남</label>
			                    <input type="radio" name="gender" id="radio-1" value="남" checked>
			                    <label style="height: 30px;" for="radio-2">여</label>
			                    <input type="radio" name="gender" id="radio-2" value="여">
			                    
			                </td>
			            </tr>
			            <tr>
			                <td><span class="red">*</span> 생년월일</td>
			                <td style="padding: 0px 0 5px 5px;">
			                    <input type="text" class="w02" name="birthday" id="birthday" value="" />&nbsp;
			                    <!-- <img src="./images/pick.jpg" id="pick" class="pick" /> -->
			                </td>
			            </tr>
			            <tr>
			                <td><span class="red">*</span> 주소</td>
			                <td>
			                    <input type="text" class="w03" name="zipcode" value="" />
			                    <button type="button" onclick="zipcodeFind();">우편번호찾기</button> 
			                </td>
			            </tr>
			            <tr>
			                <td></td>
			                <td>
			                    <input type="text" class="w04" name="address1" value="" />                
			                    <input type="text" class="w04" name="address2" value="" />
			                </td>
			            </tr>
			            <tr>
			                <td><span class="red">*</span> 이메일</td>
			                <td>
			                    <input type="text" class="w05" name="email1" value="" />
			                    @
			                    <input type="text" class="w05" name="email2" value="" />
			                    <select name="email_domain" class="s01" onchange="inputEmail(this.form);">
			                        <option value="">직접입력</option>
			                        <option value="naver.com">naver.com</option>
			                        <option value="hanmail.net">hanmail.net</option>
			                        <option value="gmail.com">gmail.com</option>
			                    </select>
			                </td>
			            </tr>
			            <tr>
			                <td><span class="red">*</span> 휴대폰번호</td>
			                <td>
			                    <select name="mobile1" class="s02" onchange="commonFocusMove(this, 3, 'mobile2');">
			                        <option value=""></option>
									<option value="010">010</option>
			                        <option value="011">011</option>
			                        <option value="016">016</option>
			                        <option value="017">017</option>
			                        <option value="018">018</option>
			                        <option value="019">019</option>
			                    </select>
			                    -
			                    <input type="text" class="w06" name="mobile2" maxlength="4" 
			                        value="" onkeyup="commonFocusMove(this, 4, 'mobile3');" />
			                    -
			                    <input type="text" class="w06" name="mobile3" maxlength="4" 
			                        value="" onkeyup="commonFocusMove(this, 4, 'tel1');" />
			                </td>
			            </tr>
			        </table>
			        <div style="text-align: center; margin-top:10px;">
			            <button type="submit" class="btn_search" >회원가입</button>
			            <button type="reset" class="btn_search">다시쓰기</button>
			        </div>
			    </div>
			</div>
		</form>
	</div>
	
	<div class="mt-2 p-4 text-black text-center" style="background-color: #FFFED9">
	  	<p style="font-family:Hobo BT;">Copyright &copy; NongDamGom</p>
	</div>
</body>
</html>