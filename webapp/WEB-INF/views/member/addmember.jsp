<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%> 
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
	
<%@ include file="../header.jsp" %>	
	
	



  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <div class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1 class="m-0">회원 등록</h1>
          </div><!-- /.col -->
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="#">홈</a></li>
              <li class="breadcrumb-item active">회원 등록</li>
            </ol>
          </div><!-- /.col -->
        </div><!-- /.row -->
      </div><!-- /.container-fluid -->
    </div>
   <!-- /.content-header -->
   
     <!-- Main content -->
    <div class="content">
      <div class="container-fluid">
        <div class="row">
          <div class="col-lg-12">   
    
    
<!-------------------- 여기서 부터 모든 페이지의 본문 삽입 -------------------->


	<form:form modelAttribute="NewMember" 
			   action="./addmember?${_csrf.parameterName}=${_csrf.token}"
	           class="form-horizontal"
	           method = "post">
	<fieldset>
	
<%-- 	<sec:authentication property="principal" var="user" />  --%>
            
              <div class="form-group">
                <label for="inputName">아이디</label>
                <form:input path="username" class="form-control"/>
              </div>
              <div class="form-group">
                <label for="inputName">암호</label>
                <form:input path="password" type="password" class="form-control"/>
              </div>
                            <div class="form-group">
                <label for="inputName">이름</label>
                <form:input path="mname" class="form-control"/>
              </div>
                            <div class="form-group">
                <label for="inputName">이메일</label>
                <form:input path="memail" class="form-control"/>
              </div>
                            <div class="form-group">
                <label for="inputName">전화번호</label>
                <form:input path="mtel" class="form-control"/>
              </div>
           

 		<div class="row">
        <div class="col-12">
          <a href="#" class="btn btn-secondary">취소</a>
          <input type="submit" value="등록" class="btn btn-success float-right">
        </div>
      </div>

	</fieldset>
	</form:form>
	
	 </div>
	         
	         
	         
	         
	         
	         
	         
 <!-------------------- 여기까지 모든 페이지의 본문 삽입 -------------------->
	         
	         
	         
	         
          <!-- /.col-md-12 -->
        </div>
        <!-- /.row -->
      </div><!-- /.container-fluid -->
    </div>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->
	
	
	
	
 <%@ include file="../footer.jsp" %>	
	