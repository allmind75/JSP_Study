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

import dao.BoardFoodDAO;
import dto.BoardFoodDTO;
import dto.BoardTripDTO;
import dto.PageMaker;
import dto.SearchCriteria;

@WebServlet("*.fo")
public class FoodCtrl extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private BoardFoodDAO dao;
	private static final int MAX_SIZE = 1024 * 1024 * 10; // 10Mbyte 제한
	private static final String SAVE_PATH = "C:\\Users\\hybrid\\git\\jsp_study\\JinjuTour\\WebContent\\images\\food\\";

	public FoodCtrl() throws IOException {
		super();
		dao = new BoardFoodDAO();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html); charset=UTF-8");

		String cmd = ComMethod.parseAdminCommand(request);
		System.out.println("GET cmd : " + cmd);

		try {
			switch (cmd) {
			case "write.fo":
				insert(request, response);
				break;
			case "list.fo":
				list(request, response);
				break;
			case "read.fo":
				read(request, response);
				break;
			case "update.fo":
				update(request, response);
				break;
			case "modifyReadPage.fo":
				modifyRead(request, response);
				break;
			case "modifyPage.fo":
				update(request, response);
				break;
			case "removePage.fo":
				remove(request, response);
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
		String menu = multipartRequest.getParameter("menu");
		String map = multipartRequest.getParameter("map");
		String img = ComMethod.fileUpload(request, multipartRequest, SAVE_PATH, "img");

		BoardFoodDTO dto = new BoardFoodDTO(title, content, address, phone, time, menu, img, map);

		if (dao.insert(dto)) {
			System.out.println("게시글 추가 완료");
			ComMethod.sendRedirect(response, "list.fo");
		} else {
			System.out.println("게시글 추가 실패");
		}

	}

	public void list(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException, SQLException {

		// search cri
		SearchCriteria cri = ComMethod.searchCriteria(request);

		List<BoardFoodDTO> list = dao.listSearch(cri);

		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(dao.listSearchCount(cri));

		System.out.println(pageMaker.toString());
		System.out.println(cri.toString());
		
		if (list != null) {

			request.setAttribute("LIST", list);
			request.setAttribute("PAGEMAKER", pageMaker);
			request.setAttribute("CRI", cri);

			ComMethod.forward(request, response, "listFood.jsp");
		}
	}

	public void read(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException, SQLException {

		int fnum = Integer.parseInt(request.getParameter("fnum"));

		BoardFoodDTO dto = dao.selectRead(fnum);
		
		SearchCriteria scri = ComMethod.searchCriteria(request);


		if (dto != null) {
			request.setAttribute("READ", dto);
			request.setAttribute("CRI", scri);
			ComMethod.forward(request, response, "readFood.jsp");
		}
	}

	public void update(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException, SQLException {

		// DefaultFileRenamePolicy() - 이름 중복 방지, 중복된 이름이 있으면 파일명 뒤에 숫자 추가
		MultipartRequest multipartRequest = new MultipartRequest(request, SAVE_PATH, MAX_SIZE, "UTF-8",
				new DefaultFileRenamePolicy());

		String fnums = multipartRequest.getParameter("fnum");
		int fnum = Integer.parseInt(fnums);
		String title = multipartRequest.getParameter("title").trim();
		String content = multipartRequest.getParameter("content").trim();
		String address = multipartRequest.getParameter("address").trim();
		String phone = multipartRequest.getParameter("phone").trim();
		String time = multipartRequest.getParameter("time").trim();
		String menu = multipartRequest.getParameter("menu").trim();
		String map = multipartRequest.getParameter("map").trim();
		String img = ComMethod.fileUpload(request, multipartRequest, SAVE_PATH, "img");

		BoardFoodDTO dto = new BoardFoodDTO(fnum, title, content, address, phone, time, menu, img, map);

		PageMaker pageMaker = new PageMaker();

		SearchCriteria scri = ComMethod.searchCriteria(multipartRequest);
		
		pageMaker.setCri(scri);
		
		
		if (dao.update(dto)) {
			System.out.println("수정완료");
			// 글 수정 완료
			request.setAttribute("CRI", scri);
			ComMethod.sendRedirect(response, "list.fo" + pageMaker.makeSearch(scri.getPage()));
		} else {
			System.out.println("수정실패");
			// 글 수저 실패
		}
	}

	public void remove(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException, SQLException {

		int fnum = Integer.parseInt(request.getParameter("fnum"));
		
		SearchCriteria scri = ComMethod.searchCriteria(request);
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(scri);
		
		if (dao.delete(fnum)) {

			ComMethod.sendRedirect(response, "list.fo" + pageMaker.makeSearch(scri.getPage()));
		}
	}

	public void modifyRead(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException, SQLException {
		
		int fnum = Integer.parseInt(request.getParameter("fnum"));
	
		SearchCriteria scri = ComMethod.searchCriteria(request);

		BoardFoodDTO dto = dao.selectRead(fnum);

		if (dto != null) {
			request.setAttribute("READ", dto);
			request.setAttribute("CRI", scri);
			ComMethod.forward(request, response, "modifyFood.jsp");
		}
	}
}
