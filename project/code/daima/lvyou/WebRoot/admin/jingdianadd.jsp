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
  <title>景点</title>
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
			          var imgtupiansrc="${requestScope.jingdian.tupian}";
				       if(imgtupiansrc==""){
				         var url="<%=SystemParam.getSiteRoot()%>/upload/nopic.jpg";
				         $("#imgTupian").attr("src",url);
				         $("#hidTupian").val(url);
				       }else
				       {
				          $("#imgTupian").attr("src",imgtupiansrc);
				          $("#hidTupian").val(imgtupiansrc); 
				       }
                   //开始绑定
                          /* $("#city").change(function(){
			        	      $("[name=cityname]").val($("#city option:selected").text());
			               })*/
                    //结束绑定
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
            $("#jingdianForm").validate();
        });  
    </script>
</head>
<body>
	<div class="search-title">
		<h2>新建景点</h2>
		<div class="description"></div>
	</div>
	<form name="jingdianform" method="post"
		action="<%=SystemParam.getSiteRoot()%>/admin/jingdianmanager.do"
		id="jingdianForm">
		<table class="grid" cellspacing="1" width="100%">
			<input type="hidden" name="id" value="${id}" />
			<input type="hidden" name="actiontype" value="${actiontype}" />
			<input type="hidden" name="seedid" value="${seedid}" />
			<input type="hidden" name="errorurl" value="/admin/jingdianadd.jsp" />
			<input type="hidden" name="forwardurl"
				value="/admin/jingdianmanager.do?actiontype=get&forwardurl=/admin/jingdianmanager.jsp" />
			<tr>
				<td colspan="4">${errormsg}</td>
			</tr>
			<tr>
				<td align="right">名称:</td>
				<td><input name="title" placeholder="名称"
					validate="{required:true,messages:{required:'请输入名称'}}"
					value="${requestScope.jingdian.title}" class="input-txt"
					type="text" id="txtTitle" /></td>
			</tr>
			<tr>
				<td align="right">快照:</td>
				<td><img id="imgTupian" width="200px" height="200px"
					src="${requestScope.jingdian.tupian}" />
					<div>
						<input type="file" name="upload" id="btnulTupian" />
					</div> <input type="hidden" id="hidTupian" name="tupian"
					value="${requestScope.jingdian.tupian}" /></td>
			</tr>
			<tr>
				<td align="right">所属城市:</td>
				<td><web:dropdownlist name="city" id="city" cssclass="dropdown"
						value="${requestScope.jingdian.city}"
						datasource="${city_datasource}" textfieldname="cityname"
						valuefieldname="cityname">
					</web:dropdownlist>
				</td>
			</tr>
			<tr>
				<td align="right">景点介绍:</td>
				<td colspan="3"><textarea name="des" id="txtDes"
						style="width:98%;height:200px;">${requestScope.jingdian.des}</textarea>
				</td>
			</tr>
			<tr>
				<td colspan="4">
					<div class="ui-button">
						<button class="ui-button-text">
							<i class="icon-ok icon-white"></i>提交
						</button>
					</div>
				</td>
			</tr>
		</table>
	</form>
</body>
</html>
