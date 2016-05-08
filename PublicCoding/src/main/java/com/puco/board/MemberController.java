package com.puco.board;

import java.util.*;
import java.io.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.ocpsoft.prettytime.PrettyTime;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.puco.board.dao.QnaBoardVO;
import com.puco.controller.Controller;
import com.puco.controller.RequestMapping;
import com.puco.member.dao.MemberDAO;
import com.puco.member.dao.MemberDTO;
import com.puco.member.dao.ScoreVO;
import com.puco.onoffmix.dao.OnoffmixDAO;
import com.puco.onoffmix.dao.StudyJoinVO;


@Controller("mc")
public class MemberController {
	@RequestMapping("signin.do")
	public String memberSignin(HttpServletRequest req) {
		String id=req.getParameter("id");
		System.out.println(id);
		String pwd=req.getParameter("pwd");
		System.out.println(pwd);
		// DB연동
		String res = MemberDAO.memberLogin(id, pwd);
		String email="";
		String mno="";
		String mimageurl="";
		if(!(res.equals("NOID")||res.equals("NOPWD"))) {
			StringTokenizer st = new StringTokenizer(res, "|");
			email=st.nextToken();
			mno=st.nextToken();
			mimageurl=st.nextToken();
			MemberDAO.loginUpdate(Integer.parseInt(mno));
			ScoreVO d= new ScoreVO();
			d.setMno(Integer.parseInt(mno));
			d.setScore(1);
			d.setMessage("(+1) 로그인 하였습니다.");
			MemberDAO.recordScore(d);

			HttpSession session=req.getSession();
			session.setAttribute("id", id);
			session.setAttribute("pwd", pwd);		// 05.08일 비밀 번호 세션에 추가
			session.setAttribute("email", email);
			session.setAttribute("mno", mno);
			session.setAttribute("mimageurl", mimageurl);
		}
		req.setAttribute("res", res);
		System.out.println("MemberController -> signin.jsp");
		return "member/signin.jsp";
	}

	@RequestMapping("userMain.do")
	public String userMain(HttpServletRequest req){
		String no =req.getParameter("mno");
		int mno = Integer.parseInt(no);
		//기본정보
		MemberDTO vo = MemberDAO.userdata(mno);
		StringTokenizer st = new StringTokenizer(vo.getMtags(), ",");
		List<String> tags = new ArrayList<String>();
		while(st.hasMoreTokens()){
			String t = st.nextToken();
			String tag = MemberDAO.getTagName(Integer.parseInt(t));
			tags.add(tag);
		}
		PrettyTime p = new PrettyTime(new Locale("KO"));
		System.out.println("vo가져옴??>>>"+vo.getMemail());
		//답변글
		List<QnaBoardVO> alist = MemberDAO.getUserAnswerPost(mno);
		req.setAttribute("alist", alist);
		//질문글
		List<QnaBoardVO> qlist = MemberDAO.getUserPost(mno);
		List<String> datelist = MemberDAO.getPointDateList(mno);
		List<Integer> pointlist = MemberDAO.getPointDate(mno,datelist);
		List<ScoreVO> scorelist = MemberDAO.getAllPointData(mno);
		System.out.println("pointlist>>>>>true");
		
		//오프라인 스터디 참가내역
		List<StudyJoinVO> onoff=OnoffmixDAO.studyjoinUserAllData(mno);
		System.out.println("참가내역 쿼리>>");
		req.setAttribute("onoff", onoff);
		req.setAttribute("scorelist", scorelist);
		req.setAttribute("datelist",datelist );
		req.setAttribute("pointlist",pointlist );
		req.setAttribute("qlist", qlist);
		//질문갯수
		req.setAttribute("qno", qlist.size());
		//답변갯수
		req.setAttribute("ano", alist.size());
		req.setAttribute("login",p.format(vo.getLogindate()));
		req.setAttribute("jsp", "userMain.jsp");
		req.setAttribute("mno", no);
		req.setAttribute("vo", vo);
		req.setAttribute("tags", tags);
		return "common/main.jsp";
	}

	@RequestMapping("user_update.do")
	public String user_update(HttpServletRequest req){
		String mno=req.getParameter("mno");
		System.out.println("userupdate.do>>>1");
		String mtags=MemberDAO.getTaglist(Integer.parseInt(mno));
		StringTokenizer st = new StringTokenizer(mtags, ",");
		List<String> tags = new ArrayList<String>();
		while(st.hasMoreTokens()){
			String t = st.nextToken();
			String tag = MemberDAO.getTagName(Integer.parseInt(t));
			tags.add(tag);
		}
		
		MemberDAO.loginUpdate(Integer.parseInt(mno));
		System.out.println("userupdate.do>>>1");
		req.setAttribute("tags", tags);
		req.setAttribute("jsp", "user_edit.jsp");
		return "common/main.jsp";
	}

