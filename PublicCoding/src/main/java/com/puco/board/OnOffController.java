package com.puco.board;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.StringTokenizer;

import javax.servlet.http.HttpServletRequest;

import com.puco.controller.Controller;
import com.puco.controller.RequestMapping;
import com.puco.onoffmix.dao.LocationInfoVO;
import com.puco.onoffmix.dao.MeetupinfoVO;
import com.puco.onoffmix.dao.OnoffmixDAO;



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
    	
    	String[] strWeek={"일","월","화","수","목","금","토"};
    	int[] lastDay={
    		31,28,31,30,31,30,
    		31,31,30,31,30,31
    	};
    	
    	int total=((year-1)*365)+((year-1)/4)-((year-1)/100)
    			 +((year-1)/400);
    	if(((year%4==0)&&(year%100!=0))||(year%400==0))
    	{
    		lastDay[1]=29;
    	}
    	else
    	{
    		lastDay[1]=28;
    	}
    	
    	for(int i=0;i<month-1;i++)
    	{
    		total+=lastDay[i];
    	}
    	
    	total++;
    	int week=total%7;
    	System.out.println("week:"+strWeek[week]);
    	req.setAttribute("year", year);
    	req.setAttribute("month", month);
    	req.setAttribute("day", day);
    	req.setAttribute("week", week);
    	req.setAttribute("lastDay", lastDay[month-1]);
    	List<String> weekList=new ArrayList<String>();
    	for(int i=0;i<7;i++)
    	{
    		weekList.add(strWeek[i]);
    	}
    	req.setAttribute("weekList", weekList);
    	return "onoffmix/reserve_date.jsp";
    }

    @RequestMapping("reserve_time.do")
    public String reserve_time(HttpServletRequest req)
    {
    	int[] temp=new int[5];
    	boolean bCheck=false;
    	int su=0;
    	for(int i=0;i<5;i++)
    	{
    		bCheck=true;
    		while(bCheck)
    		{
    			su=(int)(Math.random()*15)+1;
    			bCheck=false;
    			for(int j=0;j<i;j++)
    			{
    				if(temp[j]==su)
    				{
    					bCheck=true;
    					break;
    				}
    			}
    		}
    		temp[i]=su;
    	}
    	for(int i=0;i<temp.length-1;i++)
    	{
    		for(int j=i+1;j<temp.length;j++)
    		{
    			if(temp[i]>temp[j])
    			{
    				int a=temp[i];
    				temp[i]=temp[j];
    				temp[j]=a;
    			}
    		}
    	}
    	List<String> list=new ArrayList<String>();
    	for(int no:temp)
    	{
    		String time=OnoffmixDAO.timeInfoData(no);
    		list.add(time);
    	}
    	req.setAttribute("list", list);
    	return "onoffmix/reserve_time.jsp";
    }
}
