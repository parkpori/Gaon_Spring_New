<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="resources/css/common.css?v=1">
<title>Insert title here</title>
	<style type="text/css">
		.main_div {
            width: 800px;
            margin: 10px auto 0;
            padding: 80px 50px 20px;
            color: #444;
        }
        #drop_title {
            font-family: 'Noto Sans KR', sans-serif;
            display: block;
            font-size: 32px;
            color: #444;
            letter-spacing: -1px;
        }
        .drop {
            padding: 50px 0;
        }
        .drop_index {
            font-family: 'Noto Sans KR', sans-serif;
            font-size: 18px;
            margin-bottom: 2px;
            letter-spacing: -1px;
            color: #E65D6E;
        }
        .drop_box {
        	margin-bottom: 55px;
        }
        .drop_box_text1 {
        	text-align: center;
        	font-size: 23px;
        	font-family: 'Noto Sans KR', sans-serif;
        	margin-bottom: 20px;
        }
        .drop_box_text1 > span {
        	color: mediumseagreen;
        }
        .drop_box_text2 {
        	border-top: 1px solid #ddd;
        	border-bottom: 1px solid #ddd;
        	padding: 30px 70px;
        }
        .box_text {
        	position: relative;
        	margin-bottom: 18px;
        }
        .box_num {
        	display: inline-block;
        	color: #E65D6E;
        	font-family: 'Noto Sans KR', sans-serif;
        	position: absolute;
        	left: 8px;
        }
        .box_text > span:nth-child(2) {
        	display: inline-block;
        	margin-left: 25px;
        }
        .box_text:nth-child(3) {
        	margin-bottom: 0px;
        }
        .box_point {
        	color: #E65D6E;
        	font-weight: bold;
        }
        
        
        
        
        
        
        
        
        .drop > div > input {
            height: 45px;
            padding-left: 14px;
            border: 1px solid #ddd;
        }
        .drop > div {
            position: relative;
        }
        .box_inner {
            position: absolute;
            top: 25px;
            right: 15px;
            font-size: 12px;
            color: #7BA518;
        }
        .drop_input {
            margin: 10px 0 80px 0;
            width: 100%;
        }
        ::placeholder {
            font-size: 13px;
        }
        #drop_pw2 {
        	margin-bottom: 80px;
        }
        #drop_finish {
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
        	height: 60px;
            width: 200px;
        	color: white;
        	border: 0;
            border-radius: 2px;
            font-size: 17px;
            transition: .3s;
            margin-bottom: 25px;
            outline: none;
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
        
        
        
        
        
        
        
        #drop_modal {
        	position: fixed;
		    z-index: 100;
		    top: 0;
		    left: 0;
		    width: 100%;
		    height: 100%;
		    overflow: auto; /* 넘어가면 스크롤 */
		    background-color: rgba(0,0,0,0.4);
		    display: none;
		    align-items: center;
		    justify-content: center;
        }
        #modal_box {
        	display: flex;
		    align-items: center;
		    justify-content: center;
        	position: relative;
		    background-color: white;
		    z-index: 2;
		    width: 290px;
		    height: 170px;
		    border-radius: 2px;
		    box-shadow: 0 4px 10px 0 rgba(0,0,0,0.1),
		                0 4px 20px 0 rgba(0,0,0,0.12);
		    font-family: 'Noto Serif KR', serif;
        }
        #modal_text {
        	font-size: 16px;
        	text-align: center;
        	margin-top: 5px;
        }
        #modal_btn {
        	margin-top: 22px;
        	display: flex;
		    justify-content: center;
        }
        #modal_btn > button {
        	width: 90px;
        	height: 40px;
        	border: 0px;
        	border-radius: 2px;
        	font-size: 14px;
        	color: white;
            transition: .3s;
        }
        #modal_btn > button:nth-child(1) {
        	margin-right: 10px;
        	background: #cacaca;
        }
        #modal_btn > button:nth-child(1):hover {
        	background: #999;
        }
        #modal_btn > button:nth-child(2) {
        	background: #FE9E95;
        }
        #modal_btn > button:nth-child(2):hover {
        	background: #E65D6E;
        }
        #modal_close {
		    position: absolute;
		    z-index: 5;
		    display: inline-block;
		    left: 256px;
		    top: 10px;
		    color: #ddd;
		    font-size: 25px;
		    transition: .3s;
		}
		#modal_close:hover {
		    color: #E65D6E;
		}
    </style>
