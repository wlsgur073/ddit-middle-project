<%@page import="kr.or.ddit.cmm.vo.BoardPagingVO"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@page import="kr.or.ddit.member.vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
      
<!-- 
	
	
	
	각 게시판 화면에 해당하는 jsp 파일
	
	넘어오는 데이터>>
	[EachBoardPaging 서블릿] 
	서블릿에서 넘어오는 request의 attribute는
	boardCodeNo : Integer와 boardList : List<Map<String, Object>>, boardPagingVP : BoardPagingVO
	[session]
	로그인시 저장된 vo : MemberVO [session.setAttribute("vo", memVO)]
	
	
	jsp파일에서 

<%

	Integer boardCodeNo = null;
	
//	boardCodeNo = (Integer)request.getAttribute("boardCodeNo");
	
	boardCodeNo = 1;
	
/* 	if(boardCodeNo == null){
		System.out.println("게시판 선택 안됨! 종료합니다.");
		System.exit(0);
	} */
	
	List<Map<String, Object>> boardList = (List<Map<String, Object>>)request.getAttribute("boardPagingList");
	
	System.out.println(boardList == null);
	
	BoardPagingVO pagingVO = (BoardPagingVO) request.getAttribute("boardPagingVO");
	Integer boardCode = (Integer) request.getAttribute("boardCode");

	MemberVO loginMember = (MemberVO)session.getAttribute("loginMember");
	
	int memNo = 0;
	
	int hasRight = 0;
	
	String memId = null;
	
	if(loginMember != null){
		memNo = loginMember.getMemNo();
	}
%>    




<!DOCTYPE html>
<html lang="en">

<head>
    <title>Bootstrap Example</title>
    <meta charset="utf-8">
    <script src="https://kit.fontawesome.com/d3ee6ce800.js" crossorigin="anonymous"></script>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>

    <!-- include summernote css/js/ codemirror-->
    <link rel="stylesheet" type="text/css" href="//cdnjs.cloudflare.com/ajax/libs/codemirror/3.20.0/codemirror.css">
    <link rel="stylesheet" type="text/css" href="//cdnjs.cloudflare.com/ajax/libs/codemirror/3.20.0/theme/monokai.css">
    <script type="text/javascript" src="//cdnjs.cloudflare.com/ajax/libs/codemirror/3.20.0/codemirror.js"></script>
    <script type="text/javascript" src="//cdnjs.cloudflare.com/ajax/libs/codemirror/3.20.0/mode/xml/xml.js"></script>
    <script type="text/javascript" src="//cdnjs.cloudflare.com/ajax/libs/codemirror/2.36.0/formatting.js"></script>
    <link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.css" rel="stylesheet">
    <script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.js"></script>
    
    
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/main.css">
    <script src="${pageContext.request.contextPath}/js/board.js"></script>    
    <script src="${pageContext.request.contextPath}/js/jquery.serializejson.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/PagingTest.js"></script>

	
    
