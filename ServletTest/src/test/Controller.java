package test;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import member.MemberDAO;
import member.MemberDTO;

/**
 * Servlet implementation class Controller
 */
@WebServlet(name = "CTRL", urlPatterns = { "/CTRL" })
public class Controller extends HttpServlet {
	private static final long serialVersionUID = 1L;

	// DAO, 로그인
	private MemberDAO dao;
	private MemberDTO dto;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Controller() {
		super();
		// TODO Auto-generated constructor stub
		dao = new MemberDAO();
		dto = new MemberDTO();
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */

	public void doLogin(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");

		// session
		HttpSession session = request.getSession();

		response.getWriter().append("ID : " + id);
		response.getWriter().append("PW : " + pw);

		System.out.println("--doGet--");
		System.out.println(id + ", " + pw);

		// 데이터베이스 연동
		dto.setId(id);
		dto.setPw(pw);

		try {
			if (dao.login(dto)) {
				System.out.println("로그인성공");

				// request 내장 객체를 이용해서 다른 jsp 페이지로 값 전달
				// 새로운 페이지로 넘어갈때마다 새로운 request 객체 생성
				request.setAttribute("UserID", id);
				response.setContentType("text/html; charset=UTF-8");

				// session 객체를 이용해서 값을 전달 - 페이지간 session 공유
				session.setAttribute("UserID", id);

				// request에 값 저장해서 다른 페이지로 넘어갈 때
				// RequestDispatcher DS =
				// request.getRequestDispatcher("login_ok_request.jsp");
				// DS.forward(request, response);

				// session에 저장한 값은 유지, request는 안됨
				response.sendRedirect("login_ok_request.jsp");
			} else {
				System.out.println("로그인실패");
				response.sendRedirect("login_fail.jsp");
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public void doLogout(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("UserID");
		
		if(id != null) {
			
			//session에 저장된 모든 값 제거
			session.invalidate();
			
			//Session 에서 값을 선택해서 제거
			//session.removeAttribute("UserID");
			System.out.println("session invalidate / 로그아웃");
			
			//로그아웃 후 index로 돌아감
			response.sendRedirect("index.jsp");
			
		} else {
			System.out.println("로그아웃 실패 : " + id);
		}
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		// utf-8
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");

		// cmd
		String cmd = request.getParameter("cmd");
		System.out.println(cmd);
		switch (cmd) {
		case "login":
			doLogin(request, response);
			break;
		case "logout":
			doLogout(request, response);
			break;
		}

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
