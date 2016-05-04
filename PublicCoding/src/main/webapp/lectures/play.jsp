<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE HTML>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- Optional theme -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<!-- Latest compiled and minified JavaScript -->
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<!--[if lte IE 8]><script src="assets/js/ie/html5shiv.js"></script><![endif]-->
<link rel="stylesheet" href="assets/css/sujin-main.css" />
<!--[if lte IE 9]><link rel="stylesheet" href="assets/css/ie9.css" /><![endif]-->
<!--[if lte IE 8]><link rel="stylesheet" href="assets/css/ie8.css" /><![endif]-->

<!-- newScripts -->
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script src="resources/bootstrap-3.3.2/js/tab.js"></script>

<script>
        		$('#myTab a').click(function (e) {
        		  	e.preventDefault()
        		  	$(this).tab('show')
        		})
        		
</script>
</head>
<body>
<section>
<article>
			<div class="container">
				<div class="row">
					<div class="col-sm-3 col-md-3">
						<div class="panel-group" id="accordion">
							<c:forEach var="d" items="${dlist }">
								<div class="panel panel-default">
									<div class="panel-heading">
										<h4 class="panel-title">
											<a data-toggle="collapse" data-parent="#accordion"
												href="#collapse${d.dno}"> 
											<c:if test="${d.dno == 1 }">
													<i class="fa fa-code"></i>${d.dname }</a>
											</c:if>
											<c:if test="${d.dno == 2 }">
												<i class="fa fa-database"></i>${d.dname }</a>
											</c:if>
											<c:if test="${d.dno == 3 }">
												<i class="fa fa-css3"></i>${d.dname }</a>
											</c:if>
										</h4>
									</div>


									<div id="collapse${d.dno}" class="panel-collapse collapse in">
										<div class="panel-body">
											<table class="table">
												<c:forEach var="sl" items="${slist }">
													<c:forEach var="s" items="${sl }">
														<c:if test="${d.dno == s.dno }">
															<tr>
																<td><a href="courseGroup.do?sno=${s.sno }">${s.sname }</a></td>
															</tr>
														</c:if>
													</c:forEach>
												</c:forEach>
											</table>
										</div>
									</div>

								</div>
							</c:forEach>

						</div>
					</div>
				</div>
				<!-- Content -->
				<section id="content">
					<div class="row">
						<div class="col-xs-10 col-sm-7 col-md-7">
							<div class="embed-responsive embed-responsive-16by9">
							<!-- 값을 단일로는 전혀 못 받고 있다. clist를 for문으로 어떻게 돌릴지 궁리하거나, 단일값을 줄 방법을 찾아야함 -->
								<!-- &amp;showinfo=0 -->
									<iframe class="embed-responsive-item" width="560" height="315" 
									src="https://www.youtube.com/embed/${contenturl}" frameborder="0" allowfullscreen></iframe>
							</div>
						</div>


						<!-- 수강 중 && 로그인 후  -->
						<c:if test="${sessionScope.id != null }">

							<div class="col-xs-10 col-sm-5 col-md-5">
								<table class="table">
									<c:forEach var="i" items="${clist }">
										<tr>
											<td><span class="glyphicon glyphicon-play-circle" aria-hidden="true"></span></td>
											<td>${i }강</td>
											<td><a href="?gno=${gno}&cno=${i.cno}" target="_self">${i.cname }</a></td>
										</tr>
									</c:forEach>
									<!-- <tr>
									<td>
									<span class="glyphicon glyphicon-play-circle" aria-hidden="true"></span>
									</td>
									<td>2강 </td>
									<td><a href="" target="_self">개발 환경 설정</a></td>
									
								</tr>
								<tr>
									<td>
									<span class="glyphicon glyphicon-play-circle" aria-hidden="true"></span>
									</td>
									<td>3강 </td>
									<td><a href="" target="_self"> JSP 맛보기</a> </td>
									
								</tr>
								<tr>
									<td>
									<span class="glyphicon glyphicon-play-circle" aria-hidden="true"></span>
									</td>
									<td>4강 </td>
									<td><a href="" target="_self">Servlet 맛보기</a> </td>
									
								</tr>
								<tr>
									<td>
									<span class="glyphicon glyphicon-play-circle" aria-hidden="true"></span>
									</td>
									<td>5강 </td>
									<td><a href="" target="_self">Servlet 본격적으로 살펴보기 1</a> </td>
								
								</tr>-->

								</table>
							</div>
						</c:if>
						<!-- 수강 전 || 로그인 전  -->
						<c:if test="${sessionScope.id == null }">

							<p>
								<a href="#" data-toggle="modal" data-target="#login" id="asking" class="button large special">
									<span class="glyphicon glyphicon-play"></span>START COURSE
								</a>
							<div class="col-xs-10 col-sm-5 col-md-5">
								<div class="row">

									<div id="class_info">
										<p>
										<table class="table">
											<tr>
												<td width=70>강의</td>
												<td width=100>120</td>
												<td></td>
											</tr>
											<tr>
												<td>시간</td>
												<td>60</td>
												<td></td>
											</tr>
											<tr>
												<td>강사</td>
												<td>누군가</td>
												<td></td>
											</tr>
											<tr>
												<td>구분</td>
												<td>JSP</td>
												<td></td>
											</tr>
										</table>
										</p>
									</div>
								</div>
							</div>
						</c:if>

					</div>
				</section>
				<div>

					<!-- Nav tabs -->
					<div class="col-xs-12 col-sm-12 col-md-12">
						<ul class="nav nav-tabs" id="myTab" role="tablist">
							<li role="presentation" class="active"><a href="#home"
								aria-controls="home" role="tab" data-toggle="tab">강의소개</a></li>
							<li role="presentation"><a href="#profile"
								aria-controls="profile" role="tab" data-toggle="tab">강의평가</a></li>
							<li role="presentation"><a href="#messages"
								aria-controls="messages" role="tab" data-toggle="tab">연관강의</a></li>
							<li role="presentation"><a href="#settings"
								aria-controls="settings" role="tab" data-toggle="tab">연관게시글</a></li>
							<li role="presentation"><a href="#board"
								aria-controls="board" role="tab" data-toggle="tab">실습링크</a></li>
						</ul>
					</div>

					<!-- Tab panes -->
					<div class="col-xs-12 col-sm-12 col-md-12">
						<div class="tab-content">
							<div role="tabpanel" class="tab-pane active" id="home">
								<p>
								<h5>${j.title }</h5>
								</p>
								<p>
									강의 내용 : <br> 이번 강의는 JSP 맛보기 편입니다.<br> PC로 보실때는
									www.wiz.center/tag/jsp, http://www.youtube.com/wizcenterseoul
									또는 위의 동영상에서 HD 동영상을 보시는 것이 좋습니다.<br> 1080p로 설정해서 보시면 글자가 잘
									보입니다. 오른쪽 하단 톱니모양에서 1080p를 선택하세요.<br> 그리고 모바일로 보실 때에는 유튜브
									앱으로 보십시오. 그래야 글자가 잘 보입니다.<br>
								</p>
								<p>PPT 파일, 소스파일은 첨부파일은 www.wiz.center/tag/jsp을 참조하세요.</p>
							</div>

							<div role="tabpanel" class="tab-pane" id="profile">
								<p>
								<h5>강의 리뷰</h5>
								</p>
								<%-- <jsp:include page="${review.jsp }"></jsp:include> --%>
								<div class="well well-sm">
									<div class="row">

										<div class="col-xs-12 col-md-6 text-center">
											<h1 class="rating-num">4.0</h1>
											<div class="rating">
												<span class="glyphicon glyphicon-star"></span><span
													class="glyphicon glyphicon-star"> </span><span
													class="glyphicon glyphicon-star"></span><span
													class="glyphicon glyphicon-star"> </span><span
													class="glyphicon glyphicon-star-empty"></span>
											</div>
											<div>
												<span class="glyphicon glyphicon-user"></span>1,050,008
												total
											</div>
										</div>

										<div class="col-xs-12 col-md-6">
											<div class="row rating-desc">

												<div class="col-xs-3 col-md-3 text-right">
													<span class="glyphicon glyphicon-star"></span>5
												</div>
												<div class="col-xs-8 col-md-9">
													<div class="progress progress-striped">
														<div class="progress-bar progress-bar-success"
															role="progressbar" aria-valuenow="20" aria-valuemin="0"
															aria-valuemax="100" style="width: 80%">
															<span class="sr-only">80%</span>
														</div>
													</div>
												</div>
												<!-- end 5 -->
												<div class="col-xs-3 col-md-3 text-right">
													<span class="glyphicon glyphicon-star"></span>4
												</div>
												<div class="col-xs-8 col-md-9">
													<div class="progress">
														<div class="progress-bar progress-bar-success"
															role="progressbar" aria-valuenow="20" aria-valuemin="0"
															aria-valuemax="100" style="width: 60%">
															<span class="sr-only">60%</span>
														</div>
													</div>
												</div>
												<!-- end 4 -->
												<div class="col-xs-3 col-md-3 text-right">
													<span class="glyphicon glyphicon-star"></span>3
												</div>
												<div class="col-xs-8 col-md-9">
													<div class="progress">
														<div class="progress-bar progress-bar-info"
															role="progressbar" aria-valuenow="20" aria-valuemin="0"
															aria-valuemax="100" style="width: 40%">
															<span class="sr-only">40%</span>
														</div>
													</div>
												</div>
												<!-- end 3 -->
												<div class="col-xs-3 col-md-3 text-right">
													<span class="glyphicon glyphicon-star"></span>2
												</div>
												<div class="col-xs-8 col-md-9">
													<div class="progress">
														<div class="progress-bar progress-bar-warning"
															role="progressbar" aria-valuenow="20" aria-valuemin="0"
															aria-valuemax="100" style="width: 20%">
															<span class="sr-only">20%</span>
														</div>
													</div>
												</div>
												<!-- end 2 -->
												<div class="col-xs-3 col-md-3 text-right">
													<span class="glyphicon glyphicon-star"></span>1
												</div>
												<div class="col-xs-8 col-md-9">
													<div class="progress">
														<div class="progress-bar progress-bar-danger"
															role="progressbar" aria-valuenow="80" aria-valuemin="0"
															aria-valuemax="100" style="width: 15%">
															<span class="sr-only">60%</span>
														</div>
													</div>
												</div>
												<!-- end 1 -->
											</div>
											<!-- end row -->
										</div>
									</div>
								</div>

								<div class="col-xs-12 col-md-6">
									<div class="well well-sm">
										<div class="text-right">
											<a class="btn btn-success btn-green" href="#reviews-anchor"
												id="open-review-box">Leave a Review</a>
										</div>
										<div class="row" id="post-review-box" style="display: none;">
											<div class="col-md-12">
												<form accept-charset="UTF-8" action="" method="post">
													<input id="ratings-hidden" name="rating" type="hidden">
													<textarea class="form-control animated" cols="50"
														id="new-review" name="comment"
														placeholder="Enter your review here..." rows="5"></textarea>

													<div class="text-right">
														<div class="stars starrr" data-rating="0"></div>
														<a class="btn btn-danger btn-sm" href="#"
															id="close-review-box"
															style="display: none; margin-right: 10px;"> <span
															class="glyphicon glyphicon-remove"></span>Cancel
														</a>
														<button class="btn btn-success btn-lg" type="submit">Save</button>
													</div>
												</form>
											</div>
										</div>
									</div>
								</c:forEach>
							</div>
						</div>

						<div role="tabpanel" class="tab-pane" id="settings">
							<h5>연관 게시글</h5>
						</div>

						<div role="tabpanel" class="tab-pane" id="board">
							<div class="row">
								<div class="col-xs-10 col-sm-7 col-md-7">

									<table class="table">
										<tr>
											<th>사이트명</th>
											<th>링크</th>
											<th>종류</th>
										</tr>
										<tr>
											<td>JSFiddle</td>
											<td><a href="https://jsfiddle.net/" target="_blank">http://jsfiddle.net</a></td>
											<td>html, css, javascript..</td>
										</tr>
										<tr>
											<td>Ideone.com</td>
											<td><a href="https://jsfiddle.net/" target="_blank">http://jsfiddle.net</a></td>
											<td>html, css, javascript..</td>
										</tr>
										<tr>
											<td>Compile online</td>
											<td><a href="https://jsfiddle.net/" target="_blank">http://jsfiddle.net</a></td>
											<td>html, css, javascript..</td>
										</tr>
										<tr>
											<td>CodeChef</td>
											<td><a href="https://jsfiddle.net/" target="_blank">http://jsfiddle.net</a></td>
											<td>html, css, javascript..</td>
										</tr>
									</table>

								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