<script>

	reply = {};
	

	window.onload = function(){
		
    	BoardPaging(currentPageNo, boardCodeNo);
    	
        $(document).ready(function () {
            $('.summernote').summernote({
                height: 300,                 // set editor height
                minHeight: null,             // set minimum height of editor
                maxHeight: null,             // set maximum height of editor
                focus: true,                  // set focus to editable area after initializing summernote
                codemirror: { // codemirror options
                theme: 'monokai'
  			 }
            });
        });
        $(document).ready(function () {
            $('#summernote').summernote();
        });
		
        	
        //'작성완료' 전송 버튼 이벤트
        $('#send').on('click', function () {
            var fdata = $('#fid').serializeJSON();
            console.log(fdata);
            
            $.ajax({
            	type : "post",
            	url	 : "/CodePeople/BoardInsert.do",
            	data : fdata,
            	dataType: "json",	
            	success : function(res) {
					listServer();
				},
				error : function(xhr) {
					alert("상태 : " + xhr.status + " text : " + xhr.statusText);
				}
            	
            });
            
        }); //글작성 끝
        
        //글 수정,삭제 / 댓글 등록 수정 삭제 버튼 이벤트 
        $(document).on('click', '.action' , function() {
       
        	 var vname = $(this).attr('name');
             var vidx = $(this).attr('idx');
             var vidy = $(this).attr('idy');
              
             console.log(this);
             
             $('.getBoardNo').val(vidx);
             $('.getBoardCodeNo').val(vidy);
        	
        	if(vname == "update"){
        		alert(vidy + "번 코드");
        		alert(vidx + "번 글 수정");
        		alert(vname + "버튼네임이다 네임")
        		btnupdate = this;
        		
        		parent = $(this).parents('.card');
        		
        		//제목 태그 내용
        		writer = $(parent).find('.writer').text();
        		title = $(parent).find('.title').html();
        		content = $(parent).find('.content').html().trim();
        		
        		
        		console.log(writer);
        		console.log(title);
        		console.log(content);
        		
        		
				$('#updateModal .mwriter').val(writer);        		
				$('#updateModal .mtitle').val(title);        		
				$('#updateModal .note-editable').html(content);
				$('#updateModal .boardNo').val(vidx);
				
        		$('#updateModal').modal('show');
        	
        	//게시글 삭제	
        	}else if(vname == "delete"){
        		//alert(vidx + "번글 삭제할거임")
        		
        		/* btndelete = this; */
        		
        		
        		deleteBoardServer();
        	
        	//댓글 등록
        	}else if(vname == 'reply'){
        		alert(vidx + "번 글에 댓글")
        		
        		cont = $(this).prev().val();
        		console.log("댓글 등록 창에 쓴 글 " + cont);
        		boardNo = vidx;
        		console.log("댓글 쓰려는 게시판 번호 " + boardNo);
        		let boardCodeNo = 3;
        		
        		reply.boardNo = boardNo;
        		reply.repCont = cont;
        		reply.memNo = 1;
        		reply.boardCodeNo = boardCodeNo;
        		console.log(reply.boardNo);
        		console.log(reply.repCont);
        		console.log(reply.memNo);
        		
        		replyInsertServer(reply);
        		
        	//댓글 리스트	
        	}else if(vname == 'list'){  //글 제목 클릭시 오픈 됨
        		console.log("list")
        		
        		replyListServer(this , vidx);
        		//replyCommentListServer(this, vdix);
        		
        	}else if(vname == 'rmodify'){
        		//alert("댓글수정버튼")
         		//parent = $(this).parents('.rep')
        		
        		//댓글 원본 가져오기
        		mcont = $(this).parents('.reply-card').find('.reply-content');
        		
        		
        		console.log("댓글 원본" + mcont);
        		
        		
         		//$('#modiForm textarea').val(mcont);
        		
        		$(this).parents('.reply-card').find('.card-body').empty().append($('#modiForm'));
        		$('#modiForm').show();
        	
        	}else if(vname == 'rdelete'){
        		
        		reply.repNo = vidx;
        		
        		replyDeleteServer(this);
        		
        		
        	}
        	
        });
        //수정 완료 버튼 클릭시 이벤트
      //수정 완료 버튼 클릭시 이벤트
        $('#upsend').on('click', function() {
			
        	var udatas = $('#updateBoard').serializeJSON();
        	
        	alert(JSON.stringify(udatas));
			console.log("유데이터 : " + udatas);
			
			$.ajax({
				type : 'post',
				url : "/CodePeople/BoardUpdate.do",
				data : udatas,
				dataType : 'json',
				success : function(res) {
					alert(res.flag);
					
					$(btnupdate).parents('.card');
					$(parent).find('.title').text(udatas.title);
					$(parent).find('.content').text(udatas.content);
					
					listServer();
				},
				error : function(xhr) {
					
					alert("상태 : " + xhr);
					
				}
				
			})
			
			$('#updateModal .fin').val("");
			$('#updateModal').modal('hide');
			
		});
        
      //댓글수정 취소버튼 이벤트
        $('#btnreset').on('click', function() {
			
        	replyReset();
		})
        
        //댓글수정 확인 버튼 클릭 시 이벤트
        $('#btnok').on('click', function() {
			
        	mcont = $('#modiForm textarea').val()
        	
        	cp = $('#modiForm').parent();
        	
        	$('body').append($('#modiForm'));
        	$('#modiForm').hide();
        	
        	reply.repCont = mcont;
        	reply.repNo = vidx;
        	console.log("수정된 댓글" + reply.repCont);
        	console.log("수정된 댓글 번호" + reply.repNo);
        	
        	replyUpdateServer();
		});
        
        $('#btnupload').on('click', function() {
			
        	fileUploadServer()
        	
		})
        
        
    };

</script>

