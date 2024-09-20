package kr.or.ddit.schedule.vo;

public class ScheduleVO {
	private Integer scheNo = 0;
	private Integer calTag = 0;
	private String calTagColor = "정보없음";
	private String scheCont = "정보없음";
	private String scheSdate = "정보없음";
	private String scheEdate = "정보없음";
	private Integer joNo = 0;
	public Integer getScheNo() {
		return scheNo;
	}
	public void setScheNo(Integer scheNo) {
		this.scheNo = scheNo;
	}
	public Integer getCalTag() {
		return calTag;
	}
	public void setCalTag(Integer calTag) {
		this.calTag = calTag;
	}
	public String getCalTagColor() {
		return calTagColor;
	}
	public void setCalTagColor(String calTagColor) {
		this.calTagColor = calTagColor;
	}
	public String getScheCont() {
		return scheCont;
	}
	public void setScheCont(String scheCont) {
		this.scheCont = scheCont;
	}
	public String getScheSdate() {
		return scheSdate;
	}
	public void setScheSdate(String scheSdate) {
		this.scheSdate = scheSdate;
	}
	public String getScheEdate() {
		return scheEdate;
	}
	public void setScheEdate(String scheEdate) {
		this.scheEdate = scheEdate;
	}
	public Integer getJoNo() {
		return joNo;
	}
	public void setJoNo(Integer joNo) {
		this.joNo = joNo;
	}	
}
