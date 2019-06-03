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
        #update_title {
            font-family: 'Noto Sans KR', sans-serif;
            display: block;
            font-size: 32px;
            color: #444;
            letter-spacing: -1px;
        }
        .update {
            padding: 50px 0;
        }
        .update_index {
            font-family: 'Noto Sans KR', sans-serif;
            font-size: 18px;
            margin-bottom: 2px;
            letter-spacing: -1px;
            color: #E65D6E;
        }
        .index_btm {
        	margin-top: 30px;
        }
        .update > div > input {
            height: 45px;
            padding-left: 14px;
            border: 1px solid #ddd;
        }
        .update > div {
            position: relative;
        }
        .box_inner {
            position: absolute;
            top: 22px;
            right: 15px;
            font-size: 12px;
            color: #7BA518;
            display: block;
        }
        #box_inner_pw3 {
        	color: tomato;
        }
        .update_box {
            margin: 7px 0;
            width: 100%;
        }
        ::placeholder {
            font-size: 13px;
        }
        #update_pw2 {
        	margin-bottom: 80px;
        }
        #update_finish {
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
    </style>
</head>
<body>  
   	<form action="pwUpdatePlay.gaon" method="POST" name="frm_mem" id="frm_mem">
   		<!-- id값을 입력받지 않기 때문에 id값을 알기위해 session의 id값을 가져오는 방법 -->
   		<input type="hidden" name="id" value="${sessionScope.loginUser.id}">
        <div class="main_div">
            <div id="update_title">비밀번호 수정</div>
            <div class="update">
            	<div class="update_index">기존 비밀번호 입력</div>
            	<div>
                    <input type="password" class="update_box" id="update_pw3" placeholder="비밀번호" name="update_pw3">
                    <span class="box_inner pwAjax" id="pw_now">
                        	필수정보
                    </span>
                </div>
                <div class="update_index index_btm">새 비밀번호 입력</div>
				<div>
                    <input type="password" class="update_box" id="update_pw1" placeholder="새 비밀번호" name="update_pw1">
                    <span class="box_inner" id="box_inner_pw1">
                        5~16자의 영문/숫자를 조합하여 입력
                    </span>
                </div>
                <div>
                    <input type="password" class="update_box" id="update_pw2" placeholder="비밀번호 확인">
                    <span class="box_inner" id="box_inner_pw2">
                        5~16자의 영문/숫자를 조합하여 입력
                    </span>
                </div>
                <div id="update_finish">
                	<span class="btn_type"><button type="button" id="btn_default">뒤로가기</button></span>
                    <span class="btn_type"><button type="button" id="btn_agree">수정완료</button></span>
                </div>
            </div>
        </div>
    </form>
    <script type="text/javascript" src="js/validation.js"></script>
    <script type="text/javascript">
        
        $(document).ready(function() {
        	
        	var currentPw = false;
        	var newPwEq = false;
        	
        	
        	$("#btn_default").click(function(){
	        	location.href = "index.gaon";
	        });
            
            
            $('#update_pw3').blur(function() {
				var nowPw = $('#update_pw3').val();
				var nowId = "${sessionScope.loginUser.id}";
                
				if (nowPw != null || nowPw.length != 0) {
					currentPw = ajaxPwCheck(nowId, nowPw);
                }
                return false; // 누락 방지
            });
            
            
            
            
            
            
			$('#update_pw1').blur(function() {
            	
				var memPw = $.trim($('#update_pw1').val());
				var memRpw = $.trim($('#update_pw2').val());
                
                var checkResult = joinValidate.checkPw(memPw, memRpw);
                
                if(checkResult.code != 0) {
                	$('.box_inner').eq(1).text(checkResult.desc)
                						.css('color', 'tomato')
										.css('display', 'block');
                	return false;
                } else {
                	$('.box_inner').eq(1).css('display', 'none');
        			
                    if (memRpw != null || memRpw.length != 0) {
        				if (memPw == memRpw) { // pw, rpw가 같은지 확인
        					newPwEq = true;
        					$('.box_inner').eq(2).css('display', 'none');
        				} else {
        					newPwEq = false;
        					$('.box_inner').eq(2).css('color', 'tomato')
         					 					 .css('display', 'block')
         					 					 .text('입력하신 비밀번호가 일치하지 않습니다.');
        					return false;
        				}
        			}
                	return true;
                }
                return false; // 누락 방지
            });
            
            $('#update_pw2').blur(function() {
            	var memPw = $.trim($('#update_pw1').val());
				var memRpw = $.trim($('#update_pw2').val());
                
                var checkResult = joinValidate.checkRpw(memPw, memRpw);
                
                if(checkResult.code != 0) {
                	$('.box_inner').eq(2).text(checkResult.desc)
                						.css('color', 'tomato')
										.css('display', 'block');
                	return false;
                } else {
                	$('.box_inner').eq(2).css('display', 'none');
        			
                    if (memPw != null || memPw.length != 0) {
        				if (memPw == memRpw) { // pw, rpw가 같은지 확인
        					newPwEq = true;
        					$('.box_inner').eq(2).css('display', 'none');
        				} else {
        					newPwEq = false;
        					$('.box_inner').eq(2).css('color', 'tomato')
         					 					 .css('display', 'block')
         					 					 .text('입력하신 비밀번호가 일치하지 않습니다.');
        					return false;
        				}
        			}
                	return true;
                }
                return false; // 누락 방지
            });
            
            
            
            
            $("#btn_agree").click(function(){
            	
            	var postPw = $("#update_pw3").val();
            	var newPw = $("#update_pw1").val();
            	
            	if (!currentPw) {
            		// 1. 현재 비밀번호가 맞는지 확인
            		$('#update_pw3').focus();
					return false;
				} else if (!newPwEq) {
	            	// 2. 새 비밀번호와 새 비밀번호 확인 유효성 체크
	            	$('#update_pw1').focus();
					return false;
				} else if (postPw == newPw) {
					// 3. 현재 비밀번호와 새 비밀번호가 같은지 체크
					$('#update_pw1').focus();
					$('.box_inner').eq(1).text("현재 비밀번호와 다르게 입력해주세요.")
									.css('color', 'tomato')
									.css('display', 'block');
					return false;
				}
            	$("#frm_mem").submit();
            });
            
            
        });
    </script>
    <%@ include file="../include/footer.jsp" %>	
</body>
</html>