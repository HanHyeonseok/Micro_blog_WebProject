package dao;

import java.util.List;

import dto.BbsDto;
import dto.MemberDto;

public interface BbsDAOImpl {
	
	public boolean addReply(int bbsSeq);
	
	public BbsDto getContent(int seq);
	
	public boolean addBbs(BbsDto dto);
	
	public List<BbsDto> getBbsList();
	
	public List<BbsDto> getBestList();
	
	public List<BbsDto> getSearchList(String str);
	
	public List<BbsDto> getUserBbsList(String id);
}
