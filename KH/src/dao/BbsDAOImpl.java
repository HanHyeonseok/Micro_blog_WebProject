package dao;

public interface BbsDAOImpl {
	
	public boolean addReply(int bbsSeq);
	
	public boolean addBbs(String id, String title, String content, String hashtag, String filename);
}
