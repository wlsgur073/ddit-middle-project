package kr.or.ddit.util;

import java.io.File;
import java.io.UnsupportedEncodingException;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.log4j.Logger;

/**
 * FileUpload API瑜� �궗�슜�븯�뒗 HttpServletRequestWrapper �겢�옒�뒪
 * (HttpServletRequest�뿉 湲곕컲�븳 API瑜� �궗�슜�븯硫댁꽌 硫��떚�뙆�듃泥섎━ 湲곕뒫�씠 異붽��릺�뿀�쓬.)
 */
public class FileUploadRequestWrapper extends HttpServletRequestWrapper {

	private static Logger logger = Logger.getLogger(FileUploadRequestWrapper.class);	// 濡쒓굅 �깮�꽦

//    public static final String UPLOAD_DIRECTORY = "d:/D_Other/upload_files";		// �뾽濡쒕뱶 寃쎈줈 �꽕�젙
    public static final String UPLOAD_DIRECTORY = "C:/code/A_TeachingMaterial/3.HighJava/workspace/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/ServletExam/upload_files";		// �뾽濡쒕뱶 寃쎈줈 �꽕�젙
    private boolean isMultipart = false;												// 硫��떚�뙆�듃�뿬遺�

    // �뿬�윭媛쒕�� 諛쏄린 �쐞�빐 諛곗뿴濡� ���옣�븳�떎
    private Map<String, String[]> parameterMap;											// �뤌�븘�뱶(�뙆�씪誘명꽣) �뜲�씠�꽣瑜� �떞湲� �쐞�븳 留�
    private Map<String, FileItem[]> fileItemMap;										// fileItem媛앹껜瑜� �떞湲곗쐞�븳 留�

    /**
     * �깮�꽦�옄
     * @param request
     * @throws FileUploadException
     */
    public FileUploadRequestWrapper(HttpServletRequest request)
    throws FileUploadException{
        this(request, -1, -1, -1, null);
    }

    /**
     * �깮�꽦�옄
     * @param request 湲곕낯 �슂泥� 媛앹껜
     * @param memoryThreshold 硫붾え由� �엫怨꾪겕湲�(�씠 �겕湲곌� �꽆�뼱媛�硫� �젅�뙆吏��넗由� �쐞移섏뿉 �엫�떆�뙆�씪濡� ���옣�맖)
     * @param fileSizeMax �뙆�씪 1媛쒕떦 理쒕��겕湲�
     * @param maxRequestSize �슂泥� �뙆�씪 理쒕� �겕湲�
     * @param repositoryPath �엫�떆�뙆�씪 ���옣寃쎈줈
     * @throws FileUploadException
     */
    public FileUploadRequestWrapper(HttpServletRequest request,
        int memoryThreshold, long fileSizeMax, long maxRequestSize, String repositoryPath) throws FileUploadException {
        super(request);

        parsing(request, memoryThreshold, fileSizeMax, maxRequestSize, repositoryPath);
    }

