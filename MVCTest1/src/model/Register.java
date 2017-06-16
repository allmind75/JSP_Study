package model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Register implements Command {

	public String process(HttpServletRequest req, HttpServletResponse res) {
		req.setAttribute("member_reg", "회원가입");
		return "member_reg.jsp";
	}
}
