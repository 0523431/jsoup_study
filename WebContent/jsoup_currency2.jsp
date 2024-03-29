<%@page import="org.jsoup.nodes.Element"%>
<%@page import="org.jsoup.select.Elements"%>
<%@page import="org.jsoup.Jsoup"%>
<%@page import="org.jsoup.nodes.Document"%>
<%@page import="java.io.IOException"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>JSoup을 이용한 크롤링 예제</title>
<style type="text/css">
	table, td, th {
		border : 2px solid grey;
	}
</style>

</head>
<body>

<%
	String url = "https://www.koreaexim.go.kr/site/program/financial/exchange?menuid=001001004002001";
	// String url = "https://www.koreaexim.go.kr/site/homepage/menu/viewMenu?menuid=001001004001001";
	String line = "";
	Document doc = null;
	try {
		// doc : 홈페이지url의 소스=>html을 파싱해서 html위의 최상단 root태그
		// tag는 dom형태
		doc = Jsoup.connect(url).get();
		
	// Elements : 배열이거나 list이거나 => collection
		// e1 : url이 제공하는 html 문서 중 태그가 table인 태그들이 저장된 배열
		Elements e1 = doc.select("table");
		for(Element ele : e1) { // 여기서 ele는 table태그 한개를 뜻함
			Elements e2 = ele.select("tr");
			for(Element ele2 : e2) { // ele2는 tr을 제외한 내용들만 저장되어 있어 =======> 그래서 line에 <tr>을 붙여주는 거야
				String temp = ele2.html();
				System.out.println("========================");
				System.out.println(temp);
				line += "<tr>"+temp+"</tr>";
			}
		}
	} catch(IOException e) {
		e.printStackTrace();
	}
%>
<table>
	<%=line %>
</table>

</body>
</html>