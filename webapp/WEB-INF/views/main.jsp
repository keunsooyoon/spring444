<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>a Glory</title>
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">

<link rel="stylesheet"
	href="/resources/admin/plugins/fontawesome-free/css/all.min.css">

<link rel="stylesheet"
	href="/resources/admin/dist/css/adminlte.min.css?v=3.2.0">

<link rel="stylesheet"
	href="/resources/admin/plugins/datatables-bs4/css/dataTables.bootstrap4.min.css">
<link rel="stylesheet"
	href="/resources/admin/plugins/datatables-responsive/css/responsive.bootstrap4.min.css">
<link rel="stylesheet"
	href="/resources/admin/plugins/datatables-buttons/css/buttons.bootstrap4.min.css">


<script src="https://code.jquery.com/jquery-3.5.1.min.js"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
	integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
	crossorigin="anonymous"></script>

<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
	integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"
	crossorigin="anonymous">
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"
	integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6"
	crossorigin="anonymous"></script>

<link
	href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.js"></script>




<style>
td>a {
	overflow: hidden;
	text-overflow: ellipsis;
	white-space: nowrap;
	width: 250px;
	display: block;
}

div.card-body>p>p>img {
	max-width: 100%;
	height: auto;
}
</style>

<script>
	function deleteBoard() {
		did = $("#did").val();

		$.ajax({
			type : "POST",
			url : "/deleteboardx",
			data : {
				bid : did
			},
			beforeSend : function(xhr) { /*데이터를 전송하기 전에 헤더에 csrf값을 설정한다*/
				xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
			},
			success : function(result) {

			},
			error : function(request, status, error) {
				alert(request.status + " " + request.responseText);
			}
		});
		window.location.reload();

	}

	function addreply() {
		bid = $("#rid").val();
		bcontent = $("#rcontent").val();
		bwriter = $("#rwriter").val();

		$.ajax({
			type : "POST",
			url : "/addreplyx",
			data : {
				bid : bid,
				bcontent : bcontent,
				bwriter : bwriter
			},
			beforeSend : function(xhr) { /*데이터를 전송하기 전에 헤더에 csrf값을 설정한다*/
				xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
			},
			success : function(result) {
				alert("등록 완료")
			},
			error : function(request, status, error) {
				alert(request.status + " " + request.responseText);
			}
		});
		/*  window.location.reload();  */
		reload(bid);
	}

	function addboard() {

		btitle = $("#btitle_input").val();
		bcontent = $("#summernote").val();
		bcate = $("#bcate_input").val();
		bwriter = $("#rwriter").val();

		$.ajax({
			type : "POST",
			url : "/addboardx",
			data : {
				btitle : btitle,
				bcontent : bcontent,
				bcate : bcate,
				bwriter : bwriter
			},
			beforeSend : function(xhr) { /*데이터를 전송하기 전에 헤더에 csrf값을 설정한다*/
				xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
			},
			success : function(result) {
				alert("등록 완료")
			},
			error : function(request, status, error) {
				alert(request.status + " " + request.responseText);
			}
		});
		window.location.reload();
	}

	function editboardx() {
		bid = $("#eid_input").val();
		btitle = $("#etitle_input").val();
		bcontent = $("#summernote2").val();
		bcate = $("#ecate_input").val();

		$.ajax({
			type : "POST",
			url : "/editboardx",
			data : {
				bid : bid,
				btitle : btitle,
				bcontent : bcontent,
				bcate : bcate
			},
			beforeSend : function(xhr) { /*데이터를 전송하기 전에 헤더에 csrf값을 설정한다*/
				xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
			},
			success : function(result) {
				alert("수정 완료")
			},
			error : function(request, status, error) {
				alert(request.status + " " + request.responseText);
			}
		});
		window.location.reload();
	}

	
	function detailNotice(ncontent) {

		document.getElementById('ncontent').innerHTML = "내용 : " + ncontent;	
	
	}			
			
	function detailBoard(id) {

		$('input[name=inputvalue]').attr('value', id); //댓글 작성용 bid
		$('input[name=deletevalue]').attr('value', id);//삭제용 bid
		$('input[name=editvalue]').attr('value', id);//수정용 bid

		$.ajax({
					type : "POST",
					url : "/detailajax",
					data : {
						bid : id
					},
					dataType : "json",// 잭슨 드라이버  pom 추가할것
					beforeSend : function(xhr) { /*데이터를 전송하기 전에 헤더에 csrf값을 설정한다*/
						xhr.setRequestHeader("${_csrf.headerName}",
								"${_csrf.token}");
					},
					success : function(result) {
						var str = "";
						for ( var i in result) {
							str += '				<li class="list-group-item">'
							str += '					<div class="list-group-item list-group-item-secondary small">'
							str += '						<span>' + result[i].bcontent
									+ '</span>'
							str += '						<span class="badge badge-success float-end">'
									+ result[i].bwriter + '</span>'
							str += '					</div>'
							str += '					<h6><div class="badge badge-warning float-right">'
									+ result[i].bdate + '</div></h6>'
							str += '				</li>'
						}
						$(".replies").html(str);
						document.getElementById('replies').innerHTML = str;

					},
					error : function(request, status, error) {
						alert(request.status + " " + request.responseText);
					}
				});

		$.ajax({
			type : "POST",
			url : "/detailx",
			data : {
				bid : id
			},
			dataType : "json",// 잭슨 드라이버  pom 추가할것
			beforeSend : function(xhr) { /*데이터를 전송하기 전에 헤더에 csrf값을 설정한다*/
				xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
			},
			success : function(result) {

				document.getElementById('btitle').innerHTML = "[ " + result.bid
						+ "  ] " + result.btitle;
				document.getElementById('bcontent').innerHTML = "내용 : "
						+ result.bcontent;
				document.getElementById('bcate').innerHTML = "분류 : "
						+ result.bcate;

				status = result.bstatus * 25;
				document.getElementById('bstatus').innerHTML = "진행률 : " + status + "%";
				document.getElementById('bstatus').style.width = status + "%";

				$('input[name=editvalue]').attr('value', result.bid);//수정용 입력 칸에 넣기
				$('input[name=etitlevalue]').attr('value', result.btitle);//수정용 입력 칸에 넣기
				$('#ecate_input').val(result.bcate);//수정용 입력 칸에 넣기
				$('#summernote2').summernote('code', result.bcontent);//수정용 입력 칸에 넣기

			},
			error : function(request, status, error) {
				alert(request.status + " " + request.responseText);
			}
		});

	}

	function reload(id) {
		$
				.ajax({
					type : "POST",
					url : "/detailajax",
					data : {
						bid : id
					},
					dataType : "json",// 잭슨 드라이버  pom 추가할것
					beforeSend : function(xhr) { /*데이터를 전송하기 전에 헤더에 csrf값을 설정한다*/
						xhr.setRequestHeader("${_csrf.headerName}",
								"${_csrf.token}");
					},
					success : function(result) {
						var str = "";
						for ( var i in result) {
							str += '				<li class="list-group-item">'
							str += '					<div class="list-group-item list-group-item-secondary small">'
							str += '						<span>' + result[i].bcontent
									+ '</span>'
							str += '						<span class="badge badge-success float-end">'
									+ result[i].bwriter + '</span>'
							str += '					</div>'
							str += '					<h6><div class="badge badge-warning float-right">'
									+ result[i].bdate + '</div></h6>'
							str += '				</li>'
						}
						$(".replies").html(str);
						document.getElementById('replies').innerHTML = str;
					},
					error : function(request, status, error) {
						alert(request.status + " " + request.responseText);
					}
				});
	}
	
	
	


	
	
