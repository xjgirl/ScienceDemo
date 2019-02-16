<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/1/29
  Time: 14:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/common/common.jsp"%>

<html>
<head>
    <base href="<%=basePath%>">

    <title>Title</title>
    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">
    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
    <meta http-equiv="description" content="This is my page">
    <link rel="stylesheet" href="../css/layui.css" media="all">
    <link rel="stylesheet" href="../css/style/global.css" media="all">
    <link rel="stylesheet" href="../css/style/style.css" media="all">
    <script src="../js/layui.js"></script>
    <script type="text/javascript">
        function disptime() {
            var today = new Date();//获取当前时间
            var hh = today.getHours();
            var mm = today.getMinutes();
            var ss = today.getSeconds();
            //设置div的内容为当前时间
            document.getElementById("myclock").innerHTML="<h2>现在是：" + hh + ":" + mm + ":" + ss + "<h2>";
            /**
             * 使用setTimeout在函数disptime()体内再次调用setTimeout
             * 设置定时器每隔1秒（1000毫秒），调用函数disptime()执行，刷新时钟显示
             */
            var myTime = setTimeout("disptime()", 1000);
        }
    </script>

</head>
<body>

    <p>${userName}您好，欢迎加入梧州学院视频大数据处理实验室。</p>


</body>
</html>
