package com.bhy.model.user;

/**
 * @author : HayeonBaek
 * @date : 2019. 7. 22.
 * @FileName : userDTO.java
 * @brief 
 * @details : 한 명의 회원 데이터를 다룰 수 있는 자바 빈즈 생성
 */
public class userDTO {

	private String userID;
	private String userPassword;
	private String userName;
	private String userGender;
	private String userEmail;
	
	public userDTO() {
		super();
	}
	
	public userDTO(String userID, String userPassword, String userName, String userGender, String userEmail) {
		super();
		this.userID = userID;
		this.userPassword = userPassword;
		this.userName = userName;
		this.userGender = userGender;
		this.userEmail = userEmail;
	}
	
	public String getUserID() {
		return userID;
	}
	
	public void setUserID(String userID) {
		this.userID = userID;
	}
	
	public String getUserPassword() {
		return userPassword;
	}
	
	public void setUserPassword(String userPassword) {
		this.userPassword = userPassword;
	}
	
	public String getUserName() {
		return userName;
	}
	
	public void setUserName(String userName) {
		this.userName = userName;
	}
	
	public String getUserGender() {
		return userGender;
	}
	
	public void setUserGender(String userGender) {
		this.userGender = userGender;
	}
	
	public String getUserEmail() {
		return userEmail;
	}
	
	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}

}