</script>
</head>

<body class="hold-transition layout-top-nav">
	<div class="wrapper">

  

<nav class="main-header navbar navbar-expand-md navbar-light navbar-white">


	<div class="container">
				<a href="/" class="navbar-brand"> <img
					src="/resources/image/mine.jpg" alt="Logo"
					class="brand-image img-circle elevation-3" style="opacity: .8">
					<span class="brand-text font-weight-light">a Glory</span>
				</a>




<button class="navbar-toggler order-1" type="button" data-toggle="collapse" data-target="#navbarCollapse" aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation">
<span class="navbar-toggler-icon"></span>
</button>
<div class="collapse navbar-collapse order-3" id="navbarCollapse">

<ul class="navbar-nav">
<li class="nav-item">
<a href="/" class="nav-link">홈</a>
</li>
<li class="nav-item">
<a href="#" class="nav-link" data-toggle="modal" data-target="#modal-notice">공지사항</a>
</li>

<li>
<a href="#" class="nav-link" data-toggle="modal" data-target="#modal-faq">FAQ</a>
</li>  
<li class="nav-item">
<a href="/logout" class="nav-link">로그아웃</a>
</li>
<!-- 관리자만 -->
	<sec:authentication property="principal" var="user" />
						<sec:authorize access="hasRole('ROLE_ADMIN')">
