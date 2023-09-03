package com.aglory.todo;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/todo")
@Controller
public class TodoController {

	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	
	@GetMapping("/list")
	public String TodoList(Model model) {
		List<Todo> list = this.sqlSessionTemplate.selectList("todo.select_list");
	    model.addAttribute("todoList", list);

	    return "todo/list";
	}
	
//	@RequestMapping(value="/list", method=RequestMethod.POST)
//	public void updateAuth(@RequestParam Map<String, Object> auth) {
//		
//		this.memberService.updateAuth(auth);
//	}
	
	
}
