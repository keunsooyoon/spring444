<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>





<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>방문을 환영합니다.</title>

<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">

<link rel="stylesheet"
	href="/resources/admin/plugins/fontawesome-free/css/all.min.css">

<link rel="stylesheet"
	href="/resources/admin/plugins/icheck-bootstrap/icheck-bootstrap.min.css">

<link rel="stylesheet"
	href="/resources/admin/dist/css/adminlte.min.css?v=3.2.0">

<style>
body {
	-ms-flex-align: center;
	align-items: center;
	padding-top: 40px;
	padding-bottom: 40px;
	background-color: #f5f5f5;
}

.form-signin {
	width: 100%;
	max-width: 330px;
	padding: 15px;
	margin: auto;
}

.form-signin .checkbox {
	font-weight: 400;
}

.form-signin .form-control {
	position: relative;
	box-sizing: border-box;
	height: auto;
	padding: 10px;
	font-size: 16px;
}

.form-signin .form-control:focus {
	z-index: 2;
}

.form-signin input[type="email"] {
	margin-bottom: -1px;
	border-bottom-right-radius: 0;
	border-bottom-left-radius: 0;
}

.form-signin input[type="password"] {
	margin-bottom: 10px;
	border-top-left-radius: 0;
	border-top-right-radius: 0;
}
</style>

</head>


<body class="hold-transition">
	<div class="my-3"></div>

	<div class="card card-solid">
		<div class="card-body pb-0">
			<div class="card bg-light text-sm d-flex flex-fill">

				<div class="login-logo">
					<a href="/"><b> a </b> Glory</a>

					<h6>외부인은 로그인이 불가합니다.</h6>

					<form class="form-signin" action="/login" method="post">
						<label for="inputEmail" class="sr-only">아이디</label> <input
							type="text" name="username" id="inputEmail" class="form-control"
							placeholder="아이디" required autofocus> <label
							for="inputPassword" class="sr-only">비밀번호</label> <input
							type="password" name="password" id="inputPassword"
							class="form-control" placeholder="비밀번호" required> <input
							type="hidden" name="${_csrf.parameterName}"
							value="${_csrf.token}" />
						<button class="btn btn-sm btn-primary btn-block" type="submit">로그인</button>
					</form>

				</div>
			</div>
		</div>


	</div>
	<div class="container">

		<div class="overlay dark d-flex justify-content-center">
			<i class="fas fa-3x fa-sync-alt fa-spin"></i>
		</div>

	</div>


















	<section class="content">

		<div class="card card-solid">
			<div class="card-body pb-0">
				<div class="row">
					<div
						class="col-12 col-sm-6 col-md-4 d-flex align-items-stretch flex-column">
						<div class="card bg-light text-sm d-flex flex-fill">
							<div class="small card-header text-muted border-bottom-0">
								자원봉사자:김지수 최현식 김영광</div>
							<div class="card-body pt-0">
								<div class="row">
									<div class="col-7">
										<h2 class="lead">
											<b>나라가 임하는 교회</b>
										</h2>
										<p class="text-muted text-sm h5">
											<b>담임 목사 : </b> 김종세
										</p>
										<ul class="ml-4 mb-0 fa-ul text-muted">
											<li class="small"><span class="fa-li"><i
													class="fas fa-lg fa-building"></i></span> 경기도 김포시
												김포한강9로76번길 37</li>
											<li class="small"><span class="fa-li"><i
													class="fas fa-lg fa-tablet-alt"></i></span><h6><span class="badge badge-danger">http://heaveniscoming.org</span></h6></li>
										</ul> 
									</div>
									<div class="col-5 text-center">
										<img src="http://heaveniscoming.org/images/logo2.png"
											alt="user-avatar" class="img-circle img-fluid"> 
									</div>
								</div>
							</div>
							<div class="card-footer">
								<div class="text-right">
									<a href="#" class="btn btn-sm bg-teal"> <i
										class="fas fa-comments"></i>
									</a> <a href="http://heaveniscoming.org/"
										class="btn btn-sm btn-primary"> <i class="fas fa-user"></i>
										교회 홈피 방문
									</a>
								</div>
							</div>
						</div>
					</div>
					<div
						class="col-12 col-sm-6 col-md-4 d-flex align-items-stretch flex-column">
						<div class="card bg-light text-sm d-flex flex-fill">
							<div class="small card-header text-muted border-bottom-0">
								자원봉사자:김예건 이혁주 유범석 심경외</div>
							<div class="card-body pt-0">
								<div class="row">
									<div class="col-7">
										<h2 class="lead">
											<b>행전 우리 교회</b>
										</h2>
										<p class="text-muted text-sm">
											<b>담임 목사 : </b> 김종길
										</p>
										<ul class="ml-4 mb-0 fa-ul text-muted">
											<li class="small"><span class="fa-li"><i
													class="fas fa-lg fa-building"></i></span> 서울 서대문구 증가로 130 지층</li>
											<li class="small"><span class="fa-li">
											<i class="fas fa-lg fa-tablet-alt"></i></span><h6><span class="badge badge-danger">http://www.actswoori.org</span></h6></li>
										</ul>
									</div>
									<div class="col-5 text-center">
										<img
											src="http://www.actswoori.org/resources/img/logo_main.png"
											alt="user-avatar" class="img-circle img-fluid">
									</div>
								</div>
							</div>
							<div class="card-footer">
								<div class="text-right">
									<a href="http://www.actswoori.org/resources/actssb.pdf" class="btn btn-sm bg-teal"> <i
										class="fas fa-comments"></i>
									</a> <a href="http://www.actswoori.org/"
										class="btn btn-sm btn-primary"> <i class="fas fa-user"></i>
										교회 홈피 방문
									</a>
								</div>
							</div>
						</div>
					</div>
					<div
						class="col-12 col-sm-6 col-md-4 d-flex align-items-stretch flex-column">
						<div class="card bg-light text-sm d-flex flex-fill">
							<div class="small card-header text-muted border-bottom-0">
								자원봉사자:심현민 박지원 김도영 김남훈 강세빈</div>
							<div class="card-body pt-0">
								<div class="row">
									<div class="col-7">
										<h2 class="lead">
											<b>계정 교회</b>
										</h2>
										<p class="text-muted text-sm">
											<b>담임 목사 : </b> 양태선
										</p>
										<ul class="ml-4 mb-0 fa-ul text-muted"> 
											<li class="small"><span class="fa-li"><i
													class="fas fa-lg fa-building"></i></span> 경기 양평군 양동면 양서북로
												490</li>
											<li class="small"><span class="fa-li">
											<i class="fas fa-lg fa-tablet-alt"></i></span><h6><span class="badge badge-danger">http://www.제작 중.org</span></h6></li>
										</ul>
									</div>
									<div class="col-5 text-center">
										<img src="" alt="user-avatar" class="img-circle img-fluid">
									</div>
								</div>
							</div>
							<div class="card-footer">
								<div class="text-right">
									<a href="http://www.actswoori.org/resources/ggsb.pdf" class="btn btn-sm bg-teal"> <i
										class="fas fa-comments"></i>
									</a> <a href="#" class="btn btn-sm btn-primary"> <i
										class="fas fa-user"></i> 교회 홈피 방문
									</a>

								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>




















		<script src="/resources/admin/plugins/jquery/jquery.min.js"></script>

		<script
			src="/resources/admin/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>

		<script src="/resources/admin/dist/js/adminlte.min.js?v=3.2.0"></script>
</body>
</html>
