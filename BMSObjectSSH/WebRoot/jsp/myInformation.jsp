<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="ctx" value="${pageContext.request.contextPath}"></c:set>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>我的信息</title>
<meta name="renderer" content="webkit|ie-comp|ie-stand">
<meta http-equiv="X-UA-Com patible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi" />
<meta http-equiv="Cache-Control" content="no-siteapp" />
<link rel="stylesheet" href="${ctx}/Content/css/font.css" type="text/css"></link>
<link rel="stylesheet" href="${ctx}/Content/css/xadmin.css" type="text/css">

<script type="text/javascript" src="${ctx}/Content/bootstrap-3.3.7-dist/js/jquery-3.2.1.min.js"></script>
<script src="${ctx}/Content/lib/layui/layui.js" charset="utf-8"></script>
<script type="text/javascript" src="${ctx}/Content/js/xadmin.js"></script>
<style>


</style>

</head>

<body>
	<div class="layui-fluid">
		<div class="layui-row layui-col-space15">
			<div class="layui-col-md12">
				<div class="layui-card">
					<div class="layui-card-header">设置我的资料</div>
					<input type="hidden" id="message" value="${message}">
					<div class="layui-card-body" pad15="">
						<div class="layui-form">
						<form class="layui-form" method="post" action="${ctx}/mainAction!updateUserInfor.action" id="form">
							<input type="hidden" id="userid" name="user_id" value="${user.user_id}" >
							<div class="layui-form-item" id="no">
								<input id="typeId" type="hidden" value="${userinfor.user_type_id}">
								<label class="layui-form-label">我的角色</label>
								<div class="layui-input-inline">
									<input type="text" id="usertype" disabled class="layui-input layui-btn-disabled" value="${userinfor.type_name}">
									<input type="hidden" name="userinfor.type_name" value="${userinfor.type_name}">
								</div>
								<div class="layui-form-mid layui-word-aux">当前角色不可更改为其它角色</div>
							</div>
							<div class="layui-form-item">
								<label class="layui-form-label">用户名</label>
								<div class="layui-input-inline">
									<input type="text" name="user_name" id="username" class="layui-input" value="${user.user_name}">
								</div>
							</div>
							<div class="layui-form-item">
								<label class="layui-form-label">姓名</label>
								<div class="layui-input-inline">
									<input type="text" name="userinfor.name" id="name" value="${userinfor.name}"
										lay-verify="nickname" autocomplete="off" placeholder="请输入昵称"
										class="layui-input">
								</div>
							</div>
							<div class="layui-form-item" lay-filter="sex">
								<label class="layui-form-label">选择性别</label>
								<input type="hidden" name="userinfor.sex" id="sex1" value="${userinfor.sex}">
								<div class="layui-input-block">
									<input type="radio" name="sex1" id="nan" value="男" title="男" style="margin-top:14px;" checked>
									<div class="layui-form-radio" style="margin-top:-4px;">
										<div>男</div>
									</div>
									<input type="radio" name="sex1" id="nv" value="女" title="女" style="margin-top:14px;">
									<div class="layui-form-radio" style="margin-top:-4px;">
										<div>女</div>
									</div>
								</div>
							</div>
							<div class="layui-form-item">
								<label class="layui-form-label">身份证号</label>
								<div class="layui-input-inline">
									<input type="text" name="userinfor.code" id="code" value="${userinfor.code}"
										lay-verify="nickname" autocomplete="off" 
										class="layui-input">
								</div>
							</div>
							<div class="layui-form-item">
								<label class="layui-form-label">手机</label>
								<div class="layui-input-inline">
									<input type="text" name="userinfor.number" value="${userinfor.number}"  id="number" class="layui-input">
								</div>
							</div>
							<div class="layui-form-item">
								<label class="layui-form-label">籍贯</label>
								<div class="layui-input-inline">
									<input type="text" name="userinfor.address" value="${userinfor.address}" id="address" class="layui-input">
								</div>
							</div>
							<div class="layui-form-item" id="card">
								<input type="hidden" id="card1" value="${userinfor.is_borrow_card}">
								<label class="layui-form-label">借阅证状态</label>
                               <!--  <div class="layui-input-block">
									<input type="checkbox" name="switch" lay-skin="switch" lay-text="通过|待审核">
								</div> -->
								<label class="layui-form-label" id="lab" >待审核</label>
							</div>
							<div class="layui-form-item">
								<div class="layui-input-block">
									<input type="button" class="layui-btn" id="update" value="确认修改">
									<input type="button" class="layui-btn layui-btn-primary" id="clear" value="重新填写"> 
								</div>
							</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script src="${ctx}/Content/bootstrap-3.3.7-dist/js/jquery-2.0.3.min.js"></script>
    <script type="text/javascript" src="${ctx}/Content/js/jquery.form.js"></script>
	<script src="${ctx}/Content/layer/layer.js"></script>
	
	<script type="text/javascript">
		 
		 
		$(function(){
			if ($("#sex1").val()==0) {
				$("#nan").attr("checked","checked");
				$("#sex1").val("0");
			}else{
				$("#nv").attr("checked","checked");
				$("#sex1").val("1");
			}
			if ($("#typeId").val()=="1") {
				$("#type").attr("disabled","true");
			}else{
				$("#a").attr("display","none");
			}
			if ($("#typeId").val()=="3") {
				document.getElementById("no").style.display = "none";
			}else{
				document.getElementById("card").style.display = "none";
			}
			if($("#card1").val()=="0"){
				document.getElementById("lab").innerHTML = "已通过";
			}
			var message=$("#message").val();
		    if (message==null||message=="") {
				
			}else{
				layer.msg(message,{offset:'150px',time:1500});
			}
		 	/* //获取传递过来的userid
		 	var url = location.search; //获取url中"?"符后的字串  
   			var theRequest = new Object();  
   			if (url.indexOf("?") != -1) {  
     			var str = url.substr(1);  
      			strs = str.split("&");  
      			for(var i = 0; i < strs.length; i ++) {  
         			theRequest[strs[i].split("=")[0]]=unescape(strs[i].split("=")[1]);  
      			}  
   			}
   			$.post("${ctx}/mainAction!information.action", { user_id: theRequest.userid }, function (data) {
           	
          	}); */
        }); 
        
        $("#update").click(function(){
        	if ($("#nan").is(':checked')) {
				$("#sex1").val("0");
			}else{
			    $("#sex1").val("1");
			}
			var userName = $("#username").val();
			var name = $("#name").val();
			var sex1 = $("#sex1").val();
			var code = $("#code").val();
			var number =$("#number").val();
			var address = $("#address").val();
        	if (userName!=""&&userName!=null&&sex1!=""&&sex1!=null&&
        		name!=""&&name!=null&&code!=""&&code!=null&&
        		number!=""&&number!=null&&address!=""&&address!=null) {
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
            $("#name").val("");
            $("#code").val("");
            $("#number").val("");
            $("#address").val("");
        });
	</script>
	<script>
	
	</script>
</body>
</html>
