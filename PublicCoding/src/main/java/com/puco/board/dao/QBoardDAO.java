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
		System.out.println(1);
		List<QnaBoardVO> list = session.selectList("boardAllData",map);
		System.out.println(2);
		session.close();
		return list;
	}
	
	public static int BoardTotalPage(){
		SqlSession session = ssf.openSession();
		int count=session.selectOne("boardRowCount");
		session.close();
		return (int)(Math.ceil(count/10.0));	
	}
	
	public static QnaBoardVO getContentData(int bno){
		SqlSession session = ssf.openSession(true);
		System.out.println(1);
		session.update("incrHit",bno);
		System.out.println(2);
		session.close();
		session=ssf.openSession();
		System.out.println(1);
		QnaBoardVO vo = session.selectOne("getContentData",bno);
		System.out.println(2);
		session.close();
		return vo;
	}

	public static void boardInsert(QnaBoardVO vo) {
		SqlSession session=ssf.openSession(true);
		 System.out.println("DAO>>boardinsert>>1");
		 System.out.println(vo.getBsubject());
		 System.out.println(vo.getMno());
		 System.out.println(vo.getBcontent());
		 System.out.println(vo.getTgno1());
		 System.out.println(vo.getTgno2());
		 System.out.println(vo.getTgno3());
		session.insert("boardInsert",vo);
		 System.out.println("DAO>>boardinsert>>2");
    	session.close();
		
	}
	
	
}
