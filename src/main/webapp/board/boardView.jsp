<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<style type="text/css">
.contents {
	white-space: pre-line;
	word-break: break-all;
	width: 450px;
}
</style>

<form name="boardViewForm">
<input type="hidden" name="seq" id="seq" value="${seq }">
<input type="hidden" name="pg" id="pg" value="${pg }">

<table border="1" cellpadding="5" frame="hsides" rules="rows">
	<tr>
		<td colspan="3">
			<h3><span id="subjectSpan"></span></h3>
		</td>
	</tr>
	<tr>
		<td width="150">글번호 : <span id="seqSpan"></span></td>
		<td width="150">작성자 : <span id="idSpan"></span></td>
		<td width="150">조회수 : <span id="hitSpan"></span></td>
	</tr>
	<tr>
		<td colspan="3" height="200" valign="top">
			<pre class="contents"><span id="contentSpan"></span></pre>
		</td>
	</tr>
</table>
<input type="button" value="목록" onclick="location.href='boardList?pg=${pg}'">
<input type="button" value="답글" onclick="mode(3)">

<span id="boardViewSpan">
	<input type="button" value="글수정" onclick="mode(1)">
	<input type="button" value="글삭제" onclick="mode(2)">
</span>
</form>

<script type="text/javascript">
function mode(num){
	if(num==1){
		document.boardViewForm.method = 'post';
		document.boardViewForm.action = 'boardModifyForm';
		document.boardViewForm.submit();
		
	}else if(num==2){
		document.boardViewForm.method = 'post';
		document.boardViewForm.action = 'boardDelete.do';
		document.boardViewForm.submit();
		
	}else if(num==3){
		document.boardViewForm.method = 'post';
		document.boardViewForm.action = 'boardReplyForm';
		document.boardViewForm.submit();
	}
}
</script>
<script type="text/javascript" src="../js/jquery-3.4.1.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	$.ajax({
		type : 'post',
		url : '/springProject/board/getBoardView',
		data : 'seq='+$('#seq').val(),
		dataType : 'json',
		success : function(data){
			//alert(JSON.stringify(data));
			
			$('#subjectSpan').text(data.boardDTO.subject);
			$('#seqSpan').text(data.boardDTO.seq);
			$('#idSpan').text(data.boardDTO.id);
			$('#hitSpan').text(data.boardDTO.hit);
			$('#contentSpan').text(data.boardDTO.content);
			
			if(data.memId==data.boardDTO.id)
				$('#boardViewSpan').show();
			else
				$('#boardViewSpan').hide();
		}
	});
});
</script>
</html>











