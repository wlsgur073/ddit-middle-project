<%@page import="kr.or.ddit.schedule.vo.ScheduleVO"%>
<%@page import="kr.or.ddit.cmm.vo.JobOpeningPagingVO"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@page import="kr.or.ddit.company.service.CompanyServiceImpl"%>
<%@page import="kr.or.ddit.company.service.ICompanyService"%>
<%@page import="kr.or.ddit.company.vo.CompanyVO"%>
<%@page import="kr.or.ddit.member.vo.MemberVO"%>
<%@page import="kr.or.ddit.cmm.util.SessionCheck"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	int memCode = 0;
	int memNo = 0;
	int hrNo = 0;
	int cnt = 0;
	int comNo = 0;
	MemberVO loginMember = null;
	CompanyVO cv = null;
	if(SessionCheck.isLoginMember(session)){
		
		loginMember = (MemberVO)session.getAttribute("memVO");
		// 로그인 상태인 경우
		memCode = SessionCheck.getMemCode(session, request);
		memNo = SessionCheck.getMemNo(session, request);
		System.out.println(memNo);
		if(memCode == 1){
			System.out.println(memCode);
			// 개인회원인 경우
			hrNo = SessionCheck.getHrNo(session, request);
		}else if(memCode == 2){
			System.out.println(memCode);
			// 기업회원인 경우
			cnt = SessionCheck.hasComNo(session, request);
			if(cnt > 0){
				// 기업을 등록한 기업회원인 경우
				
				System.out.println(cnt);
				comNo = SessionCheck.getComNo(session, request);
				ICompanyService companyService = CompanyServiceImpl.getInstance();
				cv = companyService.getCompany(comNo);
			}
		}
	}else{
		// 비회원인 경우
	}
	
	System.out.println("memNo : " + memNo + "\nmemCode : " + memCode + "\nhrNo" + hrNo + "\ncnt : " + cnt + "\ncomNo : " + comNo);
	
	
	List<ScheduleVO> list = (List<ScheduleVO>) request.getAttribute("myCal");
	
%>

<!DOCTYPE html>
<html lang='en'>
  <head>
    <meta charset='utf-8' />
    <link href='/CodePeople/css/myCalendar.css' rel='stylesheet' />
    <link href='/CodePeople/css/myCalendar.min.css' rel='stylesheet' />
    <script src='/CodePeople/js/myCalendarLocales-all.js'></script>
    <script src='/CodePeople/js/myCalendar.js'></script>
    <script src='/CodePeople/js/myCalendar.min.js'></script>
    <script>

      document.addEventListener('DOMContentLoaded', function() {
        var calendarEl = document.getElementById('calendar');
        
        var calendar = new FullCalendar.Calendar(calendarEl, {
           headerToolbar: {
                left: 'prev,next today',
                center: 'title',
                right: 'dayGridMonth,timeGridWeek,timeGridDay'
              },   
          locale: 'ko',    
          editable: true,
          initialView: 'dayGridMonth',
          navLinks: true, // can click day/week names to navigate views
          selectable: true,
          selectMirror: true,
          select: function(arg) {
            var title = prompt('추가할 일정을 입력해주세요.');
            if (title) {
              calendar.addEvent({
                title: title,
                start: arg.start,
                end: arg.end,
                allDay: arg.allDay
              })
            }
            calendar.unselect()
          },
          eventClick: function(arg) {
            if (confirm('일정을 삭제하시겠습니까?')) {
              arg.event.remove()
            }
          },
          editable: true,
          dayMaxEvents: true, // allow "more" link when too many events
          events: [
        	  <% for(int i = 0; i < list.size(); i++){
        		  ScheduleVO vo = list.get(i);
        		  if(i > 0)	{ out.print(","); } %>
	            {
	            	 title : '<%= vo.getScheCont() %>',
	                 start : '<%= vo.getScheSdate() %>',
	                 end : '<%= vo.getScheEdate() %>',
	                 color : '<%= vo.getCalTagColor() %>',
	                 display : 'border',// 여기는 BORDER로 하드코딩하기 
	                 allday : true
	             }
          <% } %>
          ]
        });
        calendar.render();
      });
     
    </script>
  
  </head>
  <body>
    <div id='calendar'></div>
  </body>
</html>