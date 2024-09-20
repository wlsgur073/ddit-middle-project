boardLikeServer = function(target){
	console.log(vidx + '번 글에 좋아요 누름');
	
	$.ajax({
		type : 'get',
		url : "/CodePeople/UpdateBoardLike.do",
		data : 	{ 
			"boardNo" : vidx,
			"boardCodeNo" : boardCodeNo
		 },
		dataType : 'json',
		success : function(res) {
			if(isNaN($(target).find('span').text())){
				$(target).find('span').text(1);
			}else{
				$(target).find('span').text(parseInt($(target).find('span').text()) + 1);
			}
		},	
		error : function(xhr) {
			//alert("상태 : " + xhr)
		}
	})	
}



boardReportServer = function(target){
	console.log(vidx + '번 글에 신고 누름');
	
	$.ajax({
		type : 'get',
		url : "/CodePeople/UpdateBoardRept.do",
		data : 	{ 
			"boardNo" : vidx,
			"boardCodeNo" : boardCodeNo
		 },
		dataType : 'json',
		success : function(res) {
			if(isNaN($(target).find('span').text())){
				$(target).find('span').text(1);
			}else{
				$(target).find('span').text(parseInt($(target).find('span').text()) + 1);
			}
		},	
		error : function(xhr) {
			//alert("상태 : " + xhr)
		}
	})	
}

listServer = function() {
	
	$.ajax({
        type: "get",
        url: "/CodePeople/BoardList.do",
        
        dataType: "json",
        success: function (res) {
          
        	code = "";
        	
        	$(res).each(function(i,v){
        		
        		//<!-- 게시글의 한단위  -->
        		//<!-- card-hear 안 a태그와 게시글의 아이디를 맞춰주세요 -->
        	code += `
        		<div class="card">
	        		<div class="card-header">
		        		<a class="btn title-btn boardNo action" name="list" id="list" flag="no" toggle="off" idx="${v.boardNo}"data-bs-toggle="collapse" href="#a${v.boardNo}">
			        		<span class="board-detail-title title">${v.boardTitle}</span>
		        		</a>
		        		<div class="board-icon-box">
			        		<i class="far fa-eye"></i>&nbsp;<span class="board-view board-sm-font" id="board-hit-${v.boardNo}">${v.boardHit}</span>&nbsp;&nbsp;
			        		<i class="far fa-thumbs-up"></i>&nbsp;<span class="board-like board-sm-font">${v.boardLike}</span>&nbsp;&nbsp;
			        		<i class="far fa-comment"></i>&nbsp;<span class="board-comment board-sm-font">${v.boardRepl}</span>&nbsp;&nbsp;
		        		</div>
	        		</div>
	        		
	        		<div id="a${v.boardNo}" class="collapse" data-bs-parent="#accordion">
		        		<div class="card-body cbody">
			        		<div class="board-info-box">
				        		작성자&nbsp;:&nbsp;<span class="board-detail-writer writer">${v.memId}</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				        		작성 일&nbsp;:&nbsp;<span class="board-detail-date">'${v.boardDate}'</span> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				        		<a href="" style="text-decoration: none;">추천</a>&nbsp;&nbsp;
				        		<a href="" style="text-decoration: none;">신고</a>
			        		</div>
			        		<span class="board-detail-content content">
			        			${v.boardCont} 
			        		</span>
			        		<div class="my-btn-box my-btn-box-cv">
				        		<button type="button" name="update" idx= '${v.boardNo}' mdx=${v.memId} class="btn btn-outline-primary action updatebtn">수정</button>
				        		<button type="button" name="delete" idx= '${v.boardNo}' mdx=${v.memId} class="btn btn-outline-primary action">삭제</button>
			        		</div>
		        		</div>
		        		<div class="board-divider"></div>
		        		<div class="board-bottom-icon-box">  
			        		<div class="board-icon-item action" name="like" idx='${v.boardNo}'><i class="far fa-thumbs-up"></i>&nbsp;<span class="board-like board-sm-font">${v.boardLike}</span></div>
			        		<div class="board-icon-item action" name="reply" idx='${v.boardNo}'><i class="far fa-comment"></i>&nbsp;<span class="board-comment board-sm-font">${v.boardRepl}</span></div>
			        		<div class="board-icon-item action" name="report" idx='${v.boardNo}'><i class="far fa-frown"></i>&nbsp;<span class="board-comment board-sm-font">신고</span></div>
		        		</div>
		        		
		        		<div class="reply-boxt" id="rp-box-${v.boardNo}">
			        		<div class="input-group mb-3">
				        		<input type="text" idx='${v.boardNo}' class="form-control" placeholder="댓글을 입력하세요">
				        		<button type="button" name="reply" idx='${v.boardNo}' mdx=${v.memId} class="btn btn-outline-primary action">등록</button>
			        		</div>
		        		</div>
	        		</div>
        		</div>`;
        	});	
        
        	$('#accordion').html(code);
        },
        error: function(xhr){
        	//alert("상태 : " + xhr.status + " text : " + xhr.statusText);
        }
    });
	
}


