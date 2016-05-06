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
	public static List<ContentDTO> ContentListData(int gno){
		System.out.println("ContentListData method Work");
		SqlSession session = ssf.openSession();
		System.out.println("ContentListData SqlSession Work");
		List<ContentDTO> clist = session.selectList("ContentListData", gno);
		System.out.println("ContentListData selectList Work");
		session.close();
		System.out.println("ContentListData session close Work");
		System.out.println("clist " + clist);
		return clist;
	}
}
