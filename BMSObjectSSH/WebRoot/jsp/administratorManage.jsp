<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="ctx" value="${pageContext.request.contextPath}"></c:set>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta charset="utf-8">
<title>用户管理</title>
<meta name="renderer" content="webkit">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
<link href="${ctx}/Content/jquery.bsgrid-1.37/merged/bsgrid.all.min.css" rel="stylesheet" />
<link rel="stylesheet" href="${ctx}/Content/lib/layui/css/layui.css">
<link rel="stylesheet" href="${ctx}/Content/css/xadmin.css" type="text/css">
<script src="${ctx}/Content/lib/layui/layui.js" charset="utf-8"></script>
<script type="text/javascript" src="${ctx}/Content/js/xadmin.js"></script>
</head>
<body layadmin-themealias="default">

  <div class="layui-fluid">
    <div class="layui-card">
      <div class="layui-form layui-card-header layuiadmin-card-header-auto" style="padding:15px">
        <div class="layui-form-item">
          <div class="layui-inline">
            <label class="layui-form-label">用户名</label>
            <div class="layui-input-block">
              <input type="text" name="username" id="username" placeholder="请输入" autocomplete="off" class="layui-input">
            </div>
          </div>
           <div class="layui-inline">
            <label class="layui-form-label">电话</label>
            <div class="layui-input-block">
              <input type="text" name="number" id="number" placeholder="请输入" autocomplete="off" class="layui-input">
            </div>
          </div>
          <div class="layui-inline">
            <label class="layui-form-label">性别</label>
            <div class="layui-input-block">
              <select name="sex" id="sex" class="layui-input" style="padding:10px"">
                <option>不限</option>
                <option>男</option>
                <option>女</option>
              </select>
            </div>
          </div>
           <div class="layui-inline">
            <label class="layui-form-label">借阅证</label>
            <div class="layui-input-block">
              <select name="isHave" id="isHave" class="layui-input" style="padding:10px"">
                <option>不限</option>
                <option>审核通过</option>
                <option>待审核</option>
              </select>
            </div>
          </div>
          <div class="layui-inline">
            <button class="layui-btn layuiadmin-btn-useradmin" onclick="selectUser()" lay-submit="" lay-filter="LAY-user-front-search">
              <i class="layui-icon layui-icon-search layuiadmin-button-btn"></i>
            </button>
          </div>
        </div>
      </div>
      
      <div class="layui-card-body">
        <div style="padding-bottom: 10px;">
          <button class="layui-btn layuiadmin-btn-useradmin" data-type="batchdel" id="Delete">删除</button>
          <button class="layui-btn layuiadmin-btn-useradmin" onclick="xadmin.open('添加管理员','${ctx}/jsp/userfrom.jsp?-1',500,350)">添加</button>
        </div>
        <div class="tab-content">
	        <div class="tab-pane active fade in " id="rule1">			
	            <table id="tbUserMessage" class="table table-striped table-bordered table-condensed">
                    <tr>
                        <th w_num="total_line">序号</th>
                        <th w_check="true">选取</th>
                        <th w_index="user_id" w_hidden="true"></th>
                        <th w_index="user_information_id" w_hidden="true"></th>
                        <th w_index="user_name">用户名称</th>
                        <th w_render="sex">性别</th>
                        <th w_index="sex" w_hidden="true">性别	</th>
                        <th w_index="number">电话</th>
                        <th w_render="card">借阅证</th>
                        <th w_index="is_borrow_card" w_hidden="true">借阅证</th>
                        <th w_render="operation">操作</th>
                    </tr>
	            </table>
	        </div>
	    </div>
      </div>
    </div>
  </div>
