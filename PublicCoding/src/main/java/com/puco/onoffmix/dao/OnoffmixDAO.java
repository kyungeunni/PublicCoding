package com.puco.onoffmix.dao;

import java.io.Reader;
import java.util.*;
import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class OnoffmixDAO {
	private static SqlSessionFactory ssf;
    static
    {
    	try
    	{
    		Reader reader=Resources.getResourceAsReader("Config.xml");
    		ssf=new SqlSessionFactoryBuilder().build(reader);
    	}catch(Exception ex)
    	{
    		System.out.println(ex.getMessage());
    	}
    }
    
    public static List<MeetupinfoVO> movieInfo(){
    	SqlSession session = ssf.openSession();
    	List<MeetupinfoVO> list = session.selectList("MeetupinfoData");
    	session.close();
    	return list;
    			
    }
    
    public static List<LocationInfoVO> theaterInfo(){
    	SqlSession session = ssf.openSession();
    	List<LocationInfoVO> list = session.selectList("LocInfo");
    	session.close();
    	return list;
    			
    }
    
    
    public static String getTimeTable(int tno){
    	SqlSession session = ssf.openSession();
    	String list = session.selectOne("getTimeTable",tno);
    	session.close();
    	return list;
    			
    }
    public static String theaterNumber(int meetno){
    	SqlSession session = ssf.openSession();
    	String list = session.selectOne("LocationNumber",meetno);
    	session.close();
    	return list;
    }
    
    public static LocationInfoVO theaterInfoData(int tno){
    	
    	SqlSession session = ssf.openSession();
    	LocationInfoVO list = session.selectOne("LocInfo",tno);
    	session.close();
    	return list;
    }    

    public static String timeInfoData(int tno){
    	SqlSession session = ssf.openSession();
    	String list = session.selectOne("timeInfoData",tno);
    	session.close();
    	return list;
    }
    
   
    
    public static int getMinPeople(int meetno){
    	SqlSession session = ssf.openSession();
    	int list = session.selectOne("getMinPeople",meetno);
    	session.close();
    	return list;
    }
    
    public static List<Integer> getJoinedPeople(Map map){
    	SqlSession session = ssf.openSession();
    	List<Integer> list = session.selectList("getJoinedPeople",map);
    	session.close();
    	return list;
    }
    
    public static List<Integer> getJoinedPeoplebyGN(int groupno){
    	SqlSession session = ssf.openSession();
    	List<Integer> list = session.selectList("getJoinedPeoplebyGN",groupno);
    	session.close();
    	return list;
    }
    public static void studyjoin(StudyJoinVO vo){
    	SqlSession session = ssf.openSession(true);
    	session.insert("studyjoin",vo);
    	session.close();
    }

    public static List<StudyJoinVO> studyjoinUserAllData(int mno){
    	SqlSession session = ssf.openSession();
    	List<StudyJoinVO> list = session.selectList("studyjoinUserAllData",mno);
    	session.close();
    	return list;
    }
    
    public static List<StudyJoinVO> studyjoinAllData(){
    	SqlSession session = ssf.openSession();
    	List<StudyJoinVO> list = session.selectList("studyjoinAllData");
    	session.close();
    	return list;
    }
    
    public static int getGroupNo(Map map){
    	SqlSession session = ssf.openSession();
    	int list = session.selectOne("getGroupNo",map);
    	session.close();
    	return list;
    }
    
    public static int getMaxGn(){
    	SqlSession session = ssf.openSession();
    	int list = session.selectOne("getMaxGn");
    	session.close();
    	return list;
    }
    
    
    public static StudyJoinVO studyjoinData(int groupno){
    	SqlSession session = ssf.openSession();
    	StudyJoinVO list = session.selectOne("studyjoinData",groupno);
    	session.close();
    	return list;
    }
    
}
