<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<table border="1" width="500"cellpadding="3" frame="hsides" rules="rows">
	<tr>
		<td rowspan="4"><img src="http://localhost:8080/miniProject/storage/${imageboardDTO.image1 }"></td>
		<td>${imageboardDTO.imageName }</td>
	</tr>
	<tr>		
		<td>${imageboardDTO.imagePrice }</td>
	</tr>
	<tr>		
		<td>${imageboardDTO.imageQty }</td>
	</tr>
	<tr>
		<td>${imageboardDTO.imagePrice * imageboardDTO.imageQty }</td>	
	</tr>
	<tr>
		<td colspan="2" height="200">${imageboardDTO.imageContent }</td>
	</tr>
</table>
<input type="button" value="목록" onclick="location.href='imageboardList.do?pg=${pg}'">







