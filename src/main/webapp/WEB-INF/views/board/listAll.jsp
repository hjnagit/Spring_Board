<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ include file="../include/header.jsp"%>





<h1>board/listAll.jsp</h1>

${pm }

<div class="box">
	<div class="box-header with-border">
		<h3 class="box-title">๐๐๋์ ๊ฒ์ํ๐๐๐๐๐๐ํค์ํค์ดํฐ๐๐๐๐ </h3>
		<h1 style="background-color: #760C0C; color: white; display: inline-block;">๐คขํค์ ์ซ์ดํ๋ ์ฌ๋๋ค ๋ชจ์๐คฎ</h3>
		<br><h1><a href="/board/regist">๊ธ์ฐ๊ธฐ</a></h1>
	</div>

	<div class="box-body">
		<table class="table table-bordered">
			<tbody>
				<tr>
					<th style="width: 45px">๋ฒํธ</th> 
					<th>๊ธ์ ๋ชฉ๐</th>
					<th>๊ธ์ด์ด๐</th>
					<th>์์ฑ์ผ๐</th>
					<th style="width: 60px">์กฐํ์</th>
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
		alert('๊ธ ์ฐ๊ธฐ ์๋ฃ!');
	}
	if(result == "MODOK"){
		alert('๊ธ ์์  ์๋ฃ!');
	}
	if(result == "DELOK"){
		alert('๊ธ ์ญ์  ์๋ฃ!');
	}

	
</script>

<%@ include file="../include/footer.jsp"%>