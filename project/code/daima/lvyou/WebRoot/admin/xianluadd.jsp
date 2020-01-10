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
  <title>线路</title>
    <script type="text/javascript" src="<%=SystemParam.getSiteRoot() %>/webui/jquery/jquery-1.8.3.min.js"></script>
     <link href="<%=SystemParam.getSiteRoot() %>/webui/artDialog/skins/default.css" rel="stylesheet" type="text/css" />
    <script src="<%=SystemParam.getSiteRoot() %>/webui/artDialog/jquery.artDialog.source.js" type="text/javascript"></script>
    <script src="<%=SystemParam.getSiteRoot() %>/webui/artDialog/iframeTools.source.js" type="text/javascript"></script>
    <script  type="text/javascript" src="<%=SystemParam.getSiteRoot() %>/webui/jquery/jquery.validate.min.js"></script>
    <script type="text/javascript"  src="<%=SystemParam.getSiteRoot() %>/webui/jquery/jquery.validateex.js" ></script>
    <script type="text/javascript"  src="<%=SystemParam.getSiteRoot() %>/webui/jquery/jquery.metadata.js" ></script>
    <script type="text/javascript"  src="<%=SystemParam.getSiteRoot() %>/webui/jquery/messages_cn.js" ></script>
    <link href="<%=SystemParam.getSiteRoot() %>/uploadifyv3.1/uploadify.css" rel="stylesheet" type="text/css" />
    <script src="<%=SystemParam.getSiteRoot() %>/uploadifyv3.1/jquery.uploadify-3.1.js" type="text/javascript"></script>
    <script type="text/javascript"  src="<%=SystemParam.getSiteRoot() %>/webui/jquery-form/jquery.form.js"></script>
    <script type="text/javascript" src="<%=SystemParam.getSiteRoot() %>/editor/kindeditor-min.js"></script>
    <script type="text/javascript" src="<%=SystemParam.getSiteRoot() %>/editor/lang/zh_CN.js"></script>
    <link rel="stylesheet" href="<%=SystemParam.getSiteRoot() %>/webui/jqueryui/themes/base/jquery.ui.all.css" type="text/css"></link>
    <script type="text/javascript" src="<%=SystemParam.getSiteRoot() %>/webui/jqueryui/ui/jquery-ui.js"></script>
    <script type="text/javascript" src="<%=SystemParam.getSiteRoot() %>/webui/jqueryui/ui/i18n/jquery.ui.datepicker-zh-CN.js"></script>
    <script src="<%=SystemParam.getSiteRoot() %>/webui/jqueryui/ui/jquery-ui-timepicker-addon.js" type="text/javascript"></script>
     <link href="<%=SystemParam.getSiteRoot() %>/admin/css/web2table.css" rel="stylesheet" type="text/css" />
   <script type="text/javascript"><!--
        function initControl(){
			            editor = KindEditor.create('textarea[name="des"]', {
			            uploadJson : '../plusin/upload_json.jsp',
				        fileManagerJson : '../plusin/file_manager_json.jsp',
			            resizeType: 1,
				        allowFileManager: true
				       });
				       //将声明的普通上传控件与Uploadify插件绑定
			           $('#btnulTupian').uploadify({  
			                'formData': { 'folder': '<%=SystemParam.getSiteRoot()%>/Upload' },
			                //传到后台 
			                'buttonText': '选择图片',  //设置按钮文本
			                'buttonClass': 'browser',  
			                'removeCompleted': true,  // 是否自动将已完成任务从队列中删除
			                'swf': '<%=SystemParam.getSiteRoot()%>/uploadifyv3.1/uploadify.swf', 
			                //进度条
			                'fileTypeExts':"*.jpg;*.gif;*.png;",//设置可以选择的文件的类型
			                'auto':true,  //选定文件后自动上传
			                'removeTimeout':0,//文件队列上传完成0秒后删除
			                'debug': false,  //是否显示调试框（默认不显示false）
			                'height': 15,  //设置“选择图片”按钮高度
			                'width':90,  
			                'uploader': '<%=SystemParam.getSiteRoot()%>/admin/uploadmanager.do',
			                 'fileSizelimit':'2048KB',//控制上传文件的大小
			                 'queueSizelimit':'5',
			                 'onUploadSuccess':function(file, data, response){//每次成功上传后执行的回调函数，从服务端返回数据到前端
			                     $("#filelist").show();
			                     $("#imgTupian").attr("src","<%=SystemParam.getSiteRoot()%>/upload/temp/"+file.name);
			                     //临时存放目录，返回路径+文件名
                                 $("#hidTupian").val("<%=SystemParam.getSiteRoot()%>/upload/temp/"+file.name);
			                  }
			             }); 
			          var imgtupiansrc="${requestScope.xianlu.tupian}";
				       if(imgtupiansrc==""){
				         var url="<%=SystemParam.getSiteRoot()%>/upload/nopic.jpg";
				         $("#imgTupian").attr("src",url);
				         $("#hidTupian").val(url);
				       }else
				       {
				          $("#imgTupian").attr("src",imgtupiansrc);
				          $("#hidTupian").val(imgtupiansrc); 
				       }
        }
        $(function ()
        {
            initControl();
            $.metadata.setType("attr","validate");
            $("#xianluForm").validate();
        });  
    --></script>
