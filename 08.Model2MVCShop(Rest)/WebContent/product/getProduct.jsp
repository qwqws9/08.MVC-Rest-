

<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>


<html>
<head>
<script
  src="https://code.jquery.com/jquery-2.1.4.js"
  integrity="sha256-siFczlgw4jULnUICcdm9gjQPZkw/YPDqhQ9+nAOScE4="
  crossorigin="anonymous"></script>
  <link href="/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
<script type="text/javascript">

// 검색 / page 두가지 경우 모두 Form 전송을 위해 JavaScrpt 이용  
function fncGetList(currentPage) {
	
	$('input[name="currentPage"]').val(currentPage);
	//$('form').attr("method", "POST").attr("action","/product/getProduct");
	move();
	//document.getElementById("currentPage").value = currentPage;
   	//document.detailForm.submit();		
}

function move() {
	$('form').attr("method", "POST").attr("action","/product/getProduct").submit();
}





function fncGet1List(currentPage1) {
	$('input[name="currentPage1"]').val(currentPage1);
	//$('form').attr("method", "POST").attr("action","/product/getProduct");
	move();
}


<!--  <a href="/product/listProduct?menu=manage">확인</a> -->
<!-- <a href="/purchase/addPurchaseView?prodNo=${param.prodNo}">구매</a>  -->
<!-- <a href="/quest/addBoardView?prodNo=${pVo.prodNo}">문의하기</a>  -->

$( function(){
	$('td.ct_btn01:contains("확인")').on('click', function(){
		$(self.location).attr("href","/product/listProduct?menu=manage");
	});
	
	$('td.ct_btn01:contains("구매")').on('click', function(){
		$(self.location).attr("href","/purchase/addPurchaseView?prodNo=${param.prodNo}");
	});
	
	$('td.ct_btn01:contains("문의하기")').on('click', function(){
		$(self.location).attr("href","/quest/addBoardView?prodNo=${pVo.prodNo}");
	});
});



</script>
<link rel="stylesheet" href="/css/admin.css" type="text/css">

<title>Insert title here</title>
</head>

<body bgcolor="#ffffff" text="#000000">

<!-- <form name="detailForm"> -->

<jsp:include page="../layout/toolbar.jsp"/>


<!--  화면구성 div Start /////////////////////////////////////-->
	<div class="container">
	
		<h1 class="text-center">상품상세조회</h1>
		
		<!-- form Start /////////////////////////////////////-->
		<form class="form-horizontal" name="detailForm" >
		<input type = "hidden" name = "prodNo" value = "${pVo.prodNo }">
		<input type = "hidden" name = "menu" value = "search">
		<input type="hidden" id="currentPage" name="currentPage" value=""/>
		<input type="hidden" id="currentPage1" name="currentPage1" value=""/>
		  <div class="form-group">
		    <label for="userId" class="col-sm-offset-1 col-sm-3 control-label">상품번호</label>
		    <div class="col-sm-4">		    
		  
<!--   				<label class="control-label" for="userId" ></label> -->
 				 <input type="text" class="form-control" readonly="readonly" value="${pVo.prodNo}">
	
		     
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="password" class="col-sm-offset-1 col-sm-3 control-label">상품명</label>
		    <div class="col-sm-4">
		    <input type="text" class="form-control" readonly="readonly" value="${pVo.prodName}">
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="password2" class="col-sm-offset-1 col-sm-3 control-label">상품이미지</label>
		    <div class="col-sm-4">
		      <img height="200" width="200" src="/images/uploadFiles/../../images/uploadFiles/${pVo.fileName}"/>
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="userName" class="col-sm-offset-1 col-sm-3 control-label">상품상세정보</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" readonly="readonly" value="${pVo.prodDetail}">
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="ssn" class="col-sm-offset-1 col-sm-3 control-label">제조일자</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control"readonly="readonly" value="${pVo.manuDate}">
<!-- 		      <span id="helpBlock" class="help-block"> -->
<!-- 		      	 <strong class="text-danger">" -  " 제외 13자리입력하세요</strong> -->
<!-- 		      </span> -->
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="ssn" class="col-sm-offset-1 col-sm-3 control-label">가격</label>
		    <div class="col-sm-4">
		       <input type="text" class="form-control"readonly="readonly" value="${pVo.price}">
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="ssn" class="col-sm-offset-1 col-sm-3 control-label">등록일자</label>
		    <div class="col-sm-4">
		       <input type="text" class="form-control"readonly="readonly" value="${pVo.regDate}">
		    </div>
		  </div>
		 
		  
		  <div class="form-group">
		    <div class="col-sm-offset-4  col-sm-4 text-center">
		    <c:if test = "${fn:trim(pVo.quantity) != 0 && param.menu eq 'search' }">
		      <button type="button" class="btn btn-primary"  >구 &nbsp;매</button>
		      </c:if>
		      <c:if test = "${param.menu eq 'search' }" >
			  <a id="formreset" class="btn btn-primary btn" href="#" role="button">이&nbsp;전</a>
			  </c:if>
			  
			  <c:if test = "${ param.menu eq 'manage' }" >
			  	<button type="button" class="btn btn-primary"  >확 &nbsp;인</button>
			  </c:if>
		    </div>
		  </div>
		</form>
		<!-- form Start /////////////////////////////////////-->
		
 	</div>
	<!--  화면구성 div end /////////////////////////////////////-->
	

