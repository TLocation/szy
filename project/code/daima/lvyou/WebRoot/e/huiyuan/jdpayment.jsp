<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="java.text.*"%>
<%@ page import="com.daowen.bll.*"%>
<%@ page import="com.daowen.entity.*" %>
<%@page import="com.daowen.dal.DALBase"%>
<%@ page  contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="law.jsp"%>
<%
    String  id=request.getParameter("id");
    Jdyuding temobjjdyuding=null;
    if( id!=null)
    {
      
      temobjjdyuding=(Jdyuding)DALBase.load("jdyuding"," where id="+ id);
      request.setAttribute("jdyuding",temobjjdyuding);
    }
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
 <head>
  <title>酒店预订信息查看</title>
    <link rel="stylesheet" href="<%=SystemParam.getSiteRoot()%>/e/css/index.css" type="text/css"></link>
<link rel="stylesheet" href="<%=SystemParam.getSiteRoot()%>/e/css/register.css" type="text/css"></link>
<link href="<%=SystemParam.getSiteRoot()%>/admin/css/web2table.css" rel="stylesheet" type="text/css" />
<script src="<%=SystemParam.getSiteRoot()%>/webui/jquery/jquery-1.8.3.min.js" type="text/javascript"></script>
</head>
<body >
	<jsp:include page="head.jsp"></jsp:include>
	<div class="wrap">
		<div class="cover-title">
			当前位置：<a href="<%=SystemParam.getSiteRoot()%>/e/index.jsp">首页</a> &gt;&gt; 酒店预订管理
		</div>
	</div>
	<div class="wrap">
		<div class="main">
			<jsp:include page="menu.jsp"></jsp:include>
			<div class="main-content">
				<!-----开始---->
				
		<form name="jdyudingform"  method="post" action="<%=SystemParam.getSiteRoot()%>/admin/jdyudingmanager.do"  id="jdyudingForm">
				
				<input type="hidden" name="id" value="<%=id %>" />
			    <input type="hidden" name="actiontype" value="payment" />
			      <input type="hidden" name="errorurl" value="/e/huiyuan/jdpayment.jsp?id=<%=id %>" />
			      <input type="hidden" name="accountname" value="${huiyuan.accountname}"/>
						         
				<input type="hidden" name="forwardurl" value="/admin/jdyudingmanager.do?actiontype=get&forwardurl=/e/huiyuan/jdyudingmanager.jsp" />
		    
				<table cellpadding="0" cellspacing="1" class="grid" width="100%">
					<tr>
						<td width="10%" align="right">酒店名:</td>
						<td>${requestScope.jdyuding.jdtitle}</td>
					</tr>
					<tr>
						<td width="10%" align="right">客房名:</td>
						<td>${requestScope.jdyuding.kfname}</td>
					</tr>
					<tr>
						<td align="right">开始日期:</td>
						<td><fmt:formatDate
								value="${requestScope.jdyuding.begindate}" pattern="yyyy-MM-dd" />
						</td>
					</tr>
					<tr>
						<td align="right">结束日期:</td>
						<td><fmt:formatDate value="${requestScope.jdyuding.enddate}"
								pattern="yyyy-MM-dd" /></td>
					</tr>
					<tr>
						<td width="10%" align="right">天数:</td>
						<td>${requestScope.jdyuding.tianshu}</td>
					</tr>
					<tr>
						<td width="10%" align="right">入住人:</td>
						<td>${requestScope.jdyuding.ruzhuren}</td>
					</tr>
					<tr>
						<td width="10%" align="right">房间数:</td>
						<td>${requestScope.jdyuding.shuliang}</td>
					</tr>
					<tr>
						<td width="10%" align="right">联系电话:</td>
						<td>${requestScope.jdyuding.mobile}</td>
					</tr>
					<tr>
						<td width="10%" align="right">总金额:(元)</td>
						<td>${requestScope.jdyuding.totalprice}￥</td>
					</tr>
					<tr>
						<td width="10%" align="right">状态:</td>
						<td>
						    <%if(temobjjdyuding.getStatus()==1) {%>
						                     待付款
						    <%} %>
						     <%if(temobjjdyuding.getStatus()==2) {%>
						                     已付款
						    <%} %>
						</td>
					</tr>
					<tr>
						<td width="10%" align="right">预订人:</td>
						<td>${requestScope.jdyuding.ydren}</td>
					</tr>
				  <tr>
						       <td colspan="4">
						               
											<button class="orange-button">在线支付</button>
									    
						       </td>
						   </tr>
				        </table>
		</form>
				<!-----结束---->
			</div>
		</div>
	</div>
</body>
</html>
