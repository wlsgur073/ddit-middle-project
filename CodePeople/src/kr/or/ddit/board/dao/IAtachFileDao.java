package kr.or.ddit.board.dao;

import java.util.List;

import kr.or.ddit.cmm.vo.AtchFileVO;

public interface IAtachFileDao {
	
	
	//첨부 파일 저장
	public int atachFileInsert(AtchFileVO atchFileVO);
	
	//첨부파일 세부정보
	public int atachFileDetailInsert(AtchFileVO atchFileVO);
	
	//첨부파일 목록 조회
	public List<AtchFileVO> atchFileListGet(AtchFileVO atchFileVO);
	
	//첨부파일 세부정보 조회
	public AtchFileVO atchFileDetailGet(AtchFileVO atchFileVO);
	
}
