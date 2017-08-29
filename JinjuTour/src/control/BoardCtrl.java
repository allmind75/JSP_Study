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
import dto.PageMaker;
import dto.SearchCriteria;

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
		System.out.println("GET cmd : " + cmd);

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
			case "modifyReadPage.board":
				modifyReadTrip(request, response);
				break;
			case "modifyPage.board":
				updateTrip(request, response);
				break;
			case "removePage.board":
				removeTrip(request, response);
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

		// search cri
		SearchCriteria cri = ComMethod.searchCriteria(request);

		List<BoardTripDTOIn> list = dao.listSearch(cri);

		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(dao.listSearchCount(cri));

		System.out.println(pageMaker.toString());
		System.out.println(cri.toString());
		
		if (list != null) {
			// request.setAttribute("LISTTRIP", list);
			// request.setAttribute("PAGE", pageOut);

			request.setAttribute("LISTTRIP", list);
			request.setAttribute("PAGEMAKER", pageMaker);
			request.setAttribute("CRI", cri);

			ComMethod.forward(request, response, "listTrip.jsp");
		}
	}

	public void readTrip(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException, SQLException {

		int tnum = Integer.parseInt(request.getParameter("tnum"));

		BoardTripDTOIn dto = dao.selectReadTrip(tnum);
		
		SearchCriteria scri = ComMethod.searchCriteria(request);


		if (dto != null) {
			request.setAttribute("READTRIP", dto);
			request.setAttribute("CRI", scri);
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

		PageMaker pageMaker = new PageMaker();

		SearchCriteria scri = ComMethod.searchCriteria(multipartRequest);
		
		pageMaker.setCri(scri);
		
		
		if (dao.updateTrip(dto)) {
			System.out.println("수정완료");
			// 글 수정 완료
			request.setAttribute("CRI", scri);
			ComMethod.sendRedirect(response, "listTrip.board" + pageMaker.makeSearch(scri.getPage()));
		} else {
			System.out.println("수정실패");
			// 글 수저 실패
		}
	}

	public void removeTrip(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException, SQLException {

		int tnum = Integer.parseInt(request.getParameter("tnum"));
		
		SearchCriteria scri = ComMethod.searchCriteria(request);
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(scri);
		
		if (dao.deleteTrip(tnum)) {

			ComMethod.sendRedirect(response, "listTrip.board" + pageMaker.makeSearch(scri.getPage()));
		}
	}

	public void modifyReadTrip(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException, SQLException {
		
		int tnum = Integer.parseInt(request.getParameter("tnum"));
	
		SearchCriteria scri = ComMethod.searchCriteria(request);

		BoardTripDTOIn dto = dao.selectReadTrip(tnum);

		if (dto != null) {
			request.setAttribute("READTRIP", dto);
			request.setAttribute("CRI", scri);
			ComMethod.forward(request, response, "modifyTrip.jsp");
		}
	}
}