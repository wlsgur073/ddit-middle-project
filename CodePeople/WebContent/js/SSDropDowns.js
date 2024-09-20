// 변수 선언

// dropbox클릭시 출력되는 li들을 담는 객체 (도시대분류와 직군대분류 제외)
let options;
// city지역 대분류 클릭시 출력되는 li들을 담는 객
let cityOptions;
// 도시 소분류의 값을 가져오기 위해, 선택한 도시 대분류의 값을 담을 객체 
let cityOptionNo;
// 직군 클릭시 출력되는 li들을 담는 객체 
let jobGroupOptions;
// 직군에 따른 직무들의 옵션 값을 가져오기 위해, 선택한 직군의 값을 담을 객체 
let jobGroupOptionNo;

//드랍박스의 추가된 옵션에 태그 기능을 넣는 메서드
const setOptions = () => {
  options = document.querySelectorAll('.option');  
  options.forEach(option => {
    option.addEventListener("click", event => {
	console.log('setOption');
      let tag = event.currentTarget;
      addTag(tag);
    });
  });
}
//드랍박스 도시의 옵션에서만 적용되는 메서드
const setCityOptions = () =>{
    cityOptions = document.querySelectorAll('.cityOption');
    cityOptions.forEach(option=>{
        option.addEventListener('click', event=>{
	console.log('cityOption');
        	cityOptionNo = event.currentTarget.value;
        	 let tag = event.currentTarget;
	             addTag(tag);
        })
    })
}



//태그넣기 메서드
const addTag = (tag) =>{
	//검색 태그 값을 넣을 박스
	const tagBox = document.querySelector('.search-tags');
      let tagName = $(tag).attr('idx');
	  let category = $(tag).attr('name');
	  let tagValue = $(tag).val();

	if(category=="jgCodeNo"){
		document.querySelector('#jgCodeNo').value = tagValue;
	}else if(category=="plCodeNo"){
		document.querySelector('#plCodeNo').value = tagValue;
	}else if(category=="eduCodeNo"){
		 document.querySelector('#eduCodeNo').value= tagValue;
	}else if(category=="cityCodeNo"){
		document.querySelector('#cityCodeNo').value = tagValue;
	}else if(category=="provCodeNo"){
		document.querySelector('#cityCodeNo').value = tagValue;
	}
	

	if(tagBox.classList.contains('hide')){
          tagBox.classList.remove('hide');
        }
	
    tagBox.insertAdjacentHTML('beforeEnd',`<div class="tag" idx="${tagName}" name="${category}" value="${tagValue}">
                        <span class="badge rounded-pill bg-secondary">${tag.textContent}&nbsp;<span class="badge bg-danger">x</span></span>
                      </div>`)

	let tags = document.querySelectorAll('.tag');
	
	
	tags.forEach(t=>{
		t.addEventListener('click',event=>{
			let rm = event.currentTarget;
			rmName = $(rm).attr('idx');
			category = $(rm).attr('name');
			if(category=="jgCodeNo"){
				document.querySelector('#jgCodeNo').value = 0;
			}else if(category=="plCodeNo"){
				document.querySelector('#plCodeNo').value = 0;
			}else if(category=="eduCodeNo"){
				 document.querySelector('#eduCodeNo').value= 0;
			}else if(category=="cityCodeNo"){
				document.querySelector('#cityCodeNo').value = 0;
			}else if(category=="provCodeNo"){
				document.querySelector('#cityCodeNo').value = 0;
			}
			rm.remove();
		});
	});
	


 }

//드랍박스 직군의 옵션에서만 적용되는 메서드
const setJobGroupOptions = () =>{
	
	jobGroupOptions = document.querySelectorAll('.jobGroupOption');
	jobGroupOptions.forEach(option=>{
        option.addEventListener('click', event=>{
        	jobGroupOptionNo = event.currentTarget.value;
        	 let tag = event.currentTarget;
             addTag(tag);
        })
    })
}

//드랍박스에서 채용공고의 진행상태 옵션값을 가져오는 메서드
const initStateList = (target) => {
	let	code = '<li><h5 class="dropdown-header">진행상태</h5></li>';
		code += `<li class="dropdown-item option" idx="진행중" value="1">진행중</li>`;
		code += `<li class="dropdown-item option" idx="마감" value="0">마감</li>`;
		code += `<li class="dropdown-item option" idx="예정" value="2">예정</li>`;
		let parent = target.parentElement.querySelector('.dropdown-menu');
		parent.innerHTML = code;
		setOptions();
}

