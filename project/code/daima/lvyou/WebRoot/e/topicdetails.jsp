
<%@page import="com.daowen.bll.*,java.util.*"%>
<%@page import="com.daowen.entity.*,com.daowen.dal.*,java.text.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%
	        String  topicid=request.getParameter("topicid");
	       
	        Topic  topic=(Topic)DALBase.load("topic","where id="+topicid);
	        
	        
	        if(topic!=null){
	        
	           request.setAttribute("topic",topic);
	           
	           topic.setClickcount(topic.getClickcount()+1);
	           
	           DALBase.update(topic);
	        }
	        
%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>主题信息</title>
<link rel="stylesheet" href="<%=SystemParam.getSiteRoot() %>/e/css/index.css" type="text/css"></link>

<link rel="stylesheet" href="<%=SystemParam.getSiteRoot() %>/e/css/register.css" type="text/css"></link>
 
 <link href="css/bbs2.css"  rel="stylesheet" type="text/css"/>
 
 <link href="css/forum.css"  rel="stylesheet" type="text/css"/>
 

<script src="<%=SystemParam.getSiteRoot() %>/webui/jquery/jquery-1.5.2.min.js" type="text/javascript"></script>

<script type="text/javascript" src="<%=SystemParam.getSiteRoot() %>/editor/kindeditor-min.js"></script>
<script  type="text/javascript" src="<%=SystemParam.getSiteRoot() %>/webui/jquery/jquery.validate.min.js"></script>
  <script type="text/javascript"  src="<%=SystemParam.getSiteRoot() %>/webui/jquery/jquery.metadata.js" ></script>
  <script type="text/javascript"  src="<%=SystemParam.getSiteRoot() %>/webui/jquery/messages_cn.js" ></script>

