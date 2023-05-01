package tw.eeit117.wematch.member.model;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.springframework.stereotype.Component;

@Entity
@Table(name = "Member")
@Component("Member")
public class Member {
	@Id
	@Column(name = "MEMBERID")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int memberId;

	@Column(name = "MEMBERACCOUNT")
	private String memberAccount;

	@Column(name = "MEMBERPWD")
	private String memberPwd;

	@Column(name = "MEMBERSTATUS")
	private int memberStatus;

	@Column(name = "MEMBERNAME")
	private String memberName;

	@Column(name = "MEMBEREMAIL")
	private String memberEmail;

	@Column(name = "BIRTHDAYDATE")
	private Date birthdayDate;

	@Column(name = "GENDER")
	private String gender;

	@Column(name = "NICKNAME")
	private String nickname;

	@Column(name = "STARSIGN")
	private String starSign;

	@Column(name = "CITY")
	private String city;

	@Column(name = "BLOODTYPE")
	private String bloodType;

	@Column(name = "HOBBIES")
	private String hobbies;

	@Column(name = "PICTURE_1")
	private byte[] picture_1;

	@Column(name = "PICTURE_2")
	private byte[] picture_2;

	@Column(name = "SELFINTRO")
	private String selfIntro;

	public Member() {

	}

	public Member(String memberAccount, String memberPwd) {
		this.memberAccount = memberAccount;
		this.memberPwd = memberPwd;
	}

	public Member(int memberId, String memberAccount, String memberPwd, int memberStatus, String memberName,
			String memberEmail, Date birthdayDate, String gender, String nickname, String starSign, String city,
			String bloodType, String hobbies, byte[] picture_1, byte[] picture_2, String selfIntro) {
		this.memberId = memberId;
		this.memberAccount = memberAccount;
		this.memberPwd = memberPwd;
		this.memberStatus = memberStatus;
		this.memberName = memberName;
		this.memberEmail = memberEmail;
		this.birthdayDate = birthdayDate;
		this.gender = gender;
		this.nickname = nickname;
		this.starSign = starSign;
		this.city = city;
		this.bloodType = bloodType;
		this.hobbies = hobbies;
		this.picture_1 = picture_1;
		this.picture_2 = picture_2;
		this.selfIntro = selfIntro;
	}

	public int getMemberId() {
		return memberId;
	}

	@Transient
	public void setMemberId(int memberId) {
		this.memberId = memberId;
	}

	public String getMemberAccount() {
		return memberAccount;
	}

	public void setMemberAccount(String memberAccount) {
		this.memberAccount = memberAccount;
	}

	public String getMemberPwd() {
		return memberPwd;
	}

	public void setMemberPwd(String memberPwd) {
		this.memberPwd = memberPwd;
	}

	public int getMemberStatus() {
		return memberStatus;
	}

	public void setMemberStatus(int memberStatus) {
		this.memberStatus = memberStatus;
	}

	public String getMemberName() {
		return memberName;
	}

	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}

	public String getMemberEmail() {
		return memberEmail;
	}

	public void setMemberEmail(String memberEmail) {
		this.memberEmail = memberEmail;
	}

	public Date getBirthdayDate() {
		return birthdayDate;
	}

	public void setBirthdayDate(Date birthdayDate) {
		this.birthdayDate = birthdayDate;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public String getStarSign() {
		return starSign;
	}

	public void setStarSign(String starSign) {
		this.starSign = starSign;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getBloodType() {
		return bloodType;
	}

	public void setBloodType(String bloodType) {
		this.bloodType = bloodType;
	}

	public String getHobbies() {
		return hobbies;
	}

	public void setHobbies(String hobbies) {
		this.hobbies = hobbies;
	}

	public byte[] getPicture_1() {
		return picture_1;
	}

	public void setPicture_1(byte[] picture_1) {
		this.picture_1 = picture_1;
	}

	public byte[] getPicture_2() {
		return picture_2;
	}

	public void setPicture_2(byte[] picture_2) {
		this.picture_2 = picture_2;
	}

	public String getSelfIntro() {
		return selfIntro;
	}

	public void setSelfIntro(String selfIntro) {
		this.selfIntro = selfIntro;
	}
}
