package control;

import java.io.File;
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

import dao.BoardProductDAO;
import dto.BoardProductDTO;
import dto.PageMaker;
import dto.SearchCriteria;

@WebServlet("*.po")
public class ProductCtrl extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private BoardProductDAO dao;
	private static final int MAX_SIZE = 1024 * 1024 * 10; // 10Mbyte 제한
	private static final String SAVE_PATH = "C:\\Users\\hybrid\\git\\jsp_study\\JinjuTour\\WebContent\\images\\product\\";

	public ProductCtrl() throws IOException {
		super();
		dao = new BoardProductDAO();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");

		String cmd = ComMethod.parseAdminCommand(request);
		System.out.println("GET cmd : " + cmd);

		try {
			switch (cmd) {
			case "write.po":
				insert(request, response);
				break;
			case "list.po":
				list(request, response);
				break;
			case "read.po":
				read(request, response);
				break;
			case "modifyReadPage.po":
				modifyRead(request, response);
				break;
			case "modifyPage.po":
				update(request, response);
				break;
			case "removePage.po":
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
		String link = multipartRequest.getParameter("link");
		String map = multipartRequest.getParameter("map");
		String img = ComMethod.fileUpload(request, multipartRequest, SAVE_PATH, "img");

		BoardProductDTO dto = new BoardProductDTO(title, content, address, phone, link, img, map);

		if (dao.insert(dto)) {
			System.out.println("게시글 추가 완료");
			ComMethod.sendRedirect(response, "list.po");
		} else {
			System.out.println("게시글 추가 실패");
		}

	}

	public void list(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException, SQLException {

		// search cri
		SearchCriteria cri = ComMethod.searchCriteria(request);

		List<BoardProductDTO> list = dao.listSearch(cri);

		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(dao.listSearchCount(cri));

		System.out.println(pageMaker.toString());
		System.out.println(cri.toString());
		
		if (list != null) {

			request.setAttribute("LIST", list);
			request.setAttribute("PAGEMAKER", pageMaker);
			request.setAttribute("CRI", cri);

			ComMethod.forward(request, response, "listProduct.jsp");
		}
	}

	public void read(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException, SQLException {

		int pnum = Integer.parseInt(request.getParameter("pnum"));

		BoardProductDTO dto = dao.selectRead(pnum);
		
		SearchCriteria scri = ComMethod.searchCriteria(request);


		if (dto != null) {
			request.setAttribute("READ", dto);
			request.setAttribute("CRI", scri);
			ComMethod.forward(request, response, "readProduct.jsp");
		}
	}

	public void update(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException, SQLException {

		// DefaultFileRenamePolicy() - 이름 중복 방지, 중복된 이름이 있으면 파일명 뒤에 숫자 추가
		MultipartRequest multipartRequest = new MultipartRequest(request, SAVE_PATH, MAX_SIZE, "UTF-8",
				new DefaultFileRenamePolicy());

		String pnums = multipartRequest.getParameter("pnum");
		int pnum = Integer.parseInt(pnums);
		String title = multipartRequest.getParameter("title").trim();
		String content = multipartRequest.getParameter("content").trim();
		String address = multipartRequest.getParameter("address").trim();
		String phone = multipartRequest.getParameter("phone").trim();
		String link = multipartRequest.getParameter("link").trim();
		String map = multipartRequest.getParameter("map").trim();
		String img = ComMethod.fileUpload(request, multipartRequest, SAVE_PATH, "img");

		BoardProductDTO dto = new BoardProductDTO(pnum, title, content, address, phone, link, img, map);

		PageMaker pageMaker = new PageMaker();

		SearchCriteria scri = ComMethod.searchCriteria(multipartRequest);
		
		pageMaker.setCri(scri);
		
		System.out.println(scri.toString());
		
		if (dao.update(dto)) {
			System.out.println("수정완료");
			// 글 수정 완료
			request.setAttribute("CRI", scri);
			ComMethod.sendRedirect(response, "list.po" + pageMaker.makeSearch(scri.getPage()));
		} else {
			System.out.println("수정실패");
			// 글 수저 실패
		}
	}

	public void remove(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException, SQLException {

		int pnum = Integer.parseInt(request.getParameter("pnum"));
		String img = request.getParameter("img");
		
		//파일 삭제
		String path = SAVE_PATH + img;
		File file = new File(path);
		
		System.out.println(path);

		
		SearchCriteria scri = ComMethod.searchCriteria(request);
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(scri);
		
		if (dao.delete(pnum)) {
			
			//경로에 파일이 존재하면 삭제
			if(file.exists()) {
				file.delete();
			} else {
				//파일 없음
			}
			
			ComMethod.sendRedirect(response, "list.po" + pageMaker.makeSearch(scri.getPage()));
		}
	}

	public void modifyRead(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException, SQLException {
		
		int pnum = Integer.parseInt(request.getParameter("pnum"));
	
		SearchCriteria scri = ComMethod.searchCriteria(request);

		BoardProductDTO dto = dao.selectRead(pnum);

		if (dto != null) {
			request.setAttribute("READ", dto);
			request.setAttribute("CRI", scri);
			ComMethod.forward(request, response, "modifyProduct.jsp");
		}
	}
}
