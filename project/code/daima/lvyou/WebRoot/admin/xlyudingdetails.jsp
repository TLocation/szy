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
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
 <head>
  <title>线路预订信息查看</title>
    <script type="text/javascript" src="<%=SystemParam.getSiteRoot() %>/webui/jquery/jquery-1.8.3.min.js"></script>
     <link href="<%=SystemParam.getSiteRoot() %>/admin/css/web2table.css" rel="stylesheet" type="text/css" />
</head>
<body >
	 	 <div class="search-title">
<h2>
	                      查看 线路预订
	                </h2>
	                <div class="description">
	                </div>
              </div>
				        <table cellpadding="0" cellspacing="1" class="grid" width="100%" >
											   <tr>
											   <td width="10%" align="right" >线路编号:</td>
											   <td>
												   ${requestScope.xlyuding.xlid}
												</td>
											   </tr>
											   <tr>
											   <td width="10%" align="right" >线路标题:</td>
											   <td>
												   ${requestScope.xlyuding.xltitle}
												</td>
											   </tr>
											   <tr>
											   <td align="right">预订日期:</td>
											   <td>
												   ${requestScope.xlyuding.yddate}
												</td>
											   </tr>
											   <tr>
											   <td width="10%" align="right" >人数:</td>
											   <td>
												   ${requestScope.xlyuding.renshu}
												</td>
											   </tr>
											   <tr>
											   <td width="10%" align="right" >会员名:</td>
											   <td>
												   ${requestScope.xlyuding.hyname}
												</td>
											   </tr>
											   <tr>
											   <td width="10%" align="right" >联系人:</td>
											   <td>
												   ${requestScope.xlyuding.lianxiren}
												</td>
											   </tr>
											   <tr>
											   <td width="10%" align="right" >联系电话:</td>
											   <td>
												   ${requestScope.xlyuding.mobile}
												</td>
											   </tr>
											   <tr>
											   <td width="10%" align="right" >金额:</td>
											   <td>
												   ${requestScope.xlyuding.jine}
												</td>
											   </tr>
											   <tr>
											   <td width="10%" align="right" >房间数:</td>
											   <td>
												   ${requestScope.xlyuding.fangjiashu}
												</td>
											   </tr>
											   <tr>
											   <td width="10%" align="right" >备注:</td>
											   <td>
												   ${requestScope.xlyuding.status}
												</td>
											   </tr>
				        </table>
</body>
</html>
