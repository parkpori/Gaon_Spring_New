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
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/4.0.11/handlebars.min.js"></script>
<link rel="stylesheet" href="${path}/resources/lightbox/css/lightbox.css">
<script src="${path}/resources/lightbox/js/lightbox.js"></script>
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
	
	.fileDrop {
		border: 1px dashed #dadada;
		text-align: center;
		height: 130px;
		display: flex;
		align-items: center;
		justify-content: center;
		color: #515151;
	}
	.fileDrop p {
		margin: 0px;
	}
	.uploadedList {
		display: flex;
		justify-content: space-between;
		flex-wrap: wrap;
	}
</style>
</head>
<body>
	<form action="${path}/board/create" method="POST" name="frm_mem" id="frm_mem">
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
					<input type="text" id="titleinsert" name="title">
					<span id="board_title_text">제목, 내용을 입력해주세요.</span>
	        	</div>
	        	<div class="board_text">
	        		<textarea id="contentinsert" name="content"></textarea>
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
	        	<div class="write_input wrap form-group">
	        		<div class="fileDrop">
	        			<p>
	        				<i class="fas fa-paperclip"></i>
	        				첨부파일을 드래그 해주세요.
	        			</p>
	        		</div>
	        	</div>
	        	<div class="write_input_wrap">
	        		<ul id="uploadedList" class="mailbox-attachments clearfix uploadedList"></ul>
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
	<script id="fileTemplate" type="text/x-handlebars-template">
    <li>
        <div class="mailbox-attachment-icon has-img">
            <center><img src="{{imgSrc}}" alt="Attachment" class="s_img"></center>
        </div>
        <div class="mailbox-attachment-info">
            <a href="{{originalFileUrl}}" class="mailbox-attachment-name">
                <i class="fa fa-paperclip"></i> {{originalFileName}}
            </a>
            <span class="btn btn-default btn-xs pull-right delBtn" data-src="{{basicFileName}}">
                <i class="fas fa-times"></i>
            </span>
        </div>
    </li>
	</script>
	<script type="text/javascript">
		//Handlebars 파일템플릿 컴파일
		var fileTemplate = Handlebars.compile($("#fileTemplate").html());

		// 수정시 로컬드라이브에서 삭제할 기존 첨부파일 목록
		var deleteFileList = new Array();
		
		$(document).ready(function(){
			// 등록 & 수정 페이지 디자인
			var bno = '${one.bno}';
			if(bno == '') {  // 게시글 등록
				
			} else {  // 게시글 수정
				var str='';
				str += "<input type='hidden' name='bno' value='" + bno + "'>";
				$("#frm_add").append(str);
			}
			
			// 첨부파일 목록 출력
			listAttach();
			
			// 답글이면 title 수정 못하게 막음
			var re_level = "${one.re_level}";
			if(re_level > 0) {
				// $('#board_title').attr('readonly', 'readonly');
			}
			
			// Drag & Drop 기본효과 막음
			// : 아래 작업안하면 실제 파일이 열림
			$(".fileDrop").on("dragenter dragover", function(e){
				e.preventDefault();
			})
			$(".fileDrop").on("drop", function(e){
				e.preventDefault();
				
				// ajax 파일 -> D:\\upload
				// 첫번째 첨부파일
				var files = e.originalEvent.dataTransfer.files; // 드래그한 첨부파일 전부(ex. 3개를 한번에 드래그)
				var file = files[0]; // 그 중 하나만 꺼내옴(ex. 0번지인 파일 하나만), 다중첨부파일 방지
				
				// 폼 데이터에 첨부파일 추가
				var formData = new FormData(); // 폼 객체
				formData.append("file", file); // 폼에 파일변수 추가
				// 서버에 파일 업로드(백그라운드에서 실행됨)
				// contentType: false => multipart/form-data로 처리
				$.ajax({
					url: "${path}/upload/uploadAjax",
					data: formData,
					dataType: "text",
					processData: false,
					contentType: false,
					type: "POST",
					success: function(data) {
						console.log(data);
						// data: 업로드한 파일 정보와 http 상태 코드
						printFiles(data); // 첨부파일 출력 메서드 호출
					}
				});
			});
			
			
			// 첨부파일 삭제 함수
			$(".uploadedList").on("click", ".delBtn", function(event) {
				var bno = '${one.bno}';
				var that = $(this);
				if(bno == 0) { // 게시글 등록
					$.ajax({
						url: "${path}/upload/deleteFile",
						type: "post",
						data: { fileName: $(this).attr("data-src") },
						dataType: "text",
						success: function(result) {
							if(result == "deleted") {
								that.parents("li").remove();
							}
						}, error: function() {
							alert("System Error!!!");
						}
					});	
				} else {
					/* 
						첨부파일 x버튼 클릭시 바로바로 드라이브에서 삭제해버리면
						수정작업중 수정을 취소했을 때 기존에 파일이 사라지는 문제가 발생
						따라서 삭제를 눌렀을 때 화면단에서는 삭제가 되지만 드라이브와 DB에서
						삭제하지 않고 삭제목록(list)을 따로 저장해 둔 후 실제 유저가
						수정버튼을 클릭했을 때 form태그에 append하고 가져가서 파일을 삭제
						및 수정
					*/
					var arr_size = deleteFileList.length;
					deleteFileList[arr_size] = $(this).attr("data-src");
					$(this).parents("li").next("input").remove();
					$(this).parents("li").remove();
					/* for (var i = 0; i <= deleteFileList.length; i++)
					console.log(deleteFileList[i]); */
				}
			});
			
			
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
				
				var str="";
				// uploadedList 내부의 .file 태그 각각 반복
				$("#uploadedList .file").each(function(i){
					console.log(i);
					//hidden 태그 구성
					str += "<input type='hidden' name='files["+i+"]' value='" + $(this).val()+"'>";
				});
				
				// 로컬드라이브에 저장되어있는 해당 게시글 
				// 첨부파일 삭제
				if(deleteFileList.length > 0) {
					$.post('${path}/upload/deleteAllFile', {files:deleteFileList}, function(){});
				}
				
				//폼에 hidden 태그들을 붙임
				$("#frm_mem").append(str);
				$('#frm_mem').submit();
			});
		});
		
		

		// 파일 정보 처리
		function getFileInfo(fullName) {
		    var originalFileName;   // 화면에 출력할 파일명
		    var imgSrc;                   // 썸네일 or 파일아이콘 이미지 파일 출력 요청 URL
		    var originalFileUrl;       // 원본파일 요청 URL
		    var uuidFileName;       // 날짜경로를 제외한 나머지 파일명 (UUID_파일명.확장자)
		    var basicFileName = fullName;      // 삭제시 값을 전달하기 위한 파일이름을 줄이지 않은 url
			
		    // 이미지 파일이면
		    if (checkImageType(fullName)) {
		        imgSrc = "${path}/upload/displayFile?fileName=" + fullName; // 썸네일 이미지 링크
		        uuidFileName = fullName.substr(14);
		        var originalImg = fullName.substr(0, 12) + fullName.substr(14);
		        // 원본 이미지 요청 링크
		        originalFileUrl = "${path}/upload/displayFile?fileName=" + originalImg;
		    } else {
		        imgSrc = "${path}/resources/img/file-icon.png"; // 파일 아이콘 이미지 링크
		        uuidFileName = fullName.substr(12);
		        // 파일 다운로드 요청 링크
		        originalFileUrl = "${path}/upload/displayFile?fileName=" + fullName;
		    }
		    originalFileName = uuidFileName.substr(uuidFileName.indexOf("_") + 1);
		 // 전체 파일명의 크기가 14보다 작으면 그대로 이름 출력,
		    // 14보다 크면 실행
		    if(originalFileName.length > 14) {
		    	// 앞에서부터 11글자 자름
		    	var shortName = originalFileName.substr(0, 10);
		    	// .을 기준으로 배열 생성
		    	var formatVal = originalFileName.split(".");
			// formatVal = originalFileName.substr(originalFileName.length-3);
			// 파일명에 .이 여러개 들어가 있을수도 있음
			// 배열크기를 구해와서 무조건 맨 마지막 확장자부분 출력되게 함
			var arrNum = formatVal.length - 1
			// 맨 처음 문자열 10글자 + ... + 확장자
			originalFileName = shortName + "..." + formatVal[arrNum];
		    }
		    return {originalFileName: originalFileName, imgSrc: imgSrc, originalFileUrl: originalFileUrl, fullName: fullName, basicFileName: basicFileName};
		}
		//첨부파일 출력
		function printFiles(data) {
		    // 파일 정보 처리
		    var fileInfo = getFileInfo(data);
		    /* console.log(fileInfo); */
		    // Handlebars 파일 템플릿에 파일 정보들을 바인딩하고 HTML 생성
		    var html = fileTemplate(fileInfo);
		    html += "<input type='hidden' class='file' value='"
				+fileInfo.fullName+"'>";
		    // Handlebars 파일 템플릿 컴파일을 통해 생성된 HTML을 DOM에 주입
		    $(".uploadedList").append(html);
		    // 이미지 파일인 경우 aaaaaaaaaaa파일 템플릿에 lightbox 속성 추가
		    if (fileInfo.fullName.substr(12, 2) === "s_") {
		        // 마지막에 추가된 첨부파일 템플릿 선택자
		        var that = $(".uploadedList li").last();
		        // lightbox 속성 추가
		        that.find(".mailbox-attachment-name").attr("data-lightbox", "uploadImages");
		        // 파일 아이콘에서 이미지 아이콘으로 변경
		        that.find(".fa-paperclip").attr("class", "fa fa-camera");
		    }
		}
		function getOriginalName(fileName){
			if(checkImageType(fileName)){ //이미지 파일이면 skip
				return;
			}
			var idx=fileName.indexOf("_")+1; //uuid를 제외한 파일이름
			return fileName.substr(idx);
		}
		function getImageLink(fileName){
			if(!checkImageType(fileName)){//이미지 파일이 아니면 skip
				return;
			}
			var front=fileName.substr(0,12);//연월일 경로
			var end=fileName.substr(14);// s_ 제거
			return front+end;
		}
		function checkImageType(fileName){
			var pattern=/jpg|gif|png|jpeg/i; //정규표현식(대소문자 무시)
			return fileName.match(pattern); //규칙에 맞으면 true
		}
		
		//첨부파일 리스트를 출력하는 함수
		function listAttach(){
			var listCnt = 0;
			$.ajax({
				type: "post",
				url: "${path}/board/getAttach/${one.bno}",
				async: false,
				success: function(list){
					// list : json
					//console.log(list);
					listCnt = list.length;
					
					/* console.log(list.length); */
					/* 
						jQuery each()는 반복문
						i와 e는 index와 element로
						json에서 { 0: "apple.png"}일 때
						index는 0, element는 apple.png가 됨
					*/
					$(list).each(function(i, e){
						/* console.log(list) */
						printFiles(e); // 첨부파일 출력 메서드 호출
					});
				}
			});
			return listCnt;
		}
	</script>
	<%@ include file="../include/footer.jsp" %>
</body>
</html>