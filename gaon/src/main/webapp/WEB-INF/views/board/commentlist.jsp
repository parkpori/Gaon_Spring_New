<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/common.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- 댓글 없을 때 -->
	<c:if test="${replyList.size() == 0}">
		<div class="comment_emp">
			<span>등록된 댓글이 없습니다.</span>
		</div>
	</c:if>


	<div class="comment_all">
		<c:if test="${replyList.size() > 0}">
			<div class="comment_total">총 댓글 <span>"${replyList.size()}"</span>개</div>
		</c:if>
		<c:forEach items="${replyList}" var="replyview">
			<div class="comment_box">
				<div class="comment_title">
					<span>이름 : </span>
					<span class="comment_name">${replyview.writer}</span>
					<span class="comment_right">
						<span class="comment_day">
							<fmt:formatDate pattern="yyyy-mm-dd hh:mm:ss" value="${replyview.regdate}"/>
						</span>
						<c:if test="${sessionScope.userid == replyview.writer}">
							<a class="comment_delete reply_del" data_num="${replyview.rno}">삭제</a>
						</c:if>
					</span>
				</div>
				<div class="comment_content">
					${replyview.content}
				</div>
			</div>
		</c:forEach>
	</div>
	
	
		
	<c:choose>
		<c:when test="${empty sessionScope.userid}">
			<div class="comment_login">
				<span>로그인을 하시면 댓글을 등록하실 수 있습니다.</span>
			</div>
		</c:when>
		
		<c:otherwise>
			<form action="replyAdd.gaon" method="POST" name="frm_reply" id="frm_reply">
				<div class="comment_input">
					<div class="comment_input_title">
						<span>이름</span>
						<span class="comment_input_name">${sessionScope.userid}</span>
					</div>
					<div class="comment_input_text">
						<textarea name="re_textarea" id="replyInsert" rows="" cols="150" placeholder="댓글을 남겨보세요."></textarea>
						<script type="text/javascript">
							var oEditors = [];
							nhn.husky.EZCreator.createInIFrame({
								oAppRef: oEditors,
								elPlaceHolder: "replyInsert",
								sSkinURI: "${path}/resources/smarteditor/SmartEditor2Skin.html",
								fCreator: "createSEditor2",
								htParams:{fOnBeforeUnload : function(){} }
							});
						</script>
					</div>
				</div>
				
					
				<div class="comment_input_btn">
					<a class="comment_btn" id="reply_btn">댓글등록</a>
				</div>
				
				<input type="hidden" name="re_writer" value="${sessionScope.userid}">
				<input type="hidden" id="re_bno" name="re_bno">
			</form>
		</c:otherwise>
	</c:choose>
</body>
</html>