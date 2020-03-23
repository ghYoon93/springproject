<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<style>
#topDiv a:link {color: black; text-decoration: none; } 
#topDiv a:visited {color: black; text-decoration: none; }
#topDiv a:hover {color: blue; text-decoration: none; }
#topDiv a:active {color: black; text-decoration: none; }
</style>

<a></a>

<h2><img src="../image/love.gif" width="70" height="70"
onclick="location.href='/springProject/main/index'" style="cursor: pointer;"> MVC를 이용한 미니 프로젝트</h2>
<br>
<div id="topDiv">

<c:if test="${memId!=null }">
	<a href="/springProject/board/boardWriteForm">글쓰기</a>&emsp;
</c:if>
	
<a href="/springProject/board/boardList">목록</a>&emsp;
<c:if test="${memId!=null && memId=='admin'}">
	<a href="/springProject/imageboard/imageboardWriteForm">이미지등록</a>&emsp;
</c:if>
<a href="/springProject/imageboard/imageboardList?pg=1">이미지목록</a>&emsp;
</div>












