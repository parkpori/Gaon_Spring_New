package com.gaon.service.board;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

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

	@Override
	public void create(ReplyDTO rDto) {
		
	}

	@Override
	public void delete(ReplyDTO rDto) {
		
	}

}
