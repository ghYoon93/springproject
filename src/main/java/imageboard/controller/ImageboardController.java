package imageboard.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(value="imageboard")
public class ImageboardController {
	@RequestMapping(value="imageboardWriteForm", method=RequestMethod.GET)
	public String imageboardWriteForm(Model model) {
		model.addAttribute("display","/imageboard/imageboardWriteForm.jsp");
		return "/main/index";
	}

}
