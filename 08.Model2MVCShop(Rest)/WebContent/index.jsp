<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri = "http://java.sun.com/jsp/jstl/core" %>
<html lang="ko">

<head>

  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">
	
		
  <title>Shop Homepage</title>
   
  <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
  
  
  
  
  
  <!-- Bootstrap core CSS -->
  <link href="/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

  <!-- Custom styles for this template -->
  <link href="/css/shop-homepage.css" rel="stylesheet">

	
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
	<script type="text/javascript"> 
	
	$(function() {
		if (!location.hash) { 

			location.hash = '#reload';

			location.href = location.href;

		}
	})
	
	var total = 0;
	var page = 3;
	var nth = 7;
	$(window).scroll(function() {
		//console.log(Math.ceil($(window).scrollTop()));
		//console.log($(document).height() - $(window).height());
		
	    if (Math.ceil($(window).scrollTop()) == $(document).height() - $(window).height()) {
	      //console.log(++page);
	     // $(".row").append(function() {
	    	  //alert("야호");
	    	  //total = total / 3;
	    	  
	    	  $.ajax(
				{
					url : "/product/json/listProduct/scroll",
					method : "POST",
					data : JSON.stringify( {
							"currentPage" : page,
							"pageSize" : "3"
					}),
					dataType : "json",
					headers : {
						"Accept" : "application/json",
						"Content-Type" : "application/json"
					},
					success : function(JSONData, status) {
						//total = JSONData.totalCount;
						
					var idx = 0;
							//alert(status);
							$.each(JSONData.list, function(){
							//alert ( JSONData.list[0].prodNo);
							//alert(JSONData.list[0].fileName);
							//$('.row .card-img-top').attr('src','/images/uploadFiles/'+JSONData.list[idx].fileName);
							//$('h4 a').text(JSONData.list[idx].prodName);
							//$('.row .card-text').text(JSONData.list[idx].prodDetail);
							//$('.row .card-body h5').text(JSONData.list[idx].price+"원");
							
//							alert(JSONData.list[idx].fileName);
//							idx++;
							
							$( $('.row')[1]).append('<div class="col-lg-4 col-md-6 mb-4"> <div class="card h-100"> <a href="#"><img class="card-img-top" src="http://placehold.it/700x400" alt=""></a> <div class="card-body"> <h4 class="card-title"> <a href="#">Item Three</a> </h4> <h5>$24.99</h5> <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Amet numquam aspernatur!</p> </div> <div class="card-footer"> <small class="text-muted">&#9733; &#9733; &#9733; &#9733; &#9734;</small> </div> </div> </div>'
												);
							
							
// 							alert("1번째 : "+idx);
 							 $(".row .col-lg-4.col-md-6.mb-4:nth-child("+nth+") .card-img-top").attr('src','/images/uploadFiles/'+JSONData.list[idx].fileName);
 							 $(".row .col-lg-4.col-md-6.mb-4:nth-child("+nth+") h4 a").text(JSONData.list[idx].prodName);
 							 $(".row .col-lg-4.col-md-6.mb-4:nth-child("+nth+") .card-text").text(JSONData.list[idx].prodDetail);
 							 $(".row .col-lg-4.col-md-6.mb-4:nth-child("+nth+") .card-body h5").text(numberWithCommas(JSONData.list[idx].price)+"원");
 							 
 							 
 							 $(".row .col-lg-4.col-md-6.mb-4:nth-child("+nth+") h4 a").attr('href','/product/getProduct?menu=search&prodNo='+JSONData.list[idx].prodNo);
							 $(".row .col-lg-4.col-md-6.mb-4:nth-child("+nth+") .card.h-100 a").attr('href','/product/getProduct?menu=search&prodNo='+JSONData.list[idx].prodNo);
								idx++;
								nth++;
// 							alert("2번째 : "+idx);
							})
						page++;
						
					},// end callback
					error:function( jqXHR, textStatus, errorThrown){
						alert(textStatus);
						alert(errorThrown);
					}
						
		
				}); // end $.ajax
	    	  
	    	  
	    //  }); // end append
	      
	    } // end first if
	});// end scroll function
	
	$( function() {
		
		
		
		
		$.ajax(
				{
					url : "/product/json/listProduct/search",
					method : "POST",
					data : JSON.stringify( {
							"currentPage" : "1",
							"pageSize" : "6"
					}),
					dataType : "json",
					headers : {
						"Accept" : "application/json",
						"Content-Type" : "application/json"
					},
					success : function(JSONData, status) {
						total = JSONData.totalCount;
						//alert( JSONData.random);
					
					var idx = 0;
					
					//랜덤 이미지
					var imgArray = new Array();
					
							//alert(status);
							$.each(JSONData.list, function(){
							//alert ( JSONData.list[0].prodNo);
							//alert(JSONData.list[0].fileName);
							//$('.row .card-img-top').attr('src','/images/uploadFiles/'+JSONData.list[idx].fileName);
							//$('h4 a').text(JSONData.list[idx].prodName);
							//$('.row .card-text').text(JSONData.list[idx].prodDetail);
							//$('.row .card-body h5').text(JSONData.list[idx].price+"원");
							
//							alert(JSONData.list[idx].fileName);
//							idx++;
							
// 							alert("1번째 : "+idx);
							if(idx < 7) {
 							 $(".row .col-lg-4.col-md-6.mb-4:nth-child("+(idx+1)+") .card-img-top").attr('src','/images/uploadFiles/'+JSONData.list[idx].fileName).attr('width','300').attr('height','200');
 							 $(".row .col-lg-4.col-md-6.mb-4:nth-child("+(idx+1)+") h4 a").text(JSONData.list[idx].prodName);
 							 $(".row .col-lg-4.col-md-6.mb-4:nth-child("+(idx+1)+") .card-text").text(JSONData.list[idx].prodDetail);
 							 $(".row .col-lg-4.col-md-6.mb-4:nth-child("+(idx+1)+") .card-body h5").text(numberWithCommas(JSONData.list[idx].price)+"원");
 							 
 							 $(".row .col-lg-4.col-md-6.mb-4:nth-child("+(idx+1)+") h4 a").attr('href','/product/getProduct?menu=search&prodNo='+JSONData.list[idx].prodNo);
 							 $(".row .col-lg-4.col-md-6.mb-4:nth-child("+(idx+1)+") .card.h-100 a").attr('href','/product/getProduct?menu=search&prodNo='+JSONData.list[idx].prodNo);
 							 
							}
								imgArray[idx] =  '/images/uploadFiles/'+JSONData.list[idx].fileName;
								idx++;
								
								
								
// 							alert("2번째 : "+idx);
							}) // end each
							
						
							//랜덤이미지 주석처리
							//showImage(imgArray,JSONData.random);
						
					},// end callback
					error:function( jqXHR, textStatus, errorThrown){
						alert(textStatus);
						alert(errorThrown);
					}
						
		
				}); // end $.ajax
		
				
				
		
// 				$(	$('.carousel-inner .d-block.img-fluid')[0]).aeImageResize({ height: 900, width: 350 });
// 				$(	$('.carousel-inner .d-block.img-fluid')[1]).aeImageResize({ height: 900, width: 350 });
// 				$(	$('.carousel-inner .d-block.img-fluid')[2]).aeImageResize({ height: 900, width: 350 });
			
				
				
		
	});//end $function
	
	
	// 가격 콤마
	function numberWithCommas(x) {
	    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	}
	
	// 랜덤이미지 추출함수
	function showImage(imgArray,ran){
		//var imgNum = Math.round(Math.random()*total);
		//alert(imgNum);
		//alert(ran[0]);
		//alert(ran[1]);
		//alert(ran[2]);
		
		
		//$('.carousel-inner .d-block.img-fluid:nth-child(1)').attr('src',imgArray[ran[0]]);
		//$('.carousel-inner .d-block.img-fluid:nth-child(2)').attr('src',imgArray[ran[1]]);
		//$('.carousel-inner .d-block.img-fluid:nth-child(3)').attr('src',imgArray[ran[2]]);
		
	$(	$('.carousel-inner .d-block.img-fluid')[0]).attr('src',imgArray[ran[0]]);
	$(	$('.carousel-inner .d-block.img-fluid')[1]).attr('src',imgArray[ran[1]]);
	$(	$('.carousel-inner .d-block.img-fluid')[2]).attr('src',imgArray[ran[2]]);
		//.attr('width','500').attr('height','100')
	}
		
	
	
	
	
	
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
		
	  //<![CDATA[
	    // 사용할 앱의 JavaScript 키를 설정해 주세요.
	    //Kakao.init('YOUR APP KEY');
	    // 플러스친구 친구추가 버튼을 생성합니다.
	    Kakao.PlusFriend.createAddFriendButton({
	      container: '#plusfriend-addfriend-button',
	      plusFriendId: '_CieuT' // 플러스친구 홈 URL에 명시된 id로 설정합니다.
	    });
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
		
	
		
		
// 		$(document).on('click',function() {
			
