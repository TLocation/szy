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
    if( id!=null)
    {
      Jingdian temobjjingdian=(Jingdian)DALBase.load("jingdian"," where id="+ id);
      request.setAttribute("jingdian",temobjjingdian);
    }
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
 <head>
  <title>景点信息查看</title>
    <script type="text/javascript" src="<%=SystemParam.getSiteRoot() %>/webui/jquery/jquery-1.8.3.min.js"></script>
     <link href="<%=SystemParam.getSiteRoot() %>/admin/css/web2table.css" rel="stylesheet" type="text/css" />
</head>
<body >
	 	 <div class="search-title">
<h2>
	                      查看景点
	                </h2>
	                <div class="description">
	                </div>
              </div>
				        <table cellpadding="0" cellspacing="1" class="grid" width="100%" >
											   <tr>
											   <td width="10%" align="right" >名称:</td>
											   <td>
												   ${requestScope.jingdian.title}
												</td>
											   </tr>
											   <tr>
											    <td align="right">快照:</td>
											   <td>
												   <img id="imgTupian" width="200px" height="200px" src="${requestScope.jingdian.tupian}"/>
												</td>
											   </tr>
											   <tr>
											    <td align="right" >所属城市:</td>
											   <td>
												   ${requestScope.jingdian.city}
												</td>
											   </tr>
											 <tr>
											   <td align="right">景点介绍:</td>
											   <td colspan="3">
												${requestScope.jingdian.des}
											   </td>
											 </tr>
				        </table>
</body>
</html>
