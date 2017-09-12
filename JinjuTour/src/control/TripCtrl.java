package control;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import dao.BoardTripDAO;
import dao.HeartTripDAO;
import dto.BoardTripDTO;
import dto.HeartDTO;
import dto.PageMaker;
import dto.SearchCriteria;

@WebServlet("*.to")
public class TripCtrl extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private BoardTripDAO dao;
	private HeartTripDAO heartDAO;
	
	private static final int MAX_SIZE = 1024 * 1024 * 10; // 10Mbyte 제한
	private static final String SAVE_PATH = "C:\\Users\\hybrid\\git\\jsp_study\\JinjuTour\\WebContent\\images\\trip\\";

	public TripCtrl() throws IOException {
		super();
		dao = new BoardTripDAO();
		heartDAO = new HeartTripDAO();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");

		String cmd = ComMethod.parseAdminCommand(request);
		System.out.println("GET cmd : " + cmd);

		try {
			switch (cmd) {
			case "write.to":
				insert(request, response);
				break;
			case "list.to":
				list(request, response);
				break;
			case "read.to":
				read(request, response);
				break;
			case "modifyReadPage.to":
				modifyRead(request, response);
				break;
			case "modifyPage.to":
				update(request, response);
				break;
			case "removePage.to":
				remove(request, response);
				break;
			case "modPhoto.to":
				modPhoto(request, response);
				break;
			case "heart.to":
				heart(request, response);
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

	public void insert(HttpServletRequest request, HttpServletResponse response)
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

		BoardTripDTO dto = new BoardTripDTO(title, content, address, phone, time, img, map);

		if (dao.insertTrip(dto)) {
			System.out.println("게시글 추가 완료");
			ComMethod.sendRedirect(response, "list.to");
		} else {
			System.out.println("게시글 추가 실패");
		}

	}

	public void list(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException, SQLException {

		// search cri
		SearchCriteria cri = ComMethod.searchCriteria(request);
		cri.setPerPageNum(10);
		List<BoardTripDTO> list = dao.listSearch(cri);

		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(dao.listSearchCount(cri));

		System.out.println(pageMaker.toString());
		System.out.println(cri.toString());
		
		if (list != null) {

			request.setAttribute("LIST", list);
			request.setAttribute("PAGEMAKER", pageMaker);
			request.setAttribute("CRI", cri);

			ComMethod.forward(request, response, "listTrip.jsp");
		}
	}

	public void read(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException, SQLException {

		int tnum = Integer.parseInt(request.getParameter("tnum"));
		
		BoardTripDTO dto = dao.selectReadTrip(tnum);
		
		SearchCriteria scri = ComMethod.searchCriteria(request);


		if (dto != null) {
			request.setAttribute("READ", dto);
			request.setAttribute("CRI", scri);
			ComMethod.forward(request, response, "readTrip.jsp");
		}
	}

	public void update(HttpServletRequest request, HttpServletResponse response)
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

		BoardTripDTO dto = new BoardTripDTO(tnum, title, content, address, phone, time, img, map);

		PageMaker pageMaker = new PageMaker();

		SearchCriteria scri = ComMethod.searchCriteria(multipartRequest);
		
		pageMaker.setCri(scri);
		
		
		if (dao.updateTrip(dto)) {
			System.out.println("수정완료");
			// 글 수정 완료
			request.setAttribute("CRI", scri);
			ComMethod.sendRedirect(response, "list.to" + pageMaker.makeSearch(scri.getPage()));
		} else {
			System.out.println("수정실패");
			// 글 수저 실패
		}
	}

	public void remove(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException, SQLException {

		int tnum = Integer.parseInt(request.getParameter("tnum"));
		String img = request.getParameter("img");
				
		//파일 삭제
		String path = SAVE_PATH + img;
		File file = new File(path);
				
		SearchCriteria scri = ComMethod.searchCriteria(request);
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(scri);
		
		if (dao.deleteTrip(tnum)) {
			
			//경로에 파일이 존재하면 삭제
			if(file.exists()) {
				file.delete();
			} else {
				//파일 없음
			}
			
			ComMethod.sendRedirect(response, "list.to" + pageMaker.makeSearch(scri.getPage()));
		} else {
			//삭제실패
		}
	}

	public void modifyRead(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException, SQLException {
		
		int tnum = Integer.parseInt(request.getParameter("tnum"));
	
		SearchCriteria scri = ComMethod.searchCriteria(request);

		BoardTripDTO dto = dao.selectReadTrip(tnum);

		if (dto != null) {
			request.setAttribute("READ", dto);
			request.setAttribute("CRI", scri);
			ComMethod.forward(request, response, "modifyTrip.jsp");
		}
	}
	
	public void modPhoto(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException, SQLException {
				
		System.out.println("mod photo");
	}
	
	public void heart(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException, SQLException {
				
		String id = request.getParameter("id");
		int num = Integer.parseInt(request.getParameter("num"));
		
		HeartDTO dto = new HeartDTO(id, num);
				
		if(heartDAO.select(dto) != 0) {
			heartDAO.delete(id);
			dao.updateHeart(num, -1);
		} else {
			heartDAO.insert(dto);
			dao.updateHeart(num, 1);
		}
		
		//좋아요 수 
		int cnt = dao.heartCnt(num);
				
		PrintWriter out = response.getWriter();
		out.print("{\"cnt\":" + cnt + "}");
		
		out.close();
	}
}
