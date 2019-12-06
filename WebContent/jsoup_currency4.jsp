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
<title>JSoup�� �̿��� ũ�Ѹ� => ��ȭ ������ �߰��ϱ�</title>
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
	List<String> list2 = new ArrayList<String>();
	
	try {
		doc = Jsoup.connect(url).get();
		Elements e1 = doc.select(".tc"); // ó������ Ŭ���� �Ӽ� tc�� ã�� �Ľ�
		for(Element ele : e1) { // ���⼭ ele�� Ŭ���� �Ӽ��� tc�� �±�
			list.add(ele.html());
		}
		Elements e2 = doc.select(".tl2.bdl");
		for(Element ele2 : e2) {
			list2.add(ele2.html());
		}
	} catch(IOException e) {
		e.printStackTrace();
	}
	
	// jsp���尴ü pageContext : ���� �������� �ڿ������� �����ϰ� ����
	// java����(=Script)���� ���Ǵ� ��ü
	// el���� ����ϱ� ����
	pageContext.setAttribute("list", list);
	pageContext.setAttribute("list2", list2);
%>

<table>
	<%-- <c:forEach items="${list2}" var="country">
		${country}
	</c:forEach> --%>
	<c:set var="country" value="${list2}" />
	<c:forEach items="${list}" var="v" varStatus="stat">
		<c:choose>
			<c:when test="${stat.index %7 ==0}">
				<tr><td rowspan="6" align="center">${v}</td>
					<td rowspan="6">${country[stat.index/7]}</td>
					<td rowspan="6">${list2[stat.index/7]}</td>
					<%--
						list�� 7�� �׷� => ��Ģ => 
						list2�� �� 7�� �׷��� 1���� ��µǾ���
						
					--%>
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