<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<table border="1" width="500"cellpadding="3" frame="hsides" rules="rows">
	<tr>
		<td rowspan="4">
			<img id="image1" src=""></td>
		<td>
			상품명: <span id="imageboardNameSpan"></span>
		</td>
	</tr>
	<tr>		
		<td>단가: <span id="imageboardPriceSpan"></span></td>
	</tr>
	<tr>		
		<td>개수: <span id="imageboardQtySpan"></span></td>
	</tr>
	<tr>
		<td>합계: <span id="imageboardSpan"></span></td>	
	</tr>
	<tr>
		<td colspan="2" height="200">${imageboardDTO.imageContent }</td>
	</tr>
</table>
<input type="button" value="목록" onclick="location.href='imageboardList.do?pg=${pg}'">
<script type="text/javascript" src="../js/jquery-3.4.1.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	$.ajax({
		type: 'post',
		url:'/springProject/imageboard/getImageboardView',
		data: 'seq=${seq}',
		dataType: 'json',
		success: function(data){
			alert(JSON.stringify(data));
			$('#image1').attr('src','../storage/'+data.imageboardDTO.image1);
			$('#imageboardNameSpan').text(data.imageboardDTO.imageName);
			$('#imageboardPriceSpan').text(data.imageboardDTO.imagePrice);
			$('#imageboardQtySpan').text(data.imageboardDTO.imagePrice);
			$('#imageboardTotalSpan').text(data.imageboardDTO.imagePrice);
			$('#imageboardContentSpan').text(data.imageboardDTO.imageContent);
		}
	});
})
</script>