<style>
:root {
  --padding-header-left: 16px;
  --padding-header-right: 12px;
  --padding-header-ver: 9.94px;

  --padding-bodydivs-ver: 14px;
  --padding-bodydivs-hor: 10px;
  --padding-card-left: 16px;
  --padding-board-card-body: 32px;
  --padding-contdivs: 24px;
  --margin-contdivs-ver: 14px;
  --margin-dropdownbtn-right: 8px;

  --page-width: 1092px;
  --header-width-left: 345px;
  --header-width-right: 474.52px;
  --nav-left-var-width: 270px;
  --body-content-width: 790px;
  --board-card-width: 740px;
  --card-width: 350px;
  --card-left-width: 80px;

  --header-height: 50px;
  --aside-width: 270px;
  --content-width: 810px;

  --color-lightgray: rgb(217, 223, 235);
  --color-black: rgb(23, 23, 23);

  --color-border-basic: 1px solid rgb(217, 223, 235);
  --radius-border: 4px;

  --font--h1: 1.2em;
  --font--h1--height: 20px;
  --font--header: 14px;
  /* input 속성의 border효과 제거 */
  /* style="border:none;border-right:0px; border-top:0px; boder-left:0px; boder-bottom:0px;" */
}
/*  */
* {
  font-family: "IBM Plex Sans KR", sans-serif;
}

/* 태그 숨김을 위한 클래스의 정의 */
/* 기존에 숨어있는 요소에는 클래스값을 제거하고, 이벤트로 인해서 기존요소를 숨길경우 클래스값을 붙여주도록한다. */
.hide {
  display: none;
}

/* 헤더 */
#header {
  border-bottom: var(--color-border-basic);
  height: var(--header-height);
  display: flex;
  justify-content: center;
}
#header-container {
  position: fixed;
  margin-left: auto;
  margin-right: auto;
  height: var(--header-height);
  width: var(--page-width);
  display: flex;
  flex-direction: row;
  justify-content: space-between;
  box-sizing: border-box;
  background-color: white;
  border-bottom: var(--color-border-basic);
  z-index: 1;
}

/* 헤더 좌측 메뉴 */
#header-left-menu {
  width: var(--header-width-left);
  display: flex;
  flex-direction: row;
  box-sizing: border-box;
  justify-content: flex-start;
}
#header-left-menu .divider {
  border-left: var(--color-border-basic);
  width: 1px;
}
#header-left-menu #logo {
  box-sizing: border-box;
  padding-top: var(--padding-header-ver);
  padding-bottom: var(--padding-header-ver);
  padding-left: var(--padding-header-left);
  padding-right: var(--padding-header-left);
}

/* 헤더 좌측 통합 검색 */
#header-left-menu #search-box {
  box-sizing: border-box;
  width: 278px;
  height: 48px;
  padding-top: var(--padding-header-ver);
  padding-bottom: var(--padding-header-ver);
  padding-left: var(--padding-header-left);
  padding-right: var(--padding-header-left);
}
#header-left-menu #search-box #search-item {
  color: var(--color-lightgray);
  width: 246px;
  padding-top: 4px;
}
#header-left-menu #search-box #search-item input::placeholder {
  color: var(--color-lightgray);
}
#header-left-menu #search-box #search-item input:focus {
  outline: none;
}

/* 헤더우측메뉴 */
#header-right-menu {
  width: var(--header-width-right);
  display: flex;
  justify-content: flex-end;
}
#header-link-box {
  box-sizing: border-box;
  margin-top: 4px;

  padding-top: var(--padding-header-ver);
  padding-bottom: var(--padding-header-ver);
}
#header-link-box .header-link {
  margin-left: var(--padding-header-right);
  margin-right: var(--padding-header-right);
  color: var(--color-black);
  font-size: var(--font--header);
  text-align: center;
  text-decoration: none;
}
#header-login-btn {
  margin-top: var(--padding-header-ver);
  margin-bottom: var(--padding-header-ver);
  margin-left: var(--padding-header-right);
  margin-right: var(--padding-header-right);
  font-size: 12px;
  width: 55.14px;
  height: 32px;
}
#header-right-menu .divider {
  border-left: var(--color-border-basic);
  width: 1px;
  margin-left: var(--padding-header-right);
}

/* 바디 화면 */
#body {
  margin-top: var(--header-height);
  display: flex;
  justify-content: center;
}
#body-container {
  width: var(--page-width);
  margin-left: auto;
  margin-right: auto;
  display: flex;
  flex-direction: row;
  justify-content: space-between;
}

/* 바디 좌측 메뉴 */
/* 해당 메뉴 클릭시 이벤트로 active클래스를 넣어야한다.  */
.nav-left-bar {
  width: var(--nav-left-var-width);
  box-sizing: border-box;
  padding-left: var(--padding-bodydivs-hor);
  padding-right: var(--padding-bodydivs-hor);
  padding-top: var(--padding-bodydivs-ver);
  padding-bottom: var(--padding-bodydivs-ver);
  text-align: center;
}
.nav-left-bar a {
  text-decoration: none;
}
.nav-left-bar li:hover {
  box-shadow: 0px 3px 7px 1px rgba(0, 0, 0, 0.07),
    0px -3px 7px 1px rgba(0, 0, 0, 0.07);
}

