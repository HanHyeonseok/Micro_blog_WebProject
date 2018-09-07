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
			
			String sql = " SELECT SEQ, ID, TITLE, CONTENT, WDATE, DEL, READCOUNT, REPLYCNT, "
					+ " FILENAME, PROFILENAME, FAVORITE, HASHTAG FROM BBS"
					+ " WHERE SEQ = ? ";
			
			Connection conn = null;
			PreparedStatement psmt = null;
			ResultSet rs = null;
			
			BbsDto dto = null;
			
			System.out.println("1/6 getBbsDetail success");
			
			conn = DBConnection.makeConnection();
			
			try {
				psmt = conn.prepareStatement(sql);
				System.out.println("2/6 getBbsDetail success");
				
				psmt.setInt(1, seq);
				
				rs = psmt.executeQuery();
				System.out.println("3/6 getBbsDetail success");
				
				while(rs.next()) {
					dto = new BbsDto(rs.getInt(1), rs.getString(2), 
									rs.getString(3), rs.getString(4), 
									rs.getString(5), rs.getInt(6), 
									rs.getInt(7), rs.getInt(8), 
									rs.getString(9), rs.getString(10),
									rs.getInt(11), rs.getString(12));
				}
				
				System.out.println("4/6 getBbsDetail success");
				
			} catch (SQLException e) {
				System.out.println("getBbsDetail failed");	
				e.printStackTrace();
			} finally {
				DBClose.close(psmt, conn, null);
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
		}
		
		System.out.println("END getBbsList Success");
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
	public List<BbsDto> getSearchList(String str) {
		
		return null;
	}
}
