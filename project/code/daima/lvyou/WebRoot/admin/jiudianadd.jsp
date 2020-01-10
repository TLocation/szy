<%@ page language="java" import="java.util.*" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.text.*"%>
<%@ page import="com.daowen.bll.*"%>
<%@ page import="com.daowen.entity.*" %>
<%@page import="com.daowen.dal.DALBase"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="web" uri="/WEB-INF/webcontrol.tld"%>
<%@ include file="law.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
 <head>
  <title>酒店</title>
    <script type="text/javascript" src="<%=SystemParam.getSiteRoot() %>/webui/jquery/jquery-1.8.3.min.js"></script>
     <link href="<%=SystemParam.getSiteRoot() %>/webui/artDialog/skins/default.css" rel="stylesheet" type="text/css" />
    <script src="<%=SystemParam.getSiteRoot() %>/webui/artDialog/jquery.artDialog.source.js" type="text/javascript"></script>
    <script src="<%=SystemParam.getSiteRoot() %>/webui/artDialog/iframeTools.source.js" type="text/javascript"></script>
    <script  type="text/javascript" src="<%=SystemParam.getSiteRoot() %>/webui/jquery/jquery.validate.min.js"></script>
    <script type="text/javascript"  src="<%=SystemParam.getSiteRoot() %>/webui/jquery/jquery.validateex.js" ></script>
    <script type="text/javascript"  src="<%=SystemParam.getSiteRoot() %>/webui/jquery/jquery.metadata.js" ></script>
    <script type="text/javascript"  src="<%=SystemParam.getSiteRoot() %>/webui/jquery/messages_cn.js" ></script>
	    <link href="<%=SystemParam.getSiteRoot() %>/webui/easydropdown/themes/easydropdown.css" rel="stylesheet" type="text/css" />
    <script src="<%=SystemParam.getSiteRoot() %>/webui/easydropdown/jquery.easydropdown.js" type="text/javascript"></script>    
    <link href="<%=SystemParam.getSiteRoot() %>/uploadifyv3.1/uploadify.css" rel="stylesheet" type="text/css" />
    <script src="<%=SystemParam.getSiteRoot() %>/uploadifyv3.1/jquery.uploadify-3.1.js" type="text/javascript"></script>
    <script type="text/javascript" src="<%=SystemParam.getSiteRoot() %>/editor/kindeditor-min.js"></script>
    <script type="text/javascript" src="<%=SystemParam.getSiteRoot() %>/editor/lang/zh_CN.js"></script>
    <link rel="stylesheet" href="<%=SystemParam.getSiteRoot() %>/webui/jqueryui/themes/base/jquery.ui.all.css" type="text/css"></link>
    <script type="text/javascript" src="<%=SystemParam.getSiteRoot() %>/webui/jqueryui/ui/jquery-ui.js"></script>
    <script type="text/javascript" src="<%=SystemParam.getSiteRoot() %>/webui/jqueryui/ui/i18n/jquery.ui.datepicker-zh-CN.js"></script>
    <script src="<%=SystemParam.getSiteRoot() %>/webui/jqueryui/ui/jquery-ui-timepicker-addon.js" type="text/javascript"></script>
     <link href="<%=SystemParam.getSiteRoot() %>/admin/css/web2table.css" rel="stylesheet" type="text/css" />
   <script type="text/javascript">
        function initControl(){
	  //开始绑定
                    //结束绑定
                   //开始绑定
                    //结束绑定
			           $('#btnulTupian').uploadify({  
			                'formData': { 'folder': '<%=SystemParam.getSiteRoot()%>/Upload' },  
			                'buttonText': '选择图片',  
			                'buttonClass': 'browser',  
			                'removeCompleted': true,  
			                'swf': '<%=SystemParam.getSiteRoot()%>/uploadifyv3.1/uploadify.swf', 
			                'fileTypeExts':"*.jpg;*.gif;*.png;",
			                'auto':true, 
			                'removeTimeout':0,
			                'debug': false,  
			                'height': 15,  
			                'width':90,  
			                'uploader': '<%=SystemParam.getSiteRoot()%>/admin/uploadmanager.do',
			                 'fileSizelimit':'2048KB',
			                 'queueSizelimit':'5',
			                 'onUploadSuccess':function(file, data, response){
			                     $("#filelist").show();
			                     $("#imgTupian").attr("src","<%=SystemParam.getSiteRoot()%>/upload/temp/"+file.name);
		$("#hidTupian").val("<%=SystemParam.getSiteRoot()%>/upload/temp/"+file.name);
			                  }
			             }); 
			          var imgtupiansrc="${requestScope.jiudian.tupian}";
				       if(imgtupiansrc==""){
				         var url="<%=SystemParam.getSiteRoot()%>/upload/nopic.jpg";
				         $("#imgTupian").attr("src",url);
				         $("#hidTupian").val(url);
				       }else
				       {
				          $("#imgTupian").attr("src",imgtupiansrc);
				          $("#hidTupian").val(imgtupiansrc); 
				       }
           
			            editor = KindEditor.create('textarea[name="des"]', {
			            uploadJson : '../plusin/upload_json.jsp',
				        fileManagerJson : '../plusin/file_manager_json.jsp',
			            resizeType: 1,
				        allowFileManager: true
				       });
        }
        $(function ()
        {
            initControl();
            $.metadata.setType("attr","validate");
            $("#jiudianForm").validate();
        });  
    </script>
