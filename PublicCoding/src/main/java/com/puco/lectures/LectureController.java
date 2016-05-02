package com.puco.lectures;

import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.HttpServletRequest;

import com.puco.category.dao.DcategoryDAO;
import com.puco.category.dao.DcategoryDTO;
import com.puco.category.dao.ScategoryDAO;
import com.puco.category.dao.ScategoryDTO;
import com.puco.controller.Controller;
import com.puco.controller.RequestMapping;
import com.puco.lectures.dao.*;

@Controller("vc")
public class LectureController {
	/*@RequestMapping("videolist.do")
	public String videoListData(HttpServletRequest req){
		//req.setAttribute("msg", "게시판");
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
		System.out.println("LectureController CourseGroup req.set Work");
		System.out.println("LectureController glist " + glist);
		req.setAttribute("jsp", "../lectures/lectureMain.jsp");
		return "common/main.jsp";
	}
	// 강의그룹 기능 생성부 끝
	
	@RequestMapping("play.do")
	public String videoPlayData(HttpServletRequest req) throws Exception{
		String gno=req.getParameter("gno");
		int no = Integer.parseInt(gno);
		
		if(gno==null)
			no=1;
		
		List<ContentDTO> clist=ContentDAO.ContentListData(no);
		System.out.println("LectureController ContentDAO Work");
		req.setAttribute("clist", clist);
		//ContentDTO dto=ContentDAO.ContentAllData(no);
		System.out.println("LectureController Content req.set Work");
		System.out.println("LectureController clist " + clist);
		
		/*List<ContentDTO> dto = ContentDAO.ContentAllData(no);*/
		
		
		/*//req.setAttribute("msg", "게시판");
		req.setCharacterEncoding("EUC-KR");
		String lecture=req.getParameter("lecture").substring(9);
		String list=req.getParameter("list");
		String url=lecture+"?list="+list; //awTiYk5aCEo?list=PLENYGEQnz1xrMzGAfcCJFBzkBNzY2ufb1
		req.setAttribute("url", url);*/
		req.setAttribute("jsp", "../lectures/play.jsp");
		return "common/main.jsp";
	}
}
