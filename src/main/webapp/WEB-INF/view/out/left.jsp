<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/1/29
  Time: 15:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8" import="java.sql.*" errorPage="" %>
<%@ include file="/WEB-INF/common/common.jsp"%>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Title</title>
    <base href="<%= basePath%>"/>
    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">
    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
    <meta http-equiv="description" content="This is my page">
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
    <div class="layui-side layui-bg-black">
        <div class="layui-side-scroll">
            <!-- 左侧导航区域（可配合layui已有的垂直导航） -->
            <ul class="layui-nav layui-nav-tree"  lay-filter="test">

                <li class="layui-nav-item layui-nav-itemed">
                    <div >
                        <a class="title" href="javascript:;">基本设置</a>
                    </div>
                    <dl class="layui-nav-child menuson">
                        <dd><a href="<%=basePath%>/biz/SysUser_list.action">用户管理</a></dd>
                        <dd><a href="<%=basePath%>/biz/SysRole_list.action:;">角色管理</a></dd>
                        <dd><a href="<%=basePath%>/biz/SysRight_list.action:;">权限管理</a></dd>
                        <dd><a href=""></a></dd>
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
</div>
</body>
</html>