updateBoardServer = function() {
	
	$.ajax({
		type : 'post',
		url : "/CodePeople/BoardUpdate.do",
		data : udatas,
		dataType : 'json',
		success : function(res) {
			
			$(btnupdate).parents('.card');
			$(parent).find('.title').text(udatas.title);
			$(parent).find('.content').text(udatas.content);
			
			BoardPaging(currentPageNo, boardCodeNo);
			location.href="/CodePeople/EachBoardPaging.do?currentPageNo=1&boardCode=" + boardCodeNo;
		},
		error : function(xhr) {
			//alert(res.flag);
			
			
		}
		
	})
};

deleteBoardServer = function() {

	// html 태그에서 boardCodeNo 정보를 꺼내오도록 수정해야함!!! 
	
	$.ajax({
		type : 'get',
		url : "/CodePeople/BoardDelete.do",
		data : 	{
			"boardNo" : vidx,
			"boardCodeNo" : boardCodeNo
			},
		dataType : 'json',
		success : function(res) {

			BoardPaging(currentPageNo, boardCodeNo);
			location.href="/CodePeople/EachBoardPaging.do?currentPageNo=1&boardCode=" + boardCodeNo;
		},	
		error : function(xhr) {
			//alert("상태 : " + xhr)
		}
	})
	
	
	
};

deleteReplyServer = function() {

	// html 태그에서 boardCodeNo 정보를 꺼내오도록 수정해야함!!! 
	
	$.ajax({
		type : 'get',
		url : "/CodePeople/BoardDelete.do",
		data : 	{
			"repNo" : vidx
			},
		dataType : 'json',
		success : function(res) {

			replyListServer();
			location.href="/CodePeople/EachBoardPaging.do?currentPageNo=1&boardCode=" + boardCodeNo;
		},	
		error : function(xhr) {
			//alert("상태 : " + xhr)
		}
	})
	
	
	
};

replyLikeServer = function(target){
	
	console.log(vidx + '번 댓글에 좋아요 누름');
	
	$.ajax({
		type : 'get',
		url : "/CodePeople/UpdateReplyLike.do",
		data : 	{ "repNo" : vidx },
		dataType : 'json',
		success : function(res) {
			if(isNaN($(target).find('span').text())){
				$(target).find('span').text(1);
			}else{
				$(target).find('span').text(parseInt($(target).find('span').text()) + 1);
			}
		},	
		error : function(xhr) {
			//alert("상태 : " + xhr)
		}
	})
		
}

replyReportServer = function(target){
	
	console.log(vidx + '번 댓글에 신고 누름');
	
	$.ajax({
		type : 'get',
		url : "/CodePeople/UpdateReplyRept.do",
		data : 	{
			"repNo" : vidx
			},
		dataType : 'json',
		success : function(res) {
			if(isNaN($(target).find('span').text())){
				$(target).find('span').text(1);
			}else{
				$(target).find('span').text(parseInt($(target).find('span').text()) + 1);
			}
		},	
		error : function(xhr) {
			//alert("상태 : " + xhr)
		}
	})
		
}

