package com.example.demo;

import java.io.IOException;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.example.demo.dao.IdiaryDao;
import com.example.demo.dao.IgalleryDao;
import com.example.demo.dao.IvisitorDao;
import com.example.demo.dto.diaryDto;
import com.example.demo.dto.galleryDto;
import com.example.demo.dto.userDto;
import com.example.demo.dto.visitorDto;
import com.example.demo.service.userService;



@Controller
public class mainController {
	
	@Autowired
	private userService userService;
	
	@RequestMapping("/")
	public String root() {
		return "redirect:login";
	}
	
	@RequestMapping("/login")
	public String login(HttpServletRequest request,Model model) {
		model.addAttribute("mainPage", "login.jsp");
		return "index";
	}
	
	@RequestMapping("/loginAction")
	public String loginAction(@RequestParam("user_id") String user_id, @RequestParam("user_pw") String user_pw,
				HttpServletRequest request, Model model) {
		int result = userService.login(user_id, user_pw);
		
		if(result == 1 ) {
			
			request.getSession().setAttribute("user_id", user_id);


			List<userDto> user_list = userService.user_list(user_id);
			System.out.println(user_list);
			List<galleryDto> re_list = galleryDao.re_list();
			model.addAttribute("re_list", re_list);
			model.addAttribute("user_list", user_list);
			model.addAttribute("mainPage", "main.jsp");
			return "index";
		} else {
			System.out.println("dhsdfjhaskfhdasf");
			model.addAttribute("mainPage", "login.jsp");
			return "index";
		}
	}
	
	@RequestMapping("/logoutAction")
	public String logoutAction(HttpServletRequest request, Model model) {

		request.getSession().invalidate();
		
		model.addAttribute("mainPage", "login.jsp");
		return "index";
	}
	
	@RequestMapping("join")
	public String join(HttpServletRequest request,Model model) {
		model.addAttribute("mainPage", "join.jsp");
		return "index";
	}
	
	@RequestMapping("/joinAction")
	public String joinAction(@RequestParam("name") String join_name, @RequestParam("email") String join_email,
			@RequestParam("phone") String join_phone, @RequestParam("id") String join_id,
			@RequestParam("password") String join_pw, @RequestParam("room") String join_gender,
			@DateTimeFormat(pattern="yyyyMMdd") @RequestParam("birthday") Date join_bd, HttpServletRequest request
			, Model model) {
		int result = 0;
		
		String user_name = join_name;
		System.out.println(join_name);
		String user_id = join_id;
		System.out.println(join_id);
		String user_pw = join_pw;
		System.out.println(join_pw);
		String user_phone = join_phone;
		System.out.println(join_phone);
		String user_address = request.getParameter("addr1") + " " + request.getParameter("addr2");
		String user_gender = join_gender;
		System.out.println(join_gender);
		Date user_birthday = join_bd;
		System.out.println(join_bd);
		String user_email = join_email;
		System.out.println(join_email);
		

		try {
			result = userService.join_user(user_name, user_id, user_pw, user_phone, user_address, user_gender,
					user_birthday, user_email);
		} catch (Exception e) {
			// TODO: handle exception
		}
		if (result == 1) {
			return "redirect:/main";
		} else {
			return "redirect:/join";
		}
	}
	
	@RequestMapping("/main")
	public String main(HttpServletRequest request,Model model, HttpServletResponse response, Object handler)
            throws Exception {
		if(request.getSession().getAttribute("user_id") == null) {
			model.addAttribute("mainPage", "login.jsp");
            
            return "index";
        }
		HttpSession session = request.getSession();
		String user_id = (String)session.getAttribute("user_id");
		
		List<galleryDto> re_list = galleryDao.re_list();
		model.addAttribute("re_list", re_list);

		List<userDto> user_list = userService.user_list(user_id);
		System.out.println(user_list);
		model.addAttribute("user_list", user_list);
		model.addAttribute("mainPage", "main.jsp");
	
		return "index";
	}
	
//	-다이어리-------------------------------------------------------------

	@Autowired
	IdiaryDao diaryDao;
	
	@RequestMapping("/diary")
	public String diary(HttpServletRequest request,Model model) {
		return "redirect:/diary_folder_view?diary_folder_idx=1";
	}
	
	@RequestMapping("/diary_write")
	public String diary_write(HttpServletRequest request,Model model) {
		
		model.addAttribute("mainPage", "diary/diary_write.jsp");
		return "index";
	}
	
	@RequestMapping("/diaryWriteAction")
	public String diaryWriteAction(@RequestParam("diary_title") String diary_title,
								   @RequestParam("diary_contents") String diary_contents,
								   HttpServletRequest request) {
		
		String diary_folder_idx = request.getParameter("folder");
		
		HttpSession session = request.getSession();
		String diary_user_id = (String)session.getAttribute("user_id");

		int result = diaryDao.diary_write(diary_user_id, diary_title, diary_contents, diary_folder_idx);
		if(result == 1 ) {
			System.out.println("글쓰기 성공!");
		}else {
			System.out.println("글쓰기 실패!");
		}
		return "redirect:/diary_folder_view?diary_folder_idx=1";
	}
	
	@RequestMapping("/diary_delete")
	public String diary_delete(@RequestParam("diary_idx") int diary_idx ) {
		int result = diaryDao.diary_delete(diary_idx);
		if(result == 1 ) {
			System.out.println("글삭제 성공");
			return "redirect:/diary_folder_view?diary_folder_idx=1";
		}else {
			System.out.println("글삭제 실패");
			return "redirect:/diary_folder_view?diary_folder_idx=1";
		}
	}
	
