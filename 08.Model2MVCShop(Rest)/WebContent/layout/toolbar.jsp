<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>

<!--  ///////////////////////// JSTL  ////////////////////////// -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>



<!DOCTYPE html>
<html>

<head>
 <!-- Bootstrap core CSS -->
<!--   <link href="/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet"> -->

<!--   <!-- Custom styles for this template -->
<!--   <link href="/css/shop-homepage.css" rel="stylesheet"> -->
<!-- <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script> -->
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	
	//<![CDATA[
    // 사용할 앱의 JavaScript 키를 설정해 주세요.
    Kakao.init('9853999f1b5e8999c8c39ff5997edf9f');
    
    
    if(Kakao.Auth.getAccessToken() == null) {
    // 카카오 로그인 버튼을 생성합니다.
    Kakao.Auth.createLoginButton({
      container: '#kakao-login-btn',
      success: function(authObj) {
    	  
    	 
    		  Kakao.Auth.loginForm({
	    		  success: function(authObj) {
	    			  
	    			  Kakao.API.request({
	    		          url: '/v2/user/me',
	    		          success: function(res) {
	    		        	  var result = JSON.stringify(res);
	    		             
	    		        	  
	    		              $(location).attr('href', '/user/kakao?userName='+res.properties.nickname+"&profile="+res.properties.profile_image+"&id="+res.id);
	    		          },
	    		          fail: function(error) {
	    		            alert(JSON.stringify(error));
	    		          }
	    		        });
	    			  
	    			  
	    			  
	    			  
	    			  
	    	        },
	    	        fail: function(err) {
	    	          alert(JSON.stringify(err));
	    	        }
	    	  });
    		  
      },
      fail: function(err) {
        alert(JSON.stringify(err));
      }
    });	  
    		  
    		  
    	  }else {
    		  Kakao.Auth.createLoginButton({
    		  container: '#kakao-login-btn',
    		  success: function(authObj) {
    		  
    		  Kakao.Auth.login({
    		        success: function(authObj) {
    		        	
    		        	Kakao.API.request({
    		  	          url: '/v2/user/me',
    		  	          success: function(res) {
    		  	        	  var result = JSON.stringify(res);
    		  	             
    		  	        	  
    		  	              $(location).attr('href', '/user/kakao?userName='+res.properties.nickname+"&profile="+res.properties.profile_image+"&id="+res.id);
    		  	          },
    		  	          fail: function(error) {
    		  	            alert(JSON.stringify(error));
    		  	          }
    		  	        });
    		        	
    		        	
    		        	
    		        	
    		        },
    		        fail: function(err) {
    		          alert(JSON.stringify(err));
    		        }
    		  });
    		  
    		  
    	  
    	  },
	      fail: function(err) {
	        alert(JSON.stringify(err));
	      }
    		  })
    	  }
  //]]>
	
	
	$('a.nav-link:contains("로그인")').on('click',function() {
	    
	            //Getting the variable's value from a link 
	    var loginBox = $(this).attr('href');

	    //Fade in the Popup
	    $(loginBox).fadeIn(300);
	    
	    //Set the center alignment padding + border see css style
	    var popMargTop = ($(loginBox).height() + 24) /2; 
	    var popMargLeft = ($(loginBox).width() + 24) /2; 
	    
	    $(loginBox).css({ 
	        'margin-top' : -popMargTop,
	        'margin-left' : -popMargLeft
	    });
	    
	    // Add the mask to body
	    $('body').append('<div id="mask"></div>');
	    $('#mask').fadeIn(300);
	    
	    return false;
	});
	
	
//		$(document).on('click',function() {
		
//			if($('#mask').length){
//				 $('#mask , .login-popup').fadeOut(300 , function() {
//				$('#mask').remove();
			 
//			})
//			}
//			});
	
	$(document).click(function(e) { 
		if($(e.target).is(".login-popup *")) { 
			return false;
			}else {
				 $('#mask , .login-popup').fadeOut(300 , function() {
			 	 $('#mask').remove(); 
			 	 $($('.password span')[1]).remove();
				 });
			}
		});



//		// When clicking on the button close or the mask layer the popup closed
//		$('a.close, #mask').on('click', function() { 
//		  $('#mask , .login-popup').fadeOut(300 , function() {
//		    $('#mask').remove();  
//		}); 
//		return false;
//		});
	
	
	
	});




