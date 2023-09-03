<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>



<%@ include file="header.jsp"%>
<script src="https://code.jquery.com/jquery-3.6.3.min.js"
	integrity="sha256-pvPw+upLPUjgMXY0G+8O0xUf+/Im1MZjXxxgOcBQBXU="
	crossorigin="anonymous"></script>

<script>
function addtodoFunction() {
	let content = $("#content").val();
	

	
	
	
}
</script>



<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
	<!-- Content Header (Page header) -->
	<div class="content-header">
		<div class="container-fluid">
			<div class="row mb-2">
				<div class="col-sm-6">
					<h1 class="m-0">관리 프로그램</h1>
				</div>
				<!-- /.col -->
				<div class="col-sm-6">
					<ol class="breadcrumb float-sm-right">
						<li class="breadcrumb-item"><a href="#">홈</a></li>
						<li class="breadcrumb-item active">관리자</li>
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
				<div class="col-lg-3 col-12">

					<!-------------------- 여기서 부터 모든 페이지의 본문 삽입 -------------------->


					<div class="small-box bg-info">
						<div class="inner">
							<h3>${n1}</h3>
							<p>신청 완료</p>
						</div>
						<div class="icon">
							<i class="ion ion-bag"></i>
						</div>
						<a href="#" class="small-box-footer">More info <i
							class="fas fa-arrow-circle-right"></i></a>
					</div>
				</div>

				<div class="col-lg-3 col-12">

					<div class="small-box bg-success">
						<div class="inner">
							<h3>${n2}</h3>
							<p>접수 완료</p>
						</div>
						<div class="icon">
							<i class="ion ion-stats-bars"></i>
						</div>
						<a href="#" class="small-box-footer">More info <i
							class="fas fa-arrow-circle-right"></i></a>
					</div>
				</div>

				<div class="col-lg-3 col-12">

					<div class="small-box bg-warning">
						<div class="inner">
							<h3>${n3}</h3>
							<p>처리 중</p>
						</div>
						<div class="icon">
							<i class="ion ion-person-add"></i>
						</div>
						<a href="#" class="small-box-footer">More info <i
							class="fas fa-arrow-circle-right"></i></a>
					</div>
				</div>

				<div class="col-lg-3 col-12">

					<div class="small-box bg-danger">
						<div class="inner">
							<h3>${n5}</h3>
							<p>후속 조치</p>
						</div>
						<div class="icon">
							<i class="ion ion-pie-graph"></i>
						</div>
						<a href="#" class="small-box-footer">More info <i
							class="fas fa-arrow-circle-right"></i></a>
					</div>

				</div>








				<!-- todolist -->

				<div class="col-lg-6">
					<div class="card">
						<div class="card-header">
							<h3 class="card-title">
								<i class="ion ion-clipboard mr-1"></i> To Do List
							</h3>
							<div class="card-tools">
								<ul class="pagination pagination-sm">
									<li class="page-item"><a href="#" class="page-link">&laquo;</a></li>
									<li class="page-item"><a href="#" class="page-link">1</a></li>
									<li class="page-item"><a href="#" class="page-link">2</a></li>
									<li class="page-item"><a href="#" class="page-link">3</a></li>
									<li class="page-item"><a href="#" class="page-link">&raquo;</a></li>
								</ul>
							</div>
						</div>

						<div class="card-body">
							<ul class="todo-list" data-widget="todo-list">


								<c:forEach items="${todoList}" var="list">

									<li><span class="handle"> <i
											class="fas fa-ellipsis-v"></i> <i class="fas fa-ellipsis-v"></i>
									</span>
										<div class="icheck-primary d-inline ml-2">
											<input type="checkbox" value="" name="todo6" id="todoCheck6">
											<label for="todoCheck6"></label>
										</div> <span class="text">${list.todo}</span> <small
										class="badge badge-secondary"><i class="far fa-clock"></i>${list.tdue}</small>
										<div class="tools">
											<i class="fas fa-edit"></i> <i class="fas fa-trash-o"></i>
										</div></li>
								</c:forEach>



							</ul>
						</div>
						<div class="card-footer">
								<div class="input-group">
									<input id="content" type="text" name="message"
										placeholder="New List..." class="form-control"> <span
										class="input-group-append"> <a
										href="javascript:addtodoFunction()" class="btn btn-primary">등록
											&raquo;</a>
									</span>
								</div>
						</div>
					</div>
				</div>
				</section>













				<div class="col-lg-6">
					<div class="card direct-chat direct-chat-primary">
						<div class="card-header">
							<h3 class="card-title">Direct Chat</h3>
							<div class="card-tools">
								<span title="3 New Messages" class="badge badge-primary">3</span>
								<button type="button" class="btn btn-tool"
									data-card-widget="collapse">
									<i class="fas fa-minus"></i>
								</button>
								<button type="button" class="btn btn-tool" title="Contacts"
									data-widget="chat-pane-toggle">
									<i class="fas fa-comments"></i>
								</button>
								<button type="button" class="btn btn-tool"
									data-card-widget="remove">
									<i class="fas fa-times"></i>
								</button>
							</div>
						</div>

						<div class="card-body">

