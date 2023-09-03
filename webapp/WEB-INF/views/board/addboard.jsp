<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%> 
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>  



<%@ include file="../header.jsp"%>

    <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
    <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>



  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <div class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1 class="m-0">글 등록</h1>
          </div><!-- /.col -->
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="#">홈</a></li>
              <li class="breadcrumb-item active">글 등록</li>
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





	<form:form modelAttribute="NewBoard" 
			   action="./addboard?${_csrf.parameterName}=${_csrf.token}"
	           class="form-horizontal"
	           method = "post">
	<fieldset>

	<form:input path="bwriter" type="hidden" value="admin" class="form-control"/>
	
	
  				<div class="form-group">
                <label for="inputName">제목</label>
                <form:input path="btitle" class="form-control"/>
	            </div>
              <div class="form-group">
                <label for="inputDescription">내용</label>
                <form:textarea path="bcontent" id="summernote" class="form-control" rows="10"/>
              </div>
               <div class="form-group">
                <label for="inputStatus">유형</label>
                <form:select path="bcate" class="form-control custom-select">
                  <option selected disabled>선택하세요</option>
                  <option>버그처리</option>
                  <option>신규기능</option>
                  <option>기타유형</option>
                </form:select>
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
	
	
	 <script>
      $('#summernote').summernote({
        placeholder: 'Hello stand alone ui',
        tabsize: 2,
        height: 120,
        toolbar: [
          ['style', ['style']],
          ['font', ['bold', 'underline', 'clear']],
          ['color', ['color']],
          ['para', ['ul', 'ol', 'paragraph']],
          ['table', ['table']],
          ['insert', ['link', 'picture', 'video']],
          ['view', ['fullscreen', 'codeview', 'help']]
        ]
      });
    </script>
	
 <%@ include file="../footer.jsp" %>	
	
	