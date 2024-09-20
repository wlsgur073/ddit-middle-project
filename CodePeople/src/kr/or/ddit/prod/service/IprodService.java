package kr.or.ddit.prod.service;

import java.util.List;

import kr.or.ddit.prod.vo.prodVO;

public interface IprodService {

    public List<prodVO> selectProd (int prodNo);
    
}
