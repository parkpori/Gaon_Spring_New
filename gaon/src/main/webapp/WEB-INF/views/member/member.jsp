<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="${path}/resources/css/common.css?v=1">
<title>Insert title here</title>
	<style type="text/css">
		.main_div {
            width: 800px;
            margin: 10px auto 0;
            padding: 80px 50px 20px;
            color: #444;
        }
        #sign_title {
            font-family: 'Noto Sans KR', sans-serif;
            display: block;
            font-size: 32px;
            color: #444;
            letter-spacing: -1px;
        }
        .sign {
            padding: 50px 0;
        }
        .sign_index {
            font-family: 'Noto Sans KR', sans-serif;
            font-size: 18px;
            margin-bottom: 4px;
            letter-spacing: -1px;
            color: #E65D6E;
        }
        .sign > div > input {
            height: 45px;
            padding-left: 14px;
            border: 1px solid #ddd;
        }
        .sign > div {
            position: relative;
        }
        .id_flex {
            display: flex;
            align-items: center;
        }
        .box_inner {
            position: absolute;
            top: 22px;
            right: 15px;
            font-size: 12px;
            color: #7BA518;
        }
        .sign_box {
            margin: 7px 0;
            width: 100%;
        }
        ::placeholder {
            font-size: 13px;
        }
        .sign_phone {
            display: flex;
            margin-top: 7px;
        }
        .sign_phone > span {
            display: inline-block;
            position: relative;
            height: 1px;
            width: 8px;
            background: #777;
            top: 23px;
        }
        #sign_phone_1 {
            flex: 1;
            margin-right: 5px;
        }
        #sign_phone_2 {
            flex: 1;
            margin: 0 5px;
        }
        #sign_phone_3 {
            flex: 1;
            margin-left: 5px;
        }
        #sign_ckmessage {
            position: absolute;
            visibility: hidden;
        }
        .box_inner_phone {
            font-size: 12px;
            float: right;
            color: #7BA518;
            margin: 8px 15px 0 0;
        }
        #sign_ckmessage_text {
            background: url('${path}/resources/img/check_off.gif') no-repeat;
            height: 25px;
            margin: 8px 0 10px 0;
        }
        #sign_ckmessage_text > span {
            font-size: 12px;
            font-weight: lighter;
            color: #777;
            padding-left: 28px;
            line-height: 25px;
        }
        #sign_ckmessage:checked +#sign_ckmessage_text {
            background: url('${path}/resources/img/check_on.gif') no-repeat;
        }
        #sign_ckmessage:checked +#sign_ckmessage_text>span {
            color: #444;
        }
        .sign_email {
            display: flex;
        }
        .sign_email_flex {
            flex: 1;
        }
        #sign_email_id, #sign_email_url {
            height: 45px;
            padding-left: 14px;
            border: 1px solid #ddd;
            margin: 7px 10px 0 0;
        }
        #sign_email_select {
            height: 45px;
            border: 1px solid #ddd;
            margin:7px 0 0 0;
            padding: 0 14px;
            color: #444;
        }
        .ckposition {
            position: relative;
        }
        #sign_ckemail {
            visibility: hidden;
            position: absolute;
        }
        .box_inner_email {
            font-size: 12px;
            float: right;
            color: #7BA518;
            margin: 8px 15px 0 0;
        }
        #sign_ckemail_text {
            background: url('${path}/resources/img/check_off.gif') no-repeat;
            height: 25px;
            margin: 8px 0 10px 0;
        }
        #sign_ckemail_text > span {
            font-size: 12px;
            font-weight: lighter;
            color: #777;
            padding-left: 28px;
            line-height: 25px;
        }

        #sign_ckemail:checked +#sign_ckemail_text {
            background: url('${path}/resources/img/check_on.gif') no-repeat;
        }
        #sign_ckemail:checked +#sign_ckemail_text>span {
            color: #444;
        }
        #sample6_postcode {
            margin: 7px 7px 5px 0px;
            height: 45px;
        }
        #sample4_postcode2 {
            height: 45px;
            width: 120px;
            box-sizing: border-box;
            padding: 0;
            background: #666;
            border: 0px;
            font-size: 14px;
            color: white;
        }

        #sample6_address {
            margin: 5px 0;
            height: 45px;
            width: 100%;
        }
        #sample6_detailAddress {
            display: block;
            margin: 5px 0 0;
            height: 45px;
            width: 100%;
        }
        #box_inner_address {
            font-size: 12px;
            float: right;
            color: #7BA518;
            margin: 8px 15px 0 0;
        }









        #sign_index2 {
            margin: 45px 0 10px;
        }
        .sign_stitle {
            margin: 20px 0 8px;
            font-size: 13px;
        }
        
        .sign_birth {
            display: flex;
        }
        .sign_year_day {
            flex: 1;
            height: 45px;
            border: 1px solid #ddd;
            padding: 0 14px;
            color: #444;
            margin-right: 10px;
        }
        .sign_birth > input:last-child {
            margin-right: 0;
        }
        #sign_birth_text {
            font-size: 12px;
            color: #777;
            margin: 8px 0 80px;
        }
        #sign_finish {
        	display: flex;
        	justify-content: center;
        	align-items: center;
        }
        .btn_type {
        	display: inline-block;
        }
        .btn_type > button {
        	display: inline-block;
        	font-family: 'Noto Sans KR', sans-serif;
        	height: 55px;
            width: 200px;
        	color: white;
        	border: 0;
            border-radius: 2px;
            font-size: 17px;
            transition: .3s;
            margin-bottom: 25px;
        }
        #btn_default {
        	border: 1px solid #ddd;
        	color: #999;
        	background: white;
        }
        #btn_agree {
        	background: #FE9E95;
            margin-left: 20px;
        }
        #btn_default:hover {
        	background: #eee;
        }
        #btn_agree:hover {
            background: #E65D6E;
        }
    </style>
