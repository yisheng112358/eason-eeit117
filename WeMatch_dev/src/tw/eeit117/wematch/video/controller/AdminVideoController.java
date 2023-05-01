package tw.eeit117.wematch.video.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import tw.eeit117.wematch.video.model.Video;
import tw.eeit117.wematch.video.model.VideoService;

@Controller
@RequestMapping("/video")
public class AdminVideoController {

	@Autowired
	private VideoService videoService;

	@RequestMapping(value = "/admindelete", method = RequestMethod.POST)
	public String admindelete(Model m) {
		List<Video> m1 = videoService.selectAllVideo();
		m.addAttribute("films", m1);

		return "VideoDeletePage";

	}

	@RequestMapping(value = "/delete", method = RequestMethod.GET)
	public String delete(Integer id) {

		videoService.deleteVideo(id);

		return "redirect:/video";
	}
	
//	@RequestMapping(value = "/adminadd", method = RequestMethod.GET)
//	public String adminadd() {
//		return "VideoListPage";
//	}

//	@RequestMapping(value = "/videopage", method = RequestMethod.GET)
//	public String videoPage() {
//		return "VideoPage";
//	}
	

	
}
