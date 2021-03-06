<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<style>
#paging{
	color: black;
	text-decoration: none;
	cursor: pointer;
}
#currentPaging{
	color: red;
	text-decoration: underline;
	cursor: pointer;
}

</style>

<form name="imageboardListForm" method="" action="imageboardDelete.do">
<table border="1" frame="hsides" rules="rows" cellpadding="3">
	<th width="70"><input type="checkbox" id="all" onclick="checkAll()">번호</th>
	<th width="200">이미지</th>
	<th width="100">상품명</th>
	<th width="100">단가</th>
	<th width="70">개수</th>
	<th width="100">합계</th>
</table>
</form>

<div style="border: 1px red solid; float: left;">
	<input type="button" value="선택삭제" onclick="choiceDelete()">
</div>
<div style="border: 1px red solid; float: left; width: 650px; text-align: center;">${imageboardPaging.pagingHTML }</div>

<script src="../js/jquery-3.4.1.min.js"></script>
<script>
function checkAll(){
	//alert(document.getElementById("all").checked);
	//alert(document.getElementsByName("check").length);
	
	let check = document.getElementsByName("check");
	if(document.getElementById("all").checked){
		for(i=0; i<check.length; i++){
			check[i].checked = true;
		}
	}else{
		for(i=0; i<check.length; i++){
			check[i].checked = false;
		}
	}
}

function choiceDelete(){
	let check = document.getElementsByName("check");
	let count=0;
	for(i=0; i<check.length; i++){
		if(check[i].checked) count++;
	}
	
	if(count==0)
		alert("항목을 선택하세요");
	else
		if(confirm("정말로 삭제하시겠습니까")){
			document.imageboardListForm.submit();
		}
}

function imageboardPaging(pg){
	location.href="imageboardList.do?pg="+pg;
}
</script>
<script type="text/javascript">
	$(document).ready(function(){
		$.ajax({
			type: 'post',
			url: 'springProject/imageboard/getImageboardList',
			data: 'pg=${pg}',
			dataType: 'json',
			success: function(data){
				//alert(JSON.stringify(data));
				$.each(data.list, function(index, items){
					$('<tr/>').append($('<td/>',{
						align: 'center',
						text: items.seq
					})).append($('<td/>',{
						algin: 'center',
						
					}).append($('<img/>',{ 
						src: '../storage/'+items.image1,
						style: 'cursor:pointer; width: 70px; height: 70px;'
						})).apend($('<td/>', {
						align: 'center',
						text: items.imageName
					}))).append($('<td/>',{
						algin: 'center',
						text: items.imagePrice
					})).append($('<td/>', {
						align: 'center',
						text: items.imageQty
					}))append($('<td/>', {
						align: 'center',
						text= items.imagePrice* itemsQty
					})).appendTo($('#imageboardListTable'));
				});
			}
		});
	});	
</script>













