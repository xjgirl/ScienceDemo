<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/1/29
  Time: 12:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" import="java.util.*"
         contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%--使用include命令引入公共页面 --%>
<%@include file="/WEB-INF/common/common.jsp"%>
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
    <link rel="stylesheet" href="../css/layui.css" media="all">
    <link rel="stylesheet" href="../css/modules/laydate/default/laydate.css" media="all">
    <link rel="stylesheet" href="../css/modules/layer/default/layer.css">
    <link href="<%=path %>/css/style.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="<%=path %>/js/jquery.js"></script>
    <script src="../js/layui.js"></script>
    <script type="text/javascript">
        /*
         *_contextPath:上下文路径
         *_modulePath: 模块路径
         */
        var  _contextPath="<%=path%>";
        var  _modulePath=_contextPath+"/sys/";
        $(document).ready(function(){
            $(".clicks").click(function(){
                _open(_modulePath+"textures_open.action?view=add");
            });
        });
    </script>

    <script type="text/javascript">
        //删除
        $(document).ready(function(){
            var id;
            var userId;
            var url;
            $(".tablelinkdelete").click(function(){
                id = $(this).attr("id_value");
                userId = $(this).attr("userId");
                url =" <%= basePath%>/biz/User_delete.action?id="+id+"&userId="+userId;
                $(".tip").fadeIn(200);
            });

            $(".tiptop a").click(function(){
                $(".tip").fadeOut(200);
            });

            $(".sure").click(function(){
                $(".tip").fadeOut(100);
                window.location.href=url;
            });

            $(".cancel").click(function(){
                $(".tip").fadeOut(100);
            });

        });
    </script>

</head>
<body>

<%int i=1;%>

<div style="padding:15px">
    <div class="layui-show">
        <div class="layui-card">
            <div class="layui-breadcrumb" lay-filter="breadcrumb" style="visibility: visible;">
                <a lay-href="">主页</a>
                <a><cite>用户管理</cite></a>
                <a><cite>table</cite></a>
            </div>
        </div>
        <div class="layui-fluid">
            <form action="<%= basePath%>/biz/User_list.action" method="post">

            <div class="layui-form layui-card-header" lay-filter="app-content-comment">
                <div class="layui-form-item">
                    <div class="layui-inline">
                        <label class="layui-form-label">综合查询</label>
                        <div class="layui-input-inline">
                            <input type="text" name="sysUser.userName" placeholder="请输入登录名" autocomplete="off" class="layui-input">
                        </div>
                    </div>

                    <div class="layui-inline">
                        <button class="layui-btn" data-type="reload" lay-submit="" lay-filter="LAY-app-contcomm-search">
                            <i class="layui-icon layui-icon-search"></i>
                        </button>
                    </div>
                </div>
            </div>
            <div class="layui-card-body">
                <div style="padding-bottom: 10px">

    <button class="layui-btn" data-type="btnAdd"> <a href="<%= basePath%>/biz/User_openAdd.action">新增</a></button>

                    <button class="layui-btn" data-type="batchdel">删除</button>
                </div>
                <table id="LAY-app-content-comm" lay-filter="LAY-app-content-comm"></table>
                <div class="layui-form layui-border-box layui-table-view" lay-filter="LAY-table" lay-id="LAY-app-content-comm">
                    <div class="layui-table-box">
                        <div class="layui-table-header">
                            <table cellspacing="0" cellpadding="0" border="0" class="layui-table">
                                <thead>
                                <tr>
                                    <th data-unresize="true" class="layui-table-col-special">
                                        <div class="layui-table-cell laytable-cell-checkbox">
                                            <input type="checkbox" name="layTableCheckbox" lay-skin="primary" lay-filter="layTableAllChoose">
                                            <div class="layui-unselect layui-form-checkbox" lay-skin="primary">
                                                <i class="layui-icon layui-icon-ok"></i>
                                            </div>
                                        </div>
                                    </th>
                                    <th class="layui-unselect">
                                        <div class="layui-table-cell">
                                            <span>ID</span>
                                        </div>
                                    </th>
                                    <th>
                                        <div class="layui-table-cell">
                                            <span>用户编号</span>
                                            <span class="layui-table-sort layui-inline">
                                                <i class="layui-edge layui-table-sort-asc" title="升序"></i>
                                                <i class="layui-edge layui-table-sort-desc" title="降序"></i>
                                            </span>
                                        </div>
                                    </th>
                                    <th>
                                        <div class="layui-table-cell">
                                            <span>用户名</span>
                                        </div>
                                    </th>
                                    <th>
                                        <div class="layui-table-cell">
                                            <span>真实姓名</span>
                                        </div>
                                    </th>
                                    <th>
                                        <div class="layui-table-cell">
                                            <span>手机号码</span>
                                        </div>
                                    </th>
                                    <th>
                                        <div class="layui-table-cell">
                                            <span>性别</span>
                                        </div>
                                    </th>
                                    <th>
                                        <div class="layui-table-cell">
                                            <span>年龄</span>
                                        </div>
                                    </th>
                                    <th>
                                        <div class="layui-table-cell">
                                            <span>QQ</span>
                                        </div>
                                    </th>
<%--<p:permissions menu="deleteUser,editUser">--%>
                                    <th class="layui-table-col-special">
                                        <div class="layui-table-cell" align="center"></div>
                                        <span>操作</span>
                                    </th>
