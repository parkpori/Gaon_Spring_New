package com.gaon.service.board;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.gaon.domain.board.ReplyDTO;
import com.gaon.persistence.board.ReplyDAO;

@Service
public class ReplyServiceImpl implements ReplyService {
	
	@Inject
	private ReplyDAO rDao;
	
	@Override
	public List<ReplyDTO> list(int bno) {
		return rDao.list(bno);
	}
	
	@Transactional // sqlSession이 기다렸다가 전부 실행함, 하나라도 실패하면 rollback한다.
	@Override
	public void create(ReplyDTO rDto) {
		// 1) 댓글 등록
		// 2) 해당 게시글 + 1
		rDao.create(rDto);
		rDao.updateAdd(rDto);
	}
	
	@Transactional
	@Override
	public void delete(ReplyDTO rDto) {
		// 1) 댓글 삭제
		// 2) 해당 게시글 - 1
		rDao.delete(rDto);
		rDao.updateDelete(rDto);
	}

}
