<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>

<!DOCTYPE html>
<html>

<head>
	<meta charset="EUC-KR">
	
	<title>ȸ������</title>
	
	<link rel="stylesheet" href="/css/admin.css" type="text/css">
	
	<!-- CDN(Content Delivery Network) ȣ��Ʈ ��� -->
	<script src="http://code.jquery.com/jquery-2.1.4.min.js"></script>
	<script type="text/javascript">
		
		function fncAddUser() {
			
			var id=$("input[name='userId']").val();
			var pw=$("input[name='password']").val();
			var pw_confirm=$("input[name='password2']").val();
			var name=$("input[name='userName']").val();
			
			
			if(id == null || id.length <1){
				alert("���̵�� �ݵ�� �Է��ϼž� �մϴ�.");
				return;
			}
			if(pw == null || pw.length <1){
				alert("�н������  �ݵ�� �Է��ϼž� �մϴ�.");
				return;
			}
			if(pw_confirm == null || pw_confirm.length <1){
				alert("�н����� Ȯ����  �ݵ�� �Է��ϼž� �մϴ�.");
				return;
			}
			if(name == null || name.length <1){
				alert("�̸���  �ݵ�� �Է��ϼž� �մϴ�.");
				return;
			}
			
			if( pw != pw_confirm ) {				
				alert("��й�ȣ Ȯ���� ��ġ���� �ʽ��ϴ�.");
				$("input:text[name='password2']").focus();
				return;
			}
				
			var value = "";	
			if( $("input:text[name='phone2']").val() != ""  &&  $("input:text[name='phone3']").val() != "") {
				var value = $("option:selected").val() + "-" 
									+ $("input[name='phone2']").val() + "-" 
									+ $("input[name='phone3']").val();
			}
			//Debug..
			//alert("phone : "+value)
			$("input:hidden[name='phone']").val( value );
			
			$("form").attr("method" , "POST").attr("action" , "/user/addUser").submit();
		}
		
		//==>"����"  Event ����
		 $(function() {
			//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			//==> 1 �� 3 ��� ���� : $("tagName.className:filter�Լ�") �����.	
			 $( "td.ct_btn01:contains('����')" ).on("click" , function() {
				//Debug..
				//alert(  $( "td.ct_btn01:contains('����')" ).html() );
				fncAddUser();
			});
		});	
		
		
		//==>"���"  Event ó�� ��  ����
		$(function() {
			//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			//==> 1 �� 3 ��� ���� : $("tagName.className:filter�Լ�") �����.	
			 $( "td.ct_btn01:contains('���')" ).on("click" , function() {
					//Debug..
					//alert(  $( "td.ct_btn01:contains('���')" ).html() );
					$("form")[0].reset();
			});
		});	

		//==>"�̸���" ��ȿ��Check  Event ó�� �� ����
		 $(function() {
			 
			 $("input[name='email']").on("change" , function() {
				
				 var email=$("input[name='email']").val();
			    
				 if(email != "" && (email.indexOf('@') < 1 || email.indexOf('.') == -1) ){
			    	alert("�̸��� ������ �ƴմϴ�.");
			     }
			});
			 
		});	
		
	   ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	   //==> �ֹι�ȣ ��ȿ�� check �� ����������....
		function checkSsn() {
			var ssn1, ssn2; 
			var nByear, nTyear; 
			var today; 
	
			ssn = document.detailForm.ssn.value;
			// ��ȿ�� �ֹι�ȣ ������ ��츸 ���� ��� ����, PortalJuminCheck �Լ��� CommonScript.js �� ���� �ֹι�ȣ üũ �Լ��� 
			if(!PortalJuminCheck(ssn)) {
				alert("�߸��� �ֹι�ȣ�Դϴ�.");
				return false;
			}
		}
	
		function PortalJuminCheck(fieldValue){
		    var pattern = /^([0-9]{6})-?([0-9]{7})$/; 
			var num = fieldValue;
		    if (!pattern.test(num)) return false; 
		    num = RegExp.$1 + RegExp.$2;
	
			var sum = 0;
			var last = num.charCodeAt(12) - 0x30;
			var bases = "234567892345";
			for (var i=0; i<12; i++) {
				if (isNaN(num.substring(i,i+1))) return false;
				sum += (num.charCodeAt(i) - 0x30) * (bases.charCodeAt(i) - 0x30);
			}
			var mod = sum % 11;
			return ((11 - mod) % 10 == last) ? true : false;
		}
		 ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	
		//==>"ID�ߺ�Ȯ��" Event ó�� �� ����
		 $(function() {
			//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			//==> 1 �� 3 ��� ���� : $("tagName.className:filter�Լ�") �����.	
			 $("td.ct_btn:contains('ID�ߺ�Ȯ��')").on("click" , function() {
				//alert($("td.ct_btn:contains('ID�ߺ�Ȯ��')").html());
				popWin 
				= window.open("/user/checkDuplication.jsp",
											"popWin", 
											"left=300,top=200,width=300,height=200,marginwidth=0,marginheight=0,"+
											"scrollbars=no,scrolling=no,menubar=no,resizable=no");
			});
		});	

		
		$( function(){
			
			
			$('input[name="password2"]').on('focus', function(){
				//alert("11");
				$('td p:contains("��ȣ�� ��ġ���� �ʽ��ϴ�.")').remove();
			});
			
			
			$('input[name="password2"]').on('focusout', function(){
				
				var pw = $('input[name="password"]').val();
				var pw2 = $('input[name="password2"]').val();
				
				if(pw != pw2) {
					$('input[name="password2"]').parent().append('<p>��ȣ�� ��ġ���� �ʽ��ϴ�.</p>').css('color','red');
				}
				
				
			});
			
			
			$('#checkId').on('keyup', function(){
				//console.log($('#checkId').val());
				var len = $('#checkId').val();
				//console.log(len.length);
				
				if($('#checkId').val() != '') {
				$.ajax({
					url : '/user/json/checkDuplication/'+$('#checkId').val(),
					method : "GET" ,
					dataType : "json" ,
					headers : {
						"Accept" : "application/json",
						"Content-Type" : "application/json"
					},success : function(JSONData , status) {

						var check = "";
						
						if( len.length < 5){
							check = "���̵�� 5���� �̻� �Է����ּ���."
								$('tr tr tr').text(check).css('color','red');
							
						}else {
							
							if(JSONData == true) {
								check = "��� ������ ���̵��Դϴ�."
									$('tr tr tr').text(check).css('color','green');
							}else {
								check = "�̹� ������� ���̵��Դϴ�."
								$('tr tr tr').text(check).css('color','red');
							}
						}
													//alert(check);
													//alert(JSONData);
						
					}
				
			});}
						
						
				
				
			});
		});
	</script>		
	
