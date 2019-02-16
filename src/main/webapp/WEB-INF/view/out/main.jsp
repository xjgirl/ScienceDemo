<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/1/29
  Time: 15:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/common/common.jsp"%>

<html>
<head>
    <base href="<%=basePath%>">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Title</title>
    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">
    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
    <meta http-equiv="description" content="This is my page">
    <script src="../js/layui.js"></script>
    <link rel="stylesheet" href="../css/layui.css">

    <script type="text/javascript">
        jquery(document).ready(function () {
            jquery("jquery-accordion-menu").jqueryAccordionMenu();

        });
        $(function () {
            //顶部导航切换
            $("#demo-list li").click(function () {
                $("#demo-list li.active").removeClass("active")
                $(this).addClass("active");
            })
        })
    </script>

    <script type="text/javascript">
        $(function () {
            //导航切换
            $(".menuson li").click(function () {
                $(".menuson li.active").removeClass("active");
                $(this).addClass("active");
            });
            $('.title').click(function () {
                var $ul = $(this).next('ul');
                $('dd').find('ul').slideUp();
                if ($ul.is(':visible')) {
                    $(this).next('ul').slideUp();
                } else {
                    $(this).next('ul').slideUp();
                }
            });
        });
    </script>
</head>

<body>
<div class="layui-layout layui-layout-admin">
    <div class="layui-header">
        <div class="layui-logo">高校科研平台综合管理系统</div>
        <!-- 头部区域（可配合layui已有的水平导航） -->
        <ul class="layui-nav layui-layout-left">
            <li class="layui-nav-item"><a href="">控制台</a></li>
            <li class="layui-nav-item"><a href="">商品管理</a></li>
            <li class="layui-nav-item"><a href="">用户</a></li>
            <li class="layui-nav-item">
                <a href="javascript:;">其它系统</a>
                <dl class="layui-nav-child">
                    <dd><a href="">邮件管理</a></dd>
                    <dd><a href="">消息管理</a></dd>
                    <dd><a href="">授权管理</a></dd>
                </dl>
            </li>
        </ul>
        <ul class="layui-nav layui-layout-right">
            <li class="layui-nav-item">
                <a href="javascript:;">
                    <!--  <img src="http://t.cn/RCzsdCq" class="layui-nav-img">-->
                    欢迎 ${userName}
                </a>
                <dl class="layui-nav-child">
                    <dd><a href="<%= basePath%>/biz/User_openMessage.action?id=${id}&userId=${userId}">基本资料</a></dd>
                    <dd><a href="">安全设置</a></dd>
                </dl>
            </li>
            <li class="layui-nav-item"><a href="">退出</a></li>
        </ul>
    </div>

    <div class="layui-side layui-bg-black">
        <div class="layui-side-scroll">
            <!-- 左侧导航区域（可配合layui已有的垂直导航） -->
            <ul class="layui-nav layui-nav-tree"  lay-filter="test">
<p:permissions menu="addRole,editRole,deleteRole,addRole,editRole,deleteRole,addUser,editUser,deleteUsere">
                <li class="layui-nav-item layui-nav-itemed">
                    <div >
                        <a class="title" href="javascript:;">基本设置</a>
                    </div>
                    <dl class="layui-nav-child menuson">
    <p:permissions menu="addUser,editUser,deleteUsere">
                        <dd><a href="<%=basePath%>/biz/User_list.action">用户管理</a></dd>
    </p:permissions>
    <p:permissions menu="addRole,editRole,deleteRole">
                        <dd><a href="<%=basePath%>/biz/Role_list.action">角色管理</a></dd>
    </p:permissions>
    <p:permissions menu="addRight,editRight,deleteRight">
                        <dd><a href="<%=basePath%>/biz/Right_list.action">权限管理</a></dd>
    </p:permissions>

                    </dl>
                </li>
</p:permissions>
                <li class="layui-nav-item">
                    <a href="javascript:;">登录日志</a>
                    <dl class="layui-nav-child">
                        <dd><a href="<%=basePath%>/biz/LoginRecord_list.action">登录日志</a></dd>

                    </dl>
                </li>
                <li class="layui-nav-item">
                    <a href="javascript:;">图书管理</a>
                    <dl class="layui-nav-child">
                        <dd><a href="javascript:;">图书入库</a></dd>
                        <dd><a href="javascript:;">入库申请</a></dd>
                        <dd><a href="">图书购买</a></dd>
                        <dd><a href="javascript:;">图书入库</a></dd>
                    </dl>
                </li>
                <li class="layui-nav-item">
                    <a href="">知识管理</a>
                    <dl class="layui-nav-child">
                        <dd><a href=""></a></dd>
                    </dl>
                </li>
                <li class="layui-nav-item"><a href="">资料管理</a></li>
            </ul>
        </div>
    </div>

   <div class="layui-body">
        <!-- 内容主体区域 -->
       <div class="layadmin-tabsbody-item layui-show">
           <frameset cols="187,*" frameborder="no" border="0" framespacing="0">
               <iframe src="${pageContext.request.contextPath}/user/Login_openIndex.action" frameborder="0" class="layadmin-iframe"></iframe>
           </frameset>
       </div>
    </div>

    <div class="layui-footer">
        <!-- 底部固定区域 -->
        © layui.com - 底部固定区域
    </div>
</div>
<script src="../js/layui.js"></script>
<script>
    //JavaScript代码区域
    layui.use('element', function(){
        var element = layui.element;

    });
</script>
</body>
</html>