//드랍박스에서 기업의 인원수 옵션값을 가져오는 메서드
const initHCntList = (target) => {
	let	code = '<li><h5 class="dropdown-header">인원수</h5></li>';
		code += `<li class="dropdown-item option" idx="1-10" value="1">1-10</li>`;
		code += `<li class="dropdown-item option" idx="11-50" value="2">11-50</li>`;
		code += `<li class="dropdown-item option" idx="51-200" value="3">51-200</li>`;
		code += `<li class="dropdown-item option" idx="201-500" value="4">201-500</li>`;
		code += `<li class="dropdown-item option" idx="501-1,000" value="5">501-1,000</li>`;
		code += `<li class="dropdown-item option" idx="1,001-5,000" value="5">1,001-5,000</li>`;
		code += `<li class="dropdown-item option" idx="5,001-" value="5">5,001-</li>`;
		let parent = target.parentElement.querySelector('.dropdown-menu');
		parent.innerHTML = code;
		setOptions();
}
//드랍박스에서 평균 연봉, 보상 옵션값을 가져오는 메서드
const initSalaryList = (target) => {
	let	code = '<li><h5 class="dropdown-header">평균연봉</h5></li>';
		code += `<li class="dropdown-item option" idx="~ 2000만원" value="1">~ 2000만원</li>`;
		code += `<li class="dropdown-item option" idx="2000만원 ~ 2500만원" value="2">2000만원 ~ 2500만원</li>`;
		code += `<li class="dropdown-item option" idx="2500만원 ~ 3000만원" value="3">2500만원 ~ 3000만원</li>`;
		code += `<li class="dropdown-item option" idx="3000만원 ~ 4000만원" value="4">3000만원 ~ 4000만원</li>`;
		code += `<li class="dropdown-item option" idx="4000만원 ~ 5000만원" value="5">4000만원 ~ 5000만원</li>`;
		code += `<li class="dropdown-item option" idx="5000만원 ~ " value="6">5000만원 ~ </li>`;
		let parent = target.parentElement.querySelector('.dropdown-menu');
		parent.innerHTML = code;
		setOptions();
}

//드랍박스에서 소분류 주소 옵션값을 가져오는 메서드
const initProvList = (target) => {
	console.log(cityOptionNo);
	$.ajax({
		url : '/CodePeople/ProvList.do',
		type : 'get',
		data : { "cityCodeNo" : cityOptionNo},
		dataType : 'json',
		success : function(res){
			let code = '<li><h5 class="dropdown-header">도시소분류</h5></li>';
			let datas= res;
			datas.forEach(data=>{
				code += `<li class="dropdown-item option" name="provCodeNo" idx="${data.provCodeNm}" value="${data.provCodeNo}">${data.provCodeNm}</li>`;
			})
			let parent = target.parentElement.querySelector('.dropdown-menu');
			parent.innerHTML = code;
			setOptions();
		},
		error : function(xhr){
			alert(`status : ${xhr.status}\ntext : ${xhr.statusText}`);
		}
	})
}
//드랍박스에서 지역(대분류)값을 가져오는 메서드
const initCityList = (target) => {
	$.ajax({
		url : '/CodePeople/CityList.do',
		type : 'get',
		dataType : 'json',
		success : function(res){
			let code = '<li><h5 class="dropdown-header">지역</h5></li>';
			let datas = res;
			datas.forEach(data=>{
				code += `<li class="dropdown-item cityOption" name="cityCodeNo" idx="${data.cityCodeNm}" value="${data.cityCodeNo}">${data.cityCodeNm}</li>`;
			})
			let parent = target.parentElement.querySelector('.dropdown-menu');
			parent.innerHTML = code;
			let provBtn = document.querySelector('#provBtn');
			provBtn.classList.remove('hide');
			setCityOptions();
		},
		error : function(xhr){
			alert(`status : ${xhr.status}\ntext : ${xhr.statusText}`);
		}
	})
}



