<%@page import="kr.or.ddit.cmm.vo.BoardPagingVO"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@page import="kr.or.ddit.member.vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	String boardName = (String) request.getAttribute("boardName");
	Integer currentPageNo = (Integer)request.getAttribute("currentPageNo");
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
    <script src="${pageContext.request.contextPath}/js/boardFunction.js"></script>    
    <script src="${pageContext.request.contextPath}/js/jquery.serializejson.min.js"></script>
    
<script>

	reply = {};

// 	let currentPageNo = 1;
// 	let boardCode = 1;
	
	window.onload = function(){
	
		currentPageNo = <%=currentPageNo %>;
		boardCodeNo = <%=boardCode %>;
		
		console.log(currentPageNo);
		console.log(boardCodeNo);
    	console.log("EachBoard.jsp이다");
    	
        $(document).ready(function () {
            $('.summernote').summernote({
                height: 300,                 // set editor height
                minHeight: null,             // set minimum height of editor
                maxHeight: null,             // set maximum height of editor
                focus: true,                  // set focus to editable area after initializing summernote
                codemirror: { // codemirror options
                theme: 'monokai',
                
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
            	url	 : "/CodePeople/BoardInsert.do",
            	type : "post",
            	data : fdata,
            	dataType: "json",	
            	success : function(res) {
            		//alert(res.flag);
            		location.href="/CodePeople/EachBoardPaging.do?currentPageNo=1&boardCode=<%=boardCode %>";
                	
				},
				error : function(xhr) {
					//alert("상태 : " + xhr.status + " text : " + xhr.statusText);
				}
            	
            });
            
        }); //글작성 끝
        
        //글 수정,삭제 / 댓글 등록 수정 삭제 버튼 이벤트 
        $(document).on('click', '.action' , function() {
       
           vname = $(this).attr('name');
           vidx = $(this).attr('idx');
           memNo = $(this).attr('mdx');   
           
           
           
        	if(vname == "update"){
        		//alert(vidx + "번 글 수정");
        		//alert(vname + "버튼네임이다 네임")
        		//alert(memNo + "멤버번호 네임")
        		
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
        		
        		//alert(vidx + "번 글에 댓글")
        		//alert(boardCodeNo + "번 게시판 코드에 댓글")
        		//alert(memNo + "번 등록할 아이디")
        		
        		cont = $(this).prev().val();
        		console.log("댓글 등록 창에 쓴 글 " + cont);
        		boardNo = vidx;
        		console.log("댓글 쓰려는 게시판 번호 " + boardNo);
//         		let boardCodeNo = 3;
        		
        		reply.boardNo = boardNo;
        		reply.repCont = cont;
        		reply.memNo = memNo;
        		reply.boardCodeNo = boardCodeNo;
        		console.log(reply.boardNo);
        		console.log(reply.repCont);
        		console.log(reply.memNo);
        		console.log(reply.boardCodeNo);
        		
        		replyInsertServer(reply);
        		
        	//댓글 리스트	
        	}else if(vname == 'list'){  //글 제목 클릭시 오픈 됨
        		console.log("list")
        		
        		boardHitServer();
        		
        		replyListServer(this , vidx);
        	
        		
        		
        	//댓글 수정
        	}else if(vname == 'rmodify'){
        		//alert("댓글수정버튼")
//         		parent = $(this).parents('.rep')
        		
        		//댓글 원본 가져오기
        		mcont = $(this).parents('.reply-card').find('.reply-content');
        		
        		
        		console.log("댓글 원본" + mcont);
        		
        		
//         		$('#modiForm textarea').val(mcont);
        		
        		$(this).parents('.reply-card').find('.card-body').empty().append($('#modiForm'));
        		$('#modiForm').show();
	        	// 댓글 삭제
	        	}else if(vname == 'rdelete'){
	        		
	        		replyDeleteServer(this);
	        	// 댓글 좋아요
	        	}else if(vname == 'rlike'){
	        		replyLikeServer(this);
	        	// 댓글 신고
	        	}else if(vname == 'rreport'){
		        	replyReportServer(this);
		        // 게시글 좋아요
	        	}else if(vname == 'like'){
	        		boardLikeServer(this);
	        	// 게시글 신고
	        	}else if(vname == 'report'){
	        		boardReportServer(this);
	        	}
        	
        });
        //수정 완료 버튼 클릭시 이벤트
        $('#upsend').on('click', function() {
			
        	udatas = $('#upModal').serializeJSON();
        	
        	//alert(JSON.stringify(udatas));
			console.log("유데이터 : " + udatas)
			
			updateBoardServer();
			
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
      

    };

</script>

</head>

<style>
	.input-file {
    width: 0.1px;
    height: 0.1px;
    opacity: 0;
    overflow: hidden;
    position: absolute;
    z-index: -1;
	}
    
	.js-labelFile {
	  
	  overflow: hidden;
	  text-overflow: ellipsis;
	  white-space: nowrap;
	  padding: 0 10px;
	  cursor: pointer;
	}
	.js-labelFile .icon:before {
	  content: "\f093";
	}
	.has-file .icon:before {
	    content: "\f00c";
	    color: #5AAC7B;
	  }
	 .modal-body label{
            width: 150px;
       }
     .btn-tertiary {
	  color: #555;
	  padding: 0;
	  line-height: 40px;
	  width: 300px;
	  margin: auto;
	  display: block;
	  border: 2px solid #555;
	}
	.btn-tertiary:hover, 
	.btn-tertiary:focus {
	    color: lighten(#555, 20%);
	    border-color: lighten(#555, 20%);

  }    
  .note-popover *{
  	display : none;
  }
	</style>

<body>

    <!-- 헤더 -->
    <div id="header">
        <!-- 헤더 메인 메뉴 바 -->
        <div id="header-container">
            <!-- 좌측 메뉴 -->
            <div id="header-left-menu">
                <!-- 로고 -->
                <a href="/CodePeople/rehearsal/index.jsp" id="logo"><i class="fas fa-copyright" style="font-size: 32px;"></i></a>
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
                    <a class="header-link" href="/CodePeople/MainHR.do">인재</a>
                    <a class="header-link" href="/CodePeople/CompanyPagingList.do">기업</a>
                    <a class="header-link" href="/CodePeople/JobOpeningCardPagingList.do">채용</a>
                    <a class="header-link" href="/CodePeople/htmltest/boardFunctionTest.html">커뮤니티</a>
                    <a class="header-link" href="/CodePeople/GoMyPage.do">마이페이지</a>
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
                  <!-- <li class="list-group-item">토픽 베스트</li> -->
                        <a href="/CodePeople/EachBoardPaging.do?currentPageNo=1&boardCode=1"><li class="list-group-item">회사 생활</li></a>
                        <a href="/CodePeople/EachBoardPaging.do?currentPageNo=1&boardCode=2"><li class="list-group-item">사는 얘기</li></a>
                        <a href="/CodePeople/EachBoardPaging.do?currentPageNo=1&boardCode=3"><li class="list-group-item">이직 커리어</li></a>
                        <a href="/CodePeople/EachBoardPaging.do?currentPageNo=1&boardCode=4"><li class="list-group-item">스터디 모임</li></a>
                        <a href="/CodePeople/EachBoardPaging.do?currentPageNo=1&boardCode=5"><li class="list-group-item">Q & A</li></a>
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
                        <i class="fas fa-building"></i>&nbsp;<h1 class="h1"><%=boardName %></h1>
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
                                    <form id="fid" action="" enctype="multipart-formdata">
									    <label>작성자</label><input class="mobody-input writer" type="text" name="memId" disabled="disabled"><br>
									    <label>제목</label><input class="mobody-input title" type="text" name="boardTitle"><br>
									    <label>Tags</label><input class="mobody-input tag" type="text" name="boardHead">
<!--                                         <div class="mobody-input" name="note" id="summernote"></div>  -->
                                        <textarea name="boardCont" class="summernote"></textarea>
	                                    <input type='hidden' name="boardNo" class="boardNo" value="" id="getBoardNo">
										<input type='hidden' name="boardCodeNo" class="boardCodeNo" value="<%=boardCode %>" id="getboardCodeNo">
<!-- 	                                    	<div class="form-group"> -->
<!-- 					                            <input type="file" name="Uploadfile" id="file" class="input-file" value=""> -->
<!-- 					                            <label for="file" class="btn btn-tertiary js-labelFile"> -->
<!-- 					                                <i class="icon fa fa-check"></i> -->
<!-- 					                                <span class="js-fileName">Choose a file</span> -->
<!-- 					                            </label> -->
<!-- 					                            <input type="hidden" value="" name="memId"> -->
<!-- 					                        </div>  -->
			                            <!-- <button type="button" id="send" class="btn btn-primary" data-bs-dismiss="modal">작성완료</button>
                                    </form>
                                    	<form id="fileUpload"> -->
		                                   	<input type="file" name="uploadfile" class="btn btn-primary">
		                                    <button type="button" id="send" class="btn btn-primary" data-bs-dismiss="modal">작성완료</button>
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
								<form id="upModal">
									<label>작성자</label><input class="mobody-input fin mwriter" type="text" name="memId" disabled="disabled"><br>
									<label>제목</label><input class="mobody-input fin mtitle" type="text" name="boardTitle"><br> 
									<label>Tags</label><input class="mobody-input fin mtag" type="text" name="boardHead">
			<!-- 					<div class="mobody-input" name="note" id="summernote"></div>  -->
									<textarea name="boardCont" class="summernote fin mcont" placeholder="hi"></textarea>
									<input type='hidden' name="boardCodeNo" class="boardCodeNo" value="<%=boardCode %>" id="getboardCodeNo">
									<input type='hidden' name="boardNo" class="boardNo" value="">
								</form>
								<button type="button" id="upsend" class="btn btn-primary" data-bs-dismiss="modal">수정완료</button>
							</div>
			
							<!-- Modal footer -->
							<div class="modal-footer">
								<button type="button" class="btn btn-primary" data-bs-dismiss="modal">닫기</button>
							</div>
						</div>
					</div>
				</div>
				
				<div class="board-body">
                <div class="divider"></div>
                <!-- 아코디언 : 게시판 게시글들 시작 -->
                    <div id="accordion">
                    	<% for(Map<String, Object> vo : boardList){%>
		                <div class="card">
			        		<div class="card-header">
				        		<a class="btn title-btn boardNo action" name="list" id="list" flag="no" toggle="off" idx="<%= vo.get("BOARD_NO") %>"data-bs-toggle="collapse" href="#a<%= vo.get("BOARD_NO") %>">
					        		<span class="board-detail-title title"><%= vo.get("BOARD_TITLE") %></span>
				        		</a>
				        		<div class="board-icon-box">
					        		<i class="far fa-eye"></i>&nbsp;<span class="board-view board-sm-font"><%= vo.get("BOARD_HIT") %></span>&nbsp;&nbsp;
					        		<i class="far fa-thumbs-up"></i>&nbsp;<span class="board-like board-sm-font"><%= vo.get("BOARD_LIKE") %></span>&nbsp;&nbsp;
					        		<i class="far fa-comment"></i>&nbsp;<span class="board-comment board-sm-font"><%= vo.get("BOARD_REPL") %></span>&nbsp;&nbsp;
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
					        			<%= vo.get("BOARD_CONT") %>
					        		</span>
					        		<div class="my-btn-box my-btn-box-cv">
						        		<button type="button" name="update" idx= '<%= vo.get("BOARD_NO") %>' class="btn btn-outline-primary action updatebtn">수정</button>
						        		<button type="button" name="delete" idx= '<%= vo.get("BOARD_NO") %>' class="btn btn-outline-primary action">삭제</button>
					        		</div>
				        		</div>
				        		<div class="board-divider"></div>
				        		<div class="board-bottom-icon-box">  
					        		<div class="board-icon-item action" name="like"><i class="far fa-thumbs-up"></i>&nbsp;<span class="board-like board-sm-font">좋아요</span></div>
					        		<div class="board-icon-item action"><i class="far fa-comment"></i>&nbsp;<span class="board-comment board-sm-font">댓글</span></div>
					        		<div class="board-icon-item action" name="report"><i class="far fa-frown"></i>&nbsp;<span class="board-comment board-sm-font">신고</span></div>
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
        			</div>  		
        		</div>
            </div>
            
	            			<!-- 댓글 수정폼 -->
			<div id="modiForm" style="display: none">
		      <textarea rows="5" cols="30"></textarea>
		      <input type="button" id="btnok" value="확인"> 
		      <input type="button" id="btnreset" value="취소">
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