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
    Jdyuding temobjjdyuding=null;
    String  id=request.getParameter("id");
    if( id!=null)
    {
      temobjjdyuding=(Jdyuding)DALBase.load("jdyuding"," where id="+ id);
      request.setAttribute("jdyuding",temobjjdyuding);
    }
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
 <head>
  <title>酒店预订信息查看</title>
    <script type="text/javascript" src="<%=SystemParam.getSiteRoot() %>/webui/jquery/jquery-1.8.3.min.js"></script>
     <link href="<%=SystemParam.getSiteRoot() %>/admin/css/web2table.css" rel="stylesheet" type="text/css" />
</head>
<body >
	<div class="search-title">
		<h2>查看酒店预订</h2>
		<div class="description"></div>
	</div>
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
				</table>
</body>
</html>
