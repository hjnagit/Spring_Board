<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../include/header.jsp"%>


<h1>/board/read.jsp</h1>


<div class="box box-primary">
	<div class="box-header with-border">
		<h3 class="box-title">데헷-💋💋🐱‍👓🤢🐱‍ 글내용 수정하기  </h3>
		${vo.regdate }
	</div>
	<form action="/board/modify" method="post">
		<div class="box-body">
			<div class="form-group">
				<label for="exampleInputEmail1">😎😎글번호😎😎</label> <input
					type="text" class="form-control" id="exampleInputEmail1" name="bno" 
					value="${vo.bno }" readonly>
			</div>
			<div class="form-group">
				<label for="exampleInputEmail1">🐱‍🐉🐱‍🐉🐱‍🐉🐱‍🐉제🐱‍🐉목‍🐱‍🐉🐱‍🐉🐱‍🐉🐱‍🐉 </label> <input
					type="text" class="form-control" id="exampleInputEmail1" name="title" 
					value="${vo.title }">
			</div>
			<div class="form-group">
				<label for="exampleInputPassword1">🤦‍♀️🤦‍♀️글🐱‍🐉🐱‍🐉쓴🐱‍🐉🐱‍🐉이🤦‍♀️🤦‍♀️</label> <input
					type="text" class="form-control" id="exampleInputPassword1" name="writer" 
					value="${vo.writer }">
			</div>
			<div class="form-group">
				<label for="exampleInputPassword1">😘🐱‍🐉😘내🐱‍🐉😘🐱‍🐉용😘🐱‍🐉😘</label> <textarea 
					rows="10" cols="30" class="form-control" id="exampleInputPassword1" name="content" 
					>${vo.content }</textarea>
			</div> 
		</div>

		<div class="box-footer">
			<button type="submit" class="btn btn-warning">👌👌👌수정하기👌👌👌</button>
		</div>
	</form>
</div>



<%@ include file="../include/footer.jsp"%>