</head>
<body>
	<div class="search-title">
		<h2>添加线路</h2>
		<div class="description"></div>
	</div>
	<form name="xianluform" method="post"
		action="<%=SystemParam.getSiteRoot()%>/admin/xianlumanager.do"
		id="xianluForm">
		<table class="grid" cellspacing="1" width="100%">
			<input type="hidden" name="id" value="${id}" />
			<input type="hidden" name="actiontype" value="${actiontype}" />
			<input type="hidden" name="seedid" value="${seedid}" />
			<input type="hidden" name="errorurl" value="/admin/xianluadd.jsp" />
			<input type="hidden" name="forwardurl"
				value="/admin/xianlumanager.do?actiontype=get&forwardurl=/admin/xianlumanager.jsp" />
			<tr>
				<td colspan="4">${errormsg}</td>
			</tr>
			
			<tr>
				<td align="right">标题:</td>
				<td><input name="title" placeholder="标题"
					validate="{required:true,messages:{required:'请输入标题'}}"
					value="${requestScope.xianlu.title}" class="input-txt" type="text"
					id="txtTitle" /></td>
				<td colspan="2" rowspan="6"><img id="imgTupian" width="200px" height="200px"
					src="${requestScope.xianlu.tupian}" />
					<div>
						<input type="file" name="upload" id="btnulTupian" />
					</div> <input type="hidden" id="hidTupian" name="tupian"
					value="${requestScope.xianlu.tupian}" />
			</tr>
			<tr>
				<td align="right">出发城市:</td>
				<td><input name="chufadi" placeholder="出发城市"
					validate="{required:true,messages:{required:'请输入出发城市'}}"
					value="${requestScope.xianlu.chufadi}" class="input-txt"
					type="text" id="txtChufadi" /></td>
			</tr>
			<tr>
				<td align="right">目的地:</td>
				<td><input name="mudidi" placeholder="目的地"
					validate="{required:true,messages:{required:'请输入目的地'}}"
					value="${requestScope.xianlu.mudidi}" class="input-txt" type="text"
					id="txtMudidi" /></td>
			</tr>
			<tr>
				<td align="right">时间安排:</td>
				<td><input name="shijiananpai" placeholder="时间安排"
					validate="{required:true,messages:{required:'请输入时间安排'}}"
					value="${requestScope.xianlu.shijiananpai}" class="input-txt"
					type="text" id="txtShijiananpai" /></td>
			</tr>
			<tr>
				<td align="right">发团日期:</td>
				<td><input name="fatuanriqi" placeholder="发团日期"
					validate="{required:true,messages:{required:'请输入发团日期'}}"
					value="${requestScope.xianlu.fatuanriqi}" class="input-txt"
					type="text" id="txtFatuanriqi" /></td>
			</tr>
			<tr>
				<td align="right">交通信息:</td>
				<td><input name="jiaotongxinxi" placeholder="交通信息"
					validate="{required:true,messages:{required:'请输入交通信息'}}"
					value="${requestScope.xianlu.jiaotongxinxi}" class="input-txt"
					type="text" id="txtJiaotongxinxi" /></td>
			</tr>
			<tr>
				<td align="right">市场价:</td>
				<td><input name="shichangjia" placeholder="市场价"
					validate="{required:true,number:true,messages:{required:'请输入市场价',number:'请输入正确价格'}}"
					value="${requestScope.xianlu.shichangjia}" class="input-txt"
					type="text" id="txtShichangjia" /></td>
			
				<td align="right">会员价:</td>
				<td>
				 <input name="hyjia" placeholder="会员价"
					validate="{required:true,number:true,messages:{required:'请输入会员价',number:'请输入正确价格'}}"
					value="${requestScope.xianlu.hyjia}" class="input-txt" type="text"
					id="txtHyjia" />
				</td>
			</tr>
			
			
			<tr>
				<td align="right">线路说明:</td>
				<td colspan="3"><textarea name="des" id="txtDes"
						style="width:98%;height:400px;">${requestScope.xianlu.des}</textarea>
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