<li class="nav-item dropdown">
<a id="dropdownSubMenu1" href="#" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" class="nav-link dropdown-toggle">관리자전용</a>
<ul aria-labelledby="dropdownSubMenu1" class="dropdown-menu border-0 shadow">

							<li class="nav-item"><a href="/admin">관리메뉴</a></li>
						</sec:authorize>
<li class="dropdown-divider"></li>

</li>
</ul>
    

</div>    













<ul class="order-1 order-md-3 navbar-nav navbar-no-expand ml-auto">

<li class="nav-item dropdown">
			<div>
				<sec:authentication property="principal" var="user" />
				<sec:authorize access="isAuthenticated()">					
									<div
					class="progress-bar progress-bar-striped progress-bar-animated bg-success"
					role="progressbar" style="width: 100%;" aria-valuenow="100"
					aria-valuemin="0" aria-valuemax="100"> [ ${member.mname} ] 님 로그인 중</div>
					
					</sec:authorize>
			</div>
     
</li>    
  

</ul>
</div>
</nav>




		<div class="modal fade" id="modal-faq">
											<div class="modal-dialog modal-xl">
												<div class="modal-content bg-info">
													<div class="modal-header">
														<h4 class="modal-title">FAQ</h4>
														<button type="button" class="close" data-dismiss="modal"
															aria-label="취소">
															<span aria-hidden="true">&times;</span>
														</button>
													</div>
													<div class="modal-body">



<section class="content-header">
<div class="container-fluid">
<div class="row mb-2">


</div>
</div>
</section>

<section class="content">
<div class="row">
<div class="col-12" id="accordion">




<div class="card card-primary card-outline">
<a class="d-block w-100" data-toggle="collapse" href="#collapseOne">
<div class="card-header">
<h4 class="card-title w-100">
1. 급하시면 언제든지 연락주시면 최대한 빨리 처리해드리겠습니다.
</h4>
</div>
</a>
<div id="collapseOne" class="collapse show" data-parent="#accordion">
<div class="card-body text-primary">
010 - 5799 - 2737 로 문자를 주시면 최대한 빨리 처리하겠습니다.<br>
austiny@snu.ac.kr 로 사진등을 보내주시면 더 빨리 작업할 수 있습니다.</div>
</div>
</div>
<div class="card card-primary card-outline">
<a class="d-block w-100" data-toggle="collapse" href="#collapseTwo">
<div class="card-header">
<h4 class="card-title w-100">
2. 게시물을 작성하실 때는 꼭 사진을 첨부해주세요.
</h4>
</div>
</a>
<div id="collapseTwo" class="collapse" data-parent="#accordion">
<div class="card-body text-primary">
글로만 적어주시면 이해가 힘든 경우가 많습니다. <br>
글과 함께 사진을 몇 장 첨부해주시면 좀 더 빠른 처리가 가능합니다.
</div>
</div>
</div>
<div class="card card-primary card-outline">
<a class="d-block w-100" data-toggle="collapse" href="#collapseThree">
<div class="card-header">
<h4 class="card-title w-100">
3. [ 상태 ] 는 총 4 + 1단계로 진행 됩니다. 
</h4>
</div>
</a>
<div id="collapseThree" class="collapse" data-parent="#accordion">
<div class="card-body text-primary">
1 단계 - 신청완료 , 게시물을 등록하시면 신청 완료 상태가 됩니다. <br>
2 단계 - 접수완료 , 신청하신 내용을 확인만 한 상태입니다. 즉, 검토중인 상태입니다.<br>
3 단계 - 처리 중 , 신청하신 내용을 검토 한 후 작업에 들어간 상태입니다.    <br>
4 단계 - 처리 완료, 모든 작업이 완료된 상태입니다. <br>
<br>
5 단계 - 후속조치, 일단 처리가 완료되었으나 추가 작업 등을 요청하신 상태입니다.    <br> 

