<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/1/6
  Time: 16:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="format-detection" content="telephone=no">
    <meta name="renderer" content="webkit">
    <meta http-equiv="Cache-Control" content="no-siteapp" />
    <title>用户登录</title>
    <link rel="stylesheet" href="css/amazeui.min.css"/>
    <style>
        .header {
            text-align: center;
        }
        .header h1 {
            font-size: 200%;
            color: #333;
            margin-top: 30px;
        }
        .header p {
            font-size: 14px;
        }
        .center{
            text-align: center;
        }
    </style>
</head>
<body>
<div class="header">
    <div class="am-g">
        <h1>梧州学院</br>视频大数据处理实验室</h1>
        <p></p>
    </div>
    <hr />
</div>
<div class="am-g">
    <div class="am-u-lg-6 am-u-md-8 am-u-sm-centered">
        <h3>登录</h3>
        <hr>

        <form action="user_login.action" method="post" class="am-form">
            <label for="user.userName">用户名:</label>
            <input type="text" name="user.userName" id="user.userName" value="">
            <br>
            <label for="user.userPassword">用户密码:</label>
            <input type="password" name="user.userPassword" id="user.userPassword" value="">
            <br>
            <label for="remember-me">
                <input id="remember-me" type="checkbox">
                记住密码
            </label>
            <br />
            <div class="center">
                <div class="am-cf">
                    <input type="submit" name="" value="&nbsp;&nbsp;登 &nbsp;&nbsp;录&nbsp;&nbsp;" class="am-btn am-btn-primary am-btn-default ">
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <a class="am-btn am-btn-primary am-btn-default " href="register.html"><span class="am-icon-pencil"></span> 注册</a>
                </div>
            </div>
        </form>
        <hr>
        <p>© 2018 by the Graduate-design Team from Software Engineering .</p>
    </div>
</div>
</body>
</html>
