<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>
<% String referer = request.getHeader("referer"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="${path}/resources/css/common.css?v=1">
<title>Insert title here</title>
<script type="text/javascript" src="${path}/resources/smarteditor/js/service/HuskyEZCreator.js" charset="utf-8"></script>
<style type="text/css">
	.board_div {
		width: 1000px;
        margin: 10px auto 0;
        padding: 80px 50px 20px;
	}
	#all_title {
		font-family: 'Noto Sans KR', sans-serif;
        display: block;
        font-size: 32px;
        color: #444;
        letter-spacing: -1px;
	}
	.board_all {
	    padding: 50px 0;
	}
	input, textarea {
		outline: none;
	}
	.board_div1 {
		display: flex;
		border-top: 1px solid #aaa;
		border-bottom: 1px solid #ddd;
		align-items: center;
		height: 38px;
		width: 100%;
	}
	.board_div1 > div, .board_div2 > div {
		flex: 1;
	}
	.board_div2, .board_div3, .board_div4 {
		display: flex;
		border-bottom: 1px solid #ddd;
		align-items: center;
		height: 38px;
	}
	.board_span1 {
		display: inline-block;
		font-family: 'Noto Sans KR', sans-serif;
		width: 125px;
		height: 37px;
		background: #ededed;
		text-align: center;
		padding: 7px;
	}
	.board_span2 {
		padding-left: 12px;
	}
	.board_border {
		border-bottom: 1px solid #ddd;
	}
	.board_div4_title {
		color: #7BA518;
	}
	.board_text > div {
		padding: 35px 25px;
		border-bottom: 1px solid #aaa;
		min-height: 200px;
	}
	
	
	
	
	
	
	/* 버튼 */
	.board_btn {
		margin: 20px 0 50px;
	}
	.board_btn a {
		display: inline-block;
		width: 90px;
		height: 35px;
		text-align: center;
		line-height: 32px;
		font-family: 'Noto Sans KR', sans-serif;
		margin: 1px;
		transition: .3s;
	}
	.black_btn {
		background: #333;
		border: 1px solid #333;
		color: white;
	}
	.white_btn {
		border: 1px solid #aaa;
		color: #aaa;
	}
	#btn_good {
		cursor: pointer;
	}
/* 	#btn_modify {
		 margin-left:325px;
	} */
	.black_btn:hover {
		background: #E65D6E;
		border: 1px solid #E65D6E;
		color: white;
	}
	.white_btn:hover {
		border: 1px solid #444;
		color: #444;
	}
	
	
	
	
	/* 댓글 없을 때 */
	.comment_emp {
		margin-bottom: 50px;
		box-shadow: 1px 1px 8px rgba(0,0,0,.23);
		border-radius: 15px;
		padding: 30px;
		margin: 10px 10px;
		display: flex;
		text-align: center;
		justify-content: center;
		color: #999;
	}
	
	
	
	
	/* 댓글 창 */
	
	.comment_all {
		margin-bottom: 40px;
	}
	.comment_box {
		box-shadow: 1px 1px 8px rgba(0,0,0,.23);
		border-radius: 15px;
		padding: 15px 15px 16px;
		margin: 13px 10px;
	}
	.comment_title {
		font-family: 'Noto Sans KR', sans-serif;
		border-bottom: 1px solid #ddd;
		height: 30px;
		line-height: 20px;
		margin-bottom: 10px;
	}
	.comment_name {
		display: inline-block;
		width: 400px;
		color: #7BA518;
	}
	.comment_right {
		float: right;
	}
	.comment_day {
		display: inline-block;
		width: 140px;
		text-align: center;
		color: #888;
		font-size: 13px;
	}
	.comment_content p {
		margin: 0;
	}
	.comment_delete {
		display: inline-block;
		width: 50px;
		text-align: center;
		background: #aaa;
		color: white;
		font-size: 12px;
		border-radius: 2px;
		transition: .3s;
		cursor: pointer;
	}
	.comment_delete:hover {
		background: #444;
		color: white;
	}
	
	
	
	
	
	
	/* 댓글 남기기 */
	
	.comment_input {
		border-top: 1px solid #aaa;
		border-bottom: 1px solid #aaa;
	}
	.comment_input_title {
		display: flex;
		align-items: center;
		height: 37px;
		font-family: 'Noto Sans KR', sans-serif;
		border-bottom: 1px solid #ddd;
	}
	.comment_input_title > span:first-child {
		display: inline-block;
		width: 125px;
		background: #ededed;
		height: 37px;
		text-align: center;
		line-height: 36px;
	}
	.comment_input_name {
		display: inline-block;
		padding-left: 15px;
		color: #7BA518;
	}
	.comment_input_text {
		margin: 0;
	}
	.comment_input_text > textarea {
		width: 898px;
		box-sizing: border-box;
		height: 60px;
		padding: 6px;
		background: #fafafa;
	}
	.comment_input_btn {
		float: right;
		margin-top: 10px;
	}
	.comment_btn {
		display: inline-block;
		width: 90px;
		height: 35px;
		text-align: center;
		line-height: 32px;
		font-family: 'Noto Sans KR', sans-serif;
		margin: 1px;
		background: #333;
		border: 1px solid #333;
		color: white;
		transition: .3s;
		cursor: pointer;
	}
	.comment_btn:hover {
		background: #E65D6E;
		border: 1px solid #E65D6E;
		color: white;
	}
	.comment_total {
		font-family: 'Noto Sans KR', sans-serif;
		font-size: 15px;
		margin-left: 20px;
	}
	.comment_total > span {
		color: dodgerblue;
	}
	.comment_login {
		border-top: 1px solid #aaa;
		border-bottom: 1px solid #aaa;
		text-align: center;
		color: #999;
		padding: 15px 0px;
	}
	#float_right {
		float: right;
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
		#filesize {
			font-size: 12px;
			color: #999;
		}
		#no_file {
			color: #bbb;
			border: 0px;
		}
