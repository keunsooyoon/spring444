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
					<h1 class="m-0">일정 등록</h1>
				</div>
				<!-- /.col -->
				<div class="col-sm-6">
					<ol class="breadcrumb float-sm-right">
						<li class="breadcrumb-item"><a href="#">홈</a></li>
						<li class="breadcrumb-item active">일정 등록</li>
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






					<div class="card-body">


						<form:form modelAttribute="NewCal"
							action="/calendar/addcal?${_csrf.parameterName}=${_csrf.token}"
							class="form-horizontal" method="post">
							<fieldset>



								<div class="form-group">
									<label>제목 :</label>
									<form:input path="title" type="text" class="form-control" />
								</div>

								<div class="form-group">
									<label>시작 :</label>
									<div class="input-group date" id="reservationdatetime"
										data-target-input="nearest">
										<form:input path="start" type="text"
											class="form-control datetimepicker-input"
											data-target="#reservationdatetime" />
										<div class="input-group-append"
											data-target="#reservationdatetime"
											data-toggle="datetimepicker">
											<div class="input-group-text">
												<i class="fa fa-calendar"></i>
											</div>
										</div>
									</div>
								</div>


								<div class="form-group">
									<label>종료 :</label>
									<div class="input-group date" id="reservationdatetime2"
										data-target-input="nearest">
										<form:input path="end" type="text"
											class="form-control datetimepicker-input"
											data-target="#reservationdatetime2" />
										<div class="input-group-append"
											data-target="#reservationdatetime2"
											data-toggle="datetimepicker">
											<div class="input-group-text">
												<i class="fa fa-calendar"></i>
											</div>
										</div>
									</div>
								</div>





								<div class="form-group">
									<label>기타 설정 :</label>

								<div class="form-row align-items-center">
									<div class="col-auto my-1">
										<label class="mr-sm-2 sr-only" for="inlineFormCustomSelect">배경
											색상 :</label>
										<form:select path="color" class="custom-select mr-sm-2"
											id="inlineFormCustomSelect">
											<option selected>배경 색상을 선택하세요</option>
											<option value="red">빨강</option>
											<option value="orange">주황</option>
											<option value="yellow">노랑</option>
											<option value="green">초록</option>
											<option value="blue">파랑</option>
											<option value="navy">남색</option>
											<option value="purple">보라</option>
											<option value="black">검정</option>
										</form:select>
									</div>
									<div class="col-auto my-1">
										<label class="mr-sm-2 sr-only" for="inlineFormCustomSelect">글자
											색상 :</label>
										<form:select path="textColor" class="custom-select mr-sm-2"
											id="inlineFormCustomSelect">
											<option selected>글자 색상을 선택하세요</option>
											<option value="white">흰색</option>
											<option value="red">빨강</option>
											<option value="orange">주황</option>
											<option value="yellow">노랑</option>
											<option value="green">초록</option>
											<option value="blue">파랑</option>
											<option value="navy">남색</option>
											<option value="purple">보라</option>
											<option value="black">검정</option>
										</form:select>
									</div>
									<div class="col-auto my-1">





  

  
  
										<div class="custom-control custom-switch justify-content-end">
											<form:checkbox path="allDay" value="true"
												class="custom-control-input" id="customSwitch1" />
											<label class="custom-control-label" for="customSwitch1">종일
												일정 선택</label>
										</div>




									</div>

								</div>
					</div>
				</div>
			</div>
</div>





			<div class="row">
				<div class="col-12">
					<a href="#" class="btn btn-secondary">취소</a> 
					<input type="submit"
						value="등록" class="btn btn-success float-right">
				</div>
			</div>


			</fieldset>
			</form:form>





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


<script src="/resources/admin/plugins/jquery/jquery.min.js"></script>

<script
	src="/resources/admin/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>

<script src="/resources/admin/plugins/select2/js/select2.full.min.js"></script>

<script
	src="/resources/admin/plugins/bootstrap4-duallistbox/jquery.bootstrap-duallistbox.min.js"></script>

<script src="/resources/admin/plugins/moment/moment.min.js"></script>
<script src="/resources/admin/plugins/inputmask/jquery.inputmask.min.js"></script>

<script
	src="/resources/admin/plugins/daterangepicker/daterangepicker.js"></script>

<script
	src="/resources/admin/plugins/bootstrap-colorpicker/js/bootstrap-colorpicker.min.js"></script>

<script
	src="/resources/admin/plugins/tempusdominus-bootstrap-4/js/tempusdominus-bootstrap-4.min.js"></script>

<script
	src="/resources/admin/plugins/bootstrap-switch/js/bootstrap-switch.min.js"></script>

<script src="/resources/admin/plugins/bs-stepper/js/bs-stepper.min.js"></script>

<script src="/resources/admin/plugins/dropzone/min/dropzone.min.js"></script>



