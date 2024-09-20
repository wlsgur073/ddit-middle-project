package kr.or.ddit.prod.service;

import java.sql.SQLException;
import java.util.List;

import kr.or.ddit.prod.dao.IprodDao;
import kr.or.ddit.prod.dao.prodDaoImpl;
import kr.or.ddit.prod.vo.prodVO;

public class prodServiceImpl implements IprodService{

	
  private IprodDao dao;
  
  private static IprodService service;
  
  private prodServiceImpl() {
	  dao = prodDaoImpl.getInstance();
  }
  
  public static IprodService getInstance() {
	  if(service == null) {
		  service = new prodServiceImpl();
	  }
	  return service;
  }
  
  
  @Override
  public List<prodVO> selectProd(int prodNo) {
    
	  List<prodVO> list = null;
	  
	  try {
		list = dao.selectProd(prodNo);
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	
    return list;
  }

  
  
}
