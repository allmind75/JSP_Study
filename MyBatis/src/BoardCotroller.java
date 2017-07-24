
import java.io.IOException;
import java.sql.Timestamp;
import java.util.HashMap;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import db.BoardDAO;
import db.BoardDTOIn;

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
		
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

	public void write(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		dto = new BoardDTOIn(request.getParameter("title"), request.getParameter("content"));
		
		if(dao.write(dto)) {
			//글이 정상적으로 데잍베이스에 저장
		} else {
			//데이터베이스에 저장 실패
		}
	}
	
	public void list(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		List list = dao.list();

		if(list.size() > 0) {
			
//			for(int i=0 ; i<list.size(); i++) {
//				HashMap rs = (HashMap)list.get(i);
//				System.out.println(rs.get("title") + " " + rs.get("content") + " " + rs.get("count") + " " + rs.get("reg_date"));
//			}
			
			//request로 list 전달
			request.setAttribute("LIST", list);
			RequestDispatcher rd = request.getRequestDispatcher("list.jsp");
			rd.forward(request, response);
			
		} else {
			//글목록이 하나도 없음
		}
	}
	
	public static String parseCommand(HttpServletRequest request) {

		return request.getRequestURI().substring(request.getContextPath().length() + 1);
	}

}
