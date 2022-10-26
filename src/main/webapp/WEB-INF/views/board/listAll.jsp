<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ include file="../include/header.jsp"%>





<h1>board/listAll.jsp</h1>

${pm }

<div class="box">
	<div class="box-header with-border">
		<h3 class="box-title">🙌😘나의 게시판🙌😘😍🙌😘😍키움헤이터🙌😘🙌😘 </h3>
		<h1 style="background-color: #760C0C; color: white; display: inline-block;">🤢키움 싫어하는 사람들 모임🤮</h3>
		<br><h1><a href="/board/regist">글쓰기</a></h1>
	</div>

	<div class="box-body">
		<table class="table table-bordered">
			<tbody>
				<tr>
					<th style="width: 45px">번호</th> 
					<th>글제목🙌</th>
					<th>글쓴이😘</th>
					<th>작성일😍</th>
					<th style="width: 60px">조회수</th>
				</tr>
				<c:forEach var="vo" items="${boardList }">
					<tr>
						<td>${vo.bno }</td>
						<td>
							<a href="/board/read?bno=${vo.bno }">${vo.title }</a>
						</td>
						<td>${vo.writer }</td>
						<td>
							<fmt:formatDate pattern="yy-MM-dd HH:mm" value="${vo.regdate }"/>
						</td>
						<td><span class="badge bg-red">${vo.viewcnt }</span></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>

	<div class="box-footer clearfix">
		<ul class="pagination pagination-sm no-margin pull-right">
			<c:if test="${pm.prev }">
				<li><a href="listPage?page=${pm.startPage-1 }">&laquo;</a></li>
			</c:if>
			<c:forEach var="idx" begin="${pm.startPage }" end="${pm.endPage }">
				<%-- <li <c:out value="${pm.vo.page == idx ? 'class=active':'' }"/>> --%>
				<li ${pm.vo.page == idx ? 'class=active':'' }>
					<a href="listPage?page=${idx }">${idx }</a>
				</li>
			</c:forEach>
			<c:if test="${pm.next }">
				<li><a href="listPage?page=${pm.endPage+1 }">&raquo;</a></li>
			</c:if>
		</ul>
	</div>
</div>

<script type="text/javascript">
	//alert(${msg});
	var result = "${msg}";
	
	
	if(result == "OK"){
		alert('글 쓰기 완료!');
	}
	if(result == "MODOK"){
		alert('글 수정 완료!');
	}
	if(result == "DELOK"){
		alert('글 삭제 완료!');
	}

	
</script>

<%@ include file="../include/footer.jsp"%>