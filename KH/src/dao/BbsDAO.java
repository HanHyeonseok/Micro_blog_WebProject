package dao;

import db.DBConnection;

public class BbsDAO implements BbsDAOImpl{

	// 싱글톤 설정
		private static BbsDAO bbsDAO = new BbsDAO();
		
		private BbsDAO() {
			DBConnection.initConnect();
		}
		
		public static BbsDAO getInstance() {
			return bbsDAO;
		}
	
	
	
	@Override
	public boolean addReply(int bbsSeq) {
	
		
	
	}

}
