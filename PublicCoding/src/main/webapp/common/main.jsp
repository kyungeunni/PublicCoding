<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>PUBLIC CODING | 모두가 즐기는 코딩</title>
<link rel="stylesheet"	href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.5/css/bootstrap.min.css">
<link rel="stylesheet"	href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.5/css/bootstrap-theme.min.css">
    <link rel="stylesheet" href="resources/input_tags/bootstrap-tagsinput.css">
    <link rel="stylesheet"	href="https://cdnjs.cloudflare.com/ajax/libs/rainbow/1.2.0/themes/github.css">
    <link rel="stylesheet" href="resources/input_tags/app.css">	
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.1/css/font-awesome.min.css">
<link type="text/css" rel="stylesheet" href="assets/css/default.css">


<!-- ////////////////////////////////////// LOGIN ACTION /////////////////////////// -->

<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
	$(function() {
		$('#logBtn').click(function() {
			var id = $('#id').val();
			if (id.trim() == "") {
				$('#id').focus();
				return;
			}
			var pwd = $('#pwd').val();
			if (pwd.trim() == "") {
				$('#pwd').focus();
				return;
			}
			$('#logForm').submit();
		});
		$('#logoutBtn').click(function() {
			$('#logoutForm').submit();
		});
	});
</script>
<!-- ////////////////////////////////////////////////////////////////////////////// -->



