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
      Jiudian temobjjiudian=(Jiudian)DALBase.load("jiudian"," where id="+ id);
      request.setAttribute("jiudian",temobjjiudian);
    }
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
 <head>
  <title>酒店信息查看</title>
    <script type="text/javascript" src="<%=SystemParam.getSiteRoot() %>/webui/jquery/jquery-1.8.3.min.js"></script>
     <link href="<%=SystemParam.getSiteRoot() %>/admin/css/web2table.css" rel="stylesheet" type="text/css" />
</head>
<body >
	 	 <div class="search-title">
<h2>
	                      查看酒店
	                </h2>
	                <div class="description">
	                </div>
              </div>
				        <table cellpadding="0" cellspacing="1" class="grid" width="100%" >
											   <tr>
											   <td width="10%" align="right" >酒店名称:</td>
											   <td>
												   ${requestScope.jiudian.title}
												</td>
											   </tr>
											   <tr>
											    <td align="right" >连锁品牌:</td>
											   <td>
												   ${requestScope.jiudian.brand}
												</td>
											   </tr>
											   <tr>
											    <td align="right" >酒店级别:</td>
											   <td>
												   ${requestScope.jiudian.jibie}
												</td>
											   </tr>
											   <tr>
											    <td align="right">快照:</td>
											   <td>
												   <img id="imgTupian" width="200px" height="200px" src="${requestScope.jiudian.tupian}"/>
												</td>
											   </tr>
											   <tr>
											    <td align="right" >所在城市:</td>
											   <td>
												   ${requestScope.jiudian.city}
												</td>
											   </tr>
											   <tr>
											   <td width="10%" align="right" >酒店地址:</td>
											   <td>
												   ${requestScope.jiudian.address}
												</td>
											   </tr>
											 <tr>
											   <td align="right">介绍:</td>
											   <td colspan="3">
												${requestScope.jiudian.des}
											   </td>
											 </tr>
				        </table>
</body>
</html>
