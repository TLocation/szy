<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.daowen.uibuilder.*,com.daowen.bll.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>酒店</title>
<link rel="stylesheet" href="<%=SystemParam.getSiteRoot() %>/e/css/index.css" type="text/css"></link>
<link rel="stylesheet" href="<%=SystemParam.getSiteRoot() %>/e/css/box.css" type="text/css"></link>
<script src="<%=SystemParam.getSiteRoot() %>/webui/jquery/jquery-1.8.3.min.js" type="text/javascript"></script>
</head>
<body>
	<jsp:include page="head.jsp"></jsp:include>
	
	<div class="fn-clear"></div>
	<div class="row-flow">
		<div class="wrap">
			<div style="width:810px;" class="column">
				<%
				    JiudianUibuilder jiudianuibuilder=new JiudianUibuilder("box");
			    %>
				<!-- 酒店 -->
				<%=jiudianuibuilder.buildImageLanmu("", -1, "酒店") %>
			</div>
			<div style="width: 310px;" class="column">
				<jsp:include page="sidepage.jsp"></jsp:include>
			</div>
		</div>
	</div>
	<div class="fn-clear"></div>
	<jsp:include page="bottom.jsp"></jsp:include>
 </body>
</html>
