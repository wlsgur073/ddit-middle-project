package kr.or.ddit.board.service;

import java.io.File;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.apache.commons.fileupload.FileItem;
import org.apache.log4j.Logger;

import kr.or.ddit.board.dao.AtchFileDaoImpl;
import kr.or.ddit.board.dao.IAtachFileDao;
import kr.or.ddit.cmm.vo.AtchFileVO;
import kr.or.ddit.util.FileUploadRequestWrapper;

public class IAtchFileServiceImpl implements IAtchFileService{
	
	private static Logger logger = Logger.getLogger(IAtchFileServiceImpl.class);
	
	private static IAtchFileService fileService;
	private IAtachFileDao fileDao;
	
	private IAtchFileServiceImpl() {
		fileDao = AtchFileDaoImpl.getInstance();
	}
	
	public static IAtchFileService getInstance() {
		if (fileService == null) {
			fileService = new IAtchFileServiceImpl();
		}
		return fileService;
	}
	
	@Override
	public AtchFileVO atchFileListSave(Map<String, FileItem[]> fileItemMap) throws Exception {
		
		AtchFileVO atchFileVO = new AtchFileVO();
		
		fileDao.atachFileInsert(atchFileVO); // 기본 첨부파일 테이블 저장, 파라미터로 초기화된 객체 넣어줌
		
		for(FileItem[] itemArr : fileItemMap.values()) { 
			for(FileItem item : itemArr) {
				
				File uploadDir = new File(FileUploadRequestWrapper.UPLOAD_DIRECTORY);
				
				if(!uploadDir.exists()) {
					uploadDir.mkdir();
				}
				
				logger.info("item.getName() : " + item.getName()); 
				
				String orignFileName = item.getName(); 	 //원본 파일명
				Integer fileSize = (int) item.getSize(); //파일 크기
				String saveFileName = "";			   	 //저장파일 이름
				File storeFile = null;				     //저장파일 객체
				String saveFilePath = "";			     //저장파일 경로
				
				do {
					saveFileName = UUID.randomUUID().toString().replace("-", "");
					
					saveFilePath = FileUploadRequestWrapper.UPLOAD_DIRECTORY
							+ File.separator + saveFileName;
					storeFile = new File(saveFilePath);
					
				}while(storeFile.exists());
					
				//확장명 추출
				String fileExtension = orignFileName.lastIndexOf(".") < 0 
						? "" : orignFileName.substring(orignFileName.lastIndexOf(".") + 1);
				
				item.write(storeFile); // 업로드 파일 저장
				
				atchFileVO.setStreFileNm(saveFileName);
				atchFileVO.setFileSize(fileSize);
				atchFileVO.setOrignlFileNm(orignFileName);
				atchFileVO.setFileExtsn(fileExtension);
				atchFileVO.setFileStrePath(saveFilePath);
				
				//파일 상세정보 저장
				fileDao.atachFileDetailInsert(atchFileVO);
				
			
			}
		}
		
		return atchFileVO;
	}

	@Override
	public List<AtchFileVO> atchFileListGet(AtchFileVO atchFileVO) {

		return fileDao.atchFileListGet(atchFileVO);
	}

	@Override
	public AtchFileVO atchFileDetailGet(AtchFileVO atchFileVO) {
		
		return fileDao.atchFileDetailGet(atchFileVO);
	}
}





