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
      Xianlu temobjxianlu=(Xianlu)DALBase.load("xianlu"," where id="+ id);
      request.setAttribute("xianlu",temobjxianlu);
    }
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
 <head>
  <title>线路信息查看</title>
    <script type="text/javascript" src="<%=SystemParam.getSiteRoot() %>/webui/jquery/jquery-1.8.3.min.js"></script>
     <link href="<%=SystemParam.getSiteRoot() %>/admin/css/web2table.css" rel="stylesheet" type="text/css" />
</head>
<body >
	 	 <div class="search-title">
<h2>
	                      查看 线路
	                </h2>
	                <div class="description">
	                </div>
              </div>
				        <table cellpadding="0" cellspacing="1" class="grid" width="100%" >
											   <tr>
											   <td width="10%" align="right" >出发城市:</td>
											   <td>
												   ${requestScope.xianlu.chufadi}
												</td>
											   </tr>
											   <tr>
											   <td width="10%" align="right" >目的地:</td>
											   <td>
												   ${requestScope.xianlu.mudidi}
												</td>
											   </tr>
											   <tr>
											   <td width="10%" align="right" >时间安排:</td>
											   <td>
												   ${requestScope.xianlu.shijiananpai}
												</td>
											   </tr>
											   <tr>
											   <td width="10%" align="right" >发团日期:</td>
											   <td>
												   ${requestScope.xianlu.fatuanriqi}
												</td>
											   </tr>
											   <tr>
											   <td width="10%" align="right" >交通信息:</td>
											   <td>
												   ${requestScope.xianlu.jiaotongxinxi}
												</td>
											   </tr>
											   <tr>
											   <td width="10%" align="right" >市场价:</td>
											   <td>
												   ${requestScope.xianlu.shichangjia}
												</td>
											   </tr>
											   <tr>
											   <td width="10%" align="right" >会员价:</td>
											   <td>
												   ${requestScope.xianlu.hyjia}
												</td>
											   </tr>
											   <tr>
											    <td align="right">图片:</td>
											   <td>
												   <img id="imgTupian" width="200px" height="200px" src="${requestScope.xianlu.tupian}"/>
												</td>
											   </tr>
											   <tr>
											   <td width="10%" align="right" >标题:</td>
											   <td>
												   ${requestScope.xianlu.title}
												</td>
											   </tr>
											 <tr>
											   <td align="right">线路说明:</td>
											   <td colspan="3">
												${requestScope.xianlu.des}
											   </td>
											 </tr>
				        </table>
</body>
</html>
