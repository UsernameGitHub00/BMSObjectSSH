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
<title>还书管理</title>
<meta name="renderer" content="webkit">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
<link href="${ctx}/Content/jquery.bsgrid-1.37/merged/bsgrid.all.min.css" rel="stylesheet" />
<link rel="stylesheet" href="${ctx}/Content/lib/layui/css/layui.css">
<link rel="stylesheet" href="${ctx}/Content/css/xadmin.css" type="text/css">
<link rel="stylesheet" href="${ctx}/Content/date/jedate.css" type="text/css"></link>
<script src="${ctx}/Content/lib/layui/layui.js" charset="utf-8"></script>
<script type="text/javascript" src="${ctx}/Content/js/xadmin.js"></script>
<script type="text/javascript" src="${ctx}/Content/date/jedate-6.5.0.js"></script>
<style type="text/css">
	.dateicon {background-image: url("data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABwAAAASAgMAAAA1aVZ3AAAACVBMVEUAAAD///9nyrNdI4MmAAAAAXRSTlMAQObYZgAAAChJREFUCNdjWAUCCxjg9DQgtTKBAUN8aigQJGCho6KiYDSJ8ggaYR8Ao74zAKjm+cYAAAAASUVORK5CYII="); background-repeat:no-repeat;background-position: right center;}
	.dateinput {width: 175px;height: 38px;line-height: 20px;border: 1px #ddd solid;border-radius:4px;padding: 5px;background-color: #fff;float: left;font-size: 14px;}
	.datetxt { height: 30px;  line-height: 30px;  display: block;  float: left;margin-top:5px;  }
	.datewarp{padding-left: 0px;padding-right:100px;}
        @media (max-width:1400px){
            .datewarp{padding-left: 0px;padding-right:0px;}
        }
</style>
</head>
<body layadmin-themealias="default">

  <div class="layui-fluid">
    <div class="layui-card">
      <div class="layui-form layui-card-header layuiadmin-card-header-auto" style="padding:15px">
        <div class="layui-form-item">
          <input type="hidden" id="userTypeId" value="${User.getUser_type_id()}">
          <div class="layui-inline">
            <label class="layui-form-label">用户名</label>
            <div class="layui-input-block">
              <input type="text" name="username" id="username" placeholder="请输入" autocomplete="off" class="layui-input">
            </div>
          </div>
          <div class="layui-inline">
            <label class="layui-form-label">书名</label>
            <div class="layui-input-block">
              <input type="text" name="bookname" id="bookname" placeholder="请输入" autocomplete="off" class="layui-input">
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
        <div class="tab-content">
	        <div class="tab-pane active fade in " id="rule1">			
	            <table id="tbBookBorrow" class="table table-striped table-bordered table-condensed">
                    <tr>
                        <th w_num="total_line">序号</th>
                        <th w_check="true">选取</th>
                        <th w_index="borrow_id" w_hidden="true"></th>
                        <th w_index="book_name">书名</th>
                        <th w_index="user_name">用户名称</th>
                        <th w_index="borrow_day">借阅天数</th>
                        <th w_render="time">开始时间</th>
                        <th w_index="borrow_time" w_hidden="true">开始时间</th>
                        <th w_render="time1">归还时间</th>
                        <th w_index="return_time" w_hidden="true">归还时间</th>
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
	var tbBookBorrow;
    jQuery(document).ready(function($) {
		//初始化 bbsgrid tableSkinDetails
      tbBookBorrow = $.fn.bsgrid.init('tbBookBorrow', {
          url: "${ctx}/bookBrOrReAction!selectBorrow.action",
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
                         Check("#tbBookBorrow tr", rowIndex + 1);
                     }
                 }
             }
      });
       selectUser();
	});
	function selectUser(){
		var bookname = $("#bookname").val();
		var username = $("#username").val();
		var inpstart = $("#inpstart").val();
		var inpend = $("#inpend").val();
		
		if (username == undefined) {
			username = "";
		}
		if (bookname == undefined) {
			bookname = "";
		}
		if (inpstart == undefined) {
			inpstart = "";
		}
		if (inpend == undefined) {
			inpend = "";
		}
		
		tbBookBorrow.search({book_name: bookname, user_name: username,inpstart:inpstart,inpend:inpend,book_state_id:1});
	}
	function time(record) {
		var date = record.borrow_time;
        return dateToString(date,'yyyy-MM-dd HH:mm:ss');
	}
	function time1(record) {
		var date = record.return_time;
		if(date==""||date==null){
			return "---";
		}else{
        	return dateToString(date,'yyyy-MM-dd HH:mm:ss');
		}
	}
	function dateToString(time, format){ 
		var t = new Date(time); 
		var tf = function(i){
			return (i < 10 ? '0' : '') + i;
		}; 
		return format.replace(/yyyy|MM|dd|HH|mm|ss/g, function(a){ 
			switch(a){ 
			case 'yyyy': 
			return tf(t.getFullYear()); 
			break; 
			case 'MM': 
			return tf(t.getMonth() + 1); 
			break; 
			case 'mm':
			return tf(t.getMinutes()); 
			break; 
			case 'dd': 
			return tf(t.getDate()); 
			break; 
			case 'HH': 
			return tf(t.getHours()); 
			break; 
			case 'ss': 
			return tf(t.getSeconds()); 
			break; 
		}; 
		}); 
	}; 
</script>
</body>
</html>
