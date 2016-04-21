package com.puco.lectures.dao;

public class VideoChange {
	/*<a href="videolist.do?mode=2" class="list-group-item">-Java-</a>
    <a href="videolist.do?mode=3" class="list-group-item">-C/C++-</a>
    <a href="videolist.do?mode=4" class="list-group-item">-JSP-</a>
    <a href="videolist.do?mode=5" class="list-group-item">-Oracle-</a>
    <a href="videolist.do?mode=6" class="list-group-item">-Spring-</a>
    <a href="videolist.do?mode=7" class="list-group-item">-HTML-</a>
    <a href="videolist.do?mode=8" class="list-group-item">-CSS-</a>
    <a href="videolist.do?mode=9" class="list-group-item">-JavaScript-</a>*/
	private static String[] url={
			 "https://www.youtube.com/results?q=%EC%9E%90%EB%B0%94+%ED%94%84%EB%A1%9C%EA%B7%B8%EB%9E%98%EB%B0%8D&sp=EgIQAw%253D%253D",//홈
			 "https://www.youtube.com/results?q=%EC%9E%90%EB%B0%94+%ED%94%84%EB%A1%9C%EA%B7%B8%EB%9E%98%EB%B0%8D&sp=EgIQAw%253D%253D", //자바강의
			 "https://www.youtube.com/results?q=c+%EC%96%B8%EC%96%B4&sp=EgIQAw%253D%253D",//C/C++
			 "https://www.youtube.com/results?sp=EgIQAw%253D%253D&q=JSP+%EA%B0%95%EC%A2%8C",//JSP
			 "https://www.youtube.com/results?q=%EC%98%A4%EB%9D%BC%ED%81%B4+sql+%EA%B0%95%EC%A2%8C&sp=EgIQAw%253D%253D",//Oracle
			 "https://www.youtube.com/results?sp=EgIQAw%253D%253D&q=%EC%8A%A4%ED%94%84%EB%A7%81+%EA%B0%95%EC%9D%98",//Spring
			 "https://www.youtube.com/results?q=html5+%EA%B0%95%EC%A2%8C&sp=EgIQAw%253D%253D",//Html
			 "https://www.youtube.com/results?sp=EgIQAw%253D%253D&q=css3+%EA%B0%95%EC%A2%8C",//CSS
			 "https://www.youtube.com/results?sp=EgIQAw%253D%253D&q=%EC%9E%90%EB%B0%94+%EC%8A%A4%ED%81%AC%EB%A6%BD%ED%8A%B8"//JavaScript
	   };
	   public static String change(int no){
		   return url[no];
	   }
}
