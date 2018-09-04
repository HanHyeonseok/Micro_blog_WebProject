package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.BbsDAO;
import dao.BbsDAOImpl;

public class BbsController extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doProcess(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doProcess(req, resp);
	}

	public void doProcess(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{
		req.setCharacterEncoding("utf-8");		
		resp.setContentType("text/html; charset=utf-8"); 
		
		String command = req.getParameter("command");
		
		BbsDAOImpl bbsDao = BbsDAO.getInstance();
		
		if(command.equals("addreply")) {
			
		}
		
		// 게시판글 작성
		else if(command.equals("bbsWrite")) {
			String userId = req.getParameter("userId");
			String title = req.getParameter("title");
			String content = req.getParameter("content");
			String hashtag = req.getParameter("hashtag");
			String images[] = req.getParameterValues("files");
			
			System.out.println(userId+" // "+content+" // "+images.length+" // "+images[0]);
		}
		
		
	}
	
	public void dispatch(String urls, HttpServletRequest req, HttpServletResponse resp)throws ServletException, IOException {
		RequestDispatcher dispatch = req.getRequestDispatcher(urls);
		dispatch.forward(req, resp);		
	}
}
