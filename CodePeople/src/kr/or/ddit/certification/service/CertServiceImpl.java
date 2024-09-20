package kr.or.ddit.certification.service;

import java.sql.SQLException;
import java.util.List;

import kr.or.ddit.certification.dao.ICertDao;
import kr.or.ddit.certification.dao.CertDaoImpl;
import kr.or.ddit.certification.vo.CertHRVO;
import kr.or.ddit.certification.vo.CertificationVO;
import kr.or.ddit.hr.vo.HRInfoVO;

public class CertServiceImpl implements ICertService{

	private ICertDao dao;
	private static ICertService service;
	
	private CertServiceImpl() {
		dao = CertDaoImpl.getInstance();
	}
	public static ICertService getInstance() {
		if(service == null) {
			service = new CertServiceImpl();
		}
		return service;
	}	

	@Override
	public List<CertificationVO> selectCertList() {
		List<CertificationVO> list = null;
		try {
			list = dao.selectCertList();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	@Override
	public int insertCert(HRInfoVO hrInfoVO) {
		int cnt = 0;
		try {
			cnt = dao.insertCert(hrInfoVO);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return cnt;
	}
	
	@Override
	public List<CertificationVO> selectCert(int hrNo) {
	
		List<CertificationVO> certList = null;
		try {
			certList = (List<CertificationVO>)dao.selectCert(hrNo);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return certList;
	}
	@Override
	public int deleteCert(CertHRVO certhrvo) {
	int cnt = 0;
	try {
		cnt = dao.deleteCert(certhrvo);
	} catch (SQLException e) {
		e.printStackTrace();
	}		
		return cnt;
	}
}
