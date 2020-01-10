<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.daowen.uibuilder.*,com.daowen.bll.*" %>
<%@ page import="com.daowen.entity.*,com.daowen.dal.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>线路</title>
<link rel="stylesheet" href="<%=SystemParam.getSiteRoot() %>/e/css/index.css" type="text/css"></link>
<link rel="stylesheet" href="<%=SystemParam.getSiteRoot() %>/e/css/box.css" type="text/css"></link>
<script src="<%=SystemParam.getSiteRoot() %>/webui/jquery/jquery-1.8.3.min.js" type="text/javascript"></script>
<%
          String id=request.getParameter("id");
            if(id!=null){
                Xianlu xianlu=(Xianlu)DALBase.load("xianlu","where id="+id);
                if(xianlu!=null)
                   request.setAttribute("xianlu",xianlu);
            }
   %>
</head>
<body>
	<jsp:include page="head.jsp"></jsp:include>
	<div class="wrap">
		<div class="cover-title">
			当前位置：<a href="<%=SystemParam.getSiteRoot() %>/e/index.jsp">首页</a>
			&gt;&gt; <a href="<%=SystemParam.getSiteRoot() %>/e/xianlulist.jsp">线路</a>
		</div>
	</div>
	<div class="fn-clear"></div>
	<div class="row-flow">
		<div class="wrap">
		
		     <div class="news">
                    <div class="title">
                           ${xianlu.title}
                    </div>
                    <h5>
                                                        
                    </h5>
                    
                    <div class="content">
                      
                        <div class="row-flow">
	                       <div style="width:410px" class="column">
	                          <img src="${xianlu.tupian}" width="390" height="260"/>
	                       </div>
	                       <div style="width:610px" class="column">
	                           <div class="row-flow">
	                              
	                              <div class="label">
	                                                                                       出发城市:
	                              </div>
	                              <div class="description">
	                                  ${xianlu.chufadi }
	                              </div>
	                              
	                           </div>
	                            <div class="row-flow">
	                              
	                              <div class="label">
	                                                                                       目的地:
	                              </div>
	                              <div class="description">
	                                  ${xianlu.mudidi }
	                              </div>
	                              
	                           </div>
	                            <div class="row-flow">
	                              
	                              <div class="label">
	                                                                                       时间安排:
	                              </div>
	                              <div class="description">
	                                  ${xianlu.shijiananpai }
	                              </div>
	                              
	                           </div>
	                           
	                            <div class="row-flow">
	                              
	                              <div class="label">
	                                                                                       发团日期:
	                              </div>
	                              <div class="description">
	                                  ${xianlu.fatuanriqi }
	                              </div>
	                              
	                           </div>
	                           
	                            <div class="row-flow">
	                              
	                              <div class="label">
	                                                                                       交通信息:
	                              </div>
	                              <div class="description">
	                                  ${xianlu.jiaotongxinxi }
	                              </div>
	                              
	                           </div>
	                           
	                            <div class="row-flow">
	                              
	                              <div class="label">
	                                                                                       市场价格:
	                              </div>
	                              <div class="description">
	                                  <span class="discard-price">${xianlu.shichangjia}</span> 元
	                              </div>
	                              
	                           </div>
	                            <div class="row-flow">
	                              
	                              <div class="label">
	                                                                                       会员价格:
	                              </div>
	                              <div class="description">
	                                  ${xianlu.hyjia}元
	                              </div>
	                              
	                           </div>
	                           <a href="<%=SystemParam.getSiteRoot() %>/e/yuding.jsp?xlid=${xianlu.id}" class="order">立即预订</a>
	                       
	                       </div>
	                    
	                    </div>
	                    <div>
	                        ${xianlu.des}
	                    </div>
                        
                    
                    </div>
                    
             </div>
		</div>
	</div>
	<div class="fn-clear"></div>
	<jsp:include page="bottom.jsp"></jsp:include>
 </body>
</html>
