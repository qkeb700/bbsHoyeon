$(function(){
  $('#all').change(function(){  //체크박스 이벤트 
    if(this.checked){  //체크가 되었는지 확인
        $('.yak').prop("checked", true);  //체크함 attr('id')
    }else{
        $('.yak').prop("checked", false); //체크 취소 attr과 같은 용법
    }
  });

	$("#join01").submit(function(){
		if($('#yak01').is(':checked') == false){
			alert("회원이용 약관에 동의해 주세요.");
			$('#yak01').focus();
			return false;
		}
		if($('#yak02').is(':checked') == false){
			alert("개인정보 수집에 동의해 주세요.");
			$('#yak02').focus();
			return false;
		}
	});
	
	$('#joinform').submit(function(e){
		let reg_email = /[A-Za-z0-9._-]+@[A-Za-z0-9._-]+.[A-Za-z0-9._-]/;
		let reg_tel = /\d{2,3}-\d{3,4}-\d{4}/;
		// 아이디 체크 확인
		if(!$('.findid').val()){
			alert("아이디 중복확인을 해주세요.");
			$('#findid').focus();
			return false;
		}
		// 비밀번호 같은지 확인
		if($("input[name=userpass]").val()){
			if($("input[name=userpass]").val() != $("input[name=reuserpass]").val()){
				alert("비밀번호가 다릅니다. 다시 확인하세요.");
				$("input[name=userpass]").focus();
				return false;
			}
		} else{
				alert("비밀번호를 입력하세요.");
				$("input[name=userpass]").focus();
				return false;
		}
		
		// 이름 확인
		if(!$("input[name=username]").val()){
			alert("이름을 입력하세요.");
			$("input[name=username]").focus();
			return false;
		}
		if(!$("input[name=useremail]").val()){
			alert("이메일을 입력하세요.");
			$("input[name=useremail]").focus();
			return false;
		} else{ 
			if(!reg_email.test($("input[name=useremail]").val())){
				alert("올바른 이메일을 입력하세요.");
				$("input[name=useremail]").focus();
				return false;
			}
		}
		// 전화번호 합치기
		let tel1 = $("input[name=tel1]").val();
		let tel2 = $("input[name=tel2]").val();
		let tel3 = $("input[name=tel3]").val();
		
		if(!tel1||!tel2||!tel3){
			alert("전화번호를 입력하세요");
			$("input[name=tel1]").focus();
			return false;	
		} else{
			let tel = tel1 + "-" + tel2 + "-" + tel3;
			if(!reg_tel.test(tel)){
				alert("올바른 전화번호를 입력하세요.");
				$("input[name=tel1]").focus();
				return false;	
			}else{
				$("input[name=tel]").val(tel);				
			}
		}
	});
	
	$('#findid').click(function(){
		let userid = $('#userid').val();
		if(!userid){
			alert("아이디를 입력하세요.");
			$('#userid').focus();
			return false;
		}
		$('#fuserid').val(userid);
		$('.viewfindid').fadeIn();
	});
	
	$(document).on("click", ".uable",function(e){
		e.preventDefault();
		if($('#fuserid').val()){
			let fuserid = $('#fuserid').val();
			$('#userid').val(fuserid);
			$('.findid').val("ok");
			alert(fuserid + "로 사용합니다.");
		}
		$(".viewfindid").fadeOut();
		
	})
	
	$(document).on("click", ".btn-find", function(){
		let userid = $("#fuserid").val();
		$.get("include/searchid.jsp", {userid: userid},
		function(data){
			if(data==1){
				$('.uable').css("cursor", "pointer").css("text-decoration", "underline").html("사용할 수 있는 아이디입니다.(사용하기)")
			} else {
				$('.uable').html(" 사용할 수 없는 아이디입니다.");
				$('#fuserid').val("");
				$('#userid').val("");
			}
		})
	})
	
	$("#findidform").submit(function(e){
		e.preventDefault();
		let username = $("#username").val();
		let useremail = $("#useremail").val();
		let reg_email = /[A-Za-z0-9._-]+@[A-Za-z0-9._-]+.[A-Za-z0-9._-]/;
		if(!username) {
			alert("이름을 입력하세요.");
			$('#username').focus();
			return false;
		}
		if(!useremail){
			alert("이메일을 입력하세요.");
			$('#useremail').focus();
			return false;
		} else{
			if(!reg_email.test(useremail)){
				alert("올바른 이메일을 입력하세요.");
				$("#useremail").focus();
			}
		}
		$.ajax({
			type: "POST",
			url: "include/findidok.jsp",
			data: {username: username, useremail:useremail},
			success: function(data){
				const rs = JSON.parse(data);
				console.log(rs.userid);
				let str = '';
				if(rs.userid){
					str = "<div class='text-center py-5 px-5'>" + rs.username + "님의 아이디는 <b>[" + rs.userid + "]</b>입니다.</div>";
					str += "<div class='text-center py-5 px-5'><a href='login.jsp'>로그인 하기</a></div>";					
				} else {
					
					str = "<div class='text-center py-5 px-5'>" + rs.username + "님이 찾는 아이디는 없습니다.</div>";
					str += "<div class='text-center py-5 px-5'><a href='login.jsp'>로그인 하기</a> | <a href='../join.jsp'>회원가입하기</a></div>";
				}
				$(".findid").html(str);
			}
		})
		
	})

});