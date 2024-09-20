package kr.or.ddit.hr.vo;

/**
 * VO for Favorite Relationship between Company and HR
 * This VO is used for company to add their favorite HR
 * @author lily
 *
 */
public class HRFavVO {
	
	private Integer comNo;
	private Integer hrNo;
	
	public Integer getComNo() {
		return comNo;
	}
	public void setComNo(Integer comNo) {
		this.comNo = comNo;
	}
	public Integer getHrNo() {
		return hrNo;
	}
	public void setHrNo(Integer hrNo) {
		this.hrNo = hrNo;
	}
	
	
	
}
