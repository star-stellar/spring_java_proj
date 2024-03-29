<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp" %>

<div class="container">
	<div class="jumbotron text-center p-3 my-3 bg-dark text-white">
		<h1>관리자 페이지</h1>
	</div>
	
	<div class="container" style="margin-top:30px">
		<div class="row">
			<div class="col-sm-2">
				<div class="card card-signin">
					<div class="card-body">
						<h5 class="card-title text-center">관리메뉴</h5>
					</div>
					<div class="form-label-group text-center">
						<a href="${contextPath}/noticeForm" class="btn btn-secondary" style="width: 90%">공지사항 작성</a>
					</div>
					<hr>
					<div class="form-label-group text-center">
						<a href="${contextPath}/member/join" class="btn btn-secondary" style="width: 90%">상품 관리</a>
					</div>
					<hr>
					<div class="form-label-group text-center">
						<a href="${contextPath}/askList" class="btn btn-secondary" style="width: 90%">회원문의</a>
					</div>
					<hr>
				</div>
			</div>
			
			<div class="col-sm-10">
				<form action="${contextPath}/member/updateMemberType" method="post">
				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
					<table class="table">
						<tr class="text-center">
							<th>회원번호</th>
							<th>아이디</th>
							<th>이름</th>
							<th>이메일</th>
							<th>회원등급</th>
							<th>상태</th>
							<th>가입일</th>
						</tr>
						<c:forEach var="m" items="${list}" varStatus="mst">
						<c:if test="${m.authList[0].memberType != mType[0]}">
						<tr class="text-center">
							<td>${m.mno }</td>
							<td>${m.memberId }
								<input type="hidden" name="authList[${mst.index}].memberId" value="${m.memberId}">
							</td>
							<td>${m.memberName}</td>
							<td>${m.email }</td>
							<td>
								<select name="authList[${mst.index}].memberType">
								<c:forEach items="${mType}" var="type" varStatus="st">
									<option value="${type}" ${m.authList[0].memberType==type ? 'selected':''}>${type.name}</option>
								</c:forEach>
								</select>
							</td>
							<td>${m.enabled ? '활성':'비활성' }</td>
							<td><fmt:formatDate value="${m.joinDate}" pattern="yyyy-MM-dd"/></td>
						</tr>
						</c:if>
						</c:forEach>
						
					</table>
				<button class="btn btn-primary">업데이트</button>
				</form>
			</div>
		</div>
	</div>
</div>
<%@ include file="../layout/footer.jsp" %>