

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
	
	$(window).scroll(function() { 
		//alert("??");
	$('#banner').animate({top:$(window).scrollTop()+"px" },{queue: false, duration: 500});
	}); 
	
});

function purchase() {
	$(self.location).attr("href","/purchase/addPurchaseView?prodNo=${param.prodNo}");
}



</script>
<link rel="stylesheet" href="/css/admin.css" type="text/css">



	<!--  배너 따라다니기 -->
	<style type="text/css">
<!--
/* 	body {font-size:11pt; padding:0; margin:0;} */
/* 	h3 {color: #85144b; font-size: 14pt;} */

/* 	.contents {width: 800px; margin: 0 auto; height: auto; background-color: #e0e0e0; padding: 20px;} */
/* 	.contents img {float: left; padding: 30px;}	 */

 	#banner { position: absolute; font-size: 12pt; top: 5px; left: 0; z-index: 10; background:#ffffff; padding:5px;  text-align:center;} 
/* 	#banner > span {margin-bottom: 10px; display: block;} */
/* 	.banner_contents {min-height: 200px; background-color: #c0c0c0; padding: 5px;} */

-->
</style>



<title>Insert title here</title>
</head>



<body bgcolor="#ffffff" text="#000000">

<!-- <form name="detailForm"> -->

<jsp:include page="../layout/toolbar.jsp"/>


<div class="container">

<div class="row">





<div  style="position:relative;float:left;width:180px;top:-15px;right:0px;">
		 <div id="banner" >
        <h1  class="my-4">${pVo.prodName}</h1>
        <ul class="list-group">
		  <li class="list-group-item ">
		   <a href="#">상품정보</a>
		  </li>
		  <li class="list-group-item">
		    <a href="#review">상품리뷰</a>
		    <span class="badge">${page.totalCount }</span>
		  </li>
		  <li class="list-group-item">
		   <a href="#question">상품문의 </a>
		   <span class="badge">${page1.totalCount }</span>
		  </li>
		  <li class="list-group-item">
		   <a href="/purchase/addPurchaseView?prodNo=${param.prodNo}" >구매하기 </a>
		   <span class="badge"></span>
		  </li>
		</ul>

        <div class="list-group"  >
          
          <a href="#" class="list-group-item">Category 1</a>
          <a href="#" class="list-group-item">Category 2</a>
          <a href="#" class="list-group-item">Category 3</a>
          <div  class="list-group-item" id="plusfriend-addfriend-button">
          <a  href="javascript:void plusFriendChat()">
 			 <img src="https://developers.kakao.com/assets/img/about/logos/plusfriend/consult_small_yellow_pc.png"/>
			</a>
			</div>
        </div>
        
        
        </div>

      </div>




<!--  화면구성 div Start /////////////////////////////////////-->
	 <div class="col-lg-9"> <!--  추가부분 -->
	
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
		 <hr>
		  
<!-- 		  <div class="form-group"> -->
<!-- 		    <div class="col-sm-offset-4  col-sm-4 text-center"> -->
<%-- 		    <c:if test = "${fn:trim(pVo.quantity) != 0 && param.menu eq 'search' }"> --%>
<!-- 		      <button type="button" class="btn btn-primary"  >구 &nbsp;매</button> -->
<%-- 		      </c:if> --%>
<%-- 		      <c:if test = "${param.menu eq 'search' }" > --%>
<!-- 			  <a id="formreset" class="btn btn-primary btn" href="#" role="button">이&nbsp;전</a> -->
<%-- 			  </c:if> --%>
			  
<%-- 			  <c:if test = "${ param.menu eq 'manage' }" > --%>
<!-- 			  	<button type="button" class="btn btn-primary"  >확 &nbsp;인</button> -->
<%-- 			  </c:if> --%>
<!-- 		    </div> -->
<!-- 		  </div> -->
		</form>
		<!-- form Start /////////////////////////////////////-->
		</div>
 	</div>
 	</div>
	<!--  화면구성 div end /////////////////////////////////////-->
	
	
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	
	


<!-- Review List -->
<div class="container">
	
	<div class="row">
		<div class="col-lg-3">
		</div>
	
	<div class="col-lg-9" id = "review">
		<div>
		<br><br><br><br>
		<h1 class="text-left" >전체리뷰</h1>
		</div>
		<hr>
		
		<!-- form Start /////////////////////////////////////-->
		<form class="form-horizontal" name="detailForm" >
		<c:if test="${page.totalCount == 0 }">
		
	
		
		<div class="form-group" >
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
		<div >
		<div style="width:915px; height:115px;">
	<div style="width:200px; height: 15px">
	<p style="font-size :11px;">작성자 : ${list.reviewId } &nbsp; 작성일 : ${list.reviewDate }</p>
	</div>
			<div style="width:100px; height:100px; float:left">
			<img src="../images/uploadFiles/${list.reviewFile }" width="100" height="100">
			</div>
			
			<div style="width:800px; height:100px; float:right">
				<div style = "width:800px; height:50px; padding-top: 10px" ><p style="font-size: 12px;">[${list.reviewTitle }]</p></div>
				<div style = "width:800px; height:50px"><strong>${list.reviewContent }</strong></div>
			
			</div>
		</div>
		<hr>
		</div>
		 </div>
		</c:forEach>
</c:if>
	<c:if test="${page.totalCount != 0 }">
		<div style= "margin-left: 300px;">	
		<jsp:include page="../common/pageNavigator.jsp"/>
		</div>
		</c:if>	
		</form>
		
		</div>
		</div>
		</div>
		
		
		
		<!-- questionList -->
<br><br>
<div class="container">
	<div class="row">
		<div class="col-lg-3">
		</div>
	
	<div class="col-lg-9">
		<h1 class="text-left">상품문의</h1>
		<hr>
		
		<!-- form Start /////////////////////////////////////-->
		<form class="form-horizontal" name="detailForm" id="question">
		
		
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
		<div>
	<div style="width:915px; height:115px;">
	<div style="width:200px; height: 15px">
	<p style="font-size :11px;">작성자 : ${list.quesId } &nbsp; 작성일 : ${list.quesDate }</p>
	</div>
			
			<div style="width:800px; height:100px; float:left">
				<div style = "width:800px; height:50px;  padding-top: 10px"  ><p style="font-size: 12px;">[${list.quesTitle }]</p></div>
				<div style = "width:800px; height:50px"><strong>${list.quesContent }</strong></div>
			
			</div>
		</div>
		<hr>
		</div>
		</div>
</c:forEach>

<div style= "margin-left: 300px;">	
		<jsp:include page="../common/pageNavigator.jsp"/>
		</div>
		

<div class="form-group">
		    <div>
		      <button type="button" class="btn btn-primary"  >문의하기</button>
		</div>
		</div>
		
</c:if>
		
		
		
		
		</form>
		
		</div>
</div></div>

</body>
</html>