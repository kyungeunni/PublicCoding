package com.puco.lectures;

import java.util.List;
import javax.servlet.http.HttpServletRequest;

import com.puco.category.dao.ScategoryDTO;
import com.puco.controller.Controller;
import com.puco.controller.RequestMapping;
import com.puco.lectures.dao.*;

@Controller("vc")
public class LectureController {
	/*@RequestMapping("videolist.do")
	public String lectureMainData(HttpServletRequest req){
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
		return "lectures/lectureMain.jsp";
	}*/
	
	@RequestMapping("courseGroup.do")
	public String videoListData(HttpServletRequest req){
		String sno=req.getParameter("sno");
		int no = Integer.parseInt(sno);
		
		if(sno==null)
			sno="1";
		
		List<CourseGroupDTO> glist=CourseGroupDAO.CourseGroupAllData(no);
		System.out.println("LectureController CourseGroupDTO Work");
		req.setAttribute("glist", glist);
		System.out.println("LectureController CourseGroup req.set Work");
		System.out.println("LectureController glist " + glist);
		req.setAttribute("gjsp", "inner_videolist.jsp");
		return "lectures/videolist.jsp";
	}
	
	@RequestMapping("play.do")
	public String videoPlayData(HttpServletRequest req) throws Exception{
		//req.setAttribute("msg", "게시판");
		req.setCharacterEncoding("EUC-KR");
		String lecture=req.getParameter("lecture").substring(9);
		String list=req.getParameter("list");
		String url=lecture+"?list="+list; //awTiYk5aCEo?list=PLENYGEQnz1xrMzGAfcCJFBzkBNzY2ufb1
		req.setAttribute("url", url);
		req.setAttribute("jsp", "play.jsp");
		return "lectures/videolist.jsp";
	}
}
