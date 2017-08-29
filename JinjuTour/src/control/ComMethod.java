package control;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;

import dto.SearchCriteria;

public class ComMethod {

	// request 객체 전달
	public static void forward(HttpServletRequest request, HttpServletResponse response, String view)
			throws ServletException, IOException {

		RequestDispatcher rd = request.getRequestDispatcher(view);
		rd.forward(request, response);
	}

	// request 객체 새로 생성됨
	public static void sendRedirect(HttpServletResponse response, String view) throws IOException {
		response.sendRedirect(view);
	}
	
	//admin parse
	public static String parseAdminCommand(HttpServletRequest request) {

		int idx = request.getRequestURI().lastIndexOf("/");
		return request.getRequestURI().substring(idx + 1);
	}
	
	
	//parse
	public static String parseCommand(HttpServletRequest request) {

		return request.getRequestURI().substring(request.getContextPath().length() + 1);
	}
	
	//file upload
	public static String fileUpload(HttpServletRequest request, MultipartRequest multi, String savePath, String name)
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
			uploadFileName = multi.getFilesystemName(name);

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
					System.out.println("file upload rename");
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
		
	public static SearchCriteria searchCriteria(HttpServletRequest request) {
		
		int page;
		int perPageNum;
		String searchType;
		String keyword;
		
		try {
			page = Integer.parseInt(request.getParameter("page"));
			perPageNum = Integer.parseInt(request.getParameter("perPageNum"));
			searchType = request.getParameter("searchType");
			keyword = request.getParameter("keyword");			
		} catch (Exception e) {
			page = 1;
			perPageNum = 10;
			searchType = null;
			keyword = "";	
		}
		
		SearchCriteria cri = new SearchCriteria(searchType, keyword);
		cri.setPage(page);
		cri.setPerPageNum(perPageNum);
		
		return cri;
	}
	
	public static SearchCriteria searchCriteria(MultipartRequest request) {
		
		int page;
		int perPageNum;
		String searchType;
		String keyword = null;
				
		try {
			page = Integer.parseInt(request.getParameter("page"));
			perPageNum = Integer.parseInt(request.getParameter("perPageNum"));
			searchType = request.getParameter("searchType");
			keyword = request.getParameter("keyword");			
		} catch (Exception e) {
			page = 1;
			perPageNum = 10;
			searchType = null;
			keyword = "";	
		}
		
		SearchCriteria cri = new SearchCriteria(searchType, keyword);
		cri.setPage(page);
		cri.setPerPageNum(perPageNum);
		
		return cri;
	}

}
