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
<title>书籍管理</title>
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
          <input type="hidden" id="userTypeId" value="">
          <input type="hidden" name="type" value="card">
          <div class="layui-inline">
            <label class="layui-form-label">书籍名称</label>
            <div class="layui-input-block">
              <input type="text" name="book_name" id="bookname" placeholder="请输入" autocomplete="off" class="layui-input">
            </div>
          </div>
           <div class="layui-inline">
            <label class="layui-form-label">作者</label>
            <div class="layui-input-block">
              <input type="text" name="book_author" id="bookauthor" placeholder="请输入" autocomplete="off" class="layui-input">
            </div>
          </div>
          <div class="layui-inline">
            <label class="layui-form-label">状态</label>
			<div class="layui-input-inline">
				<select name="bigtype" id="bookState" name="book_state" lay-verify="" class="layui-input"></select> 
			</div>
          </div>
          <div class="layui-inline">
            <button class="layui-btn layuiadmin-btn-useradmin" onclick="selectBook()" lay-submit="" lay-filter="LAY-user-front-search">
              <i class="layui-icon layui-icon-search layuiadmin-button-btn"></i>
            </button>
          </div>
        </div>
      </div>
      
      <div class="layui-card-body">
      	<div style="padding-bottom: 10px;">
          <button class="layui-btn layui-btn-danger" data-type="batchdel" id="Delete">删除</button>
          <button class="layui-btn layui-btn-warm" data-type="batchdel" id="update">修改</button>
          <button class="layui-btn layuiadmin-btn-useradmin" onclick="xadmin.open('添加书籍','${ctx}/jsp/bookInsert.jsp?-1',500,500)">添加</button>
        </div>
        <div class="tab-content">
	        <div class="tab-pane active fade in " id="rule1">			
	            <table id="tbBookMessage" class="table table-striped table-bordered table-condensed">
                    <tr>
                        <th w_num="total_line">序号</th>
                        <th w_check="true">选取</th>
                        <th w_index="book_id" w_hidden="true"></th>
                        <th w_index="book_state_id" w_hidden="true"></th>
                        <th w_index="book_name">书籍名称</th>
                        <th w_render="bookImg">图片</th>
                        <th w_index="book_img" w_hidden="true"></th>
                        <th w_index="img_path" w_hidden="true"></th>
                        <th w_index="book_type_id" w_hidden="true"></th>
                        <th w_index="book_price" w_hidden="true">价格</th>
                        <th w_render="price">价格</th>
                        <th w_index="book_author">作者</th>
                        <th w_index="book_synopsis">简介</th>
                        <th w_index="book_state_id" w_hidden="true">状态</th>
                        <th w_render="state">状态</th>
                        <th w_render="bookstate">操作</th>
                    </tr>
	            </table>
	        </div>
	    </div>
      </div>
    </div>
  </div>
