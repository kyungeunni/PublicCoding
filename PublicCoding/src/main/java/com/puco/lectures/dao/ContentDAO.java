package com.puco.lectures.dao;

import java.io.Reader;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class ContentDAO {
private static SqlSessionFactory ssf;
	
	static {
		try {
			Reader reader = Resources.getResourceAsReader("Config.xml");
			ssf = new SqlSessionFactoryBuilder().build(reader);
		} catch (Exception ex) {
			System.out.println("CourseGroupDAO ERROR "+ex.getMessage());
		}
	}
	public static List<ContentDTO> ContentAllData(int no){
		System.out.println("ContentAllData method Work");
		SqlSession session = ssf.openSession();
		System.out.println("ContentAllData SqlSession Work");
		List<ContentDTO> clist = session.selectList("ContentAllData", no);
		System.out.println("ContentAllData selectList Work");
		session.close();
		System.out.println("ContentAllData session close Work");
		System.out.println("clist " + clist);
		return clist;
	}
}
