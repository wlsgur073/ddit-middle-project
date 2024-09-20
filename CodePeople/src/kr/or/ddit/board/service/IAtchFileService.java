package kr.or.ddit.board.service;

import java.util.List;
import java.util.Map;

import org.apache.commons.fileupload.FileItem;

import kr.or.ddit.cmm.vo.AtchFileVO;

public interface IAtchFileService {
	
	//÷������  ��� ���� 
	public AtchFileVO atchFileListSave(Map<String, FileItem[]> fileItemMap) throws Exception;
	
	//÷������ ��� ��ȸ
	public List<AtchFileVO> atchFileListGet(AtchFileVO atchFileVO);
	
	//÷������ ���� ���� ��ȸ
	public AtchFileVO atchFileDetailGet(AtchFileVO atchFileVO);
}
