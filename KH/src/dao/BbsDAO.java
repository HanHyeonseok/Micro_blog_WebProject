package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import java.io.File;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServlet;
import javax.servlet.jsp.JspWriter;

import db.DBClose;
import db.DBConnection;
import dto.BbsDto;
import dto.FavoriteDto;

public class BbsDAO implements BbsDAOImpl {

	// 싱글톤 설정
		private static BbsDAO bbsDAO = new BbsDAO();
		
		private BbsDAO() {
			DBConnection.initConnect();
		}
		
		public static BbsDAO getInstance() {
			return bbsDAO;
		}
		
		
		public BbsDto getContent(int seq) {
		
			String sql1 = " UPDATE BBS SET READCOUNT = READCOUNT + 1 "
					+ " WHERE SEQ = ? ";
			
			String sql2 = " SELECT SEQ, ID, TITLE, CONTENT, WDATE, DEL, READCOUNT, REPLYCNT, "
					+ " FILENAME, PROFILENAME, FAVORITE, HASHTAG FROM BBS"
					+ " WHERE SEQ = ? ";
			
			Connection conn = null;
			PreparedStatement psmt = null;
			ResultSet rs = null;
			
			int count = 0;
			BbsDto dto = null;
			
			try {
				
			conn = DBConnection.makeConnection();
			conn.setAutoCommit(false);

			psmt = conn.prepareStatement(sql1);
			
			psmt.setInt(1, seq);
			
			count = psmt.executeUpdate();
			
			psmt.clearParameters();
			
			psmt = conn.prepareStatement(sql2);
			
			psmt.setInt(1, seq);
			
			rs = psmt.executeQuery();
			
			if (rs.next()) {
				
				int bSeq = rs.getInt(1);
				String id = rs.getString(2);
				String title = rs.getString(3);
				String content = rs.getString(4);
				String wdate = rs.getString(5);
				int del = rs.getInt(6);
				int readcount = rs.getInt(7);
				int replycnt = rs.getInt(8);
				String filename = rs.getString(9);
				String profilename = rs.getString(10);
			    int favorite = rs.getInt(11);
			    String hashtag = rs.getString(12);
			    
			    dto = new BbsDto(bSeq, id, title, content, wdate, del, readcount, 
			    		replycnt, filename, profilename, favorite, hashtag);
			}

			} catch (SQLException e) {
				e.printStackTrace();
			} finally {			
				try {
					conn.setAutoCommit(true);
				} catch (SQLException e) {				
					e.printStackTrace();
				}
				
				DBClose.close(psmt, conn, null);
				System.out.println("6/6 answer success");		
			}
			
			return dto;
		}
	
	
	
	@Override
	public boolean addReply(int bbsSeq) {
	
		return false;
	
	}


	@Override
	public boolean addBbs(BbsDto dto) {
		String sql = " INSERT INTO BBS "
				+ " (SEQ, ID, TITLE, CONTENT, WDATE, DEL, READCOUNT, REPLYCNT, FILENAME, PROFILENAME, FAVORITE, HASHTAG) "
				+ " VALUES(B_SEQ.NEXTVAL,?,?,?,SYSDATE,0,0,0,?,?,0,?) ";

		Connection conn = null;
		PreparedStatement psmt = null;

		int count = 0;

		try {
			conn = DBConnection.makeConnection();
			System.out.println("1/6 setContent success");

			psmt = conn.prepareStatement(sql);
			System.out.println("2/6 setContent success");

			psmt.setString(1, dto.getId());
			psmt.setString(2, dto.getTitle());
			psmt.setString(3, dto.getContent());
			psmt.setString(4, dto.getFilename());
			psmt.setString(5, dto.getProfilename());
			psmt.setString(6, dto.getHashtag());

			count = psmt.executeUpdate();
			System.out.println("3/6 setContent success");

		} catch (SQLException e) {
			System.out.println("setContent fail");
		} finally {
			DBClose.close(psmt, conn, null);
		}
		System.out.println("END setContent success");
		return count > 0 ? true : false;
	}

	@Override
	public List<BbsDto> getBbsList() {
		String sql = " SELECT SEQ, ID, TITLE, CONTENT, WDATE, DEL, READCOUNT, REPLYCNT, FILENAME, PROFILENAME, FAVORITE, HASHTAG"
				+ " FROM BBS " + " ORDER BY WDATE DESC";

		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;

		List<BbsDto> list = new ArrayList<BbsDto>();

		try {
			conn = DBConnection.makeConnection();
			System.out.println("1/6 getBbsList Success");

			psmt = conn.prepareStatement(sql);
			System.out.println("2/6 getBbsList Success");

			rs = psmt.executeQuery();
			System.out.println("3/6 getBbsList Success");

			while (rs.next()) {
				BbsDto dto = new BbsDto(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4),
						rs.getString(5), rs.getInt(6), rs.getInt(7), rs.getInt(8), rs.getString(9), rs.getString(10), rs.getInt(11),
						rs.getString(12));
				list.add(dto);
			}
			System.out.println("4/6 getBbsList Success");

		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("getBbsList fail");
		} finally {
			DBClose.close(psmt, conn, rs);
			System.out.println("END getBbsList Success");
		}
		
