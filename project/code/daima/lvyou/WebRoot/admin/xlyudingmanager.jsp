﻿<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
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
    <script src="<%=SystemParam.getSiteRoot() %>/webui/jquery/jquery-1.8.3.min.js" type="text/javascript"></script>
    <link href="<%=SystemParam.getSiteRoot() %>/webui/artDialog/skins/default.css" rel="stylesheet" type="text/css" />
    <script src="<%=SystemParam.getSiteRoot() %>/webui/artDialog/jquery.artDialog.source.js" type="text/javascript"></script>
    <script src="<%=SystemParam.getSiteRoot() %>/webui/artDialog/iframeTools.source.js" type="text/javascript"></script>
    <script src="<%=SystemParam.getSiteRoot()%>/webui/combo/combo.js" type="text/javascript"></script>
    <link href="<%=SystemParam.getSiteRoot() %>/webui/treetable/skin/jquery.treetable.css" rel="stylesheet" type="text/css" />
    <link href="<%=SystemParam.getSiteRoot() %>/webui/treetable/skin/jquery.treetable.theme.default.css" rel="stylesheet"
        type="text/css" />
    <script src="<%=SystemParam.getSiteRoot() %>/webui/treetable/js/jquery.treetable.js" type="text/javascript"></script>
     <link href="<%=SystemParam.getSiteRoot() %>/admin/css/web2table.css" rel="stylesheet" type="text/css" />
		<script type="text/javascript">
			$(function() {
			    $("#btnDelete").click(function(){
			        if($(".check:checked").length<1)
			        {
			           top.$.dialog.alert("请选择需要删除的记录");
			           return;
			        } 
			        $(".check:checked").each(function(index,domEle){
			             var id=$(domEle).val();
			             top.$.dialog.confirm("你确定要注销线路预订信息?", function(){
				             window.location.href=encodeURI('<%=SystemParam.getSiteRoot()%>/admin/xlyudingmanager.do?forwardurl=/admin/xlyudingmanager.jsp&actiontype=delete&id='+id);
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
	<div class="search-title">
		<h2>线路预订管理</h2>
		<div class="description">
			
		</div>
	</div>
	<!-- 搜索控件开始 -->
	<div class="search-options">
		<form id="searchForm"
			action="<%=SystemParam.getSiteRoot() %>/admin/xlyudingmanager.do"
			method="post">
			<table cellspacing="0" width="100%">
				<tbody>
					<tr>
						<td>状态： <input name=status
						class="input-txt" type="text" id="xlid" />
										 <input type="hidden" name="actiontype"
							value="search" /> <input type="hidden" name="seedid"
							value="${seedid}" /> <input type="hidden" name="forwardurl"
							value="/admin/xlyudingmanager.jsp" />
							<div class="ui-button">
								<button class="ui-button-text">搜索</button>
							</div></td>
					</tr>
				</tbody>
			</table>
		</form>
	</div>
	<!-- 搜索控件结束 -->
	<div class="clear"></div>
	<div class="action-details">
		<a href="#" class="btn btn-success" id="btnCheckAll"
			class="action-button">选择</a> <a id="btnDelete" class="btn btn-danger"
			href="#"> <i class="icon-trash icon-white"></i> <b>删除线路预订</b> </a>
	</div>
	<table id="xlyuding" width="100%" border="0" cellspacing="0"
		cellpadding="0" class="ui-record-table">
		<thead>
			<tr>
				<th>选择</th>
				<th><b>线路编号</b>
				</th>
				<th><b>线路标题</b>
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
			<c:if test="${listxlyuding== null || fn:length(listxlyuding) == 0}">
				<tr>
					<td colspan="20">没有相关线路预订信息</td>
				</tr>
			</c:if>
			<%	
									if(request.getAttribute("listxlyuding")!=null)
								      {
									  List<Xlyuding> listxlyuding=( List<Xlyuding>)request.getAttribute("listxlyuding");
								     for(Xlyuding  temxlyuding  :  listxlyuding)
								      {
							%>
			<tr>
				<td>&nbsp<input id="chk<%=temxlyuding.getId()%>" class="check"
					name="chk<%=temxlyuding.getId()%>" type="checkbox"
					value='<%=temxlyuding.getId()%>'>
				</td>
				<td><%=temxlyuding.getXlid()%></td>
				<td><%=temxlyuding.getXltitle()%></td>
				<td><%=temxlyuding.getYddate()%></td>
				<td><%=temxlyuding.getRenshu()%></td>
				<td><%=temxlyuding.getHyname()%></td>
				<td><%=temxlyuding.getLianxiren()%></td>
				<td><%=temxlyuding.getMobile()%></td>
				<td><%=temxlyuding.getJine()%></td>
				<td><%=temxlyuding.getFangjiashu()%></td>
				<td><%=temxlyuding.getStatus()%></td>
				<td>
				
				  <a class="btn btn-success"
					href="<%=SystemParam.getSiteRoot() %>/admin/xlyudingdetails.jsp?id=<%=temxlyuding.getId()%>"><i
						class="icon-zoom-in icon-white"></i>查看</a></td>
			</tr>
			<%}}%>
		</tbody>
	</table>
	<div class="clear"></div>
	<daowen:pager id="pager1" attcheform="searchForm" />
</body>
</html>