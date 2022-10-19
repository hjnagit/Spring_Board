<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="../include/header.jsp"%>

<h1>board/regist.jsp</h1>


<div class="box box-primary">
	<div class="box-header with-border">
		<h3 class="box-title">글쓰기 데헷-💋💋💋💋👌🤞✌😎🎶🤦‍♀️😊😘🤎❤🐱‍👓🤢🐱‍ </h3>
	</div>

	<!-- action=""/속성 생략 => 다시 자신의 주소를 호출 -->
	<form role="form" action="/board/regist" method="post">
		<div class="box-body">
			<div class="form-group">
				<label for="exampleInputEmail1">🐱‍🐉🐱‍🐉🐱‍🐉🐱‍🐉제🐱‍🐉목‍🐱‍🐉🐱‍🐉🐱‍🐉🐱‍🐉 </label> <input
					type="text" class="form-control" id="exampleInputEmail1" name="title" 
					placeholder="제목을 입력하세용">
			</div>
			<div class="form-group">
				<label for="exampleInputPassword1">🤦‍♀️🤦‍♀️글🐱‍🐉🐱‍🐉쓴🐱‍🐉🐱‍🐉이🤦‍♀️🤦‍♀️</label> <input
					type="text" class="form-control" id="exampleInputPassword1" name="writer" 
					placeholder="이름을 입력하세용">
			</div>
			<div class="form-group">
				<label for="exampleInputPassword1">😘🐱‍🐉😘내🐱‍🐉😘🐱‍🐉용😘🐱‍🐉😘</label> <textarea 
					rows="10" cols="30" class="form-control" id="exampleInputPassword1" name="content" 
					placeholder="하고싶은 말 쓰세용"></textarea>
			</div>
		</div>

		<div class="box-footer">
			<button type="submit" class="btn btn-primary">👌👌👌글쓰기👌👌👌</button>
		</div>
	</form>
</div>

<%@ include file="../include/footer.jsp"%>


