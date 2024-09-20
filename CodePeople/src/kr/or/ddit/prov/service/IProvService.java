package kr.or.ddit.prov.service;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;

import kr.or.ddit.prov.vo.CityVO;
import kr.or.ddit.prov.vo.ProvVO;

public interface IProvService {
	
	public List<CityVO> selectCityList();
	
	public List<ProvVO> selectProvList(int city_code_no);
	
	public int convertToCityNo(String cityCodeNm);
	
	public int convertToProvNo(HashMap<String, Object> map);
}
