package kr.or.ddit.board.service;

import java.util.List;
import java.util.Map;

import org.apache.commons.fileupload.FileItem;

import kr.or.ddit.cmm.vo.AtchFileVO;

public interface IAtchFileService {
	
	//첨부파일  목록 저장 
	public AtchFileVO atchFileListSave(Map<String, FileItem[]> fileItemMap) throws Exception;
	
	//첨부파일 목록 조회
	public List<AtchFileVO> atchFileListGet(AtchFileVO atchFileVO);
	
	//첨부파일 세부 정보 조회
	public AtchFileVO atchFileDetailGet(AtchFileVO atchFileVO);
}
