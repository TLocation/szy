<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.daowen.bll.*" %>
<link href="<%=SystemParam.getSiteRoot() %>/admin/css/main.css" rel="stylesheet" type="text/css" />
<script type="text/javascript">
   $(function(){
	   $(".accordion-item .leftMenus dd").click(function(){
	    	  $(".accordion-item .leftMenus dd").removeClass("current");
	    	  $(this).addClass("current");
	   });
   })
</script>
<div class="accordion-group">
	<div
		style="height:200px; background: url(images/content.gif) repeat-y; display: none;"
		class="accordion-item">
		
		<!--使用div与dd标签制作下拉菜单，h3为菜单主菜单项，dd作为子菜单项。使用css样式设置div属性-->
	      <h3>线路管理</h3>
		<div class="leftMenus">
		<dd><a target="main" href="<%=SystemParam.getSiteRoot() %>/admin/xianlumanager.do?actiontype=get">线路管理</a></dd>
			<dd>
				<a target="main" href="<%=SystemParam.getSiteRoot() %>/admin/xianlumanager.do?actiontype=load">添加线路</a>
			</dd>
			<dd>
				<a target="main" href="<%=SystemParam.getSiteRoot() %>/admin/xlyudingmanager.do?actiontype=get">旅游线路订单</a>
			</dd>
			</div>
	    <h3>景点管理</h3>
       <div class="leftMenus">
            <dd><a target="main" href="<%=SystemParam.getSiteRoot() %>/admin/jingdianmanager.do?actiontype=get">景点管理</a></dd>
			<dd>
				<a target="main" href="<%=SystemParam.getSiteRoot() %>/admin/jingdianmanager.do?actiontype=load">添加景点</a>
			</dd>
			</div>
			
			<h3>酒店管理</h3>
			<div class="leftMenus">
			<!--单击菜单在main框架中显示信息，打开的窗口在主窗口打开-->
			<dd><a target="main" href="<%=SystemParam.getSiteRoot() %>/admin/jiudianmanager.do?actiontype=get">酒店管理</a></dd>
			<dd>
				<a target="main" href="<%=SystemParam.getSiteRoot() %>/admin/jiudianmanager.do?actiontype=load">添加酒店</a>
			</dd>
			<dd>
				<a target="main" href="<%=SystemParam.getSiteRoot() %>/admin/jdyudingmanager.do?actiontype=get">酒店预订管理</a>
			</dd>
		</div>
	    <h3>用户管理</h3>
		<div class="leftMenus">
			 <dd>
                  <a target="main"  href="<%=SystemParam.getSiteRoot() %>/admin/huiyuanmanager.do?actiontype=get">会员管理</a>
              </dd>
             
			  <dd>
				<a target="main"  href="<%=SystemParam.getSiteRoot() %>/admin/usersmanager.do?actiontype=get">管理员管理</a>
			  </dd>
            
		</div>
		<h3>信息管理</h3>
		<div class="leftMenus">
		    <dd>
				<a target="main" href="<%=SystemParam.getSiteRoot() %>/admin/xinximanager.do?actiontype=get&seedid=301">新闻资讯管理</a>
			</dd>
			<dd>
				<a target="main" href="<%=SystemParam.getSiteRoot() %>/admin/xinximanager.do?actiontype=load&seedid=302">发布新闻资讯</a>
			</dd>
			<dd >
				<a target="main" href="<%=SystemParam.getSiteRoot() %>/admin/lanmumanager.do?actiontype=get&seedid=303">新闻栏目管理</a>
			</dd>
		    <dd >
				<a target="main" href="<%=SystemParam.getSiteRoot() %>/admin/sitenavmanager.do?actiontype=get&seedid=303">首页导航管理</a>
			</dd>
			<dd>
				<a   target="main" href="<%=SystemParam.getSiteRoot() %>/admin/indexcolumnsmanager.do?actiontype=get">首页栏目管理</a>
			</dd>
			 <dd >
				<a target="main" href="<%=SystemParam.getSiteRoot() %>/admin/noticemanager.do?actiontype=get&seedid=304">系统公告管理</a>
			</dd>
			
			 <dd>
				<a target="main" href="<%=SystemParam.getSiteRoot() %>/admin/jiaodiantumanager.do?actiontype=get&seedid=305">焦点图管理</a>
			</dd>
			
			<dd>
				<a target="main" href="<%=SystemParam.getSiteRoot() %>/admin/friendlinkmanager.do?actiontype=get&seedid=306">友情链接管理</a>
			</dd>
			
			<dd>
				<a target="main" href="<%=SystemParam.getSiteRoot() %>/admin/areacitymanager.do?actiontype=get&seedid=307">城市管理</a>
			</dd>
			   <dd>
				<a target="main" href="<%=SystemParam.getSiteRoot() %>/admin/leavewordmanager.do?actiontype=get">在线留言管理</a>
			</dd>
		    <dd >
				<a target="main" href="<%=SystemParam.getSiteRoot() %>/admin/commentmanager.do?actiontype=get">会员评论管理</a>
			</dd>
			 <dd >
				<a target="main" href="<%=SystemParam.getSiteRoot() %>/admin/sysconfigmanager.do?actiontype=get">网站介绍</a>
			</dd>
			
		</div>
		
		<h3>账户设置</h3>
		<div class="leftMenus">
		
		
		<dd>
				<a  href="<%=SystemParam.getSiteRoot() %>/admin/modifypw.jsp"
					target="main">修改密码</a>
			</dd>
			<dd>
				<a  href="<%=SystemParam.getSiteRoot() %>/admin/accountinfo.jsp"
					target="main">我的账户信息</a>
			</dd>
			<dd>
				<a  href="<%=SystemParam.getSiteRoot() %>/admin/modifyinfo.jsp"
					target="main">修改账户信息</a>
			</dd>
		</div>
		
		
	</div>
</div>
