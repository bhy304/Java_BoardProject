package com.bhy.model.board;

/**
 * @author : HayeonBaek
 * @date : 2019. 7. 26.
 * @FileName : boardDTO.java
 * @brief 
 * @details : 하나의 게시글 정보를 담을 수 있는 인스턴스를 만들기 위한 틀, 자바 빈즈 생성
 */
public class boardDTO {

	private int bbsID;
	private String bbsTitle;
	private String userID;
	private String bbsDate; //String으로 관리
	private String bbsContent;
	private int bbsAvailable; 
	
	public boardDTO() {
		super();
	}

	public boardDTO(int bbsID, String bbsTitle, String userID, String bbsDate, String bbsContent, int bbsAvailable) {
		super();
		this.bbsID = bbsID;
		this.bbsTitle = bbsTitle;
		this.userID = userID;
		this.bbsDate = bbsDate;
		this.bbsContent = bbsContent;
		this.bbsAvailable = bbsAvailable;
	}

	public int getBbsID() {
		return bbsID;
	}

	public void setBbsID(int bbsID) {
		this.bbsID = bbsID;
	}

	public String getBbsTitle() {
		return bbsTitle;
	}

	public void setBbsTitle(String bbsTitle) {
		this.bbsTitle = bbsTitle;
	}

	public String getUserID() {
		return userID;
	}

	public void setUserID(String userID) {
		this.userID = userID;
	}

	public String getBbsDate() {
		return bbsDate;
	}

	public void setBbsDate(String bbsDate) {
		this.bbsDate = bbsDate;
	}

	public String getBbsContent() {
		return bbsContent;
	}

	public void setBbsContent(String bbsContent) {
		this.bbsContent = bbsContent;
	}

	public int getBbsAvailable() {
		return bbsAvailable;
	}

	public void setBbsAvailable(int bbsAvailable) {
		this.bbsAvailable = bbsAvailable;
	}

}
