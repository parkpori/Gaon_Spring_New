<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="common.jsp" %>
<%-- <%
	// referer로 새 페이지 띄우는 법(비효율적)
	String referer = request.getHeader("referer");
%> --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- ${path}: el태그 -->
<link rel="stylesheet" href="${path}/resources/css/common.css?v=1">
<link rel="stylesheet" href="${path}/resources/css/header.css?v=1">
<title>Insert title here</title>
</head>
<body>
	
	<div id="modal_all">
        <div id="modal_login">
            <a id="modal_all_close">
                <i class="fas fa-times-circle"></i>
            </a>
            <img src="${path}/resources/img/logo.png" alt="로고이미지">
            <div>
                <input type="text" id="login_id" placeholder="이메일 입력">
                <input type="password" id="login_pw" placeholder="패스워드 입력">
            </div>
            <div class="cklogin">
                <input type="checkbox" id="cklogin_input">
                <label for="cklogin_input" id="cklogin_label">
                    <span>로그인 유지</span></label>
            </div>
            <span class="login_box_inner" id="login_box_inner_id">
	                    필수입력 정보입니다.
	        </span>
            <button type="button" id="login_button">로그인</button>
            <div class="login_footer">
                <a><span>아이디 찾기</span></a>
                <a><span>비밀번호 찾기</span></a>
                <a href="${path}/member/constract" id="modal_member"><span>회원가입</span></a>
            </div>
            <div class="login_final">
                    <div>
                        <span>COPYRIGHT</span>
                        <span>ⓒ</span>
                        <span id="gaon">GAON</span>
                        <span>ALL RIGHTS RESERVED.</span><br>
                        <span>HOSTING By CAFE24</span>
                        <span>l</span>
                        <span>DESIGN By PORI</span>
                    </div>
                </div>
        </div>
    </div>
    <header>
        <div class="header_menu">
            <div class="inner_header inner_header_menu">
                <div class="header_sns">
                    <a><i class="fab fa-instagram"></i></a>
                    <a><i class="fab fa-facebook"></i></a>
                    <a><i class="fab fa-twitter"></i></a>
                    <a><i class="fab fa-google"></i></a>
                </div>
                <div class="header_member">
                    <ul><!-- empty: 비어있으면 when을 타고 아니면 otherwise를 타라 -->
                    	<!-- when: if / otherwise: else -->
	                    <c:choose>
		                    <c:when test="${empty sessionScope.name}">
		                        <li><a class="loginmenu" id="login_open">로그인</a>
		                        </li>
		                        <li><a href="${path}/member/constract" class="loginmenu" id="join_open">회원가입</a>
		                        </li>
		                        <!-- <span class="header_arrow"></span>
                    			<span class="header_point">+2,000 P</span> -->
	                        </c:when>
	                        <c:otherwise>
		                        <li id="loginInfo">
		                        	<span id="login_name"><span>${sessionScope.name}</span>
		                        	(${sessionScope.userid})
		                        	</span>
		                        	<!-- <span class="login_bar"></span> -->
		                        </li>
		                        <li><!-- Ajax를 쓰지 않고 reperer로만 로그아웃 하는 방법(페이지이동) : modal창을 쓰지 않을 때 -->
		                        	<%-- <a href="${path}/loginOut.gaon" class="loginmenu">로그아웃</a> --%>
		                        	<!-- Ajax로 로그아웃 방법 : modal창을 사용할 때 -->
		                        	<a class="loginmenu logout_btn">로그아웃</a>
		                        	<!-- <span class="login_bar"></span> -->
		                        </li>
	                        </c:otherwise>
                        </c:choose>
                        
                        <li id="loginmenu_droplist">
	                        <a class="loginmenu" id="mypage">마이페이지
	                        	<i class="fas fa-angle-down" id="mypage_i"></i>
	                        </a>
	                        <div id="loginmenu_drop">
	                            <a class="loginmenu_list">주문조회</a>
	                            <a class="loginmenu_list">장바구니</a>
	                            <a class="loginmenu_list">위시리스트</a>
	                            <c:choose>
		                            <c:when test="${!empty sessionScope.name}">
		                            	<a href="${path}/member/update" class="loginmenu_list">내 정보 수정</a>
			                            <a href="${path}/member/pwupdate" class="loginmenu_list">비밀번호 수정</a>
			                            <a href="${path}/member/delete" class="loginmenu_list">회원 탈퇴</a>
		                            </c:when>
		                    	</c:choose>
		                    	<a class="loginmenu_list">고객센터</a>
	                        </div>
                    </ul>
                </div>
            </div>
        </div>
        <div class="header_logo">
	        <div class="header_img">
	        
	        </div>
	        <a href="${path}/">
	            <span class="header_title_logo">
	                <img src="${path}/resources/img/logo.png" alt="로고이미지">
	            </span>
            </a>
            <div class="header_div">
	            <div class="header_text">
	                <a><span>베스트</span></a>
	                <a><span>신상품</span></a>
	                <a><span>세일</span></a>
	                <a><span id="header_event">이벤트</span></a>
	            </div>
	            <div class="header_search">
	                <input type="text" id="header_search_text">
	                <span><i class="fas fa-search" id="search_icon"></i></span>
	            </div>
            </div>
        </div>
        <div class="header_nav">
            <div class="inner_header">
                <ul>
                    <li class="dropdownlist">
                        <a>아우터</a>
                    </li>
                    <li class="dropdownlist">
                        <a>원피스</a>
                        <div class="droplist">
                            <a class="list">롱원피스</a>
                            <a class="list">숏원피스</a>
                        </div>
                    </li>
                    <li class="dropdownlist">
                        <a>저고리</a>
                        <div class="droplist">
                            <a class="list">긴팔</a>
                            <a class="list">반팔</a>
                        </div>
                    </li>
                    <li class="dropdownlist">
                        <a>스커트</a>
                        <div class="droplist">
                            <a class="list">롱스커트</a>
                            <a class="list">숏스커트</a>
                        </div>
                    </li>
                    <li class="dropdownlist">
                        <a>신발</a>
                        <div class="droplist">
                            <a class="list">구두</a>
                            <a class="list">단화</a>
                        </div>
                    </li>
                    <li class="dropdownlist">
                        <a>액세서리</a>
                        <div class="droplist">
                            <a class="list">머리장식</a>
                            <a class="list">팔찌, 반지</a>
                            <a class="list">노리개</a>
                        </div>
                    </li>
                    <li class="dropdownlist">
                        <a>가방</a>
                    </li>
                    <li class="dropdownlist">
                        <a>세트</a>
                    </li>
                    <li class="dropdownlist">
                        <a href="${path}/board/list">질문 게시판</a>
                    </li>
                </ul>
            </div>
        </div>
    </header>
    <script type="text/javascript">
        $(function() {

            $('#login_open').click(function() {
                $('#modal_all').css('display', 'flex');
                $("#login_id").focus();
            });
            $('#modal_all_close').click(function() {
                $('#modal_all').css('display', 'none');
            });
            
            
            
            // 로그인 버튼 클릭
            $("#login_button").on("click", function(){
            	var id=$.trim($("#login_id").val());
            	var pw=$.trim($("#login_pw").val());
            	
            	//alert(id + ", " + pw);
            	var regEmpty = /\s/g; // 공백문자
            	
            	// 1. null값 체크
            	// 2. 공백체크
            	if (id==null || id.length==0) {
					$(".login_box_inner").css("display", "block")
					 				.text("필수입력 정보입니다.");
					$("#login_id").focus();
					return false;
				} else if (id.match(regEmpty)) {
					$(".login_box_inner").css("display", "block")
	 								.text("공백없이 입력해주세요.");
					$("#login_id").focus();
					return false;
				}
            	
            	if (pw==null || pw.length==0) {
					$(".login_box_inner").css("display", "block")
					 				.text("필수입력 정보입니다.");
					$("#login_pw").focus();
					return false;
				} else if (pw.match(regEmpty)) {
					$(".login_box_inner").css("display", "block")
	 								.text("공백없이 입력해주세요.");
					$("#login_pw").focus();
					return false;
				}
				
            	
            	
            	$.ajax({
            		url: "${path}/member/login",
            		type: "POST",
            		dataType: "text", /* return의 데이터타입 */
            		data: "id="+id+"&pw="+pw,
            		success: function(data){
            			if (data == "1") {
							location.reload();
						} else if (data = "-1") {
							$('#login_id').focus();
							$('.login_box_inner').text("아이디 또는 비밀번호가 일치하지 않습니다.")
											.css("display", "block");
						}
            		},
            		error:function(){
            			alert("System Error(♨_♨)");
            		}
            	});
            });
            
            
            
            

            
           /*  var flag1 = 0;
			var flag2 = 0;

			$(".header_search").click(function(event) {
				if (flag1 == 0) {
				$(".header_search").css('width', '261px');
				$("#header_search_text").css('border', '1px solid #E65D6E');
				$("#search_icon").css('color', '#E65D6E');
				$("#header_search_text").focus();
				flag1 = 1;
				} else {
					$(".header_search").css('width', '58px')
										.val("");
					$("#header_search_text").css('border', '1px solid #ddd');
					$("#search_icon").css('color', '#444');
				flag1 = 0;
				}
			}); */
			
			
			
			
			
			$(window).scroll(function(event) {
                var scrollValue = $(this).scrollTop();
                if (scrollValue >= 300) {
                	$('.header_nav').css("position", "fixed")
									.css("top", "33px");
                    $('.header_arrow').css("display", "none");
                    $('.header_point').css("display", "none");
                } else if (scrollValue < 300) {
                	$('.header_nav').css("position", "relative")
									.css("top", "0px");
                    $('.header_arrow').css("display", "inline-block");
                    $('.header_point').css("display", "inline-block");
                }
            });
			
        });
        
        
        
        
        
        
        
		$(document).on("click", ".logout_btn", function(){
			
        	$.ajax({
        		url: "${path}/member/logout",
        		type: "POST",
        		success: function(){
        			location.reload();
        		},
        		error:function(){
        			alert("System Error(♨_♨)");
        		}
        	});
        });
    </script>
</body>
</html>