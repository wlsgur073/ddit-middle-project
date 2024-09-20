function boardPaging(currentPageNo){
	
	$.ajax({
		url : '/CodePeople/BoardPagingList.do',
		type : 'get',
		data : { "currentPageNo" : currentPageNo},
		dataType : 'json',
		success : function(res){
			
		},
		error : function(err){
			alert(`status : ${err.status}\ntext : ${err.statusText}`);
		}
		
	})
	
}

function companyPaging(currentPageNo){
	
	$.ajax({
		url : '/CodePeople/CompanyPagingList.do',
		type : 'get',
		data : { "currentPageNo" : currentPageNo},
		dataType : 'json',
		success : function(res){
			
		},
		error : function(err){
			alert(`status : ${err.status}\ntext : ${err.statusText}`);
		}
		
	})
	
}

function jobOpeningPaging(currentPageNo){
	
	$.ajax({
		url : '/CodePeople/JobOpeningPagingList.do',
		type : 'get',
		data : { "currentPageNo" : currentPageNo},
		dataType : 'json',
		success : function(res){
			
		},
		error : function(err){
			alert(`status : ${err.status}\ntext : ${err.statusText}`);
		}
		
	})
	
}

function HRPaging(currentPageNo){
	
	$.ajax({
		url : '/CodePeople/HRPagingList.do',
		type : 'get',
		data : { "currentPageNo" : currentPageNo},
		dataType : 'json',
		success : function(res){
			
		},
		error : function(err){
			alert(`status : ${err.status}\ntext : ${err.statusText}`);
		}
		
	})
	
}
function CVPaging(currentPageNo){
	
	$.ajax({
		url : '/CodePeople/CVPagingList.do',
		type : 'get',
		data : { "currentPageNo" : currentPageNo},
		dataType : 'json',
		success : function(res){
			
		},
		error : function(err){
			alert(`status : ${err.status}\ntext : ${err.statusText}`);
		}
		
	})
	
}

