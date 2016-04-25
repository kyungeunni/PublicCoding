package com.puco.board;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import com.puco.board.dao.BoardDAO;
import com.puco.board.dao.BoardDTO;
import com.puco.board.dao.QBoardDAO;
import com.puco.board.dao.QnaBoardVO;
import com.puco.controller.Controller;
import com.puco.controller.RequestMapping;

@Controller("mc")
public class MainController {

	@RequestMapping("main.do")
	
	public String Main(HttpServletRequest req) {
		Map map=new HashMap();
		map.put("start", 1);
		map.put("end", 5);
		
		List<QnaBoardVO> list = QBoardDAO.MainAllData(map);
		req.setAttribute("qlist", list);
		
		return "commons/main.jsp";// jsp파일이름

	}

}
