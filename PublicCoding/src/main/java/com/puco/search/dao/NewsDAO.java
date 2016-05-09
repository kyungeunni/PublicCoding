package com.puco.search.dao;
import java.util.*;

import javax.xml.bind.JAXBContext;
import javax.xml.bind.Unmarshaller;

import com.mongodb.*;

import java.net.*;
import java.io.*;
public class NewsDAO {
	public static void main(String[] arg){
		try{
			NewsDAO dao=new NewsDAO();
			//List<Item> list=dao.newsAllData("선거");
			List<Item> list=dao.newsAllData("토발즈");
			for(Item item:list){
				String t=item.getTitle();
				String desc=item.getDescription();
				String link=item.getLink();
				System.out.println(t+":"+desc+":"+link);
				//System.out.println(item.getTitle()+":::::::::::::::::"+item.getDescription());
			}
		}catch(Exception ex){
			System.out.println(ex.getMessage());
		}
	}
	public static List<Item> newsAllData(String title){
		List<Item> list=new ArrayList<Item>();
		try{
			URL url=new URL("http://newssearch.naver.com/search.naver?where=rss&query="+URLEncoder.encode(title,"UTF-8"));
			JAXBContext jc=JAXBContext.newInstance(Rss.class);
			Unmarshaller um=jc.createUnmarshaller();
			Rss rss=(Rss)um.unmarshal(url);
			list=rss.getChannel().getItem();
			int count=0;
			for(Item item:list){
				Item vo=new Item();
				vo.setTitle(item.getTitle());
				vo.setLink(item.getLink());
				String desc=item.getDescription();
				desc=desc.replace(".", "");
				desc=desc.replace("'", "");
				desc=desc.replaceAll("[A-Za-z]", "");//정규식  [A-Za-z0-9] 숫자까지 지움
				vo.setDescription(desc);
				//newsInsert(vo);
				list.set(count++, vo);
			}
		}catch(Exception ex){
			System.out.println("NewsDAO:"+ex.getMessage());
		}
		return list;
	}
}
