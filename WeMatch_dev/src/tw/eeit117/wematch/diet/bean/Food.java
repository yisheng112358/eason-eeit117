package tw.eeit117.wematch.diet.bean;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.springframework.stereotype.Component;

@Entity
@Table(name = "Food")
@Component
public class Food{
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "Id")
	private int Id;
	
	@Column(name = "addDate")
	private String addDate;
	
	@Column(name = "listType")
	private String listType;
	
	@Column(name = "listName")
	private String listName;
	
	@Column(name = "calories")
	private String calories;
	
	public Food() {
		
	}
	
	public Food(String addDate,String listName,String calories) {
		this.addDate=addDate;
		this.listName=listName;
		this.calories=calories;
	}
	
	public int getId() {
		return Id;
	}
	
	public void setId(int id) {
		Id = id;
	}
	
	public String getAddDate() {
		return addDate;
	}
	
	public void setAddDate(String addDate) {
		this.addDate = addDate;
	}
	
	public String getListType() {
		return listType;
	}

	public void setListType(String listType) {
		this.listType = listType;
	}

	public String getListName() {
		return listName;
	}
	
	public void setListName(String listName) {
		this.listName = listName;
	}
	
	public String getCalories() {
		return calories;
	}
	
	public void setCalories(String calories) {
		this.calories = calories;
	}
	
}






//@Entity
//@Table(name = "Food")
//@Component("Food")
//public class Food {
//	private int Id;
//	private String addDate;
//	private String listName;
//	private int calories;
//	
//	public Food() {
//		
//	}
//	
//	public Food(int Id,String addDate,String listName,int calories) {
//		this.Id=Id;
//		this.addDate=addDate;
//		this.listName=listName;
//		this.calories=calories;
//	}
//	
//	@Id
//	@Column(name = "Id")
//	@GeneratedValue(strategy = GenerationType.IDENTITY)
//	public int getId() {
//		return Id;
//	}
//	
//	public void setId(int id) {
//		Id = id;
//	}
//	
//	@Column(name = "addDate")
//	public String getAddDate() {
//		return addDate;
//	}
//	
//	public void setAddDate(String addDate) {
//		this.addDate = addDate;
//	}
//	
//	@Column(name = "listName")
//	public String getListName() {
//		return listName;
//	}
//	
//	public void setListName(String listName) {
//		this.listName = listName;
//	}
//	
//	@Column(name = "calories")
//	public int getCalories() {
//		return calories;
//	}
//	
//	public void setCalories(int calories) {
//		this.calories = calories;
//	}
//	
//}
//
//
//
