package com.puco.board;

import javax.servlet.http.HttpServletRequest;

import org.ocpsoft.prettytime.PrettyTime;
import com.puco.controller.Controller;
import com.puco.controller.RequestMapping;
import com.puco.board.dao.*;
import java.util.*;

@Controller("bc")
public class BoardController {

/*	@RequestMapping("boardmain.do")
	public String boardListData(HttpServletRequest req){
		req.setAttribute("msg", "게시판");
		BoardDAO dao = new BoardDAO();
		List<BoardDTO> dto = dao.boardListData(0);
		req.setAttribute("list", dto);
		return "board/BoardMain.jsp";//jsp파일이름
	}
	@RequestMapping("content.do")
	public String boardContentData(HttpServletRequest req){
		String no=req.getParameter("no");
		int ino = Integer.parseInt(no);
		BoardDAO dao = new BoardDAO();
		BoardDTO dto = dao.boardContentData(ino);
		req.setAttribute("d", dto);
		
		return "board/content.jsp";//jsp파일이름
	}*/
	
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

			reltmap.put(v.getNo(), p.format(v.getRegdate()));
		}
		System.out.println(reltmap.get(7));
		System.out.println(p.format(list.get(1).getRegdate()));
		int totalpage=QBoardDAO.BoardTotalPage();
		req.setAttribute("curpage",curpage);
		req.setAttribute("list", list);
		req.setAttribute("totalpage", totalpage);
		req.setAttribute("rtime", reltmap);
		req.setAttribute("jsp", "../board/BoardMain.jsp");
		return "common/container.jsp";
	}
	
	@RequestMapping("content.do")
	public String boardContentData(HttpServletRequest req){
		String no=req.getParameter("no");
		int ino = Integer.parseInt(no);
		/*BoardDAO dao = new BoardDAO();
		BoardDTO dto = dao.boardContentData(ino);*/
		QnaBoardVO vo= QBoardDAO.getContentData(ino);
		req.setAttribute("d", vo);
		
		req.setAttribute("jsp", "../board/content.jsp");
		return "common/container.jsp";
	
	}
	
	@RequestMapping("question.do")
	public static String askQuestion(HttpServletRequest req){
		req.setAttribute("jsp", "../board/insert.jsp");
		return "common/container.jsp";
	}
	
}
