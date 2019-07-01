<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>
<c:choose>
	<c:when test="${sessionScope.userid == null}">
		<script>
			alert("로그인 하신 후 사용하세요.");
			location.href="${path}/boardList.gaon?message=nologin";
		</script>
	</c:when>
</c:choose>
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
	.name_pw {
		display: flex;
		border-top: 1px solid #aaa;
		border-bottom: 1px solid #ddd;
	}
	.board_name {
		display: flex;
		align-items: center;
	}
	.board_id {
		display: inline-block;
		padding-left: 15px;
		color: #7BA518;
		background: white;
	}
	.name_pw > div > input {
		/* width: 289px; */
		width: 400px;
		height: 25px;
		margin: 4px;
		padding: 0 6px;
		border: 1px solid #dfdfdf;
	}
	.name_pw > div > span {
		display: inline-block;
		font-family: 'Noto Sans KR', sans-serif;
		width: 125px;
		background: #ededed;
		height: 37px;
		text-align: center;
		line-height: 36px;
	}
	.board_title {
		display: flex;
		border-bottom: 1px solid #ddd;
	}
	.board_title > span {
		display: inline-block;
		font-family: 'Noto Sans KR', sans-serif;
		width: 125px;
		background: #ededed;
		height: 37px;
		text-align: center;
		line-height: 36px;
	}
	.board_title > input {
		width: 500px;
		height: 25px;
		margin: 6px 4px 2px;
		padding: 0 6px;
		border: 1px solid #dfdfdf;
	}
	#board_title_text {
		font-family: 'Nanum Gothic', sans-serif;
		background: white;
		font-size: 12px;
		width: 200px;
		padding: 2px 4px 0px;
		text-align: left;
	}
	.board_text {
		padding: 20px 0px;
	}
	textarea {
		border: 1px solid #dfdfdf;
		width: 898px;
		box-sizing: border-box;
		padding: 10px 9px;
		height: 350px;
		background: #fafafa;
	}
	.board_file {
		display: flex;
		align-items: center;
		border-top: 1px solid #ddd;
		border-bottom: 1px solid #aaa;
	}
	.board_file_title {
		display: inline-block;
		font-family: 'Noto Sans KR', sans-serif;
		width: 125px;
		background: #ededed;
		height: 37px;
		text-align: center;
		line-height: 36px;
	}
	#uploadfile {
		width: 380px;
		height: 25px;
		margin: 4px;
		padding: 0 6px;
		border: 1px solid #dfdfdf;
		display: none;
	}
	.board_file > a {
		width: 380px;
		height: 25px;
		margin: 4px;
		padding: 0 6px;
		border: 1px solid #dfdfdf;
		line-height: 23px;
		font-size: 13px;
	}
	.board_btn {
		margin-top: 20px;
	}
	.board_btn span {
		float: right;
	}
	.board_btn > span > a {
		display: inline-block;
		width: 90px;
		height: 35px;
		text-align: center;
		line-height: 32px;
		font-family: 'Noto Sans KR', sans-serif;
		transition: .3s;
		margin: 1px;
	}
	.btn_agree {
		background: #333;
		border: 1px solid #333;
		color: white;
	}
	.white_btn {
		border: 1px solid #aaa;
		color: #aaa;
	}
	.btn_agree:hover {
		background: #E65D6E;
		border: 1px solid #E65D6E;
		color: white;
	}
	.white_btn:hover {
		border: 1px solid #444;
		color: #444;
	}
	.btn_file {
		margin-left: 8px;
		background: dodgerblue;
		border: 0px;
		padding: 3px 10px;
		color: white;
		border-radius: 20px;
		font-size: 13px;
	}
	#file_name {
		cursor: pointer;
		display: inline-block;
		padding-left: 4px;
		font-size: 13px;
	}
	#now_file_size {
		display: none;
		margin-left: 3px;
		color: #999;
		font-size: 12px;
	}
	#close_file_btn {
		margin: 0px 4px;
		cursor: pointer;
	}
</style>
</head>
<body>
	<form action="${path}/board/answer" method="POST" name="frm_mem" id="frm_mem">
		<input type="hidden" value="${one.bno}" name="bno">
		<div class="board_div">
	        <div id="all_title">질문 게시판</div>
	        <div class="board_all">
	        	<div class="name_pw">
	        		<div class="board_name">
		        		<span>작성자</span>
						<div class="board_id">${sessionScope.userid}</div>
						<input type="hidden" name="writer" value="${sessionScope.userid}">
		        	</div>
	        	</div>
	        	<div class="board_title">
	        		<span>제목</span>
					<input type="text" id="titleinsert" name="title" value="${one.title}" readonly="readonly">
					<span id="board_title_text">제목, 내용을 입력해주세요.</span>
	        	</div>
	        	<div class="board_text">
	        		<textarea id="contentinsert" name="content">
	        			${one.content}
	        		</textarea>
	        			<script type="text/javascript">
							var oEditors = [];
							nhn.husky.EZCreator.createInIFrame({
							 oAppRef: oEditors,
							 elPlaceHolder: "contentinsert",
								sSkinURI: "${path}/resources/smarteditor/SmartEditor2Skin.html",
								fCreator: "createSEditor2",
								htParams:{fOnBeforeUnload : function(){} }
							});
						</script>
	        	</div>
	        	<div class="board_btn">
	        		<span>
	        			<a href="${path}/board/list" class="btn_default white_btn">취소</a>
	        			<a class="btn_agree">확인</a>
	        		</span>
	        	</div>
	        </div>
	    </div>
	</form>
	<script type="text/javascript">
		$(document).ready(function(){
			
			
			
			
			$(".btn_agree").click(function(){
				
				oEditors.getById["contentinsert"].exec("UPDATE_CONTENTS_FIELD", []);
				// textarea에 스마트에디터의 값을 알려줌
				
				var title = $("#titleinsert").val();
				var content = $("#contentinsert").val();
				
				if (title == null || title.length == 0) {
					$("#board_title_text").css("color", "tomato")
										  .css("display", "inline-block");
					return false;
				} else {
					$("#board_title_text").css("display", "none");
				}
				if (content == "<p><br></p>") {
					$("#board_title_text").css("color", "tomato")
										  .css("display", "inline-block");
					return false;
				} else {
					$("#board_title_text").css("display", "none");
				}
				$("#frm_mem").submit();
			});
		});
	</script>
	<%@ include file="../include/footer.jsp" %>
</body>
</html>