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
	<title>所有图书</title>
  	<link rel="stylesheet" type="text/css" href="${ctx}/Content/res/static/css/main.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/Content/res/layui/css/layui.css">
  	<script type="text/javascript" src="${ctx}/Content/res/layui/layui.js"></script>
  	<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
  	<meta http-equiv="X-UA-Compatible" content="IE=Edge,chrome=1">

  </head>
  
  <body>
  	<div class="site-nav-bg">
    <div class="site-nav w1200">
      <p class="sn-back-home">
        <i class="layui-icon layui-icon-home"></i>
        <a href="#">首页</a>
      </p>
      <div class="sn-quick-menu">
         <div class="login"><a onclick="xadmin.open('个人信息','${ctx}/jsp/myInformation.jsp')">${User.getUser_name()}</a></div>
        <div class="sp-cart"><a href="#">书单</a><span>2</span></div>
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
            <input type="hidden" name="" value="">
          </form>
        </div>
      </div>
    </div>
  </div>


  <div class="content content-nav-base commodity-content">
    <div class="main-nav">
      <div class="inner-cont0">
        <div class="inner-cont1 w1200">
          <div class="inner-cont2">
            <a href="${ctx}/jsp/books.jsp" class="active">所有图书</a>
          </div>
        </div>
      </div>
    </div>
    <div class="commod-cont-wrap">
      <div class="commod-cont w1200 layui-clear">
        <div class="left-nav">
          <div class="title">所有分类</div>
          <div class="list-box" id="bookTypeList">
            
          </div>
        </div>
        <div class="right-cont-wrap">
          <div class="right-cont">
            <div class="sort layui-clear">
              <a class="active" href="javascript:;" event = 'volume'>销量</a>
              <a href="javascript:;" event = 'price'>价格</a>
              <a href="javascript:;" event = 'newprod'>新品</a>
              <a href="javascript:;" event = 'collection'>收藏</a>
            </div>
            <div class="prod-number">
              <span>200个</span>
            </div>
            <div class="cont-list layui-clear" id="list-cont">
              <div class="item">
                <div class="img" style="text-align:center;">
                  <a href="javascript:;"><img src="${ctx}/Content/res/static/img/1.png" style="height:280px;"></a>
                </div>
                <div class="text">
                  <p class="title">钢铁是怎样炼成的</p>
                  <p class="price">
                    <span class="pri">尼古拉·奥斯特洛夫斯基</span>
                    <span class="nub">254人看过</span>
                  </p>
                </div>
              </div>
             <div class="item">
                <div class="img" style="text-align:center;">
                  <a href="javascript:;"><img src="${ctx}/Content/res/static/img/2.png" style="height:280px;"></a>
                </div>
                <div class="text">
                  <p class="title">活着</p>
                  <p class="price">
                    <span class="pri">余华</span>
                    <span class="nub">54人看过</span>
                  </p>
                </div>
              </div>
              <div class="item">
                <div class="img" style="text-align:center;">
                  <a href="javascript:;"><img src="${ctx}/Content/res/static/img/3.png" style="height:280px;"></a>
                </div>
                <div class="text">
                  <p class="title">零基础入门学习C语言</p>
                  <p class="price">
                    <span class="pri">小甲鱼</span>
                    <span class="nub">36人看过</span>
                  </p>
                </div>
              </div>
              <div class="item">
                <div class="img" style="text-align:center;">
                  <a href="javascript:;"><img src="${ctx}/Content/res/static/img/1.png" style="height:280px;"></a>
                </div>
                <div class="text">
                  <p class="title">钢铁是怎样炼成的</p>
                  <p class="price">
                    <span class="pri">尼古拉·奥斯特洛夫斯基</span>
                    <span class="nub">254人看过</span>
                  </p>
                </div>
              </div>
             <div class="item">
                <div class="img" style="text-align:center;">
                  <a href="javascript:;"><img src="${ctx}/Content/res/static/img/2.png" style="height:280px;"></a>
                </div>
                <div class="text">
                  <p class="title">活着</p>
                  <p class="price">
                    <span class="pri">余华</span>
                    <span class="nub">54人看过</span>
                  </p>
                </div>
              </div>
              <div class="item">
                <div class="img" style="text-align:center;">
                  <a href="javascript:;"><img src="${ctx}/Content/res/static/img/3.png" style="height:280px;"></a>
                </div>
                <div class="text">
                  <p class="title">零基础入门学习C语言</p>
                  <p class="price">
                    <span class="pri">小甲鱼</span>
                    <span class="nub">36人看过</span>
                  </p>
                </div>
              </div>
              <div class="item">
                <div class="img" style="text-align:center;">
                  <a href="javascript:;"><img src="${ctx}/Content/res/static/img/1.png" style="height:280px;"></a>
                </div>
                <div class="text">
                  <p class="title">钢铁是怎样炼成的</p>
                  <p class="price">
                    <span class="pri">尼古拉·奥斯特洛夫斯基</span>
                    <span class="nub">254人看过</span>
                  </p>
                </div>
              </div>
             <div class="item">
                <div class="img" style="text-align:center;">
                  <a href="javascript:;"><img src="${ctx}/Content/res/static/img/2.png" style="height:280px;"></a>
                </div>
                <div class="text">
                  <p class="title">活着</p>
                  <p class="price">
                    <span class="pri">余华</span>
                    <span class="nub">54人看过</span>
                  </p>
                </div>
              </div>
              <div class="item">
                <div class="img" style="text-align:center;">
                  <a href="javascript:;"><img src="${ctx}/Content/res/static/img/3.png" style="height:280px;"></a>
                </div>
                <div class="text">
                  <p class="title">零基础入门学习C语言</p>
                  <p class="price">
                    <span class="pri">小甲鱼</span>
                    <span class="nub">36人看过</span>
                  </p>
                </div>
              </div>
              <div class="item">
                <div class="img" style="text-align:center;">
                  <a href="javascript:;"><img src="${ctx}/Content/res/static/img/1.png" style="height:280px;"></a>
                </div>
                <div class="text">
                  <p class="title">钢铁是怎样炼成的</p>
                  <p class="price">
                    <span class="pri">尼古拉·奥斯特洛夫斯基</span>
                    <span class="nub">254人看过</span>
                  </p>
                </div>
              </div>
             <div class="item">
                <div class="img" style="text-align:center;">
                  <a href="javascript:;"><img src="${ctx}/Content/res/static/img/2.png" style="height:280px;"></a>
                </div>
                <div class="text">
                  <p class="title">活着</p>
                  <p class="price">
                    <span class="pri">余华</span>
                    <span class="nub">54人看过</span>
                  </p>
                </div>
              </div>
              <div class="item">
                <div class="img" style="text-align:center;">
                  <a href="javascript:;"><img src="${ctx}/Content/res/static/img/3.png" style="height:280px;"></a>
                </div>
                <div class="text">
                  <p class="title">零基础入门学习C语言</p>
                  <p class="price">
                    <span class="pri">小甲鱼</span>
                    <span class="nub">36人看过</span>
                  </p>
                </div>
              </div>
            </div>
            <!-- 模版引擎导入 -->
            <!-- <script type="text/html" id="demo">
              {{# layui.each(d.menu.milk.content,function(index,item){}}    
                <div class="item">
                  <div class="img">
                    <a href="javascript:;"><img src="{{item.img}}"></a>
                  </div>
                  <div class="text">
                    <p class="title"></p>
                    <p class="price">
                      <span class="pri">{{item.pri}}</span>
                      <span class="nub">{{item.nub}}</span>
                    </p>
                  </div>
                </div>
              {{# }); }}
            </script> -->
            <div id="demo0" style="text-align: center;"></div>
          </div>
        </div>
      </div>
    </div>
  </div>
<script>

  layui.config({
    base: '${ctx}/Content/res/static/js/util/' //你存放新模块的目录，注意，不是layui的模块目录
  }).use(['mm','laypage','jquery'],function(){
      var laypage = layui.laypage,$ = layui.$,
     mm = layui.mm;
       laypage.render({
        elem: 'demo0'
        ,count: 100 //数据总数
      });

    $('.sort a').on('click',function(){
      $(this).addClass('active').siblings().removeClass('active');
    });
    $('.list-box dt').on('click',function(){
      if($(this).attr('off')){
        $(this).removeClass('active').siblings('dd').show();
        $(this).attr('off','');
      }else{
        $(this).addClass('active').siblings('dd').hide();
        $(this).attr('off',true);
      }
    });

});
</script>
<script src="${ctx}/Content/bootstrap-3.3.7-dist/js/jquery-2.0.3.min.js"></script>
<script type="text/javascript" src="${ctx}/Content/js/jquery.form.js"></script>
<script src="${ctx}/Content/layer/layer.js"></script>
<script>
	$.ajaxSettings.async=false;
	$.post("${ctx}/bookTypeAction!selectBookTypeById.action",{book_type_id:0}, function (data) {
              $.each(data, function (i) {
                  //jquery写法：内容将追加到bookTypeList的后面:
                  var nb = i + 1;//序号
                  $("#bookTypeList").append("<dl value="+data[i].book_type_id+"><dt>" + data[i].book_type
                  	+ "</dt></dl>");
              });
          });
	//获取表格中的所有p标签
    var dl = document.getElementById("bookTypeList").getElementsByTagName("dl");
    //给checkbox设置选中属性并赋值为false
    for (var i = 0; i < dl.length; i++) {
        var id = dl[i].getAttribute("value");
    	$.post("${ctx}/bookTypeAction!selectBookTypeById.action",{book_type_id_1:id}, function (data) {
			$.each(data, function (j) {
    		//jquery写法：内容将追加到dl[i]的后面:
    		var node = document.createElement('dd');//创建一个文本节点
    		var node1 = document.createElement('a');//创建一个文本节点
    		node1.setAttribute("value",data[j].book_type_id);
    		node1.setAttribute("href","#");
    		node1.innerHTML =data[j].book_type;//文本内容
    		node.appendChild(node1);
    		dl[i].appendChild(node);
    		
 			});
   		});
    }

</script>
  </body>
</html>