/* 원페이지 화면에서 이동하게 하는 메뉴 */
.nav-sticky {
  width: var(--nav-left-var-width);
  box-sizing: border-box;
  padding-left: var(--padding-bodydivs-hor);
  padding-right: var(--padding-bodydivs-hor);
  padding-bottom: var(--padding-bodydivs-ver);
  text-align: center;
  position: fixed;
}

/*  */
/* 콘텐츠영역 */
/* .company 기업정보 .human 인재정보 .jo 채용정보 .my 마이페이지 */
#content {
  width: var(--content-width);
  box-sizing: border-box;
  padding-left: var(--padding-bodydivs-hor);
  padding-right: var(--padding-bodydivs-hor);
  padding-top: var(--padding-bodydivs-ver);
  padding-bottom: var(--padding-bodydivs-ver);
}

/* 콘텐츠 내부 검색 필터 박스 기본값*/
#content .filter-box {
  display: flex;
  flex-direction: column;
  justify-content: space-between;
}

/* content-box 클래스는 콘텐츠 내부의 div의 마진과 패딩을 관리하는 클래스 값이다. */
#content .content-box {
  border-radius: 4px;
  border: 1px solid lightgray;
  box-sizing: border-box;
  margin-bottom: var(--margin-contdivs-ver);
  padding: var(--padding-contdivs);
}
#content .content-box .h1 {
  font-size: var(--font--h1);
  text-align: left;
  margin-bottom: var(--margin-contdivs-ver);
}

/* 콘텐츠 내부 검색 박스 내 드롭다운 */
#content .filter-box-dropdowns {
  display: flex;
  flex-direction: row;
  margin-bottom: var(--margin-contdivs-ver);
}
#content .filter-box-dropdowns button {
  margin-right: var(--margin-dropdownbtn-right);
}

#content .filter-box .search-text {
  margin-bottom: var(--margin-contdivs-ver);
  display: flex;
  flex-direction: column;
}
.search-tags {
  display: flex;
  flex-direction: row;
  flex-wrap: wrap;
  margin-bottom: var(--margin-contdivs-ver);
}

/* 콘텐츠 내부 검색 박스 내 검색창 */

#content .filter-box .search-text input[type="text"] {
  width: var(--board-card-width);
}
#content .filter-box .search-text input[type="text"]::placeholder {
  color: var(--color-lightgray);
}

/* 콘텐츠 내부 검색 박스 내 검색어저장 버튼 */
#content .filter-box .filter-save-box {
  display: flex;
  flex-direction: row;
  justify-content: end;
}
#content .filter-box .filter-save {
  width: fit-content;
  color: var(--color-lightgray);
  border-color: var(--color-border-basic);
}

/* 콘텐츠 내부 검색 결과 */
#content .search-result {
  display: flex;
  flex-direction: row;
  flex-wrap: wrap;
  justify-content: space-around;
}

/* 콘텐츠 내부 카드 공통 */
#content .card {
  width: var(--card-width);
  margin-top: var(--margin-contdivs-ver);
  margin-bottom: var(--margin-contdivs-ver);
  display: flex;
  flex-direction: row;
}

/* 채용 정보 카드 */
#content .card-jo {
  width: var(--content-width);
}
#content .card-left {
  width: var(--card-left-width);
  padding-top: var(--padding-card-left);
  padding-left: var(--padding-card-left);
  box-sizing: border-box;
}
#content .search-result .card-right .card-top-box {
  display: flex;
  flex-direction: row;
  justify-content: space-between;
}

/* 기업에서만 적용되는 카드 별점 */
#content .company .card-right .card-rating-box {
  display: flex;
  flex-direction: row;
  margin-bottom: 12px;
}
#content .company .card-rating-box .card-rating-star {
  margin-right: 4px;
  color: gold;
}
#content .company .card-rating-box .card-rating-text {
  text-align: center;
  font-size: 0.7em;
}

/* 메뉴드롭박스버튼 */
#content .btn-menu {
  width: fit-content;
  outline: none;
  color: var(--color-lightgray);
  border-color: white;
}

/* 카드 내부 링크 */
.card-right a {
  text-decoration: none;
}

/* 인재 카드 활동분야 언어 */
#content .card .job-language {
  font-size: 0.7em;
}

/* 채용 정보 카드 디바이더 */
#content .card-jo .divider {
  border-top: var(--color-border-basic);
  margin-top: var(--padding-card-left);
  margin-bottom: var(--padding-card-left);
  height: 1px;
}

