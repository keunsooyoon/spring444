package com.aglory.calendar;

import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;



@RequestMapping("/calendar")
@Controller
public class CalendarController {
	
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;

	@RequestMapping("/view")
	public String calendarView() {
		return "calendar/view";
	}
	
	
	@RequestMapping(value = "/viewx", method = RequestMethod.POST)
	public @ResponseBody List<Cal> calendarViewX() {

		return sqlSessionTemplate.selectList("calendar.select_list");
	}
	
	


	@RequestMapping("/addcal")
	public String requestAddCalForm(@ModelAttribute("NewCal") Cal cal) {

		return "calendar/addcal";
	}

	@PostMapping("/addcal")
	public String submitAddCalForm(@ModelAttribute("NewCal") Cal cal) {

		System.out.println(cal.getTitle());
		System.out.println(cal.getStart());
		
		sqlSessionTemplate.insert("calendar.insert", cal);
		return "redirect:/calendar/view";
	}

	 
	
	
	
	@GetMapping("/list")
	public String CalList(Model model) {
	    List<Cal> list = sqlSessionTemplate.selectList("calendar.select_list");
	    model.addAttribute("calList", list);

	    return "calendar/list";
	}
	
//	@RequestMapping(value="/list", method=RequestMethod.POST)
//	public void CalList(@RequestParam Map<String, Object> auth) {
//		
//		this.memberService.updateAuth(auth);
//	}
//	
	
	
	
	//달력기본화면
	@RequestMapping(value = "/view")
	public String lnb04List(RedirectAttributes redirectAttributes, HttpServletRequest request, @ModelAttribute("searchVO") Cal cal, ModelMap model) throws Exception {
	 
	    
	    int isAdm = 0;
	 

	      model.addAttribute("isAdm", isAdm);
	 
	    return "calendar/view";
	}
	 
	 
	//달력데이터조회
	@RequestMapping(value = "/adms/calendar/management/read_ajx.do" ,method = RequestMethod.POST)
	@ResponseBody
	public String getCalData(
	        @ModelAttribute("cal") Cal cal,
	        HttpServletRequest request,
	        HttpServletResponse res,
	        ModelMap model) throws Exception {
	    
	    JSONObject obj = new JSONObject();
	    
	    res.setContentType("text/html; charset=UTF-8");
	    PrintWriter out = res.getWriter();
	    
	    searchVO.setSite_code(loginService.getSiteCode());
	    List<tbl_calendarVO> list = calendarService.getCalData(searchVO);
	 
	    obj.put("success", "ok");
	    obj.put("list",net.sf.json.JSONArray.fromObject(list));
	    out.print(obj);
	    return null;
	}
	 
	
	
	
}
