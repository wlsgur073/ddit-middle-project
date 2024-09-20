package kr.or.ddit.cmm.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;

import kr.or.ddit.util.FileUploadRequestWrapper;

public class MultipartParser implements Filter{

	// 메모리 임계크기(이 크기가 넘어가면 레파지토리 위치에 임시파일로 저장됨.) 바이트단위, 3메가바이트임
	private static final int MEMORY_THRESHOLD = 1024 * 1024 * 3;
	// 파일 1개당 최대 크기
	private static final long MAX_FILE_SIZE = 1024 * 1024 * 40;
	// 요청 파일 최대 크기(업로드하는 파일이 복수개일 때 파일들의 총 크기제한)
	private static final long MAX_REQUEST_SIZE = 1024 * 1024 * 50;
	@Override
	public void destroy() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void doFilter(ServletRequest req, ServletResponse resp, FilterChain fc)
			throws IOException, ServletException {
	    try{

            // 래퍼클래스 객체 생성
            FileUploadRequestWrapper requestWrapper = 
                new FileUploadRequestWrapper((HttpServletRequest) req
                    , MEMORY_THRESHOLD, MAX_FILE_SIZE, MAX_REQUEST_SIZE, "");

            fc.doFilter(requestWrapper, resp);

        }catch(Exception ex) {
            ex.printStackTrace();
        }
		
	}

	@Override
	public void init(FilterConfig arg0) throws ServletException {
		// TODO Auto-generated method stub
		
	}

}