//로그인 이벤트
$( function() {
	$('.submit.button').on('click', function() {
		 $('#mypage').val(" 님 환영합니다.");
		var id = $('#username').val().trim();
		var pwd = $('#pass').val().trim();
		//alert(id + "," + pwd);
		
		
		$.ajax( {
			url : '/user/json/login',
			method : 'POST',
			data : JSON.stringify( {
				"userId" : id,
				"password" : pwd
			}),
			dataType : "json",
			headers : {
				"Accept" : "application/json",
				"Content-Type" : "application/json"
			},
			success : function(JSONData, status) {
				//alert(status);
				//alert(JSONData.user.userName);
				//alert(JSONData.pass);
				var pass = JSONData.pass;
				if(pass == 'false') {
					$('.password').append('<span>아이디 또는 비밀번호를 다시 확인하세요.</span>')
					$($('.password span')[1]).css('color','red');
				}else {
					
					 $('#mask , .login-popup').fadeOut(300 , function() {
					 	 $('#mask').remove();
					 	location.href="/";
					  	//location.reload();
						 });
					 
					 
					
				}
			}
			
		})
	})
	
});



//카카오 로그아웃

$( function() {
	//https://developers.kakao.com/docs/js-reference#kakao_auth_logout()
	
	
	
	
	$('a:contains("로그아웃")').on('click', function() {
		//alert("호출되나?");
		//Kakao.init();
		
		
		Kakao.API.request({
	          url: '/v2/user/me',
	          success: function(res) {
	        	  //alert("api 리퀘스트 완료")
	        	  //alert(Kakao.Auth.getAccessToken());
	        	  
	        	  Kakao.Auth.logout(function(data){
	  	            //alert(data);
	  	         	 //alert(Kakao.Auth.getAccessToken());
	  	            $(location).attr('href','/user/logout');
	  	        });
	  				
	          },
	          fail: function(error) {
	            alert(JSON.stringify(error));
	          }
	        });
	})
})



</script>
  
  
  <style type="text/css">
	/* Mask for background, by default is not display */
#mask {
    display: none;
    background: #000;
    position: fixed;
    left: 0;
    top: 0;
    z-index: 10;
    width: 100%;
    height: 100%;
    opacity: 0.8;
    z-index: 999;
}

/* You can customize to your needs  */
.login-popup {
    display: none;
    background: #333;
    padding: 10px;
    border: 2px solid #ddd;
    float: left;
    font-size: 1.5em;
    position: fixed;
    top: 50%;
    left: 50%;
    z-index: 99999;
    box-shadow: 0px 0px 20px #999;
    /* CSS3 */
        -moz-box-shadow: 0px 0px 20px #999;
    /* Firefox */
        -webkit-box-shadow: 0px 0px 20px #999;
    /* Safari, Chrome */
	border-radius: 3px 3px 3px 3px;
    -moz-border-radius: 3px;
    /* Firefox */
        -webkit-border-radius: 3px;
    /* Safari, Chrome */;
    width: 500px;
    height: 500px;
}

/* img.btn_close { */
/*     Position the close button */
/* 	float: right; */
/*     margin: -60px -108px 0 0; */
/* } */

fieldset {
    border: none;
}

form.signin .textbox label {
    display: block;
    padding-bottom: 7px;
    padding-left: 80px;
   
}

form.signin .textbox span {
    display: block;
}

form.signin p {
    color: #999;
    font-size: 15px;
    line-height: 18px;
    padding-left: 80px;
}

form.signin span {
	margin-top:10px;
	color: #999;
    font-size: 15px;
    line-height: 18px;
    padding-left: 5px;
}

form.signin .textbox input {
    background: #666666;
    border-bottom: 1px solid #333;
    border-left: 1px solid #000;
    border-right: 1px solid #333;
    border-top: 1px solid #000;
    color: #fff;
    border-radius: 3px 3px 3px 3px;
    -moz-border-radius: 3px;
    -webkit-border-radius: 3px;
    font: 13px Arial, Helvetica, sans-serif;
    padding: 6px 6px 4px;
    width: 300px;
    
}

form.signin input:-moz-placeholder {
    color: #bbb;
    text-shadow: 0 0 2px #000;
}

form.signin input::-webkit-input-placeholder {
    color: #bbb;
    text-shadow: 0 0 2px #000;
}

