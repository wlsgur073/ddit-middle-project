package kr.or.ddit.hr.vo;

public class HRInfoVO {

	
//	기본 정보  
	private Integer hrNo;
	private Integer memNo;
	private String memNm;
	private Integer memInCom;

	//추가정보
	private Integer hrSal;
	private Integer hrCnt;
	private String hrIntro;
	private Integer atchFileId;
	private String hrCmt;
	private Integer hrOpen;

	public String getHrIntro() {
		return hrIntro;
	}
	public void setHrIntro(String hrIntro) {
		this.hrIntro = hrIntro;
	}
	public Integer getHrOpen() {
		return hrOpen;
	}
	public void setHrOpen(Integer hrOpen) {
		this.hrOpen = hrOpen;
	}
	// 직업 정보 
	private Integer jgCodeNo; 
	private String jgCodeNm;
	private Integer jtCodeNo;
	private String jtCodeNm;
	private String hrCurrCom ;
	


	//	학력 정보 
    private Integer eduNo; //  인재와 학력테이블을 잇는 항목 
	private Integer eduCodeNo ;
	private String eduCodeNm;
	private String eduSchNm;
	private String eduMajor;
	private Integer eduGraTot;
	private Integer eduGraAvg;
	
	// 경력 정보
	private Integer crrNo;
	private String crrCompNm;
	private Integer crrInService;
	private String crrRank;
	private Integer crrYears;
	
	// 자격증 정보 
	private Integer certCodeNo;
	private String certCodeNm;
	
	// 활동 분야  정보  
	private Integer plCodeNo;
	private String plCodeNm;
	
	public Integer getHrNo() {
		return hrNo;
	}
	public void setHrNo(Integer hrNo) {
		this.hrNo = hrNo;
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
	public Integer getMemInCom() {
		return memInCom;
	}
	public void setMemInCom(Integer memInCom) {
		this.memInCom = memInCom;
	}
	public Integer getJgCodeNo() {
		return jgCodeNo;
	}
	public void setJgCodeNo(Integer jgCodeNo) {
		this.jgCodeNo = jgCodeNo;
	}
	public String getJgCodeNm() {
		return jgCodeNm;
	}
	public void setJgCodeNm(String jgCodeNm) {
		this.jgCodeNm = jgCodeNm;
	}
	public Integer getJtCodeNo() {
		return jtCodeNo;
	}
	public void setJtCodeNo(Integer jtCodeNo) {
		this.jtCodeNo = jtCodeNo;
	}
	public String getJtCodeNm() {
		return jtCodeNm;
	}
	public void setJtCodeNm(String jtCodeNm) {
		this.jtCodeNm = jtCodeNm;
	}
	public String getHrCurrCom() {
		return hrCurrCom;
	}
	public void setHrCurrCom(String hrCurrCom) {
		this.hrCurrCom = hrCurrCom;
	}	
	public Integer getEduNo() {
		return eduNo;
	}
	public void setEduNo(Integer eduNo) {
		this.eduNo = eduNo;
	}
	public Integer getEduCodeNo() {
		return eduCodeNo;
	}
	public void setEduCodeNo(Integer eduCodeNo) {
		this.eduCodeNo = eduCodeNo;
	}
	public String getEduCodeNm() {
		return eduCodeNm;
	}
	public void setEduCodeNm(String eduCodeNm) {
		this.eduCodeNm = eduCodeNm;
	}
	public String getEduSchNm() {
		return eduSchNm;
	}
	public void setEduSchNm(String eduSchNm) {
		this.eduSchNm = eduSchNm;
	}
	public String getEduMajor() {
		return eduMajor;
	}
	public void setEduMajor(String eduMajor) {
		this.eduMajor = eduMajor;
	}
	public Integer getEduGraTot() {
		return eduGraTot;
	}
	public void setEduGraTot(Integer eduGraTot) {
		this.eduGraTot = eduGraTot;
	}
	public Integer geteDuGraAvg() {
		return eduGraAvg;
	}
	public void seteDuGraAvg(Integer eDuGraAvg) {
		this.eduGraAvg = eDuGraAvg;
	}
	public Integer getCrrNo() {
		return crrNo;
	}
	public void setCrrNo(Integer crrNo) {
		this.crrNo = crrNo;
	}
	public String getCrrCompNm() {
		return crrCompNm;
	}
	public void setCrrCompNm(String crrNm) {
		this.crrCompNm = crrNm;
	}
	public Integer getCrrInService() {
		return crrInService;
	}
	public void setCrrInService(Integer crrInService) {
		this.crrInService = crrInService;
	}
	public String getCrrRank() {
		return crrRank;
	}
	public void setCrrRank(String crrRank) {
		this.crrRank = crrRank;
	}
	public Integer getCrrYears() {
		return crrYears;
	}
	public void setCrrYears(Integer crrYears) {
		this.crrYears = crrYears;
	}
	public Integer getCertCodeNo() {
		return certCodeNo;
	}
	public void setCertCodeNo(Integer certCodeNo) {
		this.certCodeNo = certCodeNo;
	}

	public Integer getPlCodeNo() {
		return plCodeNo;
	}
	public void setPlCodeNo(Integer plCodeNo) {
		this.plCodeNo = plCodeNo;
	}
	public String getPlCodeNm() {
		return plCodeNm;
	}
	public void setPlCodeNm(String plCodeNm) {
		this.plCodeNm = plCodeNm;
	}
	
	public Integer getEduGraAvg() {
		return eduGraAvg;
	}
	public void setEduGraAvg(Integer eduGraAvg) {
		this.eduGraAvg = eduGraAvg;
	}
	public String getCertCodeNm() {
		return certCodeNm;
	}
	public void setCertCodeNm(String certCodeNm) {
		this.certCodeNm = certCodeNm;
	}
	
	
	public Integer getHrSal() {
		return hrSal;
	}
	public void setHrSal(Integer hrSal) {
		this.hrSal = hrSal;
	}
	public Integer getHrCnt() {
		return hrCnt;
	}
	public void setHrCnt(Integer hrCnt) {
		this.hrCnt = hrCnt;
	}
	
	public Integer getAtchFileId() {
		return atchFileId;
	}
	public void setAtchFileId(Integer atchFileId) {
		this.atchFileId = atchFileId;
	}
	public String getHrCmt() {
		return hrCmt;
	}
	public void setHrCmt(String hrCmt) {
		this.hrCmt = hrCmt;
	}
	
}
