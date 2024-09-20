<%@page import="kr.or.ddit.company.service.CompanyServiceImpl"%>
<%@page import="kr.or.ddit.company.service.ICompanyService"%>
<%@page import="kr.or.ddit.company.vo.CompanyVO"%>
<%@page import="kr.or.ddit.cmm.util.SessionCheck"%>
<%@page import="kr.or.ddit.member.vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int memCode = 0;
	int memNo = 0;
	int hrNo = 0;
	int cnt = 0;
	int comNo = 0;
	MemberVO loginMember = null;
	CompanyVO cv = null;
	if(SessionCheck.isLoginMember(session)){
		
		loginMember = (MemberVO)session.getAttribute("memVO");
		
		// 로그인 상태인 경우
		memCode = SessionCheck.getMemCode(session, request);
		memNo = SessionCheck.getMemNo(session, request);
		if(memCode == 1){
			// 개인회원인 경우
			hrNo = SessionCheck.getHrNo(session, request);
			System.out.println(hrNo);
		}else if(memCode == 2){

			// 기업회원인 경우
			cnt = SessionCheck.hasComNo(session, request);
			System.out.println(cnt);
			if(cnt > 0){
				// 기업을 등록한 기업회원인 경우
				comNo = SessionCheck.getComNo(session, request);
				System.out.println(comNo);
				ICompanyService companyService = CompanyServiceImpl.getInstance();
				cv = companyService.getCompany(comNo);
				System.out.println(cv);
				
			}
		}
	}else{
		
		// 비회원인 경우
		//로그인 정보없이 접근했을 경우 home.html으로 돌려보냄
				%> <script> alert("해당 권한이 없습니다.");	location.href="/CodePeople/rehearsal/home.html"	</script>	<%
		
	}
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>회원가입</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script> -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js"></script>
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src='https://www.google.com/recaptcha/api.js'></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<script src="/CodePeople/js/jquery-3.6.0.min.js"></script>
<script src="/CodePeople/js/jquery.serializejson.min.js"></script>


<script src="/CodePeople/js/company.js"></script>

<link rel="stylesheet" href="/CodePeople/css/join.css">
<style>
  .mb-3{
  	width: 500px;
  	margin:0 auto;
  }
  body{
  	background-image:  linear-gradient(
        to right bottom,
        rgba(232, 232, 232, 0.6),
        rgba(191, 191, 191, 0.3)),url("/CodePeople/images/companyInsert.jpg");
  	height: 100%;
  	opacity: 1;
}
  }
  div{
  	
  }
  </style>
</head>