replyListServer = function(t, vidx) { // html의 등록버튼
	console.log("실행");
	console.log("vidx : "  + vidx);
	
	console.log($(t).attr('flag'));
	console.log($(t).attr('toggle'));
	
	let temp = vidx;
	// 처음 한번만 댓글 리스트를 어펜드하기 위해 flag가 no인 경우에만 댓글 리스트를 불러옴
	if($(t).attr('flag') === 'no'){
		$.ajax({
		type : 'get',
		url : "/CodePeople/ReplyList.do",
		data : {"boardNo" : vidx},
		dataType : 'json',
		success : function(res) {
			console.log("replyListServer");
			
			let rcode= " ";
			
			$.each(res, function(i, v){
				
				rcode += `
				<div class="reply-card bg-light text-dark rep">                                        
					<div class="reply-writer-box">
			    		&nbsp;&nbsp;작성자&nbsp;&nbsp;<span class="reply-writer rwriter">${v.memId}</span> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			    		&nbsp;&nbsp;작성일&nbsp;&nbsp;<span class="reply-date">${v.repDate}</span> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			    		&nbsp;&nbsp;<i class="far fa-thumbs-up"></i>&nbsp;<span class="board-like board-sm-font">${v.repLike}</span>&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						&nbsp;&nbsp;<i class="far fa-comment"></i>&nbsp;<span class="board-comment board-sm-font">${v.repRept}</span>&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		    		</div>  
		            <div class="card-body" id="rcontent"><span class="reply-content">${v.repCont}</span></div>
		            <div class="reply-card-icon-box">  
		                <div class="board-icon-item action" idx="${v.repNo}" name="rlike"><i class="far fa-thumbs-up"></i>&nbsp;<span class="reply-like board-sm-font">${v.repLike}</span></div>
		                <div class="board-icon-item action" idx="${v.repNo}" pidx="${temp}" name="rereply"><i class="far fa-comment"></i>&nbsp;<span class="reply-reply-cnt board-sm-font">대댓글</span></div>
		                <div class="board-icon-item action" idx="${v.repNo}" name="rreport"><i class="far fa-frown"></i>&nbsp; <span class="reply-report board-sm-font">${v.repRept}</span></div>
		            </div>
		            <div class="my-btn-box-cv reply-btn-box">
		                <button type="button" idx="${v.repNo}" boardNo="${temp}" name="rmodify" class="btn btn-outline-secondary action">수정</button>
		                <button type="button" idx="${v.repNo}" boardNo="${temp}" name="rdelete" class="btn btn-outline-secondary action">삭제</button>
		            </div>
		        </div>
		        `;
			})
			
			let search = 'rp-box-' + temp;
			console.log('rp-box-' + temp);
			
			$('#' + search).append(rcode);
			
			
		},
		error : function(xhr) {
			//alert("상태 : " + xhr.status)
		}
		
	})
	}
	
	
	
	// 처음 한번만 댓글 리스트를 어펜드하기 위해 flag를 yes로 설정
	$(t).attr('flag', 'yes');
	
	// 토글 상태가 off일 때만 조회수를 증가하도록 설정
	if($(t).attr('toggle') === 'off'){
		boardHitServer();
	}
	
	// 토글상태 변화
	if($(t).attr('toggle') === 'on'){
		$(t).attr('toggle', 'off');
	}else if($(t).attr('toggle') === 'off'){
		$(t).attr('toggle', 'on');
	}
	
	
};

boardHitServer = function(){
	console.log(vidx + '번 글을 조회함');
	let search = 'board-hit-' + vidx;
	$('#' + search).text();
			
	$.ajax({
		type : 'get',
		url : "/CodePeople/UpdateBoardHit.do",
		data : 	{
			"boardNo" : vidx,
			"boardCodeNo" : boardCodeNo
			},
		dataType : 'json',
		success : function(res) {
			if(isNaN($('#' + search).text())){
				$('#' + search).text(1);
			}else{
				$('#' + search).text((parseInt($('#' + search).text()) + 1));
			}
		},	
		error : function(xhr) {
			//alert("상태 : " + xhr)
		}
	})	
}


