
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet({ "*.mem", "/ctrl2" })
public class Controller2 extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public Controller2() {
		super();
		// TODO Auto-generated constructor stub
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("[Controller]");
		
		String cmd = command(request);
	
		switch (cmd) {
		case "login.mem":
			System.out.println("login.mem");
			break;
		case "reg.mem":
			System.out.println("reg.mem");
			break;

		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
	
	public static String command(HttpServletRequest request) {
		
		String uri = request.getRequestURI();
		String path = request.getContextPath();
		String cmd = uri.substring(path.length() + 1);
		
		System.out.println("uri : " + uri);
		System.out.println("path : " + path);
		return cmd;
	}

}
