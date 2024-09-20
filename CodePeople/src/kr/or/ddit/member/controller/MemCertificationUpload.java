package kr.or.ddit.member.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

@WebServlet("/MemCertificationUpload.do")
public class MemCertificationUpload extends HttpServlet {
	
	private static final String UPLOAD_DIR = "upload_files";
	// 메모리 임계크기(이 크기가 넘어가면 레퍼지토리 위치에 임시파일로 저장됨.)
	private static final int MEMORY_THRESHOLD = 1024 * 1024 * 3;
	// 파일 1개당 최대 크기
	private static final long MAX_FILE_SIZE = 1024 * 1024 * 40;
	// 요청 파일 최대 크기
	private static final long MAX_REQUEST_SIZE = 1024 * 1024 * 50;
	
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		
		// 인코딩 타입이 multipart/form-data인 경우...
		// form-data를 나눠서 분류하겠다는 인코딩 방식
		if(ServletFileUpload.isMultipartContent(req)) {
			// 폼필드 값 저장용 맵 선언
			Map<String, String> formMap = 
					new HashMap<String, String>();
			
			DiskFileItemFactory factory = new DiskFileItemFactory();
			factory.setSizeThreshold(MEMORY_THRESHOLD);
			factory.setRepository(new File("d:/D_Other/temp"));
			
			// 실제 파싱작업을 하기 위해 사용하는 클래스 ServletFileUpload
			ServletFileUpload upload = new ServletFileUpload(factory);
			upload.setFileSizeMax(MAX_FILE_SIZE);
			upload.setSizeMax(MAX_REQUEST_SIZE);
			// 파일 사이즈는 파일 한 개에 대한 MAX값을 설정해주는 것이다.
			// REQUEST_SIZE는 비슷한 맥락이지만 한번 요청(업로드)할 때 허용할 수 있는 사이즈의 MAX값.
			
			
			// 웹 어플리케이션 루트 디렉토리 기준 업로드 설정하기
			String uploadPath = getServletContext().getRealPath("")
						+ UPLOAD_DIR;
			// getRealPath("")에 ""으로 하면 "/" 구분자를 넣어준 것과 동일하다. 
			// File.separator는 윈도우에서는 \r\n MacOS에서는 \n
			System.out.println("uploadPath => " + uploadPath);

			File uploadDir = new File(uploadPath);
			if(!uploadDir.exists()) {
				uploadDir.mkdir();
			} // 여기까지 실제 사용할 디렉토리를 생성하는 과정이다.
			
			// 아래는 파싱 작업이 이루어지는 실제 과정
			try {
				List<FileItem> formItems = upload.parseRequest(req);
				
				if(formItems != null && formItems.size() > 0) {
					for(FileItem item : formItems) { 
						if(!item.isFormField()) { // 파일인 경우...
							// 전체 경로를 제외한 파일명만 추출하기
							String fileName = 
									new File(item.getName()).getName();
							
							String filePath = uploadPath + File.separator + fileName;
							
							File storeFile = new File(filePath); // item.write인자로 넣어주기 위해서..
							item.write(storeFile); // 업로드 파일 저장
							
						} else { // 폼데이터인 경우...
							// 폼필드의 값이 한글일 경우에는 해당 문자열을 
							// 적절히 변환해 주어야 한다.
							formMap.put(item.getFieldName(), item.getString("UTF-8"));
						}
					} 
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
			for (Entry<String, String> entry : formMap.entrySet()) {
				System.out.println("파라미터 명 : " + entry.getKey());
				System.out.println("파라미터 값 : " + entry.getValue());
			}
			
			
			resp.setContentType("application/json");
			resp.getWriter().print("{\"flag\": \"true\"}");
//			resp.setContentType("text/html");
//			resp.getWriter().print("업로드 완료됨.!!!");
//			req.getRequestDispatcher("/WEB-INF/jsp/successUpload.jsp").forward(req, resp);
		}
	}
	
//	@Override
//	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
//			throws ServletException, IOException {
//		super.doPost(req, resp);
//	}

}
