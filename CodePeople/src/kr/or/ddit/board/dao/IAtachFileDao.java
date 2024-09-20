package kr.or.ddit.board.dao;

import java.util.List;

import kr.or.ddit.cmm.vo.AtchFileVO;

public interface IAtachFileDao {
	
	
	//÷�� ���� ����
	public int atachFileInsert(AtchFileVO atchFileVO);
	
	//÷������ ��������
	public int atachFileDetailInsert(AtchFileVO atchFileVO);
	
	//÷������ ��� ��ȸ
	public List<AtchFileVO> atchFileListGet(AtchFileVO atchFileVO);
	
	//÷������ �������� ��ȸ
	public AtchFileVO atchFileDetailGet(AtchFileVO atchFileVO);
	
}
