package com.puco.board;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.puco.board.dao.BoardDAO;
import com.puco.board.dao.BoardDTO;
import com.puco.controller.Controller;
import com.puco.controller.RequestMapping;

@Controller("mc")
public class MainController {
	
	@RequestMapping("main.do")
	public String Main(HttpServletRequest req){

		return "common/main.jsp";//jsp파일이름
	}
}
