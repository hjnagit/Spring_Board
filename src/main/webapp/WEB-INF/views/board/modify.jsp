<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../include/header.jsp"%>


<h1>/board/read.jsp</h1>


<div class="box box-primary">
	<div class="box-header with-border">
		<h3 class="box-title">λ°ν·-πππ±βππ€’π±β κΈλ΄μ© μμ νκΈ°  </h3>
		${vo.regdate }
	</div>
	<form action="/board/modify" method="post">
		<div class="box-body">
			<div class="form-group">
				<label for="exampleInputEmail1">ππκΈλ²νΈππ</label> <input
					type="text" class="form-control" id="exampleInputEmail1" name="bno" 
					value="${vo.bno }" readonly>
			</div>
			<div class="form-group">
				<label for="exampleInputEmail1">π±βππ±βππ±βππ±βπμ π±βπλͺ©βπ±βππ±βππ±βππ±βπ </label> <input
					type="text" class="form-control" id="exampleInputEmail1" name="title" 
					value="${vo.title }">
			</div>
			<div class="form-group">
				<label for="exampleInputPassword1">π€¦ββοΈπ€¦ββοΈκΈπ±βππ±βπμ΄π±βππ±βπμ΄π€¦ββοΈπ€¦ββοΈ</label> <input
					type="text" class="form-control" id="exampleInputPassword1" name="writer" 
					value="${vo.writer }">
			</div>
			<div class="form-group">
				<label for="exampleInputPassword1">ππ±βππλ΄π±βπππ±βπμ©ππ±βππ</label> <textarea 
					rows="10" cols="30" class="form-control" id="exampleInputPassword1" name="content" 
					>${vo.content }</textarea>
			</div> 
		</div>

		<div class="box-footer">
			<button type="submit" class="btn btn-warning">πππμμ νκΈ°πππ</button>
		</div>
	</form>
</div>



<%@ include file="../include/footer.jsp"%>
