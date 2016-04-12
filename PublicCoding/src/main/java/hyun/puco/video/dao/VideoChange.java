package hyun.puco.video.dao;

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
			 "https://www.youtube.com/results?q=java+%ED%94%84%EB%A1%9C%EA%B7%B8%EB%9E%98%EB%B0%8D&sp=CAMSAhAD",//홈
			 "../member/join.jsp", //자바강의
			 "../member/joinyes.jsp",//C/C++
			 "../databoard/list.jsp",//JSP
			 "../databoard/insert.jsp",//Oracle
			 "../databoard/content.jsp",//Spring
			 "../databoard/update.jsp",//Html
			 "../movie/list.jsp",//CSS
			 "../movie/detail.jsp"//JavaScript
	   };
	   public static String change(int no)
	   {
		   return url[no];
	   }
}
