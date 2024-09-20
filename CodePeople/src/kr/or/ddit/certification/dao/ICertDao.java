package kr.or.ddit.certification.dao;

import java.sql.SQLException;
import java.util.List;

import kr.or.ddit.certification.vo.CertHRVO;
import kr.or.ddit.certification.vo.CertificationVO;
import kr.or.ddit.hr.vo.HRInfoVO;

public interface ICertDao {
	public List<CertificationVO> selectCertList() throws SQLException;
	
	public int insertCert(HRInfoVO hrInfoVO) throws SQLException;

	public List<CertificationVO> selectCert(int hrNo) throws SQLException;

	public int deleteCert (CertHRVO certhrvo) throws SQLException;
	
}
