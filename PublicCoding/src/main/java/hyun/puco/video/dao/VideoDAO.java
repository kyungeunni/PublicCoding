package hyun.puco.video.dao;
import java.util.*;
import org.jsoup.Jsoup;
import org.jsoup.select.*;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;

import java.io.*;
import java.net.*;
import hyun.puco.video.dao.*;
public class VideoDAO {
	public static void main(String[] arg){
		/*VideoDAO m=new VideoDAO();
		m.movieAllData();*/
	}
	public List<VideoDTO> movieAllData(int mode)
	{
		VideoChange vc=new VideoChange();
		String modeURL=vc.change(mode);
		List<VideoDTO> list=new ArrayList<VideoDTO>();
		try
		{
			Document doc=Jsoup.connect(modeURL).get();
			//System.out.println(doc);
			Elements titleElem=doc.select("div.box-contents strong.title");
			Elements imageElem=doc.select("div.box-image a span.thumb-image img");
			Elements percentElem=doc.select("div.box-contents div.score strong.percent span");
			Elements likeElem=doc.select("div.box-contents span.like span.count strong i");
			Elements starElem=doc.select("div.box-contents span.percent");
			Elements dayElem=doc.select("div.box-contents span.txt-info strong");
			Elements rankElem=doc.select("div.box-image strong.rank");
			Elements gradeElem=doc.select("div.box-image a span.thumb-image span");
			//배트맨 대 슈퍼맨: 저스티스의 시작 81.1% 2016.03.24 개봉 24,348 74% http://img.cgv.co.kr/Movie/Thumbnail/Poster/000078/78391/78391_185.jpg No.1 12세 이상
			for(int i=0;i<titleElem.size();i++){
				Element telem=titleElem.get(i);
				Element pelem=percentElem.get(i);
				Element delem=dayElem.get(i);
				Element lelem=likeElem.get(i);
				Element selem=starElem.get(i);
				Element ielem=imageElem.get(i);
				Element relem=rankElem.get(i);
				Element gelem=gradeElem.get(i);
				String img=ielem.attr("src");//속성값 읽을때 사용
				/*System.out.println(telem.text()+" "+pelem.text()+" "+delem.text()
				+" "+lelem.text()+" "+selem.text()+" "+img+" "+relem.text()+" "+gelem.text());
				Thread.sleep(5000);*/
				VideoDTO d=new VideoDTO();
				d.setNo(i+1);
				d.setTitle(telem.text());
				d.setReserve(Double.parseDouble(pelem.text().substring(0, pelem.text().lastIndexOf('%'))));
				d.setImage(img);
				d.setLike(Integer.parseInt(lelem.text().replace(",","")));//replace ,를 공백으로 바꿈
				d.setRegdate(delem.text().substring(0, delem.text().indexOf("개봉")));
				d.setStar(Integer.parseInt(selem.text().substring(0, selem.text().lastIndexOf('%'))));
				d.setRank(Integer.parseInt(relem.text().substring(3)));
				d.setGrade(gelem.text());
				list.add(d);
			}
		}catch(Exception ex){
			System.out.println(ex.getMessage());
		}
		return list;
	}
}