function JOCardPaging(PageNo){
	
	currentPageNo = PageNo;
	
	$.ajax({
		url : '/CodePeople/JobOpeningCardPagingList.do',
		type : 'get',
		data : { "currentPageNo" : PageNo},
		dataType : 'json',
		success : function(res){
			
			let cardCode = "";
			
			let paginationCode = "";
			
			res.joInfo.forEach(function(data){
				
				let imageHref = "/CodePeople/images/logo" + Math.floor(parseInt(data.rnum/15)) + ".png";
				
				console.log(imageHref);
				
				cardCode +=                     
				`
				<div class="card card-jo">
                <!-- 카드의 이미지태그는 복사해서 사용할것 src alt값 변경 필-->
                <div class="card-left">
                    <img src="${imageHref}" alt="Card image" style="width:64px; height: 64px;">
                </div>
                <!-- 카드의 정보 -->
                <div class="card-body card-right">
                    <a href="/CodePeople/JOCardDetil.do?joNo=${data.rnum}"><div class="card-top-box">
                        <h4 class="card-title">${data.joTitle}</h4>
                    </div></a>
                    <!-- 카드의 회사 소개, 직군 -->
                    <div class="card-text card-jobs-detail-company-intro"><span class="company-intor">${data.comIntro}</span></div>
                    <div class="card-text card-jobs-detail-company-jobgroup"><span class="company-jobgroup">${data.jgCodeNm}</span></div>
                    <!-- 카드의 채용공고 박스 -->
                    <div class="card-jobs-detail">
                        <div class="divider"></div>
                        <div class="jobs-detail-top">
                            <div class="jobs-detail">
                                <a href="#" class="card-link"><span class="jo-title">${data.comNm}</span></a>&nbsp;&nbsp;
                                <span class="jo-salary jo-sm-font">${data.joSalTypeNm}</span>
                                <span class="jo-sm-font">/</span>
                                <span class="jo-career jo-sm-font">경력</span>
                            </div>
                            <div class="dropup">
                                <button type="button" class="btn btn-outline-secondary dropdown-toggle btn-menu"
                                    data-bs-toggle="dropdown"></button>
                                <!-- 카드 메뉴정보 -->
                                <ul class="dropdown-menu">
                                    <!-- 카드 메뉴 헤더 -->
                                    <!-- 카드 메뉴 옵션 -->
                                    <li><a class="dropdown-item" href="#">스크랩</a></li>
										<h5 class="dropdown-header">스크랩 등록</h5>
										<h5 class="dropdown-header">스크랩 삭제</h5>
									<li><a class="dropdown-item" href="#">알람</a></li>
                                    <li>
                                        <h5 class="dropdown-header">알람등록</h5>
                                        <h5 class="dropdown-header">알람해제</h5>
                                    </li>
                                </ul>
                            </div>
                        </div>

                        <span class="card-text jo-sm-font">${data.jtCodeNm}</span>&nbsp;&nbsp;
                        <span class="jo-start jo-sm-font"><i class="far fa-calendar-alt">&nbsp;</i>${data.joSdate}
                            </span>
                            &nbsp;<span class="jo-start jo-sm-font">~</span>&nbsp;
                        <span class="jo-end jo-sm-font"><i class="far fa-calendar-alt">&nbsp;</i>${data.joEdate}
                            </span>
                    </div>
                </div>
            </div>`;
				
			})
			
			const firstPage = parseInt(res.firstPage);
			const pageCount = parseInt(res.pageCount);
			const currentPage = parseInt(res.currentPage);
			
			paginationCode += `<ul class="pagination">`;
			if(res.firstPage > res.pageCount){
			  paginationCode += `<li class="page-item"><a class="page-link" onclick="JOCardPaging(${firstPage - pageCount})">Previous</a></li>`;
			}
			
			for(let i = res.firstPage; i <= res.lastPage; i++){
				if(i == currentPage){
					paginationCode += `<li class="page-item active"><a class="page-link" onclick="JOCardPaging(${i})">${i}</a></li>`;
				}else{
					paginationCode += `<li class="page-item"><a class="page-link" onclick="JOCardPaging(${i})">${i}</a></li>`;
				}
			}
			
			if(res.lastPage < res.totalPageCount){
			  paginationCode += `<li class="page-item"><a class="page-link" onclick="JOCardPaging(${firstPage + pageCount})">Next</a></li>`;
			}
			
			paginationCode += `</ul>`;

			
			document.getElementById('result-card-list').innerHTML = cardCode;
			
			document.getElementById('result-page-box').innerHTML = paginationCode;

		},
		error : function(err){
			alert(`status : ${err.status}\ntext : ${err.statusText}`);
		}
		
	})
	
}