	@RequestMapping("/diary_modify")
	public String diary_modify(@RequestParam("diary_idx") String diary_idx, Model model) {
		diaryDto dto = diaryDao.viewDto(diary_idx);
		model.addAttribute("dto", dto);
		model.addAttribute("mainPage", "diary/diary_modify.jsp");
		return "index";
	}
	
	@RequestMapping("/diary_modifyAction")
	public String diary_modifyAction(@RequestParam("diary_title") String diary_title, 
									 @RequestParam("diary_contents") String diary_contents,
							         @RequestParam("diary_idx") int diary_idx,
							         diaryDto dto, Model model) {
		
		dto.setDiary_title(diary_title);
		dto.setDiary_contents(diary_contents);
		dto.setDiary_idx(diary_idx);
		
		int result = diaryDao.diary_modifyAction(dto);
		if( result != 1) {
			System.out.println("수정 실패!");
			model.addAttribute("mainPage", "diary/diary_modify.jsp");
			return "redirect:/diary_folder_view?diary_folder_idx=1";
		}
			System.out.println("수정 성공!");
			model.addAttribute("mainPage", "diary/diary.jsp");
			return "redirect:/diary_folder_view?diary_folder_idx=1";

	}
	
	@RequestMapping("/diary_folder_view")
	public String diary_folder_view(@RequestParam("diary_folder_idx") String diary_folder_idx, HttpServletRequest request,Model model) {
		
		HttpSession session = request.getSession();
		String user_id = (String)session.getAttribute("user_id");
		
		List<diaryDto> folder_list = diaryDao.folder_list(user_id,diary_folder_idx);
		model.addAttribute("folder_list", folder_list);
		model.addAttribute("mainPage", "diary/diary.jsp");
		return "index";
		
		
	}
//	-방명록-------------------------------------------------------------
	
	@Autowired
	private IvisitorDao visitorDao;
	
	@RequestMapping("/visitor")
	public String visitor(HttpServletRequest request,Model model) {
		
		List<visitorDto> list = visitorDao.list();			
		
		model.addAttribute("list", list);
		model.addAttribute("mainPage", "visitor/visitor.jsp");
		return "index";
	}
	
	@RequestMapping("/visitorWriteAction")
	public String visitorWriteAction(@RequestParam("visitor_contents") String visitor_contents,HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		String user_id = (String)session.getAttribute("user_id");
		
		int result = visitorDao.visitor_write(visitor_contents, user_id);
		if(result == 1 ) {
			System.out.println("글쓰기 성공!");
		}else {
			System.out.println("글쓰기 실패!");
		}
		return "redirect:visitor";
	}
	
	@RequestMapping("/visitor_delete")
	public String visitor_delete(@RequestParam("visitor_idx") int visitor_idx ) {
		int result = visitorDao.visitor_delete(visitor_idx);
		if(result == 1 ) {
			System.out.println("글삭제 성공");
			return "redirect:/visitor";
		}else {
			System.out.println("글삭제 실패");
			return "redirect:/visitor";
		}
	}
	@RequestMapping("/visitor_modify")
	public String visitor_modify(@RequestParam("visitor_idx") String visitor_idx, Model model) {
		
		visitorDto dto = visitorDao.viewDto(visitor_idx);
		
		model.addAttribute("dto", dto);
		model.addAttribute("mainPage", "visitor/visitor_modify.jsp");
		return "index";
	}
	
	@RequestMapping("/visitor_modifyAction")
	public String visitor_modifyAction(@RequestParam("visitor_contents") String visitor_contents,
							         @RequestParam("visitor_idx") int visitor_idx,
							         visitorDto dto, Model model) {
		
		dto.setVisitor_contents(visitor_contents);
		dto.setVisitor_idx(visitor_idx);
		
		int result = visitorDao.visitor_modifyAction(dto);
		if( result != 1) {
			System.out.println("수정 실패!");
			model.addAttribute("mainPage", "visitor/visitor_modify.jsp");
			return "redirect:/visitor";
		}
			System.out.println("수정 성공!");
			model.addAttribute("mainPage", "visitor/visitor.jsp");
			return "redirect:/visitor";

	}
	
//	-사진첩-------------------------------------------------------------
	
	@Autowired
	IgalleryDao galleryDao;
	@Autowired File file;
	
	@RequestMapping("/gallery")
	public String gallery(HttpServletRequest request,Model model) {
		
		List<galleryDto> list = galleryDao.list();
		model.addAttribute("list", list);
		model.addAttribute("mainPage", "gallery/gallery.jsp");
		return "index";
	}
	
	@RequestMapping("/galleryupload")
	public String galleryupload(HttpServletRequest request,Model model) {

		model.addAttribute("mainPage", "gallery/galleryupload.jsp");
		return "index";
	}
	
	@RequestMapping("/gallery_insert")
	public String gallery_insert(
			HttpServletRequest request,
			@RequestParam("chooseFile") MultipartFile multi,
			@RequestParam("title") String title,
			@RequestParam("contents") String contents
			
			) throws IOException{
		galleryDto gallery = new galleryDto();
		gallery.setGallery_title(title);
		gallery.setGallery_img(file.FileUpload(multi));
		gallery.setGallery_contents(contents);
		int result = galleryDao.image_insert(gallery);
		if(result == 1 ) {
			System.out.println("글올리기 성공!");
		}else
			System.out.println("글올리기 실패!");
		
		
		return "gallery/gallery";
	}
	
	@RequestMapping("/gallery_delete")
	public String gallery_delete(@RequestParam("gallery_idx") int gallery_idx ) {
		int result = galleryDao.gallery_delete(gallery_idx);
		if(result == 1 ) {
			System.out.println("글삭제 성공");
			return "redirect:/gallery";
		}else {
			System.out.println("글삭제 실패");
			return "redirect:/gallery";
		}
	}
	
//	-약속목록-------------------------------------------------------------
	
	
}