//드랍박스에서 직군의 옵션값을 가져오는 메서드
const initJobGroupList = (target) => {
	$.ajax({
		url : '/CodePeople/jobGroupList.do',
		type : 'get',
		dataType : 'json',
		success : function(res){
			let code = '<li><h5 class="dropdown-header">직군</h5></li>';
			let datas = res;
			datas.forEach(data=>{
				code +=  `<li class="dropdown-item jobGroupOption" name="jgCodeNo" idx="${data.jgCodeNm}" value="${data.jgCodeNo}">${data.jgCodeNm}</li>`;
			});
			let parent = target.parentElement.querySelector('.dropdown-menu');
			parent.innerHTML = code;	
			setJobGroupOptions();
		},
		error : function(xhr){
			alert(`status : ${xhr.status}\ntext : ${xhr.statusText}`);
		}
	})
}

// 드랍박스에서 활동분야의 옵션값을 가져오는 메서드
const initProgLangList = (target) => {
	$.ajax({
		url : '/CodePeople/progLangList.do',
		type : 'get',
		dataType : 'json',
		success : function(res){
			let code = '<li><h5 class="dropdown-header">활동분야</h5></li>';
			let datas = res;
			datas.forEach(data=>{
				code += `<li class="dropdown-item option" name="plCodeNo" idx="${data.plCodeNm}" value="${data.plCodeNo}">${data.plCodeNm}</li>`;
			})
			let parent = target.parentElement.querySelector('.dropdown-menu');
			parent.innerHTML = code;	
			setOptions();
		},
		error : function(xhr){
			alert(`status : ${xhr.status}\ntext : ${xhr.statusText}`);
		}		
	})
}
//드랍박스에서 직무의 옵션값을 가져오는 메서드
const initJobTitleList = (target) => {
	$.ajax({
		url : '/CodePeople/jobTitleList.do',
		type : 'get',
		data : { "jobGroupOptionNo" : jobGroupOptionNo},
		dataType : 'json',
		success : function(res){
			let code = '<li><h5 class="dropdown-header">직무</h5></li>';
			let datas= res;
			if(jobGroupOptionNo !== 0){
				datas.forEach(data=>{
					code += `<li class="dropdown-item option" idx="${data.jtCodeNm}" name="jtCodeNo" value="${data.jtCodeNo}">${data.jtCodeNm}</li>`;
				})
			}else{
				code += `<li>직무를 선택해주세요</li>`;
			}
			let parent = target.parentElement.querySelector('.dropdown-menu');
			parent.innerHTML = code;
			setOptions();
		},
		error : function(xhr){
			alert(`status : ${xhr.status}\ntext : ${xhr.statusText}`);
		}
		
	})
}

//드랍박스에서 학력의 옵션값을 가져오는 메서드
const initEduTypeList = (target) => {
	$.ajax({
		url : '/CodePeople/EduTypeList.do',
		type : 'get',
		dataType : 'json',
		success : function(res){
			let code = '<li><h5 class="dropdown-header">학력</h5></li>';
			let datas = res;
			datas.forEach(data=>{
				code += `<li class="dropdown-item option" idx="${data.eduCodeNm}" name="eduCodeNo" value="${data.eduCodeNo}">${data.eduCodeNm}</li>`;
			})
			let parent = target.parentElement.querySelector('.dropdown-menu');
			parent.innerHTML = code;
			setOptions();
		},
		error : function(xhr){
			alert(`status : ${xhr.status}\ntext : ${xhr.statusText}`);
		}		
	})
}
//드랍박스에서 자격증의 옵션값을 가져오는 메서드
const initCertList = (target) =>{
	$.ajax({
		url : '/CodePeople/CertList.do',
		type : 'get',
		dataType : 'json',
		success : function(res){
			let code = '<li><h5 class="dropdown-header">자격증</h5></li>';
			let datas = res;
			datas.forEach(data=>{
				code += `<li class="dropdown-item option" idx="${data.certCodeNm}" name="eduCodeNo"value="${data.certCodeNo}">${data.certCodeNm}</li>`;
			})
			let parent = target.parentElement.querySelector('.dropdown-menu');
			parent.innerHTML = code;
			setOptions();
		},
		error : function(xhr){
			alert(`status : ${xhr.status}\ntext : ${xhr.statusText}`);
		}
		
	})
}
