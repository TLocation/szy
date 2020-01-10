

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.daowen.bll.*,java.util.*,java.text.*,com.daowen.entity.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>系统首页</title>
<link  href="css/index.css"  rel="stylesheet"  type="text/css"></link>
<link href="css/bbs2.css"  rel="stylesheet" type="text/css"/>
<link rel="stylesheet" href="css/jquery.iFadeSlide.css" type="text/css"></link>

    <script src="<%=SystemParam.getSiteRoot() %>/webui/jquery/jquery-1.5.2.min.js" type="text/javascript"></script>

    <script src="<%=SystemParam.getSiteRoot() %>/e/js/jquery.iFadeSldie.js" type="text/javascript"></script>

    <script type="text/javascript">
        $(function () {


            
          
            $(".collapsed").each(function(i,dom){
	             
	             
	             $(this).click(function(){
		             var blockid= $(this).attr("blockid");
		             if($("#"+blockid).is(":hidden")){
		               
		               $(this).attr("src","images/collapsed_no.gif");
		               $("#"+blockid).show();
		             
		             }else
		             {
		                $(this).attr("src","images/collapsed_yes.gif");
		               $("#"+blockid).hide(); 
		             }
	             });
	             
	         
	         
	         });
            
          

        });
    </script>

</head>
<body>

	<jsp:include page="head.jsp"></jsp:include>
	
    
     <div class="wrap"> 
    
	    <%=ForumBuilder.buildForum(-1) %>
    </div>
	


	<jsp:include page="bottom.jsp"></jsp:include>



</body>
</html>