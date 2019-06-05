var joinValidate = {
	
	// 결과 메세지 출력시 사용하는 Text
	resultCode : {
		empty_val : {
			code : 1,
			desc : '필수입력 정보입니다.'
		},
		// ID
		empty_id : {
			code : 2,
			desc : '공백 없이 3~15자의 영문/숫자 또는 ,_를 조합하여 입력'
		},
		invalid_id : {
			code : 3,
			desc : '3~15자의 영문/숫자 또는 ,_를 조합하여 입력'
		},
		length_id : {
			code : 4,
			desc : '3~15자의 영문/숫자 또는 ,_를 조합하여 입력'
		},
		overlap_id : {
			code : 6,
			desc : '이미 사용 중인 아이디입니다.'
		},
		// PW
		empty_pw : {
			code : 2,
			desc : '공백 없이 5~16자의 영문/숫자를 조합하여 입력'
		},
		invalid_pw : {
			code : 3,
			desc : '5~16자의 영문/숫자를 조합하여 입력'
		},
		other_pw : {
			code : 5,
			desc : '입력하신 비밀번호가 일치하지 않습니다.'
		},
		// name
		empty_name : {
			code : 2,
			desc : '공백 없이 표준 한글 2~8자까지 가능합니다.'
		},
		invalid_name : {
			code : 3,
			desc : '표준 한글 2~8자까지 가능합니다.'
		},
		// phone
		number_phone : {
			code : 6,
			desc : '숫자만 입력해주세요.'
		},
		invalid_phone : {
			code : 3,
			desc : '번호가 유효하지 않습니다.'
		},
		// email
		invalid_email : {
			code : 3,
			desc : '올바른 이메일을 입력해주세요.'
		},
		success_id : {
			code : 0,
			desc : '사용 가능합니다.'
		},
		success_pw : {
			code : 0,
			desc : '사용 가능합니다.'
		},
		success_rpw : {
			code : 0,
			desc : '사용 가능합니다.'
		},
		success_name : {
			code : 0,
			desc : '사용 가능합니다.'
		},
		success_phone : {
			code : 0,
			desc : '사용 가능합니다.'
		},
		success_email : {
			code : 0,
			desc : '사용 가능합니다.'
		}
	},
	
	
	checkId : function(memId){
        var regEmpty = /\s/g; // 공백문자
        var reg = /[^a-z0-9_.]+/g; // []안과 같으면 false, 다르면 true
		
        // 4. member.jsp에서 전달한 매개변수 memId로 유효성체크 시작
        // 1) null값 체크				 	if
        // 2) 값 사이의 공백값 체크 			else if
        // 3) 유효한 값인지 체크(정규식) 	else if
        // 4) 6자~50자 이내 길이 체크 		else if
        // 5) 성공: 유효한 값(중복유무X)		else
        if (memId == '' || memId.length == 0) {
            return this.resultCode.empty_val;
        } else if (memId.match(regEmpty)) {
        	return this.resultCode.empty_id;
		} else if (reg.test(memId)) {
        	return this.resultCode.invalid_id;
        } else if ((memId.length<3) || (memId.length>15)) {
        	return this.resultCode.length_id;
		} else {
			// 5. 입력받은 값의 아이디로 위의 유효성체크 4단계를 통과
			// 	   하지만 중복된 ID인지 검정 필요함
			// 6. return 결과값으로 success_id(code, desc)를 호출한 곳으로 전송!
			// 	  code: 0, desc: "사용 가능합니다."
			return this.resultCode.success_id;
		}
        
        // 중복체크(ajax)
        // ajaxCheck(id);
	},
	
	checkPw:function(memPw, memRpw){
		var regEmpty = /\s/g;
        var pwReg = RegExp(/^[a-zA-Z0-9]{5,16}$/);
        
        if (memPw == '' || memPw.length == 0) {
            return this.resultCode.empty_val;
        } else if (memPw.match(regEmpty)) {
        	return this.resultCode.empty_pw;
		} else if (!pwReg.test(memPw)) {
			return this.resultCode.invalid_pw;
		} else {
            return this.resultCode.success_pw;
        }
	},
	
	checkRpw:function(memPw, memRpw){
		
		var regEmpty = /\s/g;
        var pwReg = RegExp(/^[a-zA-Z0-9]{5,16}$/);
        
        if (memRpw == '' || memRpw.length == 0) {
            return this.resultCode.empty_val;
        } else if (memRpw.match(regEmpty)) {
        	return this.resultCode.empty_pw;
		} else if (!pwReg.test(memRpw)) {
			return this.resultCode.invalid_pw;
		} else {
            return this.resultCode.success_pw;
        }
	}
}



