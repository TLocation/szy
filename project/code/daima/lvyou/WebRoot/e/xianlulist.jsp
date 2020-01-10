<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.daowen.uibuilder.*,com.daowen.bll.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>线路</title>
<link rel="stylesheet" href="<%=SystemParam.getSiteRoot() %>/e/css/index.css" type="text/css"></link>
<link rel="stylesheet" href="<%=SystemParam.getSiteRoot() %>/e/css/box.css" type="text/css"></link>
<script src="<%=SystemParam.getSiteRoot() %>/webui/jquery/jquery-1.8.3.min.js" type="text/javascript"></script>
</head>
<body>
	<jsp:include page="head.jsp"></jsp:include>
	
	<div class="fn-clear"></div>
	<div class="row-flow">
		<div class="wrap">
			<div style="width:820px;" class="column">
				<%
				    XianluUibuilder xianluuibuilder=new XianluUibuilder("box");
			    %>
				<!-- 线路 -->
				<%=xianluuibuilder.buildImageLanmu("", -1, "旅游线路") %>
			</div>
			<div style="width: 300px;" class="column">
				<jsp:include page="sidepage.jsp"></jsp:include>
			</div>
		</div>
	</div>
	<div class="fn-clear"></div>
	<jsp:include page="bottom.jsp"></jsp:include>
 </body>
</html>
