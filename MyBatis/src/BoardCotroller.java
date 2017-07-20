
import java.io.IOException;

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

	public BoardCotroller() throws IOException {
		super();
		// TODO Auto-generated constructor stub
		dao = new BoardDAO();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub

		String cmd = parseCommand(request);
		System.out.println("cmd : " + cmd);

		switch (cmd) {
		case "write.bo":
			// 글쓰기
			BoardDTOIn dto = new BoardDTOIn("myBatis!!", "myBatis 활용하기");

			dao.write(dto);
			
			
			break;

		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

	public static String parseCommand(HttpServletRequest request) {

		return request.getRequestURI().substring(request.getContextPath().length() + 1);
	}

}
