

<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<html>
<head>
<title>구매 목록조회</title>

<link rel="stylesheet" href="/css/admin.css" type="text/css">
<script
  src="https://code.jquery.com/jquery-2.1.4.js"
  integrity="sha256-siFczlgw4jULnUICcdm9gjQPZkw/YPDqhQ9+nAOScE4="
  crossorigin="anonymous"></script>
  
<script type="text/javascript">

	function fncGetList(currentPage) {
		$('input[name="currentPage"]').val(currentPage);
		$('form').attr("method","POST").attr("action","/purchase/listPurchase").submit();
		
	}
	
	
	$( function() {
		$('.ct_list_pop td:nth-child(1)').on('click', function(){
			$(self.location).attr("href","/purchase/getPurchase?tranNo="+$(this).text().trim() );
		})
		
		
		$('.ct_list_pop td:nth-child(3)').on('click', function(){
			$(self.location).attr("href","/user/getUser?userId="+$(this).text().trim() );
		})
	});
</script>
</head>

<body bgcolor="#ffffff" text="#000000">

<div style="width: 98%; margin-left: 10px;">

<form name="detailForm">

<table width="100%" height="37" border="0" cellpadding="0"	cellspacing="0">
	<tr>
		<td width="15" height="37"><img src="/images/ct_ttl_img01.gif"width="15" height="37"></td>
		<td background="/images/ct_ttl_img02.gif" width="100%" style="padding-left: 10px;">
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td width="93%" class="ct_ttl01">구매 목록조회</td>
				</tr>
			</table>
		</td>
		<td width="12" height="37"><img src="/images/ct_ttl_img03.gif"	width="12" height="37"></td>
	</tr>
</table>

<table width="100%" border="0" cellspacing="0" cellpadding="0"	style="margin-top: 10px;">
	<tr>
		<td colspan="11" >전체 ${page.totalCount} 건수, 현재 ${page.currentPage} 페이지</td>
	</tr>
	<tr>
		<td class="ct_list_b" width="100">주문번호</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b" width="150">회원ID</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b" width="150">회원명</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b">전화번호</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b">배송현황</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b">정보수정</td>
	</tr>
	<tr>
		<td colspan="11" bgcolor="808285" height="1"></td>
	</tr>
	
	<c:forEach var = "vo" items="${list }">
	
	
	<tr class="ct_list_pop">
		<td align="center">
			${vo.tranNo}
		</td>
		<td></td>
		<td align="left">
			${vo.buyer.userId}
		</td>
		<td></td>
		<td align="left">${vo.buyer.userName}</td>
		<td></td>
		<td align="left">${vo.buyer.phone}</td>
		<td></td>
		<td align="left">
		
		<c:if test = "${fn:trim(vo.tranCode) == 2 }">
				현재 구매완료 상태입니다.
		</c:if>
		<c:if test = "${fn:trim(vo.tranCode) == 3 }">
				현재 배송중 상태입니다.
		</c:if>
		<c:if test = "${fn:trim(vo.tranCode) == 4 }">
				현재 배송완료 상태입니다.
				
		</c:if>
		<c:if test = "${fn:trim(vo.tranCode) == 5 }">
				상품평 남겨주셔서 감사합니다.
		</c:if>
	
				
		</td>
		<td></td>
		<td align="left">
		
		<c:if test = "${fn:trim(vo.tranCode) == 4 }">
				<a href="/review/addReview?prodNo=${vo.purchaseProd.prodNo }&tranNo=${vo.tranNo}">상품평 남기기</a>
				
		</c:if>
		
		<c:if test = "${fn:trim(vo.tranCode) == 3 }">
				<a href="/purchase/updateTranCode?tranNo=${vo.tranNo}&code=4">물건도착</a>
		</c:if>
		</td>
	</tr>
	<tr>
		<td colspan="11" bgcolor="D6D7D6" height="1"></td>
	</tr>
	</c:forEach>
</table>

<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top: 10px;">
	<tr>
		<td align="center">
		<input type="hidden" id="currentPage" name="currentPage" value=""/>
		<jsp:include page="../common/pageNavigator.jsp"/>
		</td>
	</tr>
</table>

<!--  페이지 Navigator 끝 -->
</form>

</div>

</body>
</html>