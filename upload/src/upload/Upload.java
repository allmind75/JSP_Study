package upload;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.oreilly.servlet.multipart.FileRenamePolicy;

public class Upload {
	private String saveName;
	private String orgName;
	private String savePath;
	private int maxSize;
	private String encType;

	public Upload(String savePath, int maxSize, String encType) {
		this.savePath = savePath;
		this.maxSize = maxSize;
		this.encType = encType;
	}

	public void UploadFile(HttpServletRequest request) throws IOException {
		FileRenamePolicy rename = new DefaultFileRenamePolicy();

		MultipartRequest MR = new MultipartRequest(request, savePath, maxSize, encType, rename);
		///////////////////////////////////////////////////////////////
		orgName = MR.getOriginalFileName("file3");
		saveName = MR.getFilesystemName("file3");

		System.out.println("업로드 파일 이름 :" + orgName);
		System.out.println("저장된 파일 이름 :" + saveName);
	}

	public String getSavePath() {
		return savePath;
	}

	public String getSaveName() {
		return saveName;
	}

}
