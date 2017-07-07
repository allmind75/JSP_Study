package test;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		// response.getWriter().append("Served at:
		// ").append(request.getContextPath());

		String id = request.getParameter("id");
		String pw = request.getParameter("pw");

		response.getWriter().append("ID : " + id);
		response.getWriter().append("PW : " + pw);

		System.out.println("--doGet--");
		System.out.println(id);
		System.out.println(pw);

		
		//데이터베이스 연동
		dto.setId(id);
		dto.setPw(pw);

		try {
			if(dao.login(dto)) {
				System.out.println("로그인성공");
				response.sendRedirect("login_ok.jsp");
			} else {
				System.out.println("로그인실패");
				response.sendRedirect("login_fail.jsp");
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
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
