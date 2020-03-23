<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="member.dao.MemberDAO" %>

<script>
window.onload=function(){
	if(${su}==1){ 
		alert("회원가입 성공");
		location.href="/springProject/main/index";
	}else{
		alert("회원가입 실패");
		location.href="/springProject/member/writeForm";
	}
}
</script>
















