package tw.eeit117.wematch.diet.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import tw.eeit117.wematch.booking.model.bookingBean;
import tw.eeit117.wematch.diet.bean.Food;
import tw.eeit117.wematch.diet.service.FoodService;

@Controller
public class FoodController {

	@Autowired
	FoodService foodService;

	@GetMapping("/diet")
	public String diet() {
		return "diet";
	}

	@GetMapping("/diet_basicSetting")
	public String dietBasicSetting() {
		return "diet_basicSetting";
	}

	@GetMapping("/diet_newDiet")
	public String go(Model m) {

		Food food = new Food();
		m.addAttribute("Food", food);

		return "diet_newDiet";
	}

	@GetMapping("/diet_queryCalories")
	public String dietQueryCalories() {
		return "diet_queryCalories";
	}

	@RequestMapping(value="/addFood" , method = RequestMethod.POST)
	public String addFood(@ModelAttribute("Food") Food food,Model m,HttpSession session) {
		session.setAttribute("addDate", food.getAddDate());
		session.setAttribute("listName", food.getListName());
		session.setAttribute("calories", food.getCalories());
		
		foodService.addFood(food);		

		return "redirect:/diet_newDiet";
	}

	@GetMapping("/foodList")
	public @ResponseBody List<Food> selectSomeFood(@RequestParam("oneday") String oneday) {

		List<Food> foods = foodService.selectSome(oneday);
		
		return foods;
	}

	@ModelAttribute("typeList")
	public Map<String, String> getFoodType() {
		Map<String, String> typeList = new HashMap<String, String>();
		typeList.put("肉", "肉");
		typeList.put("飲料", "飲料");
		typeList.put("餅乾", "餅乾");
		typeList.put("麵食", "麵食");
		typeList.put("麵包", "麵包");
		typeList.put("水果", "水果");
		return typeList;
	}

}
