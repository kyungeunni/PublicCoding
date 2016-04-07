package com.puco.controller;

import java.util.*;

import javax.xml.parsers.SAXParser;
import javax.xml.parsers.SAXParserFactory;

import java.io.*;

public class WebApplicationContext {
	List<String> packlist = new ArrayList<String>();
	public WebApplicationContext(String path){
		try{
			List<String> list = new ArrayList<String>();
			SAXParserFactory spf = SAXParserFactory.newInstance();
			SAXParser sp = spf.newSAXParser();
			HandlerMapping hm = new HandlerMapping();
			sp.parse(new File(path), hm);
			list=hm.list;
			
			for(String pack : list){
				List<String> plist = FileConfig.getFileNames(pack);
				for(String s:plist){
					packlist.add(s);
				}
			}
			
		}catch(Exception e){
			System.out.println("WebAC>> "+e.getMessage());
		}
		
	}
	
}
