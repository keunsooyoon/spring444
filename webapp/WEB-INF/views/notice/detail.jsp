<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>

<%@ include file="../header.jsp"%>









<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
	<!-- Content Header (Page header) -->
	<div class="content-header">
		<div class="container-fluid">
			<div class="row mb-2">
				<div class="col-sm-6">
					<h1 class="m-0">공지 상세보기</h1>
				</div>
				<!-- /.col -->
				<div class="col-sm-6">
					<ol class="breadcrumb float-sm-right">
						<li class="breadcrumb-item"><a href="#">홈</a></li>
						<li class="breadcrumb-item active">공지 상세보기</li>
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
						<h5 class="card-header">${notice.ntitle}</h5>
						<div class="card-body">
							<h5 class="card-title">${notice.ncontent}</h5>
							<br> <br> <br>

							<div class="d-flex justify-content-end badge bg-light text-dark">${notice.ndate}</div>
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

