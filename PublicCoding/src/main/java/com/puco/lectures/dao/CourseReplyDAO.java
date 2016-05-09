package com.puco.lectures.dao;

import java.io.Reader;
import java.util.*;

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
		System.out.println("replyAllData working Start! in DAO "+remap);
		List<CourseReplyDTO> replyList=session.selectList("replyAllData",remap);
		if(replyList==null)
			System.out.println("댓글 내용이 암 것도 없다.");
    	System.out.println("replyAllData in CourseReplyDAO replyList " + replyList);
		session.close();
    	return replyList;
	}
	public static void replyInsert(CourseReplyDTO dto){
		System.out.println("replyInsert in CourseReplyDAO dto : "+dto);
		SqlSession session=ssf.openSession(true);
		session.insert("replyInsert", dto);
		session.close();
	}
	public static double replyPointAvg(int gno){
		SqlSession session=ssf.openSession();
		String sum=session.selectOne("replyPointSum", gno);
		String count=session.selectOne("replyPointCount", gno);
		session.close();
		
		double initSum;
		double initCount;
		double avg;
		
		if(sum==null || count==null)
			 avg=0.0;
		else{
			initSum=Double.parseDouble(sum);
			initCount=Double.parseDouble(count);
			avg = initSum/initCount;
		}
		
		System.out.println("sum "+sum);
		System.out.println("count "+count);
		
		return avg;
	}
}
