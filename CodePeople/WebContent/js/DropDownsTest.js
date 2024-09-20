

let options;
let cityOptions;
let cityOptionNo;
let jobGroupOptionNo;
let jobGroupOptions;
const typeMatch = ['jg-code-hidden','jt-code-hidden','pl-code-hidden',
					'sal-type-hidden','city-code-hidden','prov-code-hidden',
					'state-hidden','edu-code-hidden','crr-type-hidden',
					'cert-code-hidden','hcnt-type-hidden'];
let tags;					

//드랍박스의 추가된 옵션에 태그 기능을 넣는 메서드
const setOptions = () => {
	
  options = document.querySelectorAll('.option');  
  options.forEach(option => {
    option.addEventListener("click", event => {
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

	if(tagBox.classList.contains('hide')){
          tagBox.classList.remove('hide');
        }
	
	setHiddenInput(tag);
/*    tagBox.insertAdjacentHTML('beforeEnd',`<div class="tag" onclick="remove(this);">
                        <span class="badge rounded-pill bg-secondary">${tag.textContent}&nbsp;<span class="badge bg-danger">x</span></span>
                      </div>`)*/

    tagBox.insertAdjacentHTML('beforeEnd',`<div class="tag" idx="${tag.getAttribute('idx')}" onclick="resetHiddenInput();">
                        <span class="badge rounded-pill bg-secondary">${tag.textContent}&nbsp;<span class="badge bg-danger">x</span></span>
                      </div>`)


	removeTag();



 }

const setHiddenInput = (tag) =>{
	
	document.querySelector('.' + typeMatch[tag.getAttribute('idx')]).value = tag.value;
	
}

const removeTag = () =>{
    tags = document.querySelectorAll('.tag');
    tags.forEach(tag=>{
        tag.addEventListener('click', event=>{
			let rm = event.currentTarget;
			console.log(rm)
			document.querySelector('.' + typeMatch[rm.getAttribute('idx')]).value = 0;
			console.log(document.querySelector('.' + typeMatch[rm.getAttribute('idx')]).value)
			rm.remove();
        })
    })


}

//	document.querySelector('.' + typeMatch[tag.getAttribute('idx')]).removeAttribute('value');

//드랍박스 직군의 옵션에서만 적용되는 메서드
const setJobGroupOptions = () =>{
	
	jobGroupOptions = document.querySelectorAll('.jobGroupOption');
	jobGroupOptions.forEach(option=>{
        option.addEventListener('click', event=>{
        	jobGroupOptionNo = event.currentTarget.value;
	console.log('jobGroupOptionNo : ' + jobGroupOptionNo);
        	 let tag = event.currentTarget;
             addTag(tag);
        })
    })
}

//드랍박스에서 채용공고의 진행상태 옵션값을 가져오는 메서드
const initStateList = (target) => {
	let	code = '<li><h5 class="dropdown-header">진행상태</h5></li>';
		code += `<li class="dropdown-item option" idx="6" value="1">진행중</li>`;
		code += `<li class="dropdown-item option" idx="6" value="0">마감</li>`;
		code += `<li class="dropdown-item option" idx="6" value="2">예정</li>`;
		let parent = target.parentElement.querySelector('.dropdown-menu');
		parent.innerHTML = code;
		setOptions();
}

//드랍박스에서 기업의 인원수 옵션값을 가져오는 메서드
const initHCntList = (target) => {
	let	code = '<li><h5 class="dropdown-header">인원수</h5></li>';
		code += `<li class="dropdown-item option" idx="10" value="1">1-10</li>`;
		code += `<li class="dropdown-item option" idx="10" value="2">11-50</li>`;
		code += `<li class="dropdown-item option" idx="10" value="3">51-200</li>`;
		code += `<li class="dropdown-item option" idx="10" value="4">201-500</li>`;
		code += `<li class="dropdown-item option" idx="10" value="5">501-1,000</li>`;
		code += `<li class="dropdown-item option" idx="10" value="5">1,001-5,000</li>`;
		code += `<li class="dropdown-item option" idx="10" value="5">5,001-</li>`;
		let parent = target.parentElement.querySelector('.dropdown-menu');
		parent.innerHTML = code;
		setOptions();
}
//드랍박스에서 평균 연봉, 보상 옵션값을 가져오는 메서드
const initSalaryList = (target) => {
	let	code = '<li><h5 class="dropdown-header">평균연봉</h5></li>';
		code += `<li class="dropdown-item option" idx="3" value="1">~ 2000만원</li>`;
		code += `<li class="dropdown-item option" idx="3" value="2">2000만원 ~ 2500만원</li>`;
		code += `<li class="dropdown-item option" idx="3" value="3">2500만원 ~ 3000만원</li>`;
		code += `<li class="dropdown-item option" idx="3" value="4">3000만원 ~ 4000만원</li>`;
		code += `<li class="dropdown-item option" idx="3" value="5">4000만원 ~ 5000만원</li>`;
		code += `<li class="dropdown-item option" idx="3" value="6">5000만원 ~ </li>`;
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
				code += `<li class="dropdown-item option" name="prov_code_no" idx="5" value="${data.provCodeNo}">${data.provCodeNm}</li>`;
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
				code += `<li class="dropdown-item cityOption" idx="4" value="${data.cityCodeNo}">${data.cityCodeNm}</li>`;
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
				code +=  `<li class="dropdown-item jobGroupOption" idx="0" value="${data.jgCodeNo}">${data.jgCodeNm}</li>`;
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
				code += `<li class="dropdown-item option" idx="2" value="${data.plCodeNo}">${data.plCodeNm}</li>`;
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
					code += `<li class="dropdown-item option" idx="1" value="${data.jtCodeNo}">${data.jtCodeNm}</li>`;
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
				code += `<li class="dropdown-item option" idx="7" value="${data.eduCodeNo}">${data.eduCodeNm}</li>`;
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
				code += `<li class="dropdown-item option" idx="9" value="${data.certCodeNo}">${data.certCodeNm}</li>`;
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
//드랍박스에서 경력의 옵션값을 가져오는 메서드
const initCrrList = (target) =>{
	let	code = '<li><h5 class="dropdown-header">경력</h5></li>';
		code += `<li class="dropdown-item option" idx="8" value="0">신입</li>`;
		code += `<li class="dropdown-item option" idx="8" value="1">1-3년</li>`;
		code += `<li class="dropdown-item option" idx="8" value="2">4-6년</li>`;
		code += `<li class="dropdown-item option" idx="8" value="3">7-9년</li>`;
		code += `<li class="dropdown-item option" idx="8" value="4">10-15년</li>`;
		code += `<li class="dropdown-item option" idx="8" value="5">16-20년</li>`;
		code += `<li class="dropdown-item option" idx="8" value="6">21년 이상</li>`;
		let parent = target.parentElement.querySelector('.dropdown-menu');
		parent.innerHTML = code;
		setOptions();
}

