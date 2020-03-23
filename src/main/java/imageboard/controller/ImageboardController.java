package imageboard.controller;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import imageboard.bean.ImageboardDTO;

@Controller
@RequestMapping(value="imageboard")
public class ImageboardController {
	@RequestMapping(value="imageboardWriteForm", method=RequestMethod.GET)
	public String imageboardWriteForm(Model model) {
		model.addAttribute("display","/imageboard/imageboardWriteForm.jsp");
		return "/main/index";
	}
//	//name="img" 1개일 경우
//	@RequestMapping(value="imageboardWrite", method=RequestMethod.POST)
//	@ResponseBody //resolver X
//	public void imageboardWrite(@ModelAttribute ImageboardDTO imageboardDTO,
//			@RequestParam MultipartFile img) {
//		System.out.println(imageboardDTO.getImageName()+", "
//				+imageboardDTO.getImage1()+", "
//				+img);
//		String filePath="C:\\Users\\bitcamp\\Desktop\\lecture\\workSTS\\springProject\\src\\main\\webapp\\storage";
//		String fileName=img.getOriginalFilename();
//		File file= new File(filePath,fileName);
//		
//		//파일 복사
//		try {
//			FileCopyUtils.copy(img.getInputStream(), new FileOutputStream(file));
//		} catch (FileNotFoundException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		} catch (IOException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
//
//		imageboardDTO.setImage1(fileName);
//	}
//	//name="img" 2개 이상일 경우 - 배열로 받는다.
//	@RequestMapping(value="imageboardWrite", method=RequestMethod.POST)
//	@ResponseBody //resolver X
//	public void imageboardWrite(@ModelAttribute ImageboardDTO imageboardDTO,
//			@RequestParam MultipartFile[] img) {
//		System.out.println(imageboardDTO.getImageName()+", "
//				+imageboardDTO.getImage1()+", "
//				+img);
//		String filePath = "C:\\Users\\bitcamp\\Desktop\\lecture\\workSTS\\springProject\\src\\main\\webapp\\storage";
//		String fileName;
//		File file;
//		
//		//파일 복사
//		if(img[0] != null) {
//			fileName = img[0].getOriginalFilename();
//			file = new File(filePath, fileName);
//			try {
//				FileCopyUtils.copy(img[0].getInputStream(), new FileOutputStream(file));
//			} catch (FileNotFoundException e) {
//				// TODO Auto-generated catch block
//				e.printStackTrace();
//			} catch (IOException e) {
//				// TODO Auto-generated catch block
//				e.printStackTrace();
//			}
//			
//			imageboardDTO.setImage1(fileName);
//		}else {
//			imageboardDTO.setImage2("");
//		}
//	}
	@RequestMapping(value="imageboardWrite", method=RequestMethod.POST)
	@ResponseBody
	public void imageboardWrite(@ModelAttribute ImageboardDTO imageboardDTO,
								@RequestParam("img[]") List<MultipartFile> list) {
		String filePath = "C:\\Users\\bitcamp\\Desktop\\lecture\\workSTS\\springProject\\src\\main\\webapp\\storage";
		for(MultipartFile img:list) {
			String fileName=img.getOriginalFilename();
			File file=new File(filePath, fileName);
			
			try {
				FileCopyUtils.copy(img.getInputStream(), new FileOutputStream(file));
			} catch (FileNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}
}
