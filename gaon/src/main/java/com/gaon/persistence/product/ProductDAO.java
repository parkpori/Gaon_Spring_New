package com.gaon.persistence.product;

import java.util.List;

import com.gaon.domain.product.ProductDTO;

// 실행문이 없는 추상메서드(인터페이스)
public interface ProductDAO {
	public List<ProductDTO> bestList(); // 베스트상품
	public List<ProductDTO> newList();  // 신상품
}
