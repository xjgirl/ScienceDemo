<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/2/14
  Time: 14:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/common/common.jsp"%>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="../css/layui.css" media="all">
    <link rel="stylesheet" href="../css/modules/laydate/default/laydate.css" media="all">
    <link rel="stylesheet" href="../css/modules/layer/default/layer.css">
    <script type="text/javascript" src="<%= basePath%>css/dist/messages/localization/messages_zh.js"></script>
    <script type="text/javascript">
        $(function(){

            //如果是新增成功，会返回1，如果是1，则提示保存成功
            if("1" == "${actionState}"){
                alert('保存成功！');
            }

            $("#commonform").validate({
                errorClass: "errorInfo", //默认为错误的样式类为：error
                focusInvalid: false, //当为false时，验证无效时，没有焦点响应
                onkeyup: false,
                submitHandler: function(form){   //表单提交句柄,为一回调函数，带一个参数：form
                    checkFrom();
                    form.submit();   //提交表单
                },
                rules:{
                    "sysRight.rightName":{
                        required:true,
                        rangelength:[2,20]
                    },
                    "sysRight.rightType":{
                        required:true,
                        digits:true,
                        rangelength:[1,4]
                    },
                    "sysRight.rightSortOrder":{
                        required:true,
                        digits:true,
                        rangelength:[1,4]
                    }
                },
                messages:{
                    "sysRight.rightName":{
                        required:"必填",
                        rangelength:$.validator.format("最小长度:{0}, 最大长度:{1}。")
                    },
                    "sysRight.rightType":{
                        required: "必填",
                        digits:"请输入整数",
                        rangelength:$.validator.format("最小长度:{0}, 最大长度:{1}。")
                    },
                    "sysRight.rightSortOrder":{
                        required: "必填",
                        digits:"请输入整数",
                        rangelength:$.validator.format("最小长度:{0}, 最大长度:{1}。")
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
                <a><cite>用户管理</cite></a>
                <a><cite>table</cite></a>
            </div>
        </div>
        <form action="<%= basePath%>/right/Right_update.action" method="post" id="commonform">
            <div class="layui-form-item forminfo">
                <label class="layui-form-label">权限编号</label>
                <div class="layui-input-block">
                    <input type="text" name="sysRight.rightId" value="${sysRight.rightId}" userId="${sysRight.rightId}"  class="dfinput"><i><font color="#FF0000">*权限编号不可更改</font></i>
                </div>
            </div>
            <div class="layui-form-item forminfo">
                <label class="layui-form-label">权限名称</label>
                <div class="layui-input-block">
                    <input type="text" name="sysRight.rightName" value="${sysRight.rightName}"  class="dfinput"><i><font color="#FF0000">*必填</font>不能超过20个字符</i><span id="gradeInfo1"></span>
                </div>
            </div>
            <div class="layui-form-item forminfo">
                <label class="layui-form-label">资源路径</label>
                <div class="layui-input-block">
                    <input type="text" name="sysRight.resourcePath" value="${sysRight.resourcePath}"  class="dfinput">
                </div>
            </div>
            <div class="layui-form-item forminfo">
                <label class="layui-form-label">权限类别</label>
                <div class="layui-input-block">
                    <input type="text" name="sysRight.rightType" value="${sysRight.rightType}"  class="dfinput"><i><font color="#FF0000">*必填</font>1-4位整数</i></li>
                </div>
            </div>
            <div class="layui-form-item forminfo">
                <label class="layui-form-label">排序序号</label>
                <div class="layui-input-block">
                    <input type="text" name="sysRight.rightSortOrder" value="${sysRight.rightSortOrder}"  class="dfinput"><i><font color="#FF0000">*必填</font>1-4位整数</i></li>
                </div>
            </div>
            <div class="layui-form-item forminfo" >
                <div class="layui-input-block">
                    <button class="layui-btn" lay-submit lay-filter="formDemo">确认保存</button>
                    <button type="reset" class="layui-btn layui-btn-primary" onclick="location.href='javascript:history.go(-1);'">取消</button>
                </div>
            </div>

        </form>
    </div>
</div>
</body>
</html>