function JOSearchCardPaging(PageNo) {
	
	currentPageNo = PageNo;
	
	let datas = $('#formTest').serializeJSON();
	const CERT_CODE_NO = datas.CERT_CODE_NO;
	const CITY_CODE_NO = datas.CITY_CODE_NO;
	const CRR_YEARS_TYPE = datas.CRR_YEARS_TYPE;
	const EDU_CODE_NO = datas.EDU_CODE_NO;
	const HCNT_TYPE = datas.HCNT_TYPE;
	const JG_CODE_NO = datas.JG_CODE_NO;
	const JT_CODE_NO = datas.JT_CODE_NO;
	const PL_CODE_NO = datas.PL_CODE_NO;
	const PROV_CODE_NO = datas.PROV_CODE_NO;
	const SAL_TYPE = datas.SAL_TYPE;
	const STATE = datas.STATE;

	$.ajax({
		url: '/CodePeople/JobOpeningCardSearchList.do',
		type: 'get',
		data: {
			"currentPageNo": currentPageNo,
			"JG_CODE_NO": JG_CODE_NO,
			"JT_CODE_NO": JT_CODE_NO,
			"PL_CODE_NO": PL_CODE_NO,
			"SAL_TYPE": SAL_TYPE,
			"PROV_CODE_NO": PROV_CODE_NO,
			"CITY_CODE_NO": CITY_CODE_NO,
			"STATE": STATE
		},
		dataType: 'json',
		success: function(res) {

			let cardCode = "";

			let paginationCode = "";

			res.joInfo.forEach(function(data) {
				cardCode +=
					`
		    				<div class="card card-jo">
		                    <!-- 카드의 이미지태그는 복사해서 사용할것 src alt값 변경 필-->
		                    <div class="card-left">
		                        <img src="/CodePeople/images/logo.jpeg" alt="Card image" style="width:64px; height: 64px;">
		                    </div>
		                    <!-- 카드의 정보 -->
		                    <div class="card-body card-right">
		                        <div class="card-top-box">
		                            <h4 class="card-title">${data.comNm}</h4>
		                        </div>
		                        <!-- 카드의 회사 소개, 직군 -->
		                        <div class="card-text card-jobs-detail-company-intro"><span class="company-intor">${data.comIntro}</span></div>
		                        <div class="card-text card-jobs-detail-company-jobgroup"><span class="company-jobgroup">${data.jgCodeNm}</span></div>
		                        <!-- 카드의 채용공고 박스 -->
		                        <div class="card-jobs-detail">
		                            <div class="divider"></div>
		                            <div class="jobs-detail-top">
		                                <div class="jobs-detail">
		                                    <a href="#" class="card-link"><span class="jo-title">${data.joTitle}</span></a>&nbsp;&nbsp;
		                                    <span class="jo-salary jo-sm-font">${data.joSalTypeNm}</span>
		                                    <span class="jo-sm-font">/</span>
		                                    <span class="jo-career jo-sm-font">경력</span>
		                                </div>
		                                <div class="dropup">
		                                    <button type="button" class="btn btn-outline-secondary dropdown-toggle btn-menu"
		                                        data-bs-toggle="dropdown"></button>
		                                    <!-- 카드 메뉴정보 -->
		                                    <ul class="dropdown-menu">
		                                        <!-- 카드 메뉴 헤더 -->
		                                        <li>
		                                            <h5 class="dropdown-header">관심등록</h5>
		                                        </li>
		                                        <!-- 카드 메뉴 옵션 -->
		                                        <li><a class="dropdown-item" href="#">스크랩</a></li>
		                                        <li>
		                                            <h5 class="dropdown-header">알람설정</h5>
		                                        </li>
		                                        <li><a class="dropdown-item" href="#">알람등록</a></li>
		                                    </ul>
		                                </div>
		                            </div>

		                            <span class="card-text jo-sm-font">${data.jtCodeNm}</span>&nbsp;&nbsp;
		                            <span class="jo-start jo-sm-font"><i class="far fa-calendar-alt">&nbsp;</i>${data.joSdate}
		                                </span>
		                                &nbsp;<span class="jo-start jo-sm-font">~</span>&nbsp;
		                            <span class="jo-end jo-sm-font"><i class="far fa-calendar-alt">&nbsp;</i>${data.joEdate}
		                                </span>
		                        </div>
		                    </div>
		                </div>`;

			})

			const firstPage = parseInt(res.firstPage);
			const pageCount = parseInt(res.pageCount);
			const currentPage = parseInt(res.currentPage);

			paginationCode += `<ul class="pagination">`;
			if (res.firstPage > res.pageCount) {
				paginationCode += `<li class="page-item"><a class="page-link" onclick="JOSearchCardPaging(${firstPage - pageCount})">Previous</a></li>`;
			}

			for (let i = res.firstPage; i <= res.lastPage; i++) {
				if (i == currentPage) {
					paginationCode += `<li class="page-item active"><a class="page-link" onclick="JOSearchCardPaging(${i})">${i}</a></li>`;
				} else {
					paginationCode += `<li class="page-item"><a class="page-link" onclick="JOSearchCardPaging(${i})">${i}</a></li>`;
				}
			}

			if (res.lastPage < res.totalPageCount) {
				paginationCode += `<li class="page-item"><a class="page-link" onclick="JOSearchCardPaging(${firstPage + pageCount})">Next</a></li>`;
			}

			paginationCode += `</ul>`;


			document.getElementById('result-card-list').innerHTML = cardCode;

			document.getElementById('result-page-box').innerHTML = paginationCode;


		},
		error: function(err) {
			alert(`status : ${err.status}\ntext : ${err.statusText}`);
		}

	})
};

BoardPaging = function(pageNo, boardCode) {
	
	
	currentPageNo = pageNo;
	
	$.ajax({
        type: "get",
		data: { 
				"currentPageNo" : currentPageNo,
				"boardCode"		: boardCode
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
        		<button class="btn btn-outline-primary" type="button">등록</button>
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
        	alert("상태 : " + xhr.status + " text : " + xhr.statusText);
        }
    });
	
}
