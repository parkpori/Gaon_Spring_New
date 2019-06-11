<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>
<%
	String message = request.getParameter("message");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="${path}/resources/css/common.css?v=1">
<title>Insert title here</title>
<style type="text/css">
	.board_div {
		width: 1200px;
        margin: 10px auto 0;
        padding: 80px 50px 20px;
        color: #444;
	}
	#all_title {
		font-family: 'Noto Sans KR', sans-serif;
        display: block;
        font-size: 32px;
        color: #444;
        letter-spacing: -1px;
	}
	.board_all {
		position: relative;
        padding: 50px 0;
	}
	.board_index {
		display: inline-block;
		margin-bottom: 12px;
	}
	.board_index > a {
		font-weight: bolder;
		font-family: 'Noto Sans KR', sans-serif;
		font-size: 15px;
		padding: 1px 2px;
		margin: 0 2px;
		transition: .3s;
	}
	.board_index > a:hover {
		color: #E65D6E;
	}
	.search_div {
		position: absolute;
		display: inline-block;
		top: 36px;
		right: 0;
	}
	.search_select {
		padding: 0 8px 2px;
		margin-right: 5px;
		width: 100px;
		height: 30px;
		border-radius: 15px;
		outline: none;
		border: 1px solid #ddd;
		cursor: pointer;
	}
	.search_input {
		width: 200px;
		height: 30px;
		border-radius: 15px;
		border: 1px solid #ddd;
		outline: none;
		padding: 2px 14px;
		transition: .3s;
		
	}
	.input_group {
		position: relative;
	}
	.search_icon {
		position: absolute;
		top: -6px;
		right: 5px;
		padding: 5px;
		font-size: 17px;
		color: #aaa;
		cursor: pointer;
	}
	
	
	
	
	
	
	
	
	
	table {
		width: 100%;
		border-collapse: collapse;
		color: #474747;
		text-align: center;
	}
	td, th {
		padding: 8px 10px;
		height: 50px;
	}
	td {
		font-size: 14px;
		transition: .3s;
	}
	td:nth-child(1) {
		border-left: 0px;
		width: 7%;
	}
	td:nth-child(2) {
		width: 50%;
	}
	td:nth-child(3) {
		width: 11%;
	}
	td:nth-child(4) {
		width: 11%;
	}
	td:nth-child(5) {
		width: 7%;
	}
	td:nth-child(6) {
		width: 7%;
	}
	td:nth-child(7) {
		width: 7%;
	}
	tr:nth-child(even) {
		background: #f8f8f8;
	}
	tr:last-child {
		border-bottom: 1px solid #aaa;
	}
	th:nth-child(odd) {
		/* background: #FE9E9520; */
	}
	#board_title {
		border-top: 1px solid #aaa;
		border-bottom: 1px solid #aaa;
		font-family: 'Noto Sans KR', sans-serif;
	}
	#board_title > th {
		/* border-left: 1px solid white; */
		text-align: center;
		font-weight: normal;
	}
	#board_title > th:nth-child(1) {
		border-left: 0px;
	}
	tr {
		transition: .3s;
	}
	tr:hover td {
		background: #aaaaaa40;
	}
	.content_title {
		text-align: left;
		padding: 0 15px;
	}
	.content_title a {
		padding: 5px 0px;
	}
	.heart {
		color: tomato;
		font-size: 10px;
		margin-right: 4px;
	}
	.file {
		color: #666;
	}
	.board_btm {
		position: relative;
	}
	
	
	
	
	
	
	
	
	
	/* 페이지 이동 */
	.board_navi > ul {
		display: flex;
		justify-content: center;
		margin-top: 25px;
	}
	.board_navi ul li a {
		font-family: 'Noto Sans KR', sans-serif;
		display: inline-block;
		border-collapse: collapse;
		color: #666;
		border: 1px solid #ddd;
		border-right: 0px;
		width: 27px;
		height: 27px;
		line-height: 25px;
		text-align: center;
		transition: .3s;
	}
	.board_navi ul li:last-child a {
		border-right: 1px solid #ddd;
	}
	.navi_icon {
		margin-top: 5.5px;
	}
	.board_navi ul li a:hover {
		color: #E65D6E;
	}
	.board_navi ul li a:hover .navi_icon {
		color: #E65D6E;
	}
	
	
	
	
	
	
	
	.new_time {
		background: #ff8224;
		font-size: 11px;
		color: white;
		border-radius: 3px;
		padding: 0 3px 1px;
		animation-name: twinkle;
		animation-duration: 1.2s;
		animation-iteration-count: infinite;
		margin-top: -10px;
	}
	@keyframes twinkle {
		0% {opacity: 0;}
		100% {opacity: 1;}
	}
	.replycnt_color {
		display: inline-block;
		background-color: #aaa;
		font-size: 10px;
		color: white;
		border-radius: 25px;
		padding: 1px 4px;
	}
	#active a {
		background: #333;
		border: 1px solid #333;
		color: white;
	}
	#active a:hover {
		color: white;
	}
	#no_hover:hover {
		color: inherit;
	}
	.result_position {
		position: relative;
	}
	#search_result {
		font-family: 'Noto Sans KR', sans-serif;
		position: absolute;
		top: 0px;
		margin-top: 12px;
		margin-left: 10px;
	}
	.search_span {
		color: dodgerblue;
	}
	
	
	
	
	
	
	
	.board_btn {
		display: inline-block;
		float: right;
		width: 90px;
		height: 35px;
		text-align: center;
		line-height: 32px;
		font-family: 'Noto Sans KR', sans-serif;
		margin: 1px;
		background: #333;
		border: 1px solid #333;
		color: white;
		position: absolute;
		bottom: -5px;
		right: 0;
		transition: .3s;
	}
	.board_btn:hover {
		border: 1px solid #E65D6E;
		background: #E65D6E;
		color: white;
	}
	#file_icon {
		color: #ff8224; 
	}
