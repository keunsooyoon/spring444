<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    
    
<%@ include file="../header.jsp"%>

<link rel="stylesheet" href="/resources/admin/plugins/fullcalendar/main.css">

<div class="content-wrapper">

<section class="content-header">
<div class="container-fluid">
<div class="row mb-2">
<div class="col-sm-6">
<h1>Calendar</h1>
</div>
<div class="col-sm-6">
<ol class="breadcrumb float-sm-right">
<li class="breadcrumb-item"><a href="#">Home</a></li>
<li class="breadcrumb-item active">Calendar</li>
</ol>
</div>
</div>
</div>
</section>





<section class="content">
<div class="container-fluid">
<div class="row">
<div class="col-md-3">

 
<div id="external-events"></div>
</div>
  
<div class="col-md-12">

<div id="calendar"></div>
    
  
</div>

</div>

</div>
</section>

</div>



<aside class="control-sidebar control-sidebar-dark">

</aside>

 <%@ include file="../footer.jsp" %>	




<script src="/resources/admin/plugins/fullcalendar/main.js"></script>


<script>
  $(function () {

    /* initialize the external events
     -----------------------------------------------------------------*/
    function ini_events(ele) {
      ele.each(function () {

        // create an Event Object (https://fullcalendar.io/docs/event-object)
        // it doesn't need to have a start or end
        var eventObject = {
          title: $.trim($(this).text()) // use the element's text as the event title
        }

        // store the Event Object in the DOM element so we can get to it later
        $(this).data('eventObject', eventObject)

        // make the event draggable using jQuery UI
        $(this).draggable({
          zIndex        : 1070,
          revert        : true, // will cause the event to go back to its
          revertDuration: 0  //  original position after the drag
        })

      })
    }

    ini_events($('#external-events div.external-event'))

    /* initialize the calendar
     -----------------------------------------------------------------*/
    //Date for the calendar events (dummy data)
    var date = new Date()
    var d    = date.getDate(),
        m    = date.getMonth(),
        y    = date.getFullYear()

    var Calendar = FullCalendar.Calendar;
    var Draggable = FullCalendar.Draggable;

    var containerEl = document.getElementById('external-events');
    var checkbox = document.getElementById('drop-remove');
    var calendarEl = document.getElementById('calendar');

    // initialize the external events
    // -----------------------------------------------------------------

    new Draggable(containerEl, {
      itemSelector: '.external-event',
      eventData: function(eventEl) {
        return {
          title: eventEl.innerText,
          backgroundColor: window.getComputedStyle( eventEl ,null).getPropertyValue('background-color'),
          borderColor: window.getComputedStyle( eventEl ,null).getPropertyValue('background-color'),
          textColor: window.getComputedStyle( eventEl ,null).getPropertyValue('color'),
        };
      }
    });
    
	
  	  
  	  $(function () { //ajax로 json을 가지고 온다.
            var request = $.ajax({ 

		type : "POST",
		url : "/calendar/viewx",
		dataType : "json",// 잭슨 드라이버  pom 추가할것
		beforeSend : function(xhr) { /*데이터를 전송하기 전에 헤더에 csrf값을 설정한다*/
			xhr.setRequestHeader("${_csrf.headerName}",
					"${_csrf.token}");
		}
	});

	
    request.done(function(data){ //ajax가 성공적일 경우 , data를 받는다.
  	  console.log(data);
  	  
  	  var calendarEl = document.getElementById('calendar');
        var calendar = new FullCalendar.Calendar(calendarEl, {
            headerToolbar: {
                left  : 'prev,next today',
                center: 'title',
                right : 'dayGridMonth,timeGridWeek,timeGridDay'
              },
          initialView: 'dayGridMonth'
         , selectable: true //날짜 드래그해서 지정가능
         , selectMirror: true
         , displayEventEnd: {//시작시간, 끝나는 시간 다 보이게 하기
              month: false
             , basicWeek: true
             , "default": true
          }
         , dayMaxEventRows: true //일정이 너무 많으면 more버튼으로 일정확인
         , views: {
            timeGrid: {
              dayMaxEventRows: 6 // adjust to 6 only for timeGridWeek/timeGridDay
            }
          }
          , events: data, //돌려받은 json 그 자체

        });
  	  
calendar.render();
	       });
});
});


</script>
  
    