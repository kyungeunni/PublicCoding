package com.puco.lectures.dao;

import java.io.Reader;
import java.util.*;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import com.puco.category.dao.DcategoryDTO;

public class CourseGroupDAO {
	private static SqlSessionFactory ssf;
	
	static {
		try {
			Reader reader = Resources.getResourceAsReader("Config.xml");
			ssf = new SqlSessionFactoryBuilder().build(reader);
		} catch (Exception ex) {
			System.out.println("CourseGroupDAO ERROR "+ex.getMessage());
		}
	}
	public static List<CourseGroupDTO> CourseGroupAllData(int no){
		System.out.println("CourseGroupAllData method Work");
		SqlSession session = ssf.openSession();
		System.out.println("CourseGroupAllData SqlSession Work");
		List<CourseGroupDTO> glist = session.selectList("CourseGroupAllData1", no);
		System.out.println("CourseGroupAllData selectList Work");
		session.close();
		System.out.println("CourseGroupAllData session close Work");
		System.out.println("glist " + glist);
		return glist;
	}
}
