package com.puco.board;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionContext;

import org.ocpsoft.prettytime.PrettyTime;
import com.puco.controller.Controller;
import com.puco.controller.RequestMapping;
import com.puco.member.dao.MemberDAO;
import com.puco.member.dao.ScoreVO;
import com.puco.search.dao.Item;
import com.puco.search.dao.NewsDAO;
import com.sun.xml.internal.ws.resources.HttpserverMessages;
import com.puco.board.dao.*;
import com.puco.category.dao.DcategoryDAO;
import com.puco.category.dao.DcategoryDTO;

import java.util.*;

@Controller("bc")
public class BoardController {

	@RequestMapping("qnaboard.do")
	public String boardListData(HttpServletRequest req) throws Exception{
		req.setCharacterEncoding("EUC-KR");
		String page = req.getParameter("page");
		String order = req.getParameter("order");
		PrettyTime p = new PrettyTime(new Locale("KO"));
		Map reltmap = new HashMap();

		if (page == null)
			page = "1";
		if (order == null)
			order = "2";
		int curpage = Integer.parseInt(page);
		int rowSize = 10;
		int start = (curpage * rowSize) - (rowSize - 1);
		int end = curpage * rowSize;
		Map map = new HashMap();
		map.put("start", start);
		map.put("end", end);

		List<QnaBoardVO> list = QBoardDAO.boardAllData(map, Integer.parseInt(order));
		for (QnaBoardVO v : list) {

			reltmap.put(v.getBno(), p.format(v.getBdate()));
		}

		List<DcategoryDTO> dlist = DcategoryDAO.DcategoryAllData();

		int totalpage = QBoardDAO.BoardTotalPage();
		req.setAttribute("order", order);
		req.setAttribute("dlist", dlist);
		req.setAttribute("curpage", curpage);
		req.setAttribute("list", list);
		req.setAttribute("totalpage", totalpage);
		req.setAttribute("rtime", reltmap);
		req.setAttribute("jsp", "../board/BoardMain.jsp");
		/////////////////////////NewsList추가//////////////////////////////
		
		String title=req.getParameter("title");
		if(title==null){
			title="구글";
		}
		List<Item> newslist=NewsDAO.newsAllData(title);
		req.setAttribute("newslist", newslist);
		req.setAttribute("search", title);
		return "common/main.jsp";
	}

	@RequestMapping("content.do")
	public String boardContentData(HttpServletRequest req) {
		String no = req.getParameter("no");
		String page = req.getParameter("page");
		int ino = Integer.parseInt(no);
		System.out.println("content>>-1");
		QnaBoardVO vo = QBoardDAO.getContentData(ino);
		System.out.println("content>>0");
		String wimg = QBoardDAO.getimageUrl(vo.getMno());
		System.out.println("content>>1");
		System.out.println(vo.getAnswer());
		System.out.println("content>>2");
		List<AnswerVO> alist = QBoardDAO.getAnswerData(ino);
		System.out.println("content>>3");
		req.setAttribute("wimg", wimg);
		System.out.println("content>wimg:" + wimg);
		PrettyTime p = new PrettyTime(new Locale("KO"));
		req.setAttribute("time", p.format(vo.getBdate()));

		req.setAttribute("alist", alist);
		req.setAttribute("d", vo);
		req.setAttribute("page", page);
		req.setAttribute("no", no);

		req.setAttribute("jsp", "../board/content.jsp");
		return "common/main.jsp";

	}

	@RequestMapping("question.do")
	public static String askQuestion(HttpServletRequest req) {
		req.setAttribute("jsp", "../board/insert.jsp");
		return "common/main.jsp";
	}

