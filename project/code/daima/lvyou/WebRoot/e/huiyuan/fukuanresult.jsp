<%@page import="com.daowen.bll.*"%>
<%@page import="com.daowen.entity.*,com.daowen.dal.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>付款结果 </title>
<link rel="stylesheet" href="<%=SystemParam.getSiteRoot()%>/e/css/index.css" type="text/css"></link>

<link rel="stylesheet" href="<%=SystemParam.getSiteRoot()%>/e/css/register.css" type="text/css"></link>

<script
	src="<%=SystemParam.getSiteRoot()%>/webui/jquery/jquery-1.5.2.min.js"
	type="text/javascript"></script>





</head>
<body>

	<jsp:include page="head.jsp"></jsp:include>

	<div class="wrap">
		<div class="cover-title">
			当前位置：<a href="index.jsp">首页</a> &gt;&gt; <a href="register.jsp">系统注册结果</a>
		</div>
	</div>


	<div class="fn-clear"></div>

	<div class="wrap">
		
        <div class="whitebox">
            <h1>
                                             旅游线路付款结果  </h1>
            <div class="reg-box">
                <div class="reg-title">
                    
                </div>
                <div class="msg-tip">
                    <div class="ico warning">
                    </div>
                    <div class="text">
                        <strong>报团付款成功！</strong>
                        <a href="<%=SystemParam.getSiteRoot() %>/admin/xlyudingmanager.do?actiontype=get&seedid=101&forwardurl=/e/huiyuan/xlyudingmanager.jsp">查看订单</a>
                    </div>
                </div>
                <div class="clear">
                </div>
            </div>
        </div>
	</div>

	<div class="fn-clear"></div>


	<jsp:include page="bottom.jsp"></jsp:include>



</body>
</html>