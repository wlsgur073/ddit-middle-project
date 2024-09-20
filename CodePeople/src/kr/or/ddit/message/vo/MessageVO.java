package kr.or.ddit.message.vo;

public class MessageVO {
	private Integer msgNo;
	private String msgCont;
	private String msgSenddate;
	private String msgOpendate;
	private Integer memSenderNo;
	private Integer memReceiverNo;
	public Integer getMsgNo() {
		return msgNo;
	}
	public void setMsgNo(Integer msgNo) {
		this.msgNo = msgNo;
	}
	public String getMsgCont() {
		return msgCont;
	}
	public void setMsgCont(String msgCont) {
		this.msgCont = msgCont;
	}
	public String getMsgSenddate() {
		return msgSenddate;
	}
	public void setMsgSenddate(String msgSenddate) {
		this.msgSenddate = msgSenddate;
	}
	public String getMsgOpendate() {
		return msgOpendate;
	}
	public void setMsgOpendate(String msgOpendate) {
		this.msgOpendate = msgOpendate;
	}
	public Integer getMemSenderNo() {
		return memSenderNo;
	}
	public void setMemSenderNo(Integer memSenderNo) {
		this.memSenderNo = memSenderNo;
	}
	public Integer getMemReceiverNo() {
		return memReceiverNo;
	}
	public void setMemReceiverNo(Integer memReceiverNo) {
		this.memReceiverNo = memReceiverNo;
	}
}
