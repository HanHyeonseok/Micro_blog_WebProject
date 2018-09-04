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

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import dao.BbsDAO;
import dao.BbsDAOImpl;

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

		if (command.equals("addreply")) {

		}

		// 게시판글 작성
		else if (command.equals("bbsWrite")) {
			String id = "";
			String title = "";
			String content = "";
			String hashtag = "";
			String filename = "";

			String fupload = req.getSession().getServletContext().getRealPath("/upload");
			String yourTempDirectory = fupload;
			
			int yourMaxRequestSize = 100 * 1024 * 1024;
			int yourMaxMemorySize = 1000 * 1024;

			boolean isMultipart = ServletFileUpload.isMultipartContent(req);
			
			if (isMultipart) {
				DiskFileItemFactory factory = new DiskFileItemFactory();
				
				factory.setSizeThreshold(yourMaxMemorySize);
				factory.setRepository(new File(yourTempDirectory));

				ServletFileUpload upload = new ServletFileUpload(factory);
				upload.setSizeMax(yourMaxRequestSize);

				try {
					List<FileItem> items = upload.parseRequest(req);
					
					Iterator<FileItem> it = items.iterator();
					
					while (it.hasNext()) {
						FileItem item = it.next();
						if (item.isFormField()) {
							if (item.getFieldName().equals("userId")) {
								id = item.getString("utf-8");
								System.out.println("userId:" + id);
							} else if (item.getFieldName().equals("title")) {
								title = item.getString("utf-8");
								System.out.println("title:" + title);
							} else if (item.getFieldName().equals("content")) {
								content = item.getString("utf-8");
								System.out.println("content:" + content);
							}else if (item.getFieldName().equals("hashtag")) {
								hashtag = item.getString("utf-8");
								System.out.println("hashtag:" + hashtag);
							}
						} else {
							if (item.getFieldName().equals("files")) {
								filename = processUploadFile(item, fupload, null);
								System.out.println("filename:" + filename);
							}
						}
					}
				} catch (FileUploadException e) {
					e.printStackTrace();
				}
			} else {
				
			}
			
			
		}

	}

	// fileName 가공
	public String processUploadFile(FileItem fileItem, String dir, JspWriter out) throws IOException {
		String fileName = fileItem.getName();
		long sizeInBytes = fileItem.getSize();

		if (sizeInBytes > 0) {
			int idx = fileName.lastIndexOf("\\");
			if (idx == -1) {
				idx = fileName.lastIndexOf("/");
			}
			fileName = fileName.substring(idx + 1);

			try {
				File uploadFile = new File(dir, fileName);
				fileItem.write(uploadFile);
			} catch (Exception e) {
			}
		}

		return fileName;
	}

	// dispatch method
	public void dispatch(String urls, HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		RequestDispatcher dispatch = req.getRequestDispatcher(urls);
		dispatch.forward(req, resp);
	}
}
