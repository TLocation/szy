<%@page import="com.daowen.bll.SystemParam"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script  type="text/javascript">
     
   $(function(){

      $("#side-menu .menu-group li").removeClass("current");
     
      var seedid='<%=request.getParameter("seedid")%>';
      
      if(seedid!="null")
         $("#"+seedid).addClass("current");
      else
        $("#m1").addClass("current");
      
   })

</script>
<div id="side-menu">






	<div class="menu-group">
		<h2>订单管理 </h2>
		<ul>
			<li id="201" >
				<a  href="<%=SystemParam.getSiteRoot() %>/admin/xlyudingmanager.do?seedid=201&accountname=${huiyuan.accountname}&actiontype=get&forwardurl=/e/huiyuan/xlyudingmanager.jsp">旅游线路订单</a>
			</li>
			
			<li id="203" >
				<a  href="<%=SystemParam.getSiteRoot() %>/admin/jdyudingmanager.do?seedid=203&ydren=${huiyuan.accountname}&actiontype=get&forwardurl=/e/huiyuan/jdyudingmanager.jsp">酒店预订管理</a>
			</li>
			
		      <li id="202">
			    <a href="<%=SystemParam.getSiteRoot()%>/admin/leavewordmanager.do?seedid=202&accountname=${huiyuan.accountname}&actiontype=get&forwardurl=/e/huiyuan/lwmanager.jsp">
					我的留言 
			    </a>
		    </li>
			
			
		</ul>
	</div>
	<div class="menu-group">
		<h2>
			账户信息
		</h2>
		<ul>
			<li id="101" class="current">
				<a  href="<%=SystemParam.getSiteRoot()%>/e/huiyuan/accountinfo.jsp?seedid=101">账户信息</a>
			</li>
			<li id="104" >
				<a  href="<%=SystemParam.getSiteRoot()%>/e/huiyuan/yue.jsp?seedid=104">账户余额</a>
			</li>
			<li id="102">
				<a href="<%=SystemParam.getSiteRoot() %>/e/huiyuan/modifypw.jsp?seedid=102" target="_self">密码修改</a>
			</li>
			<li id="103">
				<a href="<%=SystemParam.getSiteRoot() %>/e/huiyuan/modifyinfo.jsp?seedid=103" target="_self">信息修改</a>
			</li>
         
		</ul>
	</div>




</div>