/* 채용정보 검색 결과 카드 세부 사항 */
#content .jobs-detail-top {
  display: flex;
  flex-direction: row;
  justify-content: space-between;
}
#content .card-jo .card-jobs-detail-company-into {
  font-size: 0.9em;
}
#content .card-jo .card-jobs-detail-company-jobgroup {
  font-size: 0.8em;
  color: gray;
}
#content .card-jo .jo-sm-font {
  font-size: 0.8em;
  color: gray;
}

/* 게시판 메인 */
#content .board-main {
  display: flex;
  flex-direction: column;
}
/* 게시판의 이름 */
#content .board-main h1 {
  font-size: var(--font--h1);
  text-align: left;
  margin-bottom: var(--margin-contdivs-ver);
}
.board-main .board-header {
  display: flex;
  flex-direction: row;
  justify-content: space-between;
}
.board-main .board-header .board-name {
  display: flex;
  flex-direction: row;
  width: fit-content;
}
.board-main .divider {
  border-top: var(--color-border-basic);
  margin-top: var(--padding-card-left);
  margin-bottom: var(--padding-card-left);
  height: 1px;
}

/* 게시판 등록 및 수정 Modal */
.modal-body label{
            width: 150px;
       }
       

/* 게시판의 글카드 안 제목과 조회수를 담는 박스 */
.board-main .board-detail {
  display: flex;
  flex-direction: row;
  justify-content: space-between;
}
/* 게시판판 게시글 제목 */
.board-main .board-detail a {
  text-decoration: none;
}
/* 조회수 박스 */
.view-box {
  font-size: 0.8em;
  color: gray;
}

/* 콘텐츠 게시판 더보기 버튼 */
.board-header .board-btn-box {
  display: flex;
  flex-direction: row;
  justify-content: end;
  width: fit-content;
}
.board-header .board-btn-box .btn {
  width: fit-content;
  height: fit-content;
  color: var(--color-lightgray);
  border-color: var(--color-border-basic);
  font-size: 0.7em;
}

/* 마이페이지 */
.my-box-item {
  display: flex;
  flex-direction: column;
  box-sizing: border-box;
  width: var(--body-content-width);
}

.my-box-header {
  display: flex;
  flex-direction: row;
  justify-content: space-between;
  padding-left: var(--padding-bodydivs-ver);
  padding-right: var(--padding-bodydivs-ver);
}
/* 마이페이지 이력서 카드 */
/* 사파리에서 버튼 오른쪽 정렬이 안되서 다시 적용한 이력서 버튼 박스 */
.card-cv .card-top-box .my-btn-box {
  display: flex;
  flex-direction: row;
  width: fit-content;
}
/* 이력서, 게시판의 수정 삭제 버튼 */
.card-body .my-btn-box .btn {
  width: fit-content;
  height: fit-content;
  font-size: 0.7em;
}
.my-btn-box-cv {
  display: flex;
  flex-direction: row;
  justify-content: end;
}
/* 이력서 카드 수정삭제 버튼 마진 */
.card-body .my-btn-box .btn {
  margin-left: 4px;
}
/* 이력서 카드의 상단 마진 */
#content .card-cv {
  width: var(--body-content-width);
  padding-top: 30px;
}
/* 이력서 카드의 작은 글자*/
.card-cv .card-text {
  font-size: 0.8em;
  color: gray;
}
/*게시판 게시글  */
.board-body .card-header {
  display: flex;
  flex-direction: row;
  justify-content: space-between;
}
#content .board .card {
  width: var(--board-card-width);
  flex-direction: column;
  box-sizing: border-box;
}
/* 게시판 조회수 추천 코멘트 아이콘 박스   */
.board-icon-box {
  font-size: 0.8em;
  color: gray;
}
/* 게시글 글 정보 박스 */
.board-info-box {
  font-size: 0.8em;
  color: gray;
  margin-bottom: var(--padding-board-card-body);
}
/* 게시글 제목 */
.board #accordion .card-header {
  height: 38px;
  align-items: baseline;
  padding-top: 0px;
}
#accordion .title-btn {
  height: 28px;
  padding: none;
  font-size: 1em;
}
/* 게시글 내부 패딩  */
#accordion .card-body {
  padding-left: var(--padding-board-card-body);
}
.board-divider {
  border-top: var(--color-border-basic);
  height: var(--padding-contdivs);
  margin-left: var(--padding-contdivs);
  margin-right: var(--padding-contdivs);
}
/* 댓글박스 */
.reply-box {
  box-sizing: border-box;
  padding-left: var(--padding-card-left);
  padding-right: var(--padding-card-left);
  font-size: 0.8em;
}
/* 게시글 아래 아이콘박스 */
.board-bottom-icon-box {
  display: flex;
  flex-direction: row;
  justify-content: center;
  margin-bottom: 24px;
}
.board-icon-item {
  font-size: 0.8em;
  margin-left: 8px;
  margin-right: 8px;
  width: 80px;
}
.reply-box .card-header {
  display: flex;
  justify-content: space-between;
}

