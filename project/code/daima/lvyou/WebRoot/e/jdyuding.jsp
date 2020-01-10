<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page import="com.daowen.entity.*" %>
<%@page import="java.util.*"%>
<%@ include file="huiyuan/law.jsp"%>
<%@ page import="com.daowen.uibuilder.*,com.daowen.bll.*"%>
<%@ page import="com.daowen.entity.*,com.daowen.dal.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<%
		String jdid = request.getParameter("jdid");
	    String kfid=request.getParameter("kfid");
		if (jdid != null) {
			Jiudian jiudian = (Jiudian) DALBase.load("jiudian", "where id="
					+ jdid);
			if (jiudian != null){
			    
				Kefang kefang = (Kefang)DALBase.load("kefang", "where id="+jdid);
				if(kefang!=null)
					request.setAttribute("kefang", kefang);
				request.setAttribute("jiudian", jiudian);
			}
		}
	%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>酒店</title>
	<link rel="stylesheet"
		href="<%=SystemParam.getSiteRoot()%>/e/css/index.css" type="text/css"></link>
	<link rel="stylesheet"
		href="<%=SystemParam.getSiteRoot()%>/e/css/box.css" type="text/css"></link>
	<script
		src="<%=SystemParam.getSiteRoot()%>/webui/jquery/jquery-1.8.3.min.js"
		type="text/javascript"></script>
	    <script  type="text/javascript" src="<%=SystemParam.getSiteRoot() %>/webui/jquery/jquery.validate.min.js"></script>
    <script type="text/javascript"  src="<%=SystemParam.getSiteRoot() %>/webui/jquery/jquery.validateex.js" ></script>
    <script type="text/javascript"  src="<%=SystemParam.getSiteRoot() %>/webui/jquery/jquery.metadata.js" ></script>
    <script type="text/javascript"  src="<%=SystemParam.getSiteRoot() %>/webui/jquery/messages_cn.js" ></script>
	  <link rel="stylesheet" href="<%=SystemParam.getSiteRoot() %>/webui/jqueryui/themes/base/jquery.ui.all.css" type="text/css"></link>
    <script type="text/javascript" src="<%=SystemParam.getSiteRoot() %>/webui/jqueryui/ui/jquery-ui.js"></script>
    <script type="text/javascript" src="<%=SystemParam.getSiteRoot() %>/webui/jqueryui/ui/i18n/jquery.ui.datepicker-zh-CN.js"></script>
    <script src="<%=SystemParam.getSiteRoot() %>/webui/jqueryui/ui/jquery-ui-timepicker-addon.js" type="text/javascript"></script>
	 <link href="<%=SystemParam.getSiteRoot() %>/admin/css/web2table.css" rel="stylesheet" type="text/css" />
	<script type="text/javascript">
        function initControl(){
	                 $("#txtBegindate").datepicker({
                         dateFormat:'yy-mm-dd'
                      }).datepicker("setDate",new Date());
                      $("#txtEnddate").datepicker({
                         dateFormat:'yy-mm-dd'
                      }).datepicker("setDate",new Date());
        }
        $(function ()
        {
            initControl();
            $.metadata.setType("attr","validate");
            $("#jdyudingForm").validate();
        });  
    </script>
	