		return list;
	}

	@Override
	public List<BbsDto> getBestList() {
		String sql = " SELECT SEQ, ID, TITLE, CONTENT, WDATE, DEL, READCOUNT, REPLYCNT, FILENAME, PROFILENAME, FAVORITE, HASHTAG "
				+ " FROM BBS " 
				+ " ORDER BY FAVORITE DESC, READCOUNT DESC, WDATE DESC";

		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;

		List<BbsDto> list = new ArrayList<BbsDto>();

		try {
			conn = DBConnection.makeConnection();
			System.out.println("1/6 getBbsList Success");

			psmt = conn.prepareStatement(sql);
			System.out.println("2/6 getBbsList Success");

			rs = psmt.executeQuery();
			System.out.println("3/6 getBbsList Success");

			while (rs.next()) {
				BbsDto dto = new BbsDto(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4),
						rs.getString(5), rs.getInt(6), rs.getInt(7), rs.getInt(8), rs.getString(9), rs.getString(10), rs.getInt(11),
						rs.getString(12));
				list.add(dto);
			}
			System.out.println("4/6 getBbsList Success");

		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("getBbsList fail");
		} finally {
			DBClose.close(psmt, conn, rs);
			System.out.println("END getBbsList Success");
		}
		
		return list;
	}

	@Override
	public FavoriteDto Like(String id, int b_seq) {
		
		String sql  = " UPDATE FAVORITE "
				+ " SET LIKECHECK = LIKECHECK + 1 "
				+ " WHERE ID = ? AND BSEQ = ? ";
		
		String sql2 = " UPDATE FAVORITE "
				+ " SET LIKECHECK = 0 "
				+ " WHERE ID = ? AND BSEQ = ? "; 
		
		String sql3 = " UPDATE BBS "
				+ " SET FAVORITE = FAVORITE + 1 WHERE SEQ = ? ";
		
		String sql4 = " UPDATE BBS "
				+ " SET FAVORITE = FAVORITE - 1 WHERE SEQ = ? ";
		
		
		String sql5 = " SELECT BSEQ, LIKECHECK, ID FROM FAVORITE "
				+ " WHERE BSEQ = ? AND ID = ? ";
		
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		
		FavoriteDto dto = null;
		int count = 0;
		
		try {
		
		
		conn = DBConnection.makeConnection();
		conn.setAutoCommit(false);
		System.out.println("1/6 putLike Success");

		psmt = conn.prepareStatement(sql);
		psmt.setString(1, id);
		psmt.setInt(2, b_seq);
		System.out.println("2/6 putLike Success");
		
		count = psmt.executeUpdate();
		System.out.println("3/6 putLike Success");
		
		psmt.clearParameters();
		
		//=============================================
		
		psmt = conn.prepareStatement(sql3);
		psmt.setInt(1, b_seq);
		System.out.println("4/6 putLikeAfter Success");
		
		rs = psmt.executeQuery();
		System.out.println("5/6 putLikeAfter Success");
		
		//=============================================
		
		psmt = conn.prepareStatement(sql5);
		psmt.setInt(1, b_seq);
		psmt.setString(2, id);
		
		if (rs.next()) {
			int B_Seq = rs.getInt(1);
			int LikeCheck = rs.getInt(2);
			String UserId = rs.getString(3);
			
			dto = new FavoriteDto(B_Seq, LikeCheck, UserId);
		}
		
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {			
			try {
				conn.setAutoCommit(true);
			} catch (SQLException e) {				
				e.printStackTrace();
			}
			
			DBClose.close(psmt, conn, rs);
			System.out.println("6/6 Like success");		
		}
		
		return dto;
	}

	@Override
	public FavoriteDto getCheckLike(String id, int b_seq) {
		String sql = " SELECT LIKECHECK FROM FAVORITE "
				+ " WHERE BSEQ = ? AND ID = ? ";
		
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		
		FavoriteDto dto = null;
		
		try {
		
		conn = DBConnection.makeConnection();
		System.out.println("1/6 getCheckLike Success");
		
		psmt = conn.prepareStatement(sql);
		System.out.println("2/6 getCheckLike Success");

		psmt.setInt(1, b_seq);
		psmt.setString(2, id);
		
		rs = psmt.executeQuery();
		System.out.println("3/6 getCheckLike Success");
		
		if (rs.next()) {
			int LikeCheck = rs.getInt(1);
			
			dto = new FavoriteDto(LikeCheck);
		}
		
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBClose.close(psmt, conn, rs);
			System.out.println("END GetCheckLike Success");
		}
		
		return dto;
	}

	@Override
	public boolean BbsUpdate(String title, String content, int b_seq) {
		
		String sql = " UPDATE BBS SET CONTENT = ? "
				+ " , TITLE = ? WHERE SEQ = ? "; 
				
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		
		conn = DBConnection.makeConnection();
		
		try {
		
		psmt = conn.prepareStatement(sql);
		
		psmt.setString(1, title);
		psmt.setString(2, content);
		psmt.setInt(3, b_seq);
		
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBClose.close(psmt, conn, rs);
			System.out.println("END Update Success");
		}
		return false;
	}
	
	
}