.reply-dropdown-btn {
  color: gray;
}
.reply-dropdown-btn:hover {
  box-shadow: 0px 3px 7px 1px rgba(0, 0, 0, 0.07),
    0px -3px 7px 1px rgba(0, 0, 0, 0.07);
}
.reply-writer-box {
  font-size: 0.9em;
  padding-top: 16px;
  margin-left: 8px;
}
/* 댓글 카드 아이콘 상자 설정 */
.reply-card-icon-box {
  display: flex;
  flex-direction: row;
  justify-content: left;
  margin-left: 24px;
}
.reply-card-icon-box .board-icon-item {
  font-size: 0.9em;
  width: 60px;
}
.reply-btn-box .btn {
  width: fit-content;
  font-size: 0.7em;
  padding-top: 2px;
  padding-bottom: 2px;
  margin-right: 4px;
  margin-bottom: 12px;
}



/* 마이페이지의 유료서비스 항목 값  */
/* 유료서비스 플랜 아래 설명 박스 */
.payment-top-text{
	magrin-top: 8px;
}
/* 유료서비스 플랜들을 감싸는 박스 */
.payment-content-box{
	display: flex;
	flex-direction: row;
	justify-content: space-around;
	text-align: center;
}
.planbox {
	width: 200px;
}
.panel-heading{
	padding-top:20px;
	height: 50px;
	box-sizing: border-box;
}
/* 유료서비스 플랜별 설명 박스*/
.panel-body{
	padding-top:20px;
	height: 250px;
}
/* 유료서비스 플랜 결제 버튼*/
.panel-footer .btn:hover{
	  box-shadow: 0px 3px 7px 1px rgba(0, 0, 0, 0.07),
    0px -3px 7px 1px rgba(0, 0, 0, 0.07);
}

</style>


</head>



<body>

    <!-- 헤더 -->
    <div id="header">
        <!-- 헤더 메인 메뉴 바 -->
        <div id="header-container">
            <!-- 좌측 메뉴 -->
            <div id="header-left-menu">
                <!-- 로고 -->
                <a href="" id="logo"><i class="fas fa-copyright" style="font-size: 32px;"></i></a>
                <div class="divider"></div>
                <!-- 통합 검색창 -->
                <div id="search-box">
                    <div id="search-item">
                        <i class="fas fa-search item" style="width:15.3px; height:19px;"> </i>
                        <input class="" type="text"
                            style="height:19px; border:none;border-right:0px; border-top:0px; boder-left:0px; boder-bottom:0px;"
                            placeholder="통합검색">
                    </div>
                </div>
            </div>
            <!-- 우측 메뉴 -->
            <div id="header-right-menu">
                <!-- 메인 메뉴 링크 -->
                <div id="header-link-box">
                    <a class="header-link" href="/CodePeople/rehearsal/mainHr.html">인재</a>
                    <a class="header-link" href="/CodePeople/rehearsal/company.html">기업</a>
                    <a class="header-link" href="/CodePeople/rehearsal/mainJo.html">채용</a>
                    <a class="header-link" href="/CodePeople/rehearsal/mainBoard.html">커뮤니티</a>
                    <a class="header-link" href="/CodePeople/rehearsal/mainMypage.html">마이페이지</a>
                </div>
                <div class="divider"></div>
                <!-- 로그인버튼 -->
                <button id="header-login-btn" class="btn btn-primary btn-sm">로그인</button>
            </div>
        </div>
    </div>

    <!-- 바디 -->
    <div id="body">
        <div id="body-container">
            <!-- 바디 메인 좌측 메뉴바 -->
            <div class="nav-left-bar">
                <div class="nav-sticky">
                    <ul class="list-group">
                        <li class="list-group-item active">토픽 베스트</li>
                        <li class="list-group-item">회사 생활</li>
                        <li class="list-group-item">사는 얘기</li>
                        <li class="list-group-item">스터디 모임</li>
                        <li class="list-group-item">이직 커리어</li>
                        <li class="list-group-item">Q & A</li>
                    </ul>
                </div>
            </div>
            <!-- 바디 콘텐츠 -->
            <div id="content">
            <!-- 게시판 메인: 카테고리 검색 -->
            <div class="filter-box content-box board">
                <h1 class="h1">관심있는 내용을 검색해보세요!</h1>
                <div class="search-tags"></div>
                <div class="input-group mb-3 col-lg-10 search-text">
                    <input type="text" class="form-control" placeholder="검색어 입력">
                </div>
                <div class="filter-save-box">
                    <button type="button" class="btn btn-outline-primary filter-save">검색</button>
                </div>
            </div>
			
            <!-- 게시판 게시글 상세 화면 글쓰기 댓글 등등 기능 있음-->
            <div class="content-box search-result board board-main board-life">
                <div class="board-header">
                    <div class="board-name">
                        <i class="fas fa-building"></i>&nbsp;<h1 class="h1">회사생활</h1>
                    </div>
                    <div class="my-btn-box">
                        <button id="write" type="button" class="btn btn-outline-primary" data-bs-toggle="modal" data-bs-target="#writeModal">글쓰기</button>
                    </div>
                </div>
				<!-- 게시글 작성(글쓰기) 폼 -->
				<div class="modal" id="writeModal">
						<div class="modal-dialog modal-lg">
							<div class="modal-content">

								<!-- Modal Header -->
								<div class="modal-header">
									<h4 class="modal-title">글쓰기</h4>
									<button type="button" class="btn-close" data-bs-dismiss="modal"></button>
								</div>

								<!-- Modal body -->
								<div class="modal-body">
                                    <form id="fid" action="">
									    <label>작성자</label><input class="mobody-input writer" type="text" name="memId" disabled="disabled"><br>
									    <label>제목</label><input class="mobody-input title" type="text" name="boardTitle"><br>
									    <label>Tags</label><input class="mobody-input tag" type="text" name="boardHead">
									    <input type="hidden" name="memNo" value="<%=memNo%>">
