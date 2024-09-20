
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
		        		<a class="btn title-btn boardNo action" name="list" id="list" idx="${v.boardNo}"data-bs-toggle="collapse" href="#a${v.boardNo}">
			        		<span class="board-detail-title title">'${v.boardTitle}'</span>
		        		</a>
		        		<div class="board-icon-box">
			        		<i class="far fa-eye"></i>&nbsp;<span class="board-view board-sm-font">'${v.boardHit}'</span>&nbsp;&nbsp;
			        		<i class="far fa-thumbs-up"></i>&nbsp;<span class="board-like board-sm-font">'${v.boardLike}'</span>&nbsp;&nbsp;
			        		<i class="far fa-comment"></i>&nbsp;<span class="board-comment board-sm-font">'${v.boardRepl}'</span>&nbsp;&nbsp;
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
				        		<button type="button" name="update" idx= '${v.boardNo}' idy='${v.boardCodeNo}' class="btn btn-outline-primary action updatebtn">수정</button>
				        		<button type="button" name="delete" idx= '${v.boardNo}' idy='${v.boardCodeNo}' class="btn btn-outline-primary action">삭제</button>
			        		</div>
		        		</div>
		        		<div class="board-divider"></div>
		        		<div class="board-bottom-icon-box">  
			        		<div class="board-icon-item"><i class="far fa-thumbs-up"></i>&nbsp;<span class="board-like board-sm-font">좋아요</span></div>
			        		<div class="board-icon-item"><i class="far fa-comment"></i>&nbsp;<span class="board-comment board-sm-font">댓글</span></div>
			        		<div class="board-icon-item"><i class="far fa-frown"></i>&nbsp;<span class="board-comment board-sm-font">신고</span></div>
		        		</div>
		        		
		        		<div class="reply-boxt" id="rp-box-${v.boardNo}">
			        		<div class="input-group mb-3">
				        		<input type="text" idx='${v.boardNo}' class="form-control" placeholder="댓글을 입력하세요">
				        		<button type="button" name="reply" idx='${v.boardNo}' class="btn btn-outline-primary action">등록</button>
			        		</div>
		        		</div>
	        		</div>
        		</div>`;
        	});	
        
        	$('#accordion').html(code);
        },
        error: function(xhr){
        	alert("상태 : " + xhr.status + " text : " + xhr.statusText);
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
};

deleteBoardServer = function() {

	// html 태그에서 boardCodeNo 정보를 꺼내오도록 수정해야함!!! 
	
	$.ajax({
		type : 'get',
		url : "/CodePeople/BoardDelete.do",
		data : 	{
			"boardNo" : vidx,
			"boardCodeNo" : 3
			},
		dataType : 'json',
		success : function(res) {

			listServer();
		},	
		error : function(xhr) {
			alert("상태 : " + xhr)
		}
	})
	
	
	
};

replyListServer = function(t, vidx) { // html의 등록버튼
	console.log("실행");
	console.log("vidx : "  + vidx);
	
	
	
	let temp = vidx;
	
	$.ajax({
		type : 'get',
		url : "/CodePeople/ReplyList.do",
		data : {"boardNo" : vidx},
		dataType : 'json',
		success : function(res) {
			console.log("잘됨");
			
			
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
		                <div class="board-icon-item"><i class="far fa-thumbs-up"></i>&nbsp;<span class="reply-like board-sm-font">좋아요</span></div>
						<div class="board-icon-item"><i class="far fa-frown"></i>&nbsp; <span class="reply-report board-sm-font">신고</span></div>
		                <div class="board-icon-item"><i class="far fa-comment"></i>&nbsp;<span class="reply-reply-cnt board-sm-font">대댓글</span></div>
		            </div>
		            <div class="my-btn-box-cv reply-btn-box">
		                <button type="button" idx="${v.repNo}" name="rmodify" class="btn btn-outline-secondary action">수정</button>
		                <button type="button" idx="${v.repNo}" name="rdelete" class="btn btn-outline-secondary action">삭제</button>
		            </div>
		        </div>
		        `;
			})
			
			let search = 'rp-box-' + temp;
			console.log('rp-box-' + temp);
			
			$('#' + search).append(rcode);
			
//			$(t).parents('.card').find('.show').find('.rep').append(rcode);
			
			

			
			
		},
		error : function(xhr) {
			alert("상태 : " + xhr.status)
		}
		
	})
	
	
};

replyInsertServer = function(t) { // html 등록버튼
	
	console.log(reply);
	console.log(reply.boardNo);
	console.log(reply.boardCodeNo);
	console.log(reply.memNo);
	console.log(reply.repCont);
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
		},
		error : function(xhr) {
			alert("상태 : " + xhr.status);
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
		url : "/CodePeople/ReplyUpdate.do",
		data : 
			{
				"repCont" : repCont,
				"repNo" : repNo
			},
		dataType : 'json',
		success : function(res) {
			alert(res.flag);
		},
		error : function(xhr) {
			alert("상태 : " + xhr.status);
		}
		
	})
	
}

replyReset = function() {
	cp = $('#modiForm').parent();
	
	$('body').append($('#modiForm'));
	$('#modiForm').hide();
}

replyDeleteServer = function(btn) {
	
	console.log("delete js 부분" + reply.repNo);
	console.log("delete js 부분" + vidx);
	
	let repNo = reply.repNo;
	$.ajax({
		type : 'get',
		url : "/CodePeople/ReplyDelete.do",
		data : 
		{
			"repNo" : repNo
		},
		dataType : 'json',
		success : function(res) {
			$(btn).parents('.reply-card').remove();
		},
		error : function(xhr) {
			alert("상태 : " + xhr.status)
		}
	})
}

fileUploadServer = function() {
	
	$.ajax({
		type : 'post',
		url : "CodePeople/upload",
		data : {
				"fileCn" : fileCn
			},
		dataType : 'json',
		success : function(res) {
			
		},
		error : function(xhr) {
			alert("상태 : " + xhr.status)
		}
	})
}

replyCommentListServer = function() {
	
}















