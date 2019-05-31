<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="include/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="${path}/css/common.css?v=1">
<title>Insert title here</title>
<style type="text/css">
/* main part */
	.main_header {
	    display: flex;
	    justify-content: center;
	    width: 100%;
	}
	.bs_example{
	    margin: 0;
	    position: relative;
	    z-index: 1;
	    width: 1300px;
	    height: 640px;
	    overflow: hidden;
	}
	#indicators {
		position: absolute;
		top: 585px;
	}
	#indicators > li {
		width: 50px;
		height: 6px;
	}
	.carousel{
	    background: #2f4357;
	    margin-top: 0px;
	    
	}
	.carousel .item img{
	    margin: 0 auto;
	}
	.arrow {
	    font-size: 50px;
	    opacity: .7;
	    color: white;
	    text-shadow: 0 0 8px #88888850;
	    transition: 0.2s;
	}
	.arrow:hover {
	    color: white;
	    opacity: 1;
	    transform: scale(1.3);
	}
	.arrow:focus {
		color: white;
	}
	.carousel_left {
	    position: absolute;
	    top: 290px;
	    left: 50px;          
	}
	.carousel_right {
	    position: absolute;
	    top: 290px;
	    right: 50px;
	}
	.main_best, .main_new, #header_text1, #header_text2 {
	    margin: 0 auto;
	    width: 1400px;
	    max-width: 1400px;
	    text-align: center;
	}
	.main_new {
		margin: 0 auto 80px;
	}
	.mt {
	    height: 60px;
	}
	#header_text1 {
	    margin: 120px auto 60px auto;
	    font-size: 22px;
	    color: #E65D6E;
	    font-family: 'Noto Serif KR', serif;
	    animation-name: textColorAnimation;
	    animation-duration: 2s;
	    animation-iteration-count: infinite;
	}
	#header_text2 {
	    margin: 90px auto 60px auto;
	    font-size: 22px;
	    color: #E65D6E;
	    font-family: 'Noto Serif KR', serif;
	    animation-name: textColorAnimation;
	    animation-duration: 2s;
	    animation-iteration-count: infinite;
	}
	@keyframes textColorAnimation {
	    0% { color: #FE9E95; }
	    50% {color: #E65D6E; }
	    100% {color: #FE9E95;  }
	}
	.best_div, .new_div {
	    display: inline-block;
	    margin: 0 0px 60px 0px;
	    width: 327px;
	    position: relative;
	    transition: 0.2s;
	}
	.best_div img, .new_div img {
	    width: 307px;
	    top: 10px;
	}
	.heart {
	    position: absolute;
	    z-index: 5;
	    font-size: 20px;
	    color: #f9320c;
	    right: 22px;
	    top: 12px;
	}
	.best_div span, .new_div span {
	    display: flex;
	    justify-content: flex-end;
	    font-family: 'Noto Serif KR', serif;
	    color: #E65D6E;
	    font-size: 14px;
	    margin: 13px 12px 8px 0;
	}
	.best_text, .new_text {
	    display: flex;
	    justify-content: flex-end;
	    width: 307px;
	    box-sizing: border-box;
	    border-top: 1px solid #ddd;
	    font-size: 13px;
	    line-height: 32px;
	    margin-left: 10px;
	    padding-right: 3px;
	}
	.back_color {
	    content: '';
	    position: absolute;
	    z-index: -5;
	    width: 307px;
	    height: 402px;
	    top: 0px;
	    left: 10px;
	    background-color: #FEDAB3;
	    opacity: 0.7;
	    transition: 0.2s;
	}

	.best_div:hover .back_color {
	    top: 8px;
	    left: 18px;
	}

	.new_div:hover .back_color {
	    top: 8px;
	    left: 18px;
	}
</style>
</head>
<body>
	<main>
        <div class="main_header">
            <div class="bs_example">
                <div id="myCarousel" class="carousel slide" data-ride="carousel">
 
                    <ol class="carousel-indicators" id="indicators">
                        <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
                        <li data-target="#myCarousel" data-slide-to="1"></li>
                        <li data-target="#myCarousel" data-slide-to="2"></li>
                    </ol>   
                    
                    <div class="carousel-inner">
                        <div class="item active">
                            <img src="${path}/img/gaon_img-01.png" alt="First Slide">
                        </div>
                        <div class="item">
                            <img src="${path}/img/gaon_img-02.png" alt="Second Slide">
                        </div>
                        <div class="item">
                            <img src="${path}/img/gaon_img-03.png" alt="Third Slide">
                        </div>
                    </div>
                </div>
                <a class="carousel_left arrow" href="#myCarousel" data-slide="prev">
                    <i class="fas fa-chevron-left"></i>
                </a>
                <a class="carousel_right arrow" href="#myCarousel" data-slide="next">
                    <i class="fas fa-chevron-right"></i>
                </a>
            </div>
        </div>
        <div id="header_text1">BEST</div>
        <div class="main_best">
        <c:forEach items="${bestList}" var="best">
            <div class="best_div">
                <a><i class="fas fa-heart heart"></i></a>
                <div class="back_color"></div>
                <div class="front_color"></div>
                <a href="detail.gaon?p_code=${best.p_code}">
                	<img src="${path}/img/${best.p_img}" class="img_hover">
                	<div>
                    	<span>${best.p_name}</span>
                	</div>
                </a>

                <div class="best_text">
                ${best.p_price}원
                </div>
            </div>
        </c:forEach>
        </div>

        <div id="header_text2">NEW</div>
        <div class="main_new">
        <c:forEach items="${newList}" var="new_DTO">
            <div class="new_div">
            	<a><i class="fas fa-heart heart"></i></a>
                <div class="back_color"></div>
                <a>
	                <img src="${path}/img/${new_DTO.p_img}" class="img_hover">
	                <div>
	                    <span>${new_DTO.p_name}</span>
	                </div>
                </a>
                <div class="new_text">
                ${new_DTO.p_price}원
                </div>
            </div>
        </c:forEach>
        </div>
    </main>
    <%@ include file="include/footer.jsp" %>
</body>
</html>