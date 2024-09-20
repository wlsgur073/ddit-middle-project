function proc(){
	
	execDaumPostcode();
	
	setTimeout(function(){
		let cityCodeNo = $('#cityCodeNo').val();
		let provCodeNo = $('#provCodeNo').val();
		console.log(cityCodeNo, provCodeNo);
		
		$.ajax({

			url: '/CodePeople/ConvertForm.do',
			type: 'get',
			data: {
				"cityCodeNo" : cityCodeNo,
				"provCodeNo" : provCodeNo
			},
			dataType: 'json',
			success: function(res){
				
				$('#cityCodeNo').val(res.cityCodeNo);
				$('#provCodeNo').val(res.provCodeNo);
				
				console.log(res.cityCodeNo, res.provCodeNo);
			},
			error: function(err){
				alert(`status : ${err.status}`);
			}
		})
	}, 6000);
}


const insertJobOpening = () => {
	
	const joInputs = $('#joForm').serializeJSON();
	
	console.log(joInputs);
	
	$.ajax({

		url: '/CodePeople/InsertJobOpeining.do',
		type: 'post',
		data: joInputs,
		dataType: 'json',
		success: function(res){
			
			if(res.flag == "success"){
				alert('채용공고 등록이 완료되었습니다');
			}else if(res.memCode == "0"){
				alert('비회원은 채용공고 등록을 할 수 없습니다.')
			}else if(res.flag == "fail" && res.memCode == "1"){
				alert('채용공고 등록이 실패했습니다');
			}
			
		},
		error: function(err){
			alert(`status : ${err.status}`);
		}
	})
	
}

const updateJobOpening = () => {
	
	const joInputs = $('#joForm').serializeJSON();
	
	console.log(joNo);
	
	$.ajax({

		url: '/CodePeople/UpdateJobOpening.do',
		type: 'post',
		data: joInputs,
		dataType: 'json',
		success: function(res){
			
			if(res.flag == "success"){
				alert('채용공고 수정이 완료되었습니다');
				location.href = "/CodePeople/JOCardDetil.do?joNo=" + joNo;
			}else if(res.memCode == "0"){
				alert('비회원은 채용공고 수정을 할 수 없습니다.')
			}else if(res.flag == "fail" && res.memCode == "1"){
				alert('채용공고 수정이 실패했습니다');
			}
			
		},
		error: function(err){
			alert(`status : ${err.status}`);
		}
	})
	
	
	
}

