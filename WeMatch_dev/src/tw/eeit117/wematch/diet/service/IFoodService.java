package tw.eeit117.wematch.diet.service;

import java.util.List;

import tw.eeit117.wematch.diet.bean.Food;

public interface IFoodService {
	
	//新增
	public void addFood(Food food);
		
	//多筆查詢
	public List<Food> selectSome(String oneday);
}
