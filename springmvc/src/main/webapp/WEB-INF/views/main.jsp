<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ include file="header.jsp" %>

    <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>




<h1>Group Talk</h1>
<hr>
<div class = "input-group justify-content-center">
<input id="id" type="hidden" name="id" value="<%=sid%>">
<textarea name="content" id="summernote" class="mtop-10"></textarea>

<button type="button" class="btn btn-primary" onclick="addItem()">추가</button>
</div>
<hr>
<table align=center>
<thead>
</thead>
<tbody id="ajaxTable">

</tbody>
</table>
</div>
  <script>
  $('#summernote').summernote({
	  tabsize: 2,
        height: 60,
        toolbar: [
          ['style', ['style']],
          ['font', ['bold', 'underline', 'clear']],
          ['color', ['color']],
          ['insert', ['link', 'picture', 'video']],
          ['view', ['help']]
        ]
      });
    </script>
<%@ include file="footer.jsp" %>
</body>
</html>