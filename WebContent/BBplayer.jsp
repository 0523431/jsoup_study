<%@page import="java.io.IOException"%>
<%@page import="org.jsoup.nodes.Element"%>
<%@page import="org.jsoup.select.Elements"%>
<%@page import="org.jsoup.Jsoup"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="org.jsoup.nodes.Document"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%
	String url = "http://www.hanwhaeagles.co.kr/html/players/player/hitter_view.asp?sGubunCd=PLPPIF&sMSId=P359";
	String line = "";
	Document doc = null;
	
	List<String> list = new ArrayList<String>();
	try {
		doc = Jsoup.connect(url).get();
		Elements e1 = doc.select(".personareainner > .img");
		for(Element ele : e1) {
			out.print(ele.toString()+"\t");			
		}
		Elements e2 = doc.select(".img");
		for(Element ele2 : e2) {
			String temp = ele2.html();
			line +=temp;
		}
		// 경기기록
		Elements e3 = doc.select(".titH2");
		for(Element ele3 : e3) {
			line += ele3.html();
		}
		Elements e4 = doc.select(".latelyRecord");
		for(Element ele4 : e4) {
			list.add(ele4.html());
		}
		} catch(IOException e) {
		e.printStackTrace();
	}
%>

<div>
	<%=line %>
</div>
<hr>
<div>
	<%=list %>
</div>
</body>
</html>