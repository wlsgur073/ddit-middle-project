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
		
		fileDao.atachFileInsert(atchFileVO); // �⺻ ÷������ ���̺� ����, �Ķ���ͷ� �ʱ�ȭ�� ��ü �־���
		
		for(FileItem[] itemArr : fileItemMap.values()) { 
			for(FileItem item : itemArr) {
				
				File uploadDir = new File(FileUploadRequestWrapper.UPLOAD_DIRECTORY);
				
				if(!uploadDir.exists()) {
					uploadDir.mkdir();
				}
				
				logger.info("item.getName() : " + item.getName()); 
				
				String orignFileName = item.getName(); 	 //���� ���ϸ�
				Integer fileSize = (int) item.getSize(); //���� ũ��
				String saveFileName = "";			   	 //�������� �̸�
				File storeFile = null;				     //�������� ��ü
				String saveFilePath = "";			     //�������� ���
				
				do {
					saveFileName = UUID.randomUUID().toString().replace("-", "");
					
					saveFilePath = FileUploadRequestWrapper.UPLOAD_DIRECTORY
							+ File.separator + saveFileName;
					storeFile = new File(saveFilePath);
					
				}while(storeFile.exists());
					
				//Ȯ��� ����
				String fileExtension = orignFileName.lastIndexOf(".") < 0 
						? "" : orignFileName.substring(orignFileName.lastIndexOf(".") + 1);
				
				item.write(storeFile); // ���ε� ���� ����
				
				atchFileVO.setStreFileNm(saveFileName);
				atchFileVO.setFileSize(fileSize);
				atchFileVO.setOrignlFileNm(orignFileName);
				atchFileVO.setFileExtsn(fileExtension);
				atchFileVO.setFileStrePath(saveFilePath);
				
				//���� ������ ����
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





