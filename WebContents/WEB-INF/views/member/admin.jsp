<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp" %>

<div class="container">
	<div class="jumbotron">
		<h1>관리자 페이지</h1>
	</div>
	
	<div class="container" style="margin-top:30px">
		<div class="row">
			<div class="col-sm-8">
				<form action="${contextPath}/member/upadteMemberType" method="post">
				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
				<table class="table">
					<tr>
						<th>회원번호</th>
						<th>아이디</th>
						<th>이메일</th>
						<th>회원등급</th>
						<th>상태</th>
					</tr>
					<c:forEach var="m" items="${list}" varStatus="mst">
					<c:if test="${m.authList[0].memberType != mType[0]}">
					<tr>
						<td>${m.mno }</td>
						<td>${m.memberId }
							<input type="hidden" name="authList[${mst.index}].memberId" value="${m.memberId}">
						</td>
						<td>${m.email }</td>
						<td>
							<select name="authList[${mst.index}].memberType">
							<c:forEach items="${mType}" var="type" varStatus="st">
								<option value="${type}" ${m.authList[0].memberType==type ? 'selected':''}>${type.name}</option>
							</c:forEach>
							</select>
						</td>
						<td>${m.enabled ? '활성':'비활성' }</td>
					</tr>
					</c:if>
					</c:forEach>
					
				</table>
				<button>전송</button>
				</form>
			</div>
			<div class="col-sm-4">
				<div class="card card-signin my-5">
					<div class="card-body">
						<h5 class="card-title text-center">Log In</h5>
					</div>
					<hr>
						<div class="form-label-group text-center">
							<a href="${contextPath}/noticeForm" class="btn btn-block btn-secondary">공지사항 작성</a>
						</div>
					<hr>
						<div class="form-label-group text-center">
							<a href="${contextPath}/member/join" class="btn btn-block btn-secondary">상품 관리</a>
						</div>
				</div>
			</div>
		</div>
	</div>
</div>
<%@ include file="../layout/footer.jsp" %>