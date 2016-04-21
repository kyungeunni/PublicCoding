package com.puco.lectures.dao;

import java.util.*;
import org.jsoup.Jsoup;
import org.jsoup.select.*;
import com.puco.lectures.dao.*;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import java.io.*;
import java.net.*;

public class VideoDAO {
	public static void main(String[] arg){
		VideoDAO m=new VideoDAO();
		m.VideoAllData(1);
	}
	public List<VideoDTO> VideoAllData(int mode){
		VideoChange vc=new VideoChange();
		String modeURL=vc.change(mode-1);
		List<VideoDTO> list=new ArrayList<VideoDTO>();
		try{
			Document doc=Jsoup.connect(modeURL).get();
			//System.out.println(doc);
			/*Elements titleElem=doc.select("a.yt-uix-sessionlink.yt-uix-tile-link.yt-ui-ellipsis.yt-ui-ellipsis-2");
			Elements imageElem=doc.select("span.yt-thumb-simple img");
			Elements urlElem=doc.select("a.yt-uix-sessionlink.yt-pl-thumb-link");*/
			Elements titleElem=doc.select("h4.yt-ui-ellipsis.yt-ui-ellipsis-2");
			Elements imageElem=doc.select("span.yt-thumb-clip img");
			Elements urlElem=doc.select("a.yt-uix-sessionlink.spf-link.playlist-video.clearfix.spf-link");
			//배트맨 대 슈퍼맨: 저스티스의 시작 81.1% 2016.03.24 개봉 24,348 74% http://img.cgv.co.kr/Movie/Thumbnail/Poster/000078/78391/78391_185.jpg No.1 12세 이상
			for(int i=0;i<titleElem.size();i++){
				Element telem=titleElem.get(i);
				Element ielem=imageElem.get(i);
				Element uelem=urlElem.get(i);
				String url=uelem.attr("href");
				String img=ielem.attr("src");
				if(img.substring(0,5).equals("https")){
				img=ielem.attr("data-thumb");
				System.out.println((i+1)+"번째 title "+telem.text()+" Image "+img+" 강의URL "+url);
				}
				VideoDTO d=new VideoDTO();
				d.setNo(i+1);
				d.setTitle(telem.text());
				d.setImage(img);
				d.setLectureurl(url);
				list.add(d);
			}
		}catch(Exception ex){
			System.out.println(ex.getMessage());
		}
		return list;
	}
}
