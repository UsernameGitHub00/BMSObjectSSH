<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="ctx" value="${pageContext.request.contextPath}"></c:set>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<html><head>
 <meta charset="utf-8">
 <title>设置我的密码</title>
 <meta name="renderer" content="webkit">
 <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
 <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
 <link rel="stylesheet" href="${ctx}/Content/lib/layui/css/layui.css" media="all">
 <link rel="stylesheet" href="${ctx}/Content/css/xadmin.css" media="all">
<style>
.layui-side-menu,.layadmin-pagetabs .layui-tab-title li:after,.layadmin-pagetabs .layui-tab-title li.layui-this:after,.layui-layer-admin .layui-layer-title,.layadmin-side-shrink .layui-side-menu .layui-nav>.layui-nav-item>.layui-nav-child{background-color:#20222A !important;}
.layui-nav-tree .layui-this,.layui-nav-tree .layui-this>a,.layui-nav-tree .layui-nav-child dd.layui-this,.layui-nav-tree .layui-nav-child dd.layui-this a{background-color:#009688 !important;}
.layui-layout-admin .layui-logo{background-color:#20222A !important;}
</style>
</head>
<body layadmin-themealias="default">
  <div class="layui-fluid">
    <div class="layui-row layui-col-space15">
      <div class="layui-col-md12">
        <div class="layui-card">
          <div class="layui-card-header">设置我的密码</div>
          <div class="layui-card-body" pad15="">
            <form method="post" action="${ctx}/mainAction!updatePassword.action" id="form">
           		<input type="hidden" name="user_name" id="name">
	            <div class="layui-form" lay-filter="">
	             <div class="layui-form-item">
	               <label class="layui-form-label">当前密码</label>
	               <div class="layui-input-inline">
	                 <input type="password" name="oldPassword" id="oldPassword" lay-verify="required" lay-vertype="tips" class="layui-input">
	               </div>
	             </div>
	             <div class="layui-form-item">
	               <label class="layui-form-label">新密码</label>
	               <div class="layui-input-inline">
	                 <input type="password" name="password" id="password" lay-verify="pass" lay-vertype="tips" autocomplete="off" id="LAY_password" class="layui-input">
	               </div>
	               <!-- <div class="layui-form-mid layui-word-aux">6到16个字符</div> -->
	             </div>
	             <div class="layui-form-item">
	               <label class="layui-form-label">确认新密码</label>
	               <div class="layui-input-inline">
	                 <input type="password" name="repassword" id="repassword" lay-verify="repass" lay-vertype="tips" autocomplete="off" class="layui-input">
	               </div>
	             </div>
	             <div class="layui-form-item">
	               <div class="layui-input-block">
	                 <input type="button" class="layui-btn" id="update" value="确认修改">
	               </div>
	             </div>
	           </div>
            </form>
          </div>
        </div>
      </div>
    </div>
  </div>

<script src="${ctx}/Content/bootstrap-3.3.7-dist/js/jquery-2.0.3.min.js"></script>
<script type="text/javascript" src="${ctx}/Content/js/jquery.form.js"></script>
<script src="${ctx}/Content/layer/layer.js"></script>
<script>
	$(function(){
		var url = location.search; //获取url中"?"符后的字串  
		var theRequest = new Object();  
		if (url.indexOf("?") != -1) {  
 			var str = url.substr(1);  
  			strs = str.split("&");  
  			for(var i = 0; i < strs.length; i ++) {  
     			theRequest[strs[i].split("=")[0]]=(strs[i].split("=")[1]);  
  			}  
		}
		
		$("#name").val(theRequest.user_name);
	});
  	
  	$.ajaxSetup({ async:false });
  	$("#update").click(function(){
      	var oldPassword = $("#oldPassword").val();
		var password = $("#password").val();
		var repassword = $("#repassword").val();
      	if (oldPassword!=""&&oldPassword!=null&&
      		password!=""&&password!=null&&repassword!=""&&repassword!=null
      		) {
      		if (password==repassword) {
      			var index = parent.layer.getFrameIndex(window.name);
	    	    parent.layer.close(index);
				$("#form").submit();
				parent.location.reload(); 
			}else{
				layer.msg("两次输入的密码不一致！", {
					offset : '150px',
					time:1000
				});
			}
		} else {
			layer.msg("请填写完整！", {
				offset : '150px',
				time:1000
			});
		}
		
      });
</script>


</body>
</html>

