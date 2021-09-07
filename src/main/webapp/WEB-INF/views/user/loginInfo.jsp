<%@ page import="java.util.Date"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>** Session Info **</title>
</head>
<body>
<%	SimpleDateFormat formatter =
			new SimpleDateFormat("yyyy-MM-dd HH:mm:ss") ;
	Date now = new Date() ;
%>
<h2>** Session Info **<br>
* 현 재 시 간 : <%=formatter.format(now)%><br>
* Session ID : <%=session.getId()%><br>
<%  now.setTime(session.getCreationTime()); %>
* Session 생성시간 : <%=formatter.format(now)%><br>
<%  now.setTime(session.getLastAccessedTime()); %>
* Session 최근접근시간 : <%=formatter.format(now)%><br>

* Session 유효시간 설정 : 10초 설정<br>
=> session 객체의 메서드  또는  web.xml 에서 <br><br>
<%-- <% session.setMaxInactiveInterval(10) ; %> --%>

* Session Attribute Test<br>
${logId} 님 로그인 중 입니다.<br>


<a href="detail">[내정보 보기]</a>&nbsp;&nbsp;&nbsp;
<a href="delete">[회원 탈퇴]</a>&nbsp;&nbsp;&nbsp;
<a href="logout">[LogOut]</a>
</h2>
</body>
</html>