package kr.or.ddit.board.vo;

public class ReplyVO {
	private Integer repNo;
	private Integer boardCodeNo;
	private Integer boardNo;
	private Integer repSeq;
	private Integer repLike = 0;
	private String repCont;
	private Integer memNo;
	private String repDate;
	private Integer repPrnt = null;
	private Integer repRept = 0;
	
	
	public Integer getRepNo() {
		return repNo;
	}
	public void setRepNo(Integer repNo) {
		this.repNo = repNo;
	}
	public Integer getBoardCodeNo() {
		return boardCodeNo;
	}
	public void setBoardCodeNo(Integer boardCodeNo) {
		this.boardCodeNo = boardCodeNo;
	}
	public Integer getBoardNo() {
		return boardNo;
	}
	public void setBoardNo(Integer boardNo) {
		this.boardNo = boardNo;
	}
	public Integer getRepSeq() {
		return repSeq;
	}
	public void setRepSeq(Integer repSeq) {
		this.repSeq = repSeq;
	}
	public Integer getRepLike() {
		return repLike;
	}
	public void setRepLike(Integer repLike) {
		this.repLike = repLike;
	}
	public String getRepCont() {
		return repCont;
	}
	public void setRepCont(String repCont) {
		this.repCont = repCont;
	}
	public Integer getMemNo() {
		return memNo;
	}
	public void setMemNo(Integer memNo) {
		this.memNo = memNo;
	}
	public String getRepDate() {
		return repDate;
	}
	public void setRepDate(String repDate) {
		this.repDate = repDate;
	}
	public Integer getRepPrnt() {
		return repPrnt;
	}
	public void setRepPrnt(Integer repPrnt) {
		this.repPrnt = repPrnt;
	}
	public Integer getRepRept() {
		return repRept;
	}
	public void setRepRept(Integer repRept) {
		this.repRept = repRept;
	}
	
	
}
