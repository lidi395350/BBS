<%@page import="java.math.BigDecimal"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    
    <%@ page import="org.bbs.dao.MessageDao,java.util.List,org.bbs.models.Message" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>留言板</title>

<style type="text/css" >
	.frame{padding-left:40px;}
	.block{border:1px solid #ccc;margin:3px 20px 10px 0px}
	.title{font-size:13px;padding-left:3px;background-color:#cccccc }
	.floor{font-size:12px;text-align:right;padding-right:20px;}
	.time{font-size:12px;text-align:right;padding-right:20px;color:gray}
	.content{margin-left:20px;}
</style>

	<script type="text/javascript">
		
		function changePage(page){
			if(page<0)page=0;
			window.location.href="index.jsp?page="+page;
		}
		
		//写cookies函数 作者：翟振凯
		function SetCookie(name,value)//两个参数，一个是cookie的名子，一个是值
		{
		    var Days = 30; //此 cookie 将被保存 30 天
		    var exp  = new Date();    //new Date("December 31, 9998");
		    exp.setTime(exp.getTime() + Days*24*60*60*1000);
		    document.cookie = name + "="+ escape (value) + ";expires=" + exp.toGMTString();
		}
		function getCookie(name)//取cookies函数        
		{
		    var arr = document.cookie.match(new RegExp("(^| )"+name+"=([^;]*)(;|$)"));
		     if(arr != null) return unescape(arr[2]); return null;

		}
		function delCookie(name)//删除cookie
		{
		    var exp = new Date();
		    exp.setTime(exp.getTime() - 1);
		    var cval=getCookie(name);
		    if(cval!=null) document.cookie= name + "="+cval+";expires="+exp.toGMTString();
		}
		//保存编辑状态到cookie
		function fun1(){
			var author=document.getElementById("author").value;
			var message=document.getElementById("message").value;
		
			SetCookie("author",author);
			SetCookie("message",message);
		}
	</script>
</head>
<body >

	<div class="frame">
	<h1>留言板</h1>
	<%
	request.setCharacterEncoding("utf-8");
	response.setContentType("text/html;charset=utf-8");
	response.setCharacterEncoding("utf-8");
		MessageDao md=new MessageDao();
		int totalPageNum=md.getTotalPageNum();//总页数
		String pageno=request.getParameter("page");
		if(null==pageno)pageno="0";
		List list=md.listByPage(Integer.parseInt(pageno));
		int len=list.size();
	  for(int i=0;i<len;i++){
		  Message message=(Message)list.get(i);
		
		//  System.out.println(message);
	%>
<div class="block">
		
		<div class="title">作者：<%=message.getAuthor() %></div>
		<div class="floor"><%=message.getId() %>#</div>
		<div class="content"><%= message.getMessage()%></div>
		<hr width="95%" size="1" color="#ccc"/>
		<div class="time">发表：<%= message.getPostTime() %></div>

		</div>
	<%
	  }	
	%>
	<div >
	
	<input type="button" value="上一页" <% 
	if(0>=Integer.parseInt(pageno.toString())){
		out.print("disabled=\"disabled\"");} 
		%> onclick="changePage(<%=pageno%>-1)"/>
	<input type="button" value="下一页" <% 
	if(totalPageNum==Integer.parseInt(pageno.toString())){
		out.print("disabled=\"disabled\"");} 
		%> onclick="changePage(<%= pageno%>+1)"/>
	</div>
	
	<form action="doPost.jsp" method="post">
		<table>
			<tr>
				<td>用户名	</td><td><input type="text" id="author" name="author" onchange="fun1()"/></td>
			</tr>
			<tr>
				<td>留言信息	</td><td><textarea id="message" name="message" rows="4" cols="90" onchange="fun1()"></textarea></td>
			</tr>
		</table>
		<input type="submit" value="提交"/>
		
	</form>
</div>
</body>
</html>

<script type="text/javascript">

	var author=getCookie("author");
	var message=getCookie("message");
//	alert(message);
	
	var au=document.getElementById("author");
	var msg=document.getElementById("message");
	//恢复编辑状态
	au.value=author;	
	msg.value=message;
	
//	alert(msg.value);
	
</script>