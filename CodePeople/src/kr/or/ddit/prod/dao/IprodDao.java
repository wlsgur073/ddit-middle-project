package kr.or.ddit.prod.dao;

import java.sql.SQLException;
import java.util.List;

import kr.or.ddit.prod.vo.prodVO;

public interface IprodDao {
  
  public List<prodVO> selectProd (int prodNo) throws SQLException;

}
