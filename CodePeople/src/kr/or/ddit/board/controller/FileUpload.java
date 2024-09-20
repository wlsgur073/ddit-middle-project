package kr.or.ddit.board.controller;

import java.io.File;
import java.io.IOException;
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

/**
 * Servlet implementation class FileUpdate
 */
@WebServlet("/upload")
public class FileUpload extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	  private static final String UPLOAD_DIR = "upload_files"; //������ : upload_files 
    	   
    	   //�޸� �Ӱ�ũ��(�� ũ�Ⱑ �Ѿ�� �������丮 ��ġ�� �ӽ����Ϸ� �����.)
    	   private static final int MEMORY_THRESHOLD = 1024 * 1024 * 3;
    	   
    	   //���� 1���� �ִ� ũ��
    	   private static final long MAX_FILE_SIZE = 1024 * 1024 * 40;
    	   
    	   //��û���� �ִ� ũ��
    	   private static final long MAX_REQUEST_SIZE = 1024 * 1024 * 50;
    	   
    	   @Override
    	   protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    	      
    	      //���ڵ� Ÿ���� multipart/form.data �� ���...(form�����͸� ��Ƽ��Ʈ�� ������ ��)
    	      if (ServletFileUpload.isMultipartContent(req)) {
    	         //���ʵ尪 ����� �� ����
    	         Map<String, String> formMap = 
    	               new HashMap<String, String>();
    	         
    	         DiskFileItemFactory factory = new DiskFileItemFactory();
    	         factory.setSizeThreshold(MEMORY_THRESHOLD);
    	         factory.setRepository(new File("C:/code/D_Other/temp")); //�ӽ������� ����
    	         
    	         ServletFileUpload upload = new ServletFileUpload(factory);
    	         upload.setFileSizeMax(MAX_FILE_SIZE);
    	         upload.setSizeMax(MAX_REQUEST_SIZE); //����ũ�� ������ �ɾ���� ��
    	         
    	         //�� ���ø����̼� ��Ʈ ���丮 ���� ���ε� �����ϱ�
    	         String uploadPath = getServletContext().getRealPath("")
    	               + UPLOAD_DIR; //+ File.separator : / �߰� �Ѱ� ���� ���� �ּ� ó����
    	         System.out.println("uploadPath =>" + uploadPath);
    	                  
    	         
    	         File uploadDir = new File(uploadPath);
    	         if (!uploadDir.exists()) {
    	            uploadDir.mkdir();
    	         }
    	         
    	         try {
    	            List<FileItem> formItems =
    	                  upload.parseRequest(req);
    	            
    	            if (formItems != null && formItems.size() > 0) {
    	               for (FileItem item : formItems) {
    	                  if (!item.isFormField()) { //formfield�� �ƴϸ� �����̴�...
    	                     String fileName = 
    	                           new File(item.getName()).getName();
    	                     String filePath = uploadPath + File.separator + fileName;
    	                     File storeFile = new File(filePath);
    	                     item.write(storeFile); // ���ε� ���� ����
    	                     
    	                  }else { //�������� �� ���..
    	                     // ���ʵ��� ���� �ѱ��� ��쿡�� �ش� ���ڿ��� ������ ��ȯ�� �־����
    	                     formMap.put(item.getFieldName(), //Ű������ �ʵ��̸��� ����
    	                           item.getString("UTF-8")); //value���� String ����
    	                  }
    	                  
    	                  
    	               }
    	            }
    	            
    	            
    	         } catch (Exception e) {
    	            e.printStackTrace();
    	         }
    	         
    	         for (Entry<String, String> entry : formMap.entrySet()) {
    	            System.out.println("파라미터명 : " + entry.getKey());
    	            System.out.println("파라미터값 : " + entry.getValue());
    	         }
    	         
    	         resp.setContentType("text/html");
    	         
    	         resp.getWriter().print("인코딩 잘된다.");
    	      }
    	      
    	   }
    
    

}
