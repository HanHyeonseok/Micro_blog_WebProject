package dao;

import java.io.File;
import java.io.IOException;

import javax.servlet.http.HttpServlet;
import javax.servlet.jsp.JspWriter;

import org.apache.commons.fileupload.FileItem;

import db.DBConnection;

public class BbsDAO implements BbsDAOImpl {

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
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean addBbs(String id, String title, String content, String hashtag, String filename) {
		return false;
	}
}
