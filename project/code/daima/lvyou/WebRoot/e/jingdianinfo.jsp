<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.daowen.uibuilder.*,com.daowen.bll.*"%>
<%@ page import="com.daowen.entity.*,com.daowen.dal.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>景点</title>
	<link rel="stylesheet"
		href="<%=SystemParam.getSiteRoot()%>/e/css/index.css" type="text/css"></link>
	<link rel="stylesheet"
		href="<%=SystemParam.getSiteRoot()%>/e/css/box.css" type="text/css"></link>
	<script
		src="<%=SystemParam.getSiteRoot()%>/webui/jquery/jquery-1.8.3.min.js"
		type="text/javascript"></script>
	
<link rel="stylesheet" href="<%=SystemParam.getSiteRoot()%>/e/css/leaveword.css" type="text/css"></link>
	
	<%
		String id = request.getParameter("id");
		if (id != null) {
			Jingdian jingdian = (Jingdian) DALBase.load("jingdian",
					"where id=" + id);
			if (jingdian != null)
				request.setAttribute("jingdian", jingdian);
		}
	%>

</head>
<body>
	<jsp:include page="head.jsp"></jsp:include>
	
	<div class="fn-clear"></div>
	<div class="row-flow">
		<div class="wrap">
			<table cellpadding="0" cellspacing="1" class="grid" width="100%">
				<tr>
					
					<td>
					     <div class="info">
					          <h1>
					              ${requestScope.jingdian.title}
					              
					          </h1>
					          <h5>旅游城市:${requestScope.jingdian.city}
					               
					          </h5>
					          <!--免费的天气预报控件iframe内嵌网页框架scrolling="no"隐藏滚动条-->
					          <iframe name="weather_inc" src="http://i.tianqi.com/index.php?c=code&id=2&num=3" width="440" height="70" frameborder="0" 
					          marginwidth="0" marginheight="0" scrolling="no"></iframe>
					          
					     </div>
					
					</td>
				</tr>
				
			
				<tr>
					
					<td colspan="4">${requestScope.jingdian.des}</td>
				</tr>
			</table>
			 <jsp:include page="comment.jsp?commenttype=jingdian"></jsp:include>
		</div>
	</div>
	<div class="fn-clear"></div>
	<jsp:include page="bottom.jsp"></jsp:include>
</body>
</html>
