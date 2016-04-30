package com.puco.board;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionContext;

import org.ocpsoft.prettytime.PrettyTime;
import com.puco.controller.Controller;
import com.puco.controller.RequestMapping;
import com.sun.xml.internal.ws.resources.HttpserverMessages;
import com.puco.board.dao.*;
import com.puco.category.dao.DcategoryDAO;
import com.puco.category.dao.DcategoryDTO;

import java.util.*;

@Controller("bc")
public class BoardController {

	@RequestMapping("qnaboard.do")
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
		
		List<DcategoryDTO> dlist=DcategoryDAO.DcategoryAllData();
		

		int totalpage=QBoardDAO.BoardTotalPage();
		
		req.setAttribute("dlist", dlist);
		req.setAttribute("curpage",curpage);
		req.setAttribute("list", list);
		req.setAttribute("totalpage", totalpage);
		req.setAttribute("rtime", reltmap);
		req.setAttribute("jsp", "../board/BoardMain.jsp");
		return "common/main.jsp";
	}
	
	@RequestMapping("content.do")
	public String boardContentData(HttpServletRequest req){
		String no=req.getParameter("no");
		String page = req.getParameter("page");
		int ino = Integer.parseInt(no);
		System.out.println("content>>-1");
		QnaBoardVO vo= QBoardDAO.getContentData(ino);
		System.out.println("content>>0");
		String wimg=QBoardDAO.getimageUrl(vo.getMno());
		System.out.println("content>>1");
		System.out.println(vo.getAnswer());
		System.out.println("content>>2");
		List<AnswerVO> alist = QBoardDAO.getAnswerData(ino);
		System.out.println("content>>3");
		req.setAttribute("wimg",wimg);
		System.out.println("content>wimg:"+wimg);
		req.setAttribute("alist", alist);
		System.out.println(alist.get(1).getRcontent());
		System.out.println(alist.size());
		req.setAttribute("d", vo);
		req.setAttribute("page", page);
		req.setAttribute("no", no);

		req.setAttribute("jsp", "../board/content.jsp");
		return "common/main.jsp";
	
	}
	
	@RequestMapping("question.do")
	public static String askQuestion(HttpServletRequest req){
		req.setAttribute("jsp", "../board/insert.jsp");
		return "common/main.jsp";
	}
	
	@RequestMapping("question_ok.do")
	public static String question_ok(HttpServletRequest req) throws Exception{
		req.setCharacterEncoding("EUC-KR");
		HttpSession hs =req.getSession();
		String no = (String)hs.getAttribute("mno");
		int mno = Integer.parseInt(no);
		   String subject=req.getParameter("title");
		   String content=req.getParameter("ir1");
		   String taglist = req.getParameter("taglist");
		   StringTokenizer st=new StringTokenizer(taglist, ",");
		  String[] arrlist=new String[3];
		   for(int i=0;i<3;i++){
			   if(st.hasMoreTokens()){
			   arrlist[i]=st.nextToken();}
			   else arrlist[i]="1";
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
		return "board/insert_ok.jsp";
		
	}
	@RequestMapping("answer.do")
	public static String answer(HttpServletRequest req) throws Exception{
		req.setCharacterEncoding("EUC-KR");
		HttpSession hs =req.getSession();
		String no = (String)hs.getAttribute("mno");
		int mno = Integer.parseInt(no);
	   String content=req.getParameter("ir1");
	   String bnum = req.getParameter("no");
	   int bno = Integer.parseInt(bnum);
	   String page =req.getParameter("page"); 
	   AnswerVO vo = new AnswerVO();
	   vo.setBno(bno);
	   vo.setMno(mno);
	   vo.setRcontent(content);
	   QBoardDAO.insertAnswer(vo);
	   
	   req.setAttribute("no", bno);
	   req.setAttribute("page", page);
	   
	   return "board/vote_ok.jsp";
	}

	@RequestMapping("bvoteup.do")
	public static String bvoteup(HttpServletRequest req){
		String bno=req.getParameter("bno");
		System.out.println("bno>>>"+bno);
		String page=req.getParameter("page");
		String type=req.getParameter("type");
		System.out.println(type);
		int ino = Integer.parseInt(bno);
		//질문업
		System.out.println("뭐지");
		if(type.equals("1")){
			System.out.println("실행");
						QBoardDAO.incrBVote(ino);
		}else{
			System.out.println("설마");
			String rno=req.getParameter("rno");
			QBoardDAO.incrAvote(bno,  rno);
		}
		req.setAttribute("no", bno);
		req.setAttribute("page", page);
		return "board/vote_ok.jsp";
	}
	
	@RequestMapping("bvotedown.do")
	public static String bvotedown(HttpServletRequest req){
		String bno=req.getParameter("bno");
		System.out.println("bno>>>"+bno);
		String page=req.getParameter("page");
		String type=req.getParameter("type");
		System.out.println(type);
		int ino = Integer.parseInt(bno);
		//질문업
		if(type.equals("1")){
						QBoardDAO.decrBVote(ino);
		}else{
			String rno=req.getParameter("rno");
			QBoardDAO.decrAvote(bno,  rno);
		}
		req.setAttribute("no", bno);
		req.setAttribute("page", page);
		return "board/vote_ok.jsp";
	}

}
