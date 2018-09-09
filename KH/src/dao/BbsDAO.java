package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import db.DBClose;
import db.DBConnection;
import dto.BbsDto;
import dto.MemberDto;

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
			System.out.println("1/6 getBestList Success");

			psmt = conn.prepareStatement(sql);
			System.out.println("2/6 getBestList Success");

			rs = psmt.executeQuery();
			System.out.println("3/6 getBestList Success");

			while (rs.next()) {
				BbsDto dto = new BbsDto(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4),
						rs.getString(5), rs.getInt(6), rs.getInt(7), rs.getInt(8), rs.getString(9), rs.getString(10), rs.getInt(11),
						rs.getString(12));
				list.add(dto);
			}
			System.out.println("4/6 getBestList Success");

		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("getBestList fail");
		} finally {
			DBClose.close(psmt, conn, rs);
		}
		System.out.println("END getBestList Success");
		return list;
	}

	@Override
	public List<BbsDto> getSearchList(String str) {
		String sql = " select * from BBS where (title like '%"+str+"%' OR content like '%"+str+"%' OR hashtag like '%"+str+"%')";

		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;

		List<BbsDto> list = new ArrayList<BbsDto>();

		try {
			conn = DBConnection.makeConnection();
			System.out.println("1/6 getSearchList Success");

			psmt = conn.prepareStatement(sql);
			System.out.println("2/6 getSearchList Success");

			rs = psmt.executeQuery();
			System.out.println("3/6 getSearchList Success");

			while (rs.next()) {
				BbsDto dto = new BbsDto(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4),
						rs.getString(5), rs.getInt(6), rs.getInt(7), rs.getInt(8), rs.getString(9), rs.getString(10), rs.getInt(11),
						rs.getString(12));
				list.add(dto);
			}
			System.out.println("4/6 getSearchList Success");

		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("getSearchList fail");
		} finally {
			DBClose.close(psmt, conn, rs);
		}
		System.out.println("END getSearchList Success");
		return list;
	}

	@Override
	public List<BbsDto> getUserBbsList(String id) {
		String sql = " SELECT * FROM BBS WHERE id = '"+id+"' ORDER BY WDATE DESC ";

		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;

		List<BbsDto> list = new ArrayList<BbsDto>();

		try {
			conn = DBConnection.makeConnection();
			System.out.println("1/6 getUserBbsList Success");

			psmt = conn.prepareStatement(sql);
			System.out.println("2/6 getUserBbsList Success");

			rs = psmt.executeQuery();
			System.out.println("3/6 getUserBbsList Success");

			while (rs.next()) {
				BbsDto dto = new BbsDto(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4),
						rs.getString(5), rs.getInt(6), rs.getInt(7), rs.getInt(8), rs.getString(9), rs.getString(10), rs.getInt(11),
						rs.getString(12));
				list.add(dto);
			}
			System.out.println("4/6 getUserBbsList Success");

		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("getUserBbsList fail");
		} finally {
			DBClose.close(psmt, conn, rs);
		}
		System.out.println("END getUserBbsList Success");
		return list;
	}
	
	// 좋아요 체크확인
	   @Override
	   public int checkF(String id, int seq) {
	      String sql = " SELECT Like_Check FROM LIKETO" 
	            + " WHERE ID=? AND B_SEQ=?";

	      Connection conn = null; // DB info
	      PreparedStatement psmt = null; // sql query
	      ResultSet rs = null; // result value

	      int find = 0;

	      try {
	         conn = DBConnection.makeConnection();

	         psmt = conn.prepareStatement(sql);
	         psmt.setString(1, id);
	         psmt.setInt(2, seq);

	         rs = psmt.executeQuery();

	         if (rs.next()) {
	            find= rs.getInt(1);
	         }

	      } catch (SQLException e) {
	         e.printStackTrace();
	      } finally {
	         DBClose.close(psmt, conn, rs);
	      }

	      return find;

	      
	   }
	   // 좋아요 read
	   @Override
	   public void readLike(int seq) {
	      String sql = " UPDATE BBS"
	            + " SET FAVORITE=FAVORITE+1 "
	            + " WHERE SEQ=?";
	      
	      Connection conn = null;
	      PreparedStatement psmt = null;
	      
	      

	      try {
	         conn = DBConnection.makeConnection();
	         System.out.println("1/4 readLike success");

	         psmt = conn.prepareStatement(sql);
	         psmt.setInt(1, seq);
	      
	      
	         System.out.println("2/4 readLike success");

	         psmt.executeUpdate();
	         System.out.println("3/4 readLike success");

	      } catch (SQLException e) {
	         System.out.println("updateDay fail");
	         e.printStackTrace();
	      }finally {
	         DBClose.close(psmt, conn, null);
	         System.out.println("4/4 readLike success");
	      }
	      
	      
	   }
	   
	   
	   // 좋아요 테이블 add
	   @Override
	   public boolean addLiketo(String id, int seq) {
	      String sql = " INSERT INTO LIKETO "
	            + " (ID, B_SEQ, LIKE_CHECK) "
	            + " VALUES(?,?,0) ";
	      
	      
	      Connection conn = null;
	      PreparedStatement psmt = null;

	      int count = 0;

	      try {
	         conn = DBConnection.makeConnection();
	         System.out.println("1/3 addLiketo success");

	         psmt = conn.prepareStatement(sql);
	         System.out.println("2/3 addLiketo success");

	         psmt.setString(1, id);
	         psmt.setInt(2, seq);
	         
	      

	         count = psmt.executeUpdate();
	         System.out.println("3/3 addLiketo success");

	      } catch (SQLException e) {
	         System.out.println("setContent fail");
	      } finally {
	         DBClose.close(psmt, conn, null);
	      }
	      System.out.println("END setContent success");
	      return count > 0 ? true : false;
	   }

	   // 좋아요 테이블 찾기
	   @Override
	   public boolean findLiketo(String id, int seq) {
	      String sql = " SELECT ID, B_SEQ FROM LIKETO" 
	            + " WHERE ID=? AND B_SEQ=?";

	      Connection conn = null; // DB info
	      PreparedStatement psmt = null; // sql query
	      ResultSet rs = null; // result value

	      boolean find = false;

	      try {
	         conn = DBConnection.makeConnection();

	         psmt = conn.prepareStatement(sql);
	         psmt.setString(1, id);
	         psmt.setInt(2, seq);

	         rs = psmt.executeQuery();

	         if (rs.next()) {
	            find=  true;
	         }

	      } catch (SQLException e) {
	         e.printStackTrace();
	      } finally {
	         DBClose.close(psmt, conn, rs);
	      }

	      return find;
	   }

	   // 좋아요 체크
	   @Override
	   public void fck(String id, int seq) {
	      String sql = " UPDATE LIKETO"
	            + " SET LIKE_CHECK=1 "
	            + " WHERE ID=? AND B_SEQ=? ";
	      
	      Connection conn = null;
	      PreparedStatement psmt = null;
	      
	      

	      try {
	         conn = DBConnection.makeConnection();
	         System.out.println("1/4 fck success");

	         psmt = conn.prepareStatement(sql);
	         psmt.setString(1, id);
	         psmt.setInt(2, seq);
	      
	      
	         System.out.println("2/4 fck success");

	         psmt.executeUpdate();
	         System.out.println("3/4 fck success");

	      } catch (SQLException e) {
	         System.out.println("fck fail");
	         e.printStackTrace();
	      }finally {
	         DBClose.close(psmt, conn, null);
	         System.out.println("4/4 fck success");
	      }
	      
	   }

	   // 좋아요 수 감소
	   @Override
	   public void readLikeDown(int seq) {
	      String sql = " UPDATE BBS"
	            + " SET FAVORITE=FAVORITE-1 "
	            + " WHERE SEQ=?";
	      
	      Connection conn = null;
	      PreparedStatement psmt = null;
	      
	      

	      try {
	         conn = DBConnection.makeConnection();
	         System.out.println("1/4 readLikeDown success");

	         psmt = conn.prepareStatement(sql);
	         psmt.setInt(1, seq);
	      
	      
	         System.out.println("2/4 readLikeDown success");

	         psmt.executeUpdate();
	         System.out.println("3/4 readLikeDown success");

	      } catch (SQLException e) {
	         System.out.println("readLikeDown fail");
	         e.printStackTrace();
	      }finally {
	         DBClose.close(psmt, conn, null);
	         System.out.println("4/4 readLikeDown success");
	      }
	      
	   }
	   
	   // 좋아요 체크해제
	   @Override
	   public void fckDown(String id, int seq) {
	      String sql = " UPDATE LIKETO"
	            + " SET LIKE_CHECK=0 "
	            + " WHERE ID=? AND B_SEQ=? ";
	      
	      Connection conn = null;
	      PreparedStatement psmt = null;
	      
	      

	      try {
	         conn = DBConnection.makeConnection();
	         System.out.println("1/4 readLike success");

	         psmt = conn.prepareStatement(sql);
	         psmt.setString(1, id);
	         psmt.setInt(2, seq);
	      
	      
	         System.out.println("2/4 readLike success");

	         psmt.executeUpdate();
	         System.out.println("3/4 readLike success");

	      } catch (SQLException e) {
	         System.out.println("updateDay fail");
	         e.printStackTrace();
	      }finally {
	         DBClose.close(psmt, conn, null);
	         System.out.println("4/4 readLike success");
	      }
	      
	   }

	   // bbs 좋아요 수 가져오기
	   @Override
	   public int getLikeCount(int seq) {
	      String sql = " SELECT FAVORITE FROM BBS" 
	            + " WHERE SEQ=? ";

	      Connection conn = null; // DB info
	      PreparedStatement psmt = null; // sql query
	      ResultSet rs = null; // result value

	      int FAVORITE = 0;

	      try {
	         conn = DBConnection.makeConnection();

	         psmt = conn.prepareStatement(sql);
	         psmt.setInt(1, seq);
	         

	         rs = psmt.executeQuery();

	         if (rs.next()) {
	            FAVORITE= rs.getInt(1);
	         }

	      } catch (SQLException e) {
	         e.printStackTrace();
	      } finally {
	         DBClose.close(psmt, conn, rs);
	      }

	      return FAVORITE;
	   }
}