</head>

<body bgcolor="#ffffff" text="#000000">

<form name="detailForm">

<table width="100%" height="37" border="0" cellpadding="0"	cellspacing="0">
	<tr>
		<td width="15" height="37">
			<img src="/images/ct_ttl_img01.gif" width="15" height="37"/>
		</td>
		<td background="/images/ct_ttl_img02.gif" width="100%" style="padding-left:10px;">
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td width="93%" class="ct_ttl01">ȸ������</td>
					<td width="20%" align="right">&nbsp;</td>
				</tr>
			</table>
		</td>
		<td width="12" height="37">
			<img src="/images/ct_ttl_img03.gif" width="12" height="37"/>
		</td>
	</tr>
</table>

<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top:13px;">
	
	<tr>
		<td height="1" colspan="3" bgcolor="D6D6D6"></td>
	</tr>
	
	<tr>
		<td width="104" class="ct_write">
			���̵� <img src="/images/ct_icon_red.gif" width="3" height="3" align="absmiddle"/>
		</td>
		<td bgcolor="D6D6D6" width="1"></td>
		<td class="ct_write01">
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td width="105">
						<input id="checkId" type="text" name="userId" class="ct_input_bg" 
										style="width:100px; height:19px"  maxLength="20" >
					</td>
					<td>
						<table border="0" cellspacing="0" cellpadding="0">
							<tr>
								
							</tr>
						</table>
					</td>
				</tr>
			</table>
		</td>
	</tr>
	
	<tr>
		<td height="1" colspan="3" bgcolor="D6D6D6"></td>
	</tr>
	
	<tr>
		<td width="104" class="ct_write">
			��й�ȣ <img src="/images/ct_icon_red.gif" width="3" height="3" align="absmiddle"/>
		</td>
		<td bgcolor="D6D6D6" width="1"></td>
		<td class="ct_write01">
			<input 	type="password" name="password" class="ct_input_g" 
							style="width:100px; height:19px"  maxLength="10" minLength="6"  />
		</td>
	</tr>
	
	<tr>
		<td height="1" colspan="3" bgcolor="D6D6D6"></td>
	</tr>
	
	<tr>
		<td width="104" class="ct_write">
			��й�ȣ Ȯ�� <img src="/images/ct_icon_red.gif" width="3" height="3" align="absmiddle"/>
		</td>
		<td bgcolor="D6D6D6" width="1"></td>
		<td class="ct_write01">
			<input 	type="password" name="password2" class="ct_input_g" 
							style="width:100px; height:19px"  maxLength="10" minLength="6"  />
									
		</td>
	</tr>
	
	<tr>
		<td height="1" colspan="3" bgcolor="D6D6D6"></td>
	</tr>
	
	<tr>
		<td width="104" class="ct_write">
			�̸� <img src="/images/ct_icon_red.gif" width="3" height="3" align="absmiddle"/>
		</td>
		<td bgcolor="D6D6D6" width="1"></td>
		<td class="ct_write01">
			<input 	type="text" name="userName" class="ct_input_g" 
							style="width:100px; height:19px"  maxLength="50" />
		</td>
	</tr>
	
	<tr>
		<td height="1" colspan="3" bgcolor="D6D6D6"></td>
	</tr>
	
	<tr>
		<td width="104" class="ct_write">�ֹι�ȣ</td>
		<td bgcolor="D6D6D6" width="1"></td>
		<td class="ct_write01">
			<input 	type="text" name="ssn" class="ct_input_g" style="width:100px; height:19px" 
							onChange="javascript:checkSsn();"  maxLength="13" />
			-����, 13�ڸ� �Է�
		</td>
	</tr>

	<tr>
		<td height="1" colspan="3" bgcolor="D6D6D6"></td>
	</tr>
	
	<tr>
		<td width="104" class="ct_write">�ּ�</td>
		<td bgcolor="D6D6D6" width="1"></td>
		<td class="ct_write01">
			<input		type="text" name="addr" class="ct_input_g" 
						 	style="width:370px; height:19px"  maxLength="100"/>
		</td>
	</tr>
	
	<tr>
		<td height="1" colspan="3" bgcolor="D6D6D6"></td>
	</tr>
	
	<tr>
		<td width="104" class="ct_write">�޴���ȭ��ȣ</td>
		<td bgcolor="D6D6D6" width="1"></td>
		<td class="ct_write01">
			<select 	name="phone1" class="ct_input_g" style="width:50px; height:25px"
							onChange="document.detailForm.phone2.focus();">
				<option value="010" >010</option>
				<option value="011" >011</option>
				<option value="016" >016</option>
				<option value="018" >018</option>
				<option value="019" >019</option>
			</select>
			<input 	type="text" name="phone2" class="ct_input_g" 
							style="width:100px; height:19px"  maxLength="9" />
			- 
			<input 	type="text" name="phone3" class="ct_input_g" 
							style="width:100px; height:19px"  maxLength="9" />
			<input type="hidden" name="phone" class="ct_input_g"  />
		</td>
	</tr>

	<tr>
		<td height="1" colspan="3" bgcolor="D6D6D6"></td>
	</tr>
	
	<tr>
		<td width="104" class="ct_write">�̸��� </td>
		<td bgcolor="D6D6D6" width="1"></td>
		<td class="ct_write01">
			<table border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td height="26">
 						<input 	type="text" name="email" class="ct_input_g" 
										style="width:100px; height:19px" />										
					</td>
				</tr>
			</table>
		</td>
	</tr>

	<tr>
		<td height="1" colspan="3" bgcolor="D6D6D6"></td>
	</tr>
	
</table>

<table width="100%" border="0" cellspacing="0" cellpadding="0"	style="margin-top:10px;">
	<tr>
		<td width="53%">	</td>

		<td align="right">
			<table border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td width="17" height="23">
						<img src="/images/ct_btnbg01.gif" width="17" height="23"/>
					</td>
					<td background="/images/ct_btnbg02.gif" class="ct_btn01" style="padding-top:3px;">
						����
					</td>
					<td width="14" height="23">
						<img src="/images/ct_btnbg03.gif" width="14" height="23"/>
					</td>
					<td width="30"></td>					
					<td width="17" height="23">
						<img src="/images/ct_btnbg01.gif" width="17" height="23"/>
					</td>
					<td background="/images/ct_btnbg02.gif" class="ct_btn01" style="padding-top:3px;">
						���
					</td>
					<td width="14" height="23">
						<img src="/images/ct_btnbg03.gif" width="14" height="23"/>
					</td>
				</tr>
			</table>
		</td>
	</tr>
</table>

</form>

</body>

</html>