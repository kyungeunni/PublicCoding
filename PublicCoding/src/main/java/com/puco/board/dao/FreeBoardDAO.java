package com.puco.board.dao;

import java.io.Reader;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.springframework.test.context.jdbc.Sql;

import java.io.*;
import java.util.*;

public class FreeBoardDAO {
	private static SqlSessionFactory ssf;
	static
	{
		try
		{
			Reader reader=Resources.getResourceAsReader("Config.xml");
			ssf=new SqlSessionFactoryBuilder().build(reader);
		}catch(Exception ex)
		{
			System.out.println(ex.getMessage());
		}
	}
	//전체 데이터 읽기
	public static List<FreeBoardVO> FreeboardAllData(Map map)
	{
		
		//System.out.println(123);
		SqlSession session=ssf.openSession();
		//System.out.println(456);
		List<FreeBoardVO> list=session.selectList("FreeboardAllData",map);
		
		session.close();
		return list;
	}
	//페이지
	public static int freeboardTotalpage()
	{
		SqlSession session=ssf.openSession();
		int count=session.selectOne("freeboardRowCount");
		session.close();
		return (int)(Math.ceil(count/10.0));
	}
	//내용보기
	public static FreeBoardVO freeboardContentData(int no) 
	{
		SqlSession session=ssf.openSession(true);
		session.update("freeboardHitIncrement",no);
		session.close();
		session=ssf.openSession();
		FreeBoardVO vo=session.selectOne("freeboardContentData",no);
		return vo;
	}
	//글쓰기
	public static void freeboardInsert(FreeBoardVO vo)
	{
		SqlSession session=ssf.openSession(true);
		session.insert("freeboardInsert",vo);
		session.close();
		
	}
	//수정하기
	public static FreeBoardVO freeboardUpdate(int bno)
	{
		SqlSession session=ssf.openSession();
		FreeBoardVO vo=session.selectOne("freeboardContentData",bno);
		session.close();
		return vo;
	}
	//수정하기_ok
	public static void freeboardUpdateOk(FreeBoardVO vo)
	{
		SqlSession session=ssf.openSession(true);
		session.update("freeboardUpdateOk",vo);
		session.close();
	}
	
	public static int FBreplyCount(int Rno)
	{
		SqlSession session=ssf.openSession();
		int count=session.selectOne("FBreplyCount",Rno);
		session.close();
		return count;
	}
	public static List<AnswerVO> FBreplyAllData(Map map)
	{
		SqlSession session=ssf.openSession();
		List<AnswerVO> list=session.selectList("FBreplyAllData",map);
		session.close();
		return list;
	}
	public static void FBreplyInsert(AnswerVO vo)
	{
		SqlSession session=ssf.openSession(true);
		session.insert("FBreplyInsert",vo);
		session.close();
	}
	public static void FBreplyUpdate(AnswerVO vo)
	{
		SqlSession session=ssf.openSession(true);
		session.update("FBreplyUpdate",vo);
		session.close();
	}
	public static AnswerVO FBreplyParentData(int bno)
	{
		SqlSession session=ssf.openSession();
		AnswerVO vo=session.selectOne("FBreplyParentData",bno);
		session.close();
		return vo;
	}
	//게시글 삭제
	public static void freeboardDelete(int no)
	{
		SqlSession session=ssf.openSession(true);
		session.delete("freeboardDelete",no);
		session.close();
	}
	//댓글의 댓글
	public static void FBreplyStepIncrement(AnswerVO vo) 
	{
		SqlSession session = ssf.openSession(true);
		session.update("FBreplyStepIncrement", vo);
		session.close();
	}
}