</div>
</div>
</div>



<div class="card card-warning card-outline">
<a class="d-block w-100" data-toggle="collapse" href="#collapseFour">
<div class="card-header">
<h4 class="card-title w-100">
4. [ 분류 ] 는 총 3가지가 있습니다. 
</h4>
</div>
</a>
<div id="collapseFour" class="collapse" data-parent="#accordion">
<div class="card-body text-primary">
버그 처리 - 모든 프로그램에는 버그가 존재합니다. 버그를 발견하시면 남겨 주시기 바랍니다. <br>
신규 기능 - 신규 기능은 상황에 따라 조금 더 시간이 필요할 수 있습니다. <br>
기타 유형 - 기타 모든 문의는 '기타 유형'을 선택하시기 바랍니다. <br>
</div>
</div>
</div>



<div class="card card-warning card-outline">
<a class="d-block w-100" data-toggle="collapse" href="#collapseFive">
<div class="card-header">
<h4 class="card-title w-100">
5. 기도하는 마음으로 작업하겠습니다. 
</h4>
</div>
</a>
<div id="collapseFive" class="collapse" data-parent="#accordion">
<div class="card-body text-primary">
감사합니다.
</div>
</div>
</div>  





</section>



  


  
													</div>
														<button type="button" class="btn btn-outline-light float-right"
															data-dismiss="modal">돌아가기</button> 
												</div>

											</div>

										</div>



    

		<div class="modal fade" id="modal-notice">
											<div class="modal-dialog modal-xl">
												<div class="modal-content bg-success">
													<div class="modal-header">
														<h4 class="modal-title">공지 사항</h4>
														<button type="button" class="close" data-dismiss="modal"
															aria-label="취소">
															<span aria-hidden="true">&times;</span>
														</button>
													</div>
													<div class="modal-body">










<section class="content-header">
<div class="container-fluid">
<div class="row mb-2">


</div>
</div>
</section>

<section class="content">
<div class="row">
<div class="col-12" id="accordion">



<c:forEach items="${noticeList}" var="notice">


		<div class="card card-warning card-outline">
		<a class="d-block w-100" data-toggle="collapse" href="#ncollapse${notice.nid}">
		<div class="card-header">
		<h4 class="card-title w-100">
		제목 : ${notice.ntitle}
		</h4>
		</div>
		</a>
		<div id="ncollapse${notice.nid}" class="collapse" data-parent="#accordion">
<div class="card-body text-primary">
${notice.ncontent}		</div>
		</div>
		</div>  


</c:forEach>


