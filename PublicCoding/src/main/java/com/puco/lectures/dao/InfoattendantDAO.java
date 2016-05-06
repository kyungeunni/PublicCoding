package com.puco.lectures.dao;

import java.io.Reader;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class InfoattendantDAO {
	private static SqlSessionFactory ssf;
	static {
		try {
			Reader reader = Resources.getResourceAsReader("Config.xml");
			ssf = new SqlSessionFactoryBuilder().build(reader);
		} catch (Exception ex) {
			System.out.println("InfoattendantDAO ERROR "+ex.getMessage());
		}
	}
	
	public static InfoattendantDTO ConfirmCourseData(InfoattendantDTO infoDto){
		SqlSession session = ssf.openSession();
		InfoattendantDTO dto = session.selectOne("ConfirmCourseData", infoDto);
		session.close();
		if(dto==null){
			System.out.println("검색되는 결과가 없음");
		}
		return dto;
	}
	public static void RegisterCourseData(InfoattendantDTO dto){
		SqlSession session = ssf.openSession(true);
		session.insert("RegisterCourseData", dto);
		System.out.println("수강신청 실시 완료 ");
		session.close();
	}
}
