<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../include/header.jsp"%>


<h1>/board/read.jsp</h1>


<div class="box box-primary">
	<div class="box-header with-border">
		<h3 class="box-title">λ°ν·-πππ±βππ€’π±β κ²μν λ³Έλ¬Έμ΄λΉ  </h3>
		${vo.regdate }
	</div>
		<!-- μμ , μ­μ  μ νμν κΈλ²νΈ μ μ₯ -->
		<form role="form" method="post">
			<input type="hidden" name="bno" value="${vo.bno }">
		</form>
		

		<div class="box-body">
			<div class="form-group">
				<label for="exampleInputEmail1">π±βππ±βππ±βππ±βπμ π±βπλͺ©βπ±βππ±βππ±βππ±βπ </label> <input
					type="text" class="form-control" id="exampleInputEmail1" name="title" 
					readonly value="${vo.title }">
			</div>
			<div class="form-group">
				<label for="exampleInputPassword1">π€¦ββοΈπ€¦ββοΈκΈπ±βππ±βπμ΄π±βππ±βπμ΄π€¦ββοΈπ€¦ββοΈ</label> <input
					type="text" class="form-control" id="exampleInputPassword1" name="writer" 
					readonly value="${vo.writer }">
			</div>
			<div class="form-group">
				<label for="exampleInputPassword1">ππ±βππλ΄π±βπππ±βπμ©ππ±βππ</label> <textarea 
					rows="10" cols="30" class="form-control" id="exampleInputPassword1" name="content" 
					readonly>${vo.content }</textarea>
			</div> 
		</div>

		<div class="box-footer">
			<button type="submit" class="btn btn-warning">πππμμ νκΈ°πππ</button>
			<button type="submit" class="btn btn-danger">πππμ­μ νκΈ°πππ</button>
			<button type="submit" class="btn btn-success">πππλͺ©λ‘μΌλ‘πππ</button>
		</div>
	
</div>



<script type="text/javascript">
	$(document).ready(function(){
		//alert('μ μ΄μΏΌλ¦¬ μ€ν!!');
		
		//κΈλ²νΈ μ λ³΄λ₯Ό ν¬ν¨νλ νΌνκ·Έ
		//form[role="form"] νΌνκ·Έ μ€ μ΄λ° μμ±μ κ°μ§λ κ²μ κ°μ ΈμλΌ
		//λ³μμ λ΄κΈ°
		var fr = $('form[role="form"]');
		//alert(fr); //frμ΄ λ­μ§ νμΈνκΈ° - objectλ€
		//console.log(fr); //objectλ μ½μλ‘ νμΈ
		
		
		//μμ νκΈ°
		$(".btn-warning").click(function(){
			//alert('μμ λ²νΌ ν΄λ¦­');
			
			//fr μμ± λ°κΎΈκΈ° action, method
			fr.attr("action", "/board/modify");
			fr.attr("method", "get");
			//μμ±μ λ°κΎΈκ³  μλΈλ°νκ² λ€
			fr.submit();
			
		});
		
		//μ­μ νκΈ°
		$(".btn-danger").click(function(){
			//alert('μμ λ²νΌ ν΄λ¦­');
			
			//fr μμ± λ°κΎΈκΈ° action, method
			fr.attr("action", "/board/delete");
			fr.submit();
			
		});
		
		
		
		
		//λͺ©λ‘μΌλ‘ μ΄λνκΈ°
		$(".btn-success").click(function(){
			location.href="/board/listPage";
		});
		
		//
		
		
	});
</script>

<%@ include file="../include/footer.jsp"%>
