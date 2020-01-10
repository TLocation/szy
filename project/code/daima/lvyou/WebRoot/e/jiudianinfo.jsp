<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page import="com.daowen.entity.*" %>
<%@page import="java.util.*"%>
<%@ page import="com.daowen.uibuilder.*,com.daowen.bll.*"%>
<%@ page import="com.daowen.entity.*,com.daowen.dal.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>酒店</title>
	<link rel="stylesheet"
		href="<%=SystemParam.getSiteRoot()%>/e/css/index.css" type="text/css"></link>
	<link rel="stylesheet"
		href="<%=SystemParam.getSiteRoot()%>/e/css/box.css" type="text/css"></link>
	<script
		src="<%=SystemParam.getSiteRoot()%>/webui/jquery/jquery-1.8.3.min.js"
		type="text/javascript"></script>
	 <link href="<%=SystemParam.getSiteRoot() %>/admin/css/web2table.css" rel="stylesheet" type="text/css" />
	
	<%
		String id = request.getParameter("id");
		if (id != null) {
			Jiudian jiudian = (Jiudian) DALBase.load("jiudian", "where id="
					+ id);
			if (jiudian != null){
			    
				List<Kefang> listkefang = DALBase.getEntity("kefang", "where jdid="+id);
				if(listkefang!=null)
					request.setAttribute("listkefang", listkefang);
				request.setAttribute("jiudian", jiudian);
			}
		}
	%>

</head>
<body>
	<jsp:include page="head.jsp"></jsp:include>
	<div class="wrap">
		<div class="cover-title">
			当前位置：<a href="<%=SystemParam.getSiteRoot()%>/e/index.jsp">首页</a>
			&gt;&gt; <a href="<%=SystemParam.getSiteRoot()%>/e/jiudianlist.jsp">酒店</a>
		</div>
	</div>
	<div class="fn-clear"></div>
	<div class="row-flow">
		<div class="wrap">
			<table cellpadding="0" cellspacing="1" class="grid" width="100%">
				<tr>
					
					<td colspan='4'><div class="info"><h1>${requestScope.jiudian.title}</h1></div></td>
				</tr>
				<tr>
					<td align="right">连锁品牌:</td>
					<td>${requestScope.jiudian.brand}</td>
					<td colspan="2" rowspan="4"><img id="imgTupian" width="200px" height="200px"
						src="${requestScope.jiudian.tupian}" /></td>
				</tr>
				<tr>
					<td align="right">酒店级别:</td>
					<td>${requestScope.jiudian.jibie}</td>
				</tr>
				
				<tr>
					<td align="right">所在城市:</td>
					<td>${requestScope.jiudian.city}</td>
				</tr>
				<tr>
					<td width="10%" align="right">酒店地址:</td>
					<td>${requestScope.jiudian.address}</td>
				</tr>
				<tr>
					<td align="right">介绍:</td>
					<td colspan="3">${requestScope.jiudian.des}</td>
				</tr>
			</table>
			<table id="kefang" width="100%" border="0" cellspacing="0"
		cellpadding="0" class="ui-record-table">
		<thead>
			<tr>
				
				<th><b>客房名称</b></th>
				<th><b>价格(元/天)</b></th>
				
				<th>操作</th>
			</tr>
		</thead>
		<tbody>
			<c:if test="${listkefang== null || fn:length(listkefang) == 0}">
				<tr>
					<td colspan="20">没有相关客房信息</td>
				</tr>
			</c:if>
			<%	
								       
									if(request.getAttribute("listkefang")!=null)
								      {
									  List<Kefang> listkefang=( List<Kefang>)request.getAttribute("listkefang");
								     for(Kefang  temkefang  :  listkefang)
								      {
							%>
			<tr>
				
				<td><%=temkefang.getName()%></td>
				<td><%=temkefang.getPrice()%>￥</td>
				
				<td><a class="orange-href"
					href="<%=SystemParam.getSiteRoot() %>/e/jdyuding.jsp?kefid=<%=temkefang.getId() %>&jdid=<%=id%>">在线预订</a>
					
				</td>
			</tr>
			<%}}%>
		</tbody>
	</table>
		</div>
	</div>
	<div class="fn-clear"></div><!--
	使用jsp:include动作标志包含文件时，当标志被执行时，程序将会请求转发到被包含的页面，并将执行结果输出到浏览器中，然后返回包含页继续执行后面的代码。
	--><jsp:include page="bottom.jsp"></jsp:include>
</body>
</html>
