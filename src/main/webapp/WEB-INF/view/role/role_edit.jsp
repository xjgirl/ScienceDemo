<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/2/14
  Time: 14:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/common/common.jsp"%>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="../css/layui.css" media="all">
    <link rel="stylesheet" href="../css/modules/laydate/default/laydate.css" media="all">
    <script type="text/javascript" src="<%= basePath%>css/dist/messages/localization/messages_zh.js"></script>
    <link rel="stylesheet" href="../css/modules/layer/default/layer.css">
    <script type="text/javascript">
        $(function(){
            $(".dfinput1").each(function(){//循环获取所有权限编号
                rightId = $(this).attr("value");
                $(".roleRight").each(function(){//循环获取该角色拥有的权限编号
                    //判断权限表中的权限编号是否与角色拥有的权限编号是否相同
                    if(rightId == $(this).attr("value")){
                        //若相同,则选中
                        $("#rightId_"+rightId).attr("checked",true);
                    }
                });
            });

        });
    </script>
    <script type="text/javascript">
        $(function(){

            $("#commonform").validate({
                errorClass: "errorInfo", //默认为错误的样式类为：error
                focusInvalid: false, //当为false时，验证无效时，没有焦点响应
                onkeyup: false,
                submitHandler: function(form){   //表单提交句柄,为一回调函数，带一个参数：form
                    checkFrom();
                    form.submit();   //提交表单
                },
                rules:{
                    "sysRole.roleId":{
                        required:true
                    },
                    "sysRole.roleName":{
                        required:true,
                        rangelength:[1,20]
                    },
                    "sysRole.roleSortOrder":{
                        required:true,
                        rangelength:[1,4]
                    },
                    "rightId":{
                        required:true
                    }

                },
                messages:{
                    "sysRole.roleId":{
                        required:""
                    },
                    "sysRole.roleName":{
                        required:"必填",
                        rangelength: $.validator.format("最小长度:{0}, 最大长度:{1}。")
                    },
                    "sysRole.roleSortOrder":{
                        required:"必填",
                        rangelength: $.validator.format("最小长度:{0}, 最大长度:{1}。")
                    },
                    "rightId":{
                        required:""
                    }
                }
            });
        });
    </script>
</head>
<body>
<div style="padding:15px">
    <div class="layui-show">
        <div class="layui-card">
            <div class="layui-breadcrumb" lay-filter="breadcrumb" style="visibility: visible;">
                <a lay-href="">主页</a>
                <a><cite>系统管理</cite></a>
                <a><cite>角色管理</cite></a>
            </div>
        </div>
        <form action="<%= basePath%>/role/Role_update.action" method="post" id="commonform">
            <div class="layui-form-item forminfo">
                <label class="layui-form-label">角色编号</label>
                <div class="layui-input-block">
                    <input type="text" name="sysRole.roleId" id="roleId" value="${sysRole.roleId}" userId="${sysRole.roleId}"  class="dfinput"><i><font color="#FF0000">*角色编号不可更改</font></i>
                </div>
            </div>
            <div class="layui-form-item forminfo">
                <label class="layui-form-label">角色名称</label>
                <div class="layui-input-block">
                    <input type="text" name="sysRole.roleName" value="${sysRole.roleName}"  class="dfinput"><i><font color="#FF0000">*必填</font>不能超过20个字符</i><span id="gradeInfo1"></span>
                </div>
            </div>
            <div class="layui-form-item forminfo">
                <label class="layui-form-label">排序序号</label>
                <div class="layui-input-block">
                    <input type="text" name="sysRole.roleSortOrder" value="${sysRole.roleSortOrder}"  class="dfinput"><i><font color="#FF0000">*必填</font></i></li>
                </div>
            </div>
            <div class="layui-form-item forminfo">
                <label class="layui-form-label">权限名称</label>
                <div class="layui-input-block">
                    <s:iterator value="sysRights">
                        <label for="rightId_${rightId}"><input type="checkbox" name="rightId" id="rightId_${rightId}" value="${rightId}">${rightName}</label>
                    </s:iterator>
                </div>
            </div>
            <div class="layui-form-item forminfo" >
                <div class="layui-input-block">
                    <button class="layui-btn" lay-submit lay-filter="formDemo">确认保存</button>
                    <button type="reset" class="layui-btn layui-btn-primary" onclick="location.href='javascript:history.go(-1);'">取消</button>
                </div>
            </div>

        </form>
        <s:iterator value="roleRights">
            <li ><input  name="rightId"  type="hidden" class="roleRight" value="${rightId}" />

            </li>
        </s:iterator>
    </div>
</div>
</body>
</html>