<!-- Review List -->
<div class="container">
	
		<h1 class="text-center">상품리뷰</h1>
		
		<!-- form Start /////////////////////////////////////-->
		<form class="form-horizontal" name="detailForm" >
		<c:if test="${page.totalCount == 0 }">
		
	
		
		<div class="form-group">
		    <label for="ssn" class="col-sm-offset-1 col-sm-3 control-label"></label>
		    <div class="col-sm-4">
		      상품 리뷰가 등록되어있지 않습니다.
		    </div>
		  </div>
			</c:if>
			
			<c:if test="${page.totalCount != 0 }">
			<c:forEach var="list" items="${list }">
		<div class="form-group">
		 <label for="ssn" class="col-sm-offset-1 col-sm-3 control-label"></label>
		<div class="col-sm-4">
		<div style="width:915px; height:115px;">
	<div style="width:200px; height: 15px">
	<p style="font-size :11px;">작성자 : ${list.reviewId } &nbsp; 작성일 : ${list.reviewDate }</p>
	</div>
			<div style="width:100px; height:100px; float:left">
			<img src="../images/uploadFiles/122b4720-f9ba-4e2e-aa28-7d872949057f_flower.jpg" width="100" height="100">
			</div>
			
			<div style="width:800px; height:100px; float:right">
				<div style = "width:800px; height:50px"><p style="font-size: 12px;">[${list.reviewTitle }]</p></div>
				<div style = "width:800px; height:50px"><strong>${list.reviewContent }</strong></div>
			
			</div>
		</div>
		<hr>
		</div>
		 </div>
		</c:forEach>
</c:if>
	<c:if test="${page.totalCount != 0 }">	
		<jsp:include page="../common/pageNavigator.jsp"/>
		</c:if>	
		</form>
		
		</div>
		
		
		
		
		
		<!-- questionList -->
<br><br>
<div class="container">
	
		<h1 class="text-center">상품문의</h1>
		
		<!-- form Start /////////////////////////////////////-->
		<form class="form-horizontal" name="detailForm" >
		
		
		<c:if test="${page1.totalCount == 0 }">
		<div class="form-group">
		    <label for="ssn" class="col-sm-offset-1 col-sm-3 control-label"></label>
		    <div class="col-sm-4">
		      상품 문의가 등록되어있지 않습니다.
		    </div>
		  </div>
		  <div class="form-group">
		    <div class="col-sm-offset-4  col-sm-4 text-center">
		      <button type="button" class="btn btn-primary"  >문의하기</button>
		</div>
		</div>
		</c:if>
		
		<c:if test="${page1.totalCount != 0 }">
		
<c:forEach var="list" items="${questlist }">
<div class="form-group">
		 <label for="ssn" class="col-sm-offset-1 col-sm-3 control-label"></label>
		<div class="col-sm-4">
	<div style="width:915px; height:115px;">
	<div style="width:200px; height: 15px">
	<p style="font-size :11px;">작성자 : ${list.quesId } &nbsp; 작성일 : ${list.quesDate }</p>
	</div>
			
			<div style="width:800px; height:100px; float:left">
				<div style = "width:800px; height:50px"><p style="font-size: 12px;">[${list.quesTitle }]</p></div>
				<div style = "width:800px; height:50px"><strong>${list.quesContent }</strong></div>
			
			</div>
		</div>
		<hr>
		</div>
		</div>
</c:forEach>


<div class="form-group">
		    <div class="col-sm-offset-4  col-sm-4 text-center">
		      <button type="button" class="btn btn-primary"  >문의하기</button>
		</div>
		</div>


</c:if>
		
		페이지 네비게이션하기
		
		
		</form>
		
		</div>


</body>
</html>