package member.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;

import member.bean.MemberDTO;
import member.bean.ZipcodeDTO;
import member.service.MemberService;

@Controller
@RequestMapping(value="member")
@SessionAttributes({"memId", "memName", "memEmail"})
public class MemberController {
	@Autowired
	private MemberService memberService;
	
	@RequestMapping(value="writeForm", method=RequestMethod.GET)
	public String writeForm(Model model) {
		model.addAttribute("display", "/member/writeForm.jsp");
		return "/main/index";
	}
	
	@RequestMapping(value="write", method=RequestMethod.POST)
	public String write(@ModelAttribute MemberDTO memberDTO, Model model) {
		int su = memberService.write(memberDTO);
		
		model.addAttribute("su", su);
		model.addAttribute("display", "/member/write.jsp");
		return "/main/index";
	}
	
	@RequestMapping(value="login", method=RequestMethod.POST)
	public @ResponseBody String login(@RequestParam Map<String, String> map,
									  Model model) {
		MemberDTO memberDTO = memberService.login(map);
		
		String loginResult = null;
		if(memberDTO == null) {
			loginResult = "fail";
			
		}else {
			model.addAttribute("memName", memberDTO.getName());
			model.addAttribute("memId", map.get("id"));
			model.addAttribute("memEmail", memberDTO.getEmail1()+"@"+memberDTO.getEmail2());
			
			loginResult = "success";
		}

		return loginResult;
	}
		
	@RequestMapping(value="logout", method=RequestMethod.GET)
	//public ModelAndView logout(HttpSession session) {
	public ModelAndView logout(SessionStatus sessionStatus) {
		//session.invalidate();
		sessionStatus.setComplete();
		return new ModelAndView("redirect:/main/index");	
	}
	
	@RequestMapping(value="checkId", method=RequestMethod.POST)
	public @ResponseBody String checkId(@RequestParam String id) {
		return memberService.isExistId(id);
	}
	
	@RequestMapping(value="checkPost", method=RequestMethod.GET)
	public String checkPost() {
		return "/member/checkPost";
	}
	
	@RequestMapping(value="postSearch", method=RequestMethod.POST)
	public ModelAndView postSearch(@RequestParam Map<String, String> map) {
		List<ZipcodeDTO> list = memberService.postSearch(map);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("list", list);
		mav.setViewName("jsonView");	
		return mav;
	}
	
}













