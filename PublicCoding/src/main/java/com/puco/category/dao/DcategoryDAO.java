package com.puco.category.dao;

import java.io.Reader;
import java.util.*;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class DcategoryDAO {
	private static SqlSessionFactory ssf;
	
	static {
		try {
			Reader reader = Resources.getResourceAsReader("Config.xml");
			ssf = new SqlSessionFactoryBuilder().build(reader);
		} catch (Exception ex) {
			System.out.println("DcategoryDAO ERROR "+ex.getMessage());
		}
	}
	public static List<DcategoryDTO> DcategoryAllData(){
		System.out.println("DcategoryAllData method Work");
		SqlSession session = ssf.openSession();
		System.out.println("DcategoryAllData SqlSession Work");
		List<DcategoryDTO> dlist = session.selectList("DcategoryAllData");
		System.out.println("DcategoryAllData selectList Work");
		session.close();
		System.out.println("DcategoryAllData session close Work");
		return dlist;
	}
}
