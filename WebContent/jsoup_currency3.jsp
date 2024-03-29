<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="org.jsoup.nodes.Element"%>
<%@page import="org.jsoup.select.Elements"%>
<%@page import="org.jsoup.Jsoup"%>
<%@page import="org.jsoup.nodes.Document"%>
<%@page import="java.io.IOException"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>JSoup을 이용한 크롤링 => class 속성으로 조회하기</title>
<style type="text/css">
	table, td, th {
		border : 1px solid grey; border-collapse:collapse;
	}
</style>

</head>
<body>

<%
	String url = "https://www.koreaexim.go.kr/site/program/financial/exchange?menuid=001001004002001";
	// String url = "https://www.koreaexim.go.kr/site/homepage/menu/viewMenu?menuid=001001004001001";
	String line = "";
	Document doc = null;
	
	List<String> list = new ArrayList<String>();
	
	try {
		doc = Jsoup.connect(url).get();
		Elements e1 = doc.select(".tc"); // 처음부터 클래스 속성 tc를 찾아 파싱
		for(Element ele : e1) { // 여기서 ele는 클래스 속성이 tc인 태그
			list.add(ele.html());
		}
	} catch(IOException e) {
		e.printStackTrace();
	}
	
	// jsp내장객체 pageContext : 현재 페이지의 자원정보를 저장하고 있음
	// java영역(=Script)에서 사용되는 객체
	// el에서 속성값이 필요해서 가져옴
	pageContext.setAttribute("list", list);
%>

<table>
	<c:forEach items="${list}" var="v" varStatus="stat">
		<c:choose>
			<c:when test="${stat.index %7 ==0}"> <%-- tc속성인 태그가 7개 단위로 그룹 --%>
				<tr><td rowspan="6">${v}</td>
			</c:when>
			<c:when test="${stat.index %7 ==1}">
				<td>${v}</td></tr>
			</c:when>
			<c:otherwise>
				<tr><td>${v}</td></tr>
			</c:otherwise>
		</c:choose>
	</c:forEach>
</table>

</body>
</html>