</style>

<!-- <script type="text/javascript">
	// 뒤로가기 막기
	history.pushState(null, null, location.href);
	window.onpopstate = function(){
		history.go(1);
	};
</script> -->
<script type="text/javascript">
	history.pushState(null, document.title, location.href);
	window.addEventListener("popstate", function(event){
		history.pushState(null, document.title, "<%=referer%>");
		location.reload(); // 리프레쉬
	});
</script>
</head>
<body>
	<form>
		<div id="drop_modal">
	        <div id="modal_box">
		        <a id="modal_close" class="modal_close">
	               	<i class="fas fa-times-circle"></i>
	           	</a>
	            <div id="modal_text">
	                	정말 삭제하시겠습니까?
	                <div id="modal_btn">
			            <button type="button" class="modal_close" id="madal_default">취소</button>
			            <button type="button" id="modal_agree">삭제</button>
	            	</div>
	            </div>
	        </div>
    	</div>
 		<div class="board_div">
	        <div id="all_title">질문 게시판</div>
	        <div class="board_all">
				<div class="board_div1">
					<div>
						<span class="board_span1 board_border">작성자</span>
						<span class="board_span2">${one.writer}</span>
					</div>
					<div>
						<span class="board_span1 board_border">작성일</span>
						
						<span class="board_span2">
							<fmt:formatDate value="${now}" pattern="yyyy-MM-dd" var="today"/>
	        				<fmt:formatDate value="${one.regdate}" pattern="yyyy-MM-dd" var="regdate"/>
							<c:choose>
			        			<c:when test="${today == regdate}">
			        				<fmt:formatDate pattern="hh:mm:ss" value="${one.regdate}"/>
			        			</c:when>
			        			<c:otherwise>
			        				<fmt:formatDate pattern="yyyy-MM-dd" value="${one.regdate}"/>
			        			</c:otherwise>
		        			</c:choose>
						</span>
					</div>
				</div>
				<div class="board_div2">
					<div>
						<span class="board_span1">조회수</span>
						<span class="board_span2">${one.viewcnt}</span>
					</div>
					<div>
						<span class="board_span1">좋아요</span>
						<span class="board_span2" id="goodcnt">
							<c:choose>
								<c:when test="${empty one.goodcnt}">
									0
								</c:when>
								<c:otherwise>
								${one.goodcnt}
								</c:otherwise>
							</c:choose>
						</span>
					</div>
				</div>
				<div class="board_div3">
					<span class="board_span1">첨부파일</span>
					<span class="board_span2">
						<c:choose>
		        			<c:when test="${one.filesize == 0}">
		        				<span id="no_file">파일없음</span>
		        			</c:when>
		        			<c:otherwise>
		        				<a href="download.gaon?file=${one.filename}">
		        					${one.filename}
		        				</a>
		        				<span id="filesize">
			        				<c:choose>
			        					<c:when test="${one.filesize/1024/1024 > 1}">
				        						(<fmt:formatNumber type="number" pattern="0.00" value="${one.filesize/1024/1024}">
				        						</fmt:formatNumber>MB)
			        					</c:when>
			        					<c:otherwise>
				        						(<fmt:formatNumber type="number" pattern="0.00" value="${one.filesize/1024}">
				        						</fmt:formatNumber>KB)
			        					</c:otherwise>
			        				</c:choose>
		        				</span>
		        			</c:otherwise>
	        			</c:choose>
					</span>
				</div>
				<div class="board_div4">
					<span class="board_span1">제목</span>
					<span class="board_span2 board_div4_title">[${one.bno}] ${one.title}</span>
				</div>
				<div class="board_text">
					<div>
						${one.content}
					</div>
				</div>
				<div class="board_btn">
					<!-- 로그인 안 하면 리스트, 글쓰기, 답글 빼고 없앰 -->
					<a href="${path}/board/list" class="btn_list white_btn" id="returnGo">리스트</a>
					<c:if test="${!empty sessionScope.userid}">
						<a class="btn_reply black_btn">답글</a>
					</c:if>
					<div id="float_right">
						<c:if test="${!empty sessionScope.userid}">
							<a class="btn_good white_btn" id="btn_good">좋아요</a>
						</c:if>
						<c:if test="${sessionScope.userid == one.writer}">
							<a href="${path}/boardupdate.gaon?bno=${one.bno}" class="btn_modify white_btn" id="btn_modify">수정</a>
							<a class="btn_delete black_btn" id="btn_delete">삭제</a>
						</c:if>
					</div>
				</div>
				<div id="reply_wrap">
					<div id="commentList">
					</div>
				</div>
	        </div>
	    </div>
	</form>
	<%@ include file="../include/footer.jsp" %>
	
	<script type="text/javascript">
		var flag = 0;
		$(document).ready(function(){
			/* 문서가 준비되면 댓글 목록을 조회하는 AJAX 실행 */
			comment_list();
			goodtotal();
		});
		
		$(document).on("click", "#btn_good", function(){
			goodCnt();
		});
	
		// =가 있으면 앞에 변수를 출력하겠다는 의미
		<%-- $(document).on("click", "#returnGo", function(){
			location.href = "<%=referer%>";
		}); --%>
		
		$(document).on("click", "#btn_delete", function(){
			$('#drop_modal').css('display', 'flex');
		});
		
		$(document).on("click", "#modal_agree", function(){
			location.href="removePlay.gaon?bno=${one.bno}&filename=${one.filename}";
		});
		
		$(document).on("click", ".madal_default", function(){
			$('#drop_modal').css('display', 'none');
		});
		
		$(document).on("click", ".modal_close", function(){
			$('#drop_modal').css('display', 'none');
		});
		
		
		
		
		$(document).on("click", "#reply_btn", function(){
			
			oEditors.getById["replyInsert"].exec("UPDATE_CONTENTS_FIELD", []);
			
			
			var content = $("#replyInsert").val();
			
			if (content == "<p><br></p>") {
				// 유효성체크
				$("#replyInsert").focus();
				return false;
			} else {
				//게시글번호 담아서 보냄
				var bno = '${one.bno}';
				$('#re_bno').val(bno);
				
				$.ajax({ // ajax로 폼태그를 이용해 데이터를 보내는 방법
					url: "replyAdd.gaon",
					type: "POST",
					data: $("#frm_reply").serialize(), // serialize: form태그를 byte코드화(직렬화)시켜서 쉽게 전송함
					contentType: "application/x-www-form-urlencoded; charset=UTF-8",
					success: function(){
						comment_list();
						$("#replyInsert").val("");
					},
					error: function() {
						alert("replyAdd Error!!!");
					}
				});
			}
		});
		
		$(document).on("click", ".reply_del", function(){
			var rno = $(this).attr("data_num");
			var bno = '${one.bno}';
			
			$.ajax({
				url: "replyRemove.gaon",
				data: "rno=" + rno + "&bno=" + bno,
				success: function(result) {
					comment_list();
				},
				error: function() {
					alert("replyRemove Error!!!");
				}
			});
		});
		
		function comment_list() {
			$.ajax({ // 데이터를 받을 때 String타입으로 밖에 못보낸다.(json으로 boolean을 싸면 json이 String타입으로 바꿔서 보내줌)
				type: "GET",
				url: "${path}/reply/list?bno=${one.bno}",
				success: function(result) { // result: commentlist.jsp가 들어있음
					$("#commentList").html(result); // ajax에서는 갈데가 없으면 원래 jsp로 다시 돌아온다.
				}
			});
		}
		
		
		function goodCnt(){
			var bno = "${one.bno}";
			var id = "${sessionScope.userid}";
			
			$.ajax({
				type: "POST",
				url: "good.gaon",
				dataType: "json",
				data: "bno=" + bno + "&id=" + id,
				success: function(goodTotal){
					goodtotal();
					
				}, error: function(){
					alert("good Error!!");
				}
			});
		 }
		
	function goodtotal(){
		var bno = "${one.bno}";
		var id = "${sessionScope.userid}";
		
		$.ajax({
			type: "POST",
			url: "goodTotal.gaon",
			dataType: "json",
			data: "bno=" + bno + "&id=" + id,
			success: function(data){
				if (data.message == 0) {
					$("#btn_good").css("background", "white")
		  			  			  .css("border", "1px solid #aaa")
		  			  			  .css("color", "#aaa");
					$("#goodcnt").text(data.goodTotal);
				} else {
					$("#btn_good").css("background", "#333")
					  			  .css("border", "1px solid #333")
					  			  .css("color", "white");
					$("#goodcnt").text(data.goodTotal);
				}
			}, error: function(){
				alert("goodTotal Error!!");
			}
			
		});
	}
	</script>
</body>
</html>













