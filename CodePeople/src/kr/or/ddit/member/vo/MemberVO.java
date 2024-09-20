package kr.or.ddit.member.vo;

public class MemberVO {
	private Integer memNo;
	private String memNm;
	private String memId;
	private String memPw;
	private String memEmail;
	private String memTel;
	private Integer provCodeNo;
	private Integer cityCodeNo;
	private Integer memCode;
	private Integer memActive = 1;
	private Integer memGender = 0;
	private Integer memInCom = 0;
	private String memBir;
	private String memOrignlPw;
	private Integer atchFileId = 0;
	private Integer memIsApi = 0;
	private String memImgUrl;
	
	
	
	public String getMemImgUrl() {
		return memImgUrl;
	}
	public void setMemImgUrl(String memImgUrl) {
		this.memImgUrl = memImgUrl;
	}
	
	public Integer getMemIsApi() {
		return memIsApi;
	}
	public void setMemIsApi(Integer memIsApi) {
		this.memIsApi = memIsApi;
	}
	public Integer getMemNo() {
		return memNo;
	}
	public void setMemNo(Integer memNo) {
		this.memNo = memNo;
	}
	public String getMemNm() {
		return memNm;
	}
	public void setMemNm(String memNm) {
		this.memNm = memNm;
	}
	public String getMemId() {
		return memId;
	}
	public void setMemId(String memId) {
		this.memId = memId;
	}
	public String getMemPw() {
		return memPw;
	}
	public void setMemPw(String memPw) {
		this.memPw = memPw;
	}
	public String getMemEmail() {
		return memEmail;
	}
	public void setMemEmail(String memEmail) {
		this.memEmail = memEmail;
	}
	public String getMemTel() {
		return memTel;
	}
	public void setMemTel(String memTel) {
		this.memTel = memTel;
	}
	public Integer getProvCodeNo() {
		return provCodeNo;
	}
	public void setProvCodeNo(Integer provCodeNo) {
		this.provCodeNo = provCodeNo;
	}
	public Integer getCityCodeNo() {
		return cityCodeNo;
	}
	public void setCityCodeNo(Integer cityCodeNo) {
		this.cityCodeNo = cityCodeNo;
	}
	public Integer getMemCode() {
		return memCode;
	}
	public void setMemCode(Integer memCode) {
		this.memCode = memCode;
	}
	public Integer getMemActive() {
		return memActive;
	}
	public void setMemActive(Integer memActive) {
		this.memActive = memActive;
	}
	public Integer getMemGender() {
		return memGender;
	}
	public void setMemGender(Integer memGender) {
		this.memGender = memGender;
	}
	public Integer getMemInCom() {
		return memInCom;
	}
	public void setMemInCom(Integer memInCom) {
		this.memInCom = memInCom;
	}
	public String getMemBir() {
		return memBir;
	}
	public void setMemBir(String memBir) {
		this.memBir = memBir;
	}
	public String getMemOrignlPw() {
		return memOrignlPw;
	}
	public void setMemOrignlPw(String memOrignlPw) {
		this.memOrignlPw = memOrignlPw;
	}
	public Integer getAtchFileId() {
		return atchFileId;
	}
	public void setAtchFileId(Integer atchFileId) {
		this.atchFileId = atchFileId;
	}
}
