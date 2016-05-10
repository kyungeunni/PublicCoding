package com.puco.lectures;

import java.util.*;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.puco.board.dao.FreeBoardDAO;
import com.puco.board.dao.FreeBoardVO;
import com.puco.board.dao.QBoardDAO;
import com.puco.board.dao.QnaBoardVO;
import com.puco.category.dao.*;
import com.puco.controller.Controller;
import com.puco.controller.RequestMapping;
import com.puco.lectures.dao.*;
import com.puco.member.dao.MemberDAO;

@Controller("vc")
public class LectureController {
	/*@RequestMapping("videolist.do")
	public String videoListData(HttpServletRequest req){
		//req.setAttribute("msg", "게시판");
@Controller("vc")
public class LectureController {
	/*@RequestMapping("lectureMain.do")
	public String lectureMainData(HttpServletRequest req){
		String strmode=req.getParameter("mode");
		if(strmode==null)
			strmode="1";
		int mode=Integer.parseInt(strmode);
		VideoDAO dao = new VideoDAO();
		List<VideoDTO> dto;
		if(mode==1){
			dto = dao.VideoAllData(mode);
		}else{
			dto = dao.VideoAllData(mode);
		}
		req.setAttribute("list", dto);
		req.setAttribute("jsp", "inner_videolist.jsp");
		return "lectures/videolist.jsp";
	}*/
	
