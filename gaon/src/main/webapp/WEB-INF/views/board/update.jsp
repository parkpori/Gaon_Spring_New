<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>
<% String referer = request.getHeader("referer"); %>
<%-- <c:choose>
	<c:when test="${sessionScope.loginUser == null}">
		<script>
			alert("로그인 하신 후 사용하세요.");
			location.href="${path}/boardList.gaon?message=nologin";
		</script>
	</c:when>
</c:choose> --%>
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
	.board_pw {
		display: flex;
		align-items: center;
		flex: 1;
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
	.basic_file {
		display: flex;
		align-items: center;
		border-top: 1px solid #ddd;
	}
	.basic_file_title {
		display: inline-block;
		font-family: 'Noto Sans KR', sans-serif;
		width: 125px;
		background: #ededed;
		height: 37px;
		text-align: center;
		line-height: 36px;
	}
	#basic_file_name {
		display: inline-block;
		padding-left: 15px;
	}
	.file_msg {
		display: none;
		padding-left: 5px;
		padding-top: 2px;
		color: tomato;
		font-size: 12px;
	}
	#basic_file_size {
		margin: 2px 0px 0px 3px;
		color: #999;
		font-size: 12px;
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
	#close_basic_btn {
		margin: 2px 4px 0px;
		cursor: pointer;
	}
	#close_file_btn {
		margin: 0px 4px;
		cursor: pointer;
	}
	#open_basic_btn {
		display: none;
		color: green;
		margin: 0px 4px;
		cursor: pointer;
	}
</style>
</head>
<body>
	<form action="${path}/board/update" method="POST" name="frm_mem" id="frm_mem">
		<div class="board_div">
	        <div id="all_title">질문 게시판</div>
	        <div class="board_all">
	        	<div class="name_pw">
	        		<div class="board_name">
		        		<span>작성자</span>
						<div class="board_id">${one.writer}</div>
						<input type="hidden" name="writer" value="${one.writer}">
						<input type="hidden" name="bno" value="${one.bno}">
		        	</div>
<!-- 		        <div class="board_pw">
		        		<span>비밀번호*</span>
						<input type="password" name="">
		        	</div> -->
	        	</div>
	        	<div class="board_title">
	        		<span>제목</span>
					<input type="text" id="titleinsert" name="title" value="${one.title}">
					<span id="board_title_text">제목, 내용을 입력해주세요.</span>
	        	</div>
	        	<div class="board_text">
	        		<textarea id="contentinsert" name="content">${one.content}</textarea>
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
	        	<div class="basic_file">
	        		<span class="basic_file_title">기존 첨부파일</span>
	        		<span id="basic_file_name">${one.filename}</span>
	        		<span class="file_msg">[첨부파일 삭제됨]</span>
	        		<i class="fas fa-times" id="close_basic_btn"></i>
	        		<i class="fas fa-check" id="open_basic_btn"></i>
	        		<input type="hidden" name="basic_filename" value="${one.filename}">
	        		<input type="hidden" name="basic_filesize" value="${one.filesize}">
	        		<input type="hidden" name="basic_check" id="basic_check">
	        	</div>
	        	<div class="board_file">
	        		<span class="board_file_title">첨부파일</span>
	        		<input type="file" name="uploadfile" id="uploadfile" style="display:none;">
	        		<input type="button" class="btn_file" value="파일 선택">
	        		<span class="files" id="file_name"> 선택된 파일이 없습니다.</span>
	        		<span id="now_file_size"></span>
	        		<i class="fas fa-times" id="close_file_btn" style="display:none;"></i>
	        	</div>
	        	<div class="board_btn">
	        		<span>
	        			<a class="btn_default white_btn">취소</a>
	        			<a class="btn_agree">수정</a>
	        		</span>
	        	</div>
	        </div>
	    </div>
	</form>
	<script type="text/javascript">
		$(document).ready(function(){
			
			$(".btn_file").click(function() {
				$("#uploadfile").click();
			});
			$("#file_name").click(function() {
				$("#uploadfile").click();
			});
			$(".btn_default").click(function() {
				location.href = "<%=referer%>";
			});
			
			$(".btn_agree").click(function(){
				
				oEditors.getById["contentinsert"].exec("UPDATE_CONTENTS_FIELD", []);
				
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
		
		$(document).on("click", "#close_basic_btn", function(){
			$("#close_basic_btn").css("display", "none");
			$("#open_basic_btn").css("display", "inline-block");
			$(".file_msg").css("display", "inline-block");
			$("#basic_file_name").css("color", "#bbb")
								.css("text-decoration", "line-through");
			$("#basic_check").val("no");
			
		});
		
		$(document).on("click", "#open_basic_btn", function(){
			$("#close_basic_btn").css("display", "inline-block");
			$("#open_basic_btn").css("display", "none");
			$(".file_msg").css("display", "none");
			$("#basic_file_name").css("color", "#444")
								.css("text-decoration", "none");
			$("#basic_check").val("yes");
		});
		
		$(document).on("change", "#uploadfile", function(){
			var filesize = $(this)[0].files; // 0: 첫번째 파일(0번지)
			if (filesize.length < 1) {
				$("#file_name").text("선택된 파일이 없습니다.");
				$("#close_file_btn").css("display", "none");
				$("#now_file_size").css("display", "none");
			} else {
				var filename = this.files[0].name;
				var size = this.files[0].size; // size: byte단위로 가져옴(8024byte)
				var maxSize = 10 * 1024 * 1024; // 10MB사이즈
				var formSize = size/(1024*1024);
				if (size > maxSize) {
					alert("첨부파일 사이즈는 10MB이내로 등록 가능합니다.");
					$("#file_name").text("선택된 파일이 없습니다.");
					$("#close_file_btn").css("display", "none");
					$("#uploadfile").css("display", "block");
					$("#uploadfile").val(""); // 파일 초기화
					$("#now_file_size").text(""); // 파일 초기화
					$("#now_file_size").css("display", "none");
				} else {
					$("#file_name").text(filename);
					$("#close_file_btn").css("display", "block");
					$("#now_file_size").text("("+formSize.toFixed(3) + "MB)");
					$("#now_file_size").css("display", "inline-block");
				}
			}
		});
		$(document).on("click", "#close_file_btn", function(){
			$("#uploadfile").replaceWith($("#uploadfile").clone(true));
			$("#uploadfile").val("");
			$("#now_file_size").text("");
			$("#now_file_size").css("display", "none");
			$("#file_name").text("선택된 파일이 없습니다.");
			$("#close_file_btn").css("display", "none");
		});
	</script>
	<%@ include file="../include/footer.jsp" %>
</body>
</html>