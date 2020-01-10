<%@page import="com.daowen.bll.*"%>
<%@page import="com.daowen.entity.*,com.daowen.dal.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>线路预订</title>
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
                                             旅游线路预订 </h1>
            <div class="reg-box">
                <div class="reg-title">
                  <!-- 
                    <ul>
                        <li ><em>1</em>请填写注册信息 </li>
                        <li><em class="current-step">2</em>验证审核</li>
                        <li><em>3</em>注册成功</li>
                    </ul>
                   -->
                </div>
                <div class="msg-tip">
                    <div class="ico warning">
                    </div>
                    <div class="text">
                        <strong>旅游线路预订成功！</strong>
                        
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