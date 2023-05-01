package tw.eeit117.wematch.coach.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.jboss.logging.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import tw.eeit117.wematch.coach.model.Coach;
import tw.eeit117.wematch.coach.service.CoachService;

@Controller
public class CoachController {

	private static final Logger logger = Logger.getLogger(CoachController.class);

	public CoachController() {

	}

	@Autowired
	private CoachService coachService;

	// 前端教練介紹
	@GetMapping("/coachPage")
	public String coachPage() {
		return "CoachBrowse1";
	}

	// 後台教練管理系統
	@GetMapping("/coachAdminPage")
	public String coachAdminPage() {
		return "CoachAdmiPage";
	}

	// 網頁跳到新增教練資料
	@GetMapping("/admin/newCoach")
	public ModelAndView insertCoach(ModelAndView model) {
		Coach coach = new Coach();
		model.addObject("coach", coach);
		model.setViewName("CoachAdmiPage_c");
		return model;
	}

	// 新增或更新完會回到教練管理系統 //照老師修改的成功
	@RequestMapping(value = "/admin/saveCoach", method = RequestMethod.POST)
	@ResponseBody
	public ModelAndView saveCoach(@RequestParam(name = "coachPic") MultipartFile multipartFile,
			@RequestParam(name = "coachName") String coachName,
			@RequestParam(name = "coachNickname") String coachNickname,
			@RequestParam(name = "coachAge") Integer coachAge, @RequestParam(name = "courseName") String courseName,
			@RequestParam(name = "courseType") String courseType, @RequestParam(name = "license") String license,
			HttpServletRequest request) throws IOException {

		String fileName = multipartFile.getOriginalFilename();
		System.out.println("fileName:" + fileName);

		String savePath = request.getSession().getServletContext().getRealPath("/") + "uploadTempDir\\" + fileName;
		File saveFile = new File(savePath);
		multipartFile.transferTo(saveFile);
		System.out.println("savePath:" + savePath);

		if (fileName != null && fileName.length() != 0) {
			savePicture(coachName, coachNickname, coachAge, courseName, courseType, license, savePath);
		}

		return new ModelAndView("redirect:/coachAdminPage");
	}

	private void savePicture(String coachName, String coachNickname, Integer coachAge, String courseName,
			String courseType, String license, String savePath) throws IOException {
		Coach coach = new Coach();

		coach.setCoachName(coachName);
		coach.setCoachNickname(coachNickname);
		coach.setCoachAge(coachAge);
		coach.setCourseName(courseName);
		coach.setCourseType(courseType);
		coach.setLicense(license);
		InputStream is1 = new FileInputStream(savePath);
		byte[] data = new byte[is1.available()];
		is1.read(data);
		is1.close();

		coach.setCoachPic(data);

		coachService.insert(coach);
	}

	// 查詢所有教練資料
	@GetMapping(value = { "/coachData", "/admin/coachData" })
	public @ResponseBody List<Coach> searchAllCoach(Model model) {
		List<Coach> coach = coachService.selectAll();
		return coach;
	}

	// 刪除教練資料
	@GetMapping("/coachDelete/{key}")
	public ModelAndView deleteCoach(@PathVariable Integer key, Model model, HttpServletRequest request) {
		model.addAttribute("coachId", key);
		coachService.delete(key);

		return new ModelAndView("redirect:/coachAdminPage");
	}

	// 轉送出能夠進行修改的網頁
	@GetMapping("/coachEdit/{key}")
	public String showEditMemberForm(@PathVariable Integer key, Model model, HttpServletRequest request) {
		model.addAttribute("coachId", key);
		Coach coach = coachService.select(key);

		request.setAttribute("coachName", coach.getCoachName());
		request.setAttribute("coachNickname", coach.getCoachNickname());
		request.setAttribute("coachAge", coach.getCoachAge());
		request.setAttribute("courseName", coach.getCourseName());
		request.setAttribute("courseType", coach.getCourseType());
		request.setAttribute("license", coach.getLicense());

		return "CoachAdmiPage_u";
	}

	// 修改教練資料
	@PostMapping("/editCoach")
	public ModelAndView editCoach(@RequestParam(name = "coachId") Integer coachId,
			@RequestParam(name = "coachPic") MultipartFile multipartFile,
			@RequestParam(name = "coachName") String coachName,
			@RequestParam(name = "coachNickname") String coachNickname,
			@RequestParam(name = "coachAge") Integer coachAge, @RequestParam(name = "courseName") String courseName,
			@RequestParam(name = "courseType") String courseType, @RequestParam(name = "license") String license,
			HttpServletRequest request, Model model) throws Exception, IOException {
		System.out.println("coachId:" + coachId);
		String fileName = multipartFile.getOriginalFilename();
		System.out.println("fileName:" + fileName);
		String savePath = request.getSession().getServletContext().getRealPath("/") + "uploadTempDir\\" + fileName;
		File saveFile = new File(savePath);
		multipartFile.transferTo(saveFile);
		System.out.println("savePath:" + savePath);

		if (fileName != null && fileName.length() != 0) {
			updatePicture(coachName, coachNickname, coachAge, courseName, courseType, license, savePath, coachId);
		}

		return new ModelAndView("redirect:/coachAdminPage");
	}

	private void updatePicture(String coachName, String coachNickname, Integer coachAge, String courseName,
			String courseType, String license, String savePath, Integer coachId) throws IOException {

		Coach coach = coachService.select(coachId);

		coach.setCoachName(coachName);
		coach.setCoachNickname(coachNickname);
		coach.setCoachAge(coachAge);
		coach.setCourseName(courseName);
		coach.setCourseType(courseType);
		coach.setLicense(license);
		InputStream is1 = new FileInputStream(savePath);
		byte[] data = new byte[is1.available()];
		is1.read(data);
		is1.close();

		coach.setCoachPic(data);

		coachService.update(coach);
	}

	@GetMapping(value = "/search", params = { "keyword" })
	public @ResponseBody List<Coach> search(@RequestParam String keyword) {
		List<Coach> coach = coachService.findByKeyword(keyword);
		return coach;
	}
}
