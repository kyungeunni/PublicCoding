package com.puco.lectures;

import java.util.List;
import javax.servlet.http.HttpServletRequest;

import com.puco.category.dao.ScategoryDTO;
import com.puco.controller.Controller;
import com.puco.controller.RequestMapping;
import com.puco.lectures.dao.*;

@Controller("vc")
public class LectureController {
	/*@RequestMapping("lectureMain.do")
	public String lectureMainData(HttpServletRequest req){
		String strmode=req.getParameter("mode");
		if(strmode==null)
			strmode="1";
		int mode=Integer.parseInt(strmode);
		List<CourseGroupDTO> dto;
		if(mode==1){
			dto = CourseGroupDAO.CourseGroupAllData(mode);
		}else{
			dto = CourseGroupDAO.CourseGroupAllData(mode);
		}
		req.setAttribute("glist", dto);
		req.setAttribute("jsp", "../lectures/lectureMain.jsp");
		return "common/main.jsp";
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
	public String videoPlayData(HttpServletRequest req){
		req.setAttribute("jsp", "../lectures/play.jsp");
		return "common/main.jsp";
	}
}
