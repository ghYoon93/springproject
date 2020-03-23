<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<style type="text/css">
#subjectA:link { color: black; text-decoration: none; }
#subjectA:visited { color: black; text-decoration: none; }
#subjectA:hover { color: blue; text-decoration: underline; }
#subjectA:active { color: black; text-decoration: none; }

#paging {
	color: black;
	text-decoration: none;
	cursor: pointer;
}
#currentPaging {
	color: red;
	text-decoration: underline;
	cursor: pointer;
}
</style>

<form id="boardListForm">
<input type="hidden" name="pg" id="pg" value="${pg }">
<table id="boardListTable" border="1" cellpadding="5" frame="hsides" rules="rows">
	<tr>
		<th width="70">글번호</th>
		<th width="300">제목</th>
		<th width="100">작성자</th>
		<th width="100">작성일</th>
		<th width="100">조회수</th>
	</tr>	
</table>

<div id="boardPagingDiv" style="display:inline-block; width: 700px; text-align: center;"></div>

<br><br>

 <div style="text-align: center;">
 	<select name="searchOption" id="searchOption" style="width: 80px;">
		<option value="subject">제목
		<option value="id">아이디
	</select>
	<input type="text" name="keyword" value="${keyword }">
	<input type="button" id="boardSearchBtn" value="검색">
 </div>
</form>

<script type="text/javascript" src="../js/jquery-3.4.1.min.js"></script>
<script type="text/javascript" src="../js/boardList.js"></script>
<script type="text/javascript">
function boardSearch(pg){
	$('#pg').val(pg);
	$('#boardSearchBtn').trigger('click');
}
</script>




