	@RequestMapping("question_ok.do")
	public static String question_ok(HttpServletRequest req) throws Exception {
		req.setCharacterEncoding("EUC-KR");
		HttpSession hs = req.getSession();
		String no = (String) hs.getAttribute("mno");
		int mno = Integer.parseInt(no);
		String subject = req.getParameter("title");
		String content = req.getParameter("ir1");
		String taglist = req.getParameter("taglist");
		StringTokenizer st = new StringTokenizer(taglist, ",");
		String[] arrlist = new String[3];
		for (int i = 0; i < 3; i++) {
			if (st.hasMoreTokens()) {
				arrlist[i] = st.nextToken();
			} else
				arrlist[i] = "1";
		}
		QnaBoardVO vo = new QnaBoardVO();
		vo.setMno(mno);
		vo.setBsubject(subject);
		vo.setBcontent(content);
		vo.setTgno1(Integer.parseInt(arrlist[0]));
		vo.setTgno2(Integer.parseInt(arrlist[1]));
		vo.setTgno3(Integer.parseInt(arrlist[2]));
		System.out.println("boardinsert>>1");
		QBoardDAO.boardInsert(vo);
		System.out.println("boardinsert>>2");
		ScoreVO d= new ScoreVO();
		d.setMno(mno);
		d.setScore(1);
		d.setMessage("질문 (" + vo.getBsubject().substring(0, 10) + ")");
		
		MemberDAO.recordScore(d);

		return "board/insert_ok.jsp";

	}

	@RequestMapping("answer.do")
	public static String answer(HttpServletRequest req) throws Exception {
		req.setCharacterEncoding("EUC-KR");
		HttpSession hs = req.getSession();
		String no = (String) hs.getAttribute("mno");
		int mno = Integer.parseInt(no);
		String content = req.getParameter("ir1");
		String bnum = req.getParameter("no");
		int bno = Integer.parseInt(bnum);
		String page = req.getParameter("page");
		AnswerVO vo = new AnswerVO();
		vo.setBno(bno);
		vo.setMno(mno);
		vo.setRcontent(content);
		QBoardDAO.insertAnswer(vo);
		String bsubject = QBoardDAO.getbSubject(bno);
		if (bsubject.length() > 10)
			bsubject = bsubject.substring(0, 9) + "...";
		ScoreVO d= new ScoreVO();
		d.setMno(mno);
		d.setScore(3);
		d.setMessage("(+3) 답변작성 (" + bsubject + ")");
		MemberDAO.recordScore(d);
		req.setAttribute("no", bno);
		req.setAttribute("page", page);

		return "board/vote_ok.jsp";
	}

	@RequestMapping("bvoteup.do")
	public static String bvoteup(HttpServletRequest req) {
		String bno = req.getParameter("bno");
		System.out.println("bno>>>" + bno);
		String page = req.getParameter("page");
		String type = req.getParameter("type");
		System.out.println(type);
		int ino = Integer.parseInt(bno);
		// 질문업
		System.out.println("뭐지");
		if (type.equals("1")) {
			System.out.println("실행");
			QBoardDAO.incrBVote(ino);
			int mno = QBoardDAO.getBmno(Integer.parseInt(bno));
			String bsubject = QBoardDAO.getbSubject(Integer.parseInt(bno));
			if (bsubject.length() > 10)
				bsubject = bsubject.substring(0, 9) + "...";
			ScoreVO d= new ScoreVO();
			d.setMno(mno);
			d.setScore(3);
			d.setMessage("(+3) 공감가는 질문!!( " + bsubject + ")");
			MemberDAO.recordScore(d);
		} else {
			System.out.println("설마");
			String rno = req.getParameter("rno");
			QBoardDAO.incrAvote(bno, rno);
			int mno = QBoardDAO.getAmno(Integer.parseInt(rno));
			String bsubject = QBoardDAO.getbSubject(Integer.parseInt(bno));
			if (bsubject.length() > 10)
				bsubject = bsubject.substring(0, 9) + "...";
			ScoreVO d= new ScoreVO();
			d.setMno(mno);
			d.setScore(3);
			d.setMessage("(+3) 도움되는 답변!( " + bsubject + ")");
			MemberDAO.recordScore(d);
		}
		req.setAttribute("no", bno);
		req.setAttribute("page", page);
		return "board/vote_ok.jsp";
	}

