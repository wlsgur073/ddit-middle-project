package kr.or.ddit.certification.service;

import java.sql.SQLException;
import java.util.List;

import kr.or.ddit.certification.vo.CertHRVO;
import kr.or.ddit.certification.vo.CertificationVO;
import kr.or.ddit.hr.vo.HRInfoVO;

public interface ICertService {

	public List<CertificationVO> selectCertList();
	

	public int insertCert(HRInfoVO hrInfoVO);
	
	public List<CertificationVO> selectCert(int hrNo);
	
	

	public int deleteCert (CertHRVO certhrvo);
}
