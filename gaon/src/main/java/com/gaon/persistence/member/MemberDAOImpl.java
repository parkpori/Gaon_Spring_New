package com.gaon.persistence.member;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.gaon.domain.member.MemberDTO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Repository
public class MemberDAOImpl implements MemberDAO {
	
	@Inject
	private SqlSession sqlSession;
	
	@Override
	public int idCheck(String id) {
		return sqlSession.selectOne("member.idCheck", id);
	}

	@Override
	public int create(MemberDTO mDto) {
		return sqlSession.insert("member.create", mDto);
	}
	
	@Override
	public int updateMember(MemberDTO mDto) {
		return sqlSession.update("member.updateMember", mDto);
	}
	
	@Override
	public int delete(String id) {
		return sqlSession.delete("member.delete", id);
	}
	
	@Override
	public String login(MemberDTO mDto) {
		return sqlSession.selectOne("member.login", mDto);
	}

	@Override
	public MemberDTO viewMember(String id) {
		return sqlSession.selectOne("member.viewMember", id);
	}

	@Override
	public void pwUpdate(MemberDTO mDto) {
		sqlSession.update("member.pwUpdate", mDto);
	}

	@Override
	public List<MemberDTO> list() {
		return sqlSession.selectList("member.memList");
	}

}