    /**
     * 硫��떚�뙆�듃 �뜲�씠�꽣瑜� �뙆�떛�븯�뿬 �몢媛쒖쓽 留듭뿉 �굹�늻�뼱 �떞�뒗�떎.
     * @param request
     * @param memoryThreshold 硫붾え由� �엫怨꾪겕湲�(�씠 �겕湲곌� �꽆�뼱媛�硫� �젅�뙆吏��넗由� �쐞移섏뿉 �엫�떆�뙆�씪濡� ���옣�맖)
     * @param fileSizeMax �뙆�씪 1媛쒕떦 理쒕� �겕湲�
     * @param maxRequestSize �슂泥� �뙆�씪 理쒕� �겕湲�
     * @param repositoryPath �엫�떆�뙆�씪 ���옣寃쎈줈
     * @throws FileUploadException
     */
    private void parsing(HttpServletRequest request,
        int memoryThreshold, long fileSizeMax, long maxRequestSize, String repositoryPath) throws FileUploadException {

        if (ServletFileUpload.isMultipartContent(request)) {
            isMultipart = true; // 硫��떚�뙆�듃�엫�쓣 �꽕�젙�븿.

            parameterMap = new HashMap<>();
            fileItemMap = new HashMap<>();

            DiskFileItemFactory factory = new DiskFileItemFactory();
            if (memoryThreshold != -1) {
            	factory.setSizeThreshold(memoryThreshold);
            }
            if (repositoryPath != null) {// ���옣 寃쎈줈媛� �꽕�젙�릺吏� �븡�븯�쑝硫�...
            	factory.setRepository(new File(repositoryPath));
            }else {
            	factory.setRepository(new File(System.getProperty("java.io.tmpdir")));
            }

            ServletFileUpload servletFileUpload = new ServletFileUpload(factory);
            servletFileUpload.setFileSizeMax(fileSizeMax);
            servletFileUpload.setSizeMax(maxRequestSize);

            List<FileItem> list = servletFileUpload.parseRequest(request);
            for (int i = 0 ; i < list.size() ; i++) {
                FileItem fileItem = (FileItem) list.get(i);
                String name = fileItem.getFieldName(); // �븘�뱶紐� 媛��졇�삤湲�

                if (fileItem.isFormField()) { // �뤌�븘�뱶�씤 寃쎌슦...
                    String value = "";
					try {
						// �뤌�븘�뱶�쓽 媛믪씠 �븳湲��씤 寃쎌슦�뿉�뒗 �빐�떦 臾몄옄�뿴�쓣 �쟻�젅�엳 蹂��솚�쓣 �빐二쇱뼱�빞 �븳�떎.
						//value = new String(fileItem.getString().getBytes("8859_1"), "UTF-8");
						value = fileItem.getString("UTF-8");
						logger.info(name +  " : " + value);
					} catch (UnsupportedEncodingException e) {
						e.printStackTrace();
					}
                    String[] values = (String[]) parameterMap.get(name);
                    if (values == null) { // 泥섏쓬 留뚮뱶�뒗 寃쎌슦...
                        values = new String[] { value };
                    } else { // 湲곗〈�뿉 �씠誘� 議댁옱�븯�뒗 寃쎌슦...
                        String[] tempValues = new String[values.length + 1];
                        System.arraycopy(values, 0, tempValues, 0, values.length);
                        tempValues[tempValues.length - 1] = value;
                        values = tempValues;
                    }
                    parameterMap.put(name, values);

                } else { // �뙆�씪�씤 寃쎌슦...

                	if(fileItem.getSize() > 0) { // �뙆�씪�씠 議댁옱�븯�뒗 寃쎌슦...

                		FileItem[] values = fileItemMap.get(name);
                        if (values == null) { // 泥섏쓬 留뚮뱶�뒗 寃쎌슦...
                            values = new FileItem[] { fileItem };
                        } else { // 湲곗〈�뿉 �씠誘� 議댁옱�븯�뒗 寃쎌슦...
                        	FileItem[] tempValues = new FileItem[values.length + 1];
                            System.arraycopy(values, 0, tempValues, 0, values.length);
                            tempValues[tempValues.length - 1] = fileItem;
                            values = tempValues;
                        }
                        fileItemMap.put(name, values);
                	}
                }
            }
            //addTo(); // �쁽�옱 媛앹껜瑜� �냽�꽦媛믪쑝濡� �꽕�젙�븳�떎.(硫��떚�뙆�듃 �뿬遺� 泥댄겕瑜� �쐞�빐 �꽕�젙�븿)
        }
    }

    /**
     * 硫��떚�뙆�듃 而⑦뀗痢좎씤吏� �솗�씤�븯湲� �쐞�븳 硫붿꽌�뱶
     * @return 硫��떚�뙆�듃�씠硫� true, �븘�땲硫� false
     */
    public boolean isMultipartContent() {
        return this.isMultipart;
    }

    /**
     * �뙆�씪誘명꽣 �젙蹂� 媛��졇�삤湲�
     */
    public String getParameter(String name) {
        if (this.isMultipart) {
            String[] values = (String[])parameterMap.get(name);
            if (values == null) return null;
            return values[0];
        } else
            return super.getParameter(name);
    }

    public String[] getParameterValues(String name) {
        if (this.isMultipart)
            return (String[])parameterMap.get(name);
        else
            return super.getParameterValues(name);
    }

    public Enumeration<String> getParameterNames() {
        if (this.isMultipart) {
            return new Enumeration<String>() {
                Iterator<String> iter = parameterMap.keySet().iterator();

                public boolean hasMoreElements() {
                    return iter.hasNext();
                }
                public String nextElement() {
                    return iter.next();
                }
            };
        } else {
            return super.getParameterNames();
        }
    }

    /**
     * parameterMap 媛��졇�삤湲�
     */
    public Map<String, String[]> getParameterMap() {
        if (this.isMultipart)
            return parameterMap;
        else
            return super.getParameterMap();
    }

    /**
     * fileItemMap 媛��졇�삤湲�
     * @return
     */
    public Map<String, FileItem[]> getFileItemMap() {
    	 if (this.isMultipart)
             return fileItemMap;
         else
             return null;
    }

    /**
     * �냽�꽦�씠由꾩쓣 �씠�슜�븯�뿬 FileItem諛곗뿴�쓣 媛��졇�삩�떎.
     * @param name �냽�꽦�씠由�
     * @return FileItem 諛곗뿴
     */
    public FileItem[] getFileItems(String name) {
        if (this.isMultipart)
            return fileItemMap.get(name);
        else
            return null;
    }

    /**
     * fileItemMap�뿉 議댁옱�븯�뒗 FileItem�쓣 �궘�젣�븳�떎.
     */
    public void delete() {
        if (this.isMultipart) {
            Iterator<FileItem[]> fileItemIter = fileItemMap.values().iterator();
            while( fileItemIter.hasNext()) {
                FileItem[] fileItemArr = (FileItem[])fileItemIter.next();
                for(FileItem fileItem : fileItemArr) {
                	fileItem.delete(); // �엫�떆���옣 �뜲�씠�꽣 �궘�젣
                }
            }
        }
    }

}
