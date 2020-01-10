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
    String command="add";
    if( id!=null)
    {
      command="update";
      Xlyuding temobjxlyuding=(Xlyuding)DALBase.load("xlyuding"," where id="+ id);
      request.setAttribute("xlyuding",temobjxlyuding);
    }
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
 <head>
  <title>线路预订信息查看</title>
    <link rel="stylesheet" href="<%=SystemParam.getSiteRoot()%>/e/css/index.css" type="text/css"></link>
<link rel="stylesheet" href="<%=SystemParam.getSiteRoot()%>/e/css/register.css" type="text/css"></link>
<link href="<%=SystemParam.getSiteRoot()%>/admin/css/web2table.css" rel="stylesheet" type="text/css" />
<script src="<%=SystemParam.getSiteRoot()%>/webui/jquery/jquery-1.8.3.min.js" type="text/javascript"></script>
</head>
<body >
	<jsp:include page="head.jsp"></jsp:include>
	<div class="wrap">
		<div class="cover-title">
			当前位置：<a href="<%=SystemParam.getSiteRoot()%>/e/index.jsp">首页</a>
			&gt;&gt; 线路预订管理
		</div>
	</div>
	<div class="wrap">
		<div class="main">
			<jsp:include page="menu.jsp"></jsp:include>
			<div class="main-content">
				<!-----开始---->
				<table cellpadding="0" cellspacing="1" class="grid" width="100%">
					
					
				   <tr>
                      <td colspan='2'>
                         ${errormsg}
                      </td>
                      
                   </tr>
					<tr>
						<td width="10%" align="right">线路编号:</td>
						<td>${requestScope.xlyuding.xlid}</td>
					</tr>
					<tr>
						<td width="10%" align="right">线路标题:</td>
						<td>${requestScope.xlyuding.xltitle}</td>
					</tr>
					<tr>
						<td align="right">预订日期:</td>
						<td>${requestScope.xlyuding.yddate}</td>
					</tr>
					<tr>
						<td width="10%" align="right">人数:</td>
						<td>${requestScope.xlyuding.renshu}</td>
					</tr>
					<tr>
						<td width="10%" align="right">会员名:</td>
						<td>${requestScope.xlyuding.hyname}</td>
					</tr>
					<tr>
						<td width="10%" align="right">联系人:</td>
						<td>${requestScope.xlyuding.lianxiren}</td>
					</tr>
					<tr>
						<td width="10%" align="right">联系电话:</td>
						<td>${requestScope.xlyuding.mobile}</td>
					</tr>
					<tr>
						<td width="10%" align="right">金额:</td>
						<td>${requestScope.xlyuding.jine}</td>
					</tr>
					<tr>
						<td width="10%" align="right">房间数:</td>
						<td>${requestScope.xlyuding.fangjiashu}</td>
					</tr>
					<tr>
						<td width="10%" align="right">状态:</td>
						<td>${requestScope.xlyuding.status}</td>
					</tr>
					<tr>
					    <td colspan="2">
					    
					    <form name="payform" method="post" action="<%=SystemParam.getSiteRoot()%>/admin/xlyudingmanager.do">
						 
						      <input type="hidden" name="actiontype" value="payfor"/>
						      
						      <input type="hidden" name="accountname" value="${huiyuan.accountname}"/>
						      <input type="hidden" name="errorurl" value="/e/huiyuan/fukuan.jsp?id=${xlyuding.id}"/>
						      <input type="hidden" name="forwardurl" value="/e/huiyuan/fukuanresult.jsp"/>
						      <input type="hidden" name="xlydid" value="<%=id%>"/>
						      <span class="ui-button">
						          <input type="submit" class="ui-button-text" value="确定付款"/>
						       </span>
						 
						 </form>
					    
					    </td>
					</tr>
				</table>
				<!-----结束---->
			</div>
		</div>
	</div>
</body>
</html>
