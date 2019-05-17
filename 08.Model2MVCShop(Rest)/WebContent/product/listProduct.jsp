

<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<html>
<head>
<title>상품 목록조회</title>

<link rel="stylesheet" href="/css/admin.css" type="text/css">
<script
  src="https://code.jquery.com/jquery-2.1.4.js"
  integrity="sha256-siFczlgw4jULnUICcdm9gjQPZkw/YPDqhQ9+nAOScE4="
  crossorigin="anonymous"></script>
  
   <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
   
<script type="text/javascript">

// 검색 / page 두가지 경우 모두 Form 전송을 위해 JavaScrpt 이용  
function fncGetList(currentPage) {
	
	$('#currentPage').val(currentPage);
	
	$('form').attr("method","POST").attr("action","/product/listProduct").submit();
	
	
}
		

	$( function(){
		
		$( ".ct_list_pop td:nth-child(3)" ).on('mouseleave' , function() {
			
				$("#zzzz").tooltip("disable");      
			
			
		});
		
		$( ".ct_list_pop td:nth-child(3)" ).on('mouseover' , function() {
			
			//alert("이벤트발생");
		
			//alert( $( $('.ct_list_pop td:nth-child(1)')[    $('.ct_list_pop td:nth-child(1)').index(this)    ]).text().trim() );
			var prodNo = $( $('.ct_list_pop td:nth-child(1)')[$('.ct_list_pop td:nth-child(3)').index(this)]).text().trim();
			//alert(prodNo);
			$.ajax( 
					{
						url : "/product/json/getProduct/"+prodNo ,
						method : "GET" ,
						dataType : "json" ,
						headers : {
							"Accept" : "application/json",
							"Content-Type" : "application/json"
						},
						success : function(JSONData , status) {
								
							//alert(status);
							var displayValue = '\'<img width=\"200\" height=\"200\" src=\"../images/uploadFiles/'
														+JSONData.fileName
														
														+"\"/>'";
														
														//alert(displayValue);
							//Debug...									
							//alert(displayValue);
							//$("h3").remove();
							$("#zzzz").tooltip({ 
								track: true,
								content: displayValue 
								});

							//$( "#"+prodNo+"" ).html(displayValue);  img[alt]
						}
				});
				////////////////////////////////////////////////////////////////////////////////////////////
			
	});

		
		
		
		
		
	
		
		
		
		
		
		$( ".ct_list_pop td:nth-child(1)" ).on("click" , function() {
			
			//alert( $( $('.ct_list_pop td:nth-child(1)')[    $('.ct_list_pop td:nth-child(1)').index(this)    ]).text().trim() );
			var prodNo = $( $('.ct_list_pop td:nth-child(1)')[$('.ct_list_pop td:nth-child(1)').index(this)]).text().trim();
			$.ajax( 
					{
						url : "/product/json/getProduct/"+prodNo ,
						method : "GET" ,
						dataType : "json" ,
						headers : {
							"Accept" : "application/json",
							"Content-Type" : "application/json"
						},
						success : function(JSONData , status) {

							var displayValue = "<h3>"
														+"상 품 명 : "+JSONData.prodName+"<br/>"
														+"상품정보 : "+JSONData.prodDetail+"<br/>"
														+"가    격 : "+JSONData.price+"<br/>"
														+"수    량 : "+JSONData.quantity+"<br/>"
														+"</h3>";
														
														//alert(displayValue);
							//Debug...									
							//alert(displayValue);
							$("h3").remove();
							$( "#"+prodNo+"" ).html(displayValue);
						}
				});
				////////////////////////////////////////////////////////////////////////////////////////////
			
	});
		
		
		
		
		
		$('.ct_list_admin td:nth-child(1)').on('click', function(){
			$(self.location).attr("href","/purchase/getPurchase?tranNo="+$(this).text().trim());			
		});
		
		$('.ct_list_admin td:nth-child(3)').on('click', function(){
			$(self.location).attr("href","/product/getProduct?menu=${param.menu}&prodNo="+$(this).text().trim());			
		});
		
		$('.ct_list_pop td:nth-child(9):contains("배송하기")').on('click', function(){
			
			//var temp = $('.ct_list_admin td:nth-child(9)').index(this);
			//alert( $('.ct_list_pop td:nth-child(9)').index(this)    );
			//alert(  $(  $('.ct_list_pop td:nth-child(1)')[$('.ct_list_pop td:nth-child(9)').index(this)]).text().trim() );
			
			var temp = $(  $('.ct_list_pop td:nth-child(1)')[$('.ct_list_pop td:nth-child(9)').index(this)]).text().trim();
			
			//alert(  $(  $('.ct_list_admin td:nth-child(1)')[temp]).text().trim() );
			
			
			
			$(self.location).attr("href","/purchase/updateTranCode?code=3&tranNo="+temp);			
		});
	});
	




</script>
</head>

<body bgcolor="#ffffff" text="#000000">

<div style="width:98%; margin-left:10px;">

<form name="detailForm">

<table width="100%" height="37" border="0" cellpadding="0"	cellspacing="0">
	<tr>
		<td width="15" height="37">
			<img src="/images/ct_ttl_img01.gif" width="15" height="37"/>
		</td>
		<td background="/images/ct_ttl_img02.gif" width="100%" style="padding-left:10px;">
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td width="93%" class="ct_ttl01">
					
							상품 관리
					
					</td>
				</tr>
			</table>
		</td>
		<td width="12" height="37">
			<img src="/images/ct_ttl_img03.gif" width="12" height="37"/>
		</td>
	</tr>
