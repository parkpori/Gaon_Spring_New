package com.gaon.persistence.product;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.gaon.domain.product.ProductDTO;

@Repository // DAO로 인식하게 해줌
public class ProductDAOImpl implements ProductDAO {

	@Inject
	private SqlSession sqlSession;
	
	@Override
	public List<ProductDTO> bestList() {
		return sqlSession.selectList("pdt.bestList");
	}

	@Override
	public List<ProductDTO> newList() {
		return sqlSession.selectList("pdt.newList");
	}

}
