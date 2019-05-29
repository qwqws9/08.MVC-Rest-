
<%@ page contentType="text/html; charset=utf-8" %>
<html>
<head>
<meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  
  
  
  
  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<!--   <link rel="stylesheet" href="/resources/demos/style.css"> -->
  <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script
  src="https://code.jquery.com/jquery-2.1.4.js"
  integrity="sha256-siFczlgw4jULnUICcdm9gjQPZkw/YPDqhQ9+nAOScE4="
  crossorigin="anonymous"></script>
  
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<title>상품등록</title>

<link rel="stylesheet" href="/css/admin.css" type="text/css">


<link href="/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
  
 
<script type="text/javascript" >

function fncAddProduct(){
	//Form 유효성 검증
	
	var name = $('input[name="prodName"]').val();
	var detail = $('textarea[name="prodDetail"]').val();
	var manuDate = $('input[name="manuDate"]').val();
	var price = $('input[name="price"]').val();
	var quantity = $('input[name="quantity"]').val();
	

	if(name == null || name.length<1){
		alert("상품명은 반드시 입력하여야 합니다.");
		return;
	}
	if(detail == null || detail.length<1){
		alert("상품상세정보는 반드시 입력하여야 합니다.");
		return;
	}
	if(manuDate == null || manuDate.length<1){
		alert("제조일자는 반드시 입력하셔야 합니다.");
		return;
	}
	if(price == null || price.length<1){
		alert("가격은 반드시 입력하셔야 합니다.");
		return;
	}
	if(quantity == "" ) {
		alert("상품수량은 반드시 입력하셔야 합니다.");
		return;
	}
	
	$('form').attr("method","POST").attr("action","/product/addProduct").submit();
}

	$( function(){
		$('#formreset').on('click', function() {
			$('form')[0].reset();
		});
		

		$('.form-group button').on('click', function(){
			fncAddProduct();
		});
		
		  
			
		
	
		
		
	});
	
	
	$( function() {
	   
	      $( "#manuDate" ).datepicker( { dateFormat: 'yy-mm-dd' });
	   
	  } );
	
	
</script>

</head>

<body bgcolor="#ffffff" text="#000000">
<jsp:include page="../layout/toolbar.jsp"/>

	<!--  화면구성 div Start /////////////////////////////////////-->
	<div class="container">
	
		<h1 class="text-center">상 품 등 록</h1>
		
		<!-- form Start /////////////////////////////////////-->
		<form class="form-horizontal" name="detailForm" enctype="multipart/form-data">
		  <div class="form-group">
		    <label for="userId" class="col-sm-offset-1 col-sm-3 control-label">상 품 명</label>
		    <div class="col-sm-4">		    
		  
<!--   				<label class="control-label" for="userId" ></label> -->
 				 <input type="text" class="form-control" id="prodName" name="prodName" placeholder="상품명입력">
	
		     
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="password" class="col-sm-offset-1 col-sm-3 control-label">상세정보</label>
		    <div class="col-sm-4">
		    <textarea  class="form-control" rows="10" cols="10" id="prodDetail" name="prodDetail" ></textarea>
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="password2" class="col-sm-offset-1 col-sm-3 control-label">제조일자</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="manuDate" name="manuDate" placeholder="제조일자" readonly="readonly" >
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="userName" class="col-sm-offset-1 col-sm-3 control-label">가격</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="price" name="price" placeholder="가격">
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="ssn" class="col-sm-offset-1 col-sm-3 control-label">상품 수량</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="quantity" name="quantity" placeholder="상품 수량">
<!-- 		      <span id="helpBlock" class="help-block"> -->
<!-- 		      	 <strong class="text-danger">" -  " 제외 13자리입력하세요</strong> -->
<!-- 		      </span> -->
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="ssn" class="col-sm-offset-1 col-sm-3 control-label">상품이미지</label>
		    <div class="col-sm-4">
		      <input type="file" class="form-control" id="imageName" name="imageName">
		    </div>
		  </div>
		  
		 
		  
		  <div class="form-group">
		    <div class="col-sm-offset-4  col-sm-4 text-center">
		      <button type="button" class="btn btn-primary"  >등 &nbsp;록</button>
			  <a id="formreset" class="btn btn-primary btn" href="#" role="button">취&nbsp;소</a>
		    </div>
		  </div>
		</form>
		<!-- form Start /////////////////////////////////////-->
		
 	</div>
	<!--  화면구성 div end /////////////////////////////////////-->
	


</body>
</html>