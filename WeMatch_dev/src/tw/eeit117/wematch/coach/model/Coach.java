package tw.eeit117.wematch.coach.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.springframework.stereotype.Component;

@Entity
@Table(name = "Coach")
@Component
public class Coach {
	private Integer coachId;
	private byte[] coachPic;
	private String coachName;
	private String coachNickname;
	private Integer coachAge;
	private String courseName;
	private String courseType;
	private String license;

	public Coach() {

	}

	public Coach(byte[] coachPic,String coachName,String coachNickname,Integer coachAge,
			String courseName, String courseType,String license) {
		this.coachPic = coachPic;
		this.coachName = coachName;
		this.coachNickname = coachNickname;
		this.coachAge = coachAge;
		this.courseName = courseName;
		this.courseType = courseType;
		this.license = license;
	}
	
	@Id
	@Column(name = "coachId")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	public Integer getCoachId() {
		return coachId;
	}

	public void setCoachId(Integer coachId) {
		this.coachId = coachId;
	}
	
	@Column(name = "coachPic")
	public byte[] getCoachPic() {
		return coachPic;
	}

	public void setCoachPic(byte[] coachPic) {
		this.coachPic = coachPic;
	}

	@Column(name = "coachName")
	public String getCoachName() {
		return coachName;
	}

	public void setCoachName(String coachName) {
		this.coachName = coachName;
	}

	@Column(name = "coachNickname")
	public String getCoachNickname() {
		return coachNickname;
	}

	public void setCoachNickname(String coachNickname) {
		this.coachNickname = coachNickname;
	}

	@Column(name = "coachAge")
	public Integer getCoachAge() {
		return coachAge;
	}

	public void setCoachAge(Integer coachAge) {
		this.coachAge = coachAge;
	}

	@Column(name = "courseName")
	public String getCourseName() {
		return courseName;
	}

	public void setCourseName(String courseName) {
		this.courseName = courseName;
	}

	@Column(name = "courseType")
	public String getCourseType() {
		return courseType;
	}

	public void setCourseType(String courseType) {
		this.courseType = courseType;
	}

	@Column(name = "license")
	public String getLicense() {
		return license;
	}

	public void setLicense(String license) {
		this.license = license;
	}

}
