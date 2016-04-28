package com.puco.member.dao;

import java.io.Reader;
import java.util.Locale;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.ocpsoft.prettytime.PrettyTime;
import org.apache.ibatis.session.SqlSession;

public class MemberDAO {
	private static SqlSessionFactory ssf;
	static {
		try {
			System.out.println("111111111111");
			Reader reader = Resources.getResourceAsReader("Config.xml");
			System.out.println("222222222222");
			ssf = new SqlSessionFactoryBuilder().build(reader);
			System.out.println("MemberDAO WORKING~~~~");
		} catch (Exception ex) {
			System.out.println("MemberDAO ERROR " + ex.getMessage());
		}
	}
	public static String memberLogin(String id, String pwd) {
		String result="";
		System.out.println("MemberDAO 1");
		SqlSession session = ssf.openSession();
		System.out.println("MemberDAO 2");
		System.out.println("MemberDAO "+id);
		System.out.println("MemberDAO "+pwd);
		int count = session.selectOne("memberIdCount", id);
		System.out.println("MemberDAO 3");
		System.out.println(count);
		// 그런 아이디가 있나? 없다면, 아이디 없음 기능 작동
		if(count==0) {
			result="NOID";
		}
		// 아이디가 존재하면 비밀번호 여부 확인하고, email값을 받아옴
		else {
			System.out.println("memberGetpwd " + id);
			MemberDTO d = session.selectOne("memberGetpwd", id);
			System.out.println("memberGetpwd " + d.getMpwd());
			if(pwd.equals(d.getMpwd())) {
				System.out.println("memberGetpwd Work1");
				result = d.getMemail()+"|"+d.getMno();
				System.out.println(result);
			}
			else {
				System.out.println("memberGetpwd Wrong PWD");
				result="NOPWD";
			}
		}
		session.close();
		System.out.println("MemberDAO 4");
		return result;
	}
	public static void profileupdate(MemberDTO d) {
		SqlSession session = ssf.openSession(true);
		session.insert("profileupdate","d");
		session.close();
		
	}
	public static MemberDTO userdata(int mno) {
		SqlSession session = ssf.openSession();
		System.out.println("userdata>>1");
		MemberDTO vo=session.selectOne("getUserData", mno);
		
		session.close();
		
		return vo;
	}
	public static boolean userUpdate(MemberDTO d) {
		// TODO Auto-generated method stub
		return false;
	}
}