<!--                                         <div class="mobody-input" name="note" id="summernote"></div>  -->
                                        <textarea name="boardCont" class="summernote"></textarea>
                                    </form>
<!--                                      action="/CodePeople/upload" method="post" enctype="multipart/form-data" -->
                                    <form id="fileUpload">
                                    <button type="button" id="send" class="btn btn-primary" data-bs-dismiss="modal">작성완료</button>
                                   	<input type="file" name="uploadfile" class="btn btn-primary">
                                   	<button type="submit" id="btnupload" value="업로드" class="btn btn-primary">업로드</button>
									<button type="button" class="btn btn-primary" data-bs-dismiss="modal">닫기</button>
                                    </form>
								</div>

								<!-- Modal footer -->
								<div class="modal-footer">
								</div>

							</div>
						</div>
					</div>
					
					
				<!-- 게시글 수정 폼 -->
		<div class="modal" id="updateModal">
			<div class="modal-dialog modal-lg">
				<div class="modal-content">

				<!--Modal Header  -->
				<div class="modal-header">
					
					<h4 class="modal-title">수정하기</h4>
					<button type="button" class="btn-close" data-bs-dismiss="modal"></button>
				</div>

				<!-- Modal body -->
				<div class="modal-body">
					<form id="updateBoard">
						<label>작성자</label><input class="mobody-input fin mwriter" type="text" name="memId" readonly><br>
						<label>제목</label><input class="mobody-input fin mtitle" type="text" name="boardTitle"><br> 
						<label>Tags</label><input class="mobody-input fin mtag" type="text" name="boardHead">
