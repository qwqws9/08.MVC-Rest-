<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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

	

	<script type="text/javascript"> 
	var total = 0;
	var page = 3;
	var nth = 7;
	$(window).scroll(function() {
	    if ($(window).scrollTop() == $(document).height() - $(window).height()) {
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
		
	
	
	
	
	</script> 
	
	

</head>

<body>

  <!-- Navigation -->
  <nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
    <div class="container">
      <a class="navbar-brand" href="#">Model2 MVC </a>
      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarResponsive">
        <ul class="navbar-nav ml-auto">
          <li class="nav-item active">
            <a class="nav-link" href="#">Home
              <span class="sr-only">(current)</span>
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#">About</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#">Services</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#">Contact</a>
          </li>
        </ul>
      </div>
    </div>
  </nav>

  <!-- Page Content -->
  <div class="container">

    <div class="row">

      <div class="col-lg-3">

        <h1 class="my-4">Shop Name</h1>
        <div class="list-group">
          <a href="#" class="list-group-item">Category 1</a>
          <a href="#" class="list-group-item">Category 2</a>
          <a href="#" class="list-group-item">Category 3</a>
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
