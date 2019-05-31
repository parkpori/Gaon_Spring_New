<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="${path}/css/common.css?v=1">
<title>Insert title here</title>
	<style type="text/css">

		.constract_div {
			width: 800px;
            margin: 10px auto 0;
            padding: 80px 50px 20px;
            box-sizing: border-box;
            color: #444;
		}
		#constract_title {
			font-family: 'Noto Sans KR', sans-serif;
            display: block;
            font-size: 40px;
            color: #444;
            letter-spacing: -1px;
		}
		.constract_box {
			padding: 40px 0;
		}
		.inner_box {
			padding: 35px 0 16px;
			font-family: 'Noto Sans KR', sans-serif;
			font-size: 15px;
			position: relative;
			line-height: 25px;
		}
		#inner_box1 {
			padding-top: 30px;
		}
		#inner_box_all {
			font-size: 16px;
			padding-bottom: 15px;
			border-bottom: 1px solid #ddd;
		}
		.span_only {
			color: #E65D6E;
			font-size: 12px;
		}
		.span_select {
			color: #aaa;
			font-size: 12px;
		}
		.constract_ck {
			position: absolute;
			display: none;
		}
		.inner_box > label {
			display: block;
			background: url('img/check_off.gif') 100% 50% no-repeat;
		}
		#constract_ck1:checked +label {
			background: url('img/check_on.gif') 100% 50% no-repeat;
			color: #E65D6E;
			font-weight: bolder;
		}
		#constract_ck2:checked +label {
			background: url('img/check_on.gif') 100% 50% no-repeat;
		}
		#constract_ck3:checked +label {
			background: url('img/check_on.gif') 100% 50% no-repeat;
		}
		#constract_ck4:checked +label {
			background: url('img/check_on.gif') 100% 50% no-repeat;
		}
		#constract_ck5:checked +label {
			background: url('img/check_on.gif') 100% 50% no-repeat;
		}
		.terms_box {
			position: relative;
			box-sizing: border-box;
			height: 120px;
			padding: 14px 15px;
			border: 1px solid #f0f0f0;
			background-color: #f7f7f7;
			overflow: auto;
		}
		.article_title {
			margin: 0 0 4px;
			font-size: 12px;
			font-weight: 700;
			line-height: 16px;
			color: #666;
		}
		.article > p {
			font-size: 12px;
			line-height: 16px;
			color: #666;
			margin: 0;
		}
		.constract_btn {
			height: 60px;
			display: flex;
			justify-content: center;
			align-items: center;
			margin: 50px 0;
		}
		.constract_btn > a > span {
			text-align: center;
			line-height: 60px;
			font-family: 'Noto Serif KR', serif;
            font-size: 17px;
            color: white;
            width: 200px;
		}
		#btn_default {
			display: block;
			border: 1px solid #ddd;
			border-radius: 2px;
			margin-right: 20px;
			color: #999;
			transition: .3s;
			outline: none;
		}
		#btn_agree {
			display: block;
			background: #FE9E95;
			border: 1px solid #FE9E95;
			border-radius: 2px;
			color: white;
			transition: .3s;
			outline: none;
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
	<div class="constract_div">
		<div id="constract_title">이용약관</div>
		<div class="constract_box">
			<div class="inner_box" id="inner_box_all">
				<input type="checkbox" class="constract_ck" id="constract_ck1">
				<label for="constract_ck1">
						이용약관, 개인정보 수집 및 이용, 위치정보 이용약관(선택),<br>
						프로모션 안내메일 수신(선택)에 모두 동의합니다.
				</label>
			</div>
			<div class="inner_box" id="inner_box1">
				<input type="checkbox" class="constract_ck" id="constract_ck2">
				<label for="constract_ck2">
						<span>이용약관 동의</span>
						<span class="span_only">(필수)</span>
				</label>
			</div>
			<div class="terms_box">
				<div class="article">
					<h3 class="article_title">제 1 조 (목적)</h3>
					<p>이 약관은 가온 주식회사 ("회사" 또는 "가온")가 제공하는 가온
					 및 가온 관련 제반 서비스의 이용과 관련하여 회사와 회원과의 권리,
					 의무 및 책임사항, 기타 필요한 사항을 규정함을 목적으로 합니다.
					</p><br>

					 <h3 class="article_title">제 2조 (정의)</h3>
					 <p>이 약관에서 사용하는 용어의 정의는 다음과 같습니다.<br>
					 	①"서비스"라 함은 구현되는 단말기(PC, TV, 휴대형단말기 등의 각종 유 무선 장치를 포함)와 상관없이 "회원"이 이용할 수 있는 가온 및 가온 관련 제반 서비스를 의미합니다.
					 </p>
				</div>
			</div>
			<div class="inner_box">
				<input type="checkbox" class="constract_ck" id="constract_ck3">
				<label for="constract_ck3">
						<span>개인정보 수집 및 이용에 대한 안내</span>
						<span class="span_only">(필수)</span>
				</label>
			</div>
			<div class="terms_box">
				<div class="article">
					<p>
						정보통신망법 규정에 따라 가온에 회원가입 신청하시는 분께 수집하는 개인정보의 항목, 개인정보의 수집 및 이용목적, 개인정보의 보유 및 이용기간을 안내 드리오니 자세히 읽은 후 동의하여 주시기 바랍니다.
					</p><br>

					 <h3 class="article_title">1. 수집하는 개인정보</h3>
					 <p>이용자는 회원가입을 하지 않아도 정보 검색, 뉴스 보기 등 대부분의 가온 서비스를 회원과 동일하게 이용할 수 있습니다. 이용자가 메일, 캘린더, 카페, 블로그 등과 같이 개인화 혹은 회원제 서비스를 이용하기 위해 회원가입을 할 경우, 가온은 서비스 이용을 위해 필요한 최소한의 개인정보를 수집합니다.
					 </p>
				</div>
			</div>
			<div class="inner_box">
				<input type="checkbox" class="constract_ck" id="constract_ck4">
				<label for="constract_ck4">
						<span>위치정보 이용약관 동의</span>
						<span class="span_select">(선택)</span>
				</label>
			</div>
			<div class="terms_box">
				<div class="article">
					<p>위치정보 이용약관에 동의하시면,
						<strong>위치를 활용한 광고 정보 수신</strong> 등을 포함하는 가온 위치기반 서비스를 이용할 수 있습니다.
					</p><br>

					 <h3 class="article_title">제 1 조 (목적)</h3>
					 <p>이 약관은 가온 주식회사 (이하 “회사”)가 제공하는 위치정보사업 또는 위치기반서비스사업과 관련하여 회사와 개인위치정보주체와의 권리, 의무 및 책임사항, 기타 필요한 사항을 규정함을 목적으로 합니다.
					 </p>
				</div>
			</div>
			<div class="inner_box">
				<input type="checkbox" class="constract_ck" id="constract_ck5">
				<label for="constract_ck5">
						<span>이벤트 등 프로모션 알림 메일 수신</span>
						<span class="span_select">(선택)</span>
				</label>
			</div>
			<div class="constract_btn">
				<a href="${path}/index.gaon">
					<span id="btn_default">비동의</span>
				</a>
				<a>
					<span id="btn_agree">동의</span>
				</a>
			</div>
		</div>
	</div>
	<%@ include file="../include/footer.jsp" %>
	
	<script type="text/javascript">
		$(document).ready(function(){
			
			$("#btn_default").click(function(){
	        	location.href = "index.gaon";
	        });
			
			$("#constract_ck1").click(function(){
				var ckAll = $("#constract_ck1").is(":checked");
				
				if(ckAll == true) {
				$(".constract_ck").prop("checked", true);
				} else {
					$(".constract_ck").prop("checked", false);
				}
			});
			
			$("#btn_agree").click(function(){
				var filsu1 = $("#constract_ck2").is(":checked");
				var filsu2 = $("#constract_ck3").is(":checked");
				
				if(filsu1 == true && filsu2 == true){
					location.href = "member.gaon";
				} else {
					return false;
				}
			});
		});
	</script>
</body>
</html>