	// 강의그룹 기능 생성부
	@RequestMapping("courseGroup.do")
	public String videoListData(HttpServletRequest req){
		
		System.out.println(">>>>>>>>>>>>강의그룹 리스트");
		String sno=req.getParameter("sno");
		int no = Integer.parseInt(sno);
		
		if(sno==null)
			no=1;
		
		// Dcategory 메뉴
		List<DcategoryDTO> dlist=DcategoryDAO.DcategoryAllData();
		req.setAttribute("dlist", dlist);
		// Dcategory 메뉴 끝
		
		// Scategory 메뉴
		List<List<ScategoryDTO>> slist=new ArrayList<List<ScategoryDTO>>();
		for(int i=0;i<dlist.size();i++){
			slist.add(ScategoryDAO.ScategoryAllData(dlist.get(i).getDno()));
		}
		req.setAttribute("slist", slist);
		// Scategory 메뉴 끝
		
		
		List<CourseGroupDTO> glist=CourseGroupDAO.CourseGroupAllData(no);
		System.out.println("LectureController CourseGroupDAO Work");
		req.setAttribute("glist", glist);
		
		Map avgMap = new HashMap();
		Map iavgMap = new HashMap();
		////////////////////////////////////////////////
		for(CourseGroupDTO vo:glist){
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
		
		req.setAttribute("jsp", "../lectures/lectureMain.jsp");		
		return "common/main.jsp";
	}
	// 강의그룹 기능 생성부 끝
	
	@RequestMapping("play.do")
	public String videoPlayData(HttpServletRequest req) throws Exception{
		
		String gnos=req.getParameter("gno");							// 그룹번호
		String cnos=req.getParameter("cno");    						// 동영상번호
		int gno = Integer.parseInt(gnos);
		
		List<ContentDTO> clist=ContentDAO.ContentListData(gno);			// clist에 동영상정보 담아옴
		int initcno = clist.get(0).getCno();							// initcno에 제일 첫번째 동영상 번호를 받아옴
		
		if(cnos==null)
			cnos=String.valueOf(initcno);								// 최초는 무조건 cno=0
		
		int cno = Integer.parseInt(cnos);
		
		String contenturl=clist.get(cno-initcno).getCmediaurl();		// clist에는 첫번째 것은 제외하고 받아옴(list에 뿌려줄 것들)
		contenturl=contenturl.substring(9,contenturl.length());			// 전체 URL중 /watch?v=을 잘라버렸음
		String secondrul=contenturl.substring(0,contenturl.indexOf("&"));	// 순수 동영상 URL부분만 잘라 저장함
		contenturl=contenturl.substring(contenturl.lastIndexOf("&")+1);		// &index=& 까지 잘라내버림
		contenturl=secondrul+"?"+contenturl;	// 최종적으로 필요한 URL을 얻어냄 xTfCkSlwF1Q?list=PL7mmuO705dG0HUei41yV3ZOTT5MVURjGs
		
		String firstCname=clist.get(cno-initcno).getCname();			// 선택된 강의 제목을 받아옴
		String firstSite=clist.get(cno-initcno).getCsiteurl();			// 선택된 강의의 사이트 URL을 가져옴
		String firstCtime=clist.get(cno-initcno).getCtime();
		
		req.setAttribute("firstCname", firstCname);
		req.setAttribute("contenturl", contenturl);
		req.setAttribute("firstSite", firstSite);
		req.setAttribute("firstCtime", firstCtime);
		req.setAttribute("clist", clist);
		req.setAttribute("gno", gno);
		
		CourseGroupDTO dto=CourseGroupDAO.CourseGroupOneData(gno);		// 하단 강의 소개부 용도
		req.setAttribute("ginfo", dto);
		
		List<CourseGroupDTO> glist=CourseGroupDAO.SameGroupAllData(gno);// 연관강의 무작위 출력
		Collections.shuffle(glist);
		req.setAttribute("glist", glist);
		
		HttpSession hs = req.getSession();								// 강의를 수강 중인지 여부 판단 시작
		String no = (String) hs.getAttribute("mno");
		if(no != null){													// 현재 로그인 상태인지 확인
			int mno = Integer.parseInt(no);
			System.out.println("mno " + mno);
			InfoattendantDTO InfoDto = new InfoattendantDTO();
			InfoDto.setGno(gno);
			InfoDto.setMno(mno);
			InfoattendantDTO confirmCourse = InfoattendantDAO.ConfirmCourseData(InfoDto);
			System.out.println("confirmCourse "+confirmCourse);
			System.out.println("gno "+gno);
			req.setAttribute("confirmCourse", confirmCourse);
		}
		
		Map map = new HashMap();										// 강의 연관 게시물 검색
		map.put("start", 1);
		map.put("end", 10);
		List<QnaBoardVO> list = QBoardDAO.MainAllData();
		List<FreeBoardVO> flist=FreeBoardDAO.MainFreeData();
		req.setAttribute("qlist", list);
		
		
		String rpage=req.getParameter("rpage");							// 강의 평가 댓글 출력
		   if(rpage==null)
			   rpage="1";
		   int cpage=Integer.parseInt(rpage);
		   int rowSize=5;
		   int start=(cpage*rowSize)-(rowSize-1);
		   int end=(cpage*rowSize);
		   Map remap=new HashMap();
		   remap.put("gno", gnos);
		   System.out.println("gno in play.do " + gnos);
		   remap.put("start", start);
		   System.out.println("start in play.do " + start);
		   remap.put("end", end);
		   System.out.println("end in play.do " + end);
		   List<CourseReplyDTO> replyList=CourseReplyDAO.replyAllData(remap);
		  
		   
		   Map imagemap= new HashMap();
		
		   for(CourseReplyDTO dt:replyList){
			   String mid=dt.getGrename();
			   String mimge=MemberDAO.getUserDatabyName(mid);
			   imagemap.put(mid, mimge);
		   }
		   req.setAttribute("replyList", replyList);
		   req.setAttribute("imagemap", imagemap);
		   double avg=CourseReplyDAO.replyPointAvg(gno);	// 별점 평균
		   System.out.println("replyPoint worked");
		   String avrg = String.valueOf(avg);
			if(avrg.length()>4);
			avrg=avrg.substring(0, avrg.indexOf('.')+2);
		   req.setAttribute("grepointAvg", avrg);
		   
		req.setAttribute("jsp", "../lectures/play.jsp");
		return "common/main.jsp";
	}
	
	@RequestMapping("register.do")
	public String infoattendantData(HttpServletRequest req) throws Exception{
		HttpSession hs = req.getSession();								// 강의를 수강 중인지 여부 판단 시작
		String no1 = (String) hs.getAttribute("mno");
		String no2 = req.getParameter("gno");
		
		InfoattendantDTO InfoDto = new InfoattendantDTO();
		int gno = Integer.parseInt(no2);
		InfoDto.setGno(gno);
		System.out.println("gno " + gno);
		
		if(no1 != null){													// 현재 로그인 상태인지 확인
			int mno = Integer.parseInt(no1);
			InfoDto.setMno(mno);
			System.out.println("no1 " + no1);
			System.out.println("mno " + mno);

			InfoattendantDTO confirmCourse = InfoattendantDAO.ConfirmCourseData(InfoDto);
			System.out.println("confirmCourse in register.do"+confirmCourse);
			
			if(confirmCourse == null){
				InfoattendantDAO.RegisterCourseData(InfoDto);
			}
		}
		System.out.println("gno "+InfoDto.getGno());
		req.setAttribute("gno", InfoDto.getGno());
		return "lectures/registerLecture_ok.jsp";
	}
	
	@RequestMapping("reply_insert.do")
	public String reply_insert(HttpServletRequest req) throws Exception{
		req.setCharacterEncoding("EUC-KR");
		System.out.println("reply_isert in LectureController worked");
		
		String gno=req.getParameter("gno");
		System.out.println("reply_isert - gno : "+gno);
		String grecontent=req.getParameter("reply_data");
		System.out.println("reply_isert - grecontent : "+grecontent);
		String grepoint=req.getParameter("grepoint");
		System.out.println("reply_isert - grepoint : "+grepoint);
		
		HttpSession session=req.getSession();
		String grename=(String)session.getAttribute("id");
		System.out.println("reply_isert - grename : "+grename);
		String grepwd=(String)session.getAttribute("pwd");
		System.out.println("reply_isert - grepwd : "+grepwd);
		
		CourseReplyDTO dto=new CourseReplyDTO();
		dto.setGno(Integer.parseInt(gno));
		dto.setGrecontent(grecontent);
		dto.setGrepoint(Integer.parseInt(grepoint));
		dto.setGrepwd(grepwd);
		dto.setGrename(grename);
		
		System.out.println("전달할 준비 완료");
		CourseReplyDAO.replyInsert(dto);
		System.out.println("쿼리문 실행 완료 gno "+gno);
		
		req.setAttribute("gno", gno);
		
		return "lectures/reply_ok.jsp";
	}
}
