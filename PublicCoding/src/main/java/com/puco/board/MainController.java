package com.puco.board;

import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.ocpsoft.prettytime.PrettyTime;

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
		System.out.println("어노테이션");
		Map map=new HashMap();
		map.put("start", 1);
		map.put("end", 5);
		System.out.println(1);
		List<QnaBoardVO> list = QBoardDAO.MainAllData(map);
		req.setAttribute("qlist", list);
		System.out.println("되니?");
		return "common/main.jsp";// jsp파일이름
	}
	@RequestMapping("boardmain.do")
	public String boardListData(HttpServletRequest req){
		String page=req.getParameter("page");
		PrettyTime p = new PrettyTime(new Locale("KO"));
		Map reltmap = new HashMap();
		if(page==null)
			page="1";
		int curpage=Integer.parseInt(page);
		int rowSize=10;
		int start=(curpage*rowSize) - (rowSize-1);
		int end = curpage*rowSize;
		Map map=new HashMap();
		map.put("start", start);
		map.put("end", end);
		List<QnaBoardVO> list = QBoardDAO.boardAllData(map);
		for(QnaBoardVO v:list){

			reltmap.put(v.getBno(), p.format(v.getBdate()));
		}

		int totalpage=QBoardDAO.BoardTotalPage();
		req.setAttribute("curpage",curpage);
		req.setAttribute("list", list);
		req.setAttribute("totalpage", totalpage);
		req.setAttribute("rtime", reltmap);
		req.setAttribute("jsp", "../board/BoardMain.jsp");
		return "common/container.jsp";
	}

}