<!-- 					<div class="mobody-input" name="note" id="summernote"></div>  -->
						<textarea name="boardCont" class="summernote fin mcont" placeholder="hi"></textarea>
						<input type='hidden' name="boardNo" class="boardNo" value="" id="getBoardNo">
						<input type='hidden' name="boardCodeNo" class="boardCodeNo" value="" id="getboardCodeNo">
					<button type="button" id="upsend" class="btn btn-primary" data-bs-dismiss="modal">수정완료</button>
					</form>
				</div>

				<!-- Modal footer -->
				<div class="modal-footer">
					<button type="button" class="btn btn-primary" data-bs-dismiss="modal">닫기</button>
				</div>
			</div>
		</div>
	</div>
	
			<!-- 댓글 수정폼 -->
		<div id="modiForm" style="display: none">
	      <textarea rows="5" cols="30"></textarea>
	      <input type="button" id="btnok" value="확인"> 
	      <input type="button" id="btnreset" value="취소">
	   </div>
	   
	   
				<div class="board-body">
                <div class="divider"></div>
                <!-- 아코디언 게시글들의 시작 -->
                    <div id="accordion">
                    	<% for(Map<String, Object> vo : boardList){%>
		                <div class="card">
			        		<div class="card-header">
				        		<a class="btn title-btn boardNo action" name="list" id="list" idx="<%= vo.get("BOARD_NO") %>"data-bs-toggle="collapse" href="#a<%= vo.get("BOARD_NO") %>">
					        		<span class="board-detail-title title">'<%= vo.get("BOARD_TITLE") %>'</span>
				        		</a>
				        		<div class="board-icon-box">
					        		<i class="far fa-eye"></i>&nbsp;<span class="board-view board-sm-font">'<%= vo.get("BOARD_HIT") %>'</span>&nbsp;&nbsp;
					        		<i class="far fa-thumbs-up"></i>&nbsp;<span class="board-like board-sm-font">'<%= vo.get("BOARD_LIKE") %>'</span>&nbsp;&nbsp;
					        		<i class="far fa-comment"></i>&nbsp;<span class="board-comment board-sm-font">'<%= vo.get("BOARD_REPL") %>'</span>&nbsp;&nbsp;
				        		</div>
			        		</div>
			        		
			        		<div id="a<%= vo.get("BOARD_NO") %>" class="collapse" data-bs-parent="#accordion">
				        		<div class="card-body cbody">
					        		<div class="board-info-box">
						        		작성자&nbsp;:&nbsp;<span class="board-detail-writer writer"><%= vo.get("MEM_ID") %></span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						        		작성 일&nbsp;:&nbsp;<span class="board-detail-date">'<%= vo.get("BOARD_DATE") %>'</span> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						        		<a href="" style="text-decoration: none;">추천</a>&nbsp;&nbsp;
						        		<a href="" style="text-decoration: none;">신고</a>
					        		</div>
					        		<span class="board-detail-content content">
					        			${v.boardCont} 
					        		</span>
					        		<div class="my-btn-box my-btn-box-cv">
						        		<button type="button" name="update" idx= '<%= vo.get("BOARD_NO") %>' class="btn btn-outline-primary action updatebtn">수정</button>
						        		<button type="button" name="delete" idx= '<%= vo.get("BOARD_NO") %>' class="btn btn-outline-primary action">삭제</button>
					        		</div>
				        		</div>
				        		<div class="board-divider"></div>
				        		<div class="board-bottom-icon-box">  
					        		<div class="board-icon-item"><i class="far fa-thumbs-up"></i>&nbsp;<span class="board-like board-sm-font">좋아요</span></div>
					        		<div class="board-icon-item"><i class="far fa-comment"></i>&nbsp;<span class="board-comment board-sm-font">댓글</span></div>
					        		<div class="board-icon-item"><i class="far fa-frown"></i>&nbsp;<span class="board-comment board-sm-font">신고</span></div>
				        		</div>
				        		
				        		<div class="reply-box rep" id="rp-box-<%= vo.get("BOARD_NO") %>">
					        		<div class="input-group mb-3">
						        		<input type="text" idx='<%= vo.get("BOARD_NO") %>' class="form-control" placeholder="댓글을 입력하세요">
						        		<button type="button" name="reply" idx='<%= vo.get("BOARD_NO") %>' class="btn btn-outline-primary action">등록</button>
					        		</div>
				        		</div>
			        		</div>
		        		</div> 
                    	<%	} %>
                    </div>
                </div>
                
        		<div class="board-footer">
        			<div id="result-page-box">
			   			<%  int firstPage = pagingVO.getFirstPageNo();
			   				int pageCount = pagingVO.getPageSize();
			   				int currentPage = pagingVO.getCurrentPageNo();
			   				int lastPage = pagingVO.getLastPageNo();
			   				int totalPageCount = pagingVO.getTotalPageCount(); %>
						<ul class="pagination">
						<% if (firstPage > pageCount) { %>
							<li class="page-item"><a class="page-link" href="/CodePeople/EachBoardPaging.do?currentPageNo=<%=firstPage - pageCount %>&boardCode=<%=boardCode %>">Previous</a></li>
						<% } %>
			
						<% for (int i = firstPage; i <= lastPage; i++) { %>
						<%	if (i == currentPage) { %>
								<li class="page-item active"><a class="page-link" href="/CodePeople/EachBoardPaging.do?currentPageNo=<%=i %>&boardCode=<%=boardCode %>"><%= i%></a></li>
						<% 	} else { %>
								<li class="page-item"><a class="page-link" href="/CodePeople/EachBoardPaging.do?currentPageNo=<%=i %>&boardCode=<%=boardCode %>"><%= i%></a></li>
						<% 	}
						} %>
			
						<% if (lastPage < totalPageCount) { %>
							<li class="page-item"><a class="page-link" href="/CodePeople/EachBoardPaging.do?currentPageNo=<%=firstPage + pageCount %>&boardCode=<%=boardCode %>">Next</a></li>
						<% } %>
						</ul>
        			</div>CodePeople/EachBoardPaging.do        		
        		</div>
            </div>



        </div>
     </div>
    </div>

    <!--  풋터-->
    <div id="footer">
        <div id="footer-container"></div>
    </div>
    
    





</body>


</html>