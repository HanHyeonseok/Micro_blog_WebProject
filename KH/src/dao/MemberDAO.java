package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import db.DBClose;
import db.DBConnection;
import dto.MemberDto;


public class MemberDAO implements MemberDAOImpl{

	// 싱글톤 설정
	private static MemberDAO memberDAO = new MemberDAO();
	
	private MemberDAO() {
		DBConnection.initConnect();
	}
	
	public static MemberDAO getInstance() {
		return memberDAO;
	}

	// 로그인
	@Override
	public MemberDto login(MemberDto dto) {
		String sql = " SELECT ID, NAME, EMAIL, ADDRESS, PHONE, IMG, AUTH "
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
				String address = rs.getString(4);
				String phone = rs.getString(5);
				String img = rs.getString(6);
				int auth = rs.getInt(7);
				
				mem = new MemberDto(id, null, name, email, address, phone, img, auth);				
			}
			System.out.println("4/6 login success");
			
		} catch (SQLException e) {
			System.out.println("login fail");
		} finally {
			DBClose.close(psmt, conn, rs);			
		}						
		
		return mem;
	}
	
	// 멤버 추가
	@Override
	public boolean addMember(MemberDto dto) {
		
		String sql = " INSERT INTO MEMBER "
				+ " (ID, PWD, NAME, EMAIL, ADDRESS, PHONE, IMG, AUTH) "
				+ " VALUES(?, ?, ?, ?, ?, ?, ?, 0) ";
		
		Connection conn = null;
		PreparedStatement psmt = null;
		System.out.println("1");
		int count = 0;
		
		try {
			conn = DBConnection.makeConnection();
			psmt = conn.prepareStatement(sql);
			
			System.out.println("2");
			psmt.setString(1, dto.getId());
			psmt.setString(2, dto.getPwd());
			psmt.setString(3, dto.getName());
			psmt.setString(4, dto.getEmail());
			psmt.setString(5, dto.getAddress());
			psmt.setString(6, dto.getPhone());
			psmt.setString(7, dto.getImg());
			
			System.out.println("3");
			count = psmt.executeUpdate();
			System.out.println("4");
		}catch (SQLException e) {
			System.out.println("addMember fail");
		}finally {
			DBClose.close(psmt, conn, null);			
		}
		System.out.println("End addMember success");
		
		return count>0?true:false;
	}

	// 멤버 수정
	@Override
	public boolean updateMember(String id) {
		String sql = " UPDATE MEMBER "
				+ " SET NAME=2"
				+ " WHERE ID=? ";
		
		Connection conn = null;
		PreparedStatement psmt = null;
		System.out.println("1");
		int count = 0;
		
		try {
			conn = DBConnection.makeConnection();
			psmt = conn.prepareStatement(sql);
			
			System.out.println("2");
			psmt.setString(1, id);
		
			
			System.out.println("3");
			count = psmt.executeUpdate();
			System.out.println("4");
		}catch (SQLException e) {
			System.out.println("updateMember fail");
		}finally {
			DBClose.close(psmt, conn, null);			
		}
		System.out.println("End addMember success");
		
		return count>0?true:false;
	}

	@Override
	public boolean deleteMember(MemberDto dto) {
		// TODO Auto-generated method stub
		return false;
	}

	// 아이디 체크
	@Override
	public boolean checkId(String id) {
		String sql = " SELECT ID FROM MEMBER"
				+" WHERE ID=?";
		
		Connection conn = null;			// DB info
		PreparedStatement psmt = null;	// sql query
		ResultSet rs = null;			// result value
		
		Boolean findId = false;
		
		try {
			conn = DBConnection.makeConnection();
			
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, id);
			
			rs = psmt.executeQuery();
			
			if(rs.next()) {
				findId = true;
			}
			
		} catch (SQLException e) {			
			e.printStackTrace();
		} finally {
			DBClose.close(psmt, conn, rs);			
		}
		
		return findId;

	}
}
