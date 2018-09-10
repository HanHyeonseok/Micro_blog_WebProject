package dao;

import java.util.List;

import controller.FavoriteDto;
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

	// 좋아요 체크 확인
	public int checkF(String id, int seq);

	// 좋아요 수 증가
	public void readLike(int seq);

	// 좋아요 테이블 add
	public boolean addLiketo(String id, int seq);

	// 좋아요 테이블 찾기
	public boolean findLiketo(String id, int seq);

	// 좋아요 체크
	public void fck(String id, int seq);

	// 좋아요 수 감소
	public void readLikeDown(int seq);

	// 좋아요 체크 해제
	public void fckDown(String id, int seq);

	// bbs 좋아요 수 가져오기
	public int getLikeCount(int seq);

	public FavoriteDto Like(String id, int b_seq);

	public FavoriteDto getCheckLike(String id, int b_seq);

	public boolean BbsUpdate(String title, String content, int b_seq);
}
