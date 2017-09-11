package control;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.BoardFoodDAO;
import dao.BoardProductDAO;
import dao.BoardTripDAO;
import dto.BoardFoodDTO;
import dto.BoardProductDTO;
import dto.BoardTripDTO;
import dto.PageMaker;
import dto.SearchCriteria;

@WebServlet("*.mo")
public class MainCtrl extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private BoardTripDAO tripDAO;
	private BoardFoodDAO foodDAO;
	private BoardProductDAO productDAO;

	public MainCtrl() throws IOException {
		super();
		tripDAO = new BoardTripDAO();
		foodDAO = new BoardFoodDAO();
		productDAO = new BoardProductDAO();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");

		String cmd = ComMethod.parseCommand(request);
		System.out.println("GET cmd : " + cmd);

		try {
			switch (cmd) {
			case "main.mo":
				recommend(request, response);
				break;
			case "trip.mo":
				listTrip(request, response);
				break;
			case "readTrip.mo":
				readTrip(request, response);
				break;
			case "food.mo":
				listFood(request, response);
				break;
			case "readFood.mo":
				readFood(request, response);
				break;
			case "product.mo":
				listProduct(request, response);
				break;
			case "readProduct.mo":
				readProduct(request, response);
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

	public void recommend(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException, SQLException {

		// 관광지, 맛집, 특산물에서 2개씩 가져와서 보여주기
		List<BoardTripDTO> tripList = tripDAO.selectRecommend();
		List<BoardFoodDTO> foodList = foodDAO.selectRecommend();
		List<BoardProductDTO> productList = productDAO.selectRecommend();
		
		if(tripList != null && foodList != null && productList != null) {
			
			request.setAttribute("TRIPLIST", tripList);
			request.setAttribute("FOODLIST", foodList);
			request.setAttribute("PRODUCTLIST", productList);
			
			ComMethod.forward(request, response, "main.jsp");
		}
	}
		
	public void listTrip(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException, SQLException {
		
		SearchCriteria cri = ComMethod.searchCriteria(request);
		
		List<BoardTripDTO> list = tripDAO.selectListSearch(cri);
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(tripDAO.listSearchCount(cri));
		
		if(list != null) {
			
			request.setAttribute("LIST", list);
			request.setAttribute("PAGEMAKER", pageMaker);
			request.setAttribute("CRI", cri);
			
			ComMethod.forward(request, response, "trip.jsp");
		}
	}
	
	public void readTrip(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException, SQLException {
		
		int tnum = Integer.parseInt(request.getParameter("tnum"));
		
		//조회수 증가
		tripDAO.updateCnt(tnum);
		
		BoardTripDTO dto = tripDAO.selectReadTrip(tnum);
		
		SearchCriteria scri = ComMethod.searchCriteria(request);
		
		if(dto != null) {
			request.setAttribute("READ", dto);
			request.setAttribute("CRI", scri);
			ComMethod.forward(request, response, "trip-view.jsp");
		}		
	}
	
	public void listFood(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException, SQLException {
		
		SearchCriteria cri = ComMethod.searchCriteria(request);
		
		List<BoardFoodDTO> list = foodDAO.selectListSearch(cri);
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(foodDAO.listSearchCount(cri));
		
		if(list != null) {
			
			request.setAttribute("LIST", list);
			request.setAttribute("PAGEMAKER", pageMaker);
			request.setAttribute("CRI", cri);
			
			ComMethod.forward(request, response, "food.jsp");
		}
	}
	
	public void readFood(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException, SQLException {
		
		int fnum = Integer.parseInt(request.getParameter("fnum"));
		
		//조회수 증가
		foodDAO.updateCnt(fnum);
		
		BoardFoodDTO dto = foodDAO.selectRead(fnum);
		
		SearchCriteria scri = ComMethod.searchCriteria(request);
		
		if(dto != null) {
			request.setAttribute("READ", dto);
			request.setAttribute("CRI", scri);
			ComMethod.forward(request, response, "food-view.jsp");
		}		
	}
	
	public void listProduct(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException, SQLException {
		
		SearchCriteria cri = ComMethod.searchCriteria(request);
		
		List<BoardProductDTO> list = productDAO.selectListSearch(cri);
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(productDAO.listSearchCount(cri));
		
		if(list != null) {
			
			request.setAttribute("LIST", list);
			request.setAttribute("PAGEMAKER", pageMaker);
			request.setAttribute("CRI", cri);
			
			ComMethod.forward(request, response, "product.jsp");
		}
	}
	
	public void readProduct(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException, SQLException {
		
		int pnum = Integer.parseInt(request.getParameter("pnum"));
		
		//조회수 증가
		productDAO.updateCnt(pnum);
		
		BoardProductDTO dto = productDAO.selectRead(pnum);
		
		SearchCriteria scri = ComMethod.searchCriteria(request);
		
		if(dto != null) {
			request.setAttribute("READ", dto);
			request.setAttribute("CRI", scri);
			ComMethod.forward(request, response, "product-view.jsp");
		}		
	}

}
