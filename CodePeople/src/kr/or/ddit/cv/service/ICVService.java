package kr.or.ddit.cv.service;

import java.util.List;

import kr.or.ddit.cmm.vo.CVPagingVO;
import kr.or.ddit.cv.vo.CVVO;

public interface ICVService {
	
	public int getTotalCVCount();
	
	public List<CVVO> cvPagingList(CVPagingVO cvPagingVO);
	
	public List<CVVO> selectCV(int hrNo);

}
