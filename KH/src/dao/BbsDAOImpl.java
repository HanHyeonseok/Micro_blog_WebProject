package dao;

import java.util.List;

import dto.BbsDto;
import dto.FavoriteDto;

public interface BbsDAOImpl {
	
	public boolean addReply(int bbsSeq);
	
	public boolean addBbs(BbsDto dto);
	
	public List<BbsDto> getBbsList();
	
	public BbsDto getContent(int seq);

	public List<BbsDto> getBestList();
	
	public FavoriteDto Like(String id, int b_seq);
	
	public FavoriteDto getCheckLike(String id, int b_seq);
	
	public boolean BbsUpdate(String title, String content, int b_seq);
	
}