//ID 중복체크 Ajax
function ajaxCheck(memId) {
	// 10. ajax 시작!!!
	//	    목적지: idCheck.gaon
	//	    전달데이터: memId 데이터를 id변수에 담아 전달
	//	    데이터 포장방법: json
	//	    데이터 전달방법: POST방식
	
	// id에 값이 있는 경우에만 ajax 동작!
	var ajaxId = "-1";
    $.ajax({
   		url: "idcheck?id="+memId,
   		type: "POST", // 보내는 방식(운송역할)
   		async: false,
   		contentType: "application/json", // 거의 ajax에서는 json만 쓴다, 데이터 가방의 타입(포장)
   		success: function(data) { // data: Action에서 return으로 보내준 값을 받음
   			console.log(data);
   			// 29. Action단에서 전송한 message, id를 data매개변수로 받음
   			// 30. data.message의 값이 -1이면 => 중복메세지 출력
   			// 	   data.message의 값이 1이면 => 사용가능메세지 출력
   			if (data == 1) {
   				$('.box_inner').eq(0).css('color', 'tomato')
                   			 		 .css('display', 'block')
                   					 .text("이미 사용 중인 아이디입니다.");
   				ajaxId = "-1";
			} else {
				$(".box_inner").eq(0).css('display', 'none');
				ajaxId = "1";
			} 
   		},
   		// success를 타면 error를 타지 않음
   		error: function() {
   			alert("system Error!!");
   		}
   	});
    return ajaxId;
}





function ajaxPwCheck(nowId, nowPw){
	var ajaxPw = false;
	$.ajax({
 	   url: "pwcheck?id="+nowId+"&pw="+nowPw,
 	   type: "POST",
 	   async: false,
 	   success: function(data) {
 		   console.log(data);
 		   if (data == "1") {
 			   $('.pwAjax').css('color', 'dodgerblue')
                			.css('display', 'block')
                			.text("비밀번호가 일치합니다.");
 			  ajaxPw = true;
 		   } else {
 			   $('.pwAjax').css('color', 'tomato')
							.css('display', 'block')
							.text("비밀번호가 일치하지 않습니다.");
 			  ajaxPw = false;
 		   }
 	   },
 	   error:function(){
 		   alert("system Error!!!");
 	   }
    });
	return ajaxPw;
}







function idCheck(id) {
	var memId = $.trim(id);
    var checkResult = joinValidate.checkId(memId);
    if(checkResult.code != 0) {
    	$('.box_inner').eq(0).text(checkResult.desc)
    						.css('color', 'tomato')
							.css('display', 'block');
    	val_id = false;
    } else {
    	if(ajaxCheck(memId) == "1"){
    		val_id = true;
    	} else {
    		val_id = false;
		}
    }
    return val_id;
}

function pwCheck(pw, rpw) {
	var memPw = $.trim(pw);
	var memRpw = $.trim(rpw);
    
    var checkResult = joinValidate.checkPw(memPw, memRpw);
    
    if(checkResult.code != 0) {
    	$('.box_inner').eq(1).text(checkResult.desc)
    						.css('color', 'tomato')
							.css('display', 'block');
    	return_val = false;
    } else {
    	$('.box_inner').eq(1).css('display', 'none');
		
        if (memRpw != null || memRpw.length != 0) {
			if (memPw == memRpw) { // pw, rpw가 같은지 확인
				$('.box_inner').eq(2).css('display', 'none');
				return_val = true;
			} else {
				$('.box_inner').eq(2).css('color', 'tomato')
					 					 .css('display', 'block')
					 					 .text('입력하신 비밀번호가 일치하지 않습니다.');
				return_val = false;
			}
		}
        return false;
    }
    return false;
}

function rpwCheck(pw, rpw){
	var memPw = $.trim(pw);
	var memRpw = $.trim(rpw);
    
    var checkResult = joinValidate.checkRpw(memPw, memRpw);
    
    if(checkResult.code != 0) {
    	$('.box_inner').eq(2).text(checkResult.desc)
    						.css('color', 'tomato')
							.css('display', 'block');
    	return false;
    } else {
    	$('.box_inner').eq(2).css('display', 'none');
		
        if (memPw != null || memPw.length != 0) {
			if (memPw == memRpw) { // pw, rpw가 같은지 확인
				$('.box_inner').eq(2).css('display', 'none');
				return true;
			} else {
				$('.box_inner').eq(2).css('color', 'tomato')
					 					 .css('display', 'block')
					 					 .text('입력하신 비밀번호가 일치하지 않습니다.');
				return false;
			}
		}
        return false;
    }
    return false;
}

