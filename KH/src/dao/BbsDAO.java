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

		String sql1 = " UPDATE BBS SET READCOUNT = READCOUNT + 1 " + " WHERE SEQ = ? ";

		String sql2 = " SELECT SEQ, ID, TITLE, CONTENT, WDATE, DEL, READCOUNT, REPLYCNT, "
				+ " FILENAME, PROFILENAME, FAVORITE, HASHTAG FROM BBS" + " WHERE SEQ = ? ";

		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;

		int count = 0;
		BbsDto dto = null;

		System.out.println("1/6 getBbsDetail success");

		try {
			conn = DBConnection.makeConnection();
			conn.setAutoCommit(false);

			psmt = conn.prepareStatement(sql1);
			System.out.println("2/6 getBbsDetail success");

			psmt.setInt(1, seq);

			count = psmt.executeUpdate();
			psmt.clearParameters();
			System.out.println("3/6 getBbsDetail success");

			psmt = conn.prepareStatement(sql2);
			psmt.setInt(1, seq);

			rs = psmt.executeQuery();
			System.out.println("4/6 getBbsDetail success");

			if (rs.next()) {
				dto = new BbsDto(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5),
						rs.getInt(6), rs.getInt(7), rs.getInt(8), rs.getString(9), rs.getString(10), rs.getInt(11),
						rs.getString(12));
			}
			System.out.println("5/6 getBbsDetail success");
		} catch (SQLException e) {
			System.out.println("getBbsDetail failed");
			e.printStackTrace();
		} finally {
			try {
				conn.setAutoCommit(true);
			} catch (SQLException e) {
				e.printStackTrace();
			}
			DBClose.close(psmt, conn, null);
		}
		System.out.println("END getBbsDetail success");
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
						rs.getString(5), rs.getInt(6), rs.getInt(7), rs.getInt(8), rs.getString(9), rs.getString(10),
						rs.getInt(11), rs.getString(12));
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
				+ " FROM BBS " + " ORDER BY FAVORITE DESC, READCOUNT DESC, WDATE DESC";

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
						rs.getString(5), rs.getInt(6), rs.getInt(7), rs.getInt(8), rs.getString(9), rs.getString(10),
						rs.getInt(11), rs.getString(12));
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
		String sql = " select * from BBS where (title like '%" + str + "%' OR content like '%" + str
				+ "%' OR hashtag like '%" + str + "%')";

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
						rs.getString(5), rs.getInt(6), rs.getInt(7), rs.getInt(8), rs.getString(9), rs.getString(10),
						rs.getInt(11), rs.getString(12));
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
		String sql = " SELECT * FROM BBS WHERE id = '" + id + "' ORDER BY WDATE DESC ";

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
						rs.getString(5), rs.getInt(6), rs.getInt(7), rs.getInt(8), rs.getString(9), rs.getString(10),
						rs.getInt(11), rs.getString(12));
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
		String sql = " SELECT Like_Check FROM LIKETO" + " WHERE ID=? AND B_SEQ=?";

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
				find = rs.getInt(1);
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
		String sql = " UPDATE BBS" + " SET FAVORITE=FAVORITE+1 " + " WHERE SEQ=?";

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
		} finally {
			DBClose.close(psmt, conn, null);
			System.out.println("4/4 readLike success");
		}

	}

	// 좋아요 테이블 add
	@Override
	public boolean addLiketo(String id, int seq) {
		String sql = " INSERT INTO LIKETO " + " (ID, B_SEQ, LIKE_CHECK) " + " VALUES(?,?,0) ";

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
		String sql = " SELECT ID, B_SEQ FROM LIKETO" + " WHERE ID=? AND B_SEQ=?";

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
				find = true;
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
		String sql = " UPDATE LIKETO" + " SET LIKE_CHECK=1 " + " WHERE ID=? AND B_SEQ=? ";

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
		} finally {
			DBClose.close(psmt, conn, null);
			System.out.println("4/4 fck success");
		}

	}

	// 좋아요 수 감소
	@Override
	public void readLikeDown(int seq) {
		String sql = " UPDATE BBS" + " SET FAVORITE=FAVORITE-1 " + " WHERE SEQ=?";

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
		} finally {
			DBClose.close(psmt, conn, null);
			System.out.println("4/4 readLikeDown success");
		}

	}

	// 좋아요 체크해제
	@Override
	public void fckDown(String id, int seq) {
		String sql = " UPDATE LIKETO" + " SET LIKE_CHECK=0 " + " WHERE ID=? AND B_SEQ=? ";

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
		} finally {
			DBClose.close(psmt, conn, null);
			System.out.println("4/4 readLike success");
		}

	}

	// bbs 좋아요 수 가져오기
	@Override
	public int getLikeCount(int seq) {
		String sql = " SELECT FAVORITE FROM BBS" + " WHERE SEQ=? ";

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
				FAVORITE = rs.getInt(1);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBClose.close(psmt, conn, rs);
		}

		return FAVORITE;
	}

	/*@Override
	public FavoriteDto Like(String id, int b_seq) {

		String sql = " UPDATE FAVORITE " + " SET LIKECHECK = LIKECHECK + 1 " + " WHERE ID = ? AND BSEQ = ? ";

		String sql2 = " UPDATE FAVORITE " + " SET LIKECHECK = 0 " + " WHERE ID = ? AND BSEQ = ? ";

		String sql3 = " UPDATE BBS " + " SET FAVORITE = FAVORITE + 1 WHERE SEQ = ? ";

		String sql4 = " UPDATE BBS " + " SET FAVORITE = FAVORITE - 1 WHERE SEQ = ? ";

		String sql5 = " SELECT BSEQ, LIKECHECK, ID FROM FAVORITE " + " WHERE BSEQ = ? AND ID = ? ";

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

			// =============================================

			psmt = conn.prepareStatement(sql3);
			psmt.setInt(1, b_seq);
			System.out.println("4/6 putLikeAfter Success");

			rs = psmt.executeQuery();
			System.out.println("5/6 putLikeAfter Success");

			// =============================================

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
		String sql = " SELECT LIKECHECK FROM FAVORITE " + " WHERE BSEQ = ? AND ID = ? ";

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

		String sql = " UPDATE BBS SET CONTENT = ? " + " , TITLE = ? WHERE SEQ = ? ";

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
	}*/
}
