package com.puco.board;

import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.StringTokenizer;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.ocpsoft.prettytime.PrettyTime;
import com.puco.board.dao.BoardDAO;
import com.puco.board.dao.BoardDTO;
import com.puco.board.dao.QBoardDAO;
import com.puco.board.dao.QnaBoardVO;
import com.puco.controller.Controller;
import com.puco.controller.RequestMapping;
import com.puco.member.dao.MemberDAO;
import com.puco.member.dao.MemberDTO;
import com.puco.category.dao.DcategoryDAO;
import com.puco.category.dao.DcategoryDTO;
import com.puco.category.dao.ScategoryDAO;
import com.puco.category.dao.ScategoryDTO;


@Controller("mc")
public class MainController {

	@RequestMapping("main.do")
		
		public String Main(HttpServletRequest req) {
		Map map=new HashMap();
		map.put("start", 1);
		map.put("end", 5);
		System.out.println("5밑");
		List<QnaBoardVO> list = QBoardDAO.MainAllData(map);
		req.setAttribute("qlist", list);
		// Dcategory 메뉴
		/*List<DcategoryDTO> dlist=DcategoryDAO.DcategoryAllData();
		req.setAttribute("dlist", dlist);*/
		// Dcategory 메뉴 끝
		req.setAttribute("jsp", "default.jsp");
		
		return "common/main.jsp";// jsp파일이름
		
	}
	
	// 대분류 선택시, 소분류 출력 기능부
	@RequestMapping("scategory.do")
	public String ScategoryAllData(HttpServletRequest req){
		System.out.println("MainController Scategory Work");
		String dno=req.getParameter("dno");
		System.out.println("getParameter from main.do " + dno);
		int no = Integer.parseInt(dno);
		
		if(dno==null)
			dno="1";
		
		// Dcategory 메뉴
		List<DcategoryDTO> dlist=DcategoryDAO.DcategoryAllData();
		req.setAttribute("dlist", dlist);
		// Dcategory 메뉴 끝
		
		// Scategory 메뉴
		List<ScategoryDTO> slist=ScategoryDAO.ScategoryAllData(no);
		req.setAttribute("slist", slist);
		// Scategory 메뉴 끝
		System.out.println("MainController slist " + slist);
		System.out.println("MainController dlist " + dlist);	
		req.setAttribute("jsp", "../lectures/lectureMain.jsp");
		return "common/main.jsp";
	}
	// 대분류 선택시, 소분류 출력 기능부 끝
	
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
		return "common/main.jsp";
	}
}