</table>


<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top:10px;">
	<tr>
		
		<td align="right">
		<select name="searchCondition" class="ct_input_g" style="width:80px">
				<option value="0" ${ ! empty search.searchCondition && search.searchCondition==0 ? "selected" : "" }>상품번호</option>
				<option value="1" ${ ! empty search.searchCondition && search.searchCondition==1 ? "selected" : "" }>상품명</option>
				<option value="2" ${ ! empty search.searchCondition && search.searchCondition==2 ? "selected" : "" }>상품가격</option>
			</select>
		
			<input type="text" name="searchKeyword"
			value="${! empty search.searchKeyword ? search.searchKeyword : ""}"
			class="ct_input_g" style="width:200px; height:19px" />
		</td>
	
		
		<td align="right" width="70">
			<table border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td width="17" height="23">
						<img src="/images/ct_btnbg01.gif" width="17" height="23">
					</td>
					<td background="/images/ct_btnbg02.gif" class="ct_btn01" style="padding-top:3px;">
						<a href="javascript:fncGetList(1);">검색</a>
					</td>
					<td width="14" height="23">
						<img src="/images/ct_btnbg03.gif"  width="14" height="23">
					</td>
				</tr>
			</table>
		</td>
	</tr>
</table>


<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top:10px;">
	<tr>
		<td colspan="11" >전체 ${page.totalCount} 건수, 현재 ${page.currentPage} 페이지</td>
	</tr>
	
	
	<!-- 관리자 접근시 -->
	<c:if test="${param.menu == 'admin' }">
	
	<tr>
		<td class="ct_list_b" width="100">상품번호</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b" width="150">주문번호</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b" width="150">구매자아이디</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b">구매일시</td>	
		<td class="ct_line02"></td>
		<td class="ct_list_b">현재상태</td>	
	</tr>
	<tr>
		<td  colspan="11" bgcolor="808285" height="1"></td>
	</tr>
	
	${param.menu }
	
	
	
	<c:forEach var="list" items="${list }">

	<tr class="ct_list_pop">  
		<td align="center">
			 ${ list.purchaseProd.prodNo}  
		</td>
		<td></td>
		<td align="left">
		${list.tranNo}</td>
		<td></td>
		<td align="left">${list.buyer.userId}</td>
		<td></td>
		<td align="left">${list.orderDate}</td>
		<td></td>
		<td align="left">
		<c:if test = "${fn:trim(list.tranCode) == 1 }" >
			판매중
			</c:if>
			<c:if test = "${fn:trim(list.tranCode) == 2 }" >
			 배송하기
				</c:if>
			<c:if test = "${fn:trim(list.tranCode) == 3 }" >
			배송중
			</c:if>
			<c:if test = "${fn:trim(list.tranCode) == 4 || fn:trim(list.tranCode) == 5 }" >
			배송완료
			</c:if>
		</td>			
	</tr>
	<tr>
		<td id="${ list.purchaseProd.prodNo}" colspan="11" bgcolor="D6D7D6" height="1"></td>
	</tr>
	</c:forEach>
	</c:if>
	
	
	
	
	<!--  //////////////////////////////////////////////////////////// -->
	
	
	
	
	<!-- 유저 접근시 -->
	
	
	<c:if test="${param.menu != 'admin' }">
	<tr>
		<td class="ct_list_b" width="100">No</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b" width="150">상품명</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b" width="150">가격</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b">등록일</td>	
		<td class="ct_line02"></td>
		<td class="ct_list_b">현재상태</td>	
	</tr>
	<tr>
		<td colspan="11" bgcolor="808285" height="1"></td>
	</tr>
	
	${param.menu }
	
	
	
	
	<c:forEach var="list" items="${list }">

	<tr class="ct_list_pop">  
		<td align="center">${list.prodNo}</td>
		<td></td>
		<td align="left">
		<c:if test = "${fn:trim(list.quantity) != 0 || user.role == 'admin'}" >
				<a id="zzzz" title='' href="/product/getProduct?menu=${param.menu}&prodNo=${list.prodNo}">${list.prodName}</a>
		</c:if>
			
		<c:if test = "${fn:trim(list.quantity) == 0 && user.role == 'user'}" >
				${list.prodName}
		</c:if>
			
		</td>
		<td></td>
		<td align="left">${list.price}</td>
		<td></td>
		<td align="left">${list.regDate}</td>
		<td></td>
		<td align="left">
		<c:if test = "${fn:trim(list.quantity) != 0 }" >
				판매중
			</c:if>
			<c:if test = "${fn:trim(list.quantity) == 0 }" >
				재고없음 
			</c:if>
		</td>			
	</tr>
	<tr>
		<td id="${list.prodNo}" colspan="11" bgcolor="D6D7D6" height="1"></td>
	</tr>
	</c:forEach>


</c:if>
</table>

		<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top:10px;">
	<tr>
		<td align="center">
		
		
		<input type="hidden" id="currentPage" name="currentPage" value=""/>
		<input type="hidden" id="menu" name="menu" value="${param.menu}"/>
		
		<jsp:include page="../common/pageNavigator.jsp"/>
		
			
		
    	</td>
	</tr>
</table>
<!--  페이지 Navigator 끝 -->

</form>

</div>
</body>
</html>