</head>
<body>
		 <div class="search-title">
	<h2>
	                      新建酒店
	                </h2>
	                <div class="description">
	                </div>
              </div>
				    <form name="jiudianform"  method="post" action="<%=SystemParam.getSiteRoot()%>/admin/jiudianmanager.do"  id="jiudianForm">
				        <table class="grid" cellspacing="1" width="100%">
						        <input type="hidden" name="id" value="${id}" />
						        <input type="hidden" name="actiontype" value="${actiontype}" />
						         <input type="hidden" name="seedid" value="${seedid}" />
						         <input type="hidden" name="errorurl" value="/admin/jiudianadd.jsp" />
						        <input type="hidden" name="forwardurl" value="/admin/jiudianmanager.do?actiontype=get&forwardurl=/admin/jiudianmanager.jsp" />
						        <tr>
								  <td colspan="4">
								      ${errormsg}
								  </td>
								</tr>
											   <tr>
											   <td align="right" >酒店名称:</td>
											   <td>
												   <input name="title" placeholder="酒店名称" validate="{required:true,messages:{required:'请输入酒店名称'}}" value="${requestScope.jiudian.title}" class="input-txt" type="text" id="txtTitle"  />
												</td>
											   </tr>
											   <tr>
												        <td align="right" >连锁品牌:</td>
												        <td>
												        <select   name="brand" id="ddlBrand" class="dropdown" >
                                                                 <option value="汉庭酒店">汉庭酒店</option>
										                          <option value="7天酒店">7天酒店</option>
										                          <option value="如家快捷">如家快捷</option>
										                          <option value="锦江之星">锦江之星</option>
										                          <option value="永生现代">永生现代</option>
										                          <option value="7天优品">7天优品</option>
										                          <option value="维也纳">维也纳</option>
										                          <option value="城市便捷">城市便捷</option>
										                          <option value="尚客优连锁">尚客优连锁</option>
														 </select>
														</td>
											   </tr>
											   <tr>
												        <td align="right" >酒店级别:</td>
												        <td>
												        <select   name="jibie" id="ddlJibie" class="dropdown" >
<option value="五星级">五星级</option>
										                          <option value="四星级">四星级</option>
										                          <option value="三星级">三星级</option>
										                          <option value="二星级">二星级</option>
										                          <option value="经济型">经济型</option>
														 </select>
														</td>
											   </tr>
											   <tr>
											    <td align="right" >快照:</td>
											   <td>
												    <img id="imgTupian" width="200px" height="200px"  src="${requestScope.jiudian.tupian}"/>
												    	<div>
													        <input type="file" name="upload" id="btnulTupian" />
													    </div>
													 <input type="hidden" id="hidTupian" name="tupian" value="${requestScope.jiudian.tupian}" />
												</td>
											   </tr>
											   <tr>
													   <td align="right" >所在城市:</td>
													   <td>
<web:dropdownlist name="city" id="city" cssclass="dropdown"  value="${requestScope.jiudian.city}" datasource="${city_datasource}"   textfieldname="cityname" valuefieldname="cityname">
														        </web:dropdownlist>
														     <input id="hidcityname" name="cityname" type="hidden" vlaue="${requestScope.jiudian.city}"/>
														</td>
											   </tr>
											   <tr>
											   <td align="right" >酒店地址:</td>
											   <td>
												   <input name="address" placeholder="酒店地址" validate="{required:true,messages:{required:'请输入酒店地址'}}" value="${requestScope.jiudian.address}" class="input-txt" type="text" id="txtAddress"  />
												</td>
											   </tr>
											 <tr>
											   <td align="right" >介绍:</td>
											   <td colspan="3">
													<textarea   name="des"   id="txtDes" style="width:98%;height:200px;"  >${requestScope.jiudian.des}</textarea>
											   </td>
											 </tr>
						   <tr>
						       <td colspan="4">
						                <div class="ui-button">
											<button class="ui-button-text"><i class="icon-ok icon-white"></i>提交</button>
									     </div>
						       </td>
						   </tr>
				        </table>
		</form>
</body>
</html>
