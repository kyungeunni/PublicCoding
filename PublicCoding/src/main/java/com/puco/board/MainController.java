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
	
	@RequestMapping("play.do")
	public String showVideo(HttpServletRequest req){

		return "lectures/play.jsp";//jsp파일이름
	}
	
	@RequestMapping("videolist.do")
	public String getMainVideoList(HttpServletRequest req){

		return "lectures/videolist.jsp";//jsp파일이름
	}
	
}
