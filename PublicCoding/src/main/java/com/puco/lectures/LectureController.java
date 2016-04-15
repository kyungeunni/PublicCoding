package com.puco.lectures;

import java.util.List;
import javax.servlet.http.HttpServletRequest;
import com.puco.controller.Controller;
import com.puco.controller.RequestMapping;
import com.puco.lectures.dao.*;

@Controller("vc")
public class LectureController {
	@RequestMapping("videolist.do")
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
		return "lectures/videolist.jsp";//jsp파일이름
	}
	@RequestMapping("play.do")
	public String videoPlayData(HttpServletRequest req){
		//req.setAttribute("msg", "게시판");
		return "lectures/play.jsp";//jsp파일이름
	}
}
