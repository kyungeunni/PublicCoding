package com.puco.lectures.dao;

import java.io.Reader;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class CourseReplyDAO {
	private static SqlSessionFactory ssf;
	static {
		try {
			Reader reader = Resources.getResourceAsReader("Config.xml");
			ssf = new SqlSessionFactoryBuilder().build(reader);
		} catch (Exception ex) {
			System.out.println("CourseReplyDAO ERROR "+ex.getMessage());
		}
	}
	
	public static List<CourseReplyDTO> replyAllData(Map remap){
		SqlSession session=ssf.openSession();
		List<CourseReplyDTO> replyList=session.selectList("replyAllData",remap);
    	session.close();
    	return replyList;
	}
}
