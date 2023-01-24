package com.example.demo;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.demo.dao.IpromlistDao;
import com.example.demo.dto.promlistDto;

@Controller
public class promlistController {
	
	@Autowired
	private IpromlistDao promlistDao;
	
	@RequestMapping("/promlist")
	public String promlist(HttpServletRequest request,Model model) {
		

		HttpSession session = request.getSession();
		String user_id = (String)session.getAttribute("user_id");

		List<promlistDto> promlist_list = promlistDao.promlist_list(user_id);	
		model.addAttribute("promlist_list", promlist_list);
		model.addAttribute("mainPage", "promlist/promlist.jsp");
		return "index";
	}
	
	@RequestMapping("/promlist_write")
	public String promlist_write(HttpServletRequest request,Model model) {
		
		model.addAttribute("mainPage", "promlist/promlist_write.jsp");
		return "index";
	}
	
	@RequestMapping("/promlistWriteAction")
	public String promlistWriteAction(@RequestParam("promlist_title") String promlist_title,
									  @RequestParam("promlist_date") @DateTimeFormat(pattern="yyyy-MM-dd")Date promlist_date,
									  @RequestParam("promlist_friends") String promlist_friends,
									  @RequestParam("promlist_contents") String promlist_contents,HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		String promlist_user_id = (String)session.getAttribute("user_id");
		
		int result = promlistDao.promlist_write(promlist_title,promlist_date,promlist_friends,promlist_contents,promlist_user_id);
		if(result == 1 ) {
			System.out.println("글쓰기 성공!");
		}else {
			System.out.println("글쓰기 실패!");
		}
		return "redirect:promlist";
	}
	@RequestMapping("/promlistView")
	public String promlistView(@RequestParam("promlist_idx") String promlist_idx, Model model) {
		promlistDto dto = promlistDao.viewDto(promlist_idx);
		
		model.addAttribute("dto", dto);
		model.addAttribute("mainPage", "promlist/promlistView.jsp");
		return "index";
	}
	@RequestMapping("/promlist_modifyAction")
	public String promlist_modifyAction(@RequestParam("promlist_title") String promlist_title,
			  							@RequestParam("promlist_date") @DateTimeFormat(pattern="yyyy-MM-dd") Date promlist_date,
			  							@RequestParam("promlist_friends") String promlist_friends,
			  							@RequestParam("promlist_contents") String promlist_contents,
			  							@RequestParam("promlist_idx") int promlist_idx,
			  							promlistDto dto, Model model) {
		
		dto.setPromlist_title(promlist_title);
		dto.setPromlist_date(promlist_date);
		dto.setPromlist_friends(promlist_friends);
		dto.setPromlist_contents(promlist_contents);
		dto.setPromlist_idx(promlist_idx);
		
		System.out.println(promlist_title);
		System.out.println(promlist_date);
		System.out.println(promlist_friends);
		System.out.println(promlist_contents);
		
		int result = promlistDao.promlist_modifyAction(dto);
		if( result != 1) {
			System.out.println("수정 실패!");
			model.addAttribute("mainPage", "promlist/promlistView.jsp");
			return "redirect:/promlist";
		}
			System.out.println("수정 성공!");
			model.addAttribute("mainPage", "promlist/promlist.jsp");
			return "redirect:/promlist";

	}
	
	@RequestMapping("/promlist_delete")
	public String promlist_delete(@RequestParam("promlist_idx") int promlist_idx ) {
		int result = promlistDao.promlist_delete(promlist_idx);
		if(result == 1 ) {
			System.out.println("글삭제 성공");
			return "redirect:/promlist";
		}else {
			System.out.println("글삭제 실패");
			return "redirect:/promlist";
		}
	}
}
