package tw.eeit117.wematch.member.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import tw.eeit117.wematch.member.model.Member;
import tw.eeit117.wematch.member.model.MemberService;

@Controller("MemberAdminController")
public class MemberAdminController {
	
	@Autowired
	private MemberService memberService;
	
	@GetMapping("/MemberAdminPage")	//修改頁面返回管理員主頁
	public String MemberAdminPage(Model m) {
		List<Member> m1 = memberService.selectAllMember();		
		m.addAttribute("results", m1);
		
		return "MemberAdminPage";
	}

//	@RequestMapping(value = "/preInsert", method = RequestMethod.POST)
//	public String preInsert(Model m) {
//		List<Member> m1 = memberService.selectAllMember();		
//		m.addAttribute("results", m1);
//		
//		return "MemberAdminPage";
//	}
	
	@PostMapping("/preInsert.do")
	public String create(Model m) {
		return "MemberAdminPage_c";
	}
	
	@PostMapping("/Insert")
	public String createcheck(HttpServletRequest request, @ModelAttribute("Member")Member member, Model m) {
		Map<String, String> errors = new HashMap<String, String>();
		request.setAttribute("errors", errors);
		
		Boolean check = memberService.insertMember(member.getMemberAccount(), member.getMemberPwd());
		if(check) {
			List<Member> m1 = memberService.selectAllMember();		
			m.addAttribute("results", m1);
			return "MemberAdminPage";			
		}else {
			errors.put("msg", "Insert Error.");
			return "MemberAdminPage_c";
		}
	}
	
	@GetMapping("/MemberPage_Adminupdate")
	public String Update(String account, Model m) {
		m.addAttribute("memberAccount", account);
		Member member = memberService.selectMemberByAccount(account);
		
		m.addAttribute("memberAccount", member.getMemberAccount());
		m.addAttribute("memberName", member.getMemberName());
		m.addAttribute("nickname", member.getNickname());
		m.addAttribute("gender", member.getGender());
		m.addAttribute("email", member.getMemberEmail());
		m.addAttribute("birthday", member.getBirthdayDate());
		m.addAttribute("starSign", member.getStarSign());
		m.addAttribute("city", member.getCity());
		m.addAttribute("bloodtype", member.getBloodType());
		m.addAttribute("hobbies", member.getHobbies());
		m.addAttribute("selfinfo", member.getSelfIntro());
		return "MemberAdminPage_u";
	}
	
	@GetMapping("/preUpdate")	//MemberAdmin倒進特定會員的資料頁面
	public String preUpdate(Integer id, Model m) {
		Member member = memberService.selectMemberById(id);
		
		m.addAttribute("memberAccount", member.getMemberAccount());
		m.addAttribute("memberName", member.getMemberName());
		m.addAttribute("nickname", member.getNickname());
		m.addAttribute("gender", member.getGender());
		m.addAttribute("email", member.getMemberEmail());
		m.addAttribute("birthdayDate", member.getBirthdayDate());
		m.addAttribute("starSign", member.getStarSign());
		m.addAttribute("city", member.getCity());
		m.addAttribute("bloodType", member.getBloodType());
		m.addAttribute("hobbies", member.getHobbies());
		m.addAttribute("selfinfo", member.getSelfIntro());
		return "MemberAdminPage_r";
	}
	
	@PostMapping("/UpdateSend")
	public String UpdateSend(@ModelAttribute("Member")Member member, Model m, HttpSession session) {		
		m.addAttribute("memberAccount", member.getMemberAccount());
		m.addAttribute("memberName", member.getMemberName());
		m.addAttribute("nickname", member.getNickname());
		m.addAttribute("gender", member.getGender());
		m.addAttribute("email", member.getMemberEmail());
		m.addAttribute("birthday", member.getBirthdayDate());
		m.addAttribute("starSign", member.getStarSign());
		m.addAttribute("city", member.getCity());
		m.addAttribute("booldtype", member.getBloodType());
		m.addAttribute("hobbies", member.getHobbies());
		m.addAttribute("selfinfo", member.getSelfIntro());
		memberService.adminUpdateMember(member, session);
		
		return "MemberAdminPage_r";
	}
	
	@RequestMapping(value = "/delete", method = RequestMethod.GET)
	public String delete(Integer id, Model m) {
		Member member = new Member();
		member.setMemberId(id);
		memberService.deleteMember(member.getMemberId());
		
		List<Member> m1 = memberService.selectAllMember();		
		m.addAttribute("results", m1);
		return "MemberAdminPage";
	}
}
