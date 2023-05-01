package tw.eeit117.wematch.diet.dao;

import java.util.List;

import tw.eeit117.wematch.diet.bean.Food;

public interface IFoodDAO {

	//新增
	public void addFood(Food food);  

	// 多筆查詢
	public List<Food> selectSome(String oneday);
}
