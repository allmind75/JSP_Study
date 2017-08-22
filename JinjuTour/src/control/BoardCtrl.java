package control;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import dao.BoardDAO;
import dto.BoardTripDTOIn;

@WebServlet("*.board")
public class BoardCtrl extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private BoardDAO dao;

	public BoardCtrl() throws IOException {
		super();
		dao = new BoardDAO();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html); charset=UTF-8");

		String cmd = parseCommand(request);
		System.out.println("cmd : " + cmd);

		try {
			switch (cmd) {
			case "writeTrip.board":
				insertTrip(request, response);
				break;
			case "listTrip.board":
				listTrip(request, response);
				break;
			case "readTrip.board":
				readTrip(request, response);
				break;
			case "updateTrip.board":
				updateTrip(request, response);
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

	public void insertTrip(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException, SQLException {

		int maxSize = 1024 * 1024 * 10; // 10Mbyte 제한
		String savePath = "C:\\Users\\hybrid\\git\\jsp_study\\JinjuTour\\WebContent\\images\\trip\\";

		// DefaultFileRenamePolicy() - 이름 중복 방지, 중복된 이름이 있으면 파일명 뒤에 숫자 추가
		MultipartRequest multipartRequest = new MultipartRequest(request, savePath, maxSize, "UTF-8",
				new DefaultFileRenamePolicy());

		String img = fileUpload(request, multipartRequest, savePath);

		String title = multipartRequest.getParameter("title");
		String content = multipartRequest.getParameter("content");
		String address = multipartRequest.getParameter("address");
		String phone = multipartRequest.getParameter("phone");
		String time = multipartRequest.getParameter("time");
		String map = multipartRequest.getParameter("map");

		BoardTripDTOIn dto = new BoardTripDTOIn(title, content, address, phone, time, img, map);

		if (dao.insertTrip(dto)) {
			System.out.println("게시글 추가 완료");
			sendRedirect(response, "/admin/listTrip.board");
		} else {
			System.out.println("게시글 추가 실패");
		}

	}

	public void listTrip(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException, SQLException {

		List<BoardTripDTOIn> list = dao.selectListTrip();
		request.setAttribute("LIST", list);
		forward(request, response, "/admin/trip.jsp");
	}

	public void readTrip(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException, SQLException {

		String tnum = request.getParameter("tnum");
		BoardTripDTOIn dto = dao.selectReadTrip(tnum);

		System.out.println("title : " + dto.getTitle());
		if (dto != null) {
			request.setAttribute("READTRIP", dto);
			forward(request, response, "/admin/readTrip.jsp");
		}
	}
	
	public void updateTrip(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException, SQLException {
				
		int maxSize = 1024 * 1024 * 10; // 10Mbyte 제한
		String savePath = "C:\\Users\\hybrid\\git\\jsp_study\\JinjuTour\\WebContent\\images\\trip\\";

		// DefaultFileRenamePolicy() - 이름 중복 방지, 중복된 이름이 있으면 파일명 뒤에 숫자 추가
		MultipartRequest multipartRequest = new MultipartRequest(request, savePath, maxSize, "UTF-8",
				new DefaultFileRenamePolicy());

		String tnums = multipartRequest.getParameter("tnum");
		int tnum = Integer.parseInt(tnums);
		String title = multipartRequest.getParameter("title");
		String content = multipartRequest.getParameter("content");
		String address = multipartRequest.getParameter("address");
		String phone = multipartRequest.getParameter("phone");
		String time = multipartRequest.getParameter("time");
		String map = multipartRequest.getParameter("map");
		String img = fileUpload(request, multipartRequest, savePath);
		
		BoardTripDTOIn dto = new BoardTripDTOIn(tnum, title, content, address, phone, time, img, map);

		if(dao.updateTrip(dto)) {
			System.out.println("수정완료");
			//글 수정 완료
			sendRedirect(response, "../admin/listTrip.board");
		} else {
			System.out.println("수정실패");
			//글 수저 실패
		}
	}
	
	public static String parseCommand(HttpServletRequest request) {

		int idx = request.getRequestURI().lastIndexOf("/");
		return request.getRequestURI().substring(idx + 1);
	}

	// request 객체 전달
	public void forward(HttpServletRequest request, HttpServletResponse response, String view)
			throws ServletException, IOException {

		RequestDispatcher rd = request.getRequestDispatcher(view);
		rd.forward(request, response);
	}

	// request 객체 새로 생성됨
	public void sendRedirect(HttpServletResponse response, String view) throws IOException {
		response.sendRedirect(view);
	}

	public String fileUpload(HttpServletRequest request, MultipartRequest multi, String savePath)
			throws ServletException, IOException, SQLException {

		String uploadFileName;
		String newFileName = null;

		int read = 0;
		byte[] buf = new byte[1024];
		FileInputStream fin;
		FileOutputStream fout;
		long currentTime = System.currentTimeMillis();
		SimpleDateFormat simDf = new SimpleDateFormat("yyyyMMddHHmmss");

		try {
			// 파일 업로드
			uploadFileName = multi.getFilesystemName("img");

			System.out.println("uploadFileName : " + uploadFileName);

			if (uploadFileName != null) {
				// 실제 저장할 파일명
				newFileName = simDf.format(new Date(currentTime)) + "."
						+ uploadFileName.substring(uploadFileName.lastIndexOf(".") + 1);

				// 업로드된 파일 객체 생성
				File oldFile = new File(savePath + uploadFileName);

				// 실제 저장될 파일 객체 생성
				File newFile = new File(savePath + newFileName);

				if (!oldFile.renameTo(newFile)) {
					System.out.println("rename");
					// rename이 되지 않을 경우 강제로 파일 복사하고 기존파일 삭제
					buf = new byte[1024];
					fin = new FileInputStream(oldFile);
					fout = new FileOutputStream(newFile);
					read = 0;
					while ((read = fin.read(buf, 0, buf.length)) != -1) {
						fout.write(buf, 0, read);
					}

					fin.close();
					fout.close();
					oldFile.delete();
				}
			}
			return newFileName;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
}
