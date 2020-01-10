<%@ page language="java" import="com.daowen.bll.SystemParam" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.daowen.uibuilder.SitenavBuilder"%>
<%@ page import="com.daowen.bll.* ,com.daowen.entity.*"%>
 
 <script type="text/javascript">
  
    $(function(){
      
      $(".exit").click(function(){
          
            var pageurl_pagescope= $("#pageurl_pagescope").val();
            
            $.ajax({
		                     
		              url:encodeURI('<%=SystemParam.getSiteRoot()%>/admin/huiyuanmanager.do?actiontype=exit'),
					   method:'get',
					   success:function(){
					      window.location.reload();
					  },
					  error:function(xmhttprequest,status,excetpion){
					     $.alert("系统错误，错误编码"+status);
					  }
		     })

      })
      
      $(".main-nav .menus li a").removeClass("current");
	      var headid='<%=request.getParameter("headid")%>';
	      if (headid != 'null') {
	           
	     	 $("#"+headid).addClass("current");
	 	 }
    
      
      
    })

</script>
 
<%
    
      Huiyuan temhy=(Huiyuan)request.getSession().getAttribute("huiyuan");
      if(temhy!=null)
         request.setAttribute("huiyuan", temhy);
      
     

 %>

  
  
<div class="index-toolbar">
  <div class="wrap">
  
         
    <%if(temhy!=null){ %>
                 欢迎你<a href="<%=SystemParam.getSiteRoot() %>/e/huiyuan/accountinfo.jsp">${huiyuan.accountname }(个人中心)</a>
     <a class="exit" style="cursor:pointer">退出</a>|<!--cursor:pointer当鼠标放上去显示手
    -->
    <%}%>
  
    
   
     <a href="<%=SystemParam.getSiteRoot() %>/e/login.jsp">用户登录</a>|
     <a href="<%=SystemParam.getSiteRoot() %>/e/register.jsp">注册</a>|
    
     <a href="<%=SystemParam.getSiteRoot()%>/admin/login.jsp">系统后台</a>
     
    
  </div>
 
</div>
   
 <div  class="wrap">
  
      <img width="100%" src="<%=SystemParam.getSiteRoot() %>/e/images/banner.jpg"  height="120px">
  </div>
  
   <div  class="wrap">
   <%=new SitenavBuilder().build() %>
  </div>
  
  
 <div class="fn-clear"></div>
	<div class="pageinfo">
	     
	</div>