.button {
    background: -moz-linear-gradient(center top, #f3f3f3, #dddddd);
    background: -webkit-gradient(linear, left top, left bottom, from(#f3f3f3), to(#dddddd));
    background: -o-linear-gradient(top, #f3f3f3, #dddddd);
    filter: progid:DXImageTransform.Microsoft.gradient(startColorStr='#f3f3f3', EndColorStr='#dddddd');
    border-color: #000;
    border-width: 1px;
    border-radius: 4px 4px 4px 4px;
    -moz-border-radius: 4px;
    -webkit-border-radius: 4px;
    color: #333;
    cursor: pointer;
    display: inline-block;
    padding: 6px 6px 4px;
    margin-top: 10px;
    margin-left: 80px;
    font: 12px;
    width: 300px;
    height: 50px;
    
    
}

.button:hover {
    background: #ddd;
}
	
	</style>
	
	
	
	<style>
.dropbtn {
  background-color: #4CAF50;
  color: white;
  padding: 16px;
  font-size: 16px;
  border: none;
}

.dropdown {
  position: relative;
  display: inline-block;
}

.dropdown-content {
  display: none;
  position: absolute;
  background-color: #f1f1f1;
  min-width: 160px;
  box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
  z-index: 1;
}

.dropdown-content a {
  color: black;
  font-size : 13px;
  padding: 6px 8px;
  text-decoration: none;
  display: block;
  text-align: center;
 
}

.dropdown-content  li { list-style: none;
 }

.dropdown-content a:hover {background-color: #ddd;}

.dropdown:hover .dropdown-content {display: block;}

.dropdown:hover .dropbtn {background-color: #3e8e41;}


 .navbar-nav{float:right;}
 
 A:link {
 font-size: 11pt;
 }
</style>
	
	
	
  
</head>

<body>

<!-- Navigation -->
  <nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
    <div class="container">
      <a class="navbar-brand" href="/">Model2 MVC </a>
      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarResponsive">
      
        <ul class="navbar-nav ml-auto">
        <c:if test="${user.role eq 'admin' }">
          <li class="nav-item dropdown">
            <a id="manage" class="nav-link dropdown-toggle"   href="#"  data-toggle="dropdown">관리자
            </a>
					  <div class="dropdown-content">
					  
					    <a href="#">회원정보조회</a>
					    <hr>
					    <a href="#">판매상품등록</a>
					    <a href="#">판매상품관리</a>
					    <a href="#">배송업무</a>
					    <hr>
					    <a href="#">1 : 1 문의</a>
					  </div>
          </li>
          </c:if>
<!--           <li class="nav-item active"> -->
            <li class="nav-item">
            <a class="nav-link" href="#">123qwe</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#">awdawdawd</a>
          </li>
          <c:if test="${empty user }">
          <li class="nav-item">
         	 <a href="#login-box" class="nav-link">로그인</a>
<!--             <a class="nav-link" href="/user/login">로그인</a> -->
          </li>
          <li class="nav-item">
            <a class="nav-link" href="/user/addUser">회원가입</a>
          </li>
            </c:if>
            <c:if test="${!empty user }">
          <li class="nav-item dropdown">
            <a id="mypage" class="nav-link dropdown-toggle"   href="#"  data-toggle="dropdown">${user.userName }님 환영합니다.
            </a>
<!-- 					            <div class="dropdown"> -->
<!-- 					  <button class="dropbtn">Dropdown</button> -->
					  <div class="dropdown-content">
					  
					    <a href="#">내 정보보기</a>
					    <a href="#">주문배송조회</a>
					    <a href="#">1 : 1 문의</a>
					    <a href="#">장바구니</a>
					    <hr>
					    <a href="/user/logout">로그아웃</a>
					  </div>
<!-- 					</div> -->
            
            
            <!--  DrowDown 사용 -->
<!-- 		                <li class="dropdown"> -->
<!-- 	                        <a  href="#" class="dropdown-toggle" data-toggle="dropdown"> -->
<!-- 	                            <span>HTML5</span> -->
<!-- 	                            <span class="caret"></span> -->
<!-- 	                        </a> -->
<!-- 	                        <ul class="dropdown-content"> -->
<!-- 	                            <li><a href="#">Web UI</a></li> -->
<!-- 	                            <li><a href="#">W3C</a></li> -->
<!-- 	                            <hr> -->
<!-- 	                            <li class="divider"></li> -->
<!-- 	                            <li><a href="#">Static Contents</a></li> -->
<!-- 	                        </ul> -->
<!-- 	                    </li> -->
	                    
	                    
          </li>
            </c:if>
        </ul>
        
      </div>
    </div>
  </nav>
  
  
  
    <!-- 로그인 페이지 -->
  <div id="login-box" class="login-popup" style= "display: none;">
<!-- 		<a href="#" class="close"><img src="http://www.alessioatzeni.com/wp-content/tutorials/jquery/login-box-modal-dialog-window/close_pop.png" class="btn_close" title="Close Window" alt="Close" /></a> -->
  <form class="signin" action="#">
        <fieldset class="textbox">
        <label class="username">
        <span>아이디</span>
        <input id="username" name="userId" value="" type="text" autocomplete="on" placeholder="UserId">
        </label>
        <label class="password">
        <span>비밀번호</span>
        <input id="pass" name="password" value="" type="password" placeholder="Password">
       
        </label>
        
        <button class="submit button" type="button">로그인</button>
        <p>
        <a class="forgot" href="#">아이디/비밀번호 찾기</a>
        </p>
        <p>
        <a id="kakao-login-btn"></a>
        </p>         
        </fieldset>
  </form>
</div>

   <!-- Bootstrap core JavaScript -->
<!--   <script src="/vendor/jquery/jquery.min.js"></script> -->
  <script src="/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  
  
  </body>
  
  </html>