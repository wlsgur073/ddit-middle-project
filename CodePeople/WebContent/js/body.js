window.onload = function addCertForm() {

	var hr1 = document.getElementById('hr1');
	var hr2 = document.getElementById('hr2');
	var hr3 = document.getElementById('hr3');
	var hr4 = document.getElementById('hr4');

hr1.addEventListener('click', function() {
text = `<div class="container mt-3 formsizing company-register">
		    <h1>학력 등록</h1>
		    <form action="/action_page.php">
		      <div class="mb-3">
		        <label>학력 구분</label>
		        <input type="number" class="form-control" id="emp" placeholder="학력 구분을 입력해주세요." name="emp">
		      </div>
		      <div class="mb-3">
		        <label>학교명</label>
		        <input type="number" class="form-control" id="emp" placeholder="학교 명을 입력해주세요." name="emp">
		      </div>		
		      <div class="mb-3">
		        <label>전공</label>
		        <input type="url" class="form-control" id="company" placeholder="전공을 입력해주세요" name="company">
		      </div>
		      <div class="mb-3">
		        <label>학점 총점</label>
		        <input type="text" class="form-control" id="salary" placeholder="학점 총점을 선택해주세요." name="salary">
		      </div>
		      <div class="mb-3">
		        <label>학점 평균</label>
		        <input type="text" class="form-control" id="company-date" placeholder="학점평균을 입력해주세요" name="company-date">
		      </div>
		      <div class="btn-center-box">
		        <button type="button" class="btn btn-primary btn-lg" onclick="window.close()">등록하기</button>
		      </div>
		      <div class="btn-center-box">
		        <button type="button" class="btn btn-primary btn-lg" onclick="addEdu()">추가하기</button>
		      </div>
		      <div class="btn-center-box">
		        <button type="button" class="btn btn-primary btn-lg" onclick="window.close()">삭제하기</button>
		      </div>
		      </form>
            </div>`;

		code = document.createElement('div');
		code.innerHTML = text
		hrList1.append(code);
	})

hr2.addEventListener('click', function() {

		text = `<div class="container mt-3 formsizing company-register">
   					<h1>경력 등록</h1>
    				<form action="/action_page.php">
 					<div class="mb-3">
			    	<label>회사명</label>
			    	<input type="url" class="form-control" id="company" placeholder="회사명을 입력해주세요" name="company">
			    	</div>
			      	<div class="mb-3">
			        	<label>재직여부</label>
			        	<input type="checkbox"></input>			
			      	<div class="mb-3">
			        	<label>직급</label>
			        	<input type="url" class="form-control" id="company" placeholder="직급을 입력해주세요" name="company">
			      	</div>
			
			      <div class="mb-3">
			        <label>연차</label>
			        <input type="text" class="form-control" id="salary" placeholder="경력을 입력해주세요.(년 단위)" name="salary">
			      </div>
			
			      <div class="mb-3">
			        <label>직군</label>
			        <input type="text" class="form-control" id="company-date" placeholder="직군을 입력해주세요" name="company-date">
			      </div>
			
				<div class="mb-3">
			        <label>직무</label>
			        <input type="text" class="form-control" id="company-date" placeholder="직무를 입력해주세요" name="company-date">
			      </div>
			
			      <div class="btn-center-box">
			        <button type="button" class="btn btn-primary btn-lg" onclick="window.close()">등록하기</button>
			      </div>
			      
			      <div class="btn-center-box">
			        <button type="button" class="btn btn-primary btn" id="hr2" >➕</button>
			      </div>
			      
			      <div class="btn-center-box">
			        <button type="button" class="btn btn-primary btn-lg" onclick="window.close()">삭제하기</button>
			      </div>
			      
			      
			    </form>
			  </div>`;

		code = document.createElement('div');
		code.innerHTML = text
		hrList2.append(code);
	})

	hr3.addEventListener('click', function() {
		text = `<div class="container mt-3 formsizing company-register">
    <h1>개발언어 등록</h1>
    <form action="/action_page.php">
      
      <div class="mb-3">
        <label>개발언어</label>
        <input type="number" class="form-control" id="emp" placeholder="개발언어를 입력해주세요." name="emp">
      </div>

      <div class="btn-center-box">
        <button type="button" class="btn btn-primary btn-lg" onclick="window.close()">등록하기</button>
      </div>
      
      <div class="btn-center-box">
        <button type="button" class="btn btn-primary btn-lg" onclick="addPl()">추가하기</button>
      </div>
      
      <div class="btn-center-box">
        <button type="button" class="btn btn-primary btn-lg" onclick="window.close()">삭제하기</button>
      </div>
      
      
    </form>
  </div>`;


		code = document.createElement('div');
		code.innerHTML = text
		hrList3.append(code);
	})

	hr4.addEventListener('click', function() {

		text = `<div class="container mt-3 formsizing company-register">
                <h1>자격증 등록</h1>
                    <form action="/action_page.php">
                        <div class="mb-3">
                            <label>자격증</label>
                            <input type="text" class="form-control" id="salary" placeholder="자격증을 선택해주세요." name="salary">
                        </div>

                        <div class="btn-center-box">
                            <button type="button" class="btn btn-primary btn-lg" onclick="window.close()">등록하기</button>
                        </div>

                        <div class="btn-center-box">
                            <button type="button" class="btn btn-primary btn-lg" onclick="addCert()">추가하기</button>
                        </div>

                        <div class="btn-center-box">
                            <button type="button" class="btn btn-primary btn-lg" onclick="window.close()">삭제하기</button>
                        </div>
                    </form>
                </div>`;

		code = document.createElement('div');
		code.innerHTML = text
		hrList4.append(code);
	})
}
