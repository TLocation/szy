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
      Kefang temobjkefang=(Kefang)DALBase.load("kefang"," where id="+ id);
      request.setAttribute("kefang",temobjkefang);
    }
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
 <head>
  <title>客房信息查看</title>
    <script type="text/javascript" src="<%=SystemParam.getSiteRoot() %>/webui/jquery/jquery-1.8.3.min.js"></script>
     <link href="<%=SystemParam.getSiteRoot() %>/admin/css/web2table.css" rel="stylesheet" type="text/css" />
</head>
<body >
	 	 <div class="search-title">
<h2>
	                      查看客房
	                </h2>
	                <div class="description">
	                </div>
              </div>
				        <table cellpadding="0" cellspacing="1" class="grid" width="100%" >
											   <tr>
											   <td width="10%" align="right" >客房名称:</td>
											   <td>
												   ${requestScope.kefang.name}
												</td>
											   </tr>
											   <tr>
											   <td width="10%" align="right" >价格:</td>
											   <td>
												   ${requestScope.kefang.price}
												</td>
											   </tr>
											   <tr>
											   <td width="10%" align="right" >酒店编号:</td>
											   <td>
												   ${requestScope.kefang.jdid}
												</td>
											   </tr>
				        </table>
</body>
</html>
