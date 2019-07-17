package com.gaon.service.member;

import java.util.List;

import javax.servlet.http.HttpSession;

import com.gaon.domain.member.MemberDTO;

public interface MemberService {
	// Ajax: ID 중복 체크
	public int idCheck(String id);
	// 회원가입
	public int create(MemberDTO mDto);
	// 회원정보 수정
	public void updateMember(MemberDTO mDto, HttpSession session);
	// 회원 삭제
	public void delete(HttpSession session);
	// 로그인
	public boolean login(MemberDTO mDto, HttpSession session);
	// 로그아웃
	public void logout(HttpSession session);
	// 회원정보 1건 검색
	public MemberDTO viewMember(HttpSession session);
	// 현재 비밀번호 체크
	public String pwCheck(MemberDTO mDto);
	// 비밀번호 수정
	public void pwUpdate(MemberDTO mDto);
	// member list 출력
	public List<MemberDTO> list();
}
