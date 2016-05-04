package com.puco.lectures;

import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import com.puco.category.dao.*;
import com.puco.controller.Controller;
import com.puco.controller.RequestMapping;
import com.puco.lectures.dao.*;

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
		contenturl=secondrul+"?"+contenturl;							// 최종적으로 필요한 URL을 얻어냄 xTfCkSlwF1Q?list=PL7mmuO705dG0HUei41yV3ZOTT5MVURjGs
	
		req.setAttribute("contenturl", contenturl);
		req.setAttribute("contenturl", contenturl);
		req.setAttribute("clist", clist);
		req.setAttribute("gno", gno);
		req.setAttribute("jsp", "../lectures/play.jsp");
		return "common/main.jsp";
	}
}
