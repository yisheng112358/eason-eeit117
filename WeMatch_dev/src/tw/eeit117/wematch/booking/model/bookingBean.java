package tw.eeit117.wematch.booking.model;


import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.springframework.stereotype.Component;

@Entity
@Table(name = "Booking")
@Component("Booking")
public class bookingBean {
	private Integer bookingId;
	private String bookingDate;
	private String bookingTime;
	private String ept1;
	private String ept2;
	private String ept3;
	private String ept4;
	private String ept5;
	private String ept6;
	private String ept7;
	private String ept8;
	private String ept9;
	private String ept10;
	private String ept11;
	private String ept12;
	private String bookingName;

	public bookingBean() {
	}

	public bookingBean(String bookingDate, String bookingTime, String ept1, String ept2, String ept3, String ept4,String ept5,String ept6,String ept7,String ept8,String ept9,String ept10,String ept11,String ept12) {
		this.bookingDate = bookingDate;
		this.bookingTime = bookingTime;
		this.ept1 = ept1;
		this.ept2 = ept2;
		this.ept3 = ept3;
		this.ept4 = ept4;
		this.ept5 = ept5;
		this.ept6 = ept6;
		this.ept7 = ept7;
		this.ept8 = ept8;
		this.ept9 = ept9;
		this.ept10 = ept10;
		this.ept11 = ept11;
		this.ept12 = ept12;
		this.bookingName=bookingName;

	}

	@Id
	@Column(name = "bookingId")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	public Integer getBookingId() {
		return bookingId;
	}

	public void setBookingId(Integer bookingId) {
		this.bookingId = bookingId;
	}

	@Column(name = "bookingDate")
	public String getBookingDate() {
		return bookingDate;
	}

	public void setBookingDate(String bookingDate) {
		this.bookingDate = bookingDate;
	}

	@Column(name = "bookingTime")
	public String getBookingTime() {
		return bookingTime;
	}

	public void setBookingTime(String bookingTime) {
		this.bookingTime = bookingTime;
	}

	@Column(name = "ept1")
	public String getEpt1() {
		return ept1;
	}

	public void setEpt1(String ept1) {
		this.ept1 = ept1;
	}

	@Column(name = "ept2")
	public String getEpt2() {
		return ept2;
	}

	public void setEpt2(String ept2) {
		this.ept2 = ept2;
	}

	@Column(name = "ept3")
	public String getEpt3() {
		return ept3;
	}

	public void setEpt3(String ept3) {
		this.ept3 = ept3;
	}

	@Column(name = "ept4")
	public String getEpt4() {
		return ept4;
	}

	public void setEpt4(String ept4) {
		this.ept4 = ept4;
	}
	
	@Column(name = "ept5")
	public String getEpt5() {
		return ept5;
	}

	public void setEpt5(String ept5) {
		this.ept5 = ept5;
	}
	
	@Column(name = "ept6")
	public String getEpt6() {
		return ept6;
	}

	public void setEpt6(String ept6) {
		this.ept6 = ept6;
	}
	
	@Column(name = "ept7")
	public String getEpt7() {
		return ept7;
	}

	public void setEpt7(String ept7) {
		this.ept7 = ept7;
	}
	
	@Column(name = "ept8")
	public String getEpt8() {
		return ept8;
	}

	public void setEpt8(String ept8) {
		this.ept8 = ept8;
	}
	
	@Column(name = "ept9")
	public String getEpt9() {
		return ept9;
	}

	public void setEpt9(String ept9) {
		this.ept9 = ept9;
	}
	
	@Column(name = "ept10")
	public String getEpt10() {
		return ept10;
	}

	public void setEpt10(String ept10) {
		this.ept10 = ept10;
	}
	
	
	@Column(name = "ept11")
	public String getEpt11() {
		return ept11;
	}

	public void setEpt11(String ept11) {
		this.ept11 = ept11;
	}
	
	@Column(name = "ept12")
	public String getEpt12() {
		return ept12;
	}

	public void setEpt12(String ept12) {
		this.ept12 = ept12;
	}
	
	
	@Column(name = "bookingName")
	public String getBookingName() {
		return bookingName;
	}

	public void setBookingName(String bookingName) {
		this.bookingName = bookingName;
	}



//	@Override
//	public String toString() {
//		return "bookingBean [bookingId=" + bookingId + ", bookingDate=" + bookingDate + ", bookingTime=" + bookingTime
//				+ ", ept1=" + ept1 + ", ept2=" + ept2 + ", ept3=" + ept3 + ", ept4=" + ept4 + ",ept5="+ept5+" ]";
//	}

}
