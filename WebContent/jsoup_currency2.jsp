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
<title>JSoup�� �̿��� ũ�Ѹ� ����</title>
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
		// doc : Ȩ������url�� �ҽ�=>html�� �Ľ��ؼ� html���� �ֻ�� root�±�
		// tag�� dom����
		doc = Jsoup.connect(url).get();
		
	// Elements : �迭�̰ų� list�̰ų� => collection
		// e1 : url�� �����ϴ� html ���� �� �±װ� table�� �±׵��� ����� �迭
		Elements e1 = doc.select("table");
		for(Element ele : e1) { // ���⼭ ele�� table�±� �Ѱ��� ����
			Elements e2 = ele.select("tr");
			for(Element ele2 : e2) { // ele2�� tr�� ������ ����鸸 ����Ǿ� �־� =======> �׷��� line�� <tr>�� �ٿ��ִ� �ž�
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