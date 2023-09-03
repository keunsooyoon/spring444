<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%> 
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>




<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">

<link rel="stylesheet"
	href="/resources/admin/plugins/fontawesome-free/css/all.min.css">

<link rel="stylesheet"
	href="/resources/admin/plugins/datatables-bs4/css/dataTables.bootstrap4.min.css">
<link rel="stylesheet"
	href="/resources/admin/plugins/datatables-responsive/css/responsive.bootstrap4.min.css">
<link rel="stylesheet"
	href="/resources/admin/plugins/datatables-buttons/css/buttons.bootstrap4.min.css">

<link rel="stylesheet"
	href="/resources/admin/dist/css/adminlte.min.css?v=3.2.0">





<script>
	function updateAuth(mid, e) {
		$.ajax({
			type : "POST",
			url : "/member/list",
			data : {
				mid : mid,
				authority : e.value
			},
			beforeSend : function(xhr) { /*데이터를 전송하기 전에 헤더에 csrf값을 설정한다*/
				xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
			},
			success : function(result) {
				alert("권한 정보 변경이 완료되었습니다.")
				window.location.assign('/member/list');
			},
			error : function(request, status, error) {
				alert(request.status + " " + request.responseText);
			}
		})

		/* window.location.reload(); */
		window.location.assign('/member/list');
	}
</script>

</head>
<body>





	<%@ include file="../header.jsp"%>





	<!-- Content Wrapper. Contains page content -->
	<div class="content-wrapper">
		<!-- Content Header (Page header) -->
		<div class="content-header">
			<div class="container-fluid">
				<div class="row mb-2">
					<div class="col-sm-6">
						<h1 class="m-0">회원 목록</h1>
					</div>
					<!-- /.col -->
					<div class="col-sm-6">
						<ol class="breadcrumb float-sm-right">
							<li class="breadcrumb-item"><a href="#">홈</a></li>
							<li class="breadcrumb-item active">회원 목록</li>
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




						<table id="example1" class="table table-bordered table-striped">
							<thead>
								<tr>
									<th>번호</th>
									<th>아이디</th>
									<th>권한</th>
									<th>이름</th>
									<th>메일</th>
									<th>전화</th>
									<th>등록일</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${memberList}" var="member">
									<tr>
										<td>${member.mid}</td>
										<td>${member.username}</td>
										<td><select onchange="updateAuth('${member.mid}',this)">
										<option selected>${member.authority}</option>
										<option value="ROLE_USER">ROLE_USER</option>
										<option value="ROLE_MANAGER">ROLE_MANAGER</option>
										<option value="ROLE_ADMIN">ROLE_ADMIN</option>
										</select></td>
										<td>${member.mname}</td>
										<td>${member.memail}</td>
										<td>${member.mtel}</td>
										<td>${member.mdate}</td>
																		
										
									</tr>
								</c:forEach>
							</tbody>
							<tfoot>
								<tr>
									<th>번호</th>
									<th>아이디</th>
									<th>권한</th>
									<th>이름</th>
									<th>메일</th>
									<th>전화</th>
									<th>등록일</th>
								</tr>
							</tfoot>
						</table>



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
				"ordering" : true,
				"info" : true,
				"autoWidth" : false,
				"responsive" : true,
			});
		});
	</script>



</body>
</html>