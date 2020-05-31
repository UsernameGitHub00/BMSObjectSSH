<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>前台管理</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">*
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<link rel="stylesheet" href="${ctx}/Content/css/font.css">
<link rel="stylesheet" href="${ctx}/Content/css/xadmin.css">
<script src="${ctx}/Content/lib/layui/layui.js" charset="utf-8"></script>
<script type="text/javascript" src="${ctx}/Content/js/xadmin.js"></script>
<link rel="stylesheet" href="${ctx}/Content/res/static/css/main.css" type="text/css"></link>
<link rel="stylesheet" href="${ctx}/Content/res/layui/css/layui.css" type="text/css"></link>
<script type="text/javascript" src="${ctx}/Content/res/layui/layui.js"></script></head>

<body id="list-cont">
	<c:if test="${user.user_id == 0 }">
		<c:redirect url="/jsp/login.jsp"></c:redirect>
	</c:if>
	<input type="hidden" id="infor" value="${user.user_information_id}" >
	<div class="site-nav-bg">
    <div class="site-nav w1200">
      <p class="sn-back-home">
        <i class="layui-icon layui-icon-home"></i>
        <a href="#">首页</a>
      </p>
      <div class="sn-quick-menu">
        <div class="login"><a onclick="xadmin.open('个人信息','${ctx}/mainAction!information.action?user_id=${user.user_id}&user_name=${user.user_name}')">${user.user_name}</a></div>
        <div class="sp-cart"><a href="#">书单</a><span></span></div>
      </div>
    </div>
  </div>


  <div class="header">
    <div class="headerLayout w1200">
      <div class="headerCon">
        <h1 class="mallLogo">
         	 <spen style="color:#d0b4f6;font-family: cursive;">掌上</spen><spen style="color:#919191;font-family: cursive;">书城</spen>
        </h1>
        <div class="mallSearch">
          <form action="" class="layui-form" novalidate>
            <input type="text" name="title" required  lay-verify="required" autocomplete="off" class="layui-input" placeholder="请输入需要的商品">
            <button class="layui-btn" lay-submit lay-filter="formDemo">
                <i class="layui-icon layui-icon-search"></i>
            </button>
          </form>
        </div>
      </div>
    </div>
  </div>


  <div class="content">
    <div class="main-nav">
      <div class="inner-cont0">
        <div class="inner-cont1 w1200">
          <div class="inner-cont2">
              <a href="${ctx}/jsp/books.jsp">所有图书</a>
          </div>
        </div>
      </div>
    </div>
    <div class="category-con">
      <div class="category-inner-con w1200">
        <div class="category-type">
          <h3>全部分类</h3>
        </div>
        <div class="category-tab-content">
          <div class="nav-con">
            <ul class="normal-nav layui-clear" id="bookTypeList">
             
            </ul>
          </div>
        </div>
      </div>
      <div class="category-banner">
        <div class="w1200">
          <img src="${ctx}/Content/res/static/img/theme-pic2.jpg"></img>
        </div>
      </div>
    </div>

    <div class="product-list-box" id="product-list-box">
      <div class="product-list-cont w1200">
        <h4>更多推荐</h4>
        <div class="product-item-box layui-clear" id="bookList">
          
        </div>
      </div>
    </div>
  </div>

  <div class="footer">
    <div class="ng-promise-box">
      <div class="ng-promise w1200">
        <p class="text">
          <a class="icon1" href="javascript:;">损坏无理由退换货</a>
          <a class="icon2" href="javascript:;">正规渠道</a>
          <a class="icon3" style="margin-right: 0" href="javascript:;">100%正品保障</a>
        </p>
      </div>
    </div>
    <div class="mod_help w1200">
      <p>
        <a href="javascript:;">关于我们</a>
        <span>|</span>
        <a href="javascript:;">帮助中心</a>
        <span>|</span>
        <a href="javascript:;">订单服务</a>
        <span>|</span>
        <a href="javascript:;">客服资讯</a>
        <span>|</span>
        <a href="javascript:;">关于货源</a>
      </p>
      <p class="coty">广信IT-吴川 &copy; 2019-2020</p>
    </div>
  </div>
  <script type="text/javascript">

layui.config({
    base: '${ctx}/Content/res/static/js/util/' //你存放新模块的目录，注意，不是layui的模块目录
  }).use(['mm','carousel'],function(){
      var carousel = layui.carousel,
     mm = layui.mm;
     var option = {
        elem: '#test1'
        ,width: '100%' //设置容器宽度
        ,arrow: 'always'
        ,height:'298' 
        ,indicator:'none'
      };
      carousel.render(option);
      // 模版引擎导入
     // var ins = carousel.render(option);
     // var html = demo.innerHTML;
     // var listCont = document.getElementById('list-cont');
     // // console.log(layui.router("#/about.html"))
     //  mm.request({
     //    url: '../json/index.json',
     //    success : function(res){
     //      console.log(res)
     //      listCont.innerHTML = mm.renderHtml(html,res)
     //      ins.reload(option);
     //    },
     //    error: function(res){
     //      console.log(res);
     //    }
     //  })
    

});
  </script>
	<script src="${ctx}/Content/bootstrap-3.3.7-dist/js/jquery-2.0.3.min.js"></script>
    <script type="text/javascript" src="${ctx}/Content/js/jquery.form.js"></script>
	<script src="${ctx}/Content/layer/layer.js"></script>
	<script type="text/javascript">
		 $(function(){
		 	var inforId=$("#infor").val();
		 	if (inforId=="" || inforId ==null ||inforId==0) {
				 layer.alert("填写完整资料后获取借阅证！",{offset:'150px',icon:0,title:'提示'});
			}	
        });
	</script>
	<script type="text/javascript">
		 $(function(){
			$.ajaxSettings.async=false;
			$.post("${ctx}/bookTypeAction!selectBookTypeById.action",{book_type_id:0}, function (data) {
                $.each(data, function (i) {
                    //jquery写法：内容将追加到bookTypeList的后面:
                    $("#bookTypeList").append("<li class='nav-item '><div class='title'>" + data[i].book_type
                    	+ "</div><p value="+ data[i].book_type_id+" ></p><i class='layui-icon layui-icon-right'></i></li>");
                });
            });
			
			
			$.post("${ctx}/bookMessageAction!selectBookAll.action", function (data) {
                $.each(data, function (i) {
                    //jquery写法：内容将追加到bookList的后面:
                    $("#bookList").append(" <div class='list-item'><a href='javascript:;'><img src=\"${ctx}/Content/bookImg/" + data[i].book_id + ".jpg\" width='130' height='170'/></a><p style='text-align:center'>" + data[i].book_name + "</p><span>"
                       + data[i].book_author + "</span><input type='hidden' value="+data[i].book_id+" /></div>" );
                });
            });
            //获取表格中的所有p标签
            var p = document.getElementById("bookTypeList").getElementsByTagName("p");
            //给checkbox设置选中属性并赋值为false
            for (var i = 0; i < p.length; i++) {
                var id = p[i].getAttribute("value");
            	$.post("${ctx}/bookTypeAction!selectBookTypeById.action",{book_type_id_1:id}, function (data) {
        			$.each(data, function (j) {
            		//jquery写法：内容将追加到p[i]的后面:
            		var node = document.createElement('a');//创建一个文本节点
            		node.setAttribute("value",data[j].book_type_id);
            		node.setAttribute("href","#");
            		node.innerHTML =data[j].book_type;//文本内容
            		p[i].appendChild(node);
      	  			});
           		});
            }
        });
	</script>
</body>
</html>