<script src="${ctx}/Content/bootstrap-3.3.7-dist/js/jquery-3.2.1.min.js"></script>
<script src="${ctx}/Content/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
<link href="${ctx}/Content/jquery.bsgrid-1.37/merged/bsgrid.all.min.css" rel="stylesheet" />
<script src="${ctx}/Content/jquery.bsgrid-1.37/js/lang/grid.zh-CN.min.js"></script>
<script src="${ctx}/Content/jquery.bsgrid-1.37/merged/bsgrid.all.min.js"></script>
<script src="${ctx}/Content/layer/layer.js"></script>
<script src="${ctx}/Content/js/jquery.form.js"></script>
<script src="${ctx}/Content/js/customfunction.js"></script>
<script src="${ctx}/Content/js/combobox.js"></script>
<script>
	var tbUserMessage;
    jQuery(document).ready(function($) {
		//初始化 bbsgrid tableSkinDetails
      tbUserMessage = $.fn.bsgrid.init('tbUserMessage', {
          url: "${ctx}/bookBorrowCardAction!bsUserMessage.action",
          autoLoad: false,
          stripeRows: true,//隔行变色
          rowHoverColor: true,//划过行变色
          pageSize: 10,
          pageAll: false,
          pageSizeSelect: true,//是否选择分页页数下拉框
          pagingLittleToolbar: true,//精简的图标按钮分页工具条
          pagingToolbarAlign: "left",//分页工具条的显示位置
          displayBlankRows: false,//不显示空白行
          event: {
                 customRowEvents: {//自定义行事件
                     //(record行记录值,rowIndex行索引值,trObj:tr目标,options选择的东西)
                     click: function (record, rowIndex, trObj, options) {
                         Check("#tbUserMessage tr", rowIndex + 1);
                     }
                 }
             }
      });
       selectUser();
	});
	function selectUser(){
		var username = $("#username").val();
		var sex = $("#sex").val();
		var number = $("#number").val();
		var isHave = $("#isHave").val();
		var type = "manage";
		if (username == undefined) {
			username = "";
		}
		if (sex == undefined || sex=="不限") {
			sex = "";
		}else if(sex=="男"){
			sex=0;
		}
		else if(sex=="女"){
			sex=1;
		}
		if (isHave == undefined || isHave=="不限") {
			isHave = "";
		}else if(isHave=="审核通过"){
			isHave=0;
		}
		else if(isHave=="待审核"){
			isHave=1;
		}
		if (number == undefined) {
			number = "";
		}
		tbUserMessage.search({user_name: username, sex: sex,is_borrow_card: isHave, number: number, type: type });
	}
	$("#Delete").click(function () {
		$.ajaxSettings.async=false;
        var Check = $("#tbUserMessage input[type='checkbox']:checked");
        var ReturnLength = 0;
        if (Check.length>0) {
            layer.confirm("是否要删除选中的数据？", {
                icon: 3,
                btn: ["确定", "取消"]
            }, function (layerIndex) {
                //关闭对话框
                layer.close(layerIndex);
                //遍历选中的要删除的数据
                for (var i = 0; i < Check.length; i++) {
                    //获取单元格值，根据行记录值及列index
                    var rowIndex = $("#tbUserMessage input[type='checkbox']").index(Check[i]);
                    var userid = tbUserMessage.getColumnValue(rowIndex, "user_id");
                    var userinforid = tbUserMessage.getColumnValue(rowIndex, "user_information_id");
                    
                    $.post("${ctx}/bookBorrowCardAction!deleteUser.action", { user_id: userid,user_information_id: userinforid }, function (msg) {
                        if (msg == "success") {
                            ReturnLength++;
                        }
                        else {
                            //layer.alert(msg, { icon: 2, title: "提示" });
                            layer.msg(msg,{icon: 5,time:1000});
                        }
                    });
                    
                }
                if (ReturnLength == Check.length) {
                    //提示信息
                    layer.confirm("成功删除"+ ReturnLength + "条数据！", {
                        icon: 1,
                        btn: ['确定']
                    }, function () {
                        location.reload();
                    });
                }
            });
        }
        else {
            layer.alert("请选择需要删除的数据！", { icon: 0, title: "提示", offset: "300px" });
        }
    });
    
	function sex(record) {
		var sex = record.sex;
		if (sex == 0 || sex == "0") {
		    //return "<input type='checkbox' checked/>";
		    return "<span>男</span>";
		} else {
		    //return "<input type='checkbox'/>";
		    return "<span>女</span>";
		}
	}
	function card(record) {
		var card = record.is_borrow_card;
		if (card == 0 || card == "0") {
		    //return "<input type='checkbox' checked/>";
		    return "<span>审核通过</span>";
		} else {
		    //return "<input type='checkbox'/>";
		    return "<span>待审核</span>";
		}
	}
	function operation(record) {
		var userid = record.user_id;
		return "<div class='laytable-cell-2-0-6'> <a style='color:#fff' class='layui-btn layui-btn-normal layui-btn-xs' lay-event='edit' onclick=\"xadmin.open('编辑用户','${ctx}/jsp/userfrom.jsp?" + userid + "',500,400)\"><i class='layui-icon layui-icon-edit'></i>编辑</a> </div>";
	}
</script>

</body>
</html>
