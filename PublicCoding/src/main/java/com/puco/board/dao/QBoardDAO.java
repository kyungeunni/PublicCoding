package com.puco.board.dao;

import java.io.Reader;
import java.util.*;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class QBoardDAO {
	private static SqlSessionFactory ssf;
	
	static {
		try{
			Reader reader =Resources.getResourceAsReader("Config.xml");
			ssf=new SqlSessionFactoryBuilder().build(reader);
			
		}catch(Exception ex){
			System.out.println("QBDaoInit>>"+ex.getMessage());
		}
		
	}
	public static List<QnaBoardVO> boardAllData(Map map){
		SqlSession session=ssf.openSession();
		List<QnaBoardVO> list = session.selectList("boardAllData",map);
		session.close();
		return list;
	}
	public static int BoardTotalPage(){
		SqlSession session = ssf.openSession();
		int count=session.selectOne("boardRowCount");
		session.close();
		return (int)(Math.ceil(count/10.0));	
	}
	
	public static QnaBoardVO getContentData(int ino){
		SqlSession session = ssf.openSession(true);
		session.update("incrHit",ino);
		session.close();
		session=ssf.openSession();
		QnaBoardVO vo = session.selectOne("getContentData",ino);
		session.close();
		return vo;
	}
}
