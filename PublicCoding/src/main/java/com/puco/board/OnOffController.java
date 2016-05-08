package com.puco.board;

import java.text.SimpleDateFormat;
import java.util.*;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.puco.board.dao.QBoardDAO;
import com.puco.controller.Controller;
import com.puco.controller.RequestMapping;
import com.puco.onoffmix.dao.LocationInfoVO;
import com.puco.onoffmix.dao.MeetupinfoVO;
import com.puco.onoffmix.dao.OnoffmixDAO;
import com.puco.onoffmix.dao.StudyJoinVO;



@Controller("oc")
public class OnOffController {
    @RequestMapping("onoff.do")
    public String movie_reserve(HttpServletRequest req)
    {
    	req.setAttribute("jsp", "../onoffmix/movie_reserve.jsp");
    	return "common/main.jsp";
    }
   
    @RequestMapping("movie_info.do")
    public String movie_info(HttpServletRequest req)
    {
    	System.out.println("스터디정보>>>1");
    	List<MeetupinfoVO> list=OnoffmixDAO.movieInfo();
    	System.out.println("스터디정보>>>2");
    	System.out.println("list:"+list.size());
    	req.setAttribute("list", list);
    	return "onoffmix/movie_info.jsp";
    }
    
    @RequestMapping("theater_info.do")
    public String theater_info(HttpServletRequest req)
    {
    	String mno=req.getParameter("mno");
    	String theaterno=OnoffmixDAO.theaterNumber(Integer.parseInt(mno));
    	StringTokenizer st=new StringTokenizer(theaterno, ",");
    	// 1,2,3,4,5
    	List<LocationInfoVO> list=new ArrayList<LocationInfoVO>();
    	while(st.hasMoreTokens())
    	{
    		LocationInfoVO vo=OnoffmixDAO.theaterInfoData(
    				Integer.parseInt(st.nextToken()));
    		list.add(vo);
    	}
    	req.setAttribute("list", list);
    	return "onoffmix/theater_info.jsp";
    }
    
    @RequestMapping("reserve_date.do")
    public String reserve_date(HttpServletRequest req)
    {
    	String strYear=req.getParameter("year");
    	String strMonth=req.getParameter("month");
    	String tno=req.getParameter("tno");
    	String timetable = OnoffmixDAO.getTimeTable(Integer.parseInt(tno));
    	StringTokenizer str = new StringTokenizer(timetable, ",");
    	List<String> timelist=new ArrayList<String>();
    	while(str.hasMoreTokens())
    	{
    		String vo=OnoffmixDAO.timeInfoData(Integer.parseInt(str.nextToken()));
    		timelist.add(vo);
    		System.out.println(vo);
    	}  
    	
    	Date date=new Date();
    	SimpleDateFormat sdf=new SimpleDateFormat("yyyy-M-d");//09 
    	StringTokenizer st=new StringTokenizer(sdf.format(date), "-");
    	String sy=st.nextToken();
    	String sm=st.nextToken();
    	String sd=st.nextToken();
    	
    	if(strYear==null)
    		strYear=sy;
    	if(strMonth==null)
    		strMonth=sm;
    	
    	int year=Integer.parseInt(strYear);
    	int month=Integer.parseInt(strMonth);
    	int day=Integer.parseInt(sd);
    	
    	List<String> tlist=new ArrayList<String>();
    	for(String time:timelist){
    		String temp = strMonth+"월"+String.valueOf(++day)+"일-"+time;
    		tlist.add(temp);
    		System.out.println("rdate>>>>>>>"+temp);
    	}
    	
    	req.setAttribute("tlist", tlist);
    	    	
    	return "onoffmix/reserve_date.jsp";
    }

    @RequestMapping("reserve_time.do")
    public String reserve_time(HttpServletRequest req) throws Exception
    {
    	req.setCharacterEncoding("UTF-8");
    	String mno=req.getParameter("mno");
    	
    	int meetno = Integer.parseInt(mno);
    	String meetdate=req.getParameter("day");
    	String meettime=req.getParameter("time");
    	System.out.println("meetno>"+meetno);
    	System.out.println("meetdate>"+meetdate);
    	System.out.println("meettime>"+meettime);
    	Map map = new HashMap();
    	map.put("meetno",meetno);
    	map.put("meetdate",meetdate);
    	map.put("meettime",meettime);
    	int minp=OnoffmixDAO.getMinPeople(meetno);
    	System.out.println("최소인원>>>"+minp);
    	List<Integer> mjoined = OnoffmixDAO.getJoinedPeople(map);
    	System.out.println("참가인원 크기>>>"+mjoined.size());
    	Map imgmap = new HashMap();
    	for(Integer m:mjoined){
    		String temp= QBoardDAO.getimageUrl(m);
    		imgmap.put(m, temp);  
    		System.out.println(m+"번 url>>>"+temp);
    	}
    	System.out.println("Done???");
    	req.setAttribute("minp", minp);
    	req.setAttribute("mjoined", mjoined);
    	req.setAttribute("imgmap", imgmap);
    	req.setAttribute("jnum", mjoined.size());//참가인원
    	
    	return "onoffmix/reserve_time.jsp";
    }
    
    @RequestMapping("register_ok.do")
    public String reserve_ok(HttpServletRequest req)
    throws Exception
    {
    	req.setCharacterEncoding("EUC-KR");
    	String meetno=req.getParameter("meetno");
    	String day=req.getParameter("day");
    	String time=req.getParameter("time");
    	String tno=req.getParameter("tno");

    	HttpSession session=req.getSession();
    	String mno=(String)session.getAttribute("mno");
    	System.out.println(meetno+"-"+day+"-"
    			+time+"-"+tno+"-"+mno);
    	StudyJoinVO vo = new StudyJoinVO();
    	vo.setMno(Integer.parseInt(mno));
    	vo.setMeettime(time);
    	vo.setMeetdate(day);
    	vo.setTno(Integer.parseInt(tno));
    	vo.setMeetno(Integer.parseInt(meetno));
    	System.out.println();
    	OnoffmixDAO.studyjoin(vo);
    	/*
    	//List<ReserveVO> list=MovieDAO.reserveUserAllData(id);
    	//req.setAttribute("list", list);
    	//req.setAttribute("jsp", "movie/mypage.jsp");*/
    	req.setAttribute("mno", mno);
    	return "onoffmix/reserve_ok.jsp";
    }
    
    
}
