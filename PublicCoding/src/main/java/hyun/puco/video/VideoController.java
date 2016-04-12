package hyun.puco.video;

import java.util.List;
import hyun.puco.video.dao.*;
import javax.servlet.http.HttpServletRequest;

import com.puco.board.dao.BoardDAO;
import com.puco.board.dao.BoardDTO;
import com.puco.controller.Controller;
import com.puco.controller.RequestMapping;

@Controller("vc")
public class VideoController {
	@RequestMapping("videolist.do")
	public String videoListData(HttpServletRequest req){
		//req.setAttribute("msg", "게시판");
		String page=req.getParameter("page");
		if(page==null)
			page="1";
		VideoDAO dao = new VideoDAO();
		if(page=="1"){
			List<VideoDTO> dto = dao.boardListData(0);
		}else{
			List<VideoDTO> dto = dao.boardListData(0);
		}
		req.setAttribute("list", dto);
		return "lectures/videolist.jsp";//jsp파일이름
	}
}
