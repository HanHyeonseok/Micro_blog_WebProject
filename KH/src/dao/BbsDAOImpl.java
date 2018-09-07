package dao;

import java.util.List;

import dto.BbsDto;

public interface BbsDAOImpl {
	
	public boolean addReply(int bbsSeq);
	
	public boolean addBbs(BbsDto dto);
	
	public List<BbsDto> getBbsList();
	
	public BbsDto getContent(int seq);

	public List<BbsDto> getBestList();
	
	public List<BbsDto> getSearchList(String str);
}
