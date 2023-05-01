package tw.eeit117.wematch.courses.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.jboss.logging.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import tw.eeit117.wematch.courses.model.Courses;
import tw.eeit117.wematch.courses.model.Curriculum;
import tw.eeit117.wematch.courses.service.CoursesService;
import tw.eeit117.wematch.courses.service.CurriculumService;

@Controller
public class CoursesController {

	private static final Logger logger = Logger.getLogger(CoursesController.class);

	public CoursesController() {
	}

	@Autowired
	private CoursesService coursesService;
	
	@Autowired
	private CurriculumService curriculumService;

	// 列出所有課程
	@RequestMapping(value = "/CoursesHome")
	public ModelAndView listCourses(ModelAndView model) {
		List<Courses> listCourses = coursesService.getAllCourses();
		model.addObject("listCourses", listCourses);
		model.setViewName("CoursesHome");
		return model;
	}

	// 列出所有課程
	@RequestMapping(value = "/CoursesBrowse")
	public ModelAndView CoursesBrowse(ModelAndView model) {
		List<Courses> listCourses = coursesService.getAllCourses();
		model.addObject("listCourses", listCourses);
		model.setViewName("CoursesBrowse");
		return model;
	}

	// 新增課程
	@RequestMapping(value = "/newCourses", method = RequestMethod.GET)
	public ModelAndView newContact(ModelAndView model) {
		Courses courses = new Courses();
		model.addObject("courses", courses);
		model.setViewName("CoursesForm");
		return model;
	}

	// 新增或更新完會回到首頁
	@RequestMapping(value = "/saveCourses", method = RequestMethod.POST)
	public ModelAndView saveCourses(@ModelAttribute Courses courses, Model m,HttpServletRequest request) {
		
		Map<String, String> errors = new HashMap<String, String>();
    	request.setAttribute("errors", errors);

		
		int a = courses.getRegNumber();
		int b = courses.getCoursesBalance();
		int c = courses.getNumberPeople();
		int d = a+b;
		
		if(c == d) {
			if (courses.getCoursesId() == 0) {
				coursesService.addCourses(courses);
			} else {
				coursesService.updateCourses(courses);
			}			
		}else {  
			errors.put("regNumber", "人數條件不符，請重新輸入");
			errors.put("coursesBalance", "人數條件不符，請重新輸入");
			return new ModelAndView("CoursesForm");
		}
		return new ModelAndView("redirect:/CoursesHome");
	}
	
	// 刪除
	@RequestMapping(value = "/deleteCourses", method = RequestMethod.GET)
	public ModelAndView deleteCourses(HttpServletRequest request) {
		int coursesId = Integer.parseInt(request.getParameter("coursesId"));
		coursesService.deleteCourses(coursesId);
		
		if(curriculumService.checkCourses(coursesId)) {
			curriculumService.deleteCurriculumCourses(coursesId);
	     }
		return new ModelAndView("redirect:/CoursesHome");
	}

	// 編輯
	@RequestMapping(value = "/editCourses", method = RequestMethod.GET)
	public ModelAndView editContact(HttpServletRequest request) {
		int coursesId = Integer.parseInt(request.getParameter("coursesId"));
		Courses courses = coursesService.getCourses(coursesId);
		ModelAndView model = new ModelAndView("CoursesForm");
		model.addObject("courses", courses);

		return model;
	}

}
