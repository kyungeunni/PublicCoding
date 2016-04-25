package com.puco.board;

import javax.servlet.http.HttpServletRequest;

import org.ocpsoft.prettytime.PrettyTime;
import com.puco.controller.Controller;
import com.puco.controller.RequestMapping;
import com.puco.board.dao.*;

import java.text.SimpleDateFormat;
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
	
	// Freeboard(정선)
	@RequestMapping("freeboard.do")
	public String freeboard_list(HttpServletRequest req)
	{
		
		String page=req.getParameter("page1");
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
		System.out.println(start);
		System.out.println(end);
		List<FreeBoardVO> list = FreeBoardDAO.FreeboardAllData(map);
		for(FreeBoardVO v:list){
			reltmap.put(v.getBno(), p.format(v.getBdate()));
		}

		int totalpage=FreeBoardDAO.freeboardTotalpage();
		req.setAttribute("curpage",curpage);
		req.setAttribute("list", list);
		req.setAttribute("totalpage", totalpage);
		req.setAttribute("rtime", reltmap);
		req.setAttribute("jsp", "../board/BoardMain.jsp");
		return "common/container.jsp";
	}
	@RequestMapping("freeboard_content.do")
	public String freeboard_content(HttpServletRequest req)
	{
		String no=req.getParameter("no");
		String page=req.getParameter("page");
		FreeBoardVO vo=FreeBoardDAO.freeboardContentData(Integer.parseInt(no));
		req.setAttribute("page", page);
		req.setAttribute("vo", vo);
		req.setAttribute("jsp", "board/freeboard_content.jsp");
		return "common/container.jsp";
	}
	@RequestMapping("freeboard_insert.do")
	public String freeboard_insert(HttpServletRequest req)
	{
		req.setAttribute("jsp", "board/freeboard_insert.jsp");
		return "common/container.jsp";
	}
	@RequestMapping("freeboard_insert_ok.do")
	public String freeboard_insert_ok(HttpServletRequest req) throws Exception
	{
		req.setCharacterEncoding("EUC-KR");
		String userid=req.getParameter("userid");
		String bsubject=req.getParameter("bsubject");
		String bcontent=req.getParameter("bcontent");
		String mpwd=req.getParameter("mpwd");
		FreeBoardVO vo=new FreeBoardVO();
		vo.setUserid(userid);
		vo.setBsubject(bsubject);
		vo.setBcontent(bcontent);
		vo.setMpwd(mpwd);
		FreeBoardDAO.freeboardInsert(vo);
		return "user/board/board_insert_ok.jsp";
	}
	
	
}
