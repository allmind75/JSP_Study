package control;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.MemDAO;
import dto.MemDTOIn;

@WebServlet("*.mem")
public class MemberCtrl extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
	private MemDAO dao;

	public MemberCtrl() throws IOException {
		super();
		dao = new MemDAO();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");

		String cmd = parseCommand(request);
		System.out.println("cmd : " + cmd);

		try {
			switch (cmd) {
			case "idCheck.mem":
				idCheck(request, response);
				break;
				
			case "reg.mem":
				reg(request, response);
				break;
				
			case "login.mem":
				login(request, response);
				break;
				
			case "logout.mem":
				logout(request, response);
				break;
			
			case "deleteMem.mem":
				deleteMem(request, response);
				break;
				
			}
		} catch (SQLException e) {
			System.out.println("SQL Error : " + e.getMessage());
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

	public void idCheck(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String id = request.getParameter("id");

		PrintWriter out = response.getWriter();

		try {
			if (dao.idCheck(id)) {
				// id 중복안됨
				out.print("{\"ret\":" + true + "}");
			} else {
				// id 중복됨
				out.print("{\"ret\":" + false + "}");
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}
		out.close();
	}

	public void reg(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException, SQLException {

		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		String name = request.getParameter("name");
		String phone = request.getParameter("phoneNum1") + request.getParameter("phoneNum2")
				+ request.getParameter("phoneNum3");
		String email = request.getParameter("email");
		
		MemDTOIn dto = new MemDTOIn(id, pw, name, phone, email);

		if (dao.reg(dto)) {
			//회원가입 성공하면 로그인 상태로 만듬
			
			//1. session 가져옴
			HttpSession session = request.getSession();
			
			//2. session에 아이디 저장
			session.setAttribute("USERID", id);
			session.setAttribute("USERNAME", name);
			session.setAttribute("USEREMAIL", email);
			
			//3. page 이동
			sendRedirect(response, "main.jsp");
			
		} else {
			//회원가입실패
		}

	}
	
	public void login(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException, SQLException {
		
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		
		MemDTOIn dto = new MemDTOIn(id, pw);
		List list = dao.login(dto);
		
		if(list != null) {
			System.out.println("로그인성공 : id - " + id);
			
			HashMap map = (HashMap) list.get(0);
			
			String name = (String) map.get("name");
			String email = (String) map.get("email");
						
			HttpSession session = request.getSession();
			
			session.setAttribute("USERID", id);
			session.setAttribute("USERNAME", name);
			session.setAttribute("USEREMAIL", email);
			
			sendRedirect(response, "main.jsp");
		} else {
			//로그인실패
			System.out.println("로그인실패");
			sendRedirect(response, "loginFail.jsp");
		}
	}
	
	public void logout(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("USERID");
		
		if(id == null) {
			//로그인상태가 아니면 login.jsp로 이동
			 sendRedirect(response, "login.jsp");
		} else {
			session.invalidate();
			sendRedirect(response, "main.jsp");
		}
	}
	
	public void deleteMem(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException, SQLException {
	
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("USERID");
		
		if(dao.delete(id)) {
			System.out.println("회원탈퇴 성공");
			session.invalidate();
			sendRedirect(response, "main.jsp");
		} else {
			//탈퇴실패
		}
	}
	
	//request 객체 전달
	public void forward(HttpServletRequest request, HttpServletResponse response, String view) 
			throws ServletException, IOException {
		
		RequestDispatcher rd = request.getRequestDispatcher(view);
		rd.forward(request, response);
	}
	
	//request 객체 새로 생성됨
	public void sendRedirect(HttpServletResponse response, String view) throws IOException{
		response.sendRedirect(view);
	}
	
	public static String parseCommand(HttpServletRequest request) {

		return request.getRequestURI().substring(request.getContextPath().length() + 1);
	}
}
