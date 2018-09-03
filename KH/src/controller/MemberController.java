package controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.jasper.tagplugins.jstl.core.Out;
import dao.MemberDAO;
import dao.MemberDAOImpl;
import dto.MemberDto;

public class MemberController extends HttpServlet{

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
		
		MemberDAOImpl memDao = MemberDAO.getInstance();
		
		if(command.equals("login")) {
			System.out.println("doProcess 실행");	
			
			String id = req.getParameter("id");
			String pwd = req.getParameter("pwd");
			
			MemberDto mem = memDao.login(new MemberDto(id, pwd));
			
			
			if(mem != null && !mem.getId().equals("")) {
				HttpSession session = null;
				
				if(session == null) {
					
					session = req.getSession(true);
					session.setAttribute("login", mem);
					session.setMaxInactiveInterval(30*60);
					dispatch("index.jsp", req, resp);
				
				}
				
			}
			else {
				dispatch("login.jsp", req, resp);
			}
		}
		
		else if(command.equals("join")) {
			System.out.println("doProcess 실행");	
			
			String id = req.getParameter("id");
			String pwd = req.getParameter("pwd");
			String name = req.getParameter("name");
			String email = req.getParameter("email");
			/*address_num , address , Detail_Address
			658-서울특별시-*/ 
			String addressnum= req.getParameter("address_num");
			String address1= req.getParameter("address");
			String addressDtaile = req.getParameter("Detail_Address");			
			String address= addressnum+"-"+address1+"-"+addressDtaile;
			String phone = req.getParameter("phone");
			
			System.out.println("id = " + id);
			System.out.println("pwd = " + pwd);
			System.out.println("name = " + name);
			System.out.println("email = " + email);
			System.out.println("address = " + address);
			System.out.println("phone = " + phone);
			
			
			boolean b = memDao.addMember(new MemberDto(id, pwd, name, email, address, phone, null, 0));
			
			PrintWriter out = resp.getWriter();
			if(b) {
				System.out.println("회원가입 성공");
				dispatch("index.jsp", req, resp);
			}
			else {
				
				System.out.println("회원가입 실패");
				dispatch("index.jsp", req, resp);
			}
			
		}
		
		else if(command.equals("idCheck")) {
			System.out.println("doProcess 실행");
			
			String id = req.getParameter("id");
			System.out.println("id = " + id);
			
			boolean b =memDao.checkId(id);
			
		
			StringBuffer json = new StringBuffer();
			json.append("{");
			json.append(" \"status\" : \"success\", "); // 요청한 것 잘 처리했고,
			json.append(" \"duplicated\" : " + b); // 그 결과는 isDuplicated이다.
			json.append(" } ");
	
			PrintWriter writer = resp.getWriter();
			writer.write(json.toString());
			writer.flush();
			writer.close();

		}
		
		else if(command.equals("logout")) {
			System.out.println("doProcess 실행");
			
			HttpSession session = req.getSession();
			
			session.invalidate();
			
			if(req.getSession(false) == null) {
				System.out.println("세션이 만료되었습니다");
				
				dispatch("index.jsp", req, resp);
			}		
			
			
		}
		
		
		
		
				
		
	}
	
	
	public void dispatch(String urls, HttpServletRequest req, HttpServletResponse resp)throws ServletException, IOException {
		
		RequestDispatcher dispatch = req.getRequestDispatcher(urls);
		dispatch.forward(req, resp);		
	}
	
	
}
