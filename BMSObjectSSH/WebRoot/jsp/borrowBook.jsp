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
<title>借书管理</title>
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
         	 <span class="datetxt">开始日期：</span><input type="text" class="dateinput dateicon" id="inpstart" readonly>
         	 <span class="datetxt">结束日期：</span><input type="text" class="dateinput dateicon" id="inpend" readonly>
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
                        <th w_index="book_id" w_hidden="true"></th>
                        <th w_index="user_name">用户名称</th>
                        <th w_index="borrow_day">借阅天数</th>
                        <th w_render="time">开始时间</th>
                        <th w_index="borrow_time" w_hidden="true">开始时间</th>
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
		tbBookBorrow.search({book_name: bookname, user_name: username,inpstart:inpstart,inpend:inpend,book_state_id:2});
	}
    function set(borrowid,bookid){
    	$.post("${ctx}/bookBrOrReAction!setReturnBook.action", { borrow_id: borrowid,book_id:bookid }, function (data) {
           	layer.msg(data, {
                    icon: 1,
                    time:1000
                }, function () {
                   location.reload();
                });
          });
    }
	
	function time(record) {
		var date = record.borrow_time;
        return dateToString(date,'yyyy-MM-dd HH:mm:ss');
	}
	function operation(record) {
		var borrowid = record.borrow_id;
		var bookid = record.book_id;
       	return "<div class='laytable-cell-2-0-6'> <a style='color:#fff' class='layui-btn layui-btn-normal layui-btn-xs' lay-event='edit' onclick='set("+borrowid+','+bookid+")'\"><i class='layui-icon layui-icon-edit'></i>归还</a></div>";
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
 <script type="text/javascript">
    var start = {}, end = {};
    jeDate('#inpstart',{
        format: 'YYYY-MM-DD hh:mm:ss',
        minDate: '2017-06-16 00:00:00', //设定最小日期为当前日期
        maxDate: function (that) {
            //that 指向实例对象
            return jeDate.valText(that.valCell) == "" ? jeDate.nowDate({DD:0}) : start.maxDate;
        }, //设定最大日期为当前日期
        donefun: function(obj){
            end.minDate = obj.val; //开始日选好后，重置结束日的最小日期
            jeDate("#inpend",LinkageEndDate(false));
        }
    });
    jeDate('#inpend',LinkageEndDate);
    function LinkageEndDate(istg) {
        return {
            trigger : istg || "click",
            format: 'YYYY-MM-DD hh:mm:ss',
            minDate: function (that) {
                //that 指向实例对象
                var nowMinDate = jeDate.valText('#inpstart') == "" && jeDate.valText(that.valCell) == "";
                return nowMinDate ? jeDate.nowDate({DD:0}) : end.minDate ;
            }, //设定最小日期为当前日期
            maxDate: '2099-06-16 23:59:59', //设定最大日期为当前日期
            donefun: function(obj){
                start.maxDate = obj.val; //将结束日的初始值设定为开始日的最大日期
            }
        };    
    }
    </script>
</body>
</html>
