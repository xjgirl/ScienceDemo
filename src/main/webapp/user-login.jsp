<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/1/6
  Time: 21:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/common/common.jsp"%>
<html>
<head>
    <meta charset="utf-8">
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <meta name="format-detection" content="telephone=no">
    <meta http-equiv="Cache-Control" content="no-siteapp" />
    <title>用户登录</title>
    <link rel="stylesheet" href="../css/layui.css">
    <link rel="stylesheet" href="../css/admin.css">
    <link href="css/style.css" rel="stylesheet" type="text/css" />
    <link rel="stylesheet" href="css/login.css">
    <script src="js/layui.js"></script>
</head>
<body>
<div class="layadmin-user-login layadmin-user-display-show" id="LAY-user-login" style="display: none;">
    <div class="layadmin-user-login-main">
        <div class="layadmin-user-login-box layadmin-user-login-header">
            <h2></h2>
            <p></p>
        </div>
        <form action="${pageContext.request.contextPath}/user/User_webLogin.action" method="post">
        <div class="layadmin-user-login-box layadmin-user-login-body layui-form">
            <div class="layui-form-item">
                <label class="layadmin-user-login-icon layui-icon layui-icon-username" for="userName"></label>
                <input type="text" name="userName" id="userName" lay-verify="required" placeholder="用户名" class="layui-input">
            </div>
            <div class="layui-form-item">
                <label class="layadmin-user-login-icon layui-icon layui-icon-password" for="userPassword"></label>
                <input type="password" name="userPassword" id="userPassword" lay-verify="required" placeholder="密码" class="layui-input">
            </div>
            <div class="layui-form-item">
                <div class="layui-row">
                   <!-- <div class="layui-col-xs7">
                        <label class="layadmin-user-login-icon layui-icon layui-icon-vercode" for="LAY-user-login-vercode"></label>
                        <input type="text" name="vercode" id="LAY-user-login-vercode" lay-verify="required" placeholder="图形验证码" class="layui-input">
                    </div>
                    <div class="layui-col-xs5">
                        <div style="margin-left: 10px;">
                            <img src="https://www.oschina.net/action/user/captcha" class="layadmin-user-login-codeimg" id="LAY-user-get-vercode">
                        </div>
                    </div>-->
                </div>
            </div>
            <div class="layui-form-item" style="margin-bottom: 20px;">
                <input type="checkbox" name="remember" lay-skin="primary" title="记住密码">
                <a href="forget.html" class="layadmin-user-jump-change layadmin-link" style="margin-top: 7px;">忘记密码？</a>
            </div>
            <div class="layui-form-item">
                <button class="layui-btn layui-btn-fluid" >登 入</button>
            </div>
            <div class="layui-trans layui-form-item layadmin-user-login-other">
                <a href="reg.html" class="layadmin-user-jump-change layadmin-link">注册帐号</a>
            </div>
        </div>
        </form>
        <div class="tip3">
            <div class="tiptop"><span>提示信息</span><a></a></div>
            <div class="tipinfo">
                <span><img src="<%= basePath%>images/ticon.png" /></span>
                <div class="tipright">
                    <p>登录失败！</p>
                    <p>请检查您的账号密码是否正确</p>
                </div>
            </div>


        </div>
        <%
            String fail = (String)request.getAttribute("fail");
            String fail1 =new String(fail == null || "".equals(fail)?"ff":fail);
            if(fail1.equals("fail1")){ %>
        <script type="text/javascript">
            $(".tip3").fadeIn(200);
            $(".tiptop a").click(function(){
                $(".tip3").fadeOut(200);
            });
        </script>
        <%} %>

    </div>
</div>

</body>
</html>