replyInsertServer = function(t) { // html 등록버튼
	
	console.log("댓글 " + reply);
	console.log("댓글 " + reply.boardNo);
	console.log("댓글 " + reply.boardCodeNo);
	console.log("댓글 " + reply.memNo);
	console.log("댓글 " + reply.repCont);
	
	let boardNo = reply.boardNo;
	let boardCodeNo = reply.boardCodeNo;
	let memNo = reply.memNo;
	let repCont = reply.repCont;
	
	$.ajax({
		type : 'post',
		url : "/CodePeople/ReplyInsert.do",
		data : 
			{
				"boardNo" : boardNo,
				"boardCodeNo" : boardCodeNo,
				"memNo" : memNo,
				"repCont" : repCont
			},
			
			
		
		dataType : 'json',
		success : function(res) {
			
			replyListServer(t);
			location.href="/CodePeople/EachBoardPaging.do?currentPageNo=1&boardCode=" + boardCodeNo;
		},
		error : function(xhr) {
			//alert("상태 : " + xhr.status);
		}
	
	
		
	})
	
}


replyUpdateServer = function() {
	console.log(reply.repCont);
	console.log(reply.repNo);
	
	let repCont = reply.repCont;
	let repNo = reply.repNo;
	$.ajax({
		type : 'post',
		url : "/CodePeople/ReplyUpdate2.do",
		data : 
			{
				"repCont" : repCont,
				"repNo" : repNo
			},
		dataType : 'json',
		success : function(res) {
			//alert(res.flag);
			location.href="/CodePeople/EachBoardPaging.do?currentPageNo=1&boardCode=" + boardCodeNo;
		},
		error : function(xhr) {
			//alert("상태 : " + xhr.status);
		}
		
	})
	
}

replyReset = function() {
	cp = $('#modiForm').parent();
	
	$('body').append($('#modiForm'));
	$('#modiForm').hide();
}

replyDeleteServer = function(btn) {
	
	console.log(vidx);
		
	$.ajax({
		type : 'get',
		url : "/CodePeople/ReplyDelete.do",
		data : 
		{
			"repNo" : vidx
		},
		dataType : 'json',
		success : function(res) {
			$(btn).parents('.reply-card').remove();
		},
		error : function(xhr) {
			//alert("상태 : " + xhr.status)
		}
	})
}



