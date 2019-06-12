package com.gaon.persistence.board;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.gaon.domain.board.ReplyDTO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Repository
public class ReplyDAOImpl implements ReplyDAO {
	
	@Inject
	private SqlSession sqlSession;

	@Override
	public List<ReplyDTO> list(int bno) {
		return sqlSession.selectList("reply.list", bno);
	}

	@Override
	public void create(ReplyDTO rDto) {
		sqlSession.insert("reply.create", rDto);
	}

	@Override
	public void delete(ReplyDTO rDto) {
		sqlSession.delete("reply.delete", rDto);
	}

	@Override
	public void updateAdd(ReplyDTO rDto) {
		sqlSession.update("reply.updateAdd", rDto);
	}

	@Override
	public void updateDelete(ReplyDTO rDto) {
		sqlSession.update("reply.updateDelete", rDto);
	}
	
}
