package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import db.DBConnection;
import dto.BbsDto;

public class BbsDAO implements BbsDAOImpl{

	// 싱글톤 설정
		private static BbsDAO bbsDAO = new BbsDAO();
		
		private BbsDAO() {
			DBConnection.initConnect();
		}
		
		public static BbsDAO getInstance() {
			return bbsDAO;
		}
		
		public BbsDto getContent() {
			
			String sql = " SELECT CONTENT, TITLE FROM BBS"
					+ " WHERE SEQ = ? ";
			
			Connection conn = null;
			PreparedStatement psmt = null;
			ResultSet rs = null;
			
			BbsDto dto = new BbsDto();
			
			System.out.println("1/6 login success");
			
			conn = DBConnection.makeConnection();
			psmt = conn.prepareStatement(sql);
			
			System.out.println("2/6 login success");
			
			rs = psmt.executeQuery();
			
			System.out.println("3/6 login success");
			
			return false;
		}
	
	
	
	@Override
	public boolean addReply(int bbsSeq) {
	
		return false;
	
		
	}

}
