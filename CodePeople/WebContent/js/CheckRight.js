// 세션에서 회원이 기업회원임과 등록한 기업이 있다는 것을 확인하여
// 등록한 기업의 기업번호를 리턴하는 메서드, 등록한 기업이 없다면 0을 반환
function getComNo(){
	
	$.ajax({
		url: '/CodePeople/CheckRight.do',
		type: 'get',
		dataType: 'json',
		success: function(res){
			console.log('회원구분코드 : ' + res.memCode + '\n' + '회원번호 : ' + res.memNo
					 + '인재번호 : ' + res.hrNo + '\n' + '기업번호 : ' + res.comNo);
			return res.comNo;
		},
		error: function(err){
			alert(`status : ${err.status}`);
		}		
	})
	
}

//세션에서 회원이 개인회원임을 확인하여
//인재번호를 리턴하는 메서드, 비회원이거나 기업회원인 경우 0을 반환
function getHrNo(){
	
	$.ajax({
		url: '/CodePeople/CheckRight.do',
		type: 'get',
		dataType: 'json',
		success: function(res){
			
			console.log('회원구분코드 : ' + res.memCode + '\n' + '회원번호 : ' + res.memNo
					 + '인재번호 : ' + res.hrNo + '\n' + '기업번호 : ' + res.comNo);
			return res.hrNo;
		},
		error: function(err){
			alert(`status : ${err.status}`);
		}		
	})
	
}

//세션에서 회원의 회원번호를 반환하는 메서드, 비회원인 경우 0을 반환
function getMemNo(){
	
	$.ajax({
		url: '/CodePeople/CheckRight.do',
		type: 'get',
		dataType: 'json',
		success: function(res){
			
			console.log('회원구분코드 : ' + res.memCode + '\n' + '회원번호 : ' + res.memNo
					 + '인재번호 : ' + res.hrNo + '\n' + '기업번호 : ' + res.comNo);
			return res.memNo;
		},
		error: function(err){
			alert(`status : ${err.status}`);
		}		
	})
	
}

function getMemCodeNo(){
	
	$.ajax({
		url: '/CodePeople/CheckRight.do',
		type: 'get',
		dataType: 'json',
		success: function(res){
			
			console.log('회원구분코드 : ' + res.memCode + '\n' + '회원번호 : ' + res.memNo
					+ '인재번호 : ' + res.hrNo + '\n' + '기업번호 : ' + res.comNo);
			return res.memCode;
		},
		error: function(err){
			alert(`status : ${err.status}`);
		}		
	})
	
}