
<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<html>
<head>

<meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <link rel="stylesheet" href="/resources/demos/style.css">
  <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script
  src="https://code.jquery.com/jquery-2.1.4.js"
  integrity="sha256-siFczlgw4jULnUICcdm9gjQPZkw/YPDqhQ9+nAOScE4="
  crossorigin="anonymous"></script>
  
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>


<title>구매정보수정</title>

<link rel="stylesheet" href="/css/admin.css" type="text/css">

	

<script type="text/javascript">

function fncUpdatePurchase(){
	//Form 유효성 검증
	
	var receiverName = $('input[name="receiverName"]').val();
	var receiverPhone = $('input[name="receiverPhone"]').val();
	var divyAddr = $('input[name="divyAddr"]').val();
	var divyDate = $('input[name="divyDate"]').val();
	

	if(receiverName == null || receiverName.length<1){
		alert("구매자 이름은 반드시 입력하여야 합니다.");
		$('input[name="receiverName"]').focus();
		return;
	}
	if(receiverPhone == null || receiverPhone.length<1){
		alert("구매자 연락처는 반드시 입력하여야 합니다.");
		$('input[name="receiverPhone"]').focus();
		return;
	}
	if(divyAddr == null || divyAddr.length<1){
		alert("주소는 반드시 입력하셔야 합니다.");
		$('input[name="divyAddr"]').focus();
		return;
	}
	if(divyDate == null || divyDate.length<1){
		alert("배송희망 날짜는 반드시 입력하셔야 합니다.");
		$('input[name="divyDate"]').focus();
		return;
	}
	
	
	$('form').attr("method","POST").attr("action","/purchase/updatePurchase").submit();
}



	$( function(){
		
		 $( "#divyDate" ).datepicker( { dateFormat: 'yy-mm-dd' });
		 
		 $('td.ct_btn01:contains("수정")').on('click', function(){
			 fncUpdatePurchase();
		 });
		 
		 $('td.ct_btn01:contains("취소")').on('click', function(){
			history.go(-1);
		 });
		 
		   
		
		
	});

</script>
</head>

