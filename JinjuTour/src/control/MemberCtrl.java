package control;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import dao.BoardTripDAO;
import dao.MemDAO;
import dto.MemDTOIn;

@WebServlet("*.mem")
public class MemberCtrl extends HttpServlet {

	private static final long serialVersionUID = 1L;
	private MemDAO dao;
	private BoardTripDAO boardTripDAO;

	// file save
	private static final int MAX_SIZE = 1024 * 1024 * 10; // 10Mbyte 제한
	private static final String SAVE_PATH = "C:\\Users\\hybrid\\git\\jsp_study\\JinjuTour\\WebContent\\images\\userImg\\";

	public MemberCtrl() throws IOException {
		super();
		dao = new MemDAO();
		boardTripDAO = new BoardTripDAO();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");

		String cmd = ComMethod.parseCommand(request);
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

			case "delete.mem":
				delete(request, response);
				break;

			case "loadMod.mem":
				loadMod(request, response);
				break;

			case "mod.mem":
				mod(request, response);
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

	public void idCheck(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException, SQLException {

		String id = request.getParameter("id");
		PrintWriter out = response.getWriter();

		if (dao.idCheck(id)) {
			// id 중복안됨
			out.print("{\"ret\":true}");
		} else {
			// id 중복됨
			out.print("{\"ret\":false}");
		}
		out.close();
	}

	public void reg(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException, SQLException {

		// img file upload
		MultipartRequest multipartRequest = new MultipartRequest(request, SAVE_PATH, MAX_SIZE, "UTF-8",
				new DefaultFileRenamePolicy());
		String path = ComMethod.fileUpload(request, multipartRequest, SAVE_PATH, "uploadFile");

		String id = multipartRequest.getParameter("id");
		String pw = multipartRequest.getParameter("pw");
		String name = multipartRequest.getParameter("name");
		String phone = multipartRequest.getParameter("phoneNum1") + multipartRequest.getParameter("phoneNum2")
				+ multipartRequest.getParameter("phoneNum3");
		String email = multipartRequest.getParameter("email");

		MemDTOIn dto = new MemDTOIn(id, pw, name, phone, email, path);
		
		if (dao.reg(dto)) {
			
			//사진이 추가된 경우만 실행
			if(path != null) {
				dao.insertMemberImg(dto);
			}
			
			// 회원가입 성공하면 로그인 상태로 만듬
			// 1. session 가져옴
			HttpSession session = request.getSession();

			// 2. session에 아이디 저장
			session.setAttribute("USERID", id);
			session.setAttribute("USERNAME", name);
			session.setAttribute("USEREMAIL", email);
			session.setAttribute("USERIMG", path);

			session.setMaxInactiveInterval(600);

			// 3. page 이동
			ComMethod.sendRedirect(response, "main.mo");

		} else {
			// 회원가입실패
		}

	}

	public void login(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException, SQLException {

		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		String checkBox = request.getParameter("state");
		String path;		

		MemDTOIn dto = new MemDTOIn(id, pw);
		MemDTOIn resultDto = dao.login(dto);
		path = dao.selectMemberImg(id);

		if (resultDto != null) {
			System.out.println("로그인성공 : id - " + id);

			String name = resultDto.getName();
			String email = resultDto.getEmail();

			HttpSession session = request.getSession();

			session.setAttribute("USERID", id);
			session.setAttribute("USERNAME", name);
			session.setAttribute("USEREMAIL", email);
			session.setAttribute("USERIMG", path);

			// session 유지시간 설정(초단위) 600 = 10분, 일정 시간뒤 자동 로그아웃, default - 30분
			if(checkBox == null) {
				session.setMaxInactiveInterval(600);
			} else {
				if(checkBox.equals("on")) {
					session.setMaxInactiveInterval(1800);	//로그인 상태 유지 체크시
				}
			}
			//http://fruitdev.tistory.com/113

			ComMethod.sendRedirect(response, "main.mo");
		} else {
			// 로그인실패
			System.out.println("로그인실패");
			ComMethod.sendRedirect(response, "loginFail.jsp");
		}
	}

	public void logout(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("USERID");

		if (id != null) {
			session.invalidate();
			ComMethod.sendRedirect(response, "main.mo");
		}
	}

	public void delete(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException, SQLException {

		HttpSession session = request.getSession();
		PrintWriter out = response.getWriter();
		String id = (String) session.getAttribute("USERID");

		//회원 탈퇴시 사진 있으면 삭제하는 부분 추가해야함
		
		
		if (dao.delete(id)) {
			//탈퇴 후 좋아요 숫자 갱신
			boardTripDAO.updateHeartSync();
			
			System.out.println("회원탈퇴 성공");
			session.invalidate();
			out.print("{\"ret\":true}");
		} else {
			// 탈퇴실패
			out.print("{\"ret\":false}");
		}
		out.close();
	}

	public void loadMod(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException, SQLException {

		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("USERID");

		MemDTOIn list = dao.loadMod(id);

		if (list != null) {

			String phone = list.getPhone();

			String phoneNum1 = null;
			String phoneNum2 = null;
			String phoneNum3 = null;

			if (phone.length() == 11) {
				phoneNum1 = phone.substring(0, 3);
				phoneNum2 = phone.substring(3, 7);
				phoneNum3 = phone.substring(7, 11);
			} else if (phone.length() == 10) {
				phoneNum1 = phone.substring(0, 3);
				phoneNum2 = phone.substring(3, 6);
				phoneNum3 = phone.substring(6, 10);
			}

			request.setAttribute("PHONE1", phoneNum1);
			request.setAttribute("PHONE2", phoneNum2);
			request.setAttribute("PHONE3", phoneNum3);

			ComMethod.forward(request, response, "userInfoEdit.jsp");
		} else {
			// 회원정보가져오기 실패
		}
	}

	public void mod(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException, SQLException {

		// img file upload
		MultipartRequest multipartRequest = new MultipartRequest(request, SAVE_PATH, MAX_SIZE, "UTF-8",
				new DefaultFileRenamePolicy());
		String path = ComMethod.fileUpload(request, multipartRequest, SAVE_PATH, "uploadFile");

		HttpSession session = request.getSession();

		String id = (String) session.getAttribute("USERID");
		String pw = multipartRequest.getParameter("pw");
		String name = multipartRequest.getParameter("name");
		String phone = multipartRequest.getParameter("phoneNum1") + multipartRequest.getParameter("phoneNum2")
				+ multipartRequest.getParameter("phoneNum3");
		String email = multipartRequest.getParameter("email");

		if (pw.equals("")) {
			pw = null;
		}

		MemDTOIn dto = new MemDTOIn(id, pw, name, phone, email, path);

		if (dao.mod(dto)) {

			// db에 회원사진이 있는지 확인 후 없으면 추가 있으면 바꿈
			String oldImg = dao.selectMemberImg(id);
			if (path != null) {
				if (oldImg == null) {
					dao.insertMemberImg(dto);
				} else {
					dao.updateMemberImg(dto);
				}
			} else {
				path = oldImg;
			}

			session.setAttribute("USERNAME", name);
			session.setAttribute("USEREMAIL", email);
			session.setAttribute("USERIMG", path);

			ComMethod.sendRedirect(response, "main.mo");
		} else {
			// 회원정보변경 실패
			System.out.println("회원정보변경실패");
		}
	}
}
