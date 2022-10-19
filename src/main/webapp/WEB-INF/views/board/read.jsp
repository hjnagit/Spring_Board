<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../include/header.jsp"%>


<h1>/board/read.jsp</h1>


<div class="box box-primary">
	<div class="box-header with-border">
		<h3 class="box-title">데헷-💋💋🐱‍👓🤢🐱‍ 게시판 본문이당  </h3>
		${vo.regdate }
	</div>

		<div class="box-body">
			<div class="form-group">
				<label for="exampleInputEmail1">🐱‍🐉🐱‍🐉🐱‍🐉🐱‍🐉제🐱‍🐉목‍🐱‍🐉🐱‍🐉🐱‍🐉🐱‍🐉 </label> <input
					type="text" class="form-control" id="exampleInputEmail1" name="title" 
					readonly value="${vo.title }">
			</div>
			<div class="form-group">
				<label for="exampleInputPassword1">🤦‍♀️🤦‍♀️글🐱‍🐉🐱‍🐉쓴🐱‍🐉🐱‍🐉이🤦‍♀️🤦‍♀️</label> <input
					type="text" class="form-control" id="exampleInputPassword1" name="writer" 
					readonly value="${vo.writer }">
			</div>
			<div class="form-group">
				<label for="exampleInputPassword1">😘🐱‍🐉😘내🐱‍🐉😘🐱‍🐉용😘🐱‍🐉😘</label> <textarea 
					rows="10" cols="30" class="form-control" id="exampleInputPassword1" name="content" 
					readonly>${vo.content }</textarea>
			</div> 
		</div>

		<div class="box-footer">
			<button type="submit" class="btn btn-primary">👌👌👌글쓰기👌👌👌</button>
		</div>
	
</div>

<%@ include file="../include/footer.jsp"%>