<body>

	<div class="container mt-3 formsizing company-register">
		<img src="/CodePeople/images/codeppl_remove.png" alt="코드피플_회원가입이미지"
			style="margin-left: auto; margin-right: auto; display: block;" />
	</div>

		<form action="/action_page.php" id="comInsert">
			<div class="mb-3 mt-3">
				<label>한글 기업명</label> <br> <label class="la2" for="email">*&nbsp;주식회사,
					(주) 등의 표기 없이 입력해주세요</label> <input type="text" class="form-control"
					id="name" placeholder="예) 기업명 " name="comNm" value="<%= cv.getComNm() %>">
			</div>

			<div class="mb-3">
				<label>사원 수</label> <input type="number" class="form-control"
					id="emp" placeholder="사원 수를 입력해주세요.('명'은 생략)" name="comCnt" value="<%= cv.getComCnt() %>">
			</div>

			<div class="mb-3">
				<label>홈페이지 주소</label> <input type="url" class="form-control"
					id="company" placeholder="홈페이지 주소를 입력해주세요" name="comHpg" value="<%= cv.getComHpg() %>">
			</div>

			<div class="mb-3">
				<label>평균 연봉</label> <input type="text" class="form-control"
					id="salary" placeholder="평균 연봉을 입력해주세요.('만 원'은 생략)" name="comSal" value="<%= cv.getComSal() %>">
			</div>

			<div class="mb-3">
				<label>설립일</label> <input type="date" class="form-control"
					id="company-date" placeholder="설립일을 입력해주세요." name="comDate" value="<%= cv.getComDate() %>">
			</div>

			<div class="mb-3">
				<label>회사 한줄 소개</label> <input type="text" class="form-control"
					id="introdce" placeholder="회사 한줄 소개를 입력해주세요." name="comIntro" value="<%= cv.getComIntro() %>">
			</div>

			<div class="mb-3">
				<label>회사 상세 소개</label> <br>
				<textarea style="height: 200px; width: 100%;" type="text"
					class="form-control" id="introdce" placeholder="회사 한줄 소개를 입력해주세요."
					name="comDetail"><%= cv.getComDetail() %></textarea>

			</div>

			<br>
			<div class="dropdown mb-3">
				<label>직군</label> <br> <label class="la2">*&nbsp;더 많은
					사람이 회원님의 기업을 쉽게 찾을 수 있도록 산업 분야를 추가해주세요.</label> <br>
				<div id="search-item">
					<input class="form-control" id="jgval" type="text"	placeholder="직군 검색" disabled>
					<input class="form-control"	id="jgCodeNo" type="text" name="jgCodeNo">
				</div>
				<button type="button" id="jobgroupbtn"
					class="btn btn-primary dropdown-toggle" data-bs-toggle="dropdown">직군
					선택</button>
				<ul class="dropdown-menu">
					<li><a class="dropdown-item" onClick="setValue(this)" >개발 1</a></li>
					<li><a class="dropdown-item" onClick="setValue(this)" >개발 2</a></li>
					<li><a class="dropdown-item" onClick="setValue(this)" >개발 3</a></li>
				</ul>
			</div>
			<br>

			<div class="mb-3 zip">
				<label>우편번호</label>
				<div class="zipInput">
					<input type="text" class="form-control zip" id="postCode" disabled>
					<input type="button" onclick="proc();" value="우편번호 검색" />
				</div>
			</div>

			<div class="mb-3">
				<label>주소1</label> <input type="text" class="form-control"
					id="roadAddress" disabled>
			</div>

			<div class="mb-3">
				<label>주소2</label> <input type="text" class="form-control"
					id="detailAddress">
			</div>

			<div class="mb-3">
				<input type="text" class="form-control" id="cityCodeNo"
					name="cityCodeNo">
			</div>

			<div class="mb-3">
				<input type="text" class="form-control" id="provCodeNo"
					name="provCodeNo">
			</div>

			<div class="mb-3">
				<label>사업자 등록 번호</label><br> <label class="la2">*&nbsp;사업자
					등록번호는 기업관리자만 볼 수 있습니다.</label> <input type="text" class="form-control"
					id="companynum" placeholder="사업자 등록번호를 입력해주세요." name="companynum">
			</div>

			<div class="mb-3">
				<label>기업 공식 이메일</label> <br> <label class="la2">*&nbsp;기업
					공식 도메인의 이메일(@회사명.com)을 입력해주세요.</label> <label class="la2">*&nbsp;해당
					이메일로 인증 메일을 보내드립니다. 인증 시 기업 회원으로 등록됩니다.</label> <input type="email"
					class="form-control" id="companyEmail"
					placeholder="기업 공식 이메일을 입력해주세요." name="companyEmail">
			</div>

			<div class="mb-3">
				<label>문의 담당자</label><br> <label class="la2">*&nbsp;기업
					페이지를 처음 등록한 분이 문의 담당자로 지정됩니다.</label> <label class="la2">*&nbsp;변경하려면
					기업 등록 후 '기업 프로필>기업 정보'에서 변경 및 삭제해주세요.</label> <input type="text"
					class="form-control" id="officer" placeholder="ex)Elon Reeve Musk"
					name="officer">
			</div>

			<input type="hidden" id="memNo" name="memNo" value="<%= memNo %>">

			<div class="btn-center-box">
				<button type="button" class="btn btn-primary btn-lg" id="cpn-btn">등록하기</button>
			</div>
		</form>
</body>
</html>