</head>
<body> 
   	<div id="drop_modal">
        <div id="modal_box">
	        <a id="modal_close" class="modal_close">
               	<i class="fas fa-times-circle"></i>
           	</a>
            <div id="modal_text">
                	정말 탈퇴하시겠습니까?
                <div id="modal_btn">
		            <button type="button" class="modal_close" id="madal_default">취소</button>
		            <button type="button" id="modal_agree">회원 탈퇴</button>
            	</div>
            </div>
        </div>
    </div>
	<div class="main_div">
        <div id="drop_title">회원탈퇴</div>
        <div class="drop">
         <div class="drop_box">
         	<div class="drop_box_text1">
         		<span>"${sessionScope.loginUser.name}"</span>님의 회원탈퇴 시 아래의 조치가 취해집니다.
         	</div>
         	<div class="drop_box_text2">
         		<div class="box_text">
          		<span class="box_num">1.</span>
          		<span>계정정보는 
          		<span class="box_point">'개인 정보 보호 정책'에 따라 60일간 보관(잠김)</span>
          		되며, 60일이 경과된 후에는<br>
          		모든 개인정보는 완전히 삭제되며 더 이상 복구할 수 없게 됩니다.
          		</span>
         		</div>
         		<div class="box_text">
          		<span class="box_num">2.</span>
          		<span>작성된 게시물은 삭제되지 않으며, 익명처리 후 
          		<span class="box_point">GAON으로 소유권이 귀속</span>
          		됩니다.
          		</span>
         		</div>
         		<div class="box_text">
          		<span class="box_num">3.</span>
          		<span>게시물 삭제가 필요한 경우에는 
          		<span class="box_point">관리자(seonmi0325@gmail.com)</span>
          		로 문의해 주시기<br>
          		바랍니다.
          		</span>
         		</div>
         	</div>
         </div>
        	<div class="drop_index">비밀번호 입력</div>
			<div>
                <input type="password" class="drop_input" id="drop_pw1" placeholder="비밀번호" name="drop_pw1">
                <span class="box_inner pwAjax" id="box_inner_pw1">
                    	필수정보
                </span>
            </div>
            <div id="drop_finish">
            	<span class="btn_type"><button type="button" id="btn_default">뒤로가기</button></span>
                <span class="btn_type"><button type="button" id="btn_agree">탈퇴하겠습니다</button></span>
            </div>
        </div>
	</div>
    <%@ include file="../include/footer.jsp" %>
    <script type="text/javascript" src="js/validation.js"></script>
    <script type="text/javascript">
    
	    $(function() {
			
	    	$("#btn_default").click(function(){
	        	location.href = "index.gaon";
	        });
	        
	        var state = false;
	        
	        $("#drop_pw1").blur(function(){
	        	var nowId = "${sessionScope.loginUser.id}";
	        	var nowPw = $(this).val();
	        	
	        	state = ajaxPwCheck(nowId, nowPw);
	        });
	        $("#btn_agree").click(function(){
	        	if (state) {
	        		$('#drop_modal').css('display', 'flex');
				} else {
					$('#drop_modal').css('display', 'none');
					
				} $("#drop_pw1").focus();
	        });
	        
	        $(".modal_close").click(function(){
	        	$('#drop_modal').css('display', 'none');
	        });
	        
	        
	        
	        
	        $("#modal_agree").click(function(){
	        	
	        	// 1. input태그에서 id값 불러오는 것과 같음
	        	/* var id = "${sessionScope.loginUser.id}";
	        	location.href="dropMember.gaon?id=" + id; */
	        	
	        	// 2. 새로운 방법(id값 찾아오는 법)
	        	location.href="dropMemberPlay.gaon";
	        });
	    });
    </script>
</body>
</html>