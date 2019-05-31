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
	.detail_all {
		width: 1300px;
		margin: 20px auto 100px;
		padding: 80px 50px 20px;
		display: flex;
	}
	.detail_img {
		width: 550px;
		height: 721px;
		margin-right: 50px;
	}
	.detail_img > img {
		width: 550px;
	}
	.detail_text {
		width: 600px;
		padding: 0px 30px;
		box-sizing: border-box;
	}
	.detail_title {
		font-size: 20px;
		font-family: 'Noto Sans KR', sans-serif;
		border-bottom: 1px solid #ddd;
		padding-bottom: 20px;
		margin-bottom: 20px;
	}
	.detail_price > div:nth-child(1) {
		font-family: 'Noto Sans KR', sans-serif;
		padding-bottom: 6px;
	}
	.detail_price {
		padding-bottom: 25px;
	}
	.detail_option {
		display: flex;
		align-items: center;
		width: 100%;
		height: 40px;
		margin-bottom: 10px;
	}
	.detail_option > span {
		font-family: 'Noto Sans KR', sans-serif;
		display: inline-block;
		width: 150px;
	}
	.detail_option > select {
		height: 35px;
		width: 100%;
		background: url('img/sel_arr.gif') 100% 50% no-repeat;
		-webkit-appearance: none;
		padding: 0px 10px;
		border: 1px solid #ddd;
	}
	.product_msg {
		font-size: 13px;
		color: #aaa;
		float: right;
	}
	.detail_result {
		margin: 50px 0px 0px;
		border-top: 1px dotted #ddd;
		padding: 20px 0px;
	}
	.result_msg {
		font-size: 13px;
		color: #aaa;
	}
	#detail_icon {
		font-size: 5px;
		border: 1px solid #aaa;
		color: #aaa;
		width: 14px;
		height: 14px;
		border-radius: 2px;
		text-align: center;
		line-height: 13px;
	}
	.result_box {
		border-bottom: 1px solid #aaa;
		margin-bottom: 20px;
	}
	.result_product {
		display: flex;
		align-items: center;
		padding: 5px 10px;
		border-top: 1px solid #ddd;
		background: #fafafa;
	}
	.result_product:nth-child(1) {
		border-top: 1px solid #aaa;
	}
	.product_size {
		display: block;
		font-family: 'Nanum Gothic', sans-serif;
		font-size: 12px;
		color: #999;
		padding-top: 2px;
	}
	.product_name {
		width: 308px;
		font-family: 'Noto Sans KR', sans-serif;
	}
      	.product_num {
      		display: flex;
      		width: 100px;
      		padding: 0px 5px;
      	}
      	.num_input {
      		display: inline-block;
      		width: 70px;
      		height: 28px;
      		border: 1px solid #ddd;
      	}
      	.num_div {
      		width: 100%;
      		text-align: center;
      	}
      	.num_div > span {
      		display: block;
      		border: 1px solid #ddd;
      		height: 14px;
      		line-height: 10px;
      	}
      	#close_file_btn {
      		display: inline-block;
      		width: 20px;
      		text-align: center;
      	}
      	.product_price {
      		width: 110px;
      		float: right;
      		font-family: 'Noto Sans KR', sans-serif;
      	}
      	.price_span {
		float: right;
		
		color: tomato;
	}
	.price_won {
		display: inline-block;
		font-size: 13px;
		padding-left: 2px;
	}
	.detail_total {
		float: right;
		font-family: 'Noto Sans KR', sans-serif;
	}
	.total_price {
		font-size: 19px;
		color: tomato;
	}
	.detail_btn {
		margin-top: 75px;
		display: flex;
	}
	.detail_btn > a {
		flex: 1;
		height: 50px;
		font-family: 'Noto Sans KR', sans-serif;
		text-align: center;
		line-height: 50px;

	}
	.wishlist {
		background: white;
		border: 1px solid #aaa;
		color: #aaa;
		margin-right: 5px;
		transition: .3s;
	}
	.basket {
		background: white;
		border: 1px solid #aaa;
		color: #aaa;
		margin-right: 5px;
		transition: .3s;
	}
	.buynow {
		background: #333;
		border: 1px solid #333;
		color: white;
		transition: .3s;
	}
	.wishlist:hover {
		border: 1px solid #333;
		color: #333;
	}
	.basket:hover {
		border: 1px solid #333;
		color: #333;
	}
	.buynow:hover {
		background: #E65D6E;
		border: 1px solid #E65D6E;
		color: white;
	}
</style>
</head>
<body>
	<div class="detail_all">
        <div class="detail_img">
            <img src="${path}/img/${product.p_img}">
        </div>
        <div class="detail_text">
            <div>
                <div class="detail_title">${product.p_name}</div>
            </div>
            <div class="detail_price">
                <div>PRICE</div>
                <div>${product.p_price}</div>
            </div>
            <div class="detail_option">
            	<span>SIZE</span>
                <select>
                    <option>- [필수] 옵션을 선택해 주세요 -</option>
                    <option value="S">S</option>
                    <option value="M">M</option>
                    <option value="L">L</option>
                    <option value="XL">XL</option>
                </select>
            </div>
            <div class="product_msg">(최소 주문수량 1개 이상 / 최대 주문수량 20개 이하)</div>
            <div class="detail_result">
            	<div class="result_msg"><i class="fas fa-exclamation" id="detail_icon"></i>
            	위 옵션선택 박스를 선택하시면 아래에 상품이 추가됩니다.</div>
            </div>
            <div class="result_box">
	            <div class="result_product">
	            	<div class="product_name">
		            	<span>${product.p_code}</span> /
		            	<span>${product.p_name}</span>
		            	<span class="product_size">
		            		- <span>M(SIZE)</span>
		            	</span>
	            	</div>
	            	<div class="product_num">
	            		<input type="text" name="" class="num_input">
	            		<div class="num_div">
	            			<span><i class="fas fa-caret-up"></i></span>
	            			<span><i class="fas fa-caret-down"></i></span>
	            		</div>
	            	</div>
	            	<i class="fas fa-times" id="close_file_btn"></i>
	            	<div class="product_price">
	            		<span class="price_span">
	            			${product.p_price}<span class="price_won">원</span>
	            		</span>
	            	</div>
	            </div>
            </div>
            <div class="detail_total">
            	<div>
            		<span class="total_title">총 상품금액(수량) :
            		</span>
					<span class="total_price">13500</span>
					<span>원</span>
					<span>(1개)</span>
            	</div>
            </div>
            <div class="detail_btn">
                <a class="wishlist">WISHLIST</a>
                <a class="basket">BASKET</a>
                <a class="buynow">BUY NOW</a>
            </div>
        </div>
    </div>
    <%@ include file="include/footer.jsp" %>
</body>
</html>