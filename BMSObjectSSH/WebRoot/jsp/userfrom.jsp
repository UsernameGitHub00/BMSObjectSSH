<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta charset="utf-8">
<title>用户新增</title>
<meta name="renderer" content="webkit">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
<link rel="stylesheet" href="${ctx}/Content/lib/layui/css/layui.css" type="text/css"></link>
<link rel="stylesheet" href="${ctx}/Content/layer/mobile/need/layer.css" type="text/css"></link>
</head>
<body>
	<div class="layui-form" lay-filter="layuiadmin-form-useradmin"
		id="layuiadmin-form-useradmin" style="padding: 20px 0 0 0;">
		<form class="layui-form" method="post" action="${ctx}/mainAction!updateUser.action" id="form">
			<input name="user_id" id="userid" style="display:none;">
			<div class="layui-form-item">
				<label class="layui-form-label">用户名</label>
				<div class="layui-input-inline">
					<input type="text" name="user_name" id="username" lay-verify="required"
						placeholder="请输入用户名" autocomplete="off" class="layui-input">
				</div>
			</div>
			<div class="layui-form-item" id="isName" style="display:none">
				<label class="layui-form-label">姓名</label>
				<div class="layui-input-inline">
					<input type="text" name="userinfor.name" id="name" lay-verify="required"
						placeholder="请输入姓名" autocomplete="off" class="layui-input">
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label">密码</label>
				<div class="layui-input-inline">
					<input type="password" name="password" id="password" lay-verify="required"
						placeholder="请输入密码" autocomplete="off" class="layui-input">
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label">手机号码</label>
				<div class="layui-input-inline">
					<input type="text" name="userinfor.number" id="phone" lay-verify="phone"
						placeholder="请输入号码" autocomplete="off" class="layui-input">
				</div>
			</div>
			<div class="layui-form-item" lay-filter="sex">
				<label class="layui-form-label">选择性别</label>
				<input type="hidden" name="userinfor.sex" id="sex1">
				<div class="layui-input-block">
					<input type="radio" name="sex" id="nan" value="男" title="男" style="margin-top:14px;" checked>
					<div class="layui-form-radio" style="margin-top:-4px;">
						<div>男</div>
					</div>
					<input type="radio" name="sex" id="nv" value="女" title="女" style="margin-top:14px;">
					<div class="layui-form-radio" style="margin-top:-4px;">
						<div>女</div>
					</div>
				</div>
			</div>
			<div class="layui-form-item">
				<div class="layui-input-block">
					<input type="button" class="layui-btn" id="insert" value="确认添加">
					<input type="button" class="layui-btn" id="update" style="display:none" value="确定修改">
					<input type="button" class="layui-btn layui-btn-primary" id="clear" value="重新填写"> 
				</div>
			</div>
		</form>
	</div>
	<script src="${ctx}/Content/bootstrap-3.3.7-dist/js/jquery-2.0.3.min.js"></script>
    <script type="text/javascript" src="${ctx}/Content/js/jquery.form.js"></script>
	<script src="${ctx}/Content/layer/layer.js"></script>
	<script>
		 $(function(){
		 	var url = this.location.href;
            var userid = url.split("?")[1];
            if (userid == "-1") {
            	//新增
            	document.getElementById("insert").style.display = "inline-block";
            	document.getElementById("update").style.display = "none";
            	document.getElementById("isName").style.display = "none";
            }else{
            	//修改
            	document.getElementById("insert").style.display = "none";
            	document.getElementById("update").style.display = "inline-block";
            	document.getElementById("isName").style.display = "inline-block";
            	$.post("${ctx}/mainAction!selectUserInfor.action",{user_id:userid} , function (data) {
            		$("#userid").val(userid);
            		$("#username").val(data.user_name);
            		$("#oldPassword").val(data.password);
            		$("#name").val(data.name);
            		$("#phone").val(data.number);
            		if (data.sex==0) {
						$("#nan").attr("checked","checked");
						$("#sex1").val("0");
					}else{
						$("#nv").attr("checked","checked");
						$("#sex1").val("1");
					}
            	});
            }
		 });
		 
		 //新增
		 $("#insert").click(function(){
        	if ($("#nan").is(':checked')) {
				$("#sex1").val("0");
			}else{
			    $("#sex1").val("1");
			}
        	var UserName = $("#username").val();
        	var Password = $("#password").val();
			var phone = $("#phone").val();
			var sex1 = $("#sex1").val();
        	if (UserName!=""&&UserName!=null&&sex1!=""&&sex1!=null&&
        		phone!=""&&phone!=null&& Password!=""&&Password!=null) {
				$.post("${ctx}/loginAction!register.action", { user_name: UserName,password: Password,phone: phone,sex: sex1}, function (data) {
					if (data=="注册成功！") {
						 layer.msg("新增成功！", {
		                	icon: 1,
		               	 	time:1000
		            	},function(){
		            		var index = parent.layer.getFrameIndex(window.name);
	    	                parent.layer.close(index);
	    	                parent.location.reload(); 
		            	});
					}else{
						 layer.msg(data, {
			                icon: 1,
			                time:1000000
			            });
					}
                });
			} else {
				layer.msg("请填写完整！", {
					offset : '150px',
					time:1000
				});
			}
        });
        
        //修改
        $("#update").click(function(){
        	if ($("#nan").is(':checked')) {
				$("#sex1").val("0");
			}else{
			    $("#sex1").val("1");
			}
        	var userName = $("#username").val();
			var name = $("#name").val();
			var sex1 = $("#sex1").val();
			var phone =$("#phone").val();
			var password = $("#password").val();
			
        	if (userName!=""&&userName!=null&&sex1!=""&&sex1!=null&&
        		name!=""&&name!=null&&phone!=""&&phone!=null
        		) {
				$("#form").ajaxSubmit(function(data){
					 layer.msg(data, {
                            icon: 1,
                            time:1000
                        }, function () {
                            var index = parent.layer.getFrameIndex(window.name);
	    	                parent.layer.close(index);                                                                                       
	    	                parent.location.reload(); 
                        });
        		});
			} else {
				layer.msg("请填写完整！", {
					offset : '150px',
					time:1000
				});
			}
        });
        
        $("#clear").click(function(){
        	$("#username").val("");
        	$("#usertype").val("");
            $("#name").val("");
            $("#phone").val("");
            $("#code").val("");
            $("#number").val("");
            $("#sex1").val("");
        });
	</script>
</body>
</html>
