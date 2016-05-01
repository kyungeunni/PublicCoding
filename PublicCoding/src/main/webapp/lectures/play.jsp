<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
</head>

	<body>
				<div class="container">
					<div class="page-header" style="margin-top: 100px">
 					 <h1 style="font: 20px 맑은 고딕">신입 SW인력을 위한 실전 JSP Servlet 동영상 과정 <small>Subtext for header</small></h1>
					</div>
				<!-- Content -->
					<div class="row">
						<div class="col-xs-10 col-sm-7 col-md-7">
					<section id="content">
							<div class="embed-responsive embed-responsive-16by9">
  							<iframe class="embed-responsive-item" src="https://www.youtube.com/embed/${url }" frameborder="0" allowfullscreen></iframe>
							</div>
						</div>
						<div class="col-xs-10 col-sm-5 col-md-5">
							<table class="table">
								<tr>
									<td>
									<span class="glyphicon glyphicon-play-circle" aria-hidden="true"></span>
									</td>
									<td>1강 </td>
									<td><a href="" target="_self">웹프로그래밍</a></td>
									<td>23:41</td>
								</tr>
								<tr>
									<td>
									<span class="glyphicon glyphicon-play-circle" aria-hidden="true"></span>
									</td>
									<td>2강 </td>
									<td><a href="" target="_self">개발 환경 설정</a></td>
									<td>23:41</td>
								</tr>
								<tr>
									<td>
									<span class="glyphicon glyphicon-play-circle" aria-hidden="true"></span>
									</td>
									<td>3강 </td>
									<td><a href="" target="_self"> JSP 맛보기</a> </td>
									<td>23:41</td>
								</tr>
								<tr>
									<td>
									<span class="glyphicon glyphicon-play-circle" aria-hidden="true"></span>
									</td>
									<td>4강 </td>
									<td><a href="" target="_self">Servlet 맛보기</a> </td>
									<td>23:41</td>
								</tr>
								<tr>
									<td>
									<span class="glyphicon glyphicon-play-circle" aria-hidden="true"></span>
									</td>
									<td>5강 </td>
									<td><a href="" target="_self">Servlet 본격적으로 살펴보기 1</a> </td>
									<td>23:41</td>
								</tr>
							</table>
						</div>
					</section>
					</div>
				<div>
  					<!-- Nav tabs -->
  					<ul class="nav nav-tabs" id="myTab" role="tablist">
   						<li role="presentation" class="active"><a href="#home" aria-controls="home" role="tab" data-toggle="tab">강의소개</a></li>
    					<li role="presentation"><a href="#profile" aria-controls="profile" role="tab" data-toggle="tab">강의평가</a></li>
    					<li role="presentation"><a href="#messages" aria-controls="messages" role="tab" data-toggle="tab">연관강의</a></li>
    					<li role="presentation"><a href="#settings" aria-controls="settings" role="tab" data-toggle="tab">연관게시글</a></li>
    					<li role="presentation"><a href="#board" aria-controls="board" role="tab" data-toggle="tab">실습링크</a></li>
  					
  					</ul>

 					<!-- Tab panes -->
  					<div class="tab-content">
    				<div role="tabpanel" class="tab-pane active" id="home">
    					<p><h5>강의명 : 신입SW인력을 위한 실전 JSP Servlet 동영상과정 - 제 03강 JSP 맛보기</h5></p>
						<p>강의 내용 : <br>
							이번 강의는 JSP 맛보기 편입니다.<br>
							PC로 보실때는 www.wiz.center/tag/jsp, http://www.youtube.com/wizcenterseoul 또는 위의 동영상에서 HD 동영상을 보시는 것이 좋습니다.<br>
							1080p로 설정해서 보시면 글자가 잘 보입니다. 오른쪽 하단 톱니모양에서 1080p를 선택하세요.<br>
							그리고 모바일로 보실 때에는 유튜브 앱으로 보십시오. 그래야 글자가 잘 보입니다.<br></p>
						<p>PPT 파일, 소스파일은 첨부파일은 www.wiz.center/tag/jsp을 참조하세요.</p></div>
    				<div role="tabpanel" class="tab-pane" id="profile"><p><h5>강의 평가</h5></p> </div>
    				<div role="tabpanel" class="tab-pane" id="messages"><p><h5>연관강의</h5></p>
    				<div class="row">
					  <div class="col-xs-5 col-sm-4 col-md-3">
					    <div class="thumbnail">
					      <img src="..." alt="...">
					      <div class="caption">
					        <h3>Thumbnail label</h3>
					        <p>내..용...</p>
					      </div>
					    </div>
					  </div>
					  <div class="col-xs-5 col-sm-4 col-md-3">
					    <div class="thumbnail">
					      <img src="..." alt="...">
					      <div class="caption">
					        <h3>Thumbnail label</h3>
					        <p>내..용...</p>
					      </div>
					    </div>
					  </div>
					  <div class="col-xs-5 col-sm-4 col-md-3">
					    <div class="thumbnail">
					      <img src="..." alt="...">
					      <div class="caption">
					        <h3>Thumbnail label</h3>
					        <p>내..용...</p>
					      </div>
					    </div>
					  </div>
					</div>
    				</div>
    				<div role="tabpanel" class="tab-pane" id="settings"><p><h5>연관 게시글 </h5></p></div>
    				<div role="tabpanel" class="tab-pane" id="board"><p><h5>실습 </h5></p></div>
  					</div>
				</div>
				
			<script src="http://code.jquery.com/jquery-latest.js"></script>
        	<script src="assets/bootstrap-3.3.2/js/tab.js"></script>
        	<script>
        		$('#myTab a').click(function (e) {
        		  	e.preventDefault()
        		  	$(this).tab('show')
        		})
        	</script>
		</div>
	</body>
</html>