<script type="text/javascript">
        $(function () {
         
        	   editor = KindEditor.create('#txtContent', {
		              resizeType: 1,
		              uploadJson : '../plusin/upload_json.jsp',
				      fileManagerJson : '../plusin/file_manager_json.jsp',

			        allowFileManager: true
			   });
        	   
        	 $.metadata.setType("attr","validate");
        	 $("#postForm").validate();
        	 $("#postForm").submit(function(){
        		 
        		 var title2=$("#txtTitle").val();
                 var content2=$("#txtDcontent").val();
                               
                 if(title2==""){
                  
                    alert("标题不能为空");
                     
                    return false;
                 
                 }
                 
                 if(content2==""){
                  
                     alert("回复的内容不能为空");
                    
                     return false;
                 
                 }
                 
                 var un= $("#hidusername").val();
                  
                  
                  if(un!=""&&un!=null)
                    {
                       
                       return true;
                    }
                   else
                   {
                     alert("请登陆系统会员才能进入讨论"); 
                     window.location.href="login.jsp?gobackurl=topicdetails.jsp?topicid=<%=topicid%>";
                     return false;
                   }   
     		 
     	     })
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
	
	
	<div class="fn-clear"></div>
	
	<div class="wrap">
		 
		<div class="block-description">
			<h1>${topic.bkname}</h1>

			   当前主题:${requestScope.topic.title}
    		
		</div>
		<div>
		  
            <a title="发新话题"   href="postadd.jsp?bkid=${requestScope.bankuai.id}">
                <img alt="发新话题" src="images/newtopic.png" style="display: inline">
            </a>
           
		</div>
       <div class="gray-border">
		
       <table width="100%" cellspacing="0" cellpadding="0">
                   
                        <tr>
                            <td class="postauthor">
                                <div class="poster">
                                    <span class="onlineyes" title="在线">
                                        <%=topic.getPubren()%>
                                     </span>
                                </div>
                                <div >
                                    <div class="avatar">
                                        <img src="images/noavatar_medium.gif">
                                    </div>
                                    <p>
                                          <%=topic.getPubren()%>
                                    </p>
                                </div>
                                <p>
                                    <img src="images/star_level3.gif">
                                    <img src="images/star_level3.gif">
                                    <img src="images/star_level1.gif">
                                </p>
                                <ul class="otherinfo">
                                    <li>
                                        <label>
                                                                                                        组别</label>管理员 </li>
                                    <li>
                                        <label>
                                                                                                               生日
                                        </label>
                                        2013-11-14
                                    </li>
                                  
                                    <li>
                                        <label>
                                                                                                                  发布时间
                                        </label>
                                            <%=topic.getPubtime().toLocaleString()%>
                                    </li>
                                </ul>
                            </td>
                            <td class="postcontent">
                                
                                <div class="topic-title">
                                   ${topic.title}
                                </div>
                                <div class="topic-pubtime">
                                    <img src="images/admin.gif">
                                    <em>发表于 <span >
                                       <%=topic.getPubtime().toLocaleString() %> </span> </em><span class="pipe">|</span> 
                                </div>
                                
                                <div class="topic-content">
                                      ${topic.dcontent}
                                </div>
                                
                            </td>
                        </tr>
                        
                        
                    
                    
                    
                    <%
                     
                     List<Topic> topiclist=DALBase.getEntity("topic", "where replyid='"+topicid+"'");
                     int i=1;
                     for(Topic temtopic : topiclist)
                     {
                   %>
                     
                    	  <tr>
                          <td class="postauthor">
                              <div class="poster">
                                  <span class="onlineyes" title="在线">
                                      <%=temtopic.getPubren()%>
                                   </span>
                              </div>
                              <div >
                                  <div class="avatar">
                                      <img src="images/noavatar_medium.gif">
                                  </div>
                                  <p>
                                        <%=temtopic.getPubren()%>
                                  </p>
                              </div>
                              <p>
                                  <img src="images/star_level3.gif">
                                  <img src="images/star_level3.gif">
                                  <img src="images/star_level1.gif">
                              </p>
                              <ul class="otherinfo">
                                  <li>
                                      <label>
                                                                                                      组别</label>管理员 </li>
                                  <li>
                                      <label>
                                                                                                             生日
                                      </label>
                                      2013-11-14
                                  </li>
                                
                                  <li>
                                      <label>
                                                                                                                发布时间
                                      </label>
                                          <%=temtopic.getPubtime().toLocaleString()%>
                                  </li>
                              </ul>
                          </td>
                          <td class="postcontent">
                              
                              <div class="topic-title">
                                 <%=temtopic.getTitle() %>
                              </div>
                              <div class="topic-pubtime">
                                  <img src="images/admin.gif">
                                  <em>发表于 <span >
                                     <%=temtopic.getPubtime().toLocaleString() %> </span> </em><span class="pipe">|</span> 
                              </div>
                              
                              <div class="topic-content">
                                   <%=temtopic.getDcontent() %>
                              </div>
                              
                          </td>
                      </tr>
                    	 
             
                    
                    
                    <%} %>
                    
                    
                    
                    
                </table>
       </div>
      
		<div>
		  
            <a title="发新话题"   href="postadd.jsp?bkid=${requestScope.bankuai.id}">
                <img alt="发新话题" src="images/newtopic.png" style="display: inline">
            </a>
           
		</div>

	</div>
	
	<div class="fn-clear"></div>
	
	<div class="wrap gray-border">
	  
	  <form id="postForm"  method="post"   action="<%=SystemParam.getSiteRoot()%>/admin/topicmanager.do?command=add&actiontype=operOver">
       
                 <input type="hidden"  id="hidusername" name="pubren" value="${requestScope.huiyuan.username}"/>
                 <input type="hidden"  name="reurl" value="<%=SystemParam.getSiteRoot() %>/e/topicdetails.jsp?topicid=${requestScope.topic.id}"/>
                 <input type="hidden"  name="bkid" value="${requestScope.topic.bkid}"/>
                 <input type="hidden"  name="bkname" value="${requestScope.topic.bkname}"/>
                 <input type="hidden"  name="istopic" value="0"/>
                 <input type="hidden"  name="replyid" value="${requestScope.topic.id}"/>
                      
                      
	    <h2 class="bm_h">
                            回复主题
        </h2>
         <div>
            <input id="txtTitle"  validate="{required:true,minlength:8,messages:{required:'请输入帖子内容',minlength:'帖子内容最少需要8字符'}}" type="text" class="input-txt" name="title">
         </div>
            <div >
                <textarea id="txtContent" validate="{required:true,minlength:8,messages:{required:'请输入帖子内容',minlength:'帖子内容最少需要8字符'}}"
                   style="width:100%;height:180px;"></textarea>
            </div>
            <div style="padding: 10px 14px;">
                <input class="red-button" value="回复"  type="submit"  />
             </div>
       </form>
	
	</div>
   

	<jsp:include page="bottom.jsp"></jsp:include>



</body>
</html>