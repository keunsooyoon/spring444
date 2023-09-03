<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>

	<%@ include file="../header.jsp"%>



<script src="https://code.jquery.com/jquery-3.6.3.min.js"
	integrity="sha256-pvPw+upLPUjgMXY0G+8O0xUf+/Im1MZjXxxgOcBQBXU="
	crossorigin="anonymous"></script>

<script>
	function replyNewFunction() {
		$.ajax({
			type : "POST",
			url : "/board/replynew",
			data : {
				bid : document.getElementById('bid').value,
				bpwriter : document.getElementById('bpwriter').value,
				rpwriter : document.getElementById('rpwriter').value,
				bcontent : document.getElementById('bcontent').value
			},
			beforeSend : function(xhr) { /*데이터를 전송하기 전에 헤더에 csrf값을 설정한다*/
				xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
			},
			success : function(result) {
				alert("답변 등록 성공");
			},
			error : function(request, status, error) {
				alert(request.status + " " + request.responseText);
			}
		});
		window.location.reload();
	}
	
	function checkFunction(bid, check) {
		$.ajax({
			type : "POST",
			url : "/boards/check",
			data : {
				bid : bid,
				check : check
			},
			beforeSend : function(xhr) { /*데이터를 전송하기 전에 헤더에 csrf값을 설정한다*/
				xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
			},
			success : function(result) {
				alert("등록 성공");
			},
			error : function(request, status, error) {
				alert(request.status + " " + request.responseText);
			}
		});
		window.location.reload();
	}
</script>











	<!-- Content Wrapper. Contains page content -->
	<div class="content-wrapper">
		<!-- Content Header (Page header) -->
		<div class="content-header">
			<div class="container-fluid">
				<div class="row mb-2">
					<div class="col-sm-6">
						<h1 class="m-0">글 상세보기</h1>
					</div>
					<!-- /.col -->
					<div class="col-sm-6">
						<ol class="breadcrumb float-sm-right">
							<li class="breadcrumb-item"><a href="#">홈</a></li>
							<li class="breadcrumb-item active">글 상세보기</li>
						</ol>
					</div>
					<!-- /.col -->
				</div>
				<!-- /.row -->
			</div>
			<!-- /.container-fluid -->
		</div>
		<!-- /.content-header -->

		<!-- Main content -->
		<div class="content">
			<div class="container-fluid">
				<div class="row">
					<div class="col-lg-12">


						<!-------------------- 여기서 부터 모든 페이지의 본문 삽입 -------------------->











	<!-- 주 게시물 -->
	<div class="card">
		<h5 class="card-header">${board.btitle}</h5>
		<div class="card-body">
			<h5 class="card-title">${board.bcontent}</h5>
			<br>
			<br>
			<br>

			<div class="d-flex justify-content-end badge bg-light text-dark">${board.bdate}</div>
		</div>
	</div>

	<!-- 답변 게시물 -->

	<div class="card">
		<div class="card-body">답변 리스트</div>
<b>${cnt}개의 답변이 있습니다.</b>
<c:forEach items="${replyList}" var="reply">

<div class="card">
  <div class="card-header">
    ${reply.bwriter} 
  </div>
  <div class="card-body">
    <blockquote class="blockquote mb-0">
      <p>${reply.bcontent}</p>
      			<div class="d-flex justify-content-end">
      <footer class="blockquote-footer">${reply.bdate}</footer>
      </div>
    </blockquote>
  </div>
</div>
</c:forEach>


	<!-- 답변 등록 -->
	<sec:authentication property="principal" var="member" />
	<input id="bpwriter" type="hidden" value="${board.bwriter}"/>
	<input id="rpwriter" type="hidden" value="${member.username}"/>
	<input id="bid" type="hidden" name="bid" value="${board.bid}">
	
<div class="card text-center">
  <div class="card-header">
    작성자 : ${member.username}
  </div>
  <div class="card-body">
    <h5 class="card-title">답변 등록</h5>
    <p class="card-text">
    	<textarea name="bcontent" id="bcontent" rows="3" class="form-control"></textarea>
    </p>
    <a href="#" class="btn btn-primary" onclick="replyNewFunction()">답변등록</a>
  </div>
  <div class="card-footer text-muted">
    2 days ago
  </div>
</div>

</div>








						<!-------------------- 여기까지 모든 페이지의 본문 삽입 -------------------->

					</div>


					<!-- /.col-md-12 -->
				</div>
				<!-- /.row -->
			</div>
			<!-- /.container-fluid -->
		</div>
		<!-- /.content -->
	</div>
	<!-- /.content-wrapper -->




	<%@ include file="../footer.jsp"%>

