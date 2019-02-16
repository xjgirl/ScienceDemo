<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/2/14
  Time: 13:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/common/common.jsp"%>
<html>
<head>
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
    <script src="../js/layui.js"></script>
    <script type="text/javascript" src="<%=path %>/js/jquery.js"></script>
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
            var roleId;
            $(".tablelinkdelete").click(function(){
                roleId = $(this).attr("roleId");
                $(".tip").fadeIn(200);
            });
            $(".tiptop a").click(function(){
                $(".tip").fadeOut(200);
            });
            $(".sure").click(function(){
                $(".tip").fadeOut(100);
                window.location.href="<%= basePath%>/role/Role_delete.action?roleId="+roleId;
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
                 <a><cite>系统管理</cite></a>
                 <a><cite>角色管理</cite></a>
             </div>
         </div>
         <div class="layui-fluid">
             <form action="<%= basePath%>/biz/Role_list.action" method="post"  target="rightFrame">
                 <div class="layui-form layui-card-header" lay-filter="app-content-comment">
                     <div class="layui-form-item">
                         <div class="layui-inline">
                             <label class="layui-form-label">综合查询</label>
                             <div class="layui-input-inline">
                                 <input type="text" name="sysRole.roleName" placeholder="请输入角色名称" autocomplete="off" class="layui-input">
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
                         <button class="layui-btn" data-type="btnAdd"> <a href="<%= basePath%>/role/Role_openAdd.action">新增</a></button>

                         <button class="layui-btn" data-type="batchdel">删除</button>
                     </div>
                     <table id="LAY-app-content-comm" lay-filter="LAY-app-content-comm"></table>
                     <div class="layui-form layui-border-box layui-table-view" lay-filter="LAY-table" lay-id="LAY-app-content-comm">
                         <div class="layui-table-box">
                             <div class="layui-table-header">
                                 <table id="test" cellspacing="0" cellpadding="0" border="0" class="layui-table">
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
                                                 <span>角色编号</span>
                                                 <span class="layui-table-sort layui-inline">
                                                <i class="layui-edge layui-table-sort-asc" title="升序"></i>
                                                <i class="layui-edge layui-table-sort-desc" title="降序"></i>
                                            </span>
                                             </div>
                                         </th>
                                         <th>
                                             <div class="layui-table-cell">
                                                 <span>角色名称</span>
                                             </div>
                                         </th>
                                         <th>
                                             <div class="layui-table-cell">
                                                 <span>排序序号</span>
                                             </div>
                                         </th>
<%--<p:permissions menu="deleteRole,editRole">--%>
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
                                             <td>${roleId}</td>
                                             <td>${roleName}</td>
                                             <td>${roleSortOrder}</td>
                                             <%--<p:permissions menu="deleteRole,editRole">--%>
                                                 <td>
                                                     <%--<p:permissions right="deleteRole" >--%>
                                                         <a href="<%= basePath%>/biz/Role_delete.action?id=${id}&roleId=${roleId}" class="tablelinkdelete" roleId="${roleId}"> 删除</a>&nbsp;&nbsp;

                                                     <%--</p:permissions>--%>
                                                     <%--<p:permissions right="editRole" >--%>
                                                         <a href="<%= basePath%>/role/Role_openEdit.action?roleId=${roleId}" class="tablelink">修改</a>
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
String listActionURL = basePath+"/biz/Role_list.action";
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
                     var url = "<%= basePath%>/biz/Role_list.action";                 //获取表单url
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
         </div>

         <div class="tip">
             <div class="tiptop"><span>提示信息</span><a></a></div>
             <div class="tipinfo">
                 <span><img src="<%= basePath%>images/ticon.png" /></span>
                 <div class="tipright">
                     <p>是否确认删除信息 ？</p>
                     <cite>如果是请点击确定按钮 ，否则请点取消。</cite>
                 </div>
             </div>

             <div class="tipbtn">
                 <input name="" type="button"  class="sure" value="确定" />&nbsp;
                 <input name="" type="button"  class="cancel" value="取消" />
             </div>

         </div>

         </form>
         </div>
     </div>
 </div>
 <script>
     layui.use('table', function(){
         var table = layui.table;

         //头工具栏事件
         table.on('toolbar(test)', function(obj){
             var checkStatus = table.checkStatus(obj.config.id);
             switch(obj.event){
                 case 'getCheckData':
                     var data = checkStatus.data;
                     layer.alert(JSON.stringify(data));
                     break;
                 case 'getCheckLength':
                     var data = checkStatus.data;
                     layer.msg('选中了：'+ data.length + ' 个');
                     break;
                 case 'isAll':
                     layer.msg(checkStatus.isAll ? '全选': '未全选');
                     break;
             };
         });

         //监听行工具事件
         table.on('tool(test)', function(obj){
             var data = obj.data;
             //console.log(obj)
             if(obj.event === 'del'){
                 layer.confirm('真的删除行么', function(index){
                     obj.del();
                     layer.close(index);
                 });
             } else if(obj.event === 'edit'){
                 layer.prompt({
                     formType: 2
                     ,value: data.email
                 }, function(value, index){
                     obj.update({
                         email: value
                     });
                     layer.close(index);
                 });
             }
         });
     });
 </script>
</body>
</html>
