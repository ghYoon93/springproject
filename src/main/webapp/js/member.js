$('#writeFormBtn').click(function(){
	$('#nameDiv').empty();
	$('#idDiv').empty();
	$('#pwdDiv').empty();
	$('#repwdDiv').empty();
	
	//if($('#name').val()==''){
	//if($('input[id=name]').val()==''){
	if($('input[name=name]').val()==''){
		$('#nameDiv').text('이름을 입력하세요');
		$('#nameDiv').css('color','red')
		$('#nameDiv').css('font-size','8pt')
		$('#nameDiv').css('font-weight','bold')
	
	//}else if($('input[name=id]').val()==''){
	}else if($('#id').val()==''){
		$('#idDiv').text('아이디를 입력하세요')
		$('#idDiv').css('color','red')
		$('#idDiv').css('font-size','8pt')
		$('#idDiv').css('font-weight','bold')
		
	}else if($('#pwd').val()==''){
		$('#pwdDiv').text('비밀번호를 입력하세요')
		$('#pwdDiv').css('color','red')
		$('#pwdDiv').css('font-size','8pt')
		$('#pwdDiv').css('font-weight','bold')
		
	}else if($('#pwd').val() != $('#repwd').val()){
		$('#repwdDiv').text('비밀번호가 일치하지 않습니다')
		$('#repwdDiv').css('color','red')
		$('#repwdDiv').css('font-size','8pt')
		$('#repwdDiv').css('font-weight','bold')
	
	}else if($('#id').val() != $('#check').val()){
		$('#idDiv').text('중복체크 하세요')
		$('#idDiv').css('color','red')
		$('#idDiv').css('font-size','8pt')
		$('#idDiv').css('font-weight','bold')
	
	}else
		$('form[name=writeForm]').submit();
		
});

$('#id').focusout(function(){
	if($('#id').val()==''){
		$('#idDiv').text('먼저 아이디를 입력');
		$('#idDiv').css('color','red');
		$('#idDiv').css('font-size','8pt');
		$('#idDiv').css('font-weight','bold');
		
	}else{
		$.ajax({
			type : 'post',
			url : '/springProject/member/checkId',
			data : 'id='+$('#id').val(),
			dataType : 'text',
			success : function(data){
				if(data=='exist'){
					$('#idDiv').text('사용 불가능')
					$('#idDiv').css('color','magenta')
					$('#idDiv').css('font-size','8pt')
					$('#idDiv').css('font-weight','bold')
					
				}else if(data=='non_exist'){
					$('#check').val($('#id').val());
					
					$('#idDiv').text('사용 가능')
					$('#idDiv').css('color','blue')
					$('#idDiv').css('font-size','8pt')
					$('#idDiv').css('font-weight','bold')
				}
			}
		});
	}
});

$('#checkPostBtn').click(function(){
	window.open('/springProject/member/checkPost','','width=400 height=400 scrollbars=yes');
});

$('#postSearchBtn').click(function(){
	$('#sidoDiv').empty();
	$('#sigunguDiv').empty();
	$('#roadnameDiv').empty();
	
	if($('#sido').val()==''){
		$('#sidoDiv').text('시도 선택');
		$('#sidoDiv').css('color','red');
		$('#sidoDiv').css('font-size','8pt');
		$('#sidoDiv').css('font-weight','bold');
		
	}else if($('#sido').val()!='세종' && $('#sigungu').val()==''){
		$('#sigunguDiv').text('시군구 선택');
		$('#sigunguDiv').css('color','red');
		$('#sigunguDiv').css('font-size','8pt');
		$('#sigunguDiv').css('font-weight','bold');
	
	}else if($('#roadname').val()==''){
		$('#roadnameDiv').text('도로명 선택');
		$('#roadnameDiv').css('color','red');
		$('#roadnameDiv').css('font-size','8pt');
		$('#roadnameDiv').css('font-weight','bold');
	
	}else{
		$.ajax({
			type : 'post',
			url : '/springProject/member/postSearch',
			data : $('#checkPostForm').serialize(),
			dataType : 'json',
			success : function(data){
				//alert(JSON.stringify(data));
				
				$('#postTable tr:gt(2)').remove();
				$.each(data.list, function(index, items){
					let address = items.sido+' '
								+ items.sigungu+' '
								+ items.yubmyundong+' '
								+ items.ri+' '
								+ items.roadname+' '
								+ items.buildingname;
					
					address = address.replace(/null/g, '');
					
					$('<tr/>').append($('<td/>',{
						align : 'center',
						text : items.zipcode
					})).append($('<td/>',{
						colspan : '3'
						}).append($('<a/>',{
							href : '#',
							class : 'addressA',
							text : address
						}))
					).appendTo($('#postTable'));
				});//each
				
				$('a').click(function(){
					//alert($(this).prop('tagName'));
					
					$('#zipcode', opener.document).val($(this).parent().prev().text());
					$('#addr1', opener.document).val($(this).text());
					$('#addr2', opener.document).focus();
					window.close();
				});
			},
			error : function(e){
				console.log(e);
			}
		});
	}
});





$('#loginFormBtn').click(function(){
	$('#loginIdDiv').empty();
	$('#loginPwdDiv').empty();
	
	if($('#loginId').val()==''){
		$('#loginIdDiv').text('아이디를 입력')
						.css('color','red')
						.css('font-size','8pt')
						.css('font-weight','bold');
		
	}else if($('#loginPwd').val()==''){
		$('#loginPwdDiv').text('비밀번호를 입력')
						.css('color','red')
						.css('font-size','8pt')
						.css('font-weight','bold');
	
	}else 
		$.ajax({
			type : 'post',
			url : '/springProject/member/login',
			data : {'id' : $('#loginId').val(), 'pwd' : $('#loginPwd').val()},
			dataType : 'text',
			success : function(data){
				if(data == 'success'){
					location.href = '/springProject/main/index';
				}else if(data == 'fail'){
					$('#loginResultDiv').text('로그인 실패')
					                    .css('color', 'red')
					                    .css('font-size','13pt')
					                    .css('font-weight','bold');
				}
			},
			error : function(e){
				console.log(e);
			}
		});
});





















