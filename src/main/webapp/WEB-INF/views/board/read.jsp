<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../include/header.jsp"%>


<h1>/board/read.jsp</h1>


<div class="box box-primary">
	<div class="box-header with-border">
		<h3 class="box-title">데헷-💋💋🐱‍👓🤢🐱‍ 게시판 본문이당  </h3>
		${vo.regdate }
	</div>
		<!-- 수정, 삭제 시 필요한 글번호 저장 -->
		<form role="form" method="post">
			<input type="hidden" name="bno" value="${vo.bno }">
		</form>
		

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
			<button type="submit" class="btn btn-warning">👌👌👌수정하기👌👌👌</button>
			<button type="submit" class="btn btn-danger">👌👌👌삭제하기👌👌👌</button>
			<button type="submit" class="btn btn-success">👌👌👌목록으로👌👌👌</button>
		</div>
	
</div>



<script type="text/javascript">
	$(document).ready(function(){
		//alert('제이쿼리 실행!!');
		
		//글번호 정보를 포함하는 폼태그
		//form[role="form"] 폼태그 중 이런 속성을 가지는 것을 가져와라
		//변수에 담기
		var fr = $('form[role="form"]');
		//alert(fr); //fr이 뭔지 확인하기 - object다
		//console.log(fr); //object는 콘솔로 확인
		
		
		//수정하기
		$(".btn-warning").click(function(){
			//alert('수정버튼 클릭');
			
			//fr 속성 바꾸기 action, method
			fr.attr("action", "/board/modify");
			fr.attr("method", "get");
			//속성을 바꾸고 서브밋하겠다
			fr.submit();
			
		});
		
		//삭제하기
		$(".btn-danger").click(function(){
			//alert('수정버튼 클릭');
			
			//fr 속성 바꾸기 action, method
			fr.attr("action", "/board/delete");
			fr.attr("method", "get");
			//속성을 바꾸고 서브밋하겠다
			fr.submit();
			
		});
		
		
		
		
		//목록으로 이동하기
		$(".btn-success").click(function(){
			location.href="/board/listAll";
		});
		
		//
		
		
	});
</script>

<%@ include file="../include/footer.jsp"%>