</article>
</section>
	<!-- Scripts -->
	<script src="assets/js/jquery.min.js"></script>
	<script src="assets/js/jquery.scrolly.min.js"></script>
	<script src="assets/js/jquery.dropotron.min.js"></script>
	<script src="assets/js/jquery.scrollex.min.js"></script>
	<script src="assets/js/skel.min.js"></script>
	<script src="assets/js/util.js"></script>
	<!--[if lte IE 8]><script src="assets/js/ie/respond.min.js"></script><![endif]-->
	<script src="assets/js/main.js"></script>
	<script type="text/javascript">
	(function(e){var t,o={className:"autosizejs",append:"",callback:!1,resizeDelay:10},i='<textarea tabindex="-1" style="position:absolute; top:-999px; left:0; right:auto; bottom:auto; border:0; padding: 0; -moz-box-sizing:content-box; -webkit-box-sizing:content-box; box-sizing:content-box; word-wrap:break-word; height:0 !important; min-height:0 !important; overflow:hidden; transition:none; -webkit-transition:none; -moz-transition:none;"/>',n=["fontFamily","fontSize","fontWeight","fontStyle","letterSpacing","textTransform","wordSpacing","textIndent"],s=e(i).data("autosize",!0)[0];s.style.lineHeight="99px","99px"===e(s).css("lineHeight")&&n.push("lineHeight"),s.style.lineHeight="",e.fn.autosize=function(i){return this.length?(i=e.extend({},o,i||{}),s.parentNode!==document.body&&e(document.body).append(s),this.each(function(){function o(){var t,o;"getComputedStyle"in window?(t=window.getComputedStyle(u,null),o=u.getBoundingClientRect().width,e.each(["paddingLeft","paddingRight","borderLeftWidth","borderRightWidth"],function(e,i){o-=parseInt(t[i],10)}),s.style.width=o+"px"):s.style.width=Math.max(p.width(),0)+"px"}function a(){var a={};if(t=u,s.className=i.className,d=parseInt(p.css("maxHeight"),10),e.each(n,function(e,t){a[t]=p.css(t)}),e(s).css(a),o(),window.chrome){var r=u.style.width;u.style.width="0px",u.offsetWidth,u.style.width=r}}function r(){var e,n;t!==u?a():o(),s.value=u.value+i.append,s.style.overflowY=u.style.overflowY,n=parseInt(u.style.height,10),s.scrollTop=0,s.scrollTop=9e4,e=s.scrollTop,d&&e>d?(u.style.overflowY="scroll",e=d):(u.style.overflowY="hidden",c>e&&(e=c)),e+=w,n!==e&&(u.style.height=e+"px",f&&i.callback.call(u,u))}function l(){clearTimeout(h),h=setTimeout(function(){var e=p.width();e!==g&&(g=e,r())},parseInt(i.resizeDelay,10))}var d,c,h,u=this,p=e(u),w=0,f=e.isFunction(i.callback),z={height:u.style.height,overflow:u.style.overflow,overflowY:u.style.overflowY,wordWrap:u.style.wordWrap,resize:u.style.resize},g=p.width();p.data("autosize")||(p.data("autosize",!0),("border-box"===p.css("box-sizing")||"border-box"===p.css("-moz-box-sizing")||"border-box"===p.css("-webkit-box-sizing"))&&(w=p.outerHeight()-p.height()),c=Math.max(parseInt(p.css("minHeight"),10)-w||0,p.height()),p.css({overflow:"hidden",overflowY:"hidden",wordWrap:"break-word",resize:"none"===p.css("resize")||"vertical"===p.css("resize")?"none":"horizontal"}),"onpropertychange"in u?"oninput"in u?p.on("input.autosize keyup.autosize",r):p.on("propertychange.autosize",function(){"value"===event.propertyName&&r()}):p.on("input.autosize",r),i.resizeDelay!==!1&&e(window).on("resize.autosize",l),p.on("autosize.resize",r),p.on("autosize.resizeIncludeStyle",function(){t=null,r()}),p.on("autosize.destroy",function(){t=null,clearTimeout(h),e(window).off("resize",l),p.off("autosize").off(".autosize").css(z).removeData("autosize")}),r())})):this}})(window.jQuery||window.$);

	var __slice=[].slice;(function(e,t){var n;n=function(){function t(t,n){var r,i,s,o=this;this.options=e.extend({},this.defaults,n);
	this.$el=t;s=this.defaults;for(r in s){i=s[r];if(this.$el.data(r)!=null){this.options[r]=this.$el.data(r)}}this.createStars();
	this.syncRating();this.$el.on("mouseover.starrr","span",function(e){return o.syncRating(o.$el.find("span").index(e.currentTarget)+1)});
	this.$el.on("mouseout.starrr",function(){return o.syncRating()});this.$el.on("click.starrr","span",function(e)
	{return o.setRating(o.$el.find("span").index(e.currentTarget)+1)});this.$el.on("starrr:change",this.options.change)}
	t.prototype.defaults={rating:void 0,numStars:5,change:function(e,t){}};t.prototype.createStars=function(){var e,t,n;n=[];
	for(e=1,t=this.options.numStars;1<=t?e<=t:e>=t;1<=t?e++:e--){n.push(this.$el.append("<span class='glyphicon .glyphicon-star-empty'></span>"))}
	return n};t.prototype.setRating=function(e){if(this.options.rating===e){e=void 0}this.options.rating=e;this.syncRating();
	return this.$el.trigger("starrr:change",e)};t.prototype.syncRating=function(e){var t,n,r,i;e||(e=this.options.rating);
	if(e){for(t=n=0,i=e-1;0<=i?n<=i:n>=i;t=0<=i?++n:--n){this.$el.find("span").eq(t).removeClass("glyphicon-star-empty").addClass("glyphicon-star")}}
	if(e&&e<5){for(t=r=e;e<=4?r<=4:r>=4;t=e<=4?++r:--r){this.$el.find("span").eq(t).removeClass("glyphicon-star").addClass("glyphicon-star-empty")}}
	if(!e){return this.$el.find("span").removeClass("glyphicon-star").addClass("glyphicon-star-empty")}};
	return t}();return e.fn.extend({starrr:function(){var t,r;r=arguments[0],t=2<=arguments.length?__slice.call(arguments,1):[];
	return this.each(function(){var i;i=e(this).data("star-rating");if(!i){e(this).data("star-rating",i=new n(e(this),r))}
	if(typeof r==="string"){return i[r].apply(i,t)}})}})})(window.jQuery,window);$(function(){return $(".starrr").starrr()})

		$(function(){

		  $('#new-review').autosize({append: "\n"});

		  var reviewBox = $('#post-review-box');
		  var newReview = $('#new-review');
		  var openReviewBtn = $('#open-review-box');
		  var closeReviewBtn = $('#close-review-box');
		  var ratingsField = $('#ratings-hidden');

		  openReviewBtn.click(function(e)
		  {
		    reviewBox.slideDown(400, function()
		      {
		        $('#new-review').trigger('autosize.resize');
		        newReview.focus();
		      });
		    openReviewBtn.fadeOut(100);
		    closeReviewBtn.show();
		  });

		  closeReviewBtn.click(function(e)
		  {
		    e.preventDefault();
		    reviewBox.slideUp(300, function()
		      {
		        newReview.focus();
		        openReviewBtn.fadeIn(200);
		      });
		    closeReviewBtn.hide();
		    
		  });

		  $('.starrr').on('starrr:change', function(e, value){
		    ratingsField.val(value);
		  });
		});
		</script>
	<script>
        		$('#myTab a').click(function (e) {
        		  	e.preventDefault()
        		  	$(this).tab('show')
        		})
        		
        	</script>
</body>
</html>