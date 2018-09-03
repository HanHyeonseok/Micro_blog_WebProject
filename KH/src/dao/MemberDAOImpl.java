package dao;

import dto.MemberDto;

public interface MemberDAOImpl {

	// 로그인
	public MemberDto login(MemberDto dto);
	
	// 멤버 추가
	public boolean addMember(MemberDto dto);
	
	// 멤버 수정
	public boolean updateMember(String id);
	
	// 멤버 삭제
	public boolean deleteMember(MemberDto dto);
	
	// 아이디 체크
	public boolean checkId(String id);
	

}
