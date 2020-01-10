<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="com.daowen.bll.*,com.daowen.util.PagerMetal"%>
<%@ page import="com.daowen.entity.*" %>
<%@page import="com.daowen.dal.DALBase"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ include file="law.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="daowen" uri="/daowenpager"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
	<head>
		<title>线路预订信息</title>
  <link rel="stylesheet" href="<%=SystemParam.getSiteRoot()%>/e/css/index.css" type="text/css"></link>
<link rel="stylesheet" href="<%=SystemParam.getSiteRoot()%>/e/css/register.css" type="text/css"></link>
<link href="<%=SystemParam.getSiteRoot()%>/admin/css/web2table.css"
	rel="stylesheet" type="text/css" />
<script src="<%=SystemParam.getSiteRoot()%>/webui/jquery/jquery-1.9.0.js"
	type="text/javascript"></script>
 <link href="<%=SystemParam.getSiteRoot() %>/webui/artDialog/skins/default.css" rel="stylesheet" type="text/css" />
    <script src="<%=SystemParam.getSiteRoot() %>/webui/artDialog/jquery.artDialog.source.js" type="text/javascript"></script>
    <script src="<%=SystemParam.getSiteRoot() %>/webui/artDialog/iframeTools.source.js" type="text/javascript"></script>
    <link href="<%=SystemParam.getSiteRoot() %>/webui/treetable/skin/jquery.treetable.css" rel="stylesheet" type="text/css" />
    <link href="<%=SystemParam.getSiteRoot() %>/webui/treetable/skin/jquery.treetable.theme.default.css" rel="stylesheet"
        type="text/css" />
    <script src="<%=SystemParam.getSiteRoot() %>/webui/treetable/js/jquery.treetable.js" type="text/javascript"></script>
    <link href="<%=SystemParam.getSiteRoot() %>/uploadifyv3.1/uploadify.css" rel="stylesheet" type="text/css" />
    <script src="<%=SystemParam.getSiteRoot() %>/uploadifyv3.1/jquery.uploadify-3.1.js" type="text/javascript"></script>
    <script type="text/javascript"  src="<%=SystemParam.getSiteRoot() %>/webui/jquery-form/jquery.form.js"></script>
    <script type="text/javascript" src="<%=SystemParam.getSiteRoot() %>/editor/kindeditor-min.js"></script>
    <script type="text/javascript" src="<%=SystemParam.getSiteRoot() %>/editor/lang/zh_CN.js"></script>
    <link rel="stylesheet" href="<%=SystemParam.getSiteRoot() %>/webui/jqueryui/themes/base/jquery.ui.all.css" type="text/css"></link>
    <script type="text/javascript" src="<%=SystemParam.getSiteRoot() %>/webui/jqueryui/ui/jquery-ui.js"></script>
    <script type="text/javascript" src="<%=SystemParam.getSiteRoot() %>/webui/jqueryui/ui/i18n/jquery.ui.datepicker-zh-CN.js"></script>
		<script type="text/javascript">
			$(function() {
			    $("#btnDelete").click(function(){
			        if($(".check:checked").length<1)
			        {
			           $.dialog.alert("请选择需要删除的记录");
			           return;
			        } 
			        $(".check:checked").each(function(index,domEle){
			             var id=$(domEle).val();
			             $.dialog.confirm("你确定要注销线路预订信息?", function(){
				             window.location.href=encodeURI('<%=SystemParam.getSiteRoot()%>/admin/xlyudingmanager.do?forwardurl=/e/huiyuan/xlyudingmanager.jsp&actiontype=delete&id='+id);
				          });
			        });
			    });
			    $("#btnCheckAll").click(function(){
			           var ischeck=false;
			           $(".check").each(function(){
			               if($(this).is(":checked"))
			               {
			                  $(this).prop("checked","");
			                  ischeck=false;
			                }
			               else
			               {
			                  $(this).prop("checked","true");
			                  ischeck=true;
			                }
			           });
			           if($(this).text()=="选择记录")
			              $(this).text("取消选择");
			           else
			              $(this).text("选择记录");
			    })
			});
       </script>
	</head>
	 <body >
	<jsp:include page="head.jsp"></jsp:include>
	<div class="wrap">
		<div class="cover-title">
			当前位置：<a href="<%=SystemParam.getSiteRoot()%>/e/index.jsp">首页</a> &gt;&gt; 线路预订管理
		</div>
	</div>
	<div class="wrap">
		<div class="main">
			<jsp:include page="menu.jsp"></jsp:include>
			<div class="main-content">
				<!-- 搜索控件开始 -->
				<div class="search-options">
					<form id="searchForm"
						action="<%=SystemParam.getSiteRoot() %>/admin/xlyudingmanager.do"
						method="post">
						<table cellspacing="0" width="100%">
							<tbody>
								<tr>
									<td>状态： <input name=status 
										class="input-txt" type="text" id="xlid" /> <input
										type="hidden" name="actiontype" value="search" /> <input
										type="hidden" name="seedid" value="${seedid}" /> <input
										type="hidden" name="forwardurl"
										value="/e/huiyuan/xlyudingmanager.jsp" />
										<div class="ui-button">
											<input type="submit" value="搜索" id="btnSearch"
												class="ui-button-text" />
										</div></td>
								</tr>
							</tbody>
						</table>
					</form>
				</div>
				<!-- 搜索控件结束 -->
				<div class="clear"></div>
				<div class="action-details">
					<a href="#" id="btnCheckAll" class="action-button"><img
						src="<%=SystemParam.getSiteRoot() %>/admin/images/submit.gif">选择</a> <a
						id="btnDelete" class="action-btn" href="#"> <em
						class="icon-delete"></em> <b>删除</b> </a>
				</div>
				<table id="xlyuding" width="100%" border="0" cellspacing="0"
					cellpadding="0" class="ui-record-table">
					<thead>
						<tr>
							<th>选择</th>
							
							<th width="220px;"><b>线路标题</b>
							</th>
							<th><b>预订日期</b>
							</th>
							<th><b>人数</b>
							</th>
							<th><b>会员名</b>
							</th>
							<th><b>联系人</b>
							</th>
							<th><b>联系电话</b>
							</th>
							<th><b>金额</b>
							</th>
							<th><b>房间数</b>
							</th>
							<th><b>状态</b>
							</th>
							<th>操作</th>
						</tr>
					</thead>
					<tbody>
						<c:if
							test="${listxlyuding== null || fn:length(listxlyuding) == 0}">
							<tr>
								<td colspan="20">没有相关线路预订信息</td>
							</tr>
						</c:if>
						<%	
						           SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
									if(request.getAttribute("listxlyuding")!=null)
								      {
									  List<Xlyuding> listxlyuding=( List<Xlyuding>)request.getAttribute("listxlyuding");
								     for(Xlyuding  temxlyuding  :  listxlyuding)
								      {
							%>
						<tr>
							<td>&nbsp<input id="chk<%=temxlyuding.getId()%>"
								class="check" name="chk<%=temxlyuding.getId()%>" type="checkbox"
								value='<%=temxlyuding.getId()%>'>
							</td>
							
							<td><%=temxlyuding.getXltitle()%></td>
							<td><%=sdf.format(temxlyuding.getYddate())%></td>
							<td><%=temxlyuding.getRenshu()%></td>
							<td><%=temxlyuding.getHyname()%></td>
							<td><%=temxlyuding.getLianxiren()%></td>
							<td><%=temxlyuding.getMobile()%></td>
							<td><%=temxlyuding.getJine()%></td>
							<td><%=temxlyuding.getFangjiashu()%></td>
							<td><%=temxlyuding.getStatus()%></td>
							<td>
							
							   <%
								    if(temxlyuding.getStatus().equals("等待付款")){
								  %>
								  
								   
							   <a  href="<%=SystemParam.getSiteRoot() %>/e/huiyuan/fukuan.jsp?id=<%=temxlyuding.getId()%>&seedid=101">付款</a>
								 <%} %>
								 
								  <a  href="<%=SystemParam.getSiteRoot() %>/e/huiyuan/xlyudingdetails.jsp?id=<%=temxlyuding.getId()%>&seedid=101">查看</a>
						    </td>
						</tr>
						<%}}%>
					</tbody>
				</table>
				<div class="clear"></div>
				<daowen:pager id="pager1" attcheform="searchForm" />
			</div>
		</div>
	</div>
</body>
</html>
