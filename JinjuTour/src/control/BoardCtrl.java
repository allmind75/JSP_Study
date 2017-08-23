package control;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import dao.BoardDAO;
import dto.BoardTripDTOIn;

@WebServlet("*.board")
public class BoardCtrl extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private BoardDAO dao;
	private static final int MAX_SIZE = 1024 * 1024 * 10; // 10Mbyte 제한
	private static final String SAVE_PATH = "C:\\Users\\hybrid\\git\\jsp_study\\JinjuTour\\WebContent\\images\\trip\\";

	public BoardCtrl() throws IOException {
		super();
		dao = new BoardDAO();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html); charset=UTF-8");

		String cmd = ComMethod.parseAdminCommand(request);
		System.out.println("cmd : " + cmd);

		try {
			switch (cmd) {
			case "writeTrip.board":
				insertTrip(request, response);
				break;
			case "listTrip.board":
				listTrip(request, response);
				break;
			case "readTrip.board":
				readTrip(request, response);
				break;
			case "updateTrip.board":
				updateTrip(request, response);
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

	public void insertTrip(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException, SQLException {

		// DefaultFileRenamePolicy() - 이름 중복 방지, 중복된 이름이 있으면 파일명 뒤에 숫자 추가
		MultipartRequest multipartRequest = new MultipartRequest(request, SAVE_PATH, MAX_SIZE, "UTF-8",
				new DefaultFileRenamePolicy());

		String title = multipartRequest.getParameter("title");
		String content = multipartRequest.getParameter("content");
		String address = multipartRequest.getParameter("address");
		String phone = multipartRequest.getParameter("phone");
		String time = multipartRequest.getParameter("time");
		String map = multipartRequest.getParameter("map");
		String img = ComMethod.fileUpload(request, multipartRequest, SAVE_PATH, "img");

		BoardTripDTOIn dto = new BoardTripDTOIn(title, content, address, phone, time, img, map);

		if (dao.insertTrip(dto)) {
			System.out.println("게시글 추가 완료");
			ComMethod.sendRedirect(response, "listTrip.board");
		} else {
			System.out.println("게시글 추가 실패");
		}

	}

	public void listTrip(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException, SQLException {

		List<BoardTripDTOIn> list = dao.selectListTrip();
		if (list != null) {
			request.setAttribute("LISTTRIP", list);
			ComMethod.forward(request, response, "listTrip.jsp");
		}
	}

	public void readTrip(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException, SQLException {

		String tnum = request.getParameter("tnum");
		BoardTripDTOIn dto = dao.selectReadTrip(tnum);

		if (dto != null) {
			request.setAttribute("READTRIP", dto);
			ComMethod.forward(request, response, "readTrip.jsp");
		}
	}

	public void updateTrip(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException, SQLException {

		// DefaultFileRenamePolicy() - 이름 중복 방지, 중복된 이름이 있으면 파일명 뒤에 숫자 추가
		MultipartRequest multipartRequest = new MultipartRequest(request, SAVE_PATH, MAX_SIZE, "UTF-8",
				new DefaultFileRenamePolicy());

		String tnums = multipartRequest.getParameter("tnum");
		int tnum = Integer.parseInt(tnums);
		String title = multipartRequest.getParameter("title").trim();
		String content = multipartRequest.getParameter("content").trim();
		String address = multipartRequest.getParameter("address").trim();
		String phone = multipartRequest.getParameter("phone").trim();
		String time = multipartRequest.getParameter("time").trim();
		String map = multipartRequest.getParameter("map").trim();
		String img = ComMethod.fileUpload(request, multipartRequest, SAVE_PATH, "img");

		BoardTripDTOIn dto = new BoardTripDTOIn(tnum, title, content, address, phone, time, img, map);

		if (dao.updateTrip(dto)) {
			System.out.println("수정완료");
			// 글 수정 완료
			ComMethod.sendRedirect(response, "listTrip.board");
		} else {
			System.out.println("수정실패");
			// 글 수저 실패
		}
	}
}
