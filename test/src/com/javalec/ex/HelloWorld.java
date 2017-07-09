package com.javalec.ex;

import java.io.IOException;
import java.io.PrintWriter;

import javax.annotation.PostConstruct;
import javax.annotation.PreDestroy;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class HelloWorld
 */
@WebServlet({ "/HelloWorld", "/HWorld" })
public class HelloWorld extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public HelloWorld() {
        super();
        // TODO Auto-generated constructor stub
    }

    
    @Override
    public void init() throws ServletException {
    	//최초 한번호출
    	System.out.println("init");
    }
    
    @Override
    public void destroy() {
    	//servlet 수정, 서버 재가동 등 ...호출
    	System.out.println("destroy");
    }
    
    @PostConstruct
    private void initPostConstruct() {
    	//init() 전 실행, 선처리 메소드
    	System.out.println("initPostConstruct");
    }
    
    @PreDestroy
    private void destroyPreDestroy() {
    	//destroy() 후 실행, 후처리 메소드
    	System.out.println("destroyPreDestroy");
    }
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		
		response.getWriter().append("Served at: ").append(request.getContextPath());
		
		String str = request.getParameter("name");
		
		System.out.println("servlet test");
		
		
		//응답시 ContentType 설정
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter writer = response.getWriter();
		writer.println("<html>");
		writer.println("<head>");
		writer.println("</head>");
		writer.println("<body>");
		writer.println("<h1>Servlet Test</h1>");
		writer.println("</body>");
		writer.println("</html>");
		writer.close();
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