</style>
</head>
<body>
	<div class="board_div">
        <div id="all_title">질문 게시판</div>
        <div class="board_all">
        	<div class="board_index">
	        	<a href="${path}/board/list?sort_option=new&search_option=${map.search_option}&keyword=${map.keyword}" id="ordernew">최신순</a>
	        	<a href="${path}/board/list?sort_option=good&search_option=${map.search_option}&keyword=${map.keyword}" id="ordergood">추천순</a>
	        	<a href="${path}/board/list?sort_option=reply&search_option=${map.search_option}&keyword=${map.keyword}" id="orderreply">댓글순</a>
	        	<a href="${path}/board/list?sort_option=view&search_option=${map.search_option}&keyword=${map.keyword}" id="orderview">조회순</a>
        	</div>
        	<div class="search_div">
        		<select class="search_select" name="selsearch">
        			<option value="title">제목</option>
        			<option value="content">내용</option>
        			<option value="all" selected="selected">제목+내용</option>
        			<option value="writer">작성자</option>
        		</select>
        		<span class="input_group">
        			<input type="text" name="" class="search_input">
        			<i class="fas fa-search search_icon"></i>
        		</span>
        	</div>
        	<table>
        		<tr id="board_title">
        			<th>No.</th>
        			<th>제목</th>
        			<th>작성자</th>
        			<th>작성일</th>
        			<th>좋아요</th>
        			<th>조회수</th>
        			<th>첨부</th>
        		</tr>
        		<c:forEach items="${map.list}" var="bDto">
        			<!-- 현재시간 구하기 -->
        			<jsp:useBean id="now" class="java.util.Date"/>
        			<fmt:formatDate value="${now}" pattern="yyyy-MM-dd" var="today"/>
        			<fmt:formatDate value="${bDto.regdate}" pattern="yyyy-MM-dd" var="regdate"/>
	        		<tr>
	        			<td>${bDto.bno}</td>
	        			<td class="content_title">
	        				<a href="${path}/board/view?bno=${bDto.bno}">
	        					${bDto.title}
	        				</a>
	        				
	        				<c:if test="${bDto.replycnt > 0}">
	        					<span class="replycnt_color">${bDto.replycnt}</span>
	        				</c:if>
	        				
	        				<c:if test="${today == regdate}">
	        					<span class="new_time">new</span>
	        				</c:if>
	        			</td>
	        			<td>${bDto.writer}</td>
	        			<td>
		        			<c:choose>
			        			<c:when test="${today == regdate}">
			        				<fmt:formatDate pattern="hh:mm:ss" value="${bDto.regdate}"/>
			        			</c:when>
			        			<c:otherwise>
			        				<fmt:formatDate pattern="yyyy-MM-dd" value="${bDto.regdate}"/>
			        				<!-- MM은 대문자로 해야 월로 인식, 소문자는 분으로 인식 -->
			        			</c:otherwise>
	        				</c:choose>
	        			</td>
	        			<td><i class="fas fa-heart heart"></i>${bDto.goodcnt}</td>
	        			<td>${bDto.viewcnt}</td>
	        			<td>
	        			<c:if test="${bDto.filesize > 0}">
	        				<i class="fas fa-paperclip" id="file_icon"></i>
	        			</c:if>
	        		</tr>
        		</c:forEach>
        	</table>
        	<c:if test="${!empty map.keyword}">
	        	<div class="result_position">
		        	<div id="search_result">
		        		<span class="search_span">"${map.keyword}"</span>로 검색한 결과는 총 
		        		<span class="search_span">"${map.count}"</span>건 입니다.
		        	</div>
		        </div>
	        </c:if>
        	<div class="board_btm">
	        	<div class="board_navi">
	        		<ul>
	        			<c:if test="${map.pager.curBlock > 1}">
		        			<li><a href="${path}/board/list?curPage=${map.pager.blockBegin-10}&sort_option=${map.sort_option}&search_option=${map.search_option}&keyword=${map.keyword}"><i class="fas fa-angle-left navi_icon"></i></a></li>
		        			<li><a href="${path}/board/list?curPage=1&sort_option=${map.sort_option}&search_option=${map.search_option}&keyword=${map.keyword}">1</a></li>
		        			<li><a id="no_hover">...</a></li>
	        			</c:if>
	        			
	        			<c:forEach begin="${map.pager.blockBegin}" end="${map.pager.blockEnd}" var="idx">
					    	<li <c:out value="${map.pager.curPage == idx?'id=active':''}"/>>
					    		<a href="${path}/board/list?curPage=${idx}&sort_option=${map.sort_option}&search_option=${map.search_option}&keyword=${map.keyword}&key=${code}" class="navi_btn">
					    			${idx}
					    		</a>
					    	</li>
					    </c:forEach>
					    
					    <c:if test="${map.pager.curBlock < map.pager.totBlock}">
						    <li><a id="no_hover">...</a></li>
						    <li><a href="${path}/board/list?curPage=${map.pager.totPage}&sort_option=${map.sort_option}&search_option=${map.search_option}&keyword=${map.keyword}">${map.pager.totPage}</a></li>
						    <li><a href="${path}/board/list?curPage=${map.pager.blockEnd + 1}&sort_option=${map.sort_option}&search_option=${map.search_option}&keyword=${map.keyword}"><i class="fas fa-angle-right navi_icon"></i></a></li>
					    </c:if>
					</ul>
	        	</div>
        		<a class="board_btn" id="boardAdd">게시글 등록
        		</a>
        	</div>
		</div>
	</div>
	<script type="text/javascript">
	var message = '<%=message%>';
		$(document).ready(function(){
			
			if (message == "nologin") {
				$('#modal_all').css('display', 'flex');
                $("#login_id").focus();
                $(".login_box_inner").css("display", "block")
 									.text("로그인이 필요한 시스템입니다.");
			}
			
			var flag1 = 0;
			var flag2 = 0;

			/* $(".search_icon").click(function(event) {
				if (flag1 == 0) {
				$(".search_input").css('width', '200px')
								.css('border', '1px solid #E65D6E');
				$(".search_icon").css('color', '#E65D6E');
				$(".search_input").focus();
				flag1 = 1;
				} else {
					$(".search_input").css('width', '36px')
								.css('border', '1px solid #ddd')
								.val("");
					$(".search_icon").css('color', '#aaa');
				flag1 = 0;
				}
			}); */
			
			
			var sort_type = "${map.sort_option}";
			if (sort_type == "new") {
				$("#ordernew").css("color", "#E65D6E");
			} else if (sort_type == "good") {
				$("#ordergood").css("color", "#E65D6E");
			} else if (sort_type == "reply") {
				$("#orderreply").css("color", "#E65D6E");
			} else if (sort_type == "view") {
				$("#orderview").css("color", "#E65D6E");
			}
			
			
			
			
			
			$("#boardAdd").on("click", function(){
				$.ajax({
					url: "registerAjax.gaon",
					type: "POST",
					dataType: "json",
					success: function(data){
						if (data.message == "login") {
							location.href="registerView.gaon";
						} else if (data.message == "nologin") {
							$('#modal_all').css('display', 'flex');
			                $("#login_id").focus();
			                $(".login_box_inner").css("display", "block")
			 									.text("로그인이 필요한 시스템입니다.");
						}
					},
					error: function() {
						alert("System Error!!!");
					}
				});
			});
			
		});
		
		$(document).on("click", ".search_icon", function(){
			var search_option = $(".search_select").val();
			var keyword = $(".search_input").val();
			
			if (keyword == null || keyword.length == 0) {
				$(".search_input").focus();
				$(".search_input").css("border", "1px solid #E65D6E");
				$(".search_icon").css("color", "#E65D6E");
				return false;
			}
			location.href="${path}/board/list?search_option="+search_option+"&keyword="+keyword;
		});
	</script>
	<%@ include file="../include/footer.jsp" %>	
</body>
</html>