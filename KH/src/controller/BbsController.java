package controller;

import java.io.File;
import java.io.IOException;
import java.util.Iterator;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.jsp.JspWriter;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import dao.BbsDAO;
import dao.BbsDAOImpl;
import dto.BbsDto;

public class BbsController extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doProcess(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doProcess(req, resp);
	}

	public void doProcess(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		
		req.setCharacterEncoding("utf-8");
		resp.setContentType("text/html; charset=utf-8");

		String command = req.getParameter("command");
		BbsDAOImpl bbsDao = BbsDAO.getInstance();
		
		if(command.equals("addreply")) {

		}

		// 게시판글 작성
		else if (command.equals("bbsWrite")) {

			String savePath = req.getServletContext().getRealPath("/upload");
			
			int sizeLimit = 1024*1024*15;
			
			MultipartRequest multi = new MultipartRequest(req, savePath, sizeLimit, "utf-8", new DefaultFileRenamePolicy());
			
			String id = multi.getParameter("userId");
			String title = multi.getParameter("title");
			String content = multi.getParameter("title");
			String hashtag = multi.getParameter("hashtag");
			
			String fileName = multi.getFilesystemName("files");
			
			BbsDto dto = new BbsDto(0, id, title, content, null, 0, 0, 0, fileName, 0, hashtag);
			
			boolean isS = bbsDao.addBbs(dto);
			
			if(isS) {
				// 성공
			}else {
				req.setAttribute("bbsWriteResult", "false");
			}
			
			dispatch("bbslist.jsp", req, resp);
			}
		
			// 게시판 리스트
			else if(command.equals("bbsList")) {
				
				List<BbsDto> bbslist = bbsDao.getBbsList();
			
				req.setAttribute("bbslist", bbslist);
				
				dispatch("index.jsp", req, resp);
			}
		
			else if(command.equals("detail")) {
				System.out.println("왔따");
				System.out.println(req.getParameter("sequence"));
				
			}
		
		}

	
	
	// dispatch method
	public void dispatch(String urls, HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		RequestDispatcher dispatch = req.getRequestDispatcher(urls);
		dispatch.forward(req, resp);
	}
}
