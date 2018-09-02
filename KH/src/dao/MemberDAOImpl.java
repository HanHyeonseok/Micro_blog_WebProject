package dao;

import dto.MemberDto;

public interface MemberDAOImpl {
	
public boolean addMember(MemberDto dto);
	
	public MemberDto login(MemberDto dto);
}
