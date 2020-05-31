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
<base href="<%=basePath%>"> 

<title>添加书籍</title> 
<meta http-equiv="pragma" content="no-cache"> 
<meta http-equiv="cache-control" content="no-cache"> 
<meta http-equiv="expires" content="0"> 
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3"> 
<meta http-equiv="description" content="This is my page"> 
<link rel="stylesheet" href="${ctx}/Content/lib/layui/css/layui.css" type="text/css"></link>
<link rel="stylesheet" href="${ctx}/Content/layer/mobile/need/layer.css" type="text/css"></link>
<!-- 
<link rel="stylesheet" type="text/css" href="styles.css"> 
--> 
</head> 

<body>
<div class="layui-form" lay-filter="layuiadmin-form-useradmin"
	id="layuiadmin-form-useradmin" style="padding:5px 0 0 0;">
	<input name="" id="bookid" style="display:none;">
	<form class="layui-form" action="${ctx}/bookMessageAction!insertBook.action" method="POST" enctype="multipart/form-data" id="from">
		<div>
            <div style="padding:5px 150px;">
                <img src="" alt="" width="120" height="150" id="IimgPicture" style="display:none;" />
                <input type="file" id="file" name="upFile" style="padding:5px 0;"/>
            </div>
        </div>
		<div class="layui-form-item">
			<label class="layui-form-label">书名</label>
			<div class="layui-input-inline">
				<input type="text" name="book_name" id="bookname" lay-verify="required"
					placeholder="请输入书籍名" autocomplete="off" class="layui-input">
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">价格</label>
			<div class="layui-input-inline">
				<input type="text" name="book_price" id="bookprice" lay-verify="required"
					placeholder="请输入价格" autocomplete="off" class="layui-input">
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">作者</label>
			<div class="layui-input-inline">
				<input type="text" name="book_author" id="bookauthor" lay-verify="required"
					placeholder="请输入作者" autocomplete="off" class="layui-input">
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">简介</label>
			 <div class="layui-input-block">
				<textarea name="book_synopsis" id="booksynopsis" placeholder="请输入内容" class="layui-textarea" style="width:250px;"></textarea>
			</div>
		</div>
		<div class="layui-form-item" lay-filter="sex">
			<label class="layui-form-label">类型</label>
			<div class="layui-input-inline" style="width:90px;">
				<select name="bigtype" id="bigtype" lay-verify="" class="layui-input"></select> 
			</div>
			<div class="layui-input-inline" style="width:90px;">
				<select name="book_type_id" id="mintype" lay-verify="" class="layui-input"></select> 
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
</body> 
<script src="${ctx}/Content/bootstrap-3.3.7-dist/js/jquery-2.0.3.min.js"></script>
<script type="text/javascript" src="${ctx}/Content/js/jquery.form.js"></script>
<script src="${ctx}/Content/layer/layer.js"></script>
<script type="text/javascript" src="${ctx}/Content/js/customfunction.js"></script>
<script type="text/javascript">
	$(function(){
	  var url = this.location.href;
      var bookid = url.split("?")[1];
      if (bookid == "-1") {
      	//新增
      	document.getElementById("insert").style.display = "inline-block";
      	document.getElementById("update").style.display = "none";
      	document.getElementById("IimgPicture").style.display = "none";
      	$("#from").attr("action","${ctx}/bookMessageAction!insertBook.action");
      	createSelect("bigtype", "${ctx}/bookTypeAction!selectBookTypeById.action",0);
      }else{
      	//修改
        document.getElementById("insert").style.display = "none";
        document.getElementById("update").style.display = "inline-block";
        $("#from").attr("action","${ctx}/bookMessageAction!updateBook.action");
      	//清空图片框
        $("#IimgPicture").attr("src", "");
        document.getElementById("IimgPicture").style.display = "block";
        //显示图片
        var url="${ctx}/Content/bookImg/"+bookid+".jpg";
        $("#IimgPicture").attr("src", url);
        $.ajaxSettings.async = false;
        $.post("${ctx}/bookMessageAction!selectBook.action",{book_id:bookid}, function (data) {
      		 $("#bookid").val(data.book_id);
      		 $("#bookname").val(data.book_name);
      		 $("#bookprice").val(data.book_price);
      		 $("#bookauthor").val(data.book_author);
      		 $("#booksynopsis").val(data.book_synopsis);
      		 $.post("${ctx}/bookTypeAction!selectBookTypeById.action",{book_type_id_1:0}, function (data1) {
            	 //绑定下拉框
           		 selectLoadData("bigtype", data1);
            	 //确定的值
            	 $.post("${ctx}/bookTypeAction!selectMessage.action",{book_type_id:data.book_type_id}, function (data3) { 
            	 	$("#bigtype").val(data3.book_type_id_1);
            	 	$.post("${ctx}/bookTypeAction!selectBookTypeById.action", { book_type_id_1: data3.book_type_id_1 }, function (data2) {
            			selectLoadData("mintype", data2);
            			$("#mintype").val(data.book_type_id);
        			});
 				});
         	});
       	});
	}
	});
	$("#bigtype").change(function () {
        //获取ID
        var bookid = $("#bigtype").val();
        
        createSelect("mintype", "${ctx}/bookTypeAction!selectBookTypeById.action",bookid);
    });
	$("#file").change(function () {
		document.getElementById("IimgPicture").style.display = "block";
    });
	//FileReader接口提供了一个异步的API，通过这个API可以从浏览器中异步访问文件系统中的数据。因此，FileReader接口可以读取文件中的数据，并将读取的数据放入到内存中去
	//选择照片:用FileReader对象来读取本地数据，并且将数据结果赋值给image的src、
	//图片文件 正则表达式过滤
	var imgReaderI = new FileReader();//FileReader()接口：用于读取文件
	//图片文件： 正则表达式过滤（此表达式是用来判断上传的文件是否是一张图片）
	regexImageFilter = /^(?:image\/bmp|image\/png|image\/jpeg|image\/jpg)$/i;
	//调用FileReader接口的onload方法，回调函数得到的evt是图片的URL链接
	imgReaderI.onload = function (evt) {
	    //将数据结果赋值给image的src
	    $("#IimgPicture").attr('src', evt.target.result);
	};
	//获取“选择文件”的按钮，调用改变事件
	$("#file").change(function () {
	    //获取通过“选择文件”的按钮上传的文件
	    //prop添加属性名称（跟attr属性一样是给标签添加属性，但是它们是有区别的），加载image标签中
	    var imgfFile = $("#file").prop('files')[0];
	    //调用正则表达式过滤图片
	    if (!regexImageFilter.test(imgfFile.type)) {
	        layer.msg('选择的不是一个有效的图片文件', { icon: 0 });
	    } //readAsDataURL()方法可以获取API异步读取的文件数据，另存为数据URL;将该URL绑定到img标签的src属性上，就可以实现图片的上传预览效果了。
	    imgReaderI.readAsDataURL(imgfFile);
	
	});
	$("#insert").click(function(){
		var bookname = $("#bookname").val();
		var bookprice = $("#bookprice").val();
		var bookauthor = $("#bookauthor").val();
		var booksynopsis = $("#booksynopsis").val();
		var mintype =$("#mintype").val();
		var Picture = $('#from [name="upFile"]').prop('files');//照片
     	if (bookname!=""&&bookname!=null&&bookprice!=""&&bookprice!=null&&
     		bookauthor!=""&&bookauthor!=null&&booksynopsis!=""&&booksynopsis!=null&&
     		mintype!=""&&mintype!=null) {
			$("#from").ajaxSubmit(function(data){
				 layer.msg(data, {
	                	icon: 1,
	               	 	time:1000
	            	},function(){
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
	$("#update").click(function(){
		var bookid = $("#bookid").val();
		var bookname = $("#bookname").val();
		var bookprice = $("#bookprice").val();
		var bookauthor = $("#bookauthor").val();
		var booksynopsis = $("#booksynopsis").val();
		var mintype =$("#mintype").val();
		var Picture = $('#from [name="upFile"]').prop('files');//照片
     	if (bookname!=""&&bookname!=null&&bookprice!=""&&bookprice!=null&&
     		bookauthor!=""&&bookauthor!=null&&booksynopsis!=""&&booksynopsis!=null&&
     		mintype!=""&&mintype!=null) {
			$("#from").ajaxSubmit(function(data){
				 layer.msg(data, {
	                	icon: 1,
	               	 	time:1000
	            	},function(){
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
</script>
</html> 
