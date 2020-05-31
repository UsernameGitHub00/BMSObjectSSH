<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
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
<meta charset="UTF-8">
<title>后台管理</title>
<meta name="renderer" content="webkit|ie-comp|ie-stand">
<meta http-equiv="X-UA-Com patible" content="IE=edge,chrome=1">
<meta http-equiv="Cache-Control" content="no-siteapp" />
<link rel="stylesheet" href="${ctx}/Content/lib/layui/css/layui.css" type="text/css"></link>
<link rel="stylesheet" href="${ctx}/Content/css/font.css">
<link rel="stylesheet" href="${ctx}/Content/css/xadmin.css">
<script src="${ctx}/Content/lib/layui/layui.js" charset="utf-8"></script>
<script type="text/javascript" src="${ctx}/Content/js/xadmin.js"></script>
<script>
	
</script>
</head>
<body class="index">
	<!-- 顶部开始 -->
	<div class="container">
		<div class="logo">
			<a>图书管理系统</a>
		</div>
		<input type="hidden" id="userid" value="${user.user_id}">
		<input id="message" type="hidden" value="${message}">
		<div class="left_open">
			<a><i title="展开左侧栏" class="iconfont">&#xe699;</i>
			</a>
		</div>
		<ul class="layui-nav left fast-add" lay-filter="">
			<li class="layui-nav-item"><a href="javascript:;">+新增</a>
				<dl class="layui-nav-child">
					<!-- 二级菜单 -->
					<dd>
						<a onclick="xadmin.open('最大化','http://www.baidu.com','','',true)">
							<i class="iconfont">&#xe6a2;</i>弹出最大化</a>
					</dd>
					<dd>
						<a onclick="xadmin.open('弹出自动宽高','http://www.baidu.com')"> <i
							class="iconfont">&#xe6a8;</i>弹出自动宽高</a>
					</dd>
					<dd>
						<a onclick="xadmin.open('弹出指定宽高','${ctx}/jsp/userfrom.jsp',500,300)">
							<i class="iconfont">&#xe6a8;</i>弹出指定宽高</a>
					</dd>
					<dd>
						<a onclick="xadmin.add_tab('在tab打开','member-list.html')"> <i
							class="iconfont">&#xe6b8;</i>在tab打开</a>
					</dd>
					<dd>
						<a onclick="xadmin.add_tab('在tab打开刷新','member-del.html',true)">
							<i class="iconfont">&#xe6b8;</i>在tab打开刷新</a>
					</dd>
				</dl></li>
		</ul>
		<ul class="layui-nav right" lay-filter="">
			<li class="layui-nav-item"><a href="javascript:;">${user.user_name}</a>
				<dl class="layui-nav-child">
					<!-- 二级菜单 -->
					<dd>
						<a onclick="xadmin.open('个人信息','${ctx}/mainAction!information.action?user_id=${user.user_id}&user_name=${user.user_name}')">个人信息</a>
					</dd>
					<dd>
						<a onclick="xadmin.open('修改密码','${ctx}/jsp/updatePassword.jsp?user_name=${user.user_name}')">修改密码</a>
					</dd>
					<dd>
						<a href="${ctx}/jsp/login.jsp">退出</a>
					</dd>
				</dl></li>
			<li class="layui-nav-item to-index"><a href="${ctx}/mainAction!toIndex.action?user_id=${user.user_id}&user_name=${user.user_name}&user_information_id=${user.user_information_id}">前台首页</a>
			</li>
		</ul>
	</div>
	
	<!-- 顶部结束 -->
	<!-- 中部开始 -->
	<!-- 左侧菜单开始 -->
	<div class="left-nav">
		<div id="side-nav">
			<ul id="nav">
				<li><a href="javascript:;"> <i class="iconfont left-nav-li"
						lay-tips="书籍管理">&#xe705;</i> <cite>书籍管理</cite> <i
						class="iconfont nav_right">&#xe697;</i>
				</a>
					<ul class="sub-menu">
						<li><a onclick="xadmin.add_tab('类别管理','${ctx}/jsp/bookTypeManagement.jsp')">
								<i class="iconfont">&#xe6a7;</i> <cite>类别管理</cite>
						</a></li>
						<li><a
							onclick="xadmin.add_tab('图书管理','${ctx}/jsp/bookManage.jsp')"> <i
								class="iconfont">&#xe6a7;</i> <cite>图书管理</cite>
						</a></li>
					</ul></li>
				<li><a href="javascript:;"> <i class="iconfont left-nav-li"
						lay-tips="借还书管理">&#xe723;</i> <cite>借还书管理</cite> <i
						class="iconfont nav_right">&#xe697;</i>
				</a>
					<ul class="sub-menu">
						<li><a onclick="xadmin.add_tab('借书管理','${ctx}/jsp/borrowBook.jsp')">
								<i class="iconfont">&#xe6a7;</i> <cite>借书管理</cite>
						</a></li>
						<li><a onclick="xadmin.add_tab('还书管理','${ctx}/jsp/returnBook.jsp')">
								<i class="iconfont">&#xe6a7;</i> <cite>还书管理</cite>
						</a></li>
					</ul></li>
				<li><a href="javascript:;"> <i class="iconfont left-nav-li"
						lay-tips="借阅证管理">&#xe723;</i> <cite>借阅证管理</cite> <i
						class="iconfont nav_right">&#xe697;</i>
				</a>
					<ul class="sub-menu">
						<li><a onclick="xadmin.add_tab('借阅证','${ctx}/jsp/borrowingCard.jsp')"> <i
								class="iconfont">&#xe6a7;</i> <cite>借阅证</cite>
						</a></li>
					</ul></li>
				<li><a href="javascript:;"> <i class="iconfont left-nav-li"
						lay-tips="系统维护">&#xe723;</i> <cite>系统维护</cite> <i
						class="iconfont nav_right">&#xe697;</i>
				</a>
					<ul class="sub-menu">
						<li><a onclick="xadmin.add_tab('用户管理','${ctx}/jsp/userManage.jsp')"> <i
								class="iconfont">&#xe6a7;</i> <cite>用户管理</cite>
						</a></li>
					</ul></li>
				<li><a href="javascript:;"> <i class="iconfont left-nav-li"
						lay-tips="管理员管理">&#xe726;</i> <cite>管理员管理</cite> <i
						class="iconfont nav_right">&#xe697;</i>
				</a>
					<ul class="sub-menu">
						<li><a onclick="xadmin.add_tab('管理员列表','${ctx}/jsp/administratorManage.jsp')">
								<i class="iconfont">&#xe6a7;</i> <cite>管理员列表</cite>
						</a></li>
						<%-- <li><a onclick="xadmin.add_tab('角色管理','admin-role.html')">
								<i class="iconfont">&#xe6a7;</i> <cite>角色管理</cite>
						</a></li>
						<li><a onclick="xadmin.add_tab('权限分类','admin-cate.html')">
								<i class="iconfont">&#xe6a7;</i> <cite>权限分类</cite>
						</a></li>
						<li><a onclick="xadmin.add_tab('权限管理','admin-rule.html')">
								<i class="iconfont">&#xe6a7;</i> <cite>权限管理</cite>
						</a></li> --%>
					</ul></li>
			</ul>
		</div>
	</div>
	<!-- <div class="x-slide_left"></div> -->
	<!-- 左侧菜单结束 -->
	<!-- 右侧主体开始 -->
	<div class="page-content">
		<div class="layui-tab tab" lay-filter="xbs_tab" lay-allowclose="false">
			<ul class="layui-tab-title">
				<li class="home"><i class="layui-icon">&#xe68e;</i>我的桌面</li>
			</ul>
			<div class="layui-unselect layui-form-select layui-form-selected"
				id="tab_right">
				<dl>
					<dd data-type="this">关闭当前</dd>
					<dd data-type="other">关闭其它</dd>
					<dd data-type="all">关闭全部</dd>
				</dl>
			</div>
			<div class="layui-tab-content">
				<div class="layui-tab-item layui-show">
					<iframe src='${ctx}/Content/img/city.jpg' frameborder="0" scrolling="yes" class="x-iframe" height="100%" width="100%"></iframe>
				</div>
			</div>
			<div id="tab_show"></div>
		</div>
	</div>
	<div class="page-content-bg"></div>
	<style id="theme_style"></style>
	<!-- 右侧主体结束 -->
	<!-- 中部结束 -->
<script src="${ctx}/Content/bootstrap-3.3.7-dist/js/jquery-2.0.3.min.js"></script>
<script type="text/javascript" src="${ctx}/Content/js/jquery.form.js"></script>
<script src="${ctx}/Content/layer/layer.js"></script>
<script type="text/javascript">
	// 是否开启刷新记忆tab功能
	var is_remember = false;
	$(function(){
		var userid=$("#userid").val();
		if (userid==null || userid=="" || userid==0) {
			window.location.href='${ctx}/jsp/login.jsp';
		}
		var message=$("#message").val();
	    if (message==null||message=="") {
			
		}else{
			layer.msg(message,{offset:'150px',time:1500});
		}
	});
</script>
</body>
</html>
