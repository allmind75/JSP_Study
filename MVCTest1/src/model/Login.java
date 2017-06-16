package model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Login implements Command {

	public String process(HttpServletRequest req, HttpServletResponse res) {
		req.setAttribute("member_login", "회원 로그인");
		return "member_login.jsp";
	}
	
	
}
