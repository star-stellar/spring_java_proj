<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp" %>

<div class="container">
	<div class="jumbotron">
		<h1>공지사항 등록</h1>
	</div>
	<form action="${contextPath}/ask" method="post">
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
		<div class="form-group">
			<input type="text" name="title" class="form-control" placeholder="제목을 입력하세요" required="required">
		</div>
		<div class="form-group">
			<textarea rows="10" class="form-control" placeholder="내용을 입력하세요.." required="required"></textarea>
		</div>
		<div class="form-group">
			<input type="text" name="writer" class="form-control" readonly="readonly" value="${auth.memberId}">
		</div>
		<button class="btn btn-primary">등록</button>
	</form>
</div>


<%@ include file="../layout/footer.jsp" %>