// 			if($('#mask').length){
// 				 $('#mask , .login-popup').fadeOut(300 , function() {
// 				$('#mask').remove();
				 
// 			})
// 			}
// 			});
		
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



// 		// When clicking on the button close or the mask layer the popup closed
// 		$('a.close, #mask').on('click', function() { 
// 		  $('#mask , .login-popup').fadeOut(300 , function() {
// 		    $('#mask').remove();  
// 		}); 
// 		return false;
// 		});
		
		
		
		});

	
	
	
	//로그인 이벤트
	$( function() {
		$('.submit.button').on('click', function() {
			// $('#mypage').val(" 님 환영합니다.");
			var id = $('#username').val().trim();
			var pwd = $('#password').val().trim();
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
					
					var pass = JSONData.pass;
					if(pass == 'false') {
						$('.password').append('<span>아이디 또는 비밀번호를 다시 확인하세요.</span>')
					}else {
						
						 $('#mask , .login-popup').fadeOut(300 , function() {
						 	 $('#mask').remove(); 
						  	location.reload();
							 });
						 
						 
						
					}
				}
				
			})
		})
		
	});
	
	
	// 카카오 로그아웃

	$( function() {
		//https://developers.kakao.com/docs/js-reference#kakao_auth_logout()
		
		$(window).scroll(function() { 
			//alert("??");
		$('#banner').animate({top:$(window).scrollTop()+"px" },{queue: false, duration: 500});
		}); 
		
		
		
		
		$('a:contains("카카오")').on('click', function() {
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
	
	
	// 플러스친구 채팅시작하기
	//<![CDATA[
    function plusFriendChat() {
        Kakao.PlusFriend.chat({
          plusFriendId: '_CieuT' // 플러스친구 홈 URL에 명시된 id로 설정합니다.
        });
      }
    //]]>
	
	</script> 
	
	
	
	
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
					    <a href="/product/addProductView.jsp">판매상품등록</a>
					    <a href="#">판매상품관리</a>
					    <a href="#">배송업무</a>
					    <hr>
					    <a href="/board/listBoard">문의 내역</a>
					  </div>
          </li>
          </c:if>
          <li class="nav-item">
            <a class="nav-link" href="#">About</a>
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
					  <div class="dropdown-content">
					  
					    <a href="#">내 정보보기</a>
					    <a href="#">주문배송조회</a>
					    <a href="/board/listBoard">1 : 1 문의</a>
					    <a href="#">장바구니</a>
					    <hr>
					    <a href="/user/logout">로그아웃</a>
					    <c:if test = "${!empty user.kakao}">
					    <a href="#">카카오 로그아웃</a>
					    </c:if>
					  </div>
          </li>
            </c:if>
        </ul>
      </div>
    </div>
  </nav>

  <!-- Page Content -->
  <div class="container">


    <div class="row">

      <div class="col-lg-3" style="position:relative;float:left;width:180px;top:-15px;right:0px;">
		 <div id="banner" >
        <h1  class="my-4">Shop Name</h1>
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
      <!-- /.col-lg-3 -->

      <div class="col-lg-9">

        <div id="carouselExampleIndicators" class="carousel slide my-4" data-ride="carousel">
          <ol class="carousel-indicators">
            <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
            <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
            <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
          </ol>
          <div class="carousel-inner" role="listbox">
            <div class="carousel-item active">
              <img class="d-block img-fluid" src="/images/uploadFiles/190501_main.jpg" alt="First slide" style="background-image: "  >
            </div>
            <div class="carousel-item">
              <img class="d-block img-fluid" src="/images/uploadFiles/190515locking2_main.jpg" alt="Second slide" >
            </div>
            <div class="carousel-item">
              <img class="d-block img-fluid" src="/images/uploadFiles/190515_main.jpg" alt="Third slide" >
            </div>
          </div>
          <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="sr-only">Previous</span>
          </a>
          <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="sr-only">Next</span>
          </a>
        </div>

        <div class="row">

          <div class="col-lg-4 col-md-6 mb-4">
            <div class="card h-100">
              <a href="#"><img class="card-img-top" src="http://placehold.it/700x400" alt=""></a>
              <div class="card-body">
                <h4 class="card-title">
                  <a href="#">Item One</a>
                </h4>
                <h5>$24.99</h5>
                <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Amet numquam aspernatur!</p>
              </div>
              <div class="card-footer">
                <small class="text-muted">&#9733; &#9733; &#9733; &#9733; &#9733;</small>
              </div>
            </div>
          </div>

          <div class="col-lg-4 col-md-6 mb-4">
            <div class="card h-100">
              <a href="#"><img class="card-img-top" src="http://placehold.it/700x400" alt=""></a>
              <div class="card-body">
                <h4 class="card-title">
                  <a href="#">Item Two</a>
                </h4>
                <h5>$24.99</h5>
                <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Amet numquam aspernatur! Lorem ipsum dolor sit amet.</p>
              </div>
              <div class="card-footer">
                <small class="text-muted">&#9733; &#9733; &#9733; &#9733; &#9734;</small>
              </div>
            </div>
          </div>

          <div class="col-lg-4 col-md-6 mb-4">
            <div class="card h-100">
              <a href="#"><img class="card-img-top" src="http://placehold.it/700x400" alt=""></a>
              <div class="card-body">
                <h4 class="card-title">
                  <a href="#">Item Three</a>
                </h4>
                <h5>$24.99</h5>
                <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Amet numquam aspernatur!</p>
              </div>
              <div class="card-footer">
                <small class="text-muted">&#9733; &#9733; &#9733; &#9733; &#9734;</small>
              </div>
            </div>
          </div>

          <div class="col-lg-4 col-md-6 mb-4">
            <div class="card h-100">
              <a href="#"><img class="card-img-top" src="http://placehold.it/700x400" alt=""></a>
              <div class="card-body">
                <h4 class="card-title">
                  <a href="#">Item Four</a>
                </h4>
                <h5>$24.99</h5>
                <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Amet numquam aspernatur!</p>
              </div>
              <div class="card-footer">
                <small class="text-muted">&#9733; &#9733; &#9733; &#9733; &#9734;</small>
              </div>
            </div>
          </div>

          <div class="col-lg-4 col-md-6 mb-4">
            <div class="card h-100">
              <a href="#"><img class="card-img-top" src="http://placehold.it/700x400" alt=""></a>
              <div class="card-body">
                <h4 class="card-title">
                  <a href="#">Item Five</a>
                </h4>
                <h5>$24.99</h5>
                <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Amet numquam aspernatur! Lorem ipsum dolor sit amet.</p>
              </div>
              <div class="card-footer">
                <small class="text-muted">&#9733; &#9733; &#9733; &#9733; &#9734;</small>
              </div>
            </div>
          </div>

          <div class="col-lg-4 col-md-6 mb-4">
            <div class="card h-100">
              <a href="#"><img class="card-img-top" src="http://placehold.it/700x400" alt=""></a>
              <div class="card-body">
                <h4 class="card-title">
                  <a href="#">Item Six</a>
                </h4>
                <h5>$24.99</h5>
                <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Amet numquam aspernatur!</p>
              </div>
              <div class="card-footer">
                <small class="text-muted">&#9733; &#9733; &#9733; &#9733; &#9734;</small>
              </div>
            </div>
          </div>
          


        </div>
        <!-- /.row -->

      </div>
      <!-- /.col-lg-9 -->

    </div>
    <!-- /.row -->

  </div>
  <!-- /.container -->
  
  
  <!-- 로그인 페이지 -->
  <div id="login-box" class="login-popup" style= "display: none;">
<!-- 		<a href="#" class="close"><img src="http://www.alessioatzeni.com/wp-content/tutorials/jquery/login-box-modal-dialog-window/close_pop.png" class="btn_close" title="Close Window" alt="Close" /></a> -->
  <form method="post" class="signin" action="#">
        <fieldset class="textbox">
        <label class="username">
        <span>아이디</span>
        <input id="username" name="userId" value="" type="text" autocomplete="on" placeholder="UserId">
        </label>
        <label class="password">
        <span>비밀번호</span>
        <input id="password" name="password" value="" type="password" placeholder="Password">
       
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

<!-- 로그인 페이지  끝-->



<!--   회원가입 페이지 --> 
<!--   <div id="login-box" class="login-popup" style= "display: none;"> -->
<!--  		<a href="#" class="close"><img src="http://www.alessioatzeni.com/wp-content/tutorials/jquery/login-box-modal-dialog-window/close_pop.png" class="btn_close" title="Close Window" alt="Close" /></a> --> 
<!--   <form method="post" class="signin" action="#"> -->
<!--         <fieldset class="textbox"> -->
<!--         <label class="username"> -->
<!--         <span>아이디</span> -->
<!--         <input id="username" name="userId" value="" type="text" autocomplete="on" > -->
<!--         </label> -->
<!--         <label class="password"> -->
<!--         <span>비밀번호</span> -->
<!--         <input id="password" name="password" value="" type="password" > -->
<!--         <input id="password2" name="password2" value="" type="password" placeholder="비밀번호 확인"> -->
<!--         </label> -->
        
<!--         <label class="userName"> -->
<!--         <span>이름</span> -->
<!--         <input id="userName" name="userName" value="" type="text" > -->
<!--         </label> -->
        
        
<!--          <label class="ssn"> -->
<!--         <span>주민등록번호</span> -->
<!--         <input id="ssn" name="ssn" value="" type="text" placeholder="- 제외 , 13자리 입력"> -->
<!--         </label> -->
        
      
        
        
<!--         <button class="submit button" type="button">회원가입</button> -->
<!--         </fieldset> -->
<!--   </form> -->
<!-- </div> -->

<!--  회원가입 페이지  끝--> 

  <!-- Footer -->
  <footer class="py-5 bg-dark">
    <div class="container">
      <p class="m-0 text-center text-white">Copyright &copy; Your Website 2019</p>
    </div>
    <!-- /.container -->
  </footer>

 
 <!-- Bootstrap core JavaScript -->
  <script src="/vendor/jquery/jquery.min.js"></script>
  <script src="/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

</body>









</html>