<script src="${ctx}/Content/bootstrap-3.3.7-dist/js/jquery-3.2.1.min.js"></script>
<script src="${ctx}/Content/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
<script src="${ctx}/Content/jquery.bsgrid-1.37/js/lang/grid.zh-CN.min.js"></script>
<script src="${ctx}/Content/jquery.bsgrid-1.37/merged/bsgrid.all.min.js"></script>
<script src="${ctx}/Content/layer/layer.js"></script>
<script src="${ctx}/Content/js/jquery.form.js"></script>
<script src="${ctx}/Content/js/customfunction.js"></script>
<script src="${ctx}/Content/js/combobox.js"></script>
<script>
	var tbBookMessage;
    jQuery(document).ready(function($) {
		//初始化 bsgrid
      tbBookMessage = $.fn.bsgrid.init('tbBookMessage', {
          url: "${ctx}/bookMessageAction!bsBookMessage.action",
          autoLoad: false,
          stripeRows: false,//隔行变色
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
                         Check("#tbBookMessage tr", rowIndex + 1);
                     }
                 }
             }
      	});
       selectBook();
	});
	function selectBook(){
		var bookname = $("#bookname").val();
		var bookauthor = $("#bookauthor").val();
		var bookstate=$("#bookState").val();
		if (bookname == undefined) {
			bookname = "";
		}
		if (bookauthor == undefined) {
			bookauthor = "";
		}
		if (bookstate == undefined ||bookstate=="null") {
			bookstate = 0;
		}
		tbBookMessage.search({book_name: bookname, book_author: bookauthor,book_state_id:bookstate});
	}
	
	function price(record){
		return record.book_price+" $";
	}
	
	function bookImg(record){
		return "<img src=\"${ctx}/Content/bookImg/"+ record.book_id +".jpg\" width='90' height='120'/>";
		//return "<img src=" + record.img_path + " width='90' height='120'/>";
	}	
	
	
	$("#update").click(function(){
		$.ajaxSettings.async=false;
        var Check = $("#tbBookMessage input[type='checkbox']:checked");
        var ReturnLength = 0;
        if (Check.length==1) {
	        for (var i = 0; i < Check.length; i++) {
	            //获取单元格值，根据行记录值及列index
	            var rowIndex = $("#tbBookMessage input[type='checkbox']").index(Check[i]);
	            var bookid = tbBookMessage.getColumnValue(rowIndex, "book_id");
	            xadmin.open('修改书籍',"${ctx}/jsp/bookInsert.jsp?" + bookid + "",500,500);
	        }
        }
        else if(Check.length>1){
        	layer.alert("只能选择一条数据！", { icon: 0, title: "提示", offset: "300px" });
        }else {
            layer.alert("请选择需要修改的数据！", { icon: 0, title: "提示", offset: "300px" });
        }
    });
	
	$("#Delete").click(function(){
		$.ajaxSettings.async=false;
        var Check = $("#tbBookMessage input[type='checkbox']:checked");
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
                    var rowIndex = $("#tbBookMessage input[type='checkbox']").index(Check[i]);
                    var bookid = tbBookMessage.getColumnValue(rowIndex, "book_id");
                    $.post("${ctx}/bookMessageAction!deleteBook.action", { book_id: bookid }, function (msg) {
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
    
    $(function(){
    	$.post("${ctx}/bookMessageAction!selectBookState.action",function (data) {
        	$("#bookState").empty();//清空该元素
    		$("#bookState").append('<option value="null">' + "--请选择--" + '</option>');
    		for (k in data) {
        		$("#bookState").append('<option value="' + data[k].book_state_id + '">' + data[k].book_state + '</option>');
    		}
   		});
    });
    
    function set(bookid){
    	$.post("${ctx}/bookMessageAction!setBookState.action",{book_id:bookid,book_state_id:3},function(data){
    		layer.msg(data, {
                    icon: 1,
                    time:1000
                }, function () {
                   location.reload();
                });
    	});
    }
    function set1(bookid){
    	$.post("${ctx}/bookMessageAction!setBookState.action",{book_id:bookid,book_state_id:4},function(data){
    		layer.msg(data, {
                    icon: 1,
                    time:1000
                }, function () {
                   location.reload();
                });
    	});
    }
    function bookstate(record){
    	var bookid = record.book_id;
    	return "<div style='margin:0 -20px;' class='layui-table-cell laytable-cell-2-0-6'> <a style='color:#fff' class='layui-btn layui-btn-normal layui-btn-xs' lay-event='edit' onclick='set("+bookid+")'\"><i class='layui-icon layui-icon-edit'></i>丢失</a>  <a style='color:#fff' class='layui-btn layui-btn-danger layui-btn-xs' onclick='set1("+bookid+")' lay-event='del'><i class='layui-icon layui-icon-set'></i>报废</a>  </div>";
    }
     function state(record){
    	var bookStateId = record.book_state_id;
    	var state;
    	$.ajaxSettings.async = false;
    	$.post("${ctx}/bookMessageAction!selectBookStateById.action",{book_state_id:bookStateId},function(data){
    		state=data.book_state;
    	});
    	return state;
    }
</script>

</body>
</html>
