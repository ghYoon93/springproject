<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../css/member.css">
</head>
<body>
<form id="checkPostForm">
<table id="postTable" border="1" width="100%" cellspacing="0" cellpadding="3">
<tr>
	<td align="center">시도</td>
	<td>
	<select name="sido" id="sido" style="width: 100px;" >
		<option value="">시도선택</option>
		<option value="서울">서울</option>
		<option value="인천">인천</option>
		<option value="대전">대전</option>
		<option value="대구">대구</option>
		<option value="울산">울산</option>
		<option value="세종">세종</option>
		<option value="광주">광주</option>
		<option value="경기">경기</option>
		<option value="강원">강원</option>
		<option value="전남">전남</option>
		<option value="전북">전북</option>
		<option value="경남">경남</option>
		<option value="경북">경북</option>
		<option value="충남">충남</option>
		<option value="충북">충북</option>
		<option value="부산">부산</option>
		<option value="제주">제주</option>
	</select>
	<div id="sidoDiv"></div>
	</td>
	<td align="center">시.군.구</td>
	<td>
		<input type="text" name="sigungu" id="sigungu">
		<div id="sigunguDiv"></div>
	</td>
</tr>
<tr>
	<td align="center">도로명</td>
	<td  colspan="3">
		<input type="text" name="roadname" id="roadname" style="width: 200px">
		<input type="button" id="postSearchBtn" value="검색" >
		<div id="roadnameDiv"></div>
	</td>
</tr>
<tr>
	<td align="center">우편번호</td>
	<td colspan="3" align="center">주소</td>
</tr>
</table>
</form>
</body>
<script type="text/javascript" src="../js/jquery-3.4.1.min.js"></script>
<script type="text/javascript" src="../js/member.js"></script>
</html>












