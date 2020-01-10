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
		<title>酒店预订信息</title>
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
			             top.$.dialog.confirm("你确定要注销酒店预订信息?", function(){
				             window.location.href=encodeURI('<%=SystemParam.getSiteRoot()%>/admin/jdyudingmanager.do?forwardurl=/admin/jdyudingmanager.jsp&actiontype=delete&id='+id);
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
		<h2>酒店预订管理</h2>
		<div class="description">
			
		</div>
	</div>
	<!-- 搜索控件开始 -->
	<div class="search-options">
		<form id="searchForm"
			action="<%=SystemParam.getSiteRoot() %>/admin/jdyudingmanager.do"
			method="post">
			<table cellspacing="0" width="100%">
				<tbody>
					<tr>
						<td>酒店名 <input name="jdtitle" value="${jdtitle}"
							class="input-txt" type="text" id="jdtitle" /> <input
							type="hidden" name="actiontype" value="search" /> <input
							type="hidden" name="seedid" value="${seedid}" /> <input
							type="hidden" name="forwardurl"
							value="/admin/jdyudingmanager.jsp" />
							<div class="ui-button">
										<input type="submit" value="搜索" id="btnSearch"
											class="ui-button-text" />
									</div>
						</td>
					</tr>
				</tbody>
			</table>
		</form>
	</div>
	<!-- 搜索控件结束 -->
	<div class="clear"></div>
	<div class="action-details">
		<a href="#" class="btn btn-success" id="btnCheckAll"
			class="action-button">选择</a> <a id="btnDelete" class="action-btn"
			href="#"> <em class="icon-delete"></em> <b>删除</b>
		</a>
	</div>
	<table id="jdyuding" width="100%" border="0" cellspacing="0"
		cellpadding="0" class="ui-record-table">
		<thead>
			<tr>
				<th>选择</th>
				<th><b>酒店名</b></th>
				<th><b>客房名</b></th>
				<th><b>开始日期</b></th>
				<th><b>结束日期</b></th>
				<th><b>天数</b></th>
				<th><b>入住人</b></th>
				<th><b>房间数</b></th>
				<th><b>联系电话</b></th>
				<th><b>状态</b></th>
				<th><b>预订人</b></th>
				<th><b>金额</b></th>
				<th><b>价格</b></th>
				<th>操作</th>
			</tr>
		</thead>
		<tbody>
			<c:if test="${listjdyuding== null || fn:length(listjdyuding) == 0}">
				<tr>
					<td colspan="20">没有相关酒店预订信息</td>
				</tr>
			</c:if>
			<%	
								     if(request.getAttribute("listjdyuding")!=null)
								      {
									  List<Jdyuding> listjdyuding=( List<Jdyuding>)request.getAttribute("listjdyuding");
								         SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
								     for(Jdyuding  temjdyuding  :  listjdyuding)
								      {
							%>
			<tr>
				<td>&nbsp<input id="chk<%=temjdyuding.getId()%>" class="check"
					name="chk<%=temjdyuding.getId()%>" type="checkbox"
					value='<%=temjdyuding.getId()%>'></td>
				<td><%=temjdyuding.getJdtitle()%></td>
				<td><%=temjdyuding.getKfname()%></td>
				<td><%=sdf.format(temjdyuding.getBegindate())%></td>
				<td><%=sdf.format(temjdyuding.getEnddate())%></td>
				<td><%=temjdyuding.getTianshu()%></td>
				<td><%=temjdyuding.getRuzhuren()%></td>
				<td><%=temjdyuding.getShuliang()%></td>
				<td><%=temjdyuding.getMobile()%></td>
				<td>
				  <%if(temjdyuding.getStatus()==1){%>
				             待付款
				  <%} %>
				  <%if(temjdyuding.getStatus()==2){%>
				             已付款
				  <%} %>
				</td>
				<td><%=temjdyuding.getYdren()%></td>
				<td><%=temjdyuding.getTotalprice()%></td>
				<td><%=temjdyuding.getPrice()%></td>
				<td>
					<a class="orange-href"
					href="<%=SystemParam.getSiteRoot() %>/admin/jdyudingdetails.jsp?id=<%=temjdyuding.getId()%>">查看</a>
				</td>
			</tr>
			<%}}%>
		</tbody>
	</table>
	<div class="clear"></div>
	<daowen:pager id="pager1" attcheform="searchForm" />
</body>
</html>
