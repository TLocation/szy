<%@page import="com.daowen.uibuilder.*"%>
<%@page import="com.daowen.bll.LanmuBuilder"%>
<%@page import="com.daowen.bll.*"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>系统首页</title>
<link rel="stylesheet" href="<%=SystemParam.getSiteRoot() %>/e/css/index.css" type="text/css"></link>
<link href="<%=SystemParam.getSiteRoot() %>/e/css/box.all.css"  rel="stylesheet" type="text/css"/>
<link rel="stylesheet" href="<%=SystemParam.getSiteRoot() %>/e/css/jquery.iFadeSlide.css" type="text/css"></link>

    <script src="<%=SystemParam.getSiteRoot() %>/webui/jquery/jquery-1.5.2.min.js" type="text/javascript"></script>

    <script src="<%=SystemParam.getSiteRoot() %>/e/js/jquery.iFadeSldie.js" type="text/javascript"></script>

    <script type="text/javascript">
        $(function () {


            
            $('div#slide_c').iFadeSlide({
                field: $('div#slide_c img'),
                icocon: $('div.ico_c'),
                outTime: 100,
                inTime: 200
            });
            
           $(".tabcontainer dl dt").each(function(index,dom){
               
               
                  $(this).mouseenter(function(){
                   
                      
                      $(".tabcontainer dl dt").removeClass("on");
                      $(this).addClass("on");
                      $(this).parent().children("dd").hide().eq(index).show();
                     
                  })
         })

        });
    </script>

</head>
<body>
  <!-- include可包含静态文件和动态文件 -->
	<jsp:include page="head.jsp"></jsp:include>
	<div class="wrap">
		<div class="sidebar fn-left"
			style="height:316px; width:262px; padding-right: 0px; background: #fff;">
			<h3>系统公告</h3>
			<%=NoticeService.getNotice() %>

		</div>
		<div class="fn-left">
		
		     <%=FocusgraphicBLL.getFocusgraphic() %>
          
		</div>

		

	</div>

	<div class="fn-clear"></div>
	<div class="row-flow">
		<div class="wrap">
			<div >
			
				 <%
				    XianluUibuilder xianluuibuilder=new XianluUibuilder("box");
	    %>
				<!-- 线路 -->
		<%=xianluuibuilder.buildImageLanmu("", 8, "旅游线路") %>
	    
				
			</div>
			
		</div>
	</div>
	
	
	<div class="wrap">
     
	
         <%=new IndexColumnsBuilder().buildColumns() %>

		
	 
	</div>
		
		
	<div class="fn-clear"></div>
	
   
	<jsp:include page="bottom.jsp"></jsp:include>



</body>
</html>