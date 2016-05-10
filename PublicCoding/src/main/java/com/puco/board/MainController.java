package com.puco.board;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.StringTokenizer;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.ocpsoft.prettytime.PrettyTime;
import com.puco.board.dao.FreeBoardDAO;
import com.puco.board.dao.FreeBoardVO;
import com.puco.board.dao.QBoardDAO;
import com.puco.board.dao.QnaBoardVO;
import com.puco.controller.Controller;
import com.puco.controller.RequestMapping;
import com.puco.lectures.dao.CourseGroupDAO;
import com.puco.lectures.dao.CourseGroupDTO;
import com.puco.lectures.dao.CourseReplyDAO;
import com.puco.member.dao.MemberDAO;
import com.puco.member.dao.MemberDTO;
import com.puco.onoffmix.dao.OnoffmixDAO;
import com.puco.onoffmix.dao.StudyJoinVO;
import com.puco.category.dao.DcategoryDAO;
import com.puco.category.dao.DcategoryDTO;
import com.puco.category.dao.ScategoryDAO;
import com.puco.category.dao.ScategoryDTO;

@Controller("mc")
public class MainController {

	@RequestMapping("main.do")
	public String Main(HttpServletRequest req) {
		Map map = new HashMap();
		map.put("start", 1);
		map.put("end", 10);
		List<QnaBoardVO> list = QBoardDAO.MainAllData();
		List<FreeBoardVO> flist=FreeBoardDAO.MainFreeData();
		req.setAttribute("qlist", list);
		req.setAttribute("flist", flist);
		
		int no1 = 1;
		List<CourseGroupDTO> g1list=CourseGroupDAO.CourseGroupAllData(no1);
		req.setAttribute("g1list", g1list);
		
		int no2 = 2;
		List<CourseGroupDTO> g2list=CourseGroupDAO.CourseGroupAllData(no2);
		req.setAttribute("g2list", g2list);
		req.setAttribute("jsp", "default.jsp");

		
		List<StudyJoinVO> slist= OnoffmixDAO.studyjoinAllData();
    	Map imgmapmap = new HashMap();
    	Map mjoinedmap = new HashMap();
    	Map jnummap = new HashMap();
    	Map imgmap ;
    	for(StudyJoinVO vo:slist){
    		int gno=vo.getGroupno();
    		List<Integer> mjoined = OnoffmixDAO.getJoinedPeoplebyGN(gno);
    		imgmap = new HashMap();
    		for(Integer m:mjoined){
        		String temp= QBoardDAO.getimageUrl(m);
        		imgmap.put(m, temp);  
        	}
    		imgmapmap.put(gno, imgmap);
    		mjoinedmap.put(gno, mjoined);
    		jnummap.put(gno, mjoined.size());
    	}
    	req.setAttribute("imgmapmap", imgmapmap);
    	req.setAttribute("mjoinedmap", mjoinedmap);
    	req.setAttribute("jnummap", jnummap);
    	req.setAttribute("slist", slist);
		
		
		
		
		return "common/main.jsp";// jsp파일이름


	}

	// 대분류 선택시, 소분류 출력 기능부
	@RequestMapping("scategory.do")
	public String ScategoryAllData(HttpServletRequest req) {
		String dno = req.getParameter("dno");
		String sno = req.getParameter("sno");
		if (dno == null)
			dno = "1";
		int no = Integer.parseInt(dno);
		if (sno == null)
			sno = "1";
		int no1 = Integer.parseInt(sno);
		// Dcategory 메뉴
		List<DcategoryDTO> dlist = DcategoryDAO.DcategoryAllData();
		req.setAttribute("dlist", dlist);
		// Dcategory 메뉴 끝

		// Scategory 메뉴
		List<List<ScategoryDTO>> slist = new ArrayList<List<ScategoryDTO>>();
		for (int i = 0; i < dlist.size(); i++) {
			slist.add(ScategoryDAO.ScategoryAllData(dlist.get(i).getDno()));
		}
		req.setAttribute("slist", slist);
		// Scategory 메뉴 끝

		//////////////////////////////////////////////////////
		List<CourseGroupDTO> dto;
		if (no1 == 1) {
			dto = CourseGroupDAO.CourseGroupAllData(no1);
		} else {
			dto = CourseGroupDAO.CourseGroupAllData(no1);
		}
		
		Map avgMap = new HashMap();
		Map iavgMap = new HashMap();
		////////////////////////////////////////////////
		for(CourseGroupDTO vo:dto){
			int gno = vo.getGno();
			System.out.println("여기 "+gno);
			double avg=CourseReplyDAO.replyPointAvg(gno);
			String avrg = String.valueOf(avg);
			if(avrg.length()>4);
			avrg=avrg.substring(0, avrg.indexOf('.')+2);
			System.out.println("CourseGroup Controller : "+avrg);
			avgMap.put(gno, avrg);
			System.out.println( "평균 반올림>>>>"+avg+"=>"+Math.floor(avg));
			iavgMap.put(gno, (int)avg );		
		}
		
		////////////////////////////////////////////////
		System.out.println(avgMap.size());
		req.setAttribute("avgMap", avgMap);
		req.setAttribute("iavgMap", iavgMap);
		
		req.setAttribute("glist", dto);
		req.setAttribute("jsp", "../lectures/lectureMain.jsp");
		return "common/main.jsp";
	}
	// 대분류 선택시, 소분류 출력 기능부 끝

	@RequestMapping("boardmain.do")
	public String boardListData(HttpServletRequest req) {
		String page = req.getParameter("page");
		String order = req.getParameter("order");
		PrettyTime p = new PrettyTime(new Locale("KO"));
		Map reltmap = new HashMap();
		
		if (page == null)
			page = "1";
		int curpage = Integer.parseInt(page);
		int rowSize = 10;
		int start = (curpage * rowSize) - (rowSize - 1);
		int end = curpage * rowSize;
		Map map = new HashMap();
		map.put("start", start);
		map.put("end", end);
		List<QnaBoardVO> list = QBoardDAO.boardAllData(map,Integer.parseInt(order));
		for (QnaBoardVO v : list) {
			reltmap.put(v.getBno(), p.format(v.getBdate()));
		}
		int totalpage = QBoardDAO.BoardTotalPage();
		req.setAttribute("curpage", curpage);
		req.setAttribute("list", list);
		req.setAttribute("totalpage", totalpage);
		req.setAttribute("rtime", reltmap);
		req.setAttribute("jsp", "../board/BoardMain.jsp");
		return "common/main.jsp";
	}

}
