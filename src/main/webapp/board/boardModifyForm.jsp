<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<h2>글수정</h2>
<form name="boardModifyForm" method="post" action="boardModify.do">
<input type="hidden" name="seq" value="${seq }">
<input type="hidden" name="pg" value="${pg }">

<table border="1" cellpadding="3" cellspacing="0">
	<tr>
		<td width="70" align="center">제목</td>
		<td>
			<input type="text" name="subject" value="${subject }" size="40">
		</td>
	</tr>

	<tr>
		<td align="center" width="70">내용</td>
		<td>
			<textarea name="content" rows="15" cols="50">${content }</textarea>
		</td>
	</tr>
	<tr>
		<td colspan="2" align="center">
		<input type="button" value="글수정" onclick="checkBoardModifyForm()"> 
		<input type="reset" value="다시작성"></td>
	</tr>
</table>
</form>

<script type="text/javascript">
function checkBoardModifyForm() {
	if (document.boardModifyForm.subject.value=="")
		alert("제목을 입력하세요.");
	else if (document.boardModifyForm.content.value=="")
		alert("내용을 입력하세요.");
	else
		document.boardModifyForm.submit();
}
</script>











