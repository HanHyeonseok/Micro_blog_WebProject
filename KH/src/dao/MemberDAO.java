package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import db.DBClose;
import db.DBConnection;
import dto.MemberDto;

public class MemberDAO implements MemberDAOImpl{
	
	private static MemberDAO memberDao = new MemberDAO();
	
	private MemberDAO() {
		DBConnection.initConnect();
	}
	
	public static MemberDAO getInstance() {
		return memberDao;
	}

	@Override
	public boolean addMember(MemberDto dto) {
		
		String sql = " INSERT INTO MEMBER "
				+ " (ID, PWD, NAME, EMAIL, AUTH) "
				+ " VALUES(?, ?, ?, ?, 3) ";
		
		Connection conn = null;
		PreparedStatement psmt = null;
		
		int count = 0;
		
		try {
			conn = DBConnection.makeConnection();
			System.out.println("1/6 addMember success");
			
			psmt = conn.prepareStatement(sql);
			System.out.println("2/6 addMember success");
			
			psmt.setString(1, dto.getId());
			psmt.setString(2, dto.getPwd());
			psmt.setString(3, dto.getName());
			psmt.setString(4, dto.getEmail());
			
			count = psmt.executeUpdate();
			System.out.println("3/6 addMember success");			
		
		}catch (SQLException e) {
			System.out.println("addMember fail");
		}finally {
			DBClose.close(psmt, conn, null);			
		}
		System.out.println("End addMember success");
		
		return count>0?true:false;
	}

	@Override
	public MemberDto login(MemberDto dto) {
		
		String sql = " SELECT ID, NAME, EMAIL, AUTH "
				+ " FROM MEMBER "
				+ " WHERE ID=? AND PWD=? ";
		
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		
		MemberDto mem = null;
				
		try {
			conn = DBConnection.makeConnection();
			psmt = conn.prepareStatement(sql);
			
			System.out.println("1/6 login success");
			
			psmt.setString(1, dto.getId().trim());
			psmt.setString(2, dto.getPwd());
			
			System.out.println("2/6 login success");
			
			rs = psmt.executeQuery();
			
			System.out.println("3/6 login success");
			
			if(rs.next()) {
				
				String id = rs.getString(1);
				String name = rs.getString(2);
				String email = rs.getString(3);
				int auth = rs.getInt(4);
				
				mem = new MemberDto(id, null, name, email, auth);				
			}
			System.out.println("4/6 login success");
			
		} catch (SQLException e) {
			System.out.println("login fail");
		} finally {
			DBClose.close(psmt, conn, rs);			
		}						
		
		return mem;
	}
	
	
}
