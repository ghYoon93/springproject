$(document).ready(function(){
	$.ajax({
		type : 'post',
		url : '/springProject/board/getBoardList',
		data : 'pg='+$('#pg').val(),
		dataType : 'json',
		success : function(data){
			//alert(JSON.stringify(data));
			$.each(data.list, function(index, items){
				$('<tr/>').append($('<td/>',{
					align : 'center',
					text : items.seq
				})).append($('<td/>',{
					
					}).append($('<a/>',{
						href : '#',
						text : items.subject,
						id : 'subjectA',
						class : items.seq+''
					}))
				
				).append($('<td/>',{
					align : 'center',
					text : items.id
				})).append($('<td/>',{
					align : 'center',
					text : items.logtime
				})).append($('<td/>',{
					align : 'center',
					text : items.hit
				})).appendTo($('#boardListTable'));
				
				//답글
				for(i=0; i<=items.lev; i++){
					$('.'+items.seq).before('&emsp;');
				}//for
				if(items.pseq!=0){
					$('.'+items.seq).before($('<img/>',{
						src : '../image/reply.gif'
					}));
				}
				
			});//each
			
			//페이징처리
			$('#boardPagingDiv').html(data.boardPaging.pagingHTML);
			
			//로그인 여부
			$('#boardListTable').on('click', '#subjectA', function(){
				//alert($(this).prop('tagName'));
				if(data.memId==null)
					alert('먼저 로그인하세요');
				else{
					//alert($(this).parent().prev().text());
					let seq = $(this).attr('class');
					let pg = data.pg;
					location.href='/springProject/board/boardView?seq='+seq+'&pg='+pg;        
				}
			});
		}
	});
});

$('#boardSearchBtn').click(function(event){
	if($('input[name=keyword]').val()==''){
		alert('검색어를 입력하세요');
	}else{
		$.ajax({
			type : 'post',
			url : '/springProject/board/getBoardSearch',
			data : $('#boardListForm').serialize(),
			dataType : 'json',
			success : function(data){
				//alert(JSON.stringify(data));
				
				$('#boardListTable tr:gt(0)').remove();
				
				$.each(data.list, function(index, items){
					$('<tr/>').append($('<td/>',{
						align : 'center',
						text : items.seq
					})).append($('<td/>',{
						
						}).append($('<a/>',{
							href : '#',
							text : items.subject,
							id : 'subjectA',
							class : items.seq+''
						}))
					
					).append($('<td/>',{
						align : 'center',
						text : items.id
					})).append($('<td/>',{
						align : 'center',
						text : items.logtime
					})).append($('<td/>',{
						align : 'center',
						text : items.hit
					})).appendTo($('#boardListTable'));
					
				});//each
				
				//페이징처리
				$('#boardPagingDiv').html(data.boardPaging.pagingHTML);
			}
		});
	}
});














