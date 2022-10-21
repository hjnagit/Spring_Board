<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ include file="../include/header.jsp"%>





<h1>board/listAll.jsp</h1>



<div class="box">
	<div class="box-header with-border">
		<h3 class="box-title">🙌😘나의 게시판🙌😘😍🙌😘😍키움헤이터🙌😘🙌😘 </h3>
		<h1 style="background-color: #760C0C; color: white; display: inline-block;">🤢키움 싫어하는 사람들 모임🤮</h3>
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
			<li><a href="#">«</a></li>
			<li><a href="#">1</a></li>
			<li><a href="#">2</a></li>
			<li><a href="#">3</a></li>
			<li><a href="#">»</a></li>
		</ul>
	</div>
</div>

<script type="text/javascript">
	//alert(${msg});
	var result1 = "${msg}";
	var result2 = "${msgUpdate}";
	var result3 = "${msgDelete}";
	
	
	if(result1 == "OK"){
		alert('글 쓰기 완료!');
	}
	if(result2 == "OK"){
		alert('글 수정 완료!');
	}
	if(result3 == "OK"){
		alert('글 삭제 완료!');
	}

	
</script>

<%@ include file="../include/footer.jsp"%>