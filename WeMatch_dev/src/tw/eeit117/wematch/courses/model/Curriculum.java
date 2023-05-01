package tw.eeit117.wematch.courses.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.springframework.stereotype.Component;

@Entity
@Table(name = "Curriculum")
@Component("Curriculum")
public class Curriculum {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "curriculumId")
	private int curriculumId;
	
	@Column(name = "memberId")
	private int memberId;
	
	//與課程連線
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
		
	public Curriculum(int curriculumId,int memberId,int coursesId,String coursesName,String coursesWeek,
						String sectionNumber,String classRoom) {
		this.curriculumId =  curriculumId;
		this.memberId = memberId;
		this.coursesId = coursesId;
		this.coursesName = coursesName;
		this.coursesWeek = coursesWeek;
		this.sectionNumber = sectionNumber;
		this.classRoom = classRoom;
	}
	
	//空建構子
	public Curriculum() {
		
	}

	public int getCurriculumId() {
		return curriculumId;
	}

	public void setCurriculumId(int curriculumId) {
		this.curriculumId = curriculumId;
	}

	public int getMemberId() {
		return memberId;
	}

	public void setMemberId(int memberId) {
		this.memberId = memberId;
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

}
