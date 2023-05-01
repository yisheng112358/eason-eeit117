package tw.eeit117.wematch.video.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.springframework.stereotype.Component;

@Entity
@Table(name = "Video")
@Component
public class Video {

	private Integer videoId;
	private String videoName;
	private String videoCategory;
	private String videoLink;
	private String videoDesc;
	
	public Video() {
	}
	
	public Video(String videoName, String videoCategory, String videoLink, String videoDesc) {
		this.videoName = videoName;
		this.videoCategory = videoCategory;
		this.videoLink = videoLink;
		this.videoDesc = videoDesc;
	}

	@Id	@Column(name = "videoId")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	public Integer getVideoId() {
		return videoId;
	}

	public void setVideoId(Integer videoId) {
		this.videoId = videoId;
	}

	@Column(name = "videoName")
	public String getVideoName() {
		return videoName;
	}

	public void setVideoName(String videoName) {
		this.videoName = videoName;
	}

	@Column(name = "videoCategory")
	public String getVideoCategory() {
		return videoCategory;
	}

	public void setVideoCategory(String videoCategory) {
		this.videoCategory = videoCategory;
	}

	@Column(name = "videoLink")
	public String getVideoLink() {
		return videoLink;
	}

	public void setVideoLink(String videoLink) {
		this.videoLink = videoLink;
	}

	@Column(name = "videoDesc")
	public String getVideoDesc() {
		return videoDesc;
	}

	public void setVideoDesc(String videoDesc) {
		this.videoDesc = videoDesc;
	}

	@Override
	public String toString() {

		return "Video [videoId=" + videoId + ", videoCategory=" + videoCategory + ", videoName=" + videoName
				+ ", videoCategory=" + videoCategory + ", videoLink=" + videoLink + ", videoDesc=" + videoDesc
				+ "]";
	}

}