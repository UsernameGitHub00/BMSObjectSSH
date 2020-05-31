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
<meta name="viewport" content="width=device-width" />
<title>类型管理</title>
<link href="${ctx}/Content/zTree_v3-master/css/demo.css" rel="stylesheet" /><!-- @*树状控件*@ -->
<link href="${ctx}/Content/zTree_v3-master/css/zTreeStyle.css" rel="stylesheet" /><!-- @*树状控件*@ -->
<link href="${ctx}/Content/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet" />
<link href="${ctx}/Content/jquery.bsgrid-1.37/merged/bsgrid.all.min.css" rel="stylesheet" />
</head>
<body style="background-color:#eee;">
    <style type="text/css">
         ul.ztree {
            margin-top: 0px;
            border: 0;
            background: #fff; 
            width: 100%; 
            height: 360px;
            overflow-y: auto;
            overflow-x: auto; 
        }
        li {
            list-style: none;
            font-size:14px;
        }

        .container {
            width: 100%;
            padding: 0;
        }

        .panel-heading {
            font-size: 16px;
            /*text-align: center;*/
        }

        .panel-body {
            padding-top: 0;
        }

            .panel-body label {
                font-weight: normal;
                font-size: 16px;
            }

        .setPadding {
            border: 1px solid #eee;
            padding: 5px 0 5px 10px;
        }

            .setPadding button {
                padding: 4px 6px;
                font-size: 12px;
            }

        .form-horizontal label {
            font-size: 12px;
        }

        .form-horizontal select, .form-horizontal input {
            height: 26px;
            padding: 0;
        }

        .reset {
            padding: 0;
        }

        .examineeInfor {
            border: 1px solid #eee;
            padding: 0;
        }

        .h5 {
            margin: 0;
            background: #eef;
            padding: 6px 10px;
        }

        .examineeInfor th, .examineeInfor td {
            font-weight: normal;
            text-align: center;
        }

        #examineeInfor th {
            padding: 4px 8px;
        }

        .modal-content label {
            font-weight: normal;
            font-size: 18px;
        }

        .img-box {
            border: 1px solid #eee;
            padding: 10px;
        }

        .modal-dialog {
            width: 400px;
        }

        .modal .form-group {
            margin-bottom: 10px;
            margin-top: 2px;
        }

        .form-group input {
            height: 26px;
        }

        .setSex {
            position: relative;
            top: -10px;
            left: 2px;
        }

        .text-center {
            color: red;
        }

        #modExaminee .modal-dialog {
            width: 400px;
        }

        .inputs {
            border: none;
            border-radius: 5px;
            height: 28px;
            padding-left: 10px;
            font-size: 16px;
        }
    </style>
    <div class="container" style="height:650px;background-color:#fff;overflow:auto">
        <div class="panel-primary">
            <div class="col-lg-12 col-md-12 col-sm-12" style="background-color:#fff; margin-top:10px;">
                <div class="col-lg-4 col-md-4 col-sm-4" style="background-color:#fff; margin-right:0px;">
                    <ul id="myTab" class="nav nav-tabs">
                        <li class="active"><a href="#bulletin1" data-toggle="tab">基本信息类型列表</a></li>
                        <div style="display:inline-block;margin-top:5px;float:right;">
                            <button class="btn btn-info" style="font-size:12px" id="InsertBookType" type="button">新建</button>
                        </div>
                    </ul>
                </div>
                <div class="col-lg-8 col-md-8 col-sm-8" style="background-color:#fff; margin-right:0px;">
                    <ul id="myTab" class="nav nav-tabs">
                        <li class="active"><a href="#rule1" data-toggle="tab">基本信息类型列表</a></li>
                        <div style="display:inline-block;margin-top:5px;float:right;">
                            <button class="btn btn-info" style="font-size:12px" id="Insert" type="button">新建</button>
                            <button class="btn btn-info" style="font-size:12px;margin-left:0px;" type="button" id="Update">修改</button>
                            <button class="btn btn-info" style="font-size:12px" id="Delete" type="button">删除</button>
                        </div>
                    </ul>
                </div>
                <!-- 选项卡面板 -->
                <div class="col-lg-4 col-md-4 col-sm-4" style="background-color:#fff; margin-right:0px;">
                    <div id="myTabContent" class="tab-content">
                        <div class="tab-pane active fade in " id="bulletin1" style="margin:10px 0;">
                            <div style="border:1px solid #ddd;border-radius:5px;">
                                <!-- @*模态框内容*@ -->
                                <div class="modal-body">
                                    <ul id="tree" class="ztree"></ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-8 col-md-8 col-sm-8" style="background-color:#fff; margin-right:0px;">
                    <div id="myTabContent" class="tab-content">
                        <div class="tab-pane active fade in " id="rule1">
                            <table id="tbMessageType" class="table table-striped table-bordered table-condensed">
                                    <tr>
                                        <th w_num="total_line">序号</th>
                                        <th w_check="true">选取</th>
                                        <th w_index="book_type_id" w_hidden="true"></th>
                                        <th w_index="book_type">基本类型名称</th>
                                        <th w_render="JBXX">上级基本信息类型</th>
                                        <th w_index="book_type_id_1" w_hidden="true"></th>
                                    </tr>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!--  @*新增修改模态框*@  -->
    <div class="modal  bs-example-modal-sm" id="modInsertExaminee">
        <div class="modal-dialog">
            <div class="modal-content">
                <!-- @*模态框头部*@ -->
                <div class="modal-header">
                    <h4 style="text-align:center"><span class="glyphicon glyphicon-pencil" style="top:3px;"></span> 基本信息类型新增</h4>
                </div>
                <!-- @*模态框内容*@  -->
                <div class="modal-body">
                    <form class="form-horizontal" role="form" id="formInsertExaminee" action="${ctx}/bookTypeAction!insertDate.action" method="post">
                        <input type="hidden" id="MessageTypeID" name="bookType.book_type_id"/>
                        <div class="form-group">
                            <div class="col-lg-4 col-md-4 col-sm-4 " style="padding:0;text-align:right">
                                <label class="control-label" style="padding-top:4px;font-size:16px;">基本信息类型:</label>
                            </div>
                            <div class="col-lg-8 col-md-8 col-sm-8 ">
                                <div class="col-lg-10 col-md-10 col-sm-10">
                                    <input type="text" class="form-control" name="bookType.book_type" id="MessageType" style="display:inline-block;height:28px;padding: 5px; font-size:13px;" />
                                </div>
                            </div>
                        </div>
                        <div class="form-group" id="booktype">
                            <div class="col-lg-4 col-md-4 col-sm-4 " style="padding:0;text-align:right">
                                <label class="control-label" style="padding-top:4px;font-size:16px;">上级基本信息类型:</label>
                            </div>
                            <div class="col-lg-8 col-md-8 col-sm-8 ">
                                <div class="col-lg-10 col-md-10 col-sm-10">
                                    <input type="text" class="form-control" name="" id="SelectMessage" style="display:inline-block;height:28px;padding: 5px; font-size:13px;" disabled/>
                                    <input type="text" class="form-control" name="" id="SelectMessages" style="display:none;height:32px;padding: 5px; font-size:13px;" disabled />
                                    <input type="hidden" name="bookType.book_type_id_1" id="MessageTypeIDs" />
                                </div>
                                <span class="glyphicon glyphicon-plus" id="AddMessage" style="color:#337ab7;margin-top:8px;"></span>
                                <span class="glyphicon glyphicon-minus" id="ReduceMessage" style="color:#337ab7"></span>
                            </div>
                        </div>
                        <div class="form-group" style="padding:10px;text-align:center;">
                            <div class="col-lg-12 col-md-12 col-sm-12 ">
                                <!--  @*<button class="btn btn-primary" type="reset">重置</button>*@ -->
                                <button class="btn btn-primary" type="button" id="btnSaveInsert" style="display:inline-block">保存</button>
                                <button class="btn btn-primary" type="button" id="BtnEdit" style="display:none">保存</button>
                                <button class="btn btn-primary" type="button" id="SaveInsertBookType" style="display:none">保存</button>
                                <button class="btn btn-danger" data-dismiss="modal">关闭</button>
                            </div>
                        </div>
                    </form>
                </div>
            </div><!-- /.modal-content -->
        </div><!-- /.modal-dialog -->
    </div>
    <!-- @*选择基本信息类型*@ -->
    <div class="modal  bs-example-modal-sm" id="modExaminee">
        <div class="modal-dialog">
            <div class="modal-content">
                <!-- @*模态框头部*@ -->
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">
                        <span aria-hidden="true">&times;</span>
                        <span class="sr-only">Close</span>
                    </button>
                    <h5 class="modal-title">选择基本信息类型</h5>
                </div>
                <!-- @*模态框内容*@ -->
                <div class="modal-body">
                    <ul id="trees" class="ztree"></ul>
                </div>
                <div class="form-group">
                    <button id="saveInfor">确定</button>
                </div>
            </div>
        </div>
    </div>
    <script src="${ctx}/Content/bootstrap-3.3.7-dist/js/jquery-3.2.1.min.js"></script>
    <!-- @*<script src="~/Content/zTree_v3-master/js/jquery.ztree.core.js"></script>*@@*树状控件*@ -->
    <script src="${ctx}/Content/zTree_v3-master/js/jquery.ztree.core.js"></script>
    <!-- @*<script src="~/Content/zTree_v3-master/js/jquery.ztree.excheck.min.js"></script>*@@*树状控件勾选框*@ -->
    <script src="${ctx}/Content/zTree_v3-master/js/jquery.ztree.excheck.min.js"></script>
    <script src="${ctx}/Content/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
    <link href="${ctx}/Content/jquery.bsgrid-1.37/merged/bsgrid.all.min.css" rel="stylesheet" />
    <script src="${ctx}/Content/jquery.bsgrid-1.37/js/lang/grid.zh-CN.min.js"></script>
    <script src="${ctx}/Content/jquery.bsgrid-1.37/merged/bsgrid.all.min.js"></script>
    <script src="${ctx}/Content/layer/layer.js"></script>
    <script src="${ctx}/Content/js/jquery.form.js"></script>
    <script src="${ctx}/Content/js/customfunction.js"></script>
    <script src="${ctx}/Content/js/combobox.js"></script>
    <script type="text/javascript">
    	var tbMessageType;
        jQuery(document).ready(function($) {
			//初始化 bbsgrid tableSkinDetails
	        tbMessageType = $.fn.bsgrid.init('tbMessageType', {
	            url: "${ctx}/bookTypeAction!bookTypeList.action",
	            autoLoad: true,
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
                            Check("#tbMessageType tr", rowIndex + 1);
                        }
                    }
                }
	        });
		});

         //树状结构
        $(function () {
            var setting = {
                check: {
                    enable: true,
                    chkStyle: "checkbox",
                    chkboxType: { "Y": "", "N": "" }
                },
                data: {
                    key: {
                        //将treeNode的ItemName属性当做节点名称
                        name: "book_type"
                    },
                    simpleData: {
                        //是否使用简单数据模式
                        enable: true,
                        //当前节点id属性
                        idKey: "book_type_id",
                        //当前节点的父节点id属性
                        pIdKey: "book_type_id_1",
                        ////用于修正根节点父节点数据，即pIdKey指定的属性值
                        //rootPId: 0
                    }
                },
                view: {
                    //是否支持同时选中多个节点
                    selectedMulti: false
                }
            };
            $.post("${ctx}/bookTypeAction!treeDate.action", function (date) {
                var treeObj = $.fn.zTree.init($("#tree"), setting, date);
                //默认展开所有节点
                treeObj.expandAll(false);
            });
        }); 

        //$(function () {
        //    var time = new Date().toLocaleDateString("yyyyMMdd");
        //    $("#StateTime").val(time);
        //})
        
        $("#InsertBookType").click(function () {
            $('#modInsertExaminee .modal-header').html('<h4 style="text-align:center"><span class="glyphicon glyphicon-pencil" style="top:3px;"></span> 基本信息类型新增</h4>');
            document.getElementById("btnSaveInsert").style.display = "none";
            document.getElementById("BtnEdit").style.display = "none";
            document.getElementById("SelectMessage").style.display = "inline-block";
            document.getElementById("SelectMessages").style.display = "none";
            document.getElementById("AddMessage").style.display = "none";
            document.getElementById("ReduceMessage").style.display = "none";
            document.getElementById("booktype").style.display = "none";
            document.getElementById("SaveInsertBookType").style.display = "inline-block";
            $("#formInsertExaminee").removeAttr("action");
            $("#formInsertExaminee").attr("action", "${ctx}/bookTypeAction!insertDate.action");
            $('#formInsertExaminee').resetForm();//重置表单
            $("#modInsertExaminee").modal("show");
        });
        $("#SaveInsertBookType").click(function () {
            var MessageType = $("#MessageType").val();
            $("#MessageTypeIDs").val("0");
            var MessageTypeIDs = $("#MessageTypeIDs").val();
            if (MessageTypeIDs > -1 &&  MessageType != "") {
                //显示加载层
                var layerIndex = layer.load(0);
                //ajaxSubmit()提交表单：我们直接通过form提交的话，提交后当前页面跳转到form的action所指的页面。
                //然而，很多时候我们并不希望提交表单后页面跳转，那么，我们就可以使用ajaxSubmit(obj)来提交数据
                //ajaxSubmit(obj)方法是jQuery的一个插件jquery.form.js里面的方法，所以使用此方法需要先引入这个插件
                $("#formInsertExaminee").ajaxSubmit(function (msg) {
                    //关闭加载层
                    layer.close(layerIndex);
                    //关闭模态框
                    $("#modInsertExaminee").modal("hide");
                    if (msg == "success") {
                        //提示信息
                        layer.confirm("新增成功！", {
                            icon: 1,
                            btn: ['确定']
                        }, function () {
                            location.reload();
                        });
                    } else {
                        layer.alert(msg, { icon: 2, title: "提示", time: 3000 });
                    }
                });
            }
            else {
                layer.alert("请填写完整信息", { icon: 0, title: "提示" });
            }
        });
        //新增
        $("#Insert").click(function () {
            $('#modInsertExaminee .modal-header').html('<h4 style="text-align:center"><span class="glyphicon glyphicon-pencil" style="top:3px;"></span> 基本信息类型新增</h4>');
            document.getElementById("btnSaveInsert").style.display = "inline-block";
            document.getElementById("BtnEdit").style.display = "none";
            document.getElementById("SelectMessage").style.display = "inline-block";
            document.getElementById("SelectMessages").style.display = "none";
            document.getElementById("AddMessage").style.display = "none";
            document.getElementById("ReduceMessage").style.display = "none";
            document.getElementById("booktype").style.display = "block";
            $("#formInsertExaminee").removeAttr("action");
            $("#formInsertExaminee").attr("action", "${ctx}/bookTypeAction!insertDate.action");
            $('#formInsertExaminee').resetForm();//重置表单
            var treeObj = $.fn.zTree.getZTreeObj("tree");
            nodes = treeObj.getCheckedNodes(true);
            Type = "";
            id = "";
            if (nodes.length == 1) {
                Type += nodes[0].book_type;
                id += nodes[0].book_type_id;
                saveManager(Type, id);
                $("#modInsertExaminee").modal("show");
            }
            if (nodes.length > 1) {
                layer.alert("只能选择一条数据！", { icon: 0, title: "提示", offset: "300px" });
            }
            if (nodes.length == 0) {
                layer.alert("请选择左边的基本信息类型！", { icon: 0, title: "提示", offset: "300px" });
            }
            function saveManager(Type, id) {
                $("#SelectMessage").val(Type);
                $("#MessageTypeIDs").val(id);
                $("#modInsertExaminee").modal("hide");
            }
        });
        //新增保存
        $("#btnSaveInsert").click(function () {
            var MessageType = $("#MessageType").val();
            var MessageTypeIDs = $("#MessageTypeIDs").val();
            if (MessageTypeIDs > 0 &&  MessageType != "") {
                //显示加载层
                var layerIndex = layer.load(0);
                //ajaxSubmit()提交表单：我们直接通过form提交的话，提交后当前页面跳转到form的action所指的页面。
                //然而，很多时候我们并不希望提交表单后页面跳转，那么，我们就可以使用ajaxSubmit(obj)来提交数据
                //ajaxSubmit(obj)方法是jQuery的一个插件jquery.form.js里面的方法，所以使用此方法需要先引入这个插件
                $("#formInsertExaminee").ajaxSubmit(function (msg) {
                    //关闭加载层
                    layer.close(layerIndex);
                    //关闭模态框
                    $("#modInsertExaminee").modal("hide");
                    if (msg == "success") {
                        //提示信息
                        layer.confirm("新增成功！", {
                            icon: 1,
                            btn: ['确定']
                        }, function () {
                            location.reload();
                        });
                    } else {
                        layer.alert(msg, { icon: 2, title: "提示", time: 3000 });
                    }
                });
            }
            else {
                layer.alert("请填写完整信息", { icon: 0, title: "提示" });
            }
        });

        //修改
        $("#Update").click(function () {
            var check = $("#tbMessageType input[type='checkbox']:checked");
            //check.length判断选中的个数
            if (check.length == 0) {
                //0警告；1成功；2失败；3问号；4锁；5难过表情；6微笑表情
                layer.alert("请选择一条信息!", { icon: 0, title: '提示' });
            }
            if (check.length > 1) {
                layer.alert("只能选择一条信息!", { icon: 0, title: '提示' });
            }
            if (check.length == 1) {
                $('#modInsertExaminee .modal-header').html('<h4 style="text-align:center"><span class="glyphicon glyphicon-pencil" style="top:3px;"></span> 基本信息类型修改</h4>');
                document.getElementById("btnSaveInsert").style.display = "none";
                document.getElementById("BtnEdit").style.display = "inline-block";
                document.getElementById("SelectMessage").style.display = "none";
                document.getElementById("SelectMessages").style.display = "inline-block";
                document.getElementById("AddMessage").style.display = "inline-block";
                document.getElementById("ReduceMessage").style.display = "inline-block";
                document.getElementById("booktype").style.display = "block";
                document.getElementById("SaveInsertBookType").style.display = "none";
                
                $('#formInsertExaminee').resetForm();//重置表单
                $("#formInsertExaminee").removeAttr("action");
                $("#formInsertExaminee").attr("action", "${ctx}/bookTypeAction!updateBookType.action");
                var rowIndex = $("#tbMessageType input[type='checkbox']").index(check[0]);
                //var rowIndex = tbMessageType.getSelectedRowIndex();//获取选中行的索引值, 行索引从0开始, 如果没有选择则返回-1
                var MessageTypeIDs = tbMessageType.getColumnValue(rowIndex, "book_type_id_1");//获取单元格值, 根据行索引值及列MessageTypeIDs
                	if (MessageTypeIDs==0) {
						 layer.alert("最大级别不可修改！", { icon: 0, title: "提示" });
					}else{
						$.post("${ctx}/bookTypeAction!selectMessage.action", { book_type_id: MessageTypeIDs }, function (data) {
							$("#SelectMessages").val(data.book_type);
							$("#modInsertExaminee").modal("show");
						});
					}
                
                var MessageTypeID = tbMessageType.getColumnValue(rowIndex, "book_type_id");//获取单元格值, 根据行索引值及列MessageTypeID
                $("#MessageTypeID").val(MessageTypeID);
                $.post("${ctx}/bookTypeAction!selectMessage.action", { book_type_id: MessageTypeID }, function (data) {
                    $("#MessageTypeIDs").val(data.book_type_id_1);
                    $("#MessageType").val(data.book_type);
                });
            }
        });
        //选择基本信息模态框
        $("#AddMessage").click(function () {
            //树状结构
            var setting = {
                check: {
                    enable: true,
                    chkStyle: "checkbox",
                    chkboxType: { "Y": "", "N": "" }
                },
                data: {
                    key: {
                        //将treeNode的ItemName属性当做节点名称
                        name: "book_type"
                    },
                    simpleData: {
                        //是否使用简单数据模式
                        enable: true,
                        //当前节点id属性
                        idKey: "book_type_id",
                        //当前节点的父节点id属性
                        pIdKey: "book_type_id_1",
                        ////用于修正根节点父节点数据，即pIdKey指定的属性值
                        //rootPId: 0
                    }
                },
                callback: {
                    onCheck: onCheck
                },
                view: {
                    //是否支持同时选中多个节点
                    selectedMulti: false
                }
            };

            //获取勾选的数据
            function onCheck(e, treeId, treeNode) {
                var treeObj = $.fn.zTree.getZTreeObj("trees");
                nodes = treeObj.getCheckedNodes(true);
                Type = "";
                id = "";

                for (var i = 0; i < nodes.length; i++) {
                    Type += nodes[i].book_type;  //+ ","
                    id += nodes[i].book_type_id;  //+ ","
                    //alert(nodes[i].id); //获取选中节点的值
                }
                saveManager(Type, id);
                function saveManager(Type, id) {
                    $("#SelectMessages").val(Type);
                    $("#MessageTypeIDs").val(id);
                    $("#modExaminee").modal("hide");
                }
            }

            $.post("${ctx}/bookTypeAction!treeDate.action", function (date) {
                var treeObj = $.fn.zTree.init($("#trees"), setting, date);
                //默认展开所有节点
                treeObj.expandAll(false);
            });
            $('#modExaminee .modal-title').html('<h5>选择基本信息类型</h5>');
            $('#modExaminee .form-group').html('<button data-dismiss="modal">关闭</button>');
            $("#modExaminee").modal("show");
        });
        //清空
        $("#ReduceMessage").click(function () {
            $("#SelectMessages").val("");
            $("#MessageTypeIDs").val("");
        });
        //修改保存
        $("#BtnEdit").click(function () {
            var MessageTypeID = $("#MessageTypeID").val();
            var MessageType = $("#MessageType").val();
            var MessageTypeIDs = $("#MessageTypeIDs").val();
            if (MessageTypeID > 0 && MessageTypeIDs > 0 &&  MessageType != "") {
                //显示加载层
                var layerIndex = layer.load(0);
                //ajaxSubmit()提交表单：我们直接通过form提交的话，提交后当前页面跳转到form的action所指的页面。
                //然而，很多时候我们并不希望提交表单后页面跳转，那么，我们就可以使用ajaxSubmit(obj)来提交数据
                //ajaxSubmit(obj)方法是jQuery的一个插件jquery.form.js里面的方法，所以使用此方法需要先引入这个插件
                $("#formInsertExaminee").ajaxSubmit(function (msg) {
                    //关闭加载层
                    layer.close(layerIndex);
                    //关闭模态框
                    $("#modInsertExaminee").modal("hide");
                    if (msg == "success") {
                        //提示信息
                        layer.msg("修改成功！", {
                            icon: 1,
                            time:1000
                        }, function () {
                            location.reload();
                        });
                        ////提示信息
                        //layer.alert("修改成功！", { icon: 1, title: "提示", time: 3000 });
                        ////刷新表单
                        //tbMessageType.refreshPage();
                    } else {
                        layer.alert(msg, { icon: 2, title: "提示", time: 3000 });
                    }
                });
            }
            else {
                layer.alert("请填写完整信息", { icon: 0, title: "提示" });
            }
        });

        //删除
        $("#Delete").click(function () {
            var Check = $("#tbMessageType input[type='checkbox']:checked");
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
                        var rowIndex = $("#tbMessageType input[type='checkbox']").index(Check[i]);
                        var MessageTypeID = tbMessageType.getColumnValue(rowIndex, "book_type_id");
                        $.post("${ctx}/bookTypeAction!deleteBookType.action", { book_type_id: MessageTypeID }, function (msg) {
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

        //上级基本信息类型
        function JBXX(record) {
            var Type;
            $.ajaxSettings.async = false;
            var MessageTypeIDs = record.book_type_id_1;
            if (MessageTypeIDs>0) {
                $.post("${ctx}/bookTypeAction!selectMessage.action", { book_type_id: MessageTypeIDs }, function (data) {
                    Type = data.book_type;
                });
                return Type;
            } else {
                return "已是最高级";
            }
        }

    </script>
</body>
</html>
