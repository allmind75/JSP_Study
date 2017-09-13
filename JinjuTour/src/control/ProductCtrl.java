package control;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import dao.BoardProductDAO;
import dao.HeartProductDAO;
import dao.ReplyProductDAO;
import dto.BoardProductDTO;
import dto.Criteria;
import dto.HeartDTO;
import dto.PageMaker;
import dto.ReplyDTO;
import dto.SearchCriteria;

@WebServlet("*.po")
public class ProductCtrl extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private BoardProductDAO dao;
	private HeartProductDAO heartDAO;
	private ReplyProductDAO replyDAO;
	
	private static final int MAX_SIZE = 1024 * 1024 * 10; // 10Mbyte 제한
	private static final String SAVE_PATH = "C:\\Users\\hybrid\\git\\jsp_study\\JinjuTour\\WebContent\\images\\product\\";

	public ProductCtrl() throws IOException {
		super();
		dao = new BoardProductDAO();
		heartDAO = new HeartProductDAO();
		replyDAO = new ReplyProductDAO();
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
			case "heart.po":
				heart(request, response);
				break;
			case "replyAdd.po":
				replyAdd(request, response);
				break;
			case "replyListProduct.po":
				replyListProduct(request, response);
				break;
			case "replyRemove.po":
				replyRemove(request, response);
				break;
			case "replyModify.po":
				replyModify(request, response);
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
		cri.setPerPageNum(10);
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
	
	public void replyAdd(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		PrintWriter out = response.getWriter();
		int pnum = Integer.parseInt(request.getParameter("pnum"));
		String replyer = request.getParameter("id");
		String replytext = request.getParameter("replytext");

		ReplyDTO dto = new ReplyDTO(pnum, replytext, replyer);

		try {
			replyDAO.addReply(dto);
			out.print("{\"cnt\":true}");
		} catch (SQLException e) {
			out.print("{\"cnt\":false}");
		}
	}

	public void replyListProduct(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException, SQLException {

		int pnum = Integer.parseInt(request.getParameter("pnum"));
		int page = Integer.parseInt(request.getParameter("page"));
		
		PrintWriter out = response.getWriter();
		Criteria cri = new Criteria();
		cri.setPage(page);
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		
		// 댓글 리스트
		List<ReplyDTO> listReply = replyDAO.listReply(pnum, cri);
				
		// 전체 댓글 수, board_trip 테이블에 update
		int replyCount = replyDAO.count(pnum);
		dao.updateReply(pnum, replyCount);
		
		//pageMaker 설정
		pageMaker.setTotalCount(replyCount);
		
		//map 형태로 저장 후 전송
		HashMap<String, Object> map = new HashMap<>();
		map.put("LISTREPLY", listReply);
		map.put("COUNT", replyCount);
		map.put("PAGEMAKER", pageMaker);
		
		// map 형태 JSON으로 변환, jackson lib 사용
		ObjectMapper mapper = new ObjectMapper();

		String jsonData = mapper.writeValueAsString(map);

		out.print(jsonData);
	}

	public void replyRemove(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		int rno = Integer.parseInt(request.getParameter("rno"));
		PrintWriter out = response.getWriter();

		try {
			replyDAO.removeReply(rno);
			out.print("{\"cnt\":true}");
		} catch (SQLException e) {
			out.print("{\"cnt\":false}");
		}
	}

	public void replyModify(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		int rno = Integer.parseInt(request.getParameter("rno"));
		String replytext = request.getParameter("replytext");
		PrintWriter out = response.getWriter();
		
		ReplyDTO dto = new ReplyDTO();
		dto.setRno(rno);
		dto.setReplytext(replytext);
		
		try {
			replyDAO.modifyReply(dto);
			out.print("{\"cnt\":true}");
		} catch (SQLException e) {
			out.print("{\"cnt\":false}");
		}
	}
}