</head>
<body>

	<header>
		<h1>
			<a href="main.do"> PUBLIC CODING</a>
		</h1>

		<ul id="gnb">
			<li class="dropdown"><a class="dropdown-toggle"
				data-toggle="dropdown" href="lectureMain.do"><i class="fa fa-book"></i>온라인 강의</a>
				<ul class="dropdown-menu">
					<li><a href="scategory.do?sno=1">Language</a></li>
					<li><a href="scategory.do?sno=4">Database</a></li>
					<li><a href="scategory.do?sno=6">Web</a></li>
				</ul></li>
			<li class="dropdown"><a class="dropdown-toggle"
				data-toggle="dropdown" href="#"><i class="fa fa-retweet"></i>오프라인
					스터디</a>

					<ul class="dropdown-menu">

						<li><a href="onoff.do">지역별</a></li>
						<li><a href="onoff.do">주제별</a></li>

					</ul>
				</li>


			<li class="dropdown"><a class="dropdown-toggle"
				data-toggle="dropdown" href="#"><i class="fa fa-file-text-o"></i>게시판</a>
				<ul class="dropdown-menu">
					<li><a href="qnaboard.do">Q&A 게시판</a></li>
					<li><a href="free.do">자유 게시판</a></li>
				</ul></li>

			<!-- 회원가입-->

			<c:if test="${sessionScope.id==null }">
				<li class="joinok" data-target="#join">
				
				<a href="join.do"><i class="fa fa-user"></i>회원가입</a></li>

				<li class="logininok" data-toggle="modal" data-target="#login"><a
					href="#"><i class="fa fa-sign-in"></i>로그인</a></li>
			</c:if>

			<c:if test="${sessionScope.id!=null }">

				<li class="dropdown" id="loginok">
					<a class="dropdown-toggle" data-toggle="dropdown" href="#">
						<img src="resources/userprofiles/${sessionScope.mimageurl }"
								alt="" width="29" height="29" class="img-rounded">

						 ${sessionScope.id}</a>

					<ul class="dropdown-menu">
						<li><a href="userMain.do?mno=${sessionScope.mno }"><i class="fa fa-pagelines fa-fw" aria-hidden="true"></i>My Page</a></li>
						<li><a href="user_update.do?mno=${sessionScope.mno }"><i class="fa fa-pencil fa-fw" aria-hidden="true"></i>개인정보수정</a></li>
						<li>
							<a href="signout.do" data-target="#logout" id="logoutBtn">
							<i class="fa fa-sign-out fa-fw"></i>로그아웃</a>
						</li>
					</ul>
			   </li>
			</c:if>
		</ul>

		<%-- <div class="modal fade" id="join" tabindex="-1" role="dialog"
			aria-labelledby="modalLabel" aria-hidden="true">

			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">
							<span aria-hidden="true"></span><span class="sr-only">Close</span>
						</button>
						<h4 class="modal-title" id="lineModalLabel">
							<center>PUCO의 회원이 되어 주세요</center>
						</h4>
					</div>
					<div class="modal-body">

						<!-- content goes here -->
						<form class="form-horizontal ng-pristine ng-valid ng-valid-email"
							role="form">

							<div class="row">
								<div class="col-sm-6 col-xs-12" style="margin-bottom: 10px;">
									<label for="firstname">아이디</label> <input type="text"
										class="form-control ng-pristine ng-untouched ng-valid"
										id="firstName" placeholder="아이디">
								</div>
								<div class="col-sm-6 col-xs-12" style="margin-bottom: 10px;">
									<label for="lastName">비밀번호</label> <input type="password"
										class="form-control ng-pristine ng-untouched ng-valid"
										id="password" placeholder="비밀번호">
								</div>
							</div>

							<div class="row onboarding-form-group">
								<div class="col-sm-12 col-xs-12">
									<div>
										<label for="email">E-mail</label> 
										<input type="email"
											class="form-control ng-pristine ng-untouched ng-valid ng-valid-email"
											id="email" placeholder="E-mail">
									</div>
								</div>
							</div>
							<p>
							<p>
							<div class="row">
								<div class="col-mm-6 col-xs-12">
									<button type="submit" class="btn btn-block btn-primary">회원가입</button>
								</div>
							</div>
						</form>

						<div class="row row-gap-medium ng-scope">
							<br>

							<p class="col-xs-6 col-xs-offset-3 bold text-center">
								이미 가입 하셨나요? <br> <br> <input type="button"
									class="btn btn-block btn-primary" data-toggle="modal"
									data-target="#login" data-dismiss="modal" value="로그인">
							</p>
						</div>

					</div>
				</div>
			</div>
		</div>


		<!-- 원래 main 화면에 있는 기본 로그인 부분 시작 -->
		<%-- <div class="modal fade" id="login" tabindex="-1" role="dialog"
			aria-labelledby="modalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">
							<span aria-hidden="true"></span><span class="sr-only">Close</span>
						</button>
						<h4 class="modal-title" id="lineModalLabel">
							<center>안녕하세요. PUCO 입니다.</center>
						</h4>
					</div>
					<div class="modal-body">
						<!-- content goes here -->
						<form class="form-horizontal ng-pristine ng-valid ng-valid-email"
							role="form">
							<div class="row">
								<div class="col-sm-6 col-xs-12" style="margin-bottom: 10px;">
									<label for="firstname">아이디</label> <input type="text"
										class="form-control ng-pristine ng-untouched ng-valid"
										id="firstName" placeholder="아이디">
								</div>
								<div class="col-sm-6 col-xs-12" style="margin-bottom: 10px;">
									<label for="lastName">비밀번호</label> <input type="password"
										class="form-control ng-pristine ng-untouched ng-valid"
										id="password" placeholder="비밀번호">
								</div>
							</div>
							<p>
							<p>
								<input type="button" class="btn btn-block btn-primary"
									data-target="#login" data-dismiss="modal" value="로그인">
						</form>
					</div>
				</div>
			</div>
		</div> --%>
		<!-- 원래 main 화면에 있는 기본 로그인 부분  끝 -->


		<!-- 로그인 modal 창의 id, password, 로그인, 로그아웃 버튼 부분 시작 -->
		<div class="modal fade" id="login" tabindex="-1" role="dialog"
			aria-labelledby="modalLabel" aria-hidden="true">

			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">
							<span aria-hidden="true"></span><span class="sr-only">Close</span>
						</button>
						<h4 class="modal-title" id="lineModalLabel">
							<center>안녕하세요. PUCO 입니다.</center>
						</h4>
					</div>
					<div class="modal-body">

						<!-- content goes here -->
						<c:if test="${sessionScope.id==null }">
							<form class="form-horizontal ng-pristine ng-valid ng-valid-email"
								role="form" method="post" action="signin.do" id="logForm">

								<div class="row">
									<div class="col-sm-6 col-xs-12" style="margin-bottom: 10px;">
										<label for="firstname">아이디</label> <input type="text"
											class="form-control ng-pristine ng-untouched ng-valid"
											id="id" name="id" placeholder="아이디">
									</div>
									<div class="col-sm-6 col-xs-12" style="margin-bottom: 10px;">
										<label for="lastName">비밀번호</label> <input type="password"
											class="form-control ng-pristine ng-untouched ng-valid"
											id="pwd" name="pwd" placeholder="비밀번호">
									</div>
								</div>

								<p>
								<p>
									<button type="button" class="btn btn-block btn-primary"
										data-target="#login" data-dismiss="modal" id="logBtn">로그인</button>
							</form>
						</c:if>
						<c:if test="${sessionScope.id!=null }">
							<form method="post" action="signout.do" id="logoutForm">
								${sessionScope.id }님 환영합니다!!&nbsp;
								<button type="button" class="btn btn-block btn-primary"
									data-target="#login" data-dismiss="modal" id="logoutBtn">로그아웃</button>
							</form>
						</c:if>
					</div>
				</div>
			</div>
		</div>
	</header>
								

	<!-- content -->
				<jsp:include page="${jsp }"></jsp:include>

	<!-- Scripts -->

	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"
		integrity="sha384-0mSbJDEHialfmuBBQP6A4Qrprq5OVfW37PRR3j5ELqxss1yVqOtnepnHVP9aJ7xS"
		crossorigin="anonymous"></script>

	<script src="assets/js/jquery.min.js"></script>
	<script src="assets/js/jquery.scrolly.min.js"></script>
	<script src="assets/js/jquery.dropotron.min.js"></script>
	<script src="assets/js/jquery.scrollex.min.js"></script>
	<script src="assets/js/skel.min.js"></script>
	<script src="assets/js/util.js"></script>




	<script type="text/javascript">
		$(function() {
			$(".dropdown").hover(function() {
				$('.dropdown-menu', this).stop(true, true).fadeIn("fast");
				$(this).toggleClass('open');
				$('b', this).toggleClass("caret caret-up");
			}, function() {
				$('.dropdown-menu', this).stop(true, true).fadeOut("fast");
				$(this).toggleClass('open');
				$('b', this).toggleClass("caret caret-up");
			});
		});
	</script>

	<script type="text/javascript">
	$(document).ready(function() {
	    var activeSystemClass = $('.list-group-item.active');

	    //something is entered in search form
	    $('#system-search').keyup( function() {
	       var that = this;
	        // affect all table rows on in systems table
	        var tableBody = $('.table-list-search tbody');
	        var tableRowsClass = $('.table-list-search tbody tr');
	        $('.search-sf').remove();
	        tableRowsClass.each( function(i, val) {
	        
	            //Lower text for case insensitive
	            var rowText = $(val).text().toLowerCase();
	            var inputText = $(that).val().toLowerCase();
	            if(inputText != '')
	            {
	                $('.search-query-sf').remove();
	                tableBody.prepend('<tr class="search-query-sf"><td colspan="6"><strong>검색어: "'
	                    + $(that).val()
	                    + '"</strong></td></tr>');
	            }
	            else
	            {
	                $('.search-query-sf').remove();
	            }

	            if( rowText.indexOf( inputText ) == -1 )
	            {
	                //hide rows
	                tableRowsClass.eq(i).hide();
	                
	            }
	            else
	            {
	                $('.search-sf').remove();
	                tableRowsClass.eq(i).show();
	            }
	        });
	        //all tr elements are hidden
	        if(tableRowsClass.children(':visible').length == 0)
	        {
	            tableBody.append('<tr class="search-sf"><td class="text-muted" colspan="6">일치하는 단어가 없습니다.</td></tr>');
	        }
	    });
	});
	</script>
	<script>
	(function(i, s, o, g, r, a, m) {
		i['GoogleAnalyticsObject'] = r;
		i[r] = i[r] || function() {
			(i[r].q = i[r].q || []).push(arguments)
		}, i[r].l = 1 * new Date();
		a = s.createElement(o), m = s.getElementsByTagName(o)[0];
		a.async = 1;
		a.src = g;
		m.parentNode.insertBefore(a, m)
	})(window, document, 'script', '//www.google-analytics.com/analytics.js',
			'ga');

	ga('create', 'UA-42755476-1', 'bootstrap-tagsinput.github.io');
	ga('send', 'pageview');