<div class="direct-chat-messages">



<c:forEach items="${chatList}" var="chat">

<c:if test="${chat.bwriter != 'admin'}">
<div class="direct-chat-msg">
<div class="direct-chat-infos clearfix">
<span class="direct-chat-name float-left">${chat.bwriter}</span>
<span class="direct-chat-timestamp float-right">${chat.bdate}</span></div>
<img class="direct-chat-img" src="/resources/admin/dist/img/user1-128x128.jpg" alt="message user image">
<div class="direct-chat-text">${chat.bcontent}</div>
</div>
</c:if>

<c:if test="${chat.bwriter == 'admin'}">
<div class="direct-chat-msg right">
<div class="direct-chat-infos clearfix">
<span class="direct-chat-name float-right">${chat.bwriter}</span>
<span class="direct-chat-timestamp float-left">${chat.bdate}</span></div>
<img class="direct-chat-img" src="dist/img/user3-128x128.jpg" alt="message user image">
<div class="direct-chat-text">${chat.bcontent}</div>
</div>
</c:if>
</c:forEach>



		
		
		
		
</div>


<div class="direct-chat-contacts">
								<ul class="contacts-list">
									<li><a href="#"> <img class="contacts-list-img"
											src="/resources/admin/dist/img/user1-128x128.jpg" alt="User Avatar">
											<div class="contacts-list-info">
												<span class="contacts-list-name"> Count Dracula <small
													class="contacts-list-date float-right">2/28/2015</small>
												</span> <span class="contacts-list-msg">How have you been? I
													was...</span>
											</div>

									</a></li>

									<li><a href="#"> <img class="contacts-list-img"
											src="/resources/admin/dist/img/user7-128x128.jpg" alt="User Avatar">
											<div class="contacts-list-info">
												<span class="contacts-list-name"> Sarah Doe <small
													class="contacts-list-date float-right">2/23/2015</small>
												</span> <span class="contacts-list-msg">I will be waiting
													for...</span>
											</div>

									</a></li>

									<li><a href="#"> <img class="contacts-list-img"
											src="/resources/admin/dist/img/user3-128x128.jpg" alt="User Avatar">
											<div class="contacts-list-info">
												<span class="contacts-list-name"> Nadia Jolie <small
													class="contacts-list-date float-right">2/20/2015</small>
												</span> <span class="contacts-list-msg">I'll call you back
													at...</span>
											</div>

									</a></li>

									<li><a href="#"> <img class="contacts-list-img"
											src="/resources/admin/dist/img/user5-128x128.jpg" alt="User Avatar">
											<div class="contacts-list-info">
												<span class="contacts-list-name"> Nora S. Vans <small
													class="contacts-list-date float-right">2/10/2015</small>
												</span> <span class="contacts-list-msg">Where is your new...</span>
											</div>

									</a></li>

									<li><a href="#"> <img class="contacts-list-img"
											src="/resources/admin/dist/img/user6-128x128.jpg" alt="User Avatar">
											<div class="contacts-list-info">
												<span class="contacts-list-name"> John K. <small
													class="contacts-list-date float-right">1/27/2015</small>
												</span> <span class="contacts-list-msg">Can I take a look
													at...</span>
											</div>

									</a></li>

									<li><a href="#"> <img class="contacts-list-img"
											src="/resources/admin/dist/img/user8-128x128.jpg" alt="User Avatar">
											<div class="contacts-list-info">
												<span class="contacts-list-name"> Kenneth M. <small
													class="contacts-list-date float-right">1/4/2015</small>
												</span> <span class="contacts-list-msg">Never mind I
													found...</span>
											</div>

									</a></li>

								</ul>

							</div>

						</div>

						<div class="card-footer">
							<form action="#" method="post">
								<div class="input-group">
									<input type="text" name="message"
										placeholder="Type Message ..." class="form-control"> <span
										class="input-group-append">
										<button type="button" class="btn btn-primary">Send</button>
									</span>
								</div>
							</form>
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



<%@ include file="footer.jsp"%>