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

	public static List<AnswerVO> getAnswerData(int bno) {
		List<AnswerVO> list ;
		SqlSession session = ssf.openSession();
		list = session.selectList("getAnswerData",bno);
		session.close();
		return list;
	}

	public static void incrBVote(int bno) {
		SqlSession session = ssf.openSession(true);
		session.update("bVoteUp",bno);
		session.close();
		
	}

	public static void incrAvote(String bno, String rno) {
		SqlSession session = ssf.openSession(true);
		Map map = new HashMap();
		map.put("bno", bno);
		map.put("rno", rno);
		session.update("aVoteUp",map);
		session.close();
		
	}

	public static void decrBVote(int bno) {
		SqlSession session = ssf.openSession(true);
		session.update("bVoteDown",bno);
		session.close();
	}

	public static void decrAvote(String bno, String rno) {
		SqlSession session = ssf.openSession(true);
		Map map = new HashMap();
		map.put("bno", bno);
		map.put("rno", rno);
		session.update("aVoteDown",map);
		session.close();
		
		
	}
	
	
}
