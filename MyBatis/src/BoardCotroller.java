
import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import db.BoardDAO;
import db.BoardDTOIn;
import db.PageOut;

@WebServlet("*.bo")
public class BoardCotroller extends HttpServlet {

	private static final long serialVersionUID = 1L;
	private BoardDAO dao;
	private BoardDTOIn dto;

	public BoardCotroller() throws IOException {
		super();
		// TODO Auto-generated constructor stub
		dao = new BoardDAO();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		// 한글 깨짐 처리
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		String cmd = parseCommand(request);
		System.out.println("cmd : " + cmd);

		switch (cmd) {
		case "write.bo":
			// 글쓰기
			write(request, response);
			break;
		case "list.bo":
			list(request, response);
			break;
		case "find.bo":
			find(request, response);
			break;
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

	public void write(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		dto = new BoardDTOIn(request.getParameter("title"), request.getParameter("content"));

		if (dao.write(dto)) {
			// 글이 정상적으로 데잍베이스에 저장
			// 글 목록 가져와서, 목록을 jsp view 까지 전달

			// (1) 바로 list 메소드 직접 호출,
			// 호출 후 페이지에서 새로고침시 글내용 계속 추가되는 문제발생!!
			//list(request, response);

			// (2) response의 sendRedirect() 이용
			response.sendRedirect("list.bo");

			// (3) RequestDispatcher 이용
			// 호출 후 페이지에서 새로고침시, 글내용 계속 추가되는 문제발생!!
			// forward 시 write.bo 부터 실행되기 때문에..
			// RequestDispatcher rd = request.getRequestDispatcher("list.bo");
			// rd.forward(request, response);

		} else {
			// 데이터베이스에 저장 실패
		}
	}

	public void list(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		int totalPage;			//전체 글의 개수
		int pageCnt;			//페이지 개수
		int prevPage, nextPage;	//다음페이지, 이전페이지 번호
		int pageNum;			//현재 페이지 번호
		int pageSize;			//페이지 글의 개수
		
		List list;
		PageOut pageOut;
		
		
		// pageNum, pageSize 값이 null 인 경우 예외처리
		try {
			pageNum = Integer.parseInt(request.getParameter("pageNum"));
			pageSize = Integer.parseInt(request.getParameter("pageSize"));
		} catch (NumberFormatException e) {
			pageNum = 0;
			pageSize = 10;
		}

		// 페이지 개수
		totalPage = dao.count();
		pageCnt = totalPage / pageSize;

		if (totalPage % pageSize != 0) {
			pageCnt++;
		}

		prevPage = pageNum - 1; // -1이면 이전 페이지 없음
		if(prevPage < 0) {
			prevPage = 0;
		}
		nextPage = pageNum + 1;
		if (nextPage >= pageCnt) {
			nextPage--; // -1이면 다음 페이지 없음
		}
		
		pageOut = new PageOut(pageNum, pageSize, totalPage, pageCnt, prevPage, nextPage);
		
		list = dao.list(pageNum, pageSize);

		if (list.size() > 0) {

			// for(int i=0 ; i<list.size(); i++) {
			// HashMap rs = (HashMap)list.get(i);
			// System.out.println(rs.get("title") + " " + rs.get("content") + "
			// " + rs.get("count") + " " + rs.get("reg_date"));
			// }

			// request로 list 전달
			request.setAttribute("LIST", list);
			request.setAttribute("PAGE", pageOut);
			
			RequestDispatcher rd = request.getRequestDispatcher("list.jsp");
			rd.forward(request, response);

		} else {
			// 글목록이 하나도 없음
		}
	}
	
	public void find(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String word = request.getParameter("word");
		int mode = Integer.parseInt(request.getParameter("mode"));
		
		System.out.println("search");
		System.out.println("word : " + word);
		System.out.println("mode : " + mode);
		
		dao.find(word, mode);
		
	}

	public static String parseCommand(HttpServletRequest request) {

		return request.getRequestURI().substring(request.getContextPath().length() + 1);
	}

}
