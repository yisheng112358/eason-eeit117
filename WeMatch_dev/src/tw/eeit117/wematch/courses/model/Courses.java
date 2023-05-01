package tw.eeit117.wematch.courses.model;

import java.util.Date;
import java.sql.Timestamp;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.springframework.stereotype.Component;

@Entity
@Table(name = "Courses")
@Component("Courses")
public class Courses {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "coursesId")
	private int coursesId;
	
	@Column(name = "coursesName")
	private String coursesName;

	@Column(name = "coursesWeek")
	private String coursesWeek;
	
	@Column(name = "sectionNumber")
	private String sectionNumber;
	
	@Column(name = "classRoom")
	private String classRoom;
	
	@Column(name = "numberPeople")
	private int numberPeople;
	
	@Column(name = "regNumber")
	private int regNumber;
	
	@Column(name = "coursesBalance")
	private int coursesBalance;

	public Courses() {
		
	}//空建構子
	
	public Courses(String coursesName,String coursesWeek,String sectionNumber,
			String classRoom,int numberPeople,int regNumber,int coursesBalance) {
		
		this.coursesName = coursesName;
		this.coursesWeek = coursesWeek;
		this.sectionNumber = sectionNumber;
		this.classRoom = classRoom;
		this.numberPeople = numberPeople;
		this.regNumber = regNumber;
		this.coursesBalance = coursesBalance;	
	}

	public int getCoursesId() {
		return coursesId;
	}

	public void setCoursesId(int coursesId) {
		this.coursesId = coursesId;
	}

	public String getCoursesName() {
		return coursesName;
	}

	public void setCoursesName(String coursesName) {
		this.coursesName = coursesName;
	}

	public String getCoursesWeek() {
		return coursesWeek;
	}

	public void setCoursesWeek(String coursesWeek) {
		this.coursesWeek = coursesWeek;
	}

	public String getSectionNumber() {
		return sectionNumber;
	}

	public void setSectionNumber(String sectionNumber) {
		this.sectionNumber = sectionNumber;
	}

	public String getClassRoom() {
		return classRoom;
	}

	public void setClassRoom(String classRoom) {
		this.classRoom = classRoom;
	}

	public int getNumberPeople() {
		return numberPeople;
	}

	public void setNumberPeople(int numberPeople) {
		this.numberPeople = numberPeople;
	}

	public int getRegNumber() {
		return regNumber;
	}

	public void setRegNumber(int regNumber) {
		this.regNumber = regNumber;
	}

	public int getCoursesBalance() {
		return coursesBalance;
	}

	public void setCoursesBalance(int coursesBalance) {
		this.coursesBalance = coursesBalance;
	}

}
