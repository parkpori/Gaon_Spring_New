package com.gaon.persistence.board;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.gaon.domain.board.BoardDTO;

import lombok.extern.slf4j.Slf4j;


@Slf4j
@Repository
public class BoardDAOImpl implements BoardDAO {
	
	@Inject
	private SqlSession sqlSession;
	
	@Override
	public void create(BoardDTO bDto) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void update(BoardDTO bDto) {
		sqlSession.update("board.update", bDto);
	}

	@Override
	public void delete(int bno) {
		sqlSession.delete("board.delete", bno);
	}

	@Override
	public BoardDTO read(int bno) {
		return sqlSession.selectOne("board.read", bno);
	}

	@Override
	public List<BoardDTO> listAll(String sort_option, String search_option, String keyword, int start, int end) {
		Map<String, Object> map = new HashMap<>(); // int도 같이 들어가기 때문에 String, Object를 적어준다.
		map.put("sort_option", sort_option);
		map.put("search_option", search_option);
		map.put("keyword", "%"+keyword+"%");
		map.put("start", start);
		map.put("end", end);
		return sqlSession.selectList("board.listAll", map);
	}

	@Override
	public void increaseViewCnt(int bno, HttpSession session) {
		sqlSession.update("board.increaseViewCnt", bno);
	}

	@Override
	public int countArticle(String search_option, String keyword) {
		Map<String, String> map = new HashMap<>();
		map.put("search_option", search_option);
		map.put("keyword", "%"+keyword+"%");
		log.info(keyword);
		
		return sqlSession.selectOne("board.countArticle", map);
	}

	@Override
	public void createPlay(BoardDTO bDto) {
		sqlSession.insert("board.insert", bDto);
	}

	@Override
	public int goodCheck(int bno, String id) {
		HashMap<Object, Object> map = new HashMap<Object, Object>();
		map.put("bno", bno);
		map.put("id", id);
		return sqlSession.selectOne("board.goodCheck", map);
	}

	@Override
	public void goodDelete(int bno, String id) {
		HashMap<Object, Object> map = new HashMap<Object, Object>();
		map.put("bno", bno);
		map.put("id", id);
		sqlSession.update("board.goodDel", map);
	}

	@Override
	public void goodAdd(int bno, String id) {
		HashMap<Object, Object> map = new HashMap<Object, Object>();
		map.put("bno", bno);
		map.put("id", id);
		sqlSession.update("board.goodAdd", map);
	}

	@Override
	public int goodTotal(int bno, String id) {
		HashMap<Object, Object> map = new HashMap<Object, Object>();
		map.put("bno", bno);
		map.put("id", id);
		return sqlSession.selectOne("board.goodTotal", map);
	}
	
	@Override
	public void goodUpdate(int bno, int goodTotal) {
		HashMap<Object, Object> map = new HashMap<Object, Object>();
		map.put("bno", bno);
		map.put("goodTotal", goodTotal);
		sqlSession.update("board.goodUpdate", map);
	}
	
}