function nameCheck(name) {
	var nameReg = RegExp(/^[가-힣]{2,8}$/);
    var regEmpty = /\s/g;

    if (name == '' || name.length == 0) {
        //alert('test');
        $('.box_inner').eq(3).css('color', 'tomato')
                             .css('display', 'block')
                             .text("필수입력 정보입니다.");
        return false;
    } else if (name.match(regEmpty)) {
    	$('.box_inner').eq(3).css('color', 'tomato')
	 	 					 .css('display', 'block')
		 					 .text("공백 없이 표준 한글 2~8자까지 가능합니다.");
    	return false;
	} else if (!nameReg.test(name)) {
        $('.box_inner').eq(3).css('color', 'tomato')
                             .css('display', 'block')
                             .text("표준 한글 2~8자까지 가능합니다.");
        return false;
    } else {
        $('.box_inner').eq(3).css('display', 'none');
        return true;
    }
    return false;
}

function phone1Check(phone){
	var regEmpty = /\s/g;

    if (phone == '' || phone.length == 0) {
        $('.box_inner_phone').css('color', 'tomato')
                             .css('display', 'block')
                             .text("필수입력 정보입니다.");
        return false;
    } else if ($.isNumeric(phone) == false) {
    	$('.box_inner_phone').css('color', 'tomato')
	 	 					 .css('display', 'block')
		 					 .text("숫자만 입력해주세요.");
    	return false;
	} else if (phone.indexOf("01") != 0) {
		// indexOf("01"): 01로 시작
		// lastindexOf
        $('.box_inner_phone').css('color', 'tomato')
                             .css('display', 'block')
                             .text("번호가 유효하지 않습니다.");
        return false;
    } else if (phone.length != 3) {
        $('.box_inner_phone').css('color', 'tomato')
		                     .css('display', 'block')
		                     .text("번호가 유효하지 않습니다.");
        return false;
	} else {
    	$('.box_inner_phone').css('display', 'none');
    	return true;
    }
    return false;
}

function phone2Check(phone){
	var regEmpty = /\s/g;

    if (phone == '' || phone.length == 0) {
        $('.box_inner_phone').css('color', 'tomato')
                             .css('display', 'block')
                             .text("필수입력 정보입니다.");
        return false;
    } else if ($.isNumeric(phone) == false) {
    	$('.box_inner_phone').css('color', 'tomato')
	 	 					 .css('display', 'block')
		 					 .text("숫자만 입력해주세요.");
    	return false;
	} else if (phone.length != 4) {
        $('.box_inner_phone').css('color', 'tomato')
		                     .css('display', 'block')
		                     .text("번호가 유효하지 않습니다.");
        return false;
	} else {
    	$('.box_inner_phone').css('display', 'none');
    	return true;
    }
    return false;
}

function emailCheck(email, url){
	var regEmpty = /\s/g;
    var emailReg = RegExp(/^[A-Za-z0-9._-]+@[A-Za-z0-9._-]+\.[A-Za-z]{2,4}$/i);

    if (email == '' || email.length == 0) {
        //alert('test');
        $('.box_inner_email').css('color', 'tomato')
                             .css('display', 'block')
                             .text("필수입력 정보입니다.");
        return false;
    } else if (email.match(regEmpty)) {
    	$('.box_inner_email').css('color', 'tomato')
	 	 					 .css('display', 'block')
		 					 .text("올바른 이메일을 입력해주세요.");
    	return false;
	} else if (url != "" || url.length != 0) {
		
		var fullMail = email+"@"+url;
		
		if (!emailReg.test(fullMail)) {
			$('.box_inner_email').css('color', 'tomato')
				 					 .css('display', 'block')
				 					 .text("올바른 이메일을 입력해주세요.");
			return false;
		} else {
			$('.box_inner_email').css('display', 'none');
			return true;
		}
		return false;
	}
}

function urlCheck(email, url){
	var regEmpty = /\s/g;
    var emailReg = RegExp(/^[A-Za-z0-9._-]{3,15}+@[A-Za-z0-9._-]+\.[A-Za-z]{2,4}$/i);

    if (url == '' || url.length == 0) {
        //alert('test');
        $('.box_inner_email').css('color', 'tomato')
                             .css('display', 'block')
                             .text("필수입력 정보입니다.");
        return false;
    } else if (url.match(regEmpty)) {
    	$('.box_inner_email').css('color', 'tomato')
	 	 					 .css('display', 'block')
		 					 .text("올바른 이메일을 입력해주세요.");
    	return false;
	} else if (url != "" || url.length != 0) {
		
		var fullMail = email+"@"+url;
		
		if (!emailReg.test(fullMail)) {
			$('.box_inner_email').css('color', 'tomato')
				 					 .css('display', 'block')
				 					 .text("올바른 이메일을 입력해주세요.");
			return false;
		} else {
			$('.box_inner_email').css('display', 'none');
			return true;
		}
		return false;
	}
}


