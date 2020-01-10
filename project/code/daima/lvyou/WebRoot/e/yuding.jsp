<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.daowen.uibuilder.*,com.daowen.bll.*" %>
<%@ page import="com.daowen.entity.*,com.daowen.dal.*" %>
<%@ include file="huiyuan/law.jsp" %>
<%
          String xlid=request.getParameter("xlid");
            if(xlid!=null){
                Xianlu xianlu=(Xianlu)DALBase.load("xianlu","where id="+xlid);
                if(xianlu!=null)
                   request.setAttribute("xianlu",xianlu);
            }
   %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>线路</title>
<link rel="stylesheet" href="<%=SystemParam.getSiteRoot() %>/e/css/index.css" type="text/css"></link>
<link rel="stylesheet" href="<%=SystemParam.getSiteRoot() %>/e/css/box.css" type="text/css"></link>
<script src="<%=SystemParam.getSiteRoot() %>/webui/jquery/jquery-1.8.3.min.js" type="text/javascript"></script>
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
     $(function(){
    	 
    	  $("#txtYddate").datepicker({
             dateFormat:'yy-mm-dd'
          }).datepicker("setDate",new Date());
    	  $.metadata.setType("attr","validate");
          $("#xlyudingForm").validate();
    	 
     })

</script>
</head>
<body>
	<jsp:include page="head.jsp"></jsp:include>
	
	<div class="row-flow">
		<div class="wrap">
		   <form id="xlyudingForm" method="post" action="<%=SystemParam.getSiteRoot() %>/admin/xlyudingmanager.do" >
		     <input type="hidden" name="xlid" value="${xianlu.id}"/>
		     <input type="hidden" name="status" value="等待付款"/>
		     <input type="hidden" name="xltitle" value="${xianlu.title}"/>
		     <input type="hidden" name="actiontype" value="save"/>
		     <input type="hidden" name="hyname" value="${huiyuan.accountname}"/>
		     <input type="hidden" name="jine" value="${xianlu.hyjia}"/>
		     <input type="hidden" name="forwardurl" value="/e/yudingres.jsp"/>
		     <div class="form">
                    <div class="title">
                                                                   预订线路信息
                    </div>
                   
                    <div class="grid-row">
                       <div class="label">线路名称</div> 
                       <div class="description">${xianlu.title}</div>
                    </div>
                    
                    <div class="grid-row">
                       <div class="label">预订日期</div> 
                       <div class="description">
                       <input type="text" id="txtYddate"  name="yddate" id="ydriqi" class="input-txt"/></div>
                    </div>
                    
                     <div class="grid-row">
                       <div class="label">人数（人）</div><!-- digits:true必须输入整数
                       --><div class="description"><input type="text" validate="{required:true,digits:true,messages:{required:'请输入人数',digits:'请输入正确的人数'}}" name="renshu" value="1" class="input-txt"/></div>
                    </div>
                    
                    <div class="grid-row">
                       <div class="label">房间（间）</div> 
                       <div class="description">
                          <input type="text" class="input-txt" name="fangjiashu" validate="{required:true,digits:true,messages:{required:'请输入人数',digits:'请输入正确房间数'}}" value="1"/>
                       </div>
                    </div>
                     <div class="grid-row">
                       <div class="label">预定人</div> 
                       <div class="description">${huiyuan.accountname}</div>
                    </div>
                    <div class="grid-row">
                       <div class="label">姓名</div> 
                       <div class="description"><input type="text" name="lianxiren" validate="{required:true,messages:{required:'请输入联系人'}}" value="${huiyuan.name}" class="input-txt"/></div>
                    </div>
                    
                    <div class="grid-row">
                       <div class="label">联系电话</div> 
                       <div class="description">
                          <input type="text" name="mobile" value="${huiyuan.mobile}" validate="{required:true,mobile:true,messages:{required:'请输入联系电话',mobile:'请输入正确联系电话'}}" class="input-txt"/>
                        </div>
                    </div>
                    <div class="grid-row">
                      
                         <input type="submit" value="提交订单"  class="order"/>
                    
                    </div>
                  </form>
             </div>
		</div>
	</div>
	<div class="fn-clear"></div>
	<jsp:include page="bottom.jsp"></jsp:include>
 </body>
</html>