	@RequestMapping("bvotedown.do")
	public static String bvotedown(HttpServletRequest req) {
		String bno = req.getParameter("bno");
		System.out.println("bno>>>" + bno);
		String page = req.getParameter("page");
		String type = req.getParameter("type");
		System.out.println(type);
		int ino = Integer.parseInt(bno);
		// 질문업
		if (type.equals("1")) {
			QBoardDAO.decrBVote(ino);
			int mno = QBoardDAO.getBmno(Integer.parseInt(bno));
			String bsubject = QBoardDAO.getbSubject(Integer.parseInt(bno));
			if (bsubject.length() > 10)
				bsubject = bsubject.substring(0, 9) + "...";
			ScoreVO d= new ScoreVO();
			d.setMno(mno);
			d.setScore(-1);
			d.setMessage("(-1) 부적합한 질문:( ( " + bsubject + ")");
			MemberDAO.recordScore(d);
		} else {
			String rno = req.getParameter("rno");
			QBoardDAO.decrAvote(bno, rno);
			int mno = QBoardDAO.getAmno(Integer.parseInt(rno));
			String bsubject = QBoardDAO.getbSubject(Integer.parseInt(bno));
			if (bsubject.length() > 10)
				bsubject = bsubject.substring(0, 9) + "...";
			ScoreVO d= new ScoreVO();
			d.setMno(mno);
			d.setScore(-1);
			d.setMessage("(-1) 부적합한 답변 :( ( " + bsubject + ")");
			MemberDAO.recordScore(d);
		}
		req.setAttribute("no", bno);
		req.setAttribute("page", page);
		return "board/vote_ok.jsp";
	}

	////////////////////// Freeboard(정선) ///////////////////////////////////
	@RequestMapping("free.do")
	public String freeboard_list(HttpServletRequest req) {

		String page = req.getParameter("page");
		System.out.println("page:" + page);
		PrettyTime p = new PrettyTime(new Locale("KO"));
		Map reltmap = new HashMap();
		System.out.println("time:" + reltmap);
		if (page == null)
			page = "1";
		System.out.println("if page:" + page);
		int curpage = Integer.parseInt(page);
		System.out.println("curpage:" + curpage);
		int rowSize = 10;
		int start = (curpage * rowSize) - (rowSize - 1);
		int end = curpage * rowSize;
		Map map = new HashMap();

		map.put("start", start);
		map.put("end", end);
		System.out.println(start);
		System.out.println(end);
		List<FreeBoardVO> list = FreeBoardDAO.FreeboardAllData(map);
		for (FreeBoardVO v : list) {
			reltmap.put(v.getBno(), p.format(v.getBdate()));
		}

		int totalpage = FreeBoardDAO.freeboardTotalpage();
		System.out.println("totalpage:" + totalpage);
		req.setAttribute("curpage", curpage);
		req.setAttribute("list", list);
		req.setAttribute("totalpage", totalpage);
		req.setAttribute("rtime", reltmap);
		req.setAttribute("jsp", "../board/free.jsp");
		return "common/main.jsp";
	}

	@RequestMapping("freeboard_content.do")
	public String freeboard_content(HttpServletRequest req) {
		String no = req.getParameter("no");
		System.out.println("no1");
		String page = req.getParameter("page");
		System.out.println("page1");
		FreeBoardVO vo = FreeBoardDAO.freeboardContentData(Integer.parseInt(no));
		System.out.println("mno값" + vo.getMno());
		System.out.println("dao.freeboard");
		req.setAttribute("page", page);
		System.out.println("setpage");
		req.setAttribute("vo", vo);
		System.out.println("setvo");
		req.setAttribute("jsp", "../board/free_content.jsp");
		System.out.println("setjsp");
		return "common/main.jsp";
	}

	@RequestMapping("freeboard_insert.do")
	public String freeboard_insert(HttpServletRequest req) {
		req.setAttribute("jsp", "../board/freeboard_insert.jsp");
		return "common/main.jsp";
	}

