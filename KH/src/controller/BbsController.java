package controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
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

		PrintWriter out = resp.getWriter();

		if (command.equals("addreply")) {

		}

		// 게시판글 작성
		else if (command.equals("bbsWrite")) {
			String savePath = req.getServletContext().getRealPath("/upload");

			int sizeLimit = 1024 * 1024 * 15;

			try {
				MultipartRequest multi = new MultipartRequest(req, savePath, sizeLimit, "utf-8",
						new DefaultFileRenamePolicy());

				String id = multi.getParameter("userId");
				String profilename = multi.getParameter("userImg");
				String title = multi.getParameter("title");
				String content = multi.getParameter("content");
				String hashtag = multi.getParameter("hashtag");
				
				String fileName = multi.getFilesystemName("files");

				if (title.equals("") || content.equals("") || hashtag.equals("") || fileName == null) {
					out.println("<script>alert('양식을 모두 작성해 주세요'); location.href='bbslist.jsp';</script>");
					out.flush();
					return;
				}

				if (!checkFileForm(fileName)) {
					out.println(
							"<script>alert('png, jpg, jpeg의 확장자의 이미지 파일을 사용할 수 있습니다.'); location.href='bbslist.jsp';</script>");
					out.flush();
					return;
				}

				BbsDto dto = new BbsDto(0, id, title, content, null, 0, 0, 0, fileName, profilename, 0, hashtag);
				boolean isS = bbsDao.addBbs(dto);

				if (!isS) {
					out.println("<script>alert('게시글등록 실패'); location.href='bbslist.jsp';</script>");
					out.flush();
				}
				dispatch("bbslist.jsp", req, resp);
			} catch (Exception e) {

			}
		}

		// 디테일 뷰
		else if (command.equals("detail")) {

			String sequence = req.getParameter("sequence");
			int seq = Integer.parseInt(sequence);

			BbsDto dto = bbsDao.getContent(seq);

			req.setAttribute("dto", dto);

			dispatch("bbsdetail.jsp", req, resp);

		}

		// 업데이트
		else if (command.equals("update")) {

		}

		out.close(); // printwriter 마무리
	}

	// 업로드파일 확장자 확인
	public boolean checkFileForm(String fileName) {
		boolean check = false;
		int i = fileName.lastIndexOf(".");

		String str = fileName.substring(i, fileName.length());
		str = str.toLowerCase();

		if (str.equals(".png") || str.equals(".jpg") || str.equals(".jpeg")) {
			check = true;
		}

		return check;
	}

	// dispatch method
	public void dispatch(String urls, HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		RequestDispatcher dispatch = req.getRequestDispatcher(urls);
		dispatch.forward(req, resp);
	}
}
