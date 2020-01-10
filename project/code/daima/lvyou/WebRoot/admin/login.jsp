<%@page import="com.daowen.bll.SystemParam"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>系统登录</title>

    <link href="<%=SystemParam.getSiteRoot() %>/admin/css/common.css" rel="stylesheet" type="text/css" />
    <link rel="shortcut icon" href="<%=SystemParam.getSiteRoot() %>/admin/images/fav.ico" type="image/x-icon" />

    <script src="<%=SystemParam.getSiteRoot() %>/webui/jquery/jquery-1.5.2.min.js" type="text/javascript"></script>

    <script src="<%=SystemParam.getSiteRoot() %>/webui/jquery/jquery.validate.min.js" type="text/javascript"></script>

    <script src="<%=SystemParam.getSiteRoot() %>/webui/jquery/jquery.metadata.js" type="text/javascript"></script>

  <script type="text/javascript"> 
  
       if(top.window!=window)
    	   top.location.href="login.jsp";
      
      $(function(){
      
           $("#loginForm").submit(function(){
              
              //alert($("#txtUsername").val());
              //判断账户名是否为空
               if($("#txtUsername").val()=="")
               {
                  alert("用户名不能为空");
                  return false;
               }
               return true;
           
           })
          
      
      })
  
  </script>
							

</head>
<body>
  <form method="post" action="<%=SystemParam.getSiteRoot() %>/admin/login.do" id="loginForm">
           
           <input type="hidden" name="actiontype" value="login" />
           <input name="usertype" value="0" type="hidden" >
           <input type="hidden" name="forwardurl"   value="/admin/index.jsp"/>
   <div class="LoginBox">
        
           
            <div class="LoginTop">
                <img src="images/login-top.gif" />
             </div>
            <div class="FormNav">
                <div class="key">
                   
                   <div class="ui-form-item">
                   
                       <span style="margin-left:-40px;" class="login-sysname">旅游管理系统后台登录</span>
                   
                   </div>
                  
                    <div class="ui-form-item">
							<label class="ui-label" >
								账户名:
							</label>
							<input type="text" id="txtUsername" name="username" class="ui-input">
                           
				    </div>
				      <div class="ui-form-item">
							<label class="ui-label" >
								密码:
							</label>
					      <input type="password" id="txtPassword" name="password" class="ui-input">
                         
				    </div>
				   
				     <div class="ui-form-item">
							<label class="ui-label" >
							<!--调用image.jsp生成验证码，并将验证码存入session-->
								 <img id="vcodeimg" src="../plusin/image.jsp" style="cursor: hand" onclick="this.src='../plusin/image.jsp?
								 time=' + Math.random()"title="点击刷新验证码" align="absMiddle" src="" />

							</label>
							<input type="text" name="validcode" id="txtTextcode" autocomplete="off"  class="ui-input">
                         
                           
							
				    </div>
				    
				   <div class="ui-form-item">
							<div class="ui-button" >
							 
							    <input type="submit" class="ui-button-text" value="登录"/>
                               
								
							</div>
							
							
			    	</div> 
			    	
			        <div class="ui-form-item">
                        
                         ${errmsg}
			        
			        </div>
                  
                  
                </div>
            </div>
            <div>
                <img src="images/login-bottom.gif" />
            </div>
        </div>
    

</form>
</body>
</html>