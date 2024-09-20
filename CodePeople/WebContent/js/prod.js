var prodNo = 0;

$(function () {
	$('#btn1').on('click', function () {
		prodNo = 1;
		doPost(prodNo);
	});
	$('#btn2').on('click', function () {
		prodNo = 2;
		doPost(prodNo);
	});
	$('#btn3').on('click', function () {
		prodNo = 3;
		doPost(prodNo);
	});

});



function pageGoPost(d) {
	var insdoc = "";

	for (var i = 0; i < d.vals.length; i++) {
		insdoc += "<input type='hidden' name='" + d.vals[i][0] + "' value='" + d.vals[i][1] + "'>";
	}

	var goform = $("<form>", {
		method: "post",
		action: d.url,
		target: d.target,
		html: insdoc,
	}).appendTo("body");

	goform.submit();
}


function doPost(prodNo){
	$.ajax({
		type: "post",
		url: "/CodePeople/ProdList.do",
		data: { "prodNo": prodNo },
		dataType: "json",
		success: function (res) {
			
			var prodNo = res.prodNo;
			var prodNm = res.prodNm;
			var prodPrice = res.prodPrice;
			
			pageGoPost({
				url: "../html/kakaoPay.jsp" ,
				target: "_blank",
				vals: [
					["prodNo", prodNo],
					["prodNm", prodNm],
					["prodPrice", prodPrice]
				]
			});
		},
		error: function (xhr) {
			alert("상태 : " + xhr.status + "  text : " + xhr.statusText);
		}
	});
}