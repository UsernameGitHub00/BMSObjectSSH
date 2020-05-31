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
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">

<title>登录</title>
<link rel="stylesheet" href="${ctx}/Content/css/font-awesome.min.css">
<link rel="stylesheet" href="${ctx}/Content/css/demo.css" />
<link rel="stylesheet" href="${ctx}/Content/css/bootstrap.min.css">
<link rel="stylesheet" href="${ctx}/Content/css/templatemo-style.css">
<link rel="stylesheet" href="${ctx}/Content/css/style.css" type="text/css" media="all">
<script type="text/javascript" src="${ctx}/Content/js/modernizr.custom.86080.js"></script>
<script src="${ctx}/Content/bootstrap-3.3.7-dist/js/jquery-2.0.3.min.js"></script>
<script type="text/javascript" src="${ctx}/Content/js/jquery.form.js"></script>
<style>
.gcs-checkbox {
  background-color: white;
  border-radius: 0px;
  border: 1px solid #d3d3d3;
  width: 20px;
  height: 20px;
  display: inline-block;
  text-align: center;
  vertical-align: bottom;
  line-height: 20px;
} 
.gcs-checkbox:hover {
  cursor: pointer;
  border: 1px solid #2783FB;
}
.gcs-checkbox:checked {
  background-color: #eee;
  background: #2783FB;
} 

</style>

</head>

<body onkeydown="Loginbtn()" >
	<div id="particles-js"></div>
	<input id="message" type="hidden" value="${message}">
	<div class="container-fluid">
		<div class="row cb-slideshow-text-container ">
			<div class="tm-content col-xl-12 col-sm-12 col-xs-12 ml-auto section">
				<div class="container w3layouts agileits">
					<div class="login w3layouts agileits">
						<h2>登 录</h2>
						<form method="post" action="${ctx}/loginAction!login.action"
							id="formLogin">
							<input type="text" Name="user_name" id="UserName" placeholder="用户名" required="">
							<input type="password" Name="password" id="PassWord" placeholder="密码" required="">
                            <input type="checkbox" id="brand1" name="brand1" class="gcs-checkbox" ><label style="color:#fff">记住我</label>
                            
						    <div class="send-button w3layouts agileits" style="margin-top:15px;">
								<input type="submit" name="btn" id="btnLogin" value="登 录">
						    </div>
						</form>
						<div class="social-icons w3layouts agileits">
							<p>- 其他方式登录 -</p>
							<ul>
								<li class="qq"><a href="#"> <span
										class="icons w3layouts agileits"></span> <span
										class="text w3layouts agileits">QQ</span> </a>
								</li>
								<li class="weixin w3ls"><a href="#"> <span
										class="icons w3layouts"></span> <span
										class="text w3layouts agileits">微信</span> </a>
								</li>
								<li class="weibo aits"><a href="#"> <span
										class="icons agileits"></span> <span
										class="text w3layouts agileits">微博</span> </a>
								</li>
								<div class="clear"></div>
							</ul>
						</div>
						<div class="clear"></div>
					</div>
					<div class="register w3layouts agileits">
						<h2>注 册</h2>
						<form action="${ctx}/loginAction!register.action" method="post" id="formInsert">
						    <input type="hidden" name="fun" value="insert" />
							<input type="text" Name="user_name" id="Name" placeholder="用户名" required="">
							<input type="password" Name="password" id="UserPassword" placeholder="密码" required=""> 
							<input type="text" Name="phone" id="Number" placeholder="手机号码" required="">
						<div class="send-button w3layouts agileits">
							<input type="button" name="btn1" id="insertUser" value="免费注册">
						</div>
						</form>
						<div class="clear"></div>
					</div>
					<div class="clear"></div>
				</div>
			</div>
		</div>
	</div>
</body>
<script type="text/javascript" src="${ctx}/Content/js/particles.js"></script>
<script type="text/javascript" src="${ctx}/Content/js/app.js"></script>
<script src="${ctx}/Content/layer/layer.js"></script>

<script>
        $(function(){
            var isRemember=$("#isRemember").val();
            if (isRemember=="true") {
			    $("#UserName").val(($("#username").val()));
			    $("#PassWord").val(($("#password").val()));
			    $("#Number").attr("checked",true);
		    } 
		    var message=$("#message").val();
		    if (message==null||message=="") {
				
			}else{
				layer.msg(message,{offset:'150px',time:1500});
			}
        });
        
        $("#insertUser").click(function() {
		var Userame1 = $("#Name").val();
		var Password1 = $("#UserPassword").val();
		var Number=$("#number").val();
		if (Userame1 != "" && Userame1 != null) {
			if (Password1 != "" && Password1 != null) {
				$("#formInsert").ajaxSubmit(function(data) {
					layer.msg(data, {
                            icon: 1,
                            time:1000
                        }, function () {
                            location.reload();
                        });
				});

			} else {
				layer.msg("密码不能为空！", {
					offset : '150px',
					time:1000
				});
			}
		} else {
			layer.msg("用户名不能为空！", {
				offset : '150px',
				time:1000
			});
		}
	});
        
		//按Enter登录
		function Loginbtn() {
			if (window.event.keyCode == 13) {
				document.all('btnLogin').click();
			}
		}
</script>
</html>
