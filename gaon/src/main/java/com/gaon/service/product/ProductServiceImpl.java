package com.gaon.service.product;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.gaon.domain.product.ProductDTO;
import com.gaon.persistence.product.ProductDAO;

// 실제 Service를 동작하는 Class에는 @Service를 추가해야 함
@Service
public class ProductServiceImpl implements ProductService {
	
	@Inject
	private ProductDAO pDao;
	
	@Override
	public HashMap<String, List<ProductDTO>> productList() {
		// 베스트상품과 신상품을 받아서 index로 전달
		List<ProductDTO> bList = pDao.bestList();
		List<ProductDTO> nList = pDao.newList();
		
		HashMap<String, List<ProductDTO>> map = new HashMap<>();
		map.put("bList", bList);
		map.put("nList", nList);
		
		return map;
	}
}