	@RequestMapping("freeboard_insert_ok.do")
	public String freeboard_insert_ok(HttpServletRequest req) throws Exception {
		req.setCharacterEncoding("EUC-KR");
		HttpSession hs = req.getSession();
		String no = (String) hs.getAttribute("mno");
		int mno = Integer.parseInt(no);
		String bsubject = req.getParameter("bsubject");
		String bcontent = req.getParameter("ir1");
		FreeBoardVO vo = new FreeBoardVO();
		vo.setMno(mno);
		vo.setBsubject(bsubject);
		vo.setBcontent(bcontent);
		FreeBoardDAO.freeboardInsert(vo);
		return "board/freeboard_insert_ok.jsp";
	}

	@RequestMapping("freeboard_update.do")
	public String board_update(HttpServletRequest req) {
		String bno = req.getParameter("bno");
		String page = req.getParameter("page");
		FreeBoardVO vo = FreeBoardDAO.freeboardUpdate(Integer.parseInt(bno));
		req.setAttribute("page", page);
		req.setAttribute("vo", vo);
		req.setAttribute("jsp", "../board/freeboard_update.jsp");
		return "common/main.jsp";
	}

	@RequestMapping("freeboard_update_ok.do")
	public String board_update_ok(HttpServletRequest req) throws Exception {

		req.setCharacterEncoding("EUC-KR");
		HttpSession hs = req.getSession();
		String no = (String) hs.getAttribute("mno");
		int mno = Integer.parseInt(no);

		String bno = req.getParameter("bno");
		String page = req.getParameter("page");
		String bsubject = req.getParameter("bsubject");
		String bcontent = req.getParameter("ir1");
		FreeBoardVO vo = new FreeBoardVO();
		vo.setMno(mno);
		vo.setBno(Integer.parseInt(bno));
		vo.setBsubject(bsubject);
		vo.setBcontent(bcontent);

		FreeBoardDAO.freeboardUpdateOk(vo);

		return "board/freeboard_update_ok.jsp";
		/*
		 * req.setCharacterEncoding("EUC-KR");
		 * 
		 * String bno=req.getParameter("bno"); String
		 * page=req.getParameter("page"); String mpwd=req.getParameter("mpwd");
		 * FreeBoardVO vo=new FreeBoardVO(); vo.setBno(Integer.parseInt(bno));
		 * vo.setUserid(userid); vo.setBsubject(bsubject);
		 * vo.setBcontent(bcontent); vo.setMpwd(mpwd);
		 * 
		 * //DB연동 boolean bCheck=FreeBoardDAO.boardUpdateOk(vo);
		 * req.setAttribute("bCheck", bCheck); req.setAttribute("bno", bno);
		 * req.setAttribute("page", page); return
		 * "user/board/freeboard_update_ok.jsp";
		 */
	}

	@RequestMapping("FBreply_insert.do")
	public String FBreply_insert(HttpServletRequest req) throws Exception {
		req.setCharacterEncoding("EUC-KR");
		String page = req.getParameter("page");
		String Rno = req.getParameter("Rno");
		String Rcontent = req.getParameter("Rcontent");
		String Mno = req.getParameter("Mno");

		HttpSession session = req.getSession();
		String userid = (String) session.getAttribute("userid");
		String mno = (String) session.getAttribute("mno");
		// String name=(String)session.getAttribute("name");

		AnswerVO vo = new AnswerVO();
		vo.setRno(Integer.parseInt(Rno));
		vo.setMno(Integer.parseInt(Mno));
		vo.setUserid(userid);
		vo.setRcontent(Rcontent);

		FreeBoardDAO.FBreplyInsert(vo);

		req.setAttribute("no", Rno);
		req.setAttribute("page", page);
		return "board/FBreply_ok.jsp";
	}

	@RequestMapping("FBreply_re_insert.do")
	public String FBreply_re_insert(HttpServletRequest req) throws Exception {
		req.setCharacterEncoding("EUC-KR");
		String bno = req.getParameter("bno");
		String page = req.getParameter("page");
		String Rno = req.getParameter("Rno");
		String Rcontent = req.getParameter("Rcontent");

		AnswerVO rvo = FreeBoardDAO.FBreplyParentData(Integer.parseInt(bno));

		return "board/FBreply_ok.jsp";
	}

}