</head>
<body>
	<form action="${path}/member/create" method="POST" name="frm_mem" id="frm_mem">
	    <div class="main_div">
	        <div id="sign_title">회원가입</div>
	        <div class="sign">
	            <div class="sign_index">필수항목</div>
	            <div class="id_flex">
	                <input type="text" class="sign_box" id="sign_id" placeholder="아이디" name="id">
	                <span class="box_inner" id="box_inner_id">
	                    3~15자의 영문/숫자 또는 ,_를 조합하여 입력
	                </span>
	            </div>
	            <div>
	                <input type="password" class="sign_box" id="sign_pw1" placeholder="비밀번호" name="pw">
	                <span class="box_inner" id="box_inner_pw1">
	                    5~16자의 영문/숫자를 조합하여 입력
	                </span>
	            </div>
	            <div>
	                <input type="password" class="sign_box" id="sign_pw2" placeholder="비밀번호 확인">
	                <span class="box_inner" id="box_inner_pw2">
	                    5~16자의 영문/숫자를 조합하여 입력
	                </span>
	            </div>
	            <div>
	                <input type="text" class="sign_box" id="sign_name" placeholder="성명" name="name">
	                <span class="box_inner" id="box_inner_name">
	                    표준 한글 2~8자까지 가능합니다.
	                </span>
	            </div>
	            <div class="sign_phone">
	                <input type="text" id="sign_phone_1" placeholder="휴대폰" name="phone1">
	                <span></span>
	                <input type="text" id="sign_phone_2" name="phone2">
	                <span></span>
	                <input type="text" id="sign_phone_3" name="phone3">
	            </div>
	            <div class="ckposition">
	                <input type="checkbox" id="sign_ckmessage">
	                <label for="sign_ckmessage" id="sign_ckmessage_text">
	                    <span>이벤트 및 혜택정보 카카오톡/SMS 수신동의(선택)</span>
	                </label>
	                <div class="box_inner_phone">필수입력 정보입니다.</div>
	            </div>
	            <div>
	                <div class="sign_email">
	                    <input type="text" class="sign_email_flex" id="sign_email_id" placeholder=" 이메일" name="sign_email_id">
	                    <input type="text" class="sign_email_flex" id="sign_email_url" placeholder="사이트 주소" name="sign_email_url">
	                    <select class="sign_email_flex" id="sign_email_select">
	                        <option>선택해 주세요</option>
	                        <option value="hanmail.net">hanmail.net</option>
	                        <option value="naver.com">naver.com</option>
	                        <option value="gmail.com">gmail.com</option>
	                        <option value="nate.com">nate.com</option>
	                        <option value="directVal" selected="selected">직접입력</option>
	                    </select>
	                    <input type="hidden" id="email" name="email">
	                </div>
	                <div class="ckposition">
	                    <input type="checkbox" id="sign_ckemail">
	                    <label for="sign_ckemail" id="sign_ckemail_text">
	                        <span>이벤트 및 혜택정보 이메일 수신동의(선택)</span>
	                    </label>
	                    <div class="box_inner_email">필수입력 정보입니다.</div>
	                </div>
	            </div>
	            <div class="sign_address">
	            	<input type="text" id="sample6_postcode" placeholder="우편번호" class="addrbtn" readonly="readonly" name="zipcode">
		<input type="button" onclick="sample6_execDaumPostcode()" id="sample4_postcode2" value="우편번호 찾기"><br>
		<input type="text" class="address_detail addrbtn" id="sample6_address" placeholder="주소" readonly="readonly" name="addr1">
		<input type="text" class="address_detail" id="sample6_detailAddress" placeholder="상세주소" name="addr2">
	            </div>
	            <div id="box_inner_address">필수입력 정보입니다.</div>
	            <div class="sign_index" id="sign_index2">선택항목</div>
	            
	            <div class="sign_stitle" id="sign_year">생년월일</div>
	            <div class="sign_birth">
	                <input type="text" class="sign_year_day"  id="yy" placeholder="년(4자)" name="birth_year">
	                <select class="sign_year_day" name="birth_month">
	                    <option>월</option>
	                    <option value="1">1</option>
	                    <option value="2">2</option>
	                    <option value="3">3</option>
	                    <option value="4">4</option>
	                    <option value="5">5</option>
	                    <option value="6">6</option>
	                    <option value="7">7</option>
	                    <option value="8">8</option>
	                    <option value="9">9</option>
	                    <option value="10">10</option>
	                    <option value="11">11</option>
	                    <option value="12">12</option>
	                </select>
	                <input type="text" class="sign_year_day" id="dd" placeholder="일" name="birth_day">
	            </div>
	            <div id="sign_birth_text">등록된 생일에 생일 축하 쿠폰을 선물로 드립니다.(연1회)</div>
	            <div id="sign_finish">
	            	<span class="btn_type"><button type="button" id="btn_default">뒤로가기</button></span>
	                <span class="btn_type"><button type="button" id="btn_agree">회원가입</button></span>
	            </div>
	        </div>
	    </div>
	</form>
    <script type="text/javascript" src="${path}/resources/js/validation.js"></script>
    <script type="text/javascript">
        
        $(document).ready(function() {
        	// email을 합치고 input(hidden)에 담아야 전송됨
        	
        	var return_id = false;
        	var return_pw = false;
        	var return_name = false;
        	var return_phone1 = false;
        	var return_phone2 = false;
        	var return_phone3 = false;
        	var return_e_id = false;
        	var return_url = false;
        	var return_addr = false;
        	
        	var return_all = false;
        	
        	$('#btn_default').click(function(){
        		location.href = "${path}/";
        	});
            
            $('#btn_agree').click(function(){
            	if (!return_id) {
					$("#sign_id").focus();
					return_all = false;
					return;
				}
            	if (!return_pw) {
					$("#sign_pw1").focus();
					return_all = false;
					return;
				}
            	if (!return_name) {
					$("#sign_name").focus();
					return_all = false;
					return;
				}
            	if (!return_phone1) {
					$("#sign_phone_1").focus();
					return_all = false;
					return;
				}
            	if (!return_phone2) {
					$("#sign_phone_2").focus();
					return_all = false;
					return;
				}
            	if (!return_phone3) {
					$("#sign_phone_3").focus();
					return_all = false;
					return;
				}
            	if (!return_e_id) {
					$("#sign_email_id").focus();
					return_all = false;
					return;
				}
            	if (!return_addr) {
					$("#sample6_detailAddress").focus();
					return_all = false;
					return;
				}
            	return_all = true;
            	alert(return_all);
            	
            	var email_id = $("#sign_email_id").val();
            	var email_url = $("#sign_email_url").val();
            	var email = email_id + "@" + email_url;
            	$("#email").val(email);
            	
            	if (return_all) {
            		$("#frm_mem").submit();
				}
        	});
            
            $('#sign_id').blur(function() {
            	var id = $(this).val();
            	return_id = idCheck(id);
            	console.log("return_id = "+return_id);
            });
        
			$('#sign_pw1').blur(function() {
				var pw = $('#sign_pw1').val();
				var rpw = $('#sign_pw2').val();
				return_pw = pwCheck(pw, rpw);
				console.log("return_pw1 = "+return_pw);
            });
            
            $('#sign_pw2').blur(function() {
            	var pw = $('#sign_pw1').val();
				var rpw = $('#sign_pw2').val();
				return_pw = rpwCheck(pw, rpw);
				console.log("return_pw2 = "+return_pw);
            });
            
			$('#sign_name').blur(function() {
                var name = $.trim($(this).val());
                return_name = nameCheck(name);
                console.log("return_name = "+return_name);
            });
        
			$("#sign_phone_1").blur(function() {
                var phone = $.trim($(this).val());
                return_phone1 = phone1Check(phone);
                console.log("return_phone1 = "+return_phone1);
            });
			
			$("#sign_phone_2").blur(function() {
                var phone = $.trim($(this).val());
                return_phone2 = phone2Check(phone);
                console.log("return_phone2 = "+return_phone2);
            });
			
			$("#sign_phone_3").blur(function() {
                var phone = $.trim($(this).val());
                return_phone3 = phone2Check(phone);
                console.log("return_phone3 = "+return_phone3);
            });
			
			$('#sign_email_id').blur(function() {
                var email = $.trim($('#sign_email_id').val());
                var url = $.trim($('#sign_email_url').val());
                return_e_id = emailCheck(email, url);
                console.log("return_e_id = "+return_e_id);
            });
			
			$('#sign_email_url').blur(function() {
                var email = $.trim($('#sign_email_id').val());
                var url = $.trim($('#sign_email_url').val());
                return_url = urlCheck(email, url);
                console.log("return_url = "+return_url);
            });

            $('#sign_email_select').change(function() {
                var eUrl = $(this).val();

                if (eUrl == 'directVal') {
                    $('#sign_email_url').val('');
                    $('#sign_email_url').focus();
                    $('#sign_email_url').removeAttr('readonly');
                } else {
                    $('#sign_email_url').val(eUrl);
                    $('#sign_email_url').prop('readonly', true);
                    $('#sign_email_id').blur();
                }
            });

        	// 우편번호, 주소 클릭시 다음주소API 창 출력
            $('.addrbtn').click(function(){
            	var zipcode = $('.addrbtn').eq(0).val();
            	var addr = $('.addrbtn').eq(1).val();
            	// alert(zipcode + ', ' + addr);
            	
            	if(zipcode == '' || addr == '') {
            		$('#sample4_postcode2').click();
            	}
            });
        	
            
            $('#sample6_detailAddress').blur(function(){
            	var daddr = $(this).val();
            	var maddr = $("#sample6_address").val();
            	
            	if(daddr == "" || daddr.length == 0) {
            		$("#box_inner_address").css('color', 'tomato')
 					 					.css('display', 'block')
	 					 				.text("필수입력 정보입니다.");
            		return_addr = false;
            	} else {
                	if(maddr == "" || maddr.length == 0) {
                		$("#box_inner_address").css('color', 'tomato')
     					 					.css('display', 'block')
    	 					 				.text("필수입력 정보입니다.");
                		return_addr = false;
                	} else {
                		$("#box_inner_address").css('display', 'none');
                		return_addr = true;
                	}
            	}
            	console.log("return_addr = "+return_addr);
            	return return_addr;
            });
        });
        
    </script>
    <%@ include file="../include/footer.jsp" %>	
	<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
	<script>
	    function sample6_execDaumPostcode() {
	        new daum.Postcode({
	            oncomplete: function(data) {
	                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
	
	                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
	                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
	                var addr = ''; // 주소 변수
	                var extraAddr = ''; // 참고항목 변수
	
	                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
	                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
	                    addr = data.roadAddress;
	                } else { // 사용자가 지번 주소를 선택했을 경우(J)
	                    addr = data.jibunAddress;
	                }
	
	                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
	                if(data.userSelectedType === 'R'){
	                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
	                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
	                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
	                        extraAddr += data.bname;
	                    }
	                    // 건물명이 있고, 공동주택일 경우 추가한다.
	                    if(data.buildingName !== '' && data.apartment === 'Y'){
	                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
	                    }
	                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
	                    if(extraAddr !== ''){
	                        extraAddr = ' (' + extraAddr + ')';
	                    }
	                    // 조합된 참고항목을 해당 필드에 넣는다.
	                    document.getElementById("sample6_detailAddress").value = extraAddr;
	                
	                } else {
	                    document.getElementById("sample6_detailAddress").value = '';
	                }
	
	                // 우편번호와 주소 정보를 해당 필드에 넣는다.
	                document.getElementById('sample6_postcode').value = data.zonecode;
	                document.getElementById("sample6_address").value = addr;
	                // 커서를 상세주소 필드로 이동한다.
	                document.getElementById("sample6_detailAddress").focus();
	            }
	        }).open();
	    }
	</script>
</body>
</html>