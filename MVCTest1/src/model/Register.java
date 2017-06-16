package model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Register implements Command {

	public String process(HttpServletRequest req, HttpServletResponse res) {
		req.setAttribute("member_reg", "회원가입");		//필요한 데이터 저장
		return "member_reg.jsp";						//각 모델에 해당하는 jsp 이름 리턴
	}
}
