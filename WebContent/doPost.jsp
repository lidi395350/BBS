<%@page import="java.sql.Timestamp"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="org.bbs.dao.MessageDao,org.bbs.models.Message,java.util.Date" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%

	request.setCharacterEncoding("utf-8");
	
	//String author=new String(request.getParameter("author").getBytes("ISO-8859-1"));
	//String message=new String(request.getParameter("message").getBytes("ISO-8859-1"));
	String author=request.getParameter("author");
	String message=request.getParameter("message");
	MessageDao md=new MessageDao();
	Date date=new Date();

	Message msg=new Message(null,message,author,new Timestamp(	date.getTime()));
	System.out.println(msg);
	out.print(msg);
		int rst=md.save(msg);

		if(rst==1){
			out.println("发表成功");
		//	response.sendRedirect("index.jsp");
		out.println("<a href=\"javascript:window.location.href='index.jsp'\">返回首页</a>");
		}else{
			out.println("发表失败");
		}
	
%>
