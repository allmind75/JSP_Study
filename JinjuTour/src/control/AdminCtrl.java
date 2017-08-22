package control;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;

import dao.AdminDAO;
import dto.AdminDTOIn;
import dto.BoardTripDTOIn;

@WebServlet("*.admin")
public class AdminCtrl extends HttpServlet {

	private static final long serialVersionUID = 1L;
	private AdminDAO dao;

	public AdminCtrl() throws IOException {
		super();
		dao = new AdminDAO();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html); charset=UTF-8");

		String cmd = parseCommand(request);
		System.out.println("cmd : " + cmd);

		try {
			switch (cmd) {
			case "login.admin":
				login(request, response);
				break;
			case "logout.admin":
				logout(request, response);
				break;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

	public void login(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException, SQLException {

		String id = request.getParameter("id");
		String pw = request.getParameter("pw");

		AdminDTOIn dto = new AdminDTOIn(id, pw);

		if (dao.login(dto)) {

			HttpSession session = request.getSession();
			session.setAttribute("ADMINID", id);
			session.setAttribute("ADMINNAME", "관리자");
			session.setMaxInactiveInterval(600);

			forward(request, response, "/admin/readTrip.board");
		} else {
			// 로그인 실패
		}

	}

	public void logout(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException, SQLException {

		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("ADMINID");

		if (id != null) {
			session.invalidate();
			sendRedirect(response, "/JinjuTour/admin/index.jsp");
		}
	}

	public static String parseCommand(HttpServletRequest request) {

		int idx = request.getRequestURI().lastIndexOf("/");
		return request.getRequestURI().substring(idx + 1);
	}

	// request 객체 전달
	public void forward(HttpServletRequest request, HttpServletResponse response, String view)
			throws ServletException, IOException {

		RequestDispatcher rd = request.getRequestDispatcher(view);
		rd.forward(request, response);
	}

	// request 객체 새로 생성됨
	public void sendRedirect(HttpServletResponse response, String view) throws IOException {
		response.sendRedirect(view);
	}
}