<body bgcolor="#ffffff" text="#000000">

	<form name="detailForm" method="post">
		<input type="hidden" name="tranNo" value="${pVo.tranNo}" />
		<table width="100%" height="37" border="0" cellpadding="0"
			cellspacing="0">
			<tr>
				<td width="15" height="37"><img src="/images/ct_ttl_img01.gif"
					width="15" height="37" /></td>
				<td background="/images/ct_ttl_img02.gif" width="100%"
					style="padding-left: 10px;">
					<table width="100%" border="0" cellspacing="0" cellpadding="0">
						<tr>
							<td width="93%" class="ct_ttl01">구매정보수정</td>
							<td width="20%" align="right">&nbsp;</td>
						</tr>
					</table>
				</td>
				<td width="12" height="37"><img src="/images/ct_ttl_img03.gif"
					width="12" height="37" /></td>
			</tr>
		</table>

		<table width="100%" border="0" cellspacing="0" cellpadding="0"
			style="margin-top: 13px;">
			<tr>
				<td height="1" colspan="3" bgcolor="D6D6D6"></td>
			</tr>
			<tr>
				<td width="104" class="ct_write">구매자아이디 <imgsrc
						="/images/ct_icon_red.gif" width="3" height="3" align="absmiddle"></td>
				<td bgcolor="D6D6D6" width="1"></td>
				<td class="ct_write01">
					<table width="100%" border="0" cellspacing="0" cellpadding="0">
						<tr>
							<td width="105">${pVo.buyer.userId}</td>
						</tr>
					</table>
				</td>
			</tr>
			<tr>
				<td height="1" colspan="3" bgcolor="D6D6D6"></td>
			</tr>


			<tr>
				<td width="104" class="ct_write">구매방법</td>
				<td bgcolor="D6D6D6" width="1"></td>
				<td class="ct_write01"><select name="paymentOption"
					class="ct_input_g" style="width: 100px; height: 19px"
					maxLength="20">
						<c:if test="${fn:trim(pVo.paymentOption) == 1 }">
							<option value="1" selected="selected">현금구매</option>
							<option value="2">신용구매</option>
						</c:if>
						<c:if test="${fn:trim(pVo.paymentOption) == 2 }">
							<option value="1">현금구매</option>
							<option value="2" selected="selected">신용구매</option>
						</c:if>
				</select></td>
			</tr>



			<tr>
				<td width="104" class="ct_write">구매자이름 <img
					src="/images/ct_icon_red.gif" width="3" height="3"
					align="absmiddle" />
				</td>
				<td bgcolor="D6D6D6" width="1"></td>
				<td class="ct_write01"><input type="text" name="receiverName"
					class="ct_input_g" style="width: 100px; height: 19px"
					maxLength="10" minLength="6" value="${pVo.receiverName}" /></td>
			</tr>
			<tr>
				<td height="1" colspan="3" bgcolor="D6D6D6"></td>
			</tr>

			<tr>
				<td width="104" class="ct_write">구매자연락처 <img
					src="/images/ct_icon_red.gif" width="3" height="3"
					align="absmiddle" />
				</td>
				<td bgcolor="D6D6D6" width="1"></td>
				<td class="ct_write01"><input type="text" name="receiverPhone"
					class="ct_input_g" style="width: 100px; height: 19px"
					maxLength="10" value="${pVo.receiverPhone}"></td>
			</tr>
			<tr>
				<td height="1" colspan="3" bgcolor="D6D6D6"></td>
			</tr>

			<tr>
				<td width="104" class="ct_write">구매자주소</td>
				<td bgcolor="D6D6D6" width="1"></td>
				<td class="ct_write01"><input type="text" name="divyAddr"
					class="ct_input_g" style="width: 200px; height: 19px"
					maxLength="13" value="${pVo.divyAddr}" /></td>
			</tr>
			<tr>
				<td height="1" colspan="3" bgcolor="D6D6D6"></td>
			</tr>


			<tr>
				<td width="104" class="ct_write">구매요청사항</td>
				<td bgcolor="D6D6D6" width="1"></td>
				<td class="ct_write01"><input type="text" name="divyRequest"
					class="ct_input_g" style="width: 200px; height: 19px"
					maxLength="13" value="${pVo.divyRequest}" /></td>
			</tr>
			<tr>
				<td height="1" colspan="3" bgcolor="D6D6D6"></td>
			</tr>



			<tr>
				<td width="104" class="ct_write">배송희망일자 <img
					src="/images/ct_icon_red.gif" width="3" height="3"
					align="absmiddle" />
				</td>
				<td bgcolor="D6D6D6" width="1"></td>
				<td class="ct_write01"><input type="text" id="divyDate" name="divyDate"
					readonly="readonly" class="ct_input_g"
					style="width: 100px; height: 19px" maxLength="10" minLength="6" />
				</td>
			</tr>
			<tr>
				<td height="1" colspan="3" bgcolor="D6D6D6"></td>
			</tr>






		</table>

		<table width="100%" border="0" cellspacing="0" cellpadding="0"
			style="margin-top: 10px;">
			<tr>
				<td width="53%"></td>
				<td align="right">
					<table border="0" cellspacing="0" cellpadding="0">
						<tr>
							<td width="17" height="23"><img src="/images/ct_btnbg01.gif"
								width="17" height="23" /></td>
							<td background="/images/ct_btnbg02.gif" class="ct_btn01"
								style="padding-top: 3px;">
								수정
							</td>
							<td width="14" height="23"><img src="/images/ct_btnbg03.gif"
								width="14" height="23" /></td>
							<td width="30"></td>
							<td width="17" height="23"><img src="/images/ct_btnbg01.gif"
								width="17" height="23" /></td>
							<td background="/images/ct_btnbg02.gif" class="ct_btn01"
								style="padding-top: 3px;">
								취소
									</td>
							<td width="14" height="23"><img src="/images/ct_btnbg03.gif"
								width="14" height="23" /></td>
						</tr>
					</table>
				</td>
			</tr>
		</table>

	</form>
</body>
</html>