package control;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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

		if (dao.reg(dto) > 0) {
			response.sendRedirect("login.jsp");
		}

	}

	public static String parseCommand(HttpServletRequest request) {

		return request.getRequestURI().substring(request.getContextPath().length() + 1);
	}
}