<%--</p:permissions>--%>
                                </tr>
                                </thead>
                                <tbody>
                                <s:iterator value="pageResult.data">
                                    <tr>
                                        <td data-unresize="true" class="layui-table-col-special">
                                            <div class="layui-table-cell laytable-cell-checkbox">
                                                <input type="checkbox" name="layTableCheckbox" lay-skin="primary" lay-filter="layTableAllChoose">
                                                <div class="layui-unselect layui-form-checkbox" lay-skin="primary">
                                                    <i class="layui-icon layui-icon-ok"></i>
                                                </div>
                                            </div>
                                        </td>
                                        <td><%=i++%></td>
                                        <td>${userId}</td>
                                        <td>${userName}</td>
                                        <td>${userRealName}</td>
                                        <td>${userTelephone}</td>
                                        <c:choose>
                                            <c:when test="${1 == userSex}">
                                                <td>男</td>
                                            </c:when>
                                            <c:when test="${0 == userSex}">
                                                <td>女</td>
                                            </c:when>
                                            <c:otherwise>
                                                <td></td>
                                            </c:otherwise>
                                        </c:choose>
                                        <td>${userAge}</td>
                                        <td>${userQq}</td>
                                        <%--<p:permissions menu="deleteUser,editUser">--%>
                                            <td>
                                                <%--<p:permissions right="deleteUser">--%>
                                                    <a href="<%= basePath%>/biz/User_delete.action?id=${id}&userId=${userId}" id_value="${id}" userId="${userId}">删除</a>
                                                <%--</p:permissions>--%>
                                                <%--<p:permissions right="editUser">--%>

                                                    <a href="<%= basePath%>/biz/User_openEdit.action?id=${id}&userId=${userId}" class="tablelink">修改</a>
                                                <%--</p:permissions>--%>
                                            </td>
                                        <%--</p:permissions>--%>
                                    </tr>
                                </s:iterator>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
                <%
                    //查询的url地址，统一写
                    String listActionURL = basePath+"/biz/User_list.action";
                %>
                <script type="text/javascript">
                    //分页组件
                    function change()
                    {
                        var textfield=document.getElementById("textfield").value;
                        var totalPage="${pageResult.totalPage}";
                        var pageNum = 0;
                        if(totalPage*1 >= textfield*1 ){
                            pageNum = textfield;
                            window.location.href="<%=listActionURL%>?page="+pageNum+"";
                        }else{
                            pageNum = totalPage;
                            alert("当前只有"+totalPage+"页");
                        }

                    }
                </script>

                <script type="text/javascript">
                    var url = "<%= basePath%>/biz/User_list.action";                 //获取表单url
                    //首页
                    function first(){

                        window.location.href  = url+"?page=1";
                    }
                    //上一页
                    function previous(){
                        window.location.href  = url+"?page=${pageResult.previousPageNumber}";
                    }
                    //下一页
                    function next(){
                        window.location.href  = url+"?page=${pageResult.nextPageNumber}";
                    }
                    //尾页
                    function last(){
                        window.location.href  = url+"?page=${pageResult.totalPage}";
                    }
                </script>
                <div class="pagin">
                    <div class="message">共<i class="blue">${pageResult.total}</i>条记录 	<i class="blue">${pageResult.totalPage}</i>页， 	当前显示第&nbsp;<i class="blue">${pageResult.page}</i>页</div>
                    <ul class="paginList">
                        <c:choose>
                            <c:when test="${pageResult.isFirst==true}"><li class="paginItem current"><a href="javascript:;">首页</a></li></c:when>
                            <c:otherwise>
                                <li class="paginItem"><a href="javascript:first()" target="rightFrame">首页&nbsp;</a></li>
                            </c:otherwise>
                        </c:choose>
                        <c:choose>
                            <c:when test="${pageResult.isFirst==true}"><li class="paginItem current"><a href="javascript:;">上一页</a></li></c:when>
                            <c:otherwise>
                                <li class="paginItem"><a href="javascript:previous()" target="rightFrame">上一页&nbsp;</a></li>
                            </c:otherwise>
                        </c:choose>
                        <c:choose>
                            <c:when test="${pageResult.hasNext==true}">
                                <li class="paginItem"><a href="javascript:next()" target="rightFrame">下一页&nbsp;</a></li>
                            </c:when>
                            <c:otherwise><li class="paginItem current"><a href="javascript:;">下一页</a></li></c:otherwise>
                        </c:choose>
                        <c:choose>
                            <c:when test="${pageResult.isLast==true}"><li class="paginItem current"><a href="javascript:;">尾页</a></li></c:when>
                            <c:otherwise>
                                <li class="paginItem"><a href="javascript:last()" target="rightFrame">尾页&nbsp;</a></li>
                            </c:otherwise>
                        </c:choose>
                        <li class="paginItem-page">
                            跳转到：&nbsp;
                            <input name="textfield" type="text" size="4" class="page-input" id="textfield" onchange="change()"/>&nbsp;页
                        </li>
                    </ul>
                </div>
                <!-- 分页菜单组件--------------------------结束 -->
                <script type="text/javascript">
                    $("#usual1 ul").idTabs();
                </script>

                <script type="text/javascript">
                    $('.tablelist tbody tr:odd').addClass('odd');
                </script>
            </form>
        </div>
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
