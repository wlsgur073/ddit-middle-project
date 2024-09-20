package kr.or.ddit.hr.vo;
/**
 * 인재 검색시 카드에 출력할 정보를 담은VO
 * @author lily
 *
 */
public class HRCardVO {

	private Integer hrNo;
	private String memNm;
	private String jtCodeNm;
	private String plCodeNm;
	private String hrCurrCom;
	
	
	public Integer getHrNo() {
		return hrNo;
	}
	public void setHrNo(Integer hrNo) {
		this.hrNo = hrNo;
	}
	public String getMemNm() {
		return memNm;
	}
	public void setMemNm(String memNm) {
		this.memNm = memNm;
	}
	public String getJtCodeNm() {
		return jtCodeNm;
	}
	public void setJtCodeNm(String jtCodeNm) {
		this.jtCodeNm = jtCodeNm;
	}
	public String getPlCodeNm() {
		return plCodeNm;
	}
	public void setPlCodeNm(String plCodeNm) {
		this.plCodeNm = plCodeNm;
	}
	public String getHrCurrCom() {
		return hrCurrCom;
	}
	public void setHrCurrCom(String hrCurrCom) {
		this.hrCurrCom = hrCurrCom;
	}
	
	
}
