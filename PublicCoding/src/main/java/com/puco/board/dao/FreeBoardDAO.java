package com.puco.board.dao;

import java.io.Reader;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import java.io.*;
import java.util.*;

public class FreeBoardDAO {
	private static SqlSessionFactory ssf;
	static
	{
		try
		{
			Reader reader=Resources.getResourceAsReader("Config.xml");
		}catch(Exception ex)
		{
			System.out.println(ex.getMessage());
		}
	}
	//전체 데이터 읽기
	public static List<FreeBoardVO> FreeboardAllData(Map map)
	{
		SqlSession session=ssf.openSession();
		List<FreeBoardVO> list=session.selectList("FreeboardAllData",map);
		session.close();
		return list;
	}
}
