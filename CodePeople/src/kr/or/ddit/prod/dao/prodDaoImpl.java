package kr.or.ddit.prod.dao;

import java.sql.SQLException;
import java.util.List;

import com.ibatis.sqlmap.client.SqlMapClient;
import kr.or.ddit.util.SqlMapClientFactory;

import kr.or.ddit.prod.vo.prodVO;

public class prodDaoImpl implements IprodDao{

  private String nameSpace = "prod.";
	
  private SqlMapClient smc;

  private static IprodDao dao;
  
  private prodDaoImpl() {
		smc = SqlMapClientFactory.getInstance();
	}
	
  
  public static IprodDao getInstance() {
	  if(dao == null) {
		  dao = new prodDaoImpl();
	  }
	return dao;
  }
  

  @Override
  public List<prodVO> selectProd(int prodNo) throws SQLException {

    List<prodVO> list = null;

    list = (List<prodVO>)smc.queryForList(nameSpace + "selectProd", prodNo);
    

    return list;
  }
  
}
