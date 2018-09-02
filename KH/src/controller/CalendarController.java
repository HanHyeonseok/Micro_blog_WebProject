package controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.CalendarDAO;
import dao.CalendarDAOImpl;
import dto.CalendarDto;

public class CalendarController extends HttpServlet {

	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doProcess(req, resp);
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doProcess(req, resp);
	}
	
	public void doProcess(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String command = req.getParameter("command");
		CalendarDAO dao = CalendarDAO.getInstance();
		
		String tempid = "111";
		//나중에 아이디 세션에서 받으시면 
		
		
		if(command.equals("write")) {
			
			req.setCharacterEncoding("utf-8");
			//MemberDto mem = (MemberDto)session.getAttribute("login");
			//String id = mem.getId();
			resp.setContentType("text/html; charset=utf-8");


			String rdate = ""+req.getParameter("year")+formatTwo(req.getParameter("month"))+formatTwo(req.getParameter("day"))+formatTwo(req.getParameter("hour"))+formatTwo(req.getParameter("min"));

			String title = req.getParameter("title");

			String content = req.getParameter("content");

			CalendarDto dto = new CalendarDto("111", title, content, rdate);

			boolean result = dao.addCalendar(dto);

			if(result == true){

				PrintWriter out = resp.getWriter();
						
				out.println("<script>alert(\"성공적으로 일정을 입력했습니다.\");location.href = \"calendar.jsp\"</script>");		
				
				
			}else{
				PrintWriter out = resp.getWriter();
				
				out.println("<script>alert(\"성공적으로 일정을 입력했습니다.\");location.href = \"calendar.jsp\"</script>");		
			}
		}		
		
	}

	public void dispatch(String urls, HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{
		RequestDispatcher dispatch = req.getRequestDispatcher(urls);
		
		dispatch.forward(req, resp);
	}
	
	public String formatTwo(String month) {
		if(month.length()== 1) {
			month = "0"+month;
		}
		return month;
	}

}