</script>
<script>
	$(function() {
		//전역변수선언
		var editor_object = [];
		nhn.husky.EZCreator.createInIFrame({
			oAppRef : editor_object,
			elPlaceHolder : "ir1",
			sSkinURI : "resources/se/SmartEditor2Skin.html",
			htParams : {
				// 툴바 사용 여부 (true:사용/ false:사용하지 않음)
				bUseToolbar : true,
				// 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음)
				bUseVerticalResizer : true,
				// 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음)
				bUseModeChanger :true,

			}
		});
		
		//전송버튼 클릭이벤트
		$("#sndbtn").click(function() {
			
			//태그 값 저장
			$('#taglist').val($("#tags").val());
			alert("taglist>>"+$('#taglist').val());
			var title=$('#title').val();
			if(title.trim()=="")
			{
				$('#title').focus();
				alert("2");
				return;
			}
			alert(1);
			//id가 smarteditor인 textarea에 에디터에서 대입
			editor_object.getById["ir1"].exec("UPDATE_CONTENTS_FIELD", []);
			alert(2);
			// 이부분에 에디터 validation 검증
			//폼 submit
			$("#frm").submit();
		})
	})
</script>
<script type="text/javascript">
jQuery(document).ready(function($) {
	 
    $('#myCarousel').carousel({
            interval: 5000
    });

    $('#carousel-text').html($('#slide-content-0').html());

    //Handles the carousel thumbnails
    $('[id^=carousel-selector-]').click( function(){
            var id_selector = $(this).attr("id");
            var id = selectorId.substr(selectorId.lastIndexOf("-") + 1);
            var id = parseInt(id);
            $('#myCarousel').carousel(id);
    });


    // When the carousel slides, auto update the text
    $('#myCarousel').on('slid.bs.carousel', function (e) {
             var id = $('.item.active').data('slide-number');
            $('#carousel-text').html($('#slide-content-'+id).html());
    });
});
</script>
<script
		src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.5/js/bootstrap.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/typeahead.js/0.11.1/typeahead.bundle.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/angular.js/1.2.20/angular.min.js"></script>
	<script
		src="resources/input_tags/bootstrap-tagsinput.min.js"></script>
	<script
		src="resources/input_tags/bootstrap-tagsinput-angular.min.js"></script>
	<script src="resources/input_tags/puco_tags.js"></script>
</body>
</html>