package com.puco.lectures.dao;

import java.util.*;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import com.puco.lectures.dao.*;
import java.io.*;
import java.net.*;

public class VideoDAO {
private static SqlSessionFactory ssf;
	static {
		try{
			Reader reader =Resources.getResourceAsReader("Config.xml");
			ssf=new SqlSessionFactoryBuilder().build(reader);
			
		}catch(Exception ex){
			System.out.println("QBDaoInit>>"+ex.getMessage());
		}
	}
	public static List<VideoDTO> CourseGroupAllData(int Sno){
		SqlSession session=ssf.openSession();
		List<VideoDTO> list = session.selectList("CourseGroupAllData",Sno);
		session.close();
		return list;
	}
}