BoardPaging = function(pageNo, boardCode) {
	
	
	currentPageNo = pageNo;
	
	$.ajax({
        type: "get",
		data: { 
				"currentPageNo" : currentPageNo,
				"boardCode"		: boardCodeNo
			  },
        url: "/CodePeople/BoardPagingList.do",
        
        dataType: "json",
        success: function (res) {
          
        	code = '<div id="accordion">';

			paginationCode = "";        	


        	$(res.boInfo).each(function(i,v){
        		
        		//<!-- 게시글의 한단위  -->
        		//<!-- card-hear 안 a태그와 게시글의 아이디를 맞춰주세요 -->
        		code += '<div class="card">';
        		code += '<div class="card-header">';
        		code += '<a class="btn title-btn" data-bs-toggle="collapse" href="#a'+ v.boardNo +'">';
        		code += '<span class="board-detail-title title">' + v.boardTitle +'</span>';
        		code += '</a>';
        		code += '<div class="board-icon-box">';
        		code += '<i class="far fa-eye"></i>&nbsp;<span class="board-view board-sm-font">' + v.boardHit +'</span>&nbsp;&nbsp;';
        		code += '<i class="far fa-thumbs-up"></i>&nbsp;<span class="board-like board-sm-font">' + v.boardLike +'</span>&nbsp;&nbsp;';
        		code += '<i class="far fa-comment"></i>&nbsp;<span class="board-comment board-sm-font">' + v.boardRepl +'</span>&nbsp;&nbsp;';
        		code += `</div>
        		</div>
        		
        		<div id="a${v.boardNo}" class="collapse" data-bs-parent="#accordion">
        		<div class="card-body">
        		<div class="board-info-box">
        		작성자&nbsp;:&nbsp;<span class="board-detail-writer writer">'${v.memId}'</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        		작성일&nbsp;:&nbsp;<span class="board-detail-date">'${v.boardDate}'</span> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        		<a href="" style="text-decoration: none;">추천</a>&nbsp;&nbsp;
        		<a href="" style="text-decoration: none;">신고</a>
        		</div>
        		<span class="board-detail-content cont">'${v.boardCont}'</span>
        		<div class="my-btn-box my-btn-box-cv">
        		<button type="button" name='update' idx="${v.boardNo}" class="btn btn-outline-primary action" data-bs-toggle="modal" data-bs-target="#updateModal" >수정</button>
        		<button type="button" name="delete" idx= '${v.boardNo}' class="btn btn-outline-primary action">삭제</button>
        		</div>
        		</div>
        		<div class="board-divider"></div>
        		<div class="board-bottom-icon-box">  
        		<div class="board-icon-item"><i class="far fa-thumbs-up"></i>&nbsp;<span class="board-like board-sm-font">좋아요</span></div>
        		<div class="board-icon-item"><i class="far fa-comment"></i>&nbsp;<span class="board-comment board-sm-font">댓글</span></div>
        		<div class="board-icon-item"><i class="far fa-frown"></i>&nbsp;<span class="board-comment board-sm-font">신고</span></div>
        		</div>
        		<div class="reply-box">
        		<div class="input-group mb-3">
        		<input type="text" class="form-control" placeholder="댓글을 입력하세요">
        		<button class="btn btn-outline-primary" mdx=${v.memId} type="button">등록</button>
        		</div>
        		<div class="reply-card bg-light text-dark">                                        
        		<div class="reply-writer-box">&nbsp;&nbsp;작성자&nbsp;&nbsp;<span class="reply-writer">홍**</span></div> 
        		<div class="card-body"><span class="reply-content">이것은 댓글입니다. 드랍 박스내부에 대댓글을 항목으로 넣어 구현할까 생각 중이에요. 그리고 추천과 신고 대댓글 갯수를 넣으려면, 게시글 위에 보이는 이미지들을 또 쓰겠죠.....그리고 수정 삭제도 드랍박스 안에 넣을 꺼에요.아 모르겠다 이제 ㄴ일 해야지 모두들 꿋잠...</span></div>
        		<div class="reply-card-icon-box">  
        		<div class="board-icon-item"><i class="far fa-thumbs-up"></i>&nbsp;<span class="reply-like board-sm-font">좋아요</span></div>
        		<div class="board-icon-item"><i class="far fa-comment"></i>&nbsp;<span class="reply-reply-cnt board-sm-font">대댓글</span></div>
        		<div class="board-icon-item"><i class="far fa-frown"></i>&nbsp; <span class="reply-report board-sm-font">신고</span></div>
        		</div>
        		<div class="my-btn-box-cv reply-btn-box">
        		<button type="button" class="btn btn-outline-secondary">수정</button>
        		<button type="button" class="btn btn-outline-secondary">삭제</button>
        		
        		</div>
        		</div>
        		</div>
        		</div>
        		</div>`;
        	});	
        	code += '</div>';
        
        	$('#accordion').html(code);
			const firstPage = parseInt(res.firstPage);
			const pageCount = parseInt(res.pageCount);
			const currentPage = parseInt(res.currentPage);

			paginationCode += `<ul class="pagination">`;
			if (res.firstPage > res.pageCount) {
				paginationCode += `<li class="page-item"><a class="page-link" onclick="BoardPaging(${firstPage - pageCount}, ${boardCode})">Previous</a></li>`;
			}

			for (let i = res.firstPage; i <= res.lastPage; i++) {
				if (i == currentPage) {
					paginationCode += `<li class="page-item active"><a class="page-link" onclick="BoardPaging(${i}, ${boardCode})">${i}</a></li>`;
				} else {
					paginationCode += `<li class="page-item"><a class="page-link" onclick="BoardPaging(${i}, ${boardCode})">${i}</a></li>`;
				}
			}

			if (res.lastPage < res.totalPageCount) {
				paginationCode += `<li class="page-item"><a class="page-link" onclick="BoardPaging(${firstPage + pageCount})">Next</a></li>`;
			}

			paginationCode += `</ul>`;

			
			document.getElementById('result-page-box').innerHTML = paginationCode;

			

        },
        error: function(xhr){
        }
    });
}

 $(function() {
	$('#send').on('click', function() {
		
	});
})



