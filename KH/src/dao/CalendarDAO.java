package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import db.DBClose;
import db.DBConnection;
import dto.CalendarDto;

public class CalendarDAO implements CalendarDAOImpl{
	
	private static CalendarDAO calDao = new CalendarDAO();
	
	private CalendarDAO() {		
		DBConnection.initConnect();
	}
	
	public static CalendarDAO getInstance() {
		return calDao;
	}
	
	//일정불러오기
	@Override
	public List<CalendarDto> getCalendarList(String id, String yyyyMM) {
		
		String sql = " SELECT SEQ, ID, TITLE, CONTENT, RDATE, WDATE "
				+ " FROM("
				+ "		SELECT ROW_NUMBER() OVER(PARTITION BY SUBSTR(RDATE, 1, 8) "
				+ "								ORDER BY RDATE ASC) RN, "
				+ "			SEQ, ID, TITLE, CONTENT, RDATE, WDATE "
				+ "		FROM CALENDAR "
				+ "		WHERE ID=? AND SUBSTR(RDATE, 1, 6)=? ) "
				+ "	WHERE RN BETWEEN 1 AND 5";
		
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		
		List<CalendarDto> list = new ArrayList<CalendarDto>();
		
		try {
			conn = DBConnection.makeConnection();
			System.out.println("1/6 getCalendarList success");
				
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, id.trim());
			psmt.setString(2, yyyyMM.trim());
			System.out.println("2/6 getCalendarList success");
			
			rs = psmt.executeQuery();
			System.out.println("3/6 getCalendarList success");
			
			while(rs.next()) {
				CalendarDto dto = new CalendarDto();
				dto.setSeq(rs.getInt(1));
				dto.setId(rs.getString(2));
				dto.setTitle(rs.getString(3));
				dto.setContent(rs.getString(4));
				dto.setRdate(rs.getString(5));
				dto.setWdate(rs.getString(6));
				
				list.add(dto);				
			}		
			System.out.println("4/6 getCalendarList success");
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			
			DBClose.close(psmt, conn, rs);
			System.out.println("5/6 getCalendarList success");
		}		
		
		return list;
	}
	
	//일정추가하기
	@Override
	public boolean addCalendar(CalendarDto cal) {

		String sql = " INSERT INTO CALENDAR(" 
				+ " SEQ, ID, TITLE, CONTENT, RDATE, WDATE) " 
				+ " VALUES(SEQ_CAL.NEXTVAL, "
				+ " ?, ?, ?, ?, SYSDATE) ";

		Connection conn = null;
		PreparedStatement psmt = null;

		int count = 0;
		        
        try {
    		conn = DBConnection.makeConnection();
            System.out.println("1/6 addCalendar success");
            
			psmt = conn.prepareStatement(sql);

            psmt.setString(1, cal.getId());
            psmt.setString(2, cal.getTitle());
            psmt.setString(3, cal.getContent());
            psmt.setString(4, cal.getRdate());
            System.out.println("1/6 addCalendar success");
            
            count = psmt.executeUpdate();
            System.out.println("3/6 addCalendar success");

		} catch (SQLException e) {
			System.out.println("addCalendar fail");
			e.printStackTrace();
		}finally {
			DBClose.close(psmt, conn, null);
			  System.out.println("4/6 addCalendar success");
		}
        return count>0?true:false;
	}

	// 수정하기
	@Override
	public boolean updateDay(CalendarDto dto, int seq) {
		  /*UPDATE CALENDAR
        SET TITLE='설날2' , CONTENT='설날2'
        WHERE SEQ=23;*/
		
		String sql = " UPDATE CALENDAR"
				+ " SET TITLE=?, CONTENT=?"
				+ " WHERE SEQ=?";
		
		Connection conn = null;
		PreparedStatement psmt = null;
		
		int count = 0;

		try {
			conn = DBConnection.makeConnection();
			System.out.println("1/6 updateDay success");

			psmt = conn.prepareStatement(sql);

			psmt.setString(1, dto.getTitle());
			psmt.setString(2, dto.getContent());
			psmt.setInt(3, seq);
			System.out.println("2/6 updateDay success");

			count = psmt.executeUpdate();
			System.out.println("3/6 updateDay success");

		} catch (SQLException e) {
			System.out.println("updateDay fail");
			e.printStackTrace();
		}finally {
			DBClose.close(psmt, conn, null);
			System.out.println("4/6 updateDay success");
		}
		return count>0?true:false;
	}

	//////////////////// 일정 상세보기
	@Override
	public CalendarDto getDay(int seq) {
		
		
		String sql = " SELECT SEQ, ID, TITLE, CONTENT, RDATE, WDATE " 
				+ " FROM CALENDAR "
				+ " WHERE SEQ=? ";

		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;

		CalendarDto dto = null;

		System.out.println("일정 상세보기 sql : " + sql);

		try {
			conn = DBConnection.makeConnection();
			System.out.println("1/6 getDay Success");

			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, seq);
			System.out.println("2/6 getDay Success");

			rs = psmt.executeQuery();
			System.out.println("3/6 getDay Success");

			while (rs.next()) {
				int i = 1;

				dto = new CalendarDto(rs.getInt(i++), // SEQ
						rs.getString(i++), // ID
						rs.getString(i++), // TITLE
						rs.getString(i++), // CONTENT
						rs.getString(i++), // RDATE
						rs.getString(i++) // WDATE
				);
			}
			System.out.println("4/6 getDay Success");
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("fail getDay");
		} finally {
			DBClose.close(psmt, conn, rs);
			System.out.println("5/6 getDay Success");
		}
		return dto;
	}
	
	// 삭제하기
	@Override
	public boolean deleteDay(int seq) {

		String sql = " DELETE FROM CALENDAR"
				+ " WHERE SEQ=?";
		
		Connection conn = null;
		PreparedStatement psmt = null;
		
		int count = 0;
		
		try {
			conn = DBConnection.makeConnection();
			System.out.println("1/6 deleteDay success");
			
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, seq);
			System.out.println("2/6 deleteDay success");
			
			count = psmt.executeUpdate();
			System.out.println("3/6 deleteDay success");
			
		} catch (SQLException e) {
			System.out.println("deleteDay fail");
			e.printStackTrace();
		}finally {
			DBClose.close(psmt, conn, null);
			System.out.println("4/6 deleteDay success");
		}
		return count > 0 ? true:false;

	}
}
