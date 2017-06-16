
import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.*;

/**
 * Servlet implementation class ServeltExample
 */
@WebServlet("/ServeltExample")
public class ServeltExample extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ServeltExample() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub

		// String param = request.getParameter("name");
		// Object objRes = null;
		//
		// if(param == null) {
		// objRes = new String("Hello MVC!");
		// } else {
		// objRes = new java.util.Date();
		// }
		//
		// request.setAttribute("result", objRes);
		//
		// RequestDispatcher DS = request.getRequestDispatcher("/view.jsp");
		// DS.forward(request, response);

		String cmd = request.getParameter("cmd");		//cmd 가져옴
		String view = null;
		Command model = null;

		if (cmd == null) {
			request.setAttribute("result", (Object)"Hello");
			view = "view.jsp";
		} else {
			switch (cmd) {
			case "reg":
				model = new Register();
				break;
			case "mod":
				model = new Modify();
				break;
			case "login":
				model = new Login();
				break;
			}
			view = model.process(request, response);	//모델을 이용해서 데이터 처리
		}

		RequestDispatcher DS = request.getRequestDispatcher(view);
		DS.forward(request, response);

		// response.getWriter().append("Served at:
		// ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		// doGet(request, response);
	}

}