	@RequestMapping("user_update_ok.do")
	public String user_update_ok(HttpServletRequest req) throws IOException{
		
		String path="c://SpringDev//springStudy//.metadata//.plugins//org.eclipse.wst.server.core//tmp1//wtpwebapps//PublicCoding//resources//userprofiles";
	    String enctype="EUC-KR";
	    int size=1024*1024*100;
	    MultipartRequest mr=
	    		new MultipartRequest(req,path,size,enctype,
	    				new DefaultFileRenamePolicy());
	    String mno=mr.getParameter("mno");
	     System.out.println(mno);
	    String tags= mr.getParameter("taglist");
	    
	    String filename=mr.getOriginalFileName("upload");
	    MemberDTO info=MemberDAO.userdata(Integer.parseInt(mno));
	    MemberDTO d=new MemberDTO();
	    d.setMno(Integer.parseInt(mno));
	    d.setMtags(tags);
	    if(filename==null)
	    {
	    	if(!(info.getMimageURL().equals("defaultprofile.jpg"))){
	    	File f=new File("C:\\SpringDev\\springStudy\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp1\\wtpwebapps\\PublicCoding\\resources\\userprofiles\\"+info.getMimageURL());
	    	f.delete();
	    	}

	    	d.setMimageURL("defaultprofile.jpg");
	    	d.setFilesize(0);
	    }
	    else
	    {
	    	File f=new File("C:\\SpringDev\\springStudy\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp1\\wtpwebapps\\PublicCoding\\resources\\userprofiles\\"+filename);
	    	d.setMimageURL(filename);
	    	d.setFilesize((int)f.length());

	    }

	    // DB연동
	    System.out.println(">>>>>>>>filename2");
	    System.out.println(d.getMno());
	    System.out.println(d.getFilesize());
	    System.out.println(d.getMimageURL());
	    MemberDAO.userUpdate(d);
	    HttpSession session=req.getSession();
	    session.setAttribute("mimageurl", d.getMimageURL());
	    // 이동
	    System.out.println(">>>>>>>>filename3");
	       if(filename!=null && info.getFilesize()>0)
	       {
	    	   File f=new File("C:\\SpringDev\\springStudy\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp1\\wtpwebapps\\PublicCoding\\resources\\userprofiles\\"+info.getMimageURL());
	    	   f.delete();
	    }
		return "common/user_update_ok.jsp";
	}

	@RequestMapping("signout.do")
	public String signout(HttpServletRequest req){
		HttpSession session=req.getSession();
		session.invalidate();
		return "member/signout.jsp";
	}

	@RequestMapping("join.do")	// 회원가입 페이지로 넘어가는 용도
	public String joinPage(HttpServletRequest req) {
		req.setAttribute("jsp", "../member/signup.jsp");
		return "common/main.jsp";
	}
	
	@RequestMapping("idcheck_ok.do")
	public String memberIdCheck(HttpServletRequest req){
		String id=req.getParameter("id");
		int count=MemberDAO.memberIdCheck(id);
		req.setAttribute("count", count);
		return "member/idcheck_ok.jsp";
	}
	
	@RequestMapping("signup.do")
	public String memberSignup(HttpServletRequest req) throws Exception{
		System.out.println("work signup.do");
		System.out.println(req);
		//req.setCharacterEncoding("EUC-KR");
		String mid=req.getParameter("id");
		System.out.println(mid);
		String mpwd=req.getParameter("pwd");
		System.out.println(mpwd);
		String memail=req.getParameter("email");
		System.out.println(memail);
		MemberDTO dto=new MemberDTO();
		dto.setMid(mid);
		dto.setMpwd(mpwd);
		dto.setMemail(memail);
		System.out.println("set dto");
		MemberDAO.insertMember(dto);
		System.out.println("MemberDTO work : "+dto);
		
		String id=req.getParameter("id");
		System.out.println("before memberIdCheck " + id);
		int count=MemberDAO.memberIdCheck(id);
		System.out.println("count in memberSignup, MemberController : "+count);
		req.setAttribute("mid", mid);
		req.setAttribute("count", count);
		req.setAttribute("jsp", "../member/signup_ok.jsp");
		return "common/main.jsp";
	}
}