<script>
	$(function() {
		//Initialize Select2 Elements
		$('.select2').select2()

		//Initialize Select2 Elements
		$('.select2bs4').select2({
			theme : 'bootstrap4'
		})

		//Datemask dd/mm/yyyy
		$('#datemask').inputmask('yyyy-mm-dd', {
			'placeholder' : 'yyyy-mm-dd'
		})
		//Datemask2 mm/dd/yyyy
		$('#datemask2').inputmask('yyyy-mm-dd', {
			'placeholder' : 'yyyy-mm-dd'
		})
		//Money Euro
		$('[data-mask]').inputmask()

		//Date picker
		$('#reservationdate').datetimepicker({
			format : 'L'
		});

		//Date and time picker
		$('#reservationdatetime').datetimepicker({
			format : 'YYYY-MM-DD hh:mm:ss',
			icons : {
				time : 'far fa-clock'
			}
		});

		//Date and time picker2
		$('#reservationdatetime2').datetimepicker({
			format : 'YYYY-MM-DD hh:mm:ss',
			icons : {
				time : 'far fa-clock'
			}
		});

		//Date range picker
		$('#reservation').daterangepicker()
		//Date range picker with time picker
		$('#reservationtime').daterangepicker({
			timePicker : true,
			timePickerIncrement : 30,
			locale : {
				format : 'MM/DD/YYYY hh:mm A'
			}
		})
		//Date range as a button
		$('#daterange-btn').daterangepicker(
				{
					ranges : {
						'Today' : [ moment(), moment() ],
						'Yesterday' : [ moment().subtract(1, 'days'),
								moment().subtract(1, 'days') ],
						'Last 7 Days' : [ moment().subtract(6, 'days'),
								moment() ],
						'Last 30 Days' : [ moment().subtract(29, 'days'),
								moment() ],
						'This Month' : [ moment().startOf('month'),
								moment().endOf('month') ],
						'Last Month' : [
								moment().subtract(1, 'month').startOf('month'),
								moment().subtract(1, 'month').endOf('month') ]
					},
					startDate : moment().subtract(29, 'days'),
					endDate : moment()
				},
				function(start, end) {
					$('#reportrange span').html(
							start.format('MMMM D, YYYY') + ' - '
									+ end.format('MMMM D, YYYY'))
				})

		//Timepicker
		$('#timepicker').datetimepicker({
			format : 'LT'
		})

		//Bootstrap Duallistbox
		$('.duallistbox').bootstrapDualListbox()

		//Colorpicker
		$('.my-colorpicker1').colorpicker()
		//color picker with addon
		$('.my-colorpicker2').colorpicker()

		$('.my-colorpicker2').on(
				'colorpickerChange',
				function(event) {
					$('.my-colorpicker2 .fa-square').css('color',
							event.color.toString());
				})

		$("input[data-bootstrap-switch]").each(function() {
			$(this).bootstrapSwitch('state', $(this).prop('checked'));
		})

	})
	// BS-Stepper Init
	document.addEventListener('DOMContentLoaded', function() {
		window.stepper = new Stepper(document.querySelector('.bs-stepper'))
	})

	// DropzoneJS Demo Code Start
	Dropzone.autoDiscover = false

	// Get the template HTML and remove it from the doumenthe template HTML and remove it from the doument
	var previewNode = document.querySelector("#template")
	previewNode.id = ""
	var previewTemplate = previewNode.parentNode.innerHTML
	previewNode.parentNode.removeChild(previewNode)

	var myDropzone = new Dropzone(document.body, { // Make the whole body a dropzone
		url : "/target-url", // Set the url
		thumbnailWidth : 80,
		thumbnailHeight : 80,
		parallelUploads : 20,
		previewTemplate : previewTemplate,
		autoQueue : false, // Make sure the files aren't queued until manually added
		previewsContainer : "#previews", // Define the container to display the previews
		clickable : ".fileinput-button" // Define the element that should be used as click trigger to select files.
	})

	myDropzone.on("addedfile", function(file) {
		// Hookup the start button
		file.previewElement.querySelector(".start").onclick = function() {
			myDropzone.enqueueFile(file)
		}
	})

	// Update the total progress bar
	myDropzone
			.on(
					"totaluploadprogress",
					function(progress) {
						document.querySelector("#total-progress .progress-bar").style.width = progress
								+ "%"
					})

	myDropzone.on("sending", function(file) {
		// Show the total progress bar when upload starts
		document.querySelector("#total-progress").style.opacity = "1"
		// And disable the start button
		file.previewElement.querySelector(".start").setAttribute("disabled",
				"disabled")
	})

	// Hide the total progress bar when nothing's uploading anymore
	myDropzone.on("queuecomplete", function(progress) {
		document.querySelector("#total-progress").style.opacity = "0"
	})

	// Setup the buttons for all transfers
	// The "add files" button doesn't need to be setup because the config
	// `clickable` has already been specified.
	document.querySelector("#actions .start").onclick = function() {
		myDropzone.enqueueFiles(myDropzone.getFilesWithStatus(Dropzone.ADDED))
	}
	document.querySelector("#actions .cancel").onclick = function() {
		myDropzone.removeAllFiles(true)
	}
	// DropzoneJS Demo Code End
</script>
