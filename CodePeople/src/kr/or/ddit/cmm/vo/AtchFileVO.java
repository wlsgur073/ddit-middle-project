package kr.or.ddit.cmm.vo;

public class AtchFileVO {
	private Integer atchFileId = -1;	// 泥⑤��뙆�씪 ID
	private Integer fileSn = 1;			// �뙆�씪�닚踰�
	private String fileStrePath;	// �뙆�씪���옣 寃쎈줈
	private String streFileNm;		// ���옣�뙆�씪紐�
	private String orignlFileNm;	// �떎�젣�뙆�씪紐�
	private String fileExtsn;		// �뙆�씪 �솗�옣�옄
	private String fileCn;			// �뙆�씪 �궡�슜
	private Integer fileSize = 0;		// �뙆�씪 �겕湲�
	private Integer fileUsage = 0;		// �뙆�씪 �겕湲�
	public long getAtchFileId() {
		return atchFileId;
	}
	public void setAtchFileId(Integer atchFileId) {
		this.atchFileId = atchFileId;
	}
	public Integer getFileSn() {
		return fileSn;
	}
	public void setFileSn(Integer fileSn) {
		this.fileSn = fileSn;
	}
	public String getFileStrePath() {
		return fileStrePath;
	}
	public void setFileStrePath(String fileStrePath) {
		this.fileStrePath = fileStrePath;
	}
	public String getStreFileNm() {
		return streFileNm;
	}
	public void setStreFileNm(String streFileNm) {
		this.streFileNm = streFileNm;
	}
	public String getOrignlFileNm() {
		return orignlFileNm;
	}
	public void setOrignlFileNm(String orignlFileNm) {
		this.orignlFileNm = orignlFileNm;
	}
	public String getFileExtsn() {
		return fileExtsn;
	}
	public void setFileExtsn(String fileExtsn) {
		this.fileExtsn = fileExtsn;
	}
	public String getFileCn() {
		return fileCn;
	}
	public void setFileCn(String fileCn) {
		this.fileCn = fileCn;
	}
	public Integer getFileSize() {
		return fileSize;
	}
	public void setFileSize(Integer fileSize) {
		this.fileSize = fileSize;
	}
	public Integer getFileUsage() {
		return fileUsage;
	}
	public void setFileUsage(Integer fileUsage) {
		this.fileUsage = fileUsage;
	}

	
}
