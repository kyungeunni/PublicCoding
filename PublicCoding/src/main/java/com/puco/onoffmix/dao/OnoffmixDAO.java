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
    
/*    //¿¹¾à
    public static List<ReserveVO> reserveUserAllData(String id){
    	SqlSession session = ssf.openSession();
    	List<ReserveVO> list = session.selectList("reserveUserAllData",id);
    	session.close();
    	return list;
    			
    }
    
    public static List<ReserveVO> reserveAdminAllData(){
    	SqlSession session = ssf.openSession();
    	List<ReserveVO> list = session.selectList("reserveAdminAllData");
    	session.close();
    	return list;
    			
    }
    
    public static void reserveInsert(ReserveVO vo){
    	SqlSession session = ssf.openSession(true);
    	session.insert("reserveInsert",vo);
    	session.close();
    }
    
    public static void reserveOkUPdate(int no){
    	SqlSession session = ssf.openSession(true);
    	session.update("reserveOkUPdate",no);
    	session.close();
    }*/
    
}