</head>
<body>
	<jsp:include page="head.jsp"></jsp:include>
	<div class="wrap">
		<div class="cover-title">
			当前位置：<a href="<%=SystemParam.getSiteRoot()%>/e/index.jsp">首页</a>
			&gt;&gt; <a href="<%=SystemParam.getSiteRoot()%>/e/jiudianlist.jsp">酒店</a>
		</div>
	</div>
	<div class="fn-clear"></div>
	<div class="row-flow">
		<div class="wrap">
			<table cellpadding="0" cellspacing="1" class="grid" width="100%">
				<tr>
					
					<td colspan='4'><div class="info"><h1>${requestScope.jiudian.title}</h1></div></td>
				</tr>
				<tr>
					<td align="right">连锁品牌:</td>
					<td>${requestScope.jiudian.brand}</td>
					<td colspan="2" rowspan="4"><img id="imgTupian" width="200px" height="200px"
						src="${requestScope.jiudian.tupian}" /></td>
				</tr>
				<tr>
					<td align="right">酒店级别:</td>
					<td>${requestScope.jiudian.jibie}</td>
				</tr>
				
				<tr>
					<td align="right">所在城市:</td>
					<td>${requestScope.jiudian.city}</td>
				</tr>
				<tr>
					<td width="10%" align="right">酒店地址:</td>
					<td>${requestScope.jiudian.address}</td>
				</tr>
				<tr>
					<td align="right">介绍:</td>
					<td colspan="3">${requestScope.jiudian.des}</td>
				</tr>
			</table>

			<form name="jdyudingform" method="post"
				action="<%=SystemParam.getSiteRoot()%>/admin/jdyudingmanager.do"
				id="jdyudingForm">
				<table class="grid" cellspacing="1" width="100%">
					<input type="hidden" name="id" value="${id}" />
					<input type="hidden" name="actiontype" value="save" />
					<input type="hidden" name="jdtitle" value="${jiudian.title}" />
					<input type="hidden" name="kfname" value="${kefang.name }" />
					<input type="hidden" name="price" value="${kefang.price }" />
					<input type="hidden" name="errorurl" value="/admin/jdyudingadd.jsp" />
					<input type="hidden" name="forwardurl"
						value="/admin/jdyudingmanager.do?actiontype=get&forwardurl=/e/huiyuan/jdyudingmanager.jsp" />
					<tr>
						<td colspan="4">${errormsg}</td>
					</tr>
					<tr>
						<td align="right">酒店名:</td>
						<td>
						    ${jiudian.title}
						</td>
					</tr>
					<tr>
						<td align="right">客房名:</td>
						<td>
						   ${kefang.name }
						</td>
					</tr>
					<tr>
						<td align="right">开始日期:</td>
						<td><input name="begindate"
							value="${requestScope.jdyuding.begindate}" type="text"
							id="txtBegindate" class="input-txt" validate="{required:true}" />
						</td>
					</tr>
					<tr>
						<td align="right">结束日期:</td>
						<td><input name="enddate"
							value="${requestScope.jdyuding.enddate}" type="text"
							id="txtEnddate" class="input-txt" validate="{required:true}" />
						</td>
					</tr>
					
					<tr>
						<td align="right">入住人:</td>
						<td><input name="ruzhuren" placeholder="入住人"
							validate="{required:true,messages:{required:'请输入入住人'}}"
							value="${requestScope.jdyuding.ruzhuren}" class="input-txt"
							type="text" id="txtRuzhuren" /></td>
					</tr>
					<tr>
						<td align="right">房间数:</td>
						<td><input name="shuliang" placeholder="房间数"
							validate="{required:true,digits:true,messages:{required:'请输入房间数',digits:'请输入正确的房间数'}}"
							value="${requestScope.jdyuding.shuliang}" class="input-txt"
							type="text" id="txtShuliang" /></td>
					</tr>
					<tr>
						<td align="right">联系电话:</td>
						<td><input name="mobile" placeholder="联系电话"
							validate="{required:true,messages:{required:'请输入联系电话'}}"
							value="${requestScope.jdyuding.mobile}" class="input-txt"
							type="text" id="txtMobile" /></td>
					</tr>
				
					<tr>
						<td align="right">预订人:</td>
						<td>${huiyuan.accountname}
						    <input name="ydren" placeholder="预订人"
							validate="{required:true,messages:{required:'请输入预订人'}}"
							value="${huiyuan.accountname}" class="input-txt"
							type="hidden" id="txtYdren" />
						</td>
					</tr>
					<tr>
						<td colspan="4">
							
								<button class="orange-button">
									在线预订
								</button>
							
						</td>
					</tr>
				</table>
			</form>

		</div>
	</div>
	<div class="fn-clear"></div>
	<jsp:include page="bottom.jsp"></jsp:include>
</body>
</html>