</section>



  


  
													</div>
														<button type="button" class="btn btn-outline-light float-right"
															data-dismiss="modal">돌아가기</button> 
												</div>

											</div>

										</div>








		<div class="content-wrapper">


			<div class="content">
				<div class="container">
					<div class="row">

						<div class="col-lg-6">












							<div class="modal fade" id="modal-xl">
								<div class="modal-dialog modal-xl">
									<div class="modal-content bg-primary text-dark">
										<div class="modal-header">
											<h4 class="modal-title">게시글 작성</h4>
											<button type="button" class="close" data-dismiss="modal"
												aria-label="Close">
												<span aria-hidden="true">&times;</span>
											</button>
										</div>
										<div class="modal-body">




											<div class="form-group row">
												<div class="col-lg-12">
													<input type="text" class="form-control" id="btitle_input"
														placeholder="글제목">
												</div>
											</div>
											<div class="form-group row">
												<div class="col-lg-12">
													<textarea id="summernote"></textarea>
												</div>
											</div>


											<div class="row">
												<div class="col-sm-6">
													<select id="bcate_input" class="form-control custom-select">
														<option selected disabled>선택하세요</option>
														<option>버그처리</option>
														<option>신규기능</option>
														<option>기타유형</option>
													</select>
												</div>





											</div>




										</div>
										<div class="modal-footer justify-content-between">
											<button type="button" class="btn btn-outline-light"
												data-dismiss="modal">취소</button>
											<a href="javascript:addboard()"
												class="btn btn-outline-light float-right">등록</a>
										</div>
									</div>

								</div>

							</div>


							<div class="card card-primary card-outline">
								<div class="card-body">
									<div class="card-header">
										<h5 class="card-title m-0">게시판 목록</h5>

										<button type="button" class="btn-sm btn-primary float-right"
											data-toggle="modal" data-target="#modal-xl">게시판 등록</button>
									</div>

									<table id="example2" class="table table-bordered table-striped">
										<thead>
											<tr>
												<th></th>
												<th>제목</th>
												<th>분류</th>
												<th>상태</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach items="${boardList}" var="board">
												<tr>
													<td><span class="badge badge-info">${board.bid}</span></td>
													<td><a onmouseover="detailBoard('${board.bid}')"
														href='javascript:detailBoard("${board.bid}")'>${board.btitle}</a></td>
													<td><span class="badge badge-success">${board.bcate}</span></td>
													<td><span class="badge badge-danger">[
															${board.bstatus} ]</span></td>
												</tr>
											</c:forEach>
										</tbody>
									</table>
								</div>
							</div>









							<!-- 옆 줄로 이동 -->


						</div>

						<div class="col-lg-6">
							<div class="card">
								<div class="card card-primary card-outline">
									<div class="card-header">
										<h5 class="card-title m-0">주 게시물 내용 보기</h5>


										<button type="button" class="btn-sm btn-danger float-right"
											data-toggle="modal" data-target="#modal-danger">게시물
											삭제</button>


										<div class="modal fade" id="modal-danger">
											<div class="modal-dialog">
												<div class="modal-content bg-danger">
													<div class="modal-header">
														<h4 class="modal-title">게시물 삭제</h4>
														<button type="button" class="close" data-dismiss="modal"
															aria-label="Close">
															<span aria-hidden="true">&times;</span>
														</button>
													</div>
													<div class="modal-body">
														<p>정말 삭제 하시겠습니까 &hellip;</p>
													</div>
													<div class="modal-footer justify-content-between">
														<button type="button" class="btn btn-outline-light"
															data-dismiss="modal">취소</button>
														<input type="hidden" class="form-control" id="did"
															value="" name="deletevalue"> <a
															href="javascript:deleteBoard()"
															class="btn btn-outline-light">삭제</a>
													</div>
												</div>

											</div>

										</div>


										<button type="button" class="btn-sm btn-warning float-right"
											data-toggle="modal" data-target="#modal-edit">게시물 수정
										</button>





										<div class="modal fade" id="modal-edit">
											<div class="modal-dialog modal-xl">
												<div class="modal-content bg-warning">
													<div class="modal-header">
														<h4 class="modal-title">게시물 수정</h4>
														<button type="button" class="close" data-dismiss="modal"
															aria-label="취소">
															<span aria-hidden="true">&times;</span>
														</button>
													</div>
													<div class="modal-body">




														<div class="form-group row">
															<input type="hidden" class="form-control" id="eid_input"
																value="" name="editvalue">

															<div class="col-lg-12">
																<input type="text" class="form-control"
																	id="etitle_input" value="" name="etitlevalue">
															</div>
														</div>
														<div class="form-group row">
															<div class="col-lg-12">
																<textarea id="summernote2" name="etitlevalue"></textarea>
															</div>
														</div>


														<div class="row">
															<div class="col-sm-6">
																<select id="ecate_input" name="ecatevalue"
																	class="form-control custom-select">
																	<option>버그처리</option>
																	<option>신규기능</option>
																	<option>기타유형</option>
																</select>
															</div>

														</div>




													</div>
													<div class="modal-footer justify-content-between">
														<button type="button" class="btn btn-outline-light"
															data-dismiss="modal">취소</button>
														<a href="javascript:editboardx()"
															class="btn btn-outline-light float-right">수정</a>
													</div>
												</div>

											</div>

										</div>

















									</div>
									<div class="card-body">



										<div class="progress">
											<div
												class="progress-bar progress-bar-striped progress-bar-animated"
												role="progressbar" style="width: 25%;" aria-valuenow="25"
												aria-valuemin="0" aria-valuemax="100" id="bstatus">진행률</div>
										</div>



										<div class="mt-2"></div>
										<h3 class="card-title" id="btitle">제목</h3>

										<h5 class="card-title float-right" id="bcate">종류</h5>

										<p class="card-text" id="bcontent">내용</p>
									</div>
								</div>
							</div>







							<div class="card card-primary card-outline">
								<div class="card-header">
									<h5 class="card-title m-0">댓글 내용 보기</h5>
								</div>
								<div class="card-body">
									<p class="card-text" id="replies">내용</p>
								</div>


								<div class="input-group">
									<input type="hidden" class="form-control" id="rwriter"
										value="${user.username}" name="writervalue"> <input
										type="hidden" class="form-control" id="rid" value=""
										name="inputvalue"> <input type="text"
										class="form-control" id="rcontent" placeholder="댓글 쓰기">
									<spen class="input-group-append"> <a
										href="javascript:addreply()"
										class="btn-sm btn-primary float-right">댓글등록</a> </spen>
								</div>
							</div>
						</div>

					</div>








				</div>


				<aside class="control-sidebar control-sidebar-dark"></aside>



	<script
		src="/resources/admin/plugins/datatables/jquery.dataTables.min.js"></script>
	<script
		src="/resources/admin/plugins/datatables-bs4/js/dataTables.bootstrap4.min.js"></script>
	<script
		src="/resources/admin/plugins/datatables-responsive/js/dataTables.responsive.min.js"></script>
	<script
		src="/resources/admin/plugins/datatables-responsive/js/responsive.bootstrap4.min.js"></script>
	<script
		src="/resources/admin/plugins/datatables-buttons/js/dataTables.buttons.min.js"></script>
	<script
		src="/resources/admin/plugins/datatables-buttons/js/buttons.bootstrap4.min.js"></script>
	<script src="/resources/admin/plugins/jszip/jszip.min.js"></script>
	<script src="/resources/admin/plugins/pdfmake/pdfmake.min.js"></script>
	<script src="/resources/admin/plugins/pdfmake/vfs_fonts.js"></script>
	<script
		src="/resources/admin/plugins/datatables-buttons/js/buttons.html5.min.js"></script>
	<script
		src="/resources/admin/plugins/datatables-buttons/js/buttons.print.min.js"></script>
	<script
		src="/resources/admin/plugins/datatables-buttons/js/buttons.colVis.min.js"></script>

	<script>
		$(function() {
			$("#example1").DataTable(
					{
						"responsive" : true,
						"lengthChange" : false,
						"autoWidth" : false,
						"buttons" : [ "copy", "csv", "excel", "pdf", "print",
								"colvis" ]
					}).buttons().container().appendTo(
					'#example1_wrapper .col-md-6:eq(0)');
			$('#example2').DataTable({
				"paging" : true,
				"lengthChange" : false,
				"searching" : false,
				"ordering" : false,
				"info" : true,
				"autoWidth" : false,
				"responsive" : true,
			});
		});

		$('#summernote').summernote({
			placeholder : '게시물 내용을 입력하세요',
			tabsize : 2,
			height : 350
		});

		$('#summernote2').summernote({
			placeholder : '게시물 내용을 입력하세요',
			tabsize : 2,
			height : 350
		});
	</script>


  
  


<footer class="main-footer">
<div class="float-right d-none d-sm-inline">  
All Things are Possible...
</div>  
<strong>Copyright &copy; 2023 <a href="/">a Glory</a>.</strong> All rights reserved.
</footer>


</div></div></div>  




</body>
</html>