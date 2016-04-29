package com.puco.category.dao;

import java.io.Reader;
import java.util.*;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class ScategoryDAO {
	private static SqlSessionFactory ssf;
	
	static{
		try {
			Reader reader = Resources.getResourceAsReader("Config.xml");
			ssf = new SqlSessionFactoryBuilder().build(reader);
		} catch (Exception ex) {
			System.out.println("ScategoryDAO ERROR"+ex.getMessage());
		}
	}	
	public static List<ScategoryDTO> ScategoryAllData(int no){
		System.out.println("ScategoryAllData method Work parameter is " + no);
		SqlSession session = ssf.openSession();
		System.out.println("ScategoryAllData SqlSession Work");
		List<ScategoryDTO> slist = session.selectList("ScategoryAllData", no);
		System.out.println("ScategoryAllData selectList Work");
		session.close();
		System.out.println("ScategoryAllData session close Work");
		return slist;
	}
	public static List<ScategoryDTO> ScategoryReAllData(int no){
		System.out.println("ScategoryReAllData method Work parameter is " + no);
		SqlSession session = ssf.openSession();
		System.out.println("ScategoryReAllData SqlSession Work");
		List<ScategoryDTO> slist = session.selectList("ScategoryReAllData", no);
		System.out.println("ScategoryReAllData selectList Work");
		session.close();
		System.out.println("ScategoryReAllData session close Work");
		return slist;
	}
}
