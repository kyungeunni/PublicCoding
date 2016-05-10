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
		SqlSession session = ssf.openSession();
		List<CourseGroupDTO> list = session.selectList("CourseGroupAllData", no);
		session.close();
		return list;
	}
	public static CourseGroupDTO CourseGroupOneData(int gno){
		SqlSession session = ssf.openSession();
		CourseGroupDTO dto = session.selectOne("CourseGroupOneData", gno);
		session.close();
		return dto;
	}
	public static List<CourseGroupDTO> SameGroupAllData(int gno){
		SqlSession session = ssf.openSession();
		List<CourseGroupDTO> glist = session.selectList("SameGroupAllData", gno);
		session.close();
		return glist